Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FF0FEC11B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rh+ZEAZz6oIB8DuPtf/o5araod66Tj8oGg6WaGNVj3s=; b=fjlaulfIF9tuCt
	7O1eUDs58lWxnedJ6/dS29Z4z0qCWuI6aF1wzuKE1LOwOQMCmNZlYe9NvUN/ob1xpbrLioUmSgYwb
	r3kFq4WBnnuG1S9x+I2cY5O7cIC59t0GMhiixOPstezOEaWq0/OKwpWzSI4kgGIyDdYnppZ6dKSMb
	lxSANaJxaXeOannbe8CyN5qmwTPYqgyjYmR0xqQPmK8Hr9xTaOJIBdMB8Xu5GL+qr3d7hx99+P0Tb
	wiPoAKA8vZQZb14PnBFOXokDHdDBmsO4irf+e7fvimQFMHpvo/DvcRJ+0QxhRQLqO8DYGbT7rrvfs
	L1BL1a4gSnj/Mr7X6HIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LhU-00000003AtU-3UiY;
	Wed, 25 Mar 2026 10:43:00 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LhQ-00000003Aqy-1ljt
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 10:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774435316;
	bh=5h9Gm4hE034FUJ+tLsF/4KbhVSlEW2L6viFtWACnUaA=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=FX1nOJErc/4O648Y8jKsufMDQB9W2Pd7Aom7hNDbHNpYS74tKjxRkoY1Brk5yStBj
	 ZWGbUF7FZHsBENwf7pyDmQYtm8Sfe/sm3ZR2Mp+MDeEHwSLDfXcjLiDIO2jJi4iGWd
	 wcgL7n/g/C2fXwIUDbWEZbHscjAlikpaeuiKCX9w=
X-QQ-mid: zesmtpgz5t1774435308te51a1058
X-QQ-Originating-IP: 5V2fvYPK8sKaEEHdU11yJxTASq+yaMttfYnhxI/4Q00=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Mar 2026 18:41:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2505999498786661497
EX-QQ-RecipientCnt: 15
Mime-Version: 1.0
Date: Wed, 25 Mar 2026 18:41:45 +0800
Message-Id: <DHBSTI0A3SOW.PCIP544HUYP4@linux.spacemit.com>
Cc: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] dts: riscv: spacemit: k3: Add i2c nodes
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-2-78f29c83d9ac@kernel.org>
In-Reply-To: <20260325-02-k3-i2c-v1-2-78f29c83d9ac@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MWUV83kUVZmkTcPZvQnJVXADEVzzRBCYGyLUwXlURTVAtdU0D8mgKNaC
	lXqkyar3qafbBxPn+FwWNzJg6+QPoHhVyJWTyxZP7iPtP1KG+3S0kIXV7wCySD5RHDh4W57
	9y/l7RKZaM6G/rpQxXdQjn2MAMrxoT9CScSotTe4XiMXUpRJPAfyAzuivTAhNwC9sjmf+IO
	54RNaE8MH6yRGSoseBV2pdh3NJjhTOjJLEpEo/U+q3wvzOt82bxHIfuRKjzlU32ZBoc3ixD
	nT543/HUz3A9qR+VFN8sFLFAsVVjuoSlXrRvYmpzZAK7yoPhChsaYf8qpQbRrKBR3cGf7Dc
	db2v8jVL4jl0ycqHeTH5oV7iGyhzz3zY2JV/CWR1HHZYdrZkmab70gKamlapxNdIIKBXu+h
	GEJ35Tkzd2CV3CpaINQhRXwn+0lRjC46n5acfAlFfnZ0Mawsl5MfWXGYlL0g1HWGhphyzhc
	a42oCfonWnf6b9Zq2dbw1hSRr2rij+of3qgDpsScBh9t/QDGnotOWHLVjK682gRuvUR1Ume
	uBBB1R5TbVUd9K+ySdkUV8u2ytfBxPTbHLXFEV/QybwRzjcUaswaA2bA+fwRYyJ+I8EgJLc
	pD72xfqhE76QEOBK+ibJGU4zJZPIzQoO7BNuV31DlEOJqz8eWvnLaQHRfT+2WwGk5UeBtr0
	yYphnNKfoyfsD2lAP4giqwYcwCQeW8RJg4lot+9bftG33nkm6ftmkb8h8Cw9UIl04g1aLAU
	Jp6XJQSfT2qBSss4rSW72c10qcyTQbbZMg3HHz7uyjHfLVtVQCELrXuEqcWlfToPQTJ7xBX
	e2CiGd80pK/Kq2CN/ok9oSqupH7GzrOBYnRTYLOPh+GyO0XsAFBGap7zNP5MH3Psv1gztXm
	taph+h0wfkjaOeMzbzlmui+Ku9vroS8UPx9Z0DWRsz090JwI2sr/NN+HhBRBbRsH6BpTZJj
	GBU5q+bT1WKf2tAZDN9m9YdnHoyJUWbWQnvWg2a2vQDYZ6oSbBFH7g920bMbQY/vMuKY57+
	yfs7769J7w6oghvYYJWTq+CQobI09A/nNUMNxTj4E1AtXf9+YKCuf38x41fTA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_034258_425204_CB1B48FB 
X-CRM114-Status: GOOD (  10.13  )
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

On Wed Mar 25, 2026 at 5:49 PM CST, Yixun Lan wrote:
> Populate all I2C devicetree nodes for SpacemiT K3 SoC.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 98 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index a3a8ceddabec..cab72591b7f1 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -438,6 +438,76 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		i2c0: i2c@d4010800 {
> +			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
> +			reg = <0x0 0xd4010800 0x0 0x38>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&syscon_apbc CLK_APBC_TWSI0>,
> +				 <&syscon_apbc CLK_APBC_TWSI0_BUS>;
> +			clock-names = "func", "bus";
> +			clock-frequency = <400000>;
> +			resets = <&syscon_apbc RESET_APBC_TWSI0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@d4011000 {
> +			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
> +			reg = <0x0 0xd4011000 0x0 0x38>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&syscon_apbc CLK_APBC_TWSI1>,
> +				 <&syscon_apbc CLK_APBC_TWSI1_BUS>;
> +			clock-names = "func", "bus";
> +			clock-frequency = <400000>;
> +			resets = <&syscon_apbc RESET_APBC_TWSI1>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@d4012000 {
> +			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
> +			reg = <0x0 0xd4012000 0x0 0x38>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&syscon_apbc CLK_APBC_TWSI2>,
> +				 <&syscon_apbc CLK_APBC_TWSI2_BUS>;
> +			clock-names = "func", "bus";
> +			clock-frequency = <400000>;
> +			resets = <&syscon_apbc RESET_APBC_TWSI2>;
> +			status = "disabled";
> +		};
I think we should add a comment here to explain why there isn't i2c3.
Otherwise, LGTM.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
