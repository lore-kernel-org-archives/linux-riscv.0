Return-Path: <SRS0=8Hg0=OX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DEBC433FE
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 17:10:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C81761267
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 17:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C81761267
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=x5SK2tQsLJ7b99oZbf0dtKfbbo6OKxttZeNSUIwu6y0=; b=2eWXkZX23OCNyNo7apF6JQzWa1
	0rb7GVmCzkMjnDxTB83i18Wui5vq9S9m3HNHgRiryh2FFwR+5RJvFg91AHgaiDddW637yyvFncCJc
	Fba/2CeqtGkjLvWu6t35RNWOwY3rISs3slH9QorMjQHIiaazZ/7cbCIukgp0b8ZKWc6fJnSjPpGGT
	1VMf/JenR3jL5wynVcHlC2MDo9bwnBU1akAbkITnT5svCRHhsgT2Ls5RX5qgufSoM+c+0EwcHQrpg
	l0lyXeMRN6BXjwhe0HdgWXQbPgwa5iUe8XqTpqfbcMItDB7ESUmaY9Y9H0MzI5rHLeXT/qgCtciyO
	rdsLuQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mX50D-0048f5-MK; Sun, 03 Oct 2021 17:10:17 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mX509-0048e7-JK
 for linux-riscv@lists.infradead.org; Sun, 03 Oct 2021 17:10:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 on12-20020a17090b1d0c00b001997c60aa29so6062097pjb.1
 for <linux-riscv@lists.infradead.org>; Sun, 03 Oct 2021 10:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Ebwf//kDSCRWsaKE4C3R7KVBDklhHZsQtL6HPnfLiEs=;
 b=GVPpTIs8wH2fgMQ0VWyPcncf99M8HLdjqwgr6454UbGZhtowCPpQMug9Nom1w81Wpl
 dqWRAmdGLJNlb/FB2PbcPszJQEw95XgbzhJxVv5rMRjVDagzvn5eFAFTI4zbPiQ1w2qZ
 tMtqm5Rs/yn7T4/Y1Q3zQo06g3tvU+5kcthryQ4ypuxuw2YkehJcs29+bo0rYR8gZ4G7
 peLdlwWBBU5cqKIC8QQGxA/v3buS1ugWfqY2LHkC74U37j/DrIQIFxP1FMwevTK8mIsh
 DBjUMmWFna/+eLV+ZlkK+k7djv9GTAkemrOlrtYKUaPtvlJTBT9ysLCzPSs7oveHRG7V
 cvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Ebwf//kDSCRWsaKE4C3R7KVBDklhHZsQtL6HPnfLiEs=;
 b=GXNcfgfcpiQq7ka+GOzEVGE5xBjgBPTddw1jIHNXOIddWlFQ+x+0ivNyR9hN1xHe52
 C+7xwTS7cVX2ZkCCKNDnp7qHy4T8EeacDoiHgyLJs8ps+KGJhd52vQzLKaAdkommiGG/
 Nv39ulDWTVTrlzAG3g8VoktEwVh81xLE5nOJKgvdG8kdxeLJPqGQswCmA/gqLvw7BA36
 FEySDy6suPYbBEGiITE+pC1KdvWxasBtzDp+jLxUEtnQx55Gb2zn92W2JutkmTnkdkEl
 kwL9DBBiY2xqxRNNj990lYPLaoyTdwwrvMdOHWdsn8vsdozF5Zuv+uwfEfrb1xL38oY1
 KyjQ==
X-Gm-Message-State: AOAM532heWG3ZnfZrO+C5TuMHYfK9NjU/fFy9IpG7oEvxVk+Q4Vh3d+p
 E77u9htbl5iG7YXcqKyWV/pjHAWoVZYcJQ==
X-Google-Smtp-Source: ABdhPJywWTBeDxgOuo5UqA0zlwr4rsIdwHUVVHpjVrZOS42HB2BJdC5PDykZPcKAgb2G7y7mmaUvPQ==
X-Received: by 2002:a17:902:8488:b029:129:97e8:16e7 with SMTP id
 c8-20020a1709028488b029012997e816e7mr19458630plo.39.1633281006908; 
 Sun, 03 Oct 2021 10:10:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 130sm12265255pfz.77.2021.10.03.10.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:10:06 -0700 (PDT)
Date: Sun, 03 Oct 2021 10:10:06 -0700 (PDT)
X-Google-Original-Date: Sat, 02 Oct 2021 17:56:22 PDT (-0700)
Subject: Re: [PATCH] riscv: set default pm_power_off to NULL
In-Reply-To: <20210907002847.111633-1-dimitri.ledkov@canonical.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dimitri.ledkov@canonical.com
Message-ID: <mhng-4f99a87e-9ed6-4d0b-a5b1-596e67198c1a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_101013_714524_A546CFFE 
X-CRM114-Status: GOOD (  19.76  )
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

On Mon, 06 Sep 2021 17:28:47 PDT (-0700), dimitri.ledkov@canonical.com wrote:
> Set pm_power_off to NULL like on all other architectures, check if it
> is set in machine_halt() and machine_power_off() and fallback to
> default_power_off if no other power driver got registered.
>
> This brings riscv architecture inline with all other architectures,
> and allows to reuse exiting power drivers unmodified.
>
> Kernels without legacy SBI v0.1 extensions (CONFIG_RISCV_SBI_V01 is
> not set), do not set pm_power_off to sbi_shutdown(). There is no
> support for SBI v0.3 system reset extension either. This prevents
> using gpio_poweroff on SiFive HiFive Unmatched.
>
> Tested on SiFive HiFive unmatched, with a dtb specifying gpio-poweroff
> node and kernel complied without CONFIG_RISCV_SBI_V01.
>
> BugLink: https://bugs.launchpad.net/bugs/1942806
> Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
> ---
>  arch/riscv/kernel/reset.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index ee5878d968..9c842c4168 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -12,7 +12,7 @@ static void default_power_off(void)
>  		wait_for_interrupt();
>  }
>
> -void (*pm_power_off)(void) = default_power_off;
> +void (*pm_power_off)(void) = NULL;
>  EXPORT_SYMBOL(pm_power_off);
>
>  void machine_restart(char *cmd)
> @@ -23,10 +23,16 @@ void machine_restart(char *cmd)
>
>  void machine_halt(void)
>  {
> -	pm_power_off();
> +	if (pm_power_off != NULL)
> +		pm_power_off();
> +	else
> +		default_power_off();
>  }
>
>  void machine_power_off(void)
>  {
> -	pm_power_off();
> +	if (pm_power_off != NULL)
> +		pm_power_off();
> +	else
> +		default_power_off();
>  }

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
