Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A35C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 03:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kqhrtKAUY5u8g6MhQJSZArAhVIh+GIcydjDUwZOjDqg=; b=sy476qNPa88F7I8B3FLT12lSck
	8MFg700Old7jALqRlf6Q72TLMmMFf7nXZ0nhZEwo5hOro7k0lQGBIngzXRTjrM8Ucu5XDlGjrg85b
	ZY4u2+Iq/J4Sc65piKRQJjztyGv09kADMd3oFMTv4a+4VYdlLnKl6v3QKIL18csdXGeaf6DFQtZmu
	WxeLBX1YUO08l4bPcFK+ZMDfxWIPNcf49RUNuvVFW/HOdBN6v5ohi+XcP3dgA4Mm4nzc3pwqCRgVz
	7aRohZGpcvHT5czYDOxb5SEaWf2hqXWh92sF+37qgXtMRLz3ev7hWxuWPSl3hHU9pO9NSpblB2OgY
	owf5G3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIA9-00CCs5-19;
	Wed, 15 Mar 2023 03:50:53 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIA5-00CCrO-2X
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:50:51 +0000
Received: by mail-pj1-x1033.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso388539pjb.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 20:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678852248;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wNR/AReJNuaktO0vGgwwAeslYuYMl8iot71i0FVuR4=;
        b=O864cEqD5w3bm2rSHywmQ89aN6rO39ljJ5pTLLnAi8vm8ZZO9zxOMWnhyuUUs7zziW
         dnIBNitFWNcfShtMGVTQ38I6wG/XBs8Nlb7E8k7EhM3tyUI9TnRhnE5J9FA8QR+NCq5I
         vJcFutZ+o+p8PC3O73zz0n2JBJvjlqpptr1bEgNAJJElFm1JKzH8uMbHeVzhmKgtBDGO
         vIZNyJibm6ENOQuyV/3P+eO7zu0gPtXk0SQDnhy/5sbINF2pZ2ywdXIZYaT6sDwkqIf8
         dGRKcfZnkSTbSn6dE5vbAiQ8uog2jQvMiyjLVBFYccc+iNdReo5vD+TeMZ82ibZjCQQ4
         TzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678852248;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wNR/AReJNuaktO0vGgwwAeslYuYMl8iot71i0FVuR4=;
        b=EfkUFkoMAS6Tf50mdDCFoEaMBV91qpjVDOBV0X6c1FG4RTuY72Cb5y2Nc7bk9I1uNV
         DfQVkswXSi3NLQTuCrZzVka46JJ7jjkJV7lhGeej+sMbasS4f4gsxLL6vWY8WpARMp+/
         DTBYIXiV1FxstMqZO03QQzvTZneTd40dGT+/EvE5/yl/J1/Vxw1HQDqtXJl/rdkWXE3X
         xqGiWd5KSbBePo/aRhcRK6k6N6swB8jkF6bQAPq0WNVTa7MWdPTIRWPGzciyWHmZnVhM
         UX2z5/Rpy3CXwPib5T/0yur3jwAyPZZ0GdljqX1wzi8vsI9Z0Fm8vFw2iVb0EidbcsLX
         ROSw==
X-Gm-Message-State: AO0yUKU6olpV54jPNejP1SOOm0fW1Ss/eSw7gaIwr3jP34eEIt6cLhTC
	fS3wWEdaEi6hVQHmOdySDb89HDKp4JKUbrCloyU=
X-Google-Smtp-Source: AK7set93DWPB/N8yOcSlFvfWLhVo5N9MF0NR8f3RFGEte4D1ZDtft87+sO8AMffDQ6GdsqO2NiKG+w==
X-Received: by 2002:a05:6a20:3c87:b0:d0:e4b:29b3 with SMTP id b7-20020a056a203c8700b000d00e4b29b3mr36198692pzj.27.1678852248553;
        Tue, 14 Mar 2023 20:50:48 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l22-20020a62be16000000b005e4d8c6168csm2318821pff.210.2023.03.14.20.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:50:48 -0700 (PDT)
Date: Tue, 14 Mar 2023 20:50:48 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Mar 2023 20:49:57 PDT (-0700)
Subject: Re: [PATCH] riscv: dts: microchip: fix the mpfs' mailbox regs
In-Reply-To: <20230307211053.1777066-1-conor@kernel.org>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, dare.mcnamara@microchip.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-7491ad0e-7097-4c1d-b7b7-fd59bd65b739@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_205049_824520_F5094BA4 
X-CRM114-Status: GOOD (  15.08  )
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

On Tue, 07 Mar 2023 13:10:54 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The mailbox on PolarFire SoC should really have three reg properties,
> not two. Without splitting into three sections, the system controller's
> QSPI cannot be accessed as it sits inside the current first range. The
> driver & binding have been adapted to account for both two & three
> ranges, so fix the dts too.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/mpfs.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> index 0a9bb84af438..62b1aec4ffff 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -498,7 +498,8 @@ usb: usb@20201000 {
>
>  		mbox: mailbox@37020000 {
>  			compatible = "microchip,mpfs-mailbox";
> -			reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318C 0x0 0x40>;
> +			reg = <0x0 0x37020000 0x0 0x58>, <0x0 0x2000318C 0x0 0x40>,
> +			      <0x0 0x37020800 0x0 0x100>;
>  			interrupt-parent = <&plic>;
>  			interrupts = <96>;
>  			#mbox-cells = <1>;

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
