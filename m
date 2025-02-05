Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B90C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 10:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xfNBnbpKkKrfW9Z12NtMR7w7OEu4m39nU5ZXGg0e7WQ=; b=OTBfcU+hiiEIoDgnYf0A1g+HcO
	wrnRaAKE9RuoujYb0NOrLU+3i8KIFfmA6NBeS4FHvBYJMmc5VBbiNMdOZtBwHdEcyk8MpTxNaKrV0
	+ErM6MBK8VVYVAG7QOVpupud6l1fWyqg/OEMluVdnhDrLVtcNAzHaJzZx1WHxGPiES89/5W0dZ6HG
	CK/d388/AEV5LX5GyvBEihEMRWauh9hbXCCD/9Rez+WNqEKiCC4H1DPGu+4gLrcCBf2oXn8hLhLQl
	0M04+CB6PRa7ivrRZ2bS4uOOwYAPdE9UrKRfP6GixxxGVjHrzw7c9dSXLezGqtHtILzB+m4D/g+iC
	8A3rtAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcf5-00000002st5-2lHP;
	Wed, 05 Feb 2025 10:29:39 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcf2-00000002ssN-30Ng
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 10:29:38 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 22EA63F277
	for <linux-riscv@lists.infradead.org>; Wed,  5 Feb 2025 10:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738751372;
	bh=6p5dlNzJ/YPPjs/DSFQLsa5sUOHCa5xG63IkAekOvh0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=FAtARg6hgwwQSPh5y5NmSeKybqTMW5Owxwd563KoOAs7dd9Qu933kSYPe619Li8gn
	 5LbeRVQdxwuNfc1ItPLJhdaEhX+yaDw9MgSgT8pKhVc44RuRKHSPwiHmv/65CwEqH0
	 /TOJWWQAl8tGoAQoDIWnRocCGaAm8FqyoJC+Jyyrl+Yox4vFl9tw/qmLlyD1GQc3fh
	 2cJuEmqeJpsVwCm/MwSQhCU95bKP7+Bb1gBcE8rWrnC1by16VHK6aolbHkxZLlIxg8
	 /6KCnSgfpiLS8JGjcFI8zct7JzvpGjIoO8TIiv59OWtnasoKtpDOm31u63U8x6iT4I
	 ZY54ZpU3PJIBA==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2b268f6e85eso5411127fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 02:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738751370; x=1739356170;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6p5dlNzJ/YPPjs/DSFQLsa5sUOHCa5xG63IkAekOvh0=;
        b=cXemBoWWugyUy3T37zSTkQuCE7xrEYRB/NYHLwuYu0zlk0nr5Lif3iV3clnuCNKV/V
         exeaizNDLYQX8wvtRPxhLglD2DetN4U57/dZlukCODvS0OWFCCyLLhY9jPgLJnpqfPFo
         L1E64ikGnzl3qmb9qdDrx68p1vgRGgRIDaEJn4PkFwTi49q/VbjZOpL1DpoGHcROObfD
         NPgMzrIlRqF5SBKJGHQYjbKNEUcPsXHqECiXZFVhgz2wRt8ZYRoGzmLNBIukWnQKmsdw
         NYKpWijcZLIcRwiSVNXY02gX/NarxH5DzhCaQ+K/k18eoH3JB1OmwceIclXwIGs9jygB
         fc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUN3hlwydzMXkTfkyy1kwUBQfRAxA3lHlCBL2C3eEfxMmEhpFP9tjeNhn3e8VteQc0e14v7n7f7LQXTiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb9lDoRG7FyMoSma17S/PtYnExcpuXNBI8D2qhVLV2hmEi9pYU
	WDmco16YOdjtMTKzpwW41DKA+3vBpoWgTSMs0yL+Omj2adrzBpvsgCvncy6V7E3Ijtwbv/gM9Kr
	MNCA09cUhy6Doopp6Effvw16UQWqQsVZlgw3TQ8Eil8xKgp8U7hZ22Wwu491To54xKOxEzrN1/6
	exkBMGwJmvRIfjaefxwbdnxQjYaXTuQs+RceM9zkewnwBjeeNfibFYlx9m
X-Gm-Gg: ASbGnctFJCbWCTo/UWPGlydZnOXYmng77PMfFHI/knghGp4K6LGahsfD8/O1zN6ReU1
	uCTr1cakWs7NiB/cG1xPPQTmmp+Y9cLZyPrB3KEdHQ+Rhp5UN3bItDI4OTkP2kPgaWU7pRdLn9D
	GRwzW9JzUqEeBs+tw=
X-Received: by 2002:a05:6870:15c4:b0:29d:c764:f873 with SMTP id 586e51a60fabf-2b8051189e7mr1412751fac.31.1738751370730;
        Wed, 05 Feb 2025 02:29:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IED9P+bVZqPUW7UO2uWic3Ql/tfX6w4dwltPlCCIcZdxoXy1RTbFe/BWTDvYa6FU+eq3MorrYQsqOpUrQqy/Ck=
X-Received: by 2002:a05:6870:15c4:b0:29d:c764:f873 with SMTP id
 586e51a60fabf-2b8051189e7mr1412739fac.31.1738751370456; Wed, 05 Feb 2025
 02:29:30 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 10:29:30 +0000
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 10:29:30 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250203013730.269558-4-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-4-e@freeshell.de>
Mime-Version: 1.0
Date: Wed, 5 Feb 2025 10:29:30 +0000
X-Gm-Features: AWEUYZkWYCph906PZJ8Zu7NPROce5GWqOyVjvIksBicpE8lH4z17iclUJfeqp4U
Message-ID: <CAJM55Z95pwTZmw-WPcUaB1BGpVoNgaRYYjUnqSFcLTNyVmZahg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] riscv: dts: starfive: jh7110-common: assign 24MHz
 clock-frequency to uart0
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_022936_946781_A4068823 
X-CRM114-Status: GOOD (  10.12  )
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

E Shattow wrote:
> Set uart0 clock-frequency for better compatibility with operating system
> and downstream boot loader SPL secondary program loader.
>
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 8a59c3001339..6bb13af82147 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -635,6 +635,7 @@ GPOEN_DISABLE,
>  };
>
>  &uart0 {
> +	clock-frequency = <24000000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";

The uart0 node already has a reference to the uart0_core clock, so it shouldn't
need this property.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
