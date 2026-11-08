Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C7606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 10:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uUOtolms;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LrMBuAH+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=apS6sPBIRYe9kNh8NFoL3kWWUiZ0Q35ADKrxwkLmB3g=; b=uUOtolmsZYsmo4h2KyGzq3+Bev
	EMhm2oWczMuwHWiLq4OE55e5voYn3Yse8pAdAA14A5aLBPjpN60ETps0BSj8LdsRcegRD/iLgFtjE
	MN7WGgcR2QpO7qTz0C8Ou1bS6CIJ/R1Jv5b7IYJQQfE/XfxvrywuapL0tGWniXuur8R07xnhWcs6I
	HfTpoXZvJqIreUij8rfZmT0PwzN90D2IXQvL4tynf6apJ3IrRv3BBCwGhShGCKs8kTw0HvccxOVmH
	dxYAcghuMVY6LqvLt7HGkQl68AioCUr5IqQtfBb7FVMlhtzc5q86I9MYtiUDdpcCEw5zrZzOzKCfx
	5YCAEenw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0CF-0000000Fyak-1Pba;
	Sun, 08 Nov 2026 10:32:23 +0000
Received: from out-153.mta1.migadu.com ([95.215.58.153] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0CA-0000000FyZJ-3sb3
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 10:32:21 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gs3bePMcYIKXqQVyDCBCOpVEhgvYU3mf5TBjeYoVOkU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794133934; v=1; x=1794738734;
 b=LrMBuAH+ZCVfir+2Ii0t+v8+EZ6WGhY/eFS0MYOYIgGO5QpaWdG3it23H9LBlJFPdADyLjvq
 Ca2RqzLX8hKg01/B3n9xrR58v0gmsmGTO36wH6DZHje4/cKsy6c74ZW1Tjnm7nEo5FG3Ztj4OIA
 4Ydaq6ZeWwZ0z6F27HByt2kk=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f230e04c3a206445;
	Sun, 08 Nov 2026 10:32:14 +0000
X-Mizu-Trace-ID: f230e04c3a206445
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Sun, 08 Nov 2026 18:32:07 +0800
Message-Id: <DMPREBS6GFIY.1NHDQRMP9OUKQ@linux.dev>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH RESEND v5 3/3] riscv: word-at-a-time: improve
 find_zero() for Zbb
From: "Ze Huang" <huang.ze@linux.dev>
To: "Jisheng Zhang" <jszhang@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.22.0.r39.g5d778487
References: <20261107134613.17830-1-jszhang@kernel.org>
 <20261107134613.17830-4-jszhang@kernel.org>
In-Reply-To: <20261107134613.17830-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_023219_099825_3D777B8C 
X-CRM114-Status: GOOD (  24.77  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat Nov 7, 2026 at 9:46 PM CST, Jisheng Zhang wrote:
> In commit f915a3e5b018 ("arm64: word-at-a-time: improve byte count
> calculations for LE"), Linus improved the find_zero() for arm64 LE.
> Do the same optimization as he did: "do __ffs() on the intermediate value
> that found whether there is a zero byte, before we've actually computed
> the final byte mask.", so that we share the similar improvements:
>
> "The difference between the old and the new implementation is that
> "count_zero()" ends up scheduling better because it is being done on a
> value that is available earlier (before the final mask).
>
> But more importantly, it can be implemented without the insane semantics
> of the standard bit finding helpers that have the off-by-one issue and
> have to special-case the zero mask situation."
>
> Before the patch:
> 0000000000000000 <find_zero>:
>    0:	c909                	beqz	a0,12 <.L1>
>    2:	60051793          	clz	a5,a0
>    6:	03f00513          	li	a0,63
>    a:	8d1d                	sub	a0,a0,a5
>    c:	2505                	addiw	a0,a0,1
>    e:	4035551b          	sraiw	a0,a0,0x3
>
> 0000000000000012 <.L1>:
>   12:	8082                	ret
>
> After the patch:
>
> 0000000000000000 <find_zero>:
>    0:	60151513          	ctz	a0,a0
>    4:	810d                	srli	a0,a0,0x3
>    6:	8082                	ret
>
> 7 instructions vs 3 instructions!
>
> As can be seen, on RV64 w/ Zbb, the new "find_zero()" ends up just
> "ctz" plus the shift right that then ends up being subsumed by the
> "add to final length".
>
> But I have no HW platform which supports Zbb, so I can't get the
> performance improvement numbers by the last patch, only built and
> tested the patch on QEMU.

Hi,

I tested patch 3 on a SpacemiT K3 board (rv64imafdcvbvh, Zbb).

Against patch 1+2, the has_zero -> prep -> create_zero_mask -> find_zero chain
takes 45% less time: 3.74 ns -> 2.05 ns per call (-1.69 ns). Both versions are
built into the same image and measured alternately within one boot (6 cold
boots).

Note that this is a per-call figure, not a workload one: find_zero() runs once
per string operation, which takes less than 1% time of an openat() here.

Method and raw data:
https://gist.github.com/Sutter099/1c51abdb192eeedbf051ae582a1e8145#file-fzbench-md

Tested-by: Ze Huang <huang.ze@linux.dev>

>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/word-at-a-time.h | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
> index f2d16c1eea8d..31240133eccd 100644
> --- a/arch/riscv/include/asm/word-at-a-time.h
> +++ b/arch/riscv/include/asm/word-at-a-time.h
> @@ -35,6 +35,10 @@ static inline unsigned long prep_zero_mask(unsigned long val,
>  
>  static inline unsigned long create_zero_mask(unsigned long bits)
>  {
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
> +	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
> +		return bits;
> +
>  	bits = (bits - 1) & ~bits;
>  	return bits >> 7;
>  }
> @@ -67,13 +71,21 @@ static inline unsigned long find_zero(unsigned long mask)
>  {
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
>  	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
> -		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
> +		return __ffs(mask) >> 3;
>  
>  	return count_masked_bytes(mask);
>  }
>  
> -/* The mask we created is directly usable as a bytemask */
> -#define zero_bytemask(mask) (mask)
> +static inline unsigned long zero_bytemask(unsigned long bits)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
> +	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
> +		bits = (bits - 1) & ~bits;
> +		return bits >> 7;
> +	}
> +
> +	return bits;
> +}
>  
>  #ifdef CONFIG_DCACHE_WORD_ACCESS
>  



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
