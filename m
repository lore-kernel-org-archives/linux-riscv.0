Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD1BC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 13:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=z5HnqC29xsu7/u4EdLkyN27G4uTV999iaZHh6YLqEGQ=; b=B9l6criQmJM/bOXbil1M36Hj0s
	QwnjpV/iKnUIYPGSYtDm7i4BU+WhAwlTSWZuHx3+Ovv/Kw4MbqDkbcIkfD0VUG4zQJ9hYeNCdNJJx
	VfznVpQhg6pwFk/kaVNDhu8aDBs3A4xF4toDoA+1F9X4xhAD6YNNZOWyzL9NfVjMsoiF2FgPMf6ZD
	cUtXGyCObjv5hGfi2zSJjftLuUwDvaBeveB1jq6O65WUC/6g83za0Etm6suoMR+fwqj+az3xHcfYH
	dGdEsVIAUQL1go0DOehJQW9BKQEgrjSm04fGu1d0uJh6+jJmftM3jNXm5iv/1k4z2Q9PZXyJE0xRb
	GSuc95Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RAC-00000002xfK-08ff;
	Mon, 29 Apr 2024 13:35:24 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RA7-00000002xeS-1rzH
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 13:35:22 +0000
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C47CA3FE5D
	for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714397712;
	bh=i5EFwpTQ/yod+PFPXLLx86U7SIhYrJEKRoBvtVYnwsk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hYUDOJAOl0lHYimJNheUshwWRuKiHoQt8r/VZuQVencz0ukrltQ77BTUzxgqh+rsW
	 5Y3o/W9MPC+u8zZl8GwIV9M/oePkyDE+wE1onvrh3QeVsR9c/EIQ3j1lYvvYMDgZs2
	 x/7pAuGL+8cNJAipMunSfTcXn3jAJ/FhASmSAo7Jrah1WBE4ufTFWSGy4d1THyB64R
	 OefT/1qn7WWGjQJyj4T2tCvPOElPTsdmseMVhRJ17d5quJw6QYnr+22fBZreswC5It
	 RKp2fpA9MT6AjqYoH13Gy4CbROIDK0dQ6SQPstpfV/md76858GeW5RWkFuxs4TG4Uw
	 mFpYl1aGeBg6g==
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6ed1d9ee926so6507464a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 06:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714397711; x=1715002511;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5EFwpTQ/yod+PFPXLLx86U7SIhYrJEKRoBvtVYnwsk=;
        b=iyMemI6z9lBMWSzcQ6adRSJEafsYetU+deqBaC/FQm/8pbrCeddd+1ORID/QxGrkTF
         hCN4QQ9M8fTz8umZYB4KSvr9lYPJtYJTjIBEhmrzT5oK4Gx1m7YruszLDH2wyJasCfd9
         oOz6wNa4uFlUjq8jXAB+qZJADrfIoJbr3JC9Ck/aaueEUjLObtU/SocUhh9hN6rqksfS
         xL5N1JRYu1s6gJoQEQQQKvrTFqhd+9CxqQxtbITyB+Z3Birx319xlqnQTecouqzwAXl3
         uHcbAqTmNJzfaQZ86iQmMTQM6+mT0hUUVQps7gY//xpyurUQtY/5GKeW5Ew7VG+hMNQ3
         If0g==
X-Forwarded-Encrypted: i=1; AJvYcCVpCo+5mMDkSukdNlEmaeqzpVlYxCMPApQd7xmDUQcvk7cpsAbkB1Ay6BtHrv26JEV5UU2xogS6X0XL4+nf9eec892eVJeeYhPDNLmDRK6u
X-Gm-Message-State: AOJu0Yzic0owubhSDNNKfHjW9XQqo7tQs9JwTZoar81tOTH10ct6QO3H
	+AyhPHK9Ico+uhKdTEQK/eTBq2ZNdYYcw70FFUT2EmrE5TDpxU/NF0/sBBehYGllGOh0OCrDXgV
	6h+D6efcyl5QNXRVKOrgGIY5Cp1MgRSYNKPb0BXm43ezkY7VypQwYRJzDKczeGUp1lz58mzqi+L
	wNBdXUQyQ4oj0V+0ogmWUvwSiXCT9vlriFbCW8P3wb6XxH7zzviKZ4OZpF
