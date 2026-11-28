Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C3E606A323
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 17:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hYHz61a2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=n3Rb+4u3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cclrkbhGqgfveATQsCG/Hx+GZcEsZEHYiqGK5DYQB6c=; b=hYHz61a2lf3muu6Nw94VTeAt9X
	uJ+LZ4E2xC/EM05GdFCyh3Kx4Pqt/IcOb1RRlXria2JHri19xHKVj/z7Ee3YO/nLbCfHRjuUAuYNb
	SXtj84R4lA0zJW+7n8DOz+X87blXVZX7Ot80qlK4tIEESO8VEqIg57hr5JYgwNWglwI63ZQNmo8eN
	Fid7xdiqIUCpWmijcQI8KrOoUT0nvyAnuT5m1RlQnsZepciOrabjrKLil12QSs62rI2oTAiD5xE8q
	dfn3Qrh4f0jP12lElnYffCDWVEsCj37ysEiao+J30d7V+BwmtW/u6lVgc5WC3N3BYgUZuhB3QbfKq
	Ek7efxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM14-000000010TA-3nqa;
	Sat, 28 Nov 2026 17:15:14 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM11-000000010Si-0V08
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 17:15:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795886097; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NC2klko8jRLoHNet+utc/pJ7VOTIikmUThVKPCUUuw6VYSVBbkSoD2U8+g6yycJG7U/kJJle6/fxSJgDeZkYL9/dGA2IswgWPyx5F9qC0WSUPX/pz3EE27Kw4l6p2vX2bH42F76mGTurJKHFzcEDTTbJcj6GAVw8Wfe6+cMjWzY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795886097; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mxLdkY6vzsVozs32pWOO6o78TSdG6gnBKlks6tfg/FI=; 
	b=CdzcEpIsN5Wcwn1sL9gd/2PaWYgHaN9KfgWfk+oeQMgptXJFLomRR//ae8XWfXuqAo+gHsaJN98HKoH5YIQhHL5zPgygoigurKV0COuZQgdS/iYhrWpR7MsxG1a2gWRwbNRAVc26FXIFxHCohT8PInGztY2RrYa8AlTLiufl9e0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=n3Rb+4u3lNvXBbhrd3qnrekDgZyf9P/MtXD68fbi3LkmFsf3lo9Gd08NARHFbxSdjFDdMG8kQKzEOlR5kBxPzIBJv0F28l1s1P+z8ZxMT7S8d9wwshrqL6PIocf+YQdtv35Bf29709IE8kmsSTGVDDnt9ZH2Rm1lbgJObUof+fk=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=mxLdkY6vzsVozs32pWOO6o78TSdG6gnBKlks6tfg/FI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795886094973517.1431723157222;
	Sat, 28 Nov 2026 09:14:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Sun, 29 Nov 2026 01:14:37 +0800
Message-Id: <DN70HEN4EFL9.RHMQ0H4T77RG@pigmoral.tech>
Cc: <spacemit@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, "Chunyan Zhang" <zhang.lyra@gmail.com>,
 "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] riscv: dts: spacemit: k3: add USB3 port A (DRD)
 nodes
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Chunyan Zhang" <chunyan.zhang@linux.spacemit.com>, "Yixun Lan"
 <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.22.0
References: <20261105103125.2727341-1-chunyan.zhang@linux.spacemit.com>
In-Reply-To: <20261105103125.2727341-1-chunyan.zhang@linux.spacemit.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_091511_528771_0A6666FB 
X-CRM114-Status: GOOD (  20.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chunyan,

Thanks for your work, but I found an issue when testing this patch...

On Thu Nov 5, 2026 at 6:31 PM CST, Chunyan Zhang wrote:
> Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> of the K3 SoC.
>
> Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> yet, so the port runs at high-speed (maximum-speed = "high-speed").
>
> On the K3 Pico-ITX, Port A is a Type-C connector behind a FUSB301 CC
> controller, which is not described yet. Nothing configures the
> FUSB301, so the port relies on its power-on CC mode. Enable Port A
> with dr_mode = "peripheral"; it is device-only until the CC
> controller is described.

In my testing, this patch alone does not make the USB gadget work unless
I manually run the following command after the kernel has booted:

  devmem2 0xcad30040 w 0xA4080401

0xCAD30040 is a register in Port A's USB3 PHY. It seems that even when
using only USB2, the USB3 PHY registers still need to be configured,
so USB3 PHY driver support appears to be needed first for the gadget
to work properly.

>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
> ---
> Changes in v2:
> - Rebase onto v7.4-rc1.
> - Move phys/phy-names to the board dts, matching usb3b/c/d.
> - Add snps,dis_u3_susphy_quirk and snps,parkmode-disable-ss-quirk.
> - Note in the commit message that Port A is a Type-C port behind a
>   FUSB301 and is device-only until the CC controller is described.
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 12 ++++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 29 ++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index dda420900aa2..d0fbed23ccca 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -337,6 +337,18 @@ &usb2_phy {
>  	status = "okay";
>  };
>  
> +&usb3a {
> +	phys = <&usb3a_u2phy>;
> +	phy-names = "usb2-phy";
> +	maximum-speed = "high-speed";
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
> +&usb3a_u2phy {
> +	status = "okay";
> +};
> +
>  &usb3b {
>  	phys = <&usb3b_u2phy>;
>  	phy-names = "usb2-phy";
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index e89d2cc5ca8c..2d2569cfe676 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -687,6 +687,35 @@ gmac2_axi_setup: stmmac-axi-config {
>  			};
>  		};
>  
> +		usb3a: usb@cad00000 {
> +			compatible = "spacemit,k3-dwc3";
> +			reg = <0x0 0xcad00000 0x0 0x10000>;
> +			interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&saplic>;
> +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> +			clock-names = "usbdrd30";
> +			resets = <&syscon_apmu RESET_APMU_USB3_A_AHB>,
> +				 <&syscon_apmu RESET_APMU_USB3_A_VCC>,
> +				 <&syscon_apmu RESET_APMU_USB3_A_PHY>;
> +			reset-names = "ahb", "vcc", "phy";

I also tried booting through the BootROM's USB download mode (fastboot,
with USB worked as a gadget), so that the BootROM would initialize the
PHY registers needed for USB gadget operation. However, I found that
asserting RESET_APMU_USB3_A_AHB during the kernel driver's probe resets
the PHY register state, losing the configuration left by the BootROM.

Am I missing something? How did you test this?

Best regards,
Junhui Liu

> +			phy_type = "utmi";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis-tx-ipgap-linecheck-quirk;
> +			snps,parkmode-disable-ss-quirk;
> +			status = "disabled";
> +		};
> +
> +		usb3a_u2phy: phy@cad20000 {
> +			compatible = "spacemit,k3-usb2-phy";
> +			reg = <0x0 0xcad20000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		pdma: dma-controller@d4000000 {
>  			compatible = "spacemit,k3-pdma";
>  			reg = <0x0 0xd4000000 0x0 0x4000>;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
