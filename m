Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7771C624D6
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yCofydRTFDjST60FVUDEzj8DGINgHj8eTi12ImSuxE=; b=mtTFApIeRXENVG
	TRsFN149b3vx+T1MR+QZ3nZknyHcveT1e7W4PwLuYLpe4fgK0RPpXfbsadgHSxwVgkRKiGxyyiJA4
	F51lge9hO6w9OmQ/0lOLv/gFGofIr8w8wMOJidZplOgEPl7gcHH8c142AHhGrYFg9D26OSmZbFlw8
	dFwOeVrEIxxaZ3R9hyQBIeDoe5e9hQT8xDm0sRy3MYHCPIx3kVsYcXu4tJMSnAta6JTb0eCvj3dG9
	IWzYTv7Mt3AtySv13M0M4KH/kX3FaKLTIekK9HodUoWfznNlRcz7Th7tOXZQhv6h/Uen7rAU7hcP4
	O0mA1bvPLABVvq+FAW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2tph-00000004HJV-0fgX;
	Sat, 05 Sep 2026 17:05:37 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2tpe-00000004HJ8-0JXV
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 17:05:36 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-396a51b2605so790269a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 05 Sep 2026 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788627930; x=1789232730; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lgfe+MC2Qpshqj28ePlzHxBw1FwK8wWPwaSdf9wxtGw=;
        b=bxvsyPNhGpKbU7vckZK/cHG586++W7eb8GciPIQl3xs+c8CezSN5VQ2mJorRco3EKB
         nCk+TIRrxLbD2BuUL+5gagNTUL10basw+m7s8HGT8Hz6dL1nVq7tu78QR8HkhDLW0sS7
         FunQ9cI+zBibQtb3fOEjlf2vtXmQFshQlKPNC7Z6x4dUlkw3ToYceG2anJlEgaffndYN
         hTOGZzMTdmtc8rraKtoZXmPQRMBeSwtMNaqjjL/4eivRDlWaEg3eMRBkvX/6Ry1dOb+I
         wxSZTnxZ3XHtDjC0cAQkEloPfHCSHIyyV+KwfPaLqo93Iz4N2Fkm0i4EJyG4Mibmp3tE
         mAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788627930; x=1789232730;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lgfe+MC2Qpshqj28ePlzHxBw1FwK8wWPwaSdf9wxtGw=;
        b=GYByuGzWeCXeDk6uTI5aig4ehkO2aRDaIRdxvPu/EfEMlV1NHZGPa4aCF+5SobWo5r
         0z+61Pe02Vp4+nxuE+cz1tdpMDeC7eZgAJX86xTS2e8LMeaN3ow26BVgJJrjuS/Tf7/r
         UvXMj1p/uAQXjzl954ltWy+PjAgZcZA7sX1/wNLs1MK1kIY8ob5kBqxkp+74XM+rb6C2
         YVbZT6LTRHPMGNiWfHArf9mWhPLv3IeW9kuTx5gOdRBibz/p5v8PiDhXxR8hiUGLe5DB
         +23k4zvOI2i0b+Bq5C7y8O1gLV5I1rH8CvxxDx6u1Sgr5gw+tjFfEgy7FDsXKyocNIbZ
         LLDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU87ZsI3FKn9n03asZ2IOzQQFVU9YBmfKvdqUk1Bk/13Np4Ud7q43mkYkdeXrM+b0AouPtgW86DFOouw==@lists.infradead.org
X-Gm-Message-State: AFuF++lUdc3Hlt2E/eXlSLenatjS5PTbUk0iTmTsXf36BJewO5vKMgTj
	geIyhr0hyrQi8C4wEA2KqHchYagqozlnU6c0ob6XQMQ/F7udfFrJKXes
X-Gm-Gg: AYBFou2dOldM0xFcxetR9IYJYsM5fD7mdwcaml7CSsplvaV2/9N3RQzc2hbSmrPB2Sj
	W4cWWWkmSI/yr0OS5jc/iMqqBqGrrQ2Shv7mqkx061Kq8U6JY2y/MiaEYxa8wlZqOy4BxGvraPS
	DbV8ywXTFQ+fOiYXHylkE4q1YG7jcwUQZpOWfhTh8a+oeXMAGQ4BG1jhzAMSsKCt3IVyiOKv7FQ
	PWKpbJO1Ie/l0OLTTRN4uDPzDwgTZgTu+O0Ub74rBLJbrDqn7SEFjFcbWrnZSJyXvpd2U4apmo3
	ep/btlrwiGJy8C6ffDhRx9F5yK4nEToTJD9OI4FmQZAZmc60/JOZIEXnq3C8TQyjw/bplcIT00a
	iiN5xkijRuGKbVtgkdLlf4BvGw1jxmxStEkvLGLlks5eysOJLcRjstGPW5bv5n2O5Z6Xb1JdYtW
	LnBLukA74A10wvE58nCH3Xq+Sbc70vQ7zGJcHSc4+l3BgxYU5zClvLZg+1chZlCN6dMYKcXpFA7
	ZZVbQXg
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr21841183637.26.1788627929852;
        Sat, 05 Sep 2026 10:05:29 -0700 (PDT)
