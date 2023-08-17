Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F184C3065B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 15:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snOzQukbz2boSCiCFuI8cRQCgq7GsNodDoQpkQ7/5WQ=; b=dpllOSAmrTlxn+
	/ZKv7ajAJWme2fmGkJAFyNfTpme1ub9V3LcdU2/lExwhtV50mGAqAullkVaQT5Qx+bJmqo9AKXYe4
	W9pduZdijxNWEUZg6rJZ8EB7fv6fMVuXxwAWETISAMQ6K7McKZAVUwK4QGKB/mwjcrvsRuMAAUKL4
	VfysMthH7Q4qbwljMLfJULC/PliImCnZsmUG8+mWCCUhizIb/Vd1+ybc1/r2YJPt7lToLo/hWKenU
	EQdc021D+sVNXUL2mRWBXmvOkhaNsA9HOh4qjdkZzn89gZYXK6qiA6FaE/XQd9G92eq0bvO0ZFISo
	R55JQKwlEwVPQsHsiyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWf7C-006hdk-2q;
	Thu, 17 Aug 2023 15:40:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWf79-006hdP-2B
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 15:40:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26615615D7;
	Thu, 17 Aug 2023 15:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7971DC433C7;
	Thu, 17 Aug 2023 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692286846;
	bh=pRxsif8JlKAfLdB+T3fZbbIPVAzSOFHuTHn7rX4RoCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l2U5bSFfaCme7/htqAE8HVLKhvoYU3uG8Ad18CUyTuFe2UB+1oS4/cxLXDXhT5/r1
	 VIQGH0tiY59nii3muBz8mp4fwX07Gkmp/7LYZcA378c2/I3s8zDtzmpbh0dfjmF4TF
	 /RPNHHmE1aorPjscN47GlNUm+h97rE5aNO4grTyed5a3eatGRo4JnRCNumivOnvR8V
	 GDoXofYoqDUyh4sc6A6tRxXUAn2ChJjFTiIoThukqm6W7hUB39yr1oLXpQZdAn1vkh
	 hJ1Moww2mLezp7Teu0pPdoXFf/CsXtuRrK963zZMpO3+JQgwS9o6pAlb6xSzpuz+Gk
	 sOvu3T7arDXBg==
Received: (nullmailer pid 1138046 invoked by uid 1000);
	Thu, 17 Aug 2023 15:40:43 -0000
Date: Thu, 17 Aug 2023 10:40:43 -0500
From: Rob Herring <robh@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, linux-riscv@lists.infradead.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Kevin Xie <kevin.xie@starfivetech.com>, Daire McNamara <daire.mcnamara@microchip.com>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: PCI: Add PLDA XpressRICH PCIe host
 common properties
Message-ID: <169228684231.1137777.15649817865540406129.robh@kernel.org>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-2-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814082016.104181-2-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_084047_755903_4498F269 
X-CRM114-Status: UNSURE (   9.61  )
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


On Mon, 14 Aug 2023 16:20:06 +0800, Minda Chen wrote:
> Add PLDA XpressRICH PCIe host common properties dt-binding doc.
> Microchip PolarFire PCIe host using PLDA IP.
> Move common properties from Microchip PolarFire PCIe host
> to PLDA files.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pci/microchip,pcie-host.yaml     | 55 +-------------
>  .../pci/plda,xpressrich3-axi-common.yaml      | 75 +++++++++++++++++++
>  2 files changed, 76 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/plda,xpressrich3-axi-common.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
