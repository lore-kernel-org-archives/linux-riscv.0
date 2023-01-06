Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE281C54E76
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 17:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioGV+d82UKCXOGTqXbgPBIyEpr7+/r1n2yQZCqQvs8g=; b=c3duIEGB29Mo1Y
	K4r2pIW40shkD2PL5Hxt5sslUMS85ccbsq7zjHP9vUJr+GoR2QSK4ChG2R7sAV7ga7OLa0dYTAyDx
	+kKjjGVmwHtFxEL9xMO3lVAy8KMd5h0x1VICDZoEyKBL08keCLOu9PXb4e55mpmxUxqwi3uUBrP3V
	lIW+woZcy7DDt6PdsOZAWFxvOvoHguZu4HME3QOHNrrlUxP6Oi2kuzU9LOCGR23x4pM9GzG2JEWmp
	bekrs1BS0VDbP7RdCFbsqMRRsd6IvKszqHmSJKkFVBwFHx+oiyd9ZRISnsrVYe5fOGf5fIgF0YeKN
	BwxKE2vy9FBf0mQte6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDqUW-00BgJm-PE; Fri, 06 Jan 2023 17:26:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDqLA-00BJQQ-8s; Fri, 06 Jan 2023 17:17:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1068D2F4;
	Fri,  6 Jan 2023 09:17:51 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FCFF3F71A;
	Fri,  6 Jan 2023 09:17:07 -0800 (PST)
Date: Fri, 6 Jan 2023 17:17:04 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 0/4] ARM: dts: sunxi: Add MangoPi MQ-R board support
Message-ID: <20230106171704.12e81a81@donnerap.cambridge.arm.com>
In-Reply-To: <20230106010155.26868-1-andre.przywara@arm.com>
References: <20230106010155.26868-1-andre.przywara@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_091712_481761_014A4B24 
X-CRM114-Status: GOOD (  19.34  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QW5kcsOhcyBTemVtesO2?= <szemzo.andras@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri,  6 Jan 2023 01:01:51 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

> The MangoPi MQ-R is a small SBC with the Allwinner T113-s3 SoC. That is
> a very close relative to the Allwinner D1/D1s SoCs, but with Arm
> Cortex-A7 cores, and 128 MB of SIP co-packaged DDR3 DRAM.
> 
> This series introduces the missing T113-s .dtsi, which builds on top of
> the D1/D1s .dtsi, but adds the ARM specific peripherals, like the CPU
> cores, the arch timer, the GIC and the PMU.
> This requires to add a symlink to the RISC-V DT directory in patch 1/4,
> to be able to easily reference the base .dtsi from other architecture
> directories.

First, forgot to mention that this builds on top of Samuel's D1/D1s DT
series:
https://lore.kernel.org/linux-arm-kernel/20221231233851.24923-1-samuel@sholland.org/
To actually boot, this also relies on the R528/T113s clock series:
https://lore.kernel.org/linux-arm-kernel/20221231231429.18357-1-samuel@sholland.org/

> After I had written most of the board .dts, I realised that the
> MangoPi MQ is almost the same, minus the RISC-V/ARM difference. I am a
> bit unsure if we should share more of the board .dts, though, as this
> would go cross architectures. I am open to any comments here.

So after getting some sleep and having a look at the MangoPi website
again, I realised that there is of course a D1s edition of the MQ-R as
well. So shall we split this up like this:
- a sunxi-mangopi-mq.dtsi, which contains all the board specific nodes
- a sun20i-d1-mangopi-mq.dts, which includes that and sun20i-d1s.dtsi
- a sun20i-d1-mangopi-mq-r.dts, which maybe includes
  sun20i-d1-mangopi-mq.dts, and just overwrites the model name?
- a sun8i-t113s-mangopi-mq-r.dts, which includes sunxi-mangopi-mq.dtsi
  and sun8i-t113s.dtsi

Let me know if this useful or more confusing.

Cheers,
Andre


> Andre Przywara (4):
>   dts: add riscv include prefix link
>   ARM: dts: sunxi: add Allwinner T113-s SoC .dtsi
>   dt-bindings: arm: sunxi: document MangoPi MQ-R board name
>   ARM: dts: sunxi: add MangoPi MQ-R board
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts | 160 ++++++++++++++++++
>  arch/arm/boot/dts/sun8i-t113s.dtsi            |  59 +++++++
>  scripts/dtc/include-prefixes/riscv            |   1 +
>  5 files changed, 226 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts
>  create mode 100644 arch/arm/boot/dts/sun8i-t113s.dtsi
>  create mode 120000 scripts/dtc/include-prefixes/riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
