Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ABD606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 06:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0cRBJT+Z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vkjl4cTA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dUY6JndDukg7iSl8+Fkm5wjb7Og/Ukiju8X+RVAcyqY=; b=0cRBJT+ZA1Pqw1YGwCuNz6tBzy
	k/SNGdpAHV6UKBD0GHUSlT9S09hDzvxx220cfliwFWrHp4qK6MzGwYHX25D5/SaHAOVxk6MW/K0kp
	hjttxIJzi3osIVsNoxy2FTQPEbkXJYod4SGbzMBrWUWWZkTNNSUMtoNR56050foJQbIhuiXfM2NK2
	O20z/UmshNXft5VwGr6qbwltYYNn09utwWu1rmRr6L2Z4b1lb/cEEEMtZ8R2WMfYr/ZcwWXk3xmbG
	eSXi9xSENHXIraWSfwKmpZFjYZUf1fqKaYmHSC81wps2pKI1CE8ACQSHdBeGUpg1ckhfcFTF6dmZS
	61zJW5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNm2-00000002OCp-2VXK;
	Mon, 23 Nov 2026 06:43:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNly-00000002OCV-1chd
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 06:43:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB88F43D88;
	Mon, 23 Nov 2026 06:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04C41F000C0;
	Mon, 23 Nov 2026 06:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795416209;
	bh=uy0WlflLH6QHFv/yWoP0KCCQBEY8SNVxzM9gBNFu+LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vkjl4cTAk8rbkGm5XRTHyhixfdopm/CLaFrX4UH9DlL9sg3SgxNujn7Z/SB2QHYiR
	 dkMfrJd8xS51XdYPS8/iXQXCMCbkhQmNZ7sFXL6iv+oZmYFGCeO88cgTwXjzM3PmLX
	 nZK4i/Ga4KkK5Z9XhyAubienMoXmD4hcceg7fyOmcDECufArxkwvUo3DQVdgbrOvg2
	 T4IG8+m+hXOBs12NES8DOllVCWdKPJQVCBRleqe2ndVXs/5ECD5cWhZ9W5oZHCTZUb
	 V14b0s+AiTT/QhUKO9vWLvPPFwdYM4IlFRPXanzd7WKZO1W65LEEUKwSRywFCnjmS9
	 G8J1rqD4+K1sA==
Date: Sun, 22 Nov 2026 22:43:27 -0800
From: Drew Fustini <fustini@kernel.org>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, arnd@arndb.de,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Leonardo Bras <leobras@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>, Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <me@ziyao.cc>, Chen Wang <unicorn_wang@outlook.com>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH V6] riscv: errata: Add ERRATA WRITE_ONCE fixup
Message-ID: <awPgjwuswbjeDftg@thelio>
References: <20261120012712.1957564-1-guoren@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120012712.1957564-1-guoren@kernel.org>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 08:27:12PM -0500, guoren@kernel.org wrote:
> From: "GUO Ren (XuanTie)" <guoren@kernel.org>
> 
> The early version of XuanTie C910 core has a store merge buffer
> delay problem. The store merge buffer could improve the store queue
> performance by merging multi-store requests, but when there are not
> continued store requests, the prior single store request would be
> waiting in the store queue for a long time. That would cause
> significant problems for communication between multi-cores. This
> problem was found on sg2042 platform with the qspinlock lock torture
> test.
> 
> So appending a fence w.o could immediately flush the store merge
> buffer and let other cores see the write result.
> 
> This will apply the WRITE_ONCE errata to handle the non-standard
> behavior via appending a fence w.o instruction for WRITE_ONCE().
> 
> This problem is only observed on the sg2042 hardware platform by
> running the lock_torture test program for half an hour. The problem
> was not found in the user space application, because interrupt can
> break the livelock.
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Yao Zi <me@ziyao.cc>
> Cc: Chen Wang <unicorn_wang@outlook.com>
> Cc: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
[..]
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 6f1c683f0ec0..64683882d50b 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -168,6 +168,23 @@ static bool errata_probe_ghostwrite(unsigned int stage,
>  	return true;
>  }
>  
> +static bool errata_probe_write_once(unsigned int stage,
> +				    unsigned long arch_id, unsigned long impid)
> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_WRITE_ONCE))
> +		return false;
> +
> +	/* target-c9xx cores report arch_id and impid as 0 */
> +	if (arch_id != 0 || impid != 0)
> +		return false;

Doesn't this match more SoCs than just the SG2042 and TH1520 like the
commit message mentions?

[..]

> +#if defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) && !defined(NO_ALTERNATIVE)
> +
> +#define write_once_fence()				\
> +do {							\
> +	asm volatile(ALTERNATIVE(			\
> +		"nop",					\
> +		"fence w, o",				\

I tried this on v7.4-rc3 in qemu with -cpu thead-c906 which matches this
errata, and I discovered boot fails when CONFIG_DEBUG_VIRTUAL=y.

  kernel BUG at mm/vmalloc.c:879!
  epc : vmalloc_to_page+0x212/0x260
   ra : patch_insn_write+0x1a2/0x414
  [...]
  [<ffffffff8026ba1a>] vmalloc_to_page+0x212/0x260
  [<ffffffff8000fa76>] patch_insn_write+0x1a2/0x414
  [<ffffffff8000fcf6>] patch_text_nosync+0xe/0x22
  [<ffffffff8001b886>] thead_errata_patch_func+0xac/0x144
  [<ffffffff80009548>] _apply_alternatives+0x76/0x96
  [<ffffffff80e038a4>] apply_boot_alternatives+0x48/0x54
  [<ffffffff80e04d4a>] setup_arch+0x92/0xe8

The vdso getrandom code uses WRITE_ONCE(), so it now has entries in
.alternative. patch_map() ends up calling vmalloc_to_page() on an
address in the vdso and triggers VIRTUAL_BUG_ON().

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
