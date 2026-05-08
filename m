Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4955CD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 18:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YXNa6xINU9aMnyWnDBtEHppY1F8IW5Qge0VV3UZHvA=; b=I/mopWY/ON9RYF
	yzs7NwcEsuhfyurs3Pbklqs0V3e9C9UYqxwIfYRRYe+CXxTxS8+vHcRKaJlP7HOT5vnxdlu+gF9MR
	ejEwXYMUGGChjAOij1psNmiyf8S8HvyI9g2AguTDjR9PkqEFxccDvT8p+60gs+jYe0o23J+gPaB1v
	NX1W1DD0dkaqWOOS7e6wOVR8tipU4AQ8UK6I3icyTezcjZH52HRjOptVtqDzsHjqxEEjwuCR/UlkK
	clXqnaf7iS//JOipharMElgWoP5npKG9PWrEFtpub5G15Z+xzu02pk+xLWGaShYQhG3MJOpKjrxoK
	6QsoAiEQ64U9rkH4aOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQ8s-00000007HP8-0pia;
	Fri, 08 May 2026 18:41:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQ8q-00000007HOC-0Arx
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 18:41:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 781EB4431B;
	Fri,  8 May 2026 18:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AE5C2BCB0;
	Fri,  8 May 2026 18:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778265699;
	bh=zWGYuuD6D0rII7IevVsdnkUt1rJLodo8g4uWZrT0jV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpBJwe88fKjZkP3TU9zS/pKJE+T6DTkIh2ftBlF+z6BtzVZQDmvLU4LkZmt5umZgH
	 A0tAUXYcMx67xGUnIsUMHLJYK2Bi6MyW+IJzMtSVsC85OiCfjq5K6Q89LzxqIYU8Fg
	 wX96cKIJYj+ATwzrGP5qpcXptoei/QoccVaarQHdpG8b5k/JpWW3E+qN48nM1jcTTK
	 q/cPGyoAx4RPkpX6soj+1hLbU/adHhWEGfu4kn93CSIM/qwA3jTTYdVxXPCL9nbidJ
	 AnyYYN76kdDqi6rs1C3sLNtgaYNHUUdcQn3hcwrIlrHMku4yTBX3NjbT24ihcTIiHo
	 GeOW3Uj8IoUKQ==
Date: Fri, 8 May 2026 18:41:37 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] riscv/purgatory: return bool from
 verify_sha256_digest
Message-ID: <20260508184137.GC4145640@google.com>
References: <20260508143544.2484-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508143544.2484-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_114140_107971_FAAD89E3 
X-CRM114-Status: GOOD (  16.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 08, 2026 at 04:35:44PM +0200, Thorsten Blum wrote:
> Change the function's return type from int to bool and return the result
> of memcmp() directly to simplify the code.  While at it, cast ->start to
> 'const u8 *' to better match the expected type.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/riscv/purgatory/purgatory.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/purgatory/purgatory.c b/arch/riscv/purgatory/purgatory.c
> index bbd5cfa4d741..15c72dafa3d8 100644
> --- a/arch/riscv/purgatory/purgatory.c
> +++ b/arch/riscv/purgatory/purgatory.c
> @@ -17,7 +17,7 @@ u8 purgatory_sha256_digest[SHA256_DIGEST_SIZE] __section(".kexec-purgatory");
>  
>  struct kexec_sha_region purgatory_sha_regions[KEXEC_SEGMENT_MAX] __section(".kexec-purgatory");
>  
> -static int verify_sha256_digest(void)
> +static bool verify_sha256_digest(void)
>  {
>  	struct kexec_sha_region *ptr, *end;
>  	struct sha256_ctx sctx;
> @@ -26,11 +26,10 @@ static int verify_sha256_digest(void)
>  	sha256_init(&sctx);
>  	end = purgatory_sha_regions + ARRAY_SIZE(purgatory_sha_regions);
>  	for (ptr = purgatory_sha_regions; ptr < end; ptr++)
> -		sha256_update(&sctx, (uint8_t *)(ptr->start), ptr->len);
> +		sha256_update(&sctx, (const u8 *)(ptr->start), ptr->len);
>  	sha256_final(&sctx, digest);
> -	if (memcmp(digest, purgatory_sha256_digest, sizeof(digest)) != 0)
> -		return 1;
> -	return 0;
> +
> +	return memcmp(digest, purgatory_sha256_digest, sizeof(digest));
>  }

So true on failure and false on success?  Might make sense to flip that.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
