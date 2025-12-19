Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEBED767E2
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 11:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVc77uF3nc8KTX8AZznEmreN4KlmLKfeHP7OKj3+71s=; b=qTkE/wCHCDz8E7
	gPgG4lQ+bALM2hCl6f6/6z3aODA0a57R5+FcsUI1P8v0zokEcrNXSHvzVAI2K1SM5gWnxdLjgvWp5
	4Ge35hChhM5P1kd89KPy2HvvzWiQQo2ORH7e5aUj3VmwiwtACbnoYwySPgHqyhhhNu9zznG9C7gzU
	IAjOJ9ybh2G5IKgax/p2cHdWo4bMlvmlp2X3mjy93FAZBMlSRG4BNcyEwyyTL0Yn6k91F5BunJNGV
	mj/fAE/wgiN5wt//KM1WJB3YAzs001sINYVTsx77YfwTY+RiW7QtJBLwwE2q62jO5jH+eGsvkoJ3Z
	pelBuvjuS6YfNEnVHRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYpd-0000000ACbI-1fj4;
	Fri, 19 Dec 2025 11:39:37 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYpb-0000000ACaT-0bLb
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 11:39:36 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 31EB2340E1E;
	Fri, 19 Dec 2025 11:39:31 +0000 (UTC)
Date: Fri, 19 Dec 2025 19:39:25 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add PMIC and regulators
 constraints for Milk-V Jupiter
Message-ID: <20251219113925-GYA1958363@gentoo.org>
References: <20251206134532.1741648-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251206134532.1741648-1-javierm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_033935_207360_DDFAEB83 
X-CRM114-Status: GOOD (  12.89  )
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


On 14:44 Sat 06 Dec     , Javier Martinez Canillas wrote:
> Hello,
> 
> This patch series enables the i2c8 adapter, the PMIC, and voltage regulators
> for the Milk-V Jupiter board.
> 
> The power management hardware design on the Milk-V Jupiter is identical to the
> Banana Pi BPI-F3, so the DT Nodes were copied from the k1-bananapi-f3.dts file.
> 
> I have verified the I2C address and regulator constraints against the vendor's
> downstream DTS to ensure accuracy. I have also dumped the regulator_summary
> debugfs entry to check that the regulators and constraints are registered:
> 
> $ cat /sys/kernel/debug/regulator/regulator_summary
>  regulator                      use open bypass  opmode voltage current     min     max
> ---------------------------------------------------------------------------------------
>  regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
>  dc_in_12v                        2    1      0 unknown 12000mV     0mA 12000mV 12000mV
>     vcc_4v                        7   10      0 unknown  4000mV     0mA  4000mV  4000mV
>        buck1                      1    0      0 unknown  1050mV     0mA   500mV  3425mV
>        buck2                      1    0      0 unknown   900mV     0mA   500mV  3425mV
>        buck3                      1    0      0 unknown  1800mV     0mA   500mV  1800mV
>        buck4                      1    0      0 unknown  3300mV     0mA   500mV  3300mV
>        buck5                      3    7      0 unknown  2100mV     0mA   500mV  3425mV
>           dldo1                   0    0      0 unknown  1200mV     0mA   500mV  3125mV
>           dldo2                   0    0      0 unknown   500mV     0mA   500mV  3125mV
>           dldo3                   0    0      0 unknown   500mV     0mA   500mV  3125mV
>           dldo4                   1    0      0 unknown  1800mV     0mA   500mV  3125mV
>           dldo5                   0    0      0 unknown   500mV     0mA   500mV  3125mV
>           dldo6                   1    0      0 unknown  1800mV     0mA   500mV  3125mV
>           dldo7                   0    0      0 unknown   500mV     0mA   500mV  3125mV
>        buck6                      1    0      0 unknown  1100mV     0mA   500mV  3425mV
>        aldo1                      0    0      0 unknown  1800mV     0mA   500mV  3125mV
>        aldo2                      0    0      0 unknown   500mV     0mA   500mV  3125mV
>        aldo3                      0    0      0 unknown   500mV     0mA   500mV  3125mV
>        aldo4                      0    0      0 unknown   500mV     0mA   500mV  3125mV
> 
> Best regards,
> Javier
> 
> 
> Javier Martinez Canillas (3):
>   riscv: dts: spacemit: Enable i2c8 adapter for Milk-V Jupiter
>   riscv: dts: spacemit: Define fixed regulators for Milk-V Jupiter
>   riscv: dts: spacemit: Define the P1 PMIC regulators for Milk-V Jupiter
> 
>  .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
> 
The series looks good, I will queue it, thanks

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
