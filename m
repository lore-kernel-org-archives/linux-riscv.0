Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F34C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8rYtllKIe90tZz/vxP32wwWn/ydOxdFDOgGiORYUpY=; b=xfyAzhVEg94TFJ
	JHwpi3d4/26djrUhMiFdI/hoXA9mkH4SVokHNlVed2s6IesS9MkekdFNMebJi9ZMNh8Ytk6cvioyT
	82s1i3XwjbPwxXcfz7R/tNtJfUVl48Uzphhmp63uUfQFkFdfWLI8IarfMhFEwcMJiPtvdgIesstyZ
	XgcO0ggIEIK+Yx/Xucxe+zib1CmdBwxv2o1L/0iv8k/gxjw8hV1Gc98Cchw41q/8N2lxyBbs47bY+
	ugO90zbx4fMm9xm5nrNkvGaVgG2SgX7FC60paTBxeYZvWXfqfhK6O87BUSNgKkphw7kXnXT6fvRGI
	+qa5nfX8o+cTrCr7sSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYu3-002kbC-5W; Fri, 24 Feb 2023 14:18:27 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYu0-002kZU-5e
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 14:18:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id j3so9538153wms.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 06:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/58nB9t3waDkTmYdfZyt7DVmfHN/NHbQ8/5a51KIQY0=;
        b=kDR1zg1pcUmHaJMtJvAGwGKh7e0gA2UqcmlXjYaoWE2mSWRDCMdwKOs05RRLxgne69
         GIHfqAiDDfIrm9qWJbgf6asAUlSL76h1QQTe5bo8gAd2nPZgIwQ6k0O0JQ1uF0AL4s/f
         s/q87Wl86BoGMf+Cc8mWRlLuRN2AEK5TXkZIqiWvey/sq5YzjXqO77dEBhiydo0FDCUr
         QpAWPP3JV4oAHeZv5E5DqoHMAkomTeMltxY7jW3iWYzHmtMIxuOWwXlrVmkjWAIGS+Gi
         QdJyr6zcx9f23NZ3Xu58HqkISUFOddBojLE1svWlaL8PH1QTd3zLy4EOMci+giaSvmQv
         EGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/58nB9t3waDkTmYdfZyt7DVmfHN/NHbQ8/5a51KIQY0=;
        b=uTI2YSeYwEz8qtQYU5tkH//vOcHnCMlIDt0sr54t/G3F0qCdLdLWp7f6tqdTdjIsAU
         Ps5TFkkzFKDOd5vl8tsLkuOaNg421xCR3ZI379kob8fhwRrpPzX+/j/gsm/UqMOdfDYF
         wUJk0wF4SXmIxP3VxQH1RnUUyH821z86Eym2OSsE0aWp9AowiWye0QPrE4iwbyykRbSf
         ZSDC5AFdVdW+GNBbLeGSN+CANAkC3dvuVsGDIQ4LC0y1VPCdbTSgAOyWhNxG0wvSeIck
         TGU9/vTmRpSEJwRlUaFU3U831gwPZPzKlM7GqroKT+vcciZIaEgJ0NdEpBZdB7SVF5YY
         i+DQ==
X-Gm-Message-State: AO0yUKUsltsXTBkQtf8mi/Rp3A6EqhHtYaDnmEuxef40AQAY2mx1Ql9q
	WPVgmEEwwKKsKxEDhyQda4UQhyTiOBxwpcMB
X-Google-Smtp-Source: AK7set/6HF/QSSVuFV3xsoM31LR9s5wdwvOnNNkAi51Ypvbdgcjb51/qiUHnjkwQpnqr9cJj43BgXQ==
X-Received: by 2002:a05:600c:1da2:b0:3ea:ed4d:38fc with SMTP id p34-20020a05600c1da200b003eaed4d38fcmr2862287wms.31.1677248293915;
        Fri, 24 Feb 2023 06:18:13 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id hn29-20020a05600ca39d00b003e21f01c426sm3132732wmb.9.2023.02.24.06.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 06:18:13 -0800 (PST)
Date: Fri, 24 Feb 2023 15:18:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Subject: Re: [PATCH] RISC-V: Fixup clear_page export when using  Zicboz
Message-ID: <20230224141812.nftdkbtt4gbgvnts@orel>
References: <20230221190916.572454-7-ajones@ventanamicro.com>
 <20230224135844.619054-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230224135844.619054-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_061824_258767_1A83F294 
X-CRM114-Status: GOOD (  20.55  )
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

On Fri, Feb 24, 2023 at 01:58:44PM +0000, Ben Dooks wrote:
> When the clear_page() via Zicboz is enabled, the module build
> fails as clear_page() is not marked as a ksym entry. Fix this
> by changing the asm code to use <asm-generic/export.h> to add
> the correct export.
> 
> Also remove the weak clear_page() as there's nothing else in
> the build defining this symbol, so just make it the entry when
> the Zicboz is enabled.
> 
> Fixes modpost errors such as this:
> ERROR: modpost: "clear_page" [drivers/gpu/drm/ttm/ttm.ko] undefined!
> 
> Reported-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/lib/clear_page.S | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> index 7c7fa45b5ab5..4ed5fef52d80 100644
> --- a/arch/riscv/lib/clear_page.S
> +++ b/arch/riscv/lib/clear_page.S
> @@ -6,6 +6,7 @@
>  #include <linux/linkage.h>
>  #include <asm/asm.h>
>  #include <asm/alternative-macros.h>
> +#include <asm-generic/export.h>
>  #include <asm/hwcap.h>
>  #include <asm/insn-def.h>
>  #include <asm/page.h>
> @@ -17,7 +18,7 @@
>  
>  /* void clear_page(void *page) */
>  ENTRY(__clear_page)
> -WEAK(clear_page)
> +SYM_FUNC_START(clear_page)
>  	li	a2, PAGE_SIZE
>  
>  	/*
> @@ -70,4 +71,5 @@ WEAK(clear_page)
>  .Lno_zicboz:
>  	li	a1, 0
>  	tail	__memset
> -END(__clear_page)
> +SYM_FUNC_END(clear_page)
> +EXPORT_SYMBOL(clear_page)
> -- 
> 2.39.1
>

Hi Ben,

This looks good to me. I agree that I shouldn't have made clear_page weak,
but not because there isn't currently anything else defining it, but
because it's not something a subsystem is likely to ever define. Exporting
for modules is also definitely needed.

Is there any reason I shouldn't just squash this into the patch which
introduces clear_page? That patch is still under review, and merging
it broken just to immediately fix it would break bisection for no reason.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
