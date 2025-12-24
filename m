Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B35CE7545C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1i8mulOWxtRnJR6jTD4MD8+wx6lDa4frW4hCKZiAhk=; b=vMTSuXWLJpifI0
	Y0xOmSdpqHNQPwh3xmRLDEpIbWppYXUQlxQG4MPdX1bfS+UBBwCLdQQpLAAxi9HexQodqnQd9aL3c
	PDJBLLwTukVzbNoMbYayRg31gc42t4ZUqLWj4vs2MhqRqT85bWuuR+UNBkWr9HoaNmfBJJpgAZ19b
	O3tsOhmpufb1wKCUfSw1XnJFO1XTfbM91RLbD2l7fYdoJCFh5GALp9LDTSxylEK/vIuMDk8iDamo9
	6e8H9y9dRAy37YbN0q/OjUpExSMwoeqft8vr6W7qKyO5wK2pHdVUG84CejHvc8bEEbd3A3QNO7F6A
	2HKX5ms5gwF9BV6uSutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPPh-0000000Gx5k-1Cn6;
	Wed, 24 Dec 2025 14:00:29 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPPd-0000000Gx4i-2Rm5
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 14:00:28 +0000
Received: from localhost.localdomain (unknown [116.25.94.210])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2e6fc526a;
	Wed, 24 Dec 2025 22:00:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: michael.opdenacker@rootcommit.com
Cc: dan.carpenter@linaro.org,
	dlan@gentoo.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Date: Wed, 24 Dec 2025 22:00:09 +0800
Message-Id: <20251224140009.684392-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
References: <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
MIME-Version: 1.0
X-HM-Tid: 0a9b50a913cc03a2kunm6c6d6a6128a5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkIeVhpLTkNITk8fHkgfTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSUpLWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_060025_829638_11606D23 
X-CRM114-Status: UNSURE (   5.92  )
X-CRM114-Notice: Please train this message.
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

Hi,

> +	reg_dc_in: dc-in-12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_12v";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

This does not match the schematic. (vcc_5v0 instead of dc-in-12v)
https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR

> +
> +	reg_vcc_4v: vcc-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_4v";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&reg_dc_in>;
> +	};

It is also missing the regulator prefix.
So it should look like this:

```
	vcc_5v0: regulator-vcc-5v0 {
		compatible = "regulator-fixed";
		regulator-name = "vcc_5v0";
		regulator-always-on;
		regulator-boot-on;
		regulator-min-microvolt = <5000000>;
		regulator-max-microvolt = <5000000>;
	};

	vcc4v0: regulator-vcc4v0 {
		compatible = "regulator-fixed";
		regulator-name = "vcc4v0";
		regulator-always-on;
		regulator-boot-on;
		regulator-min-microvolt = <4000000>;
		regulator-max-microvolt = <4000000>;
		vin-supply = <&vcc_5v0>;
	};
```

> +&i2c2 {
> +	pinctrl-0 = <&i2c2_0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */

vcc-supply should be placed after size.

> +		pagesize = <16>;
> +		read-only;
> +		size = <256>;
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
> +			serial-number {
> +			};

From vendor uboot:

=> tlv_eeprom 
TLV: 0
[   6.991] TlvInfo Header:
[   6.992]    Id String:    TlvInfo
[   6.995]    Version:      1
[   6.997]    Total Length: 38
[   7.000] TLV Name             Code Len Value
[   7.004] -------------------- ---- --- -----
[   7.009] Base MAC Address     0x24   6 xxxxx
[   7.014] MAC Addresses        0x2A   2 2
[   7.018] Unknown              0x41   1  0x01
[   7.022] Product Name         0x21  15 x1_orangepi-rv2
[   7.027] CRC-32               0xFE   4 0x...
[   7.031] Checksum is valid.

There is no serial-number (0x23) in the EEPROM.
Does "product-name" need to be described here?

> +		};
> +	};

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
