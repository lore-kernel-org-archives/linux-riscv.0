Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF49C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=h5+By8ISXhaHngPPFHetBoy5bl1hy5PTovZhcOk9lrw=; b=zExcxnfpT2fRKE48Y1K9GixMe8
	3MuggAg42M43aCfE0C+T91AYfflJ3Smw/KgDC8rpTvA/GxYq2Ri4SPUj9wYhTXjKcDh5wAVJmywl2
	mvPVURnfOdZrgg34ZnTUEqieGR/ic7cXDa6LYA7cio3iio8G2SCwSY3d8YLzqGG7FVKgjveo5tYsX
	a6W9O5Sk8Rh9ko5tNXu/GSBsgo7kNS8gH9/lz3+bc+4t1afm1n6l+SqLMa7aGmfIBfuUMvjPQEaWn
	yUc5xazvOjWm9G7gh3oLDU+vkkAIlcb5r/xZsf2Pq1CbIfZeuJn7cSONDJ9PNXzqLcjXlwA1to+Vy
	NNgZRuVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAalY-00CU30-Q8; Thu, 20 Jan 2022 16:58:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAalV-00CU1L-16
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 16:58:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d1so5645452plh.10
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 08:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=IlE4PKTqOpwGLmeHcvM3V2OxUD4byfa5I1kusdpu4LM=;
 b=BoOlO916FeueTACmIVZG6Di6cPnwL0MibCyttpptZBXLlTNcE/yoZ13RFqGVg6HZir
 awMcBlC9bJCCRwuRDsKkkqxpiNxUfmm6a4Px9DYt+aURU+4IQ6rhBvKWPsTnemgONUKC
 fUs1oHDRk5dl73ycxB9NtWBLN05sHvUPIRMLy40L2hDj2qXwIyrvJ1sIQ4Ay4S2L2cEE
 RdecNvZycqTmGJuAR//yjleMUGGnZSGkBu5dw/j+zzFgBlWdV7vFJh7WDYX5DU8zfpu7
 nCr+tjJKOf5xppKqyKLv/sA1f5stBkdvz3tyhi0Vztl2ijC0/1W2C99zIxL0f12RsniN
 FwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IlE4PKTqOpwGLmeHcvM3V2OxUD4byfa5I1kusdpu4LM=;
 b=PR1H2CNad1gPKO3o3DEVPH+ZM8MJEIaUJiApHSK6FKwCjwgeWLuGyGo+wFEe5MFxi1
 IWYVIEKuiRtBI3zrzx/oMgsrRXmzEO59Z/cghTjrEGQFvqxvOalUVUIfMAVdn4mdpqAa
 pC5EIkK5qph/12gNRHxMeIH9agMJOFr4MgF8Yj9+crfLbJRwYPAxc5OIQBMdIQrckc9J
 t9mWbMFajygiNximPWL34QuMAAk+WT2A1oHp3ticBj4eFFMqVwTNCeJVXzy6HOjlScAW
 XSO2zzEfFAWxwGyjo/2skSYhIDQuqgiAKndlmG5GH8kuDpC3kiSheQhQJx6gdkBNthv9
 gu5A==
X-Gm-Message-State: AOAM530b+NgzuYwTMQci0r9mwmiB0LmNdMkILKBAqpjutAaowCT1cG/c
 D90ZImAv37hVlaQpWZqaQc/Yiw==
X-Google-Smtp-Source: ABdhPJz/GMEZDHsqoWmkmlnFC/P5fgMAtM7xYdj0RtuinLJoarckNRDraf406XfaKisylPQa7RDlqg==
X-Received: by 2002:a17:90b:3b83:: with SMTP id
 pc3mr11739741pjb.217.1642697904051; 
 Thu, 20 Jan 2022 08:58:24 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id l2sm4209809pfc.183.2022.01.20.08.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 08:58:23 -0800 (PST)
Date: Thu, 20 Jan 2022 08:58:23 -0800 (PST)
X-Google-Original-Date: Thu, 20 Jan 2022 08:57:56 PST (-0800)
Subject: Re: [PATCH 1/1] riscv: default to CONFIG_RISCV_SBI_V01=n
In-Reply-To: <20211216123538.175087-1-heinrich.schuchardt@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 heinrich.schuchardt@canonical.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heinrich.schuchardt@canonical.com
Message-ID: <mhng-ca6db968-3278-4108-b8f5-4435eb40def5@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_085825_147056_DCE27E89 
X-CRM114-Status: GOOD (  17.47  )
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

On Thu, 16 Dec 2021 04:35:38 PST (-0800), heinrich.schuchardt@canonical.com wrote:
> The SBI 0.1 specification is obsolete. The current version is 0.3.
> Hence we should not rely by default on SBI 0.1 being implemented.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  arch/riscv/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 09abf62ae0ad..f177ad3bee0f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -396,7 +396,6 @@ source "kernel/Kconfig.hz"
>
>  config RISCV_SBI_V01
>  	bool "SBI v0.1 support"
> -	default y
>  	depends on RISCV_SBI
>  	help
>  	  This config allows kernel to use SBI v0.1 APIs. This will be

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
