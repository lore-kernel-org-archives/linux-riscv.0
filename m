Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAED4D1358F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 01:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lj03iPETua5dK/eUtivLH2awW2JKr0C89AVj0yS6l8Q=; b=jfUH8IXsnJyATd
	htSt6v+6AWt/oZ5C7vVGxRZKiEFuMHQbaRNvo8YpTR3cF0LtIPDi9qLJ0StkgNzlbifN5RAz3o36d
	2QceGqiXVHpICl6M31SWvuPWNuDa+i2NkdLyRT6uWs/3bKAcpAxpSVmOacfK4qZFF17MJ5ZORDq/d
	mSIQiHsjnsGlpSw//s9/9nhfuDjPp8hlppaGkMir6QxTVWmL2u0aeyBvDzV5b8lQqlQCGvXTpIQYU
	iiW7YxSFUfY/t/G765sehV/DrLyfxML6QE0Jcd7Cz7EnFdeCoOMIvqKjUBG04HPynnowiZ1oje93M
	jW3s7IPV45sOUbEoQ1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5E8R-00000009B9L-2HBW;
	Mon, 28 Oct 2024 01:01:31 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5E8L-00000009B8t-2nqn
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 01:01:29 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e2ad9825a7so2569815a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 18:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730077284; x=1730682084; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TGuyzdjNbGUg4wkS1hddfWef9vyA9xzodf4AE2EckOY=;
        b=jjEX48NgM10XJa2aEffJlPchk2bv87SKt/MXMIkg3sz26hPt3T1M1pnkO0DrNDzzsz
         uFKIXqcCE1FM1YrnBWWcW0e4Gbyk3cRe4kFwVsTV3Q+DqCY4twCpgBooX7l3drzqMQvF
         mr03Ol7NGFSBBfggw0WjBnpuJszNp6iv2+vMdql7vk2pDd1jAlb8ulx0OibexeOM6y27
         zWsEaaGcp8+ZkXBU+QEbX5GGw6x+ZBwOdu65psrW4PEjb/ChEzjmaBzt78LWcR8dukCr
         YCENwoX4YbVNU/bsOa49twY00/CTz+93fx15DeBaCX6Uh/2ofS95yapVJ+t8N3oJGfJ1
         BLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730077284; x=1730682084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGuyzdjNbGUg4wkS1hddfWef9vyA9xzodf4AE2EckOY=;
        b=jmLy+Q+MIH6nEZ4D9OVhH+vH5rkvXRnAIUZKPoE93DJJ9Vt2lmyUffCzcmPd0kBqLW
         cc7juv5tg1IqeY6jSnCzMT+B6DsZrWvcFgePaRJzP1QRZj1zzOS9X4GQMvl4xP5fwkBK
         zHZxzX3NRsLAtcN8zuKGRUCBd/YCV/AI9k+pryE33xHLrt+qtaJIaHC4lE7VjM34cAHM
         ZPJe7rwqw9XNaUxRiT3MBSHUqbdC0+piWcMY2PrEmCFD0DIblDwzLvU/Tg5wAvvu7eGA
         OGzyGuPPNTkeudqbQhP3gkWRwhRdQm18ic//u8njIIYv8v5LmjMXpiZ5suseAKZIjg+a
         WDSA==
X-Forwarded-Encrypted: i=1; AJvYcCUGHofJuckdtzlD2tKdIs5vRjHB+bQ3cIWMAzRxLK7/JooLY5gbRgAR9R7a3OQuNETvq9RmYxCF2sowVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiPOb6dUtuBv3SqQf2ihHuM0s2cDHvP+pH3/BLuN+DcwiwLbRE
	V5dGEz68qwfkCaPq2cD67/xOtEIMhg8zYSDor32hQdDMQbVciw06
X-Google-Smtp-Source: AGHT+IHsjV0smfvIDlYkmXNEvrusWQRxls/Itp84biZuwx87rVzyEPjTIFEByyu7uUH8BnSuAyfbfA==
X-Received: by 2002:a17:90a:d481:b0:2e0:d957:1b9d with SMTP id 98e67ed59e1d1-2e8f1071c8dmr9314209a91.13.1730077284426;
        Sun, 27 Oct 2024 18:01:24 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e515126sm7846162a91.30.2024.10.27.18.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 18:01:24 -0700 (PDT)
Date: Mon, 28 Oct 2024 09:00:59 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Chao Wei <chao.wei@sophgo.com>, Conor Dooley <conor@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/2] riscv: dts: sophgo: Add initial SG2002 SoC device
 tree
Message-ID: <3vn2m4cgntx6c4y3rgkq7eqdlmlddgzi5w76nyprsle56h6sbh@j4liekhs42av>
References: <20241010-sg2002-v5-0-a0f2e582b932@bootlin.com>
 <20241010-sg2002-v5-1-a0f2e582b932@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010-sg2002-v5-1-a0f2e582b932@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_180125_734278_BA977395 
X-CRM114-Status: GOOD (  18.09  )
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

On Thu, Oct 10, 2024 at 05:07:06PM +0200, Thomas Bonnefille wrote:
> Add initial device tree for the SG2002 RISC-V SoC by SOPHGO.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
> The commit adding the bindings for the compatible "sophgo,sg2002-clint"
> has been applied to Daniel Lezcano git tree. This commit may trigger the
> bots because of this missing binding.
> ---
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi | 42 ++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..242fde84443f0d6a2c8476666dfa3d72727071b1
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/pinctrl-sg2002.h>
> +#include "cv18xx.dtsi"
> +
> +/ {
> +	compatible = "sophgo,sg2002";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x10000000>;
> +	};
> +
> +	soc {
> +		pinctrl: pinctrl@3008000 {

I got the following waring:
arch/riscv/boot/dts/sophgo/sg2002.dtsi:20.28-25.5: Warning (simple_bus_reg): /soc/pinctrl@3008000: simple-bus unit address format error, expected "3001000"

Could you send a fix patch?

Regards,
Inochi

> +			compatible = "sophgo,sg2002-pinctrl";
> +			reg = <0x03001000 0x1000>,
> +			      <0x05027000 0x1000>;
> +			reg-names = "sys", "rtc";
> +		};
> +	};
> +};
> +
> +&plic {
> +	compatible = "sophgo,sg2002-plic", "thead,c900-plic";
> +};
> +
> +&clint {
> +	compatible = "sophgo,sg2002-clint", "thead,c900-clint";
> +};
> +
> +&clk {
> +	compatible = "sophgo,sg2000-clk";
> +};
> +
> +&sdhci0 {
> +	compatible = "sophgo,sg2002-dwcmshc";
> +};
> 
> -- 
> 2.47.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
