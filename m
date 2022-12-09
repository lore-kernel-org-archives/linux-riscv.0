Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22B7C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 19:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gCeQqvsMJNr1+eP0GulOxNWq0bFVauaHChmkqsdbjLY=; b=d2yK45DYydB9f6INEtRwSVrVUi
	OLws4mMElmd0h8KH2oHYOBJra6IjlalUpnsaKUz9y6TQgAv7h5WX1WWLsKEhJGyZqiMK9dbrMrjA7
	OQ3gb6nPl185aiCVhkFUrC98dVd78GLQuZT21Q9ToNDkOQlfNfA31bbERXT6FIsfnhkWcPVyanKRe
	zT3qtuNb6jl3O/iq1ti2fOs7LzsxWCiCrUdBr+2ejE6kbLmwl4wx6VFXcJryGLuePU0ssutFaVPuw
	yaaqke6qNzHJw5Z1C5ILe6S04aCGe3aOgYzp5vT7reX9b4CaGkT027JKH5F4E5sZabE1EenDxEwPa
	0ZDnZYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ic4-00AXY1-S3; Fri, 09 Dec 2022 19:00:48 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ic1-00AXUz-G6
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 19:00:47 +0000
Received: by mail-pj1-x102f.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so9067656pje.5
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 11:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMg099aQi7hLBEF3SgKTmpf8TrbpvWLiZ1q8A/xUZ+k=;
        b=VEDqSAkUYqie+fqRJ0O8HFwVPKR3WzYd6TEU4gjJVX+IRgpxueeqMSmJ1z5tRoY4iA
         2AnfmJLAxoEPGgqZnX+Y3pztxeB57d0HdL6OkuR9q9R8xt1Rx0iD9YAVyctwfZFMvvm6
         IqHdZWtTBU8Jg1NjbHL8KrD915cC5J7I+R6/DIsu27PUVx4fONC+WgxN8H7x5fu9mWVv
         1i+kxRKq3Y/V7nXppoZZncMA3oo8py+6fpIODZ0pc2UKgpcqQpDWKLe67F3c7xw1fnkC
         rUgLuwFndLzy1lw7l2HZI9qWCJxG5AalkByo4fD51eAUVA5Nx68+PeLvHlmefTcujc3g
         MGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMg099aQi7hLBEF3SgKTmpf8TrbpvWLiZ1q8A/xUZ+k=;
        b=EKrSRbZqWvg0OVbDNfq05K0JqXWJJDN9qmwM52FYnrYJWrUGgtOAb6rShBJnoQE1UX
         3630whBQQKWPKr+Bnj+e1n2Vb0r6qQ79DgLUjutswyEz5bZUnn6zkRCPVYMbnoH/1+90
         BFPo1uoVxKgFdJQ8HCnMXqm6Yse3aJm0qHsavYkLs5DGXDnriNBRCjeCdOBEFEIm2BGk
         +iYZBsRRDmB0MXWNqanF3GeFnaqPDgf6eao4xNkXXl1Xlc7RcjtwTjpGa1SJcvhiEyvO
         KbptKsngJleLVKGSZ6klyz4iVmKLpx4wD4malbR/r1vCIBj/Arsgz9zoey4sF2wG6vA3
         705w==
X-Gm-Message-State: ANoB5pkR9RFUllppiRQdSBRGTlUDjimboSVl/KzWtmqnBTvLXfmMedMs
	/ele1qjt6PSqr/JhYGE7st4GvstV6tLarNdvtsc=
X-Google-Smtp-Source: AA0mqf4CthZGlj5S8zGFaLR5e0xvxqBCEbDOVBDQE75T02ovAOL8VgehG1FBct07Ujk6DCXQa8owaA==
X-Received: by 2002:a17:90a:d381:b0:21d:203f:a316 with SMTP id q1-20020a17090ad38100b0021d203fa316mr5105488pju.47.1670612441723;
        Fri, 09 Dec 2022 11:00:41 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090a2f8f00b00213d28a6dedsm1537064pjd.13.2022.12.09.11.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 11:00:40 -0800 (PST)
Date: Fri, 09 Dec 2022 11:00:40 -0800 (PST)
X-Google-Original-Date: Fri, 09 Dec 2022 11:00:36 PST (-0800)
Subject: Re: [PATCH 1/2] riscv: Fix crash during early errata patching
In-Reply-To: <20220922054743.30159-1-samuel@sholland.org>
CC: linux-riscv@lists.infradead.org, samuel@sholland.org, aou@eecs.berkeley.edu,
  guoren@kernel.org, heiko@sntech.de, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel@sholland.org
Message-ID: <mhng-38138b26-2922-4228-8a61-6d30afb2335c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_110045_747231_3AD055C6 
X-CRM114-Status: GOOD (  18.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 21 Sep 2022 22:47:41 PDT (-0700), samuel@sholland.org wrote:
> The patch function for the T-Head PBMT errata calls __pa_symbol() before
> relocation. This crashes when CONFIG_DEBUG_VIRTUAL is enabled, because
> __pa_symbol() forwards to __phys_addr_symbol(), and __phys_addr_symbol()
> checks against the absolute kernel start/end address.
>
> Fix this by directly using the underlying kernel_mapping_va_to_pa().
>
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>  arch/riscv/errata/thead/errata.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 202c83f677b2..83174f13783e 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -76,8 +76,9 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
>  		if (cpu_req_errata & tmp) {
>  			/* On vm-alternatives, the mmu isn't running yet */
>  			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> -				memcpy((void *)__pa_symbol(alt->old_ptr),
> -				       (void *)__pa_symbol(alt->alt_ptr), alt->alt_len);
> +				memcpy((void *)kernel_mapping_va_to_pa((unsigned long)alt->old_ptr),
> +				       (void *)kernel_mapping_va_to_pa((unsigned long)alt->alt_ptr),
> +				       alt->alt_len);
>  			else
>  				patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
>  		}

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