X-Received: by 2002:a05:6870:a79f:b0:22f:bdb:6335 with SMTP id x31-20020a056870a79f00b0022f0bdb6335mr13790825oao.7.1714397711199;
        Mon, 29 Apr 2024 06:35:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHryGySPZmEKV0fYg09/ur2qjkloaaZt4s3fSluvMfQOiv7YMdvq2iMMpRVWKIiPQEaQVwHIzoJhKPdHnAHsMw=
X-Received: by 2002:a05:6870:a79f:b0:22f:bdb:6335 with SMTP id
 x31-20020a056870a79f00b0022f0bdb6335mr13790792oao.7.1714397710814; Mon, 29
 Apr 2024 06:35:10 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Apr 2024 09:35:10 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240425082138.374445-4-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com> <20240425082138.374445-4-thomas.bonnefille@bootlin.com>
Mime-Version: 1.0
Date: Mon, 29 Apr 2024 09:35:10 -0400
Message-ID: <CAJM55Z-3rjs8m4Dt6DVEv-5XfKUgRedY1p=BaPPdDG2_fh3AUg@mail.gmail.com>
Subject: Re: [PATCH 3/4] riscv: dts: thead: Add TH1520 I2C nodes
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, jszhang@kernel.org, guoren@kernel.org, 
	wefu@redhat.com, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_063519_949584_B4CA2F62 
X-CRM114-Status: GOOD (  12.78  )
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

Thomas Bonnefille wrote:
> Add nodes for the five I2C on the T-Head TH1520 RISCV SoC.
> All the I2C nodes are fed with the same clock named i2c_ic_clk.
> As there is currently no clock support, the i2c_ic_clk is exposed
> through a fixed-clock to mimic the existing nodes.
>

Thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 66 +++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index d2fa25839012..86ae507576dc 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -153,6 +153,12 @@ sdhci_clk: sdhci-clock {
>  		#clock-cells = <0>;
>  	};
>
> +	i2c_ic_clk: i2c-clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <50000000>;
> +		#clock-cells = <0>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -258,6 +264,36 @@ portc: gpio-controller@0 {
>  			};
>  		};
>
> +		i2c0: i2c@ffe7f20000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f20000 0x0 0x4000>;
> +			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&i2c_ic_clk>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@ffe7f24000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f24000 0x0 0x4000>;
> +			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&i2c_ic_clk>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@ffe7f28000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f28000 0x0 0x4000>;
> +			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&i2c_ic_clk>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		gpio3: gpio@ffe7f38000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xe7f38000 0x0 0x1000>;
> @@ -312,6 +348,16 @@ portb: gpio-controller@0 {
>  			};
>  		};
>
> +		i2c2: i2c@ffec00c000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xec00c000 0x0 0x4000>;
> +			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&i2c_ic_clk>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		uart2: serial@ffec010000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0xff 0xec010000 0x0 0x4000>;
> @@ -322,6 +368,16 @@ uart2: serial@ffec010000 {
>  			status = "disabled";
>  		};
>
> +		i2c3: i2c@ffec014000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xec014000 0x0 0x4000>;
> +			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&i2c_ic_clk>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		dmac0: dma-controller@ffefc00000 {
>  			compatible = "snps,axi-dma-1.01a";
>  			reg = <0xff 0xefc00000 0x0 0x1000>;
> @@ -394,6 +450,16 @@ uart5: serial@fff7f0c000 {
>  			status = "disabled";
>  		};
>
> +		i2c5: i2c@fff7f2c000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xf7f2c000 0x0 0x4000>;
> +			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&i2c_ic_clk>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		timer4: timer@ffffc33000 {
>  			compatible = "snps,dw-apb-timer";
>  			reg = <0xff 0xffc33000 0x0 0x14>;
> --
> 2.44.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
