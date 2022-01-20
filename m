Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918BAC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 18:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=w3Ce410YNjaa9BfLkU6BEX27VAEm3N1eZN37JZ04PeE=; b=oWnRLXzJCuU1wg3MV2awpStWi3
	xkGJbvJ2rdiS8mUE8mrSJ0ydMMk/QOP8cTXfvsisYMdpFW9Aw6auGuQbOl2SpQNMuRx16Bs7gdwaJ
	wz0/JTxKIqNOfJD5BX5WDCZU1Jm+w3N277fnogmW0Vk2z+lPWvKFJ8irndj+3O2jjYyVEB635byn1
	8qrl6fucuSwj2CQLC27ToV3QN1OaSq8cEB60f/7pftgF3YXzvKLu4LKohxZbIyaTDlwelzl1ocndW
	pTo7aU+Qyp67LEAiBsOUM8i1u6e0XxsgzSrqa2TV/GpFflGi384eYceMHndtiis864TlzFBQ2RIwy
	pBoCs2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAcXR-00CrdN-4s; Thu, 20 Jan 2022 18:52:01 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAcXO-00CrcT-Gl
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 18:51:59 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 n16-20020a17090a091000b001b46196d572so6598367pjn.5
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 10:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=GfJPzTO4+6gKH1kcosuz9QZACOYFU4Iv90CbjK5Exb0=;
 b=nvdp+7tAHdaQmGATbPnIJIDkj+IiO4sLDfAtU+06bajMNaFkBg2sUr2kcW/0DjJhbJ
 DnvZN5QwVu2jEBJBQh0/bA3hrummTNnF9rHJIC8RlSJ3bU8mCMmfH8K/fW1ehSU8cXyh
 WqUo57plR4evGAxCGwObzg31zLG28EWiCHuN7kn53gmKXv2PLPGmgnP/XeZEyRsdEPLG
 2lREcPJY9TECyl/8iOHqpwO4aehPq6QglV7ZhfH8Rh6LcvaCnNd/wiMGyV/DcvEVPFrc
 ggtyJBTeu8Xe9cAZ/ZRbU7AfkLskvgcYQ7oZJvoiEjQTDQrwFMBVepMCV1obQao9En+J
 eQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GfJPzTO4+6gKH1kcosuz9QZACOYFU4Iv90CbjK5Exb0=;
 b=MNoBkUf3zYidDADrMMh7y5cYGvPexk965n6jojaWs7o9uolnDNGPk4KOx8YCFUkDLm
 KecQCS8UMkZQddh6bdqMwouGlPM1NOacWYCi1yhz6JiBdi4VhCWKv7JewxgOR2q9yraV
 ds69mDM/e3RK43NeozVKk3+wxJLfZ/GoE2snLL1PFB8I9xIr0DGVTsuQXE3Zgst0UgeA
 7eeOc+1OgoNtf49tdnL+VKbhiQ3BYOGD7tq5DRmGY5bZOUCWDDyI7ghSz9Ld3IZE4s1v
 xzAfU1sUeoD127fxRgKySmJYy+kprilN3yUikVHsAXM8OZJcZU2I6qg9SQi79xR08mBh
 rW7A==
X-Gm-Message-State: AOAM531j4vhTLeu156VdJ0Tsa8Cob733ACtOYKEw/aiWbaO4IN1I6/XY
 BoBlEhZ7bQe/M3jtj5e3KWhrVg==
X-Google-Smtp-Source: ABdhPJxcgAse5NbCjt07h9gsgp8PUg33sFUeXCIthzYQbiQ3H9mNb4EFmJrFuuza9lMWdk5xfYSUdQ==
X-Received: by 2002:a17:90b:3c5:: with SMTP id
 go5mr12451432pjb.148.1642704717977; 
 Thu, 20 Jan 2022 10:51:57 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id m11sm2968926pgb.15.2022.01.20.10.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 10:51:57 -0800 (PST)
Date: Thu, 20 Jan 2022 10:51:57 -0800 (PST)
X-Google-Original-Date: Thu, 20 Jan 2022 10:47:08 PST (-0800)
Subject: Re: [PATCH v4 1/3] riscv: dts: Add dma-channels property in dma node
In-Reply-To: <163a2cf11b2aceee2a1b8dc83251576d2371d4a6.1642383007.git.zong.li@sifive.com>
CC: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, 
 geert@linux-m68k.org, bin.meng@windriver.com, green.wan@sifive.com,
 vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-6f23fd15-5348-4f0d-a972-d43d4ca7f415@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_105158_598899_9A2184B4 
X-CRM114-Status: GOOD (  18.31  )
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

On Sun, 16 Jan 2022 17:35:26 PST (-0800), zong.li@sifive.com wrote:
> Add dma-channels property, then we can determine how many channels there
> by device tree.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 1 +
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi        | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index c9f6d205d2ba..3c48f2d7a4a4 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -188,6 +188,7 @@ dma@3000000 {
>  			reg = <0x0 0x3000000 0x0 0x8000>;
>  			interrupt-parent = <&plic>;
>  			interrupts = <23 24 25 26 27 28 29 30>;
> +			dma-channels = <4>;
>  			#dma-cells = <1>;
>  		};
>
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> index 0655b5c4201d..2bdfe7f06e4b 100644
> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> @@ -171,6 +171,7 @@ dma: dma@3000000 {
>  			reg = <0x0 0x3000000 0x0 0x8000>;
>  			interrupt-parent = <&plic0>;
>  			interrupts = <23 24 25 26 27 28 29 30>;
> +			dma-channels = <4>;
>  			#dma-cells = <1>;
>  		};
>  		uart1: serial@10011000 {

I've got some comments in on the bindings, but I'm assuming it's easier 
to keep these all together.  Happy to take this through the RISC-V tree, 
but I'm guessing it'll be easier to take these via dmaengine as there's 
a lot more diff there so

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
