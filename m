Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ED8CD5BB1
	for <linux-riscv@archiver.kernel.org>; Sat, 23 May 2026 11:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvMMiHi0MLgIGLagrcKRSRbye2kF769sMFRhfYKYFQ0=; b=dTEjwroiidABar
	IzwMWOAvfqOINcrDYxqbr9kd0uQ2uJKlVQeFEg4erjbcfG2NkhWUOhZHejglcgVD6y7hYlXqj2toH
	/nz6bkpBWPlRYDp9myOJTIHtpOSJo4MWaZzcAyJKfQoxlnckmqj/7XztvgQUPL8BrvCC7OXvkUbPD
	6zDXC/vZvwsCU0Hsa65vS4usHosaIe8zJV8uUTuLUasloOSHGMfFDuVE5lytcF/bDTafO0ZPOQC32
	lT9hp0Lu5fhNgCsVR3G1Rry9XnYRqLMV2g4rQo3xCVCdluijBOzI6ueWQAW5/baXQCc4pGNHutPtE
	NMF6BgmA+UgupTs4Rgbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQkdN-0000000DABn-1V3N;
	Sat, 23 May 2026 11:35:13 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQkdK-0000000DAB8-14Y5
	for linux-riscv@lists.infradead.org;
	Sat, 23 May 2026 11:35:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779536100; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KSzNKYuaa3e5J0d/DeX783yiDZ/NWeJPP/+Z0y/tlwWr1lDVevfIk8Ozo/8/qlzJCdCfTu2n36rGw3+Ggda7yq1liMhrUG9GY3VupqvNJ0PMze5wxmhCMVe10W/iiu28VBTFVB7isyoRUiOFla5A6koPvDr1SHuoQKFgkLGMdOI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779536100; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RZDnaCsGlJVcUOKkn0LRGIu9RjSAcTOtBk9/WDFjI7Q=; 
	b=foGzF455x/cc4KvIT51DKucrW3ls6kPNh/XySDe+aWsw2jc8X+9z/CX05khi3gz7pOxsqqzePtu1anV51EGAlD+Nfu0g6QsI7JEAqfs+DjOkcXWbfjgUVN9VgndLXa8dbhGdQtrjwEOQMiAtQyg+Sh6O3moGPVj3zjAjsoDgqpw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779536100;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:To:To:Cc:Cc:Subject:Subject:From:From:References:In-Reply-To:Reply-To;
	bh=RZDnaCsGlJVcUOKkn0LRGIu9RjSAcTOtBk9/WDFjI7Q=;
	b=nX4hMzv0OnrUIn2pzrseG8O/TYO5+1XuS1pjAP9FHYYTWIwAiMDuRVsmsLR61uvW
	pj4SPW8HpPNKolM92Sey9VAcqKFKwIToZbPevzF2XDVjwYSCjTeP6/GFfkla0Dx0X5U
	s/g8QgmLFRSVNM7dDQiND6S7BuYQizdOjkklTdR4=
Received: by mx.zohomail.com with SMTPS id 1779536097814357.8361509975906;
	Sat, 23 May 2026 04:34:57 -0700 (PDT)
Mime-Version: 1.0
Date: Sat, 23 May 2026 19:34:40 +0800
Message-Id: <DIQ0W5OTB6DK.17PPFYJ2J5XS9@pigmoral.tech>
To: "Junhui Liu" <junhui.liu@pigmoral.tech>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan" <dlan@kernel.org>, "Vivian
 Wang" <wangruikang@iscas.ac.cn>, "Paolo Abeni" <pabeni@redhat.com>,
 "Guodong Xu" <guodong@riscstar.com>, "Yangyu Chen" <cyy@cyyself.name>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO
 board
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0
References: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
 <20260522-bpi-cm6-v1-3-707ef1917a30@pigmoral.tech>
In-Reply-To: <20260522-bpi-cm6-v1-3-707ef1917a30@pigmoral.tech>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_043510_655014_F61F1761 
X-CRM114-Status: GOOD (  14.44  )
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

On Fri May 22, 2026 at 6:01 PM CST, Junhui Liu wrote:
> The Banana Pi BPI-CM6 IO board combines the BPI-CM6 compute module with
> an IO carrier board. The core module integrates the SpacemiT K1 SoC,
> PMIC, DDR, eMMC, the eth0 PHY, and wireless connectivity. The companion
> IO carrier board extends it by providing the eth1 PHY and exposing
> standard interfaces, including dual Gigabit Ethernet, MicroSD, two USB-A
> ports, a USB Type-C port, two PCIe M.2 slots, and a serial console.
>
> The board also has two I2C EEPROMs. One is on the core module, which
> stores factory manufacturing data and is marked read-only. The other is
> on the carrier board, which is shipped unprogrammed and left writable
> for evaluation purposes.
>
> Add initial support for UART console, eMMC, SD card, I2C, EEPROMs,
> PCIe, USB, and dual Ethernet interfaces.
>
> Link: https://docs.banana-pi.org/en/BPI-CM6/BananaPi_BPI-CM6
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/spacemit/Makefile              |   1 +
>  .../riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts | 215 +++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi  | 227 +++++++++++++++++++++
>  3 files changed, 443 insertions(+)
>

[...]

> +
> +&pcie1_port {
> +	phys = <&pcie1_phy>;
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> +};
> +
> +&pcie1 {
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;

Thanks for the reminder from Sashiko AI.

The vpcie3v3-supply property should be removed from the PCIe host
controller node here. According to the binding, this supply belongs to
the PCIe root port child node.

I have checked the driver side: devm_regulator_get_enable() eventually
calls of_get_regulator(), which first looks up the supply in the current
device node and then falls back to searching child nodes if it is not
found there. I also verified on hardware that keeping vpcie3v3-supply
only in the port node still lets the driver resolve the regulator
correctly.

So I will drop the duplicate vpcie3v3-supply property here in the next
version.

> +	status = "okay";
> +};
> +
> +&pcie2_phy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie2_4_cfg>;
> +	status = "okay";
> +};
> +
> +&pcie2_port {
> +	phys = <&pcie2_phy>;
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> +};
> +
> +&pcie2 {
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;

Same here.

> +	status = "okay";
> +};
> +

[...]

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
