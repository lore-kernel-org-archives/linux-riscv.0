Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C85C56201
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:14:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A0E20825
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ptMSGF3P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="fsVJL39F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6A0E20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Y0qJxKWDPGOb2RRmuJw1xRvqjqxjLijhec728cxBvWQ=; b=ptMSGF3P380TEHF4VpjolZPir
	aYwVUvVSHrIRY/qLxcmMZmqwmSDzvpAluT4c2r37cOu4YrAm/O6k/hHLKft1MRu5GpOHObp96DcXz
	uga2nzP+TSlmBKYWOlKOzT2oTB6W43hMUp1vNb52kndb9j41gfRjc9jfjGrZw4M9Avd3Au5/XsHHL
	iUdA59h6yzOVTaynXbeKk+Gt0vdqGCzgQ1s/oR/2bZFAuJH+LmURVmRfs9ONawewGlse7pglMvyI9
	pxneAZeup1/8l0h8MDxfw/Y4jm5EBySQoYiwK1Cudx3mUqSSIliwvdPCBQ4bvkO9BMPQXRFMqQr0k
	PVJ8v3E2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kavxG-0002uY-K7; Fri, 06 Nov 2020 07:14:38 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavxD-0002su-LV
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 07:14:36 +0000
Received: by mail-pg1-x542.google.com with SMTP id g12so241461pgm.8
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 23:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6hIImNRnU9cgbmxIIbosNrDfQ1fw4BJiExYh05cGrVo=;
 b=fsVJL39F/dBNGipzDNkM1dCZnsNJ3fBUnu630YD3xO8ImShiYeWPgje2vKSGCrF+ly
 30tNA9MYJhgYNpA2MAz9uaV9WM46yLRiYPgc1N4h7aEJgmfG9S9ncmuuvlOu8cinFXSG
 igmaPoQsEfuJM+92m7fQRwvv4dc716gcLunk8HGT/JU8+U9eCksmUfXQC/032Cfvu0g0
 o2PdMp0EIQg03jSYMwZEZGyPhb1NvKsIcCxSAtAiXRnVOLdH/64aQFxz41W2DwPRVud/
 MeuwdWD2nHJAPxjqZBUhpRfcYJSm/lA6ACxLu4A77zeqVkVN0bj/StGWFEktnQqHmse5
 ew0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6hIImNRnU9cgbmxIIbosNrDfQ1fw4BJiExYh05cGrVo=;
 b=W5djEQSze7TTJSAi+s7RWfJ4imgoreIIaDteNz+fBCj8Gd4MsTMBVrtKbPxNKlHqq9
 CU2rmBiOLjG0JAMmy54EkYionZpLCdFdNZ2sk3KepZC4LAn6QFZjQvoc1v1+OrLgoft8
 sRVOHrwGc5CFI91a+4+fST+L+4HwisAWyoP7lgsDXlqY+U7iQNc3434+F1wcgIrFPfVo
 ymBUAA8HvX8+KomD0drfUcajBxtY/yBiuJ9wfvyplJpXzt9T1VnoWqsSE57r3zIp0iuh
 UVUeJVCVdRKhuduiofoExVpM6HsAYYNIVuOvPmlH7TqT5cg2gxspedgpoPevgFEZsWMf
 ozMQ==
X-Gm-Message-State: AOAM531LvBhtDXkUH4+ky+0r1bjiom914eVykPQYAwlrx5DvbAzo7GdV
 eWjiMHUDCfome+QyjXaaw7e/NQ==
X-Google-Smtp-Source: ABdhPJz5XPcq4MAZ3pYcr4Ajim+EB6OVrNRi6M08jrMIudLSVO+kKYyr1tGKQKg886UJtHZVpijMeQ==
X-Received: by 2002:a17:90a:474b:: with SMTP id
 y11mr998795pjg.114.1604646873941; 
 Thu, 05 Nov 2020 23:14:33 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f19sm782687pfa.82.2020.11.05.23.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 23:14:33 -0800 (PST)
Date: Thu, 05 Nov 2020 23:14:33 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 22:59:38 PST (-0800)
Subject: Re: [RFC PATCH 3/3] RISC-V: Enable Microchip PolarFire ICICLE SoC
In-Reply-To: <20201028232759.1928479-4-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-b5dd0def-a774-43e9-ae39-026f5b2411b9@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_021435_820287_CAB25F4E 
X-CRM114-Status: GOOD (  20.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 robh+dt@kernel.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 padmarao.begari@microchip.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 28 Oct 2020 16:27:59 PDT (-0700), Atish Patra wrote:
> Enable Microchip PolarFire ICICLE soc config in defconfig.
> It allows the default upstream kernel to boot on PolarFire ICICLE board.

I don't actually have one of these to test on yet.  That said, if it boots for
you then I don't really see any reason to delay this -- maybe there's some
issues floating around, but I don't really see any reason to delay putting this
on for-next.  I'd even go so far as to say we should take it during the RCs, as
so far it's just build/DT stuff.

Given that this is currently the only production RISC-V Linux board I don't
really any reason not to add it to the defconfigs.

Is there a reason this is an RFC?

>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index d222d353d86d..2660fa05451e 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -16,6 +16,7 @@ CONFIG_EXPERT=y
>  CONFIG_BPF_SYSCALL=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
> +CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SMP=y
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
> @@ -79,6 +80,9 @@ CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
> +CONFIG_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_SDHCI_CADENCE=y
>  CONFIG_MMC=y
>  CONFIG_MMC_SPI=y
>  CONFIG_RTC_CLASS=y

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