Received: from [192.168.50.100] ([111.199.57.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4554770f6sm2092737a12.24.2026.09.05.10.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 10:05:29 -0700 (PDT)
Message-ID: <4e8e6f90-9731-4416-8b1a-be1cef12bb72@gmail.com>
Date: Sun, 6 Sep 2026 01:05:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for
 OrangePi
To: Chukun Pan <amadeus@jmu.edu.cn>, Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20260901080010.95040-1-amadeus@jmu.edu.cn>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260901080010.95040-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_100534_128667_01C28B95 
X-CRM114-Status: GOOD (  19.41  )
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

On 9/1/2026 4:00 PM, Chukun Pan wrote:
> Enable the i2c2 bus and add the connected GT24C02B EEPROM.
> 
> [   6.766] TlvInfo Header:
> [   6.766]    Id String:    TlvInfo
> [   6.769]    Version:      1
> [   6.772]    Total Length: 38
> [   6.775] TLV Name             Code Len Value
> [   6.779] -------------------- ---- --- -----
> [   6.783] Base MAC Address     0x24   6 .....
> [   6.788] MAC Addresses        0x2A   2 2
> [   6.792] Product Name         0x21  15 x1_orangepi-r2s
> [   6.797] Unknown              0x41   1  0x01
> [   6.801] CRC-32               0xFE   4 0xE5A74B18
> [   6.806] Checksum is valid.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> This patch depends on the following to avoid conflicts:
> https://lore.kernel.org/lkml/20260802100101.327815-1-amadeus@jmu.edu.cn/
> ---
>   .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 30 ++++++++++++++++++
>   .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 31 +++++++++++++++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index 2d1ba34cb00e..7125f2882ce8 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -13,6 +13,7 @@ / {
>   	compatible = "xunlong,orangepi-r2s", "spacemit,k1";
>   
>   	aliases {
> +		i2c2 = &i2c2;
>   		i2c8 = &i2c8;
>   		serial0 = &uart0;
>   		ethernet0 = &eth0;
> @@ -112,6 +113,35 @@ rgmii1: phy@1 {
>   	};
>   };
>   
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_0_cfg>;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +		size = <256>;
> +		read-only;
> +		vcc-supply = <&buck3_1v8>;
> +
> +		nvmem-layout {
> +			compatible = "onie,tlv-layout";
> +
> +			mac-address {
> +				#nvmem-cell-cells = <1>;
> +			};
> +
> +			num-macs {
> +			};
> +
> +			product-name {
> +			};
> +		};
> +	};
> +};
> +
>   &i2c8 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c8_cfg>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index f7547a4da71a..837616255464 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -17,6 +17,8 @@ aliases {
>   		serial0 = &uart0;
>   		ethernet0 = &eth0;
>   		ethernet1 = &eth1;
> +		i2c2 = &i2c2;
> +		i2c8 = &i2c8;
>   		mmc0 = &emmc;
>   		mmc1 = &sdhci0;
>   	};
> @@ -138,6 +140,35 @@ rgmii1: phy@1 {
>   	};
>   };
>   
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_0_cfg>;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +		size = <256>;
> +		read-only;
> +		vcc-supply = <&buck3_1v8>;
> +
> +		nvmem-layout {
> +			compatible = "onie,tlv-layout";
> +
> +			mac-address {
> +				#nvmem-cell-cells = <1>;
> +			};
> +
> +			num-macs {
> +			};
> +
> +			product-name {
> +			};
> +		};
> +	};
> +};
> +
>   &i2c8 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c8_cfg>;


Hi Chukun,

I have tested this patch on an OrangePi RV2 with a kernel built from
linux-next (next-20260904).

With the patch applied, the i2c2 bus comes up and a 24C02-compatible
EEPROM (256 bytes) is probed at 2-0050. Reading the raw contents via

     hexdump -C /sys/bus/nvmem/devices/2-00500/nvmem

shows a valid ONIE TlvInfo table, and the nvmem cells
(product-name, mac-address, num-macs, crc32) are properly exposed.
The Product Name field reads "x1_orangepi-rv2", which matches this
board.

Tested-by: Gong Shuai <gsh517025@gmail.com> # OrangePi-RV2


I also tested the MAC address wiring below on top of this patch, with
the nvmem-cells references added to eth0/eth1, eth0 picks up the base
MAC address stored in the EEPROM and eth1 gets the base + 1; both
addresses stay stable across reboots.


diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 837616255464..44b81268c802 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -93,6 +93,8 @@ &emmc {
};

&eth0 {
+   nvmem-cells = <&mac_address 0>;
+   nvmem-cell-names = "mac-address";
  phy-handle = <&rgmii0>;
  phy-mode = "rgmii-id";
  pinctrl-names = "default";
@@ -117,6 +119,8 @@ rgmii0: phy@1 {
};

&eth1 {
+   nvmem-cells = <&mac_address 1>;
+   nvmem-cell-names = "mac-address";
  phy-handle = <&rgmii1>;
  phy-mode = "rgmii-id";
  pinctrl-names = "default";
@@ -156,7 +160,7 @@ eeprom@50 {
	nvmem-layout {
	   compatible = "onie,tlv-layout";

-         mac-address {
+         mac_address: mac-address {
		  #nvmem-cell-cells = <1>;
	   };


But I am not sure whether this wiring should be part of this patch.
Without such wiring, the kernel falls back to random MAC addresses
on this board.

Best regards,
Shuai




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
