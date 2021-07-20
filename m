Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D584C07E9B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 15:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B940561029
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 15:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B940561029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=75XT5z5YY8Ojd3b0or//Iagg1C8/1CX9N+NX5rq1xFI=; b=y4vQof+wajpjs5FyIMSxU3Aqxw
	UFO7k4+nPrOaAzWkK1c099MA+XQgD5sqBJ3+AXiy+gnyQhp+1HR19gInfE44yBwK3aHjQd+g7UziS
	qt1ZaRmb+/3F3o74Ky1dRMwDMK4Tc4P74exuFlpkbJ9M2YtowWYu5s/KAnpx7ug/pMr6isdq4FjmN
	QH+gr5gzgj2OtJsR3M9ImVDIEAvnivcpWcabF5s1IVhyM9dTNWqglzot1hSO66kv3Cr9mo2taTDFZ
	tCoE/W/bxdSmOo6mNQK4R8Y3iRhXGKODSYtGdVfjpx2ibBg9OGZN0FmuvLQAR0B6H0/BpGm5N1QhT
	+g0gy32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5ruO-00DSeu-Lp; Tue, 20 Jul 2021 15:43:48 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5ruM-00DSdU-7j
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 15:43:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id a127so19890876pfa.10
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pdh068ptiINg7vYsNON6+uw4KqAOssVbDMcwvukOGd0=;
 b=dpe3XWqRXAgtIdDhfs39lSEhRtVR0xEzpdUzBAQqbnUbtk19yaGCwYaYYPltQcIhaA
 WglRCqfVMuxfAI0AdKQeV45lkBvTHMiRUKOgjbca0BIWZkeQaCZ3uEn6yvotq6gP/XUL
 9ODIV7iymwfcJrCvfuJiLLu6Q4xzQEVATdFRYO3GyWm4REbYYHOsOMBQqrvIR+tWGmEA
 76vMqkk3IT48ZKlvOGfAYLNSKI+IEfwPTimCwG9xZSjh76iVONtsRdWg8tagak9hxFVT
 RxE8iIgabG5Y+MfvGU/fANMRupaTYx2BbKiJvYj58kGG7idGGRJdUi7Y2qLOd46xi5tM
 vcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pdh068ptiINg7vYsNON6+uw4KqAOssVbDMcwvukOGd0=;
 b=IIAP7L1dphDRQ3aBDCQEoJCvJJdb+SvcfWg1BZ0YXuyBGBG1EBt2OV9sg9iw3L43HG
 uyTYUvkD7oMJANJx8t3udrGk6VjAu0o8tuQu5xocePUMtvLH8SFH1KFYV6QwENCT1EHL
 0YFBPuxDj7T0cLUk4kz9Q3jK+cdpMqTmjCnFkL1m2pMkoHi1O/pD+NROpfXcFO5eB0Xd
 XoQzOduapG4odDwH8wAY6OIa1aa+GD9qjkjC/zc7pZemUZrktvA8+0Za4HkX3i83X4JG
 lY3J0NtnKjhECLpaM/Jp/n1/CzK61i1pYS54m5HJDqpaJNlhJtSA/UHegjLbP7+c4xz8
 sH5A==
X-Gm-Message-State: AOAM533MbcsZKm9YNdKQUt1GYd5bgrLz4CPpW2JeHYhJuKm45z6ZSSfj
 YNtM/rIcv+BsYUwQIMmotEKN1Q==
X-Google-Smtp-Source: ABdhPJwpGFV02DMIWb+tUmJStYOn7WgezVWEgx5CxO0+ooG8jBYIGIW/L25sLQ9lISd1D9b0VLjeYQ==
X-Received: by 2002:aa7:9ae4:0:b029:32e:b1:78e8 with SMTP id
 y4-20020aa79ae40000b029032e00b178e8mr31996254pfp.46.1626795824423; 
 Tue, 20 Jul 2021 08:43:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b7sm23833755pfl.195.2021.07.20.08.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:43:43 -0700 (PDT)
Date: Tue, 20 Jul 2021 08:43:43 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jul 2021 08:43:39 PDT (-0700)
Subject: Re: [PATCH v4 06/10] riscv: Remove non-standard linux,
 elfcorehdr handling
In-Reply-To: <170e7daa55aced148b8e57827f7c8fc65a0a8c7a.1626266516.git.geert+renesas@glider.be>
CC: robh+dt@kernel.org, linux@armlinux.org.uk, nico@fluxnic.net,
 ardb@kernel.org, 
 linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
 mick@ics.forth.gr, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 frowand.list@gmail.com, dyoung@redhat.com, 
 rppt@kernel.org, bhe@redhat.com, vgoyal@redhat.com, akpm@linux-foundation.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, geert+renesas@glider.be
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert+renesas@glider.be
Message-ID: <mhng-8deebbc6-f8aa-40e3-9e00-e99f12eaac92@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_084346_367986_E722BD97 
X-CRM114-Status: GOOD (  24.25  )
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

On Wed, 14 Jul 2021 05:50:16 PDT (-0700), geert+renesas@glider.be wrote:
> RISC-V uses platform-specific code to locate the elf core header in
> memory.  However, this does not conform to the standard
> "linux,elfcorehdr" DT bindings, as it relies on a reserved memory node
> with the "linux,elfcorehdr" compatible value, instead of on a
> "linux,elfcorehdr" property under the "/chosen" node.
>
> The non-compliant code can just be removed, as the standard behavior is
> already implemented by platform-agnostic handling in the FDT core code.
>
> Fixes: 5640975003d0234d ("RISC-V: Add crash kernel support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - No changes.
> ---
>  arch/riscv/mm/init.c | 20 --------------------
>  1 file changed, 20 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 269fc648ef3d84b2..4aa4b6a034086df6 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -829,26 +829,6 @@ static void __init reserve_crashkernel(void)
>  }
>  #endif /* CONFIG_KEXEC_CORE */
>
> -#ifdef CONFIG_CRASH_DUMP
> -/*
> - * We keep track of the ELF core header of the crashed
> - * kernel with a reserved-memory region with compatible
> - * string "linux,elfcorehdr". Here we register a callback
> - * to populate elfcorehdr_addr/size when this region is
> - * present. Note that this region will be marked as
> - * reserved once we call early_init_fdt_scan_reserved_mem()
> - * later on.
> - */
> -static int __init elfcore_hdr_setup(struct reserved_mem *rmem)
> -{
> -	elfcorehdr_addr = rmem->base;
> -	elfcorehdr_size = rmem->size;
> -	return 0;
> -}
> -
> -RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
> -#endif
> -
>  void __init paging_init(void)
>  {
>  	setup_bootmem();

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

LMK if you wanted me to take this series, otherwise I'm going to assume 
it's going in via some other tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
