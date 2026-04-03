Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B792E8536F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEfv489d0ECgA+oSi62sedDG61HprOl63vCfU33HYnI=; b=rzMQtWvYutpw40
	vSex3JThtelFH3hnNByjG90cIBImrIMcEF7skuxI8n7uuILirBcpo3OmgeZznf8FRFtU3MxobseIl
	l0FtliJtRlLR4957lvUVmvoyWPOneM6JwouMUzNi+G3pyIxpK7VbNreGYFEhDxXPCZ2EydbTZnvef
	6PsFAziU/WkcbH02CVPVT8MIE/+NgOs4LOSl6brF3W58fVRuJ+MSBKTdiOvZsNiCgFnU62gtbHalh
	3C6ZVOccSP+Z3Y+UhfirgHfr9e2Cs5plwoZ95eiIzVHYaDvYRqOth+BK2ILBasIcDGZSu5R25swid
	b3N8o6lZ+JQg38WyGfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fKG-000000027pZ-2J0x;
	Fri, 03 Apr 2026 14:16:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fKF-000000027pS-0FRE
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 14:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04CA660123;
	Fri,  3 Apr 2026 14:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD0BC4CEF7;
	Fri,  3 Apr 2026 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775225801;
	bh=esXZWHWyLG1hbgPkvZiDA90BZY2WUDe0Kif7I3Jkhw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IutkozW33xu28g5tZHPr/jssuQ0RSfTxQ+TkgAsanRykcmHI1uhGU9Ro6hc9crnry
	 bCxi7I46rpkV4SHHfFk3ck4VQVjYbjkQdxGy1FygH9QJAKwwntdbqrKTn3fYkn0Ddo
	 1moZGShD2P+6+7EdUXxYI6dBXwfDeThAof7PdPa+8tfI1D+yi3Yybn6ejg3oXPnS4C
	 lviKVQp+nC7h1sN4jD4V4k89vYhz9W2zAQCHE6iYuIZOHn8H4nQ6uYziHLe4qKDbD0
	 pGl7mjdxlTUtHMdy76HT5O64iGFIIjxIfGTyzRnriysFkZrjiZ7qbzU1RvJ7I3RNK1
	 Uq0rUYStEqArQ==
Date: Fri, 3 Apr 2026 22:16:37 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: gaohan@iscas.ac.cn, alex@ghiti.fr, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, rabenda.cn@gmail.com,
	robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on
 OrangePi RV2
Message-ID: <20260403141637-GKA1042809@kernel.org>
References: <cfe646a5549a2b3fc8a4335c3ab4918599615369.1775148159.git.gaohan@iscas.ac.cn>
 <20260403095036.231761-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403095036.231761-1-amadeus@jmu.edu.cn>
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

Hi Chukun,

On 17:50 Fri 03 Apr     , Chukun Pan wrote:
> Hi,
> 
> > +	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "pcie_vcc3v3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> 
> I would like to maintain the same property order as the
> regulator below,
..
> and add vin-supply:
> 
I think Krzysztof will have objection on this, which isn't used by any
device, so not really useful, see similar comment for "reg_dc_in" here
https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org/


> ```
> 	pcie_vcc3v3: pcie-vcc3v3 {
please keep "regulator-" prefix, which is
 	pcie_vcc_3v3: regulator-pcie-vcc3v3 {

> 		compatible = "regulator-fixed";
> 		enable-active-high;
> 		gpios = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
> 		regulator-name = "pcie_vcc3v3";
> 		regulator-min-microvolt = <3300000>;
> 		regulator-max-microvolt = <3300000>;
> 		vin-supply = <&vcc_5v0>;
I'm not sure if there is any enforced rules on this? I can understand you
are trying to sort them in alphabet order.. but I would personally
prefer old way - in slightly logical order.. but I do have no strong
preference..

> 	};
> ```
> 
> > +&pcie1 {
> > +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> 
> > +&pcie2 {
> > +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> 
> I think vpcie3v3-supply is not needed here. [1]
You right, can you send a patch to fix the same issue in tree?
I was trying to fix vpcie3v3 warning, but realized not fixed all..

> 
> > +	hub_2_0: hub@1 {
> > +		compatible = "usb5e3,610";
> > +		reg = <0x1>;
> > +		peer-hub = <&hub_3_0>;
> > +		vdd-supply = <&vcc5v0_usb30>;
> 
> vdd-supply = <&vcc_5v0>;
right, I agree
> 
> Please refer to the schematic. [2]
> 
> [1] https://lore.kernel.org/linux-pci/u53qfrubgrcamiz35ox6lcdpp5bbzfwcsic466z5r6yyx6xz3n@c64nw2pegtfe/
> [2] https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR
> 
> Thanks,
> Chukun

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
