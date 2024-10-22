Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DD6D17151
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 01:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nA0r4eT4CguhOiwqElnQIoHxODI/V+XJMoH/556ctI=; b=wM518Ai/lUf2du
	f5llbi7Dt3ZPsnJEi91jitM/lMewTz30JfcBu9x57TYCyPwfWQqpyfnbqYwq8WZc/s7Rwni8Yg3ia
	9det8S1L+g8vI1+yU2GOuQ13FymF9NSgiMx8ukCvBFuhpr0b2uSdNF/0vMYt2ZMoKy5CpHuMxc08w
	IYU4WVfdXf7hc28LaosXVPyzTHeM+tctxVJB3toZex1d8gM5Ixjqj9ZHykP+eJp/pIQ7A2LyjFs3t
	/6poAze71/KjjAM/5x8ylrOClFJ3sclSWxXuluUZXwEqigPUmPLYiVyNJrOd2WDm9AldP6473oI7f
	o9lWF4cVi0M8+v0NoPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t33K9-0000000996f-16KD;
	Tue, 22 Oct 2024 01:04:37 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t32pD-000000095FD-3KiI
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 00:32:41 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71e7086c231so3812450b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 17:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729557158; x=1730161958; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WE4OCeGrEarxaIJLsEWYczNlBhDxq64y4K7wEYrbCx8=;
        b=hvHmLhIoKzoUKz6v8JgTs4US+fMWvPZCYEirZ5XPGh20aqAZHU0SR962iyffdL2t/0
         rgHeqvvvNsNeexUpYTOLNDFhMBUtSPG3WmRsdzT0zyalRU+Wp0Y3LhKklgBx6Ab6kPer
         otKtMQHW7t+lcqohme9NzmGTtGmBOqkihJYYUVKUzuf1/8APTZ26tHKGpX1qlQEXFxom
         z60dnHy1lbi253X/zS4IhTJMfUYRuvwXZkfhxocsolgUixLzVCuZYZx1AuZuNaCmxBOO
         HBf59VlkOyPa7FMqPe6xSNupTuvmv4UAo1gQP+yxczRENuR+tlmfuXP8hhhVuVb8PTbN
         Zuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729557158; x=1730161958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE4OCeGrEarxaIJLsEWYczNlBhDxq64y4K7wEYrbCx8=;
        b=HMsztH9AXCF/xZXtmNWfGG6hpjHackQDTcHJLfUAuaTVMvzgt+tfCAW2N9/utHJGg0
         8ytUoi/gTuvTlo25ReKp+Vh+00xORSvSr+cSaYHw/2qWuE7spst5RxG/oBqIK3S41uw6
         xCD9dL9Yb2hOiydbMkanIUU77S1sSkB3ZL+bVeZUmpN5dx+7GSs0nPqi2iM/IbDXXQqT
         p7Bau17MvZp/gKE6s44zzhuxqrYwpfL86/pWdNdCSSqyIIQO0AqKLLm+jrYv5m8bJszP
         6TPsHFtvmr2foxDp9Z85Z5MeJJDhnGv/7KKyGQnsPsdHiA0sccSSjJHdQOoPOUnRST1H
         kweQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYf3yXHv5j6zGdIELadZMaXZcnfp3yemq/PRlH2xmTeohsAD2Ps5y6PRGlWzd5CUv+CheJP1Hh6TAtrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMskDa1b7rXs+6tU4d8yJIhb+8D7R0tv6TGOCXm76/i2BM6DIG
	xJL8Aa8+YWdDXS5Z73D+ZKKTu5UzjbvHi/xEmIBm3DTh2HJ+w8WI
X-Google-Smtp-Source: AGHT+IGRvtwT49FWz7kNEaS3v8Wbc/KWtCjRiHMEU5H4U/gU9VJLLNUgtlNoDFiUyPMBYSalal22xQ==
X-Received: by 2002:a05:6a00:3d15:b0:71e:76ac:4fc4 with SMTP id d2e1a72fcca58-71ea332ab76mr19694997b3a.21.1729557158051;
        Mon, 21 Oct 2024 17:32:38 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab58aadsm3747124a12.53.2024.10.21.17.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 17:32:37 -0700 (PDT)
Date: Tue, 22 Oct 2024 08:32:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>, Conor Dooley <conor@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/2] Add board support for Sipeed LicheeRV Nano
Message-ID: <luq5c3nkj6mcnmfah5gethcud5iikaayyt4e4tiw7fh7e67zou@bkuzbt7kiztp>
References: <20241010-sg2002-v5-0-a0f2e582b932@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010-sg2002-v5-0-a0f2e582b932@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_173239_860725_EC7ACDD3 
X-CRM114-Status: GOOD (  20.83  )
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

On Thu, Oct 10, 2024 at 05:07:05PM +0200, Thomas Bonnefille wrote:
> The LicheeRV Nano is a RISC-V SBC based on the Sophgo SG2002 chip. Adds
> minimal device tree files for this board to make it boot to a basic
> shell.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
> Changes in v5:
> - Add support for pinctrl
> - Remove nodes for i2c0 and uart1
> - Drop dt-bindings patch that are already applied
> - Link to v4: https://lore.kernel.org/r/20240711-sg2002-v4-0-d97ec2367095@bootlin.com
> 
> Changes in v4:
> - Add correct bindings configuration for SG2002 sdhci
> - Drop commit "dt-bindings: timer: Add SOPHGO SG2002 clint" because it
>   has already been merged in Daniel Lezcano git tree.
> - Link to v3: https://lore.kernel.org/r/20240709-sg2002-v3-0-af779c3d139d@bootlin.com
> 
> Changes in v3:
> - Remove /dts-v1/ directive from sg2002.dtsi file
> - Add disable-wp property to sdhci node to avoid having a write
>   protected SD card
> - Drop changes in cv18xx.dtsi and cv1800b.dtsi
> - Add fallback compatible to cv1800b in SDHCI node of sg2002.dtsi
> - Link to v2: https://lore.kernel.org/r/20240612-sg2002-v2-0-19a585af6846@bootlin.com
> 
> Changes in v2:
> - Add SDHCI support
> - Change device tree name to match the Makefile
> - Add oscillator frequency
> - Add aliases to other UARTs
> - Add aliases to GPIOs
> - Move compatible for SDHCI from common DT to specific DT 
> - Link to v1: https://lore.kernel.org/r/20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com
> 
> ---
> Thomas Bonnefille (2):
>       riscv: dts: sophgo: Add initial SG2002 SoC device tree
>       riscv: dts: sophgo: Add LicheeRV Nano board device tree
> 
>  arch/riscv/boot/dts/sophgo/Makefile                |  1 +
>  .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts     | 95 ++++++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi             | 42 ++++++++++
>  3 files changed, 138 insertions(+)
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20240515-sg2002-93dce1d263be
> 
> Best regards,
> -- 
> Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 

LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
