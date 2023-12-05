Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191F0C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lDfmjKcEe6mx9MsOFS1JuRvucrEJKMXumOgFho0X8hA=; b=moBZFsLyY4P47Z
	SlA2H2S+5tqdazwKXiJpHIuYrvqaJ52C8cImXCzLs0GVhl6kmwuHVYEGcLDX03IvUF5kyDL0LRQaw
	Q/2ZDJAH4z7Nf7B11jrpW0tpjOQ/YDAmWqeH59SPLhhBerNPZyBFy3p+lOOKKuJpGk4n/5/fkL1za
	w6u6vjR7rk+dUYRoTRnW6IQB1PxJjYLNSEHAvCARzJLx0qaGt2Ggcq0mXqqsCHnGrihAlMGdOEq8E
	osewW467XpHSi8arWAH8LxDG8LdQ+0dUmOFrRnu9yJ49AtKTtqxfPXVs/iElYV8erI7qEERUjlSC2
	bRbIz3Mc3MZKAwwlTSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYoT-007yo7-1H;
	Tue, 05 Dec 2023 17:02:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYoR-007ynC-0S
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 17:02:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C8169CE199D;
	Tue,  5 Dec 2023 17:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE16FC433C7;
	Tue,  5 Dec 2023 17:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701795740;
	bh=6eqzdlbd2wRbilXyM8br8k9jCk9NPFOASbrV1lTKof0=;
	h=Date:From:To:Subject:In-Reply-To:From;
	b=rrYEZ6mDeh47zil4efVVC3txYOSi3rtzc6BqQyBLELxK0D/OYbcop4/aMyi9qyW/f
	 8jxcOmxzxRzfvPxNByuPLgS/aZI8iJ7htUrK96g5D6/KFghAQTzPvMuAZaC0/E8RK+
	 I+bWsBKRNSQMZjLsUPpE4C8b+/FE38MZ6Jn9GaOBN5UvMt0qMIVarFGu/pQNUjIF+B
	 S4vlHyGARZ1IssLp0lh2IAZVHWHG8VhcQwlSjBucgsUhWjWrre/J6zG6A+2RGPwCoK
	 EHBa1CSNYQnFrXoZ/gtIChK7DVQBBFQiQKGJVn64K5xD7y78QFCWZjsl2OeozApwgS
	 qVGFWeFfjIScg==
Date: Tue, 5 Dec 2023 11:02:18 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v11 0/20] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Message-ID: <20231205170218.GA679691@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZW7q1LEvEpVxoI4l@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_090223_414561_1412025B 
X-CRM114-Status: GOOD (  11.87  )
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

On Tue, Dec 05, 2023 at 10:18:12AM +0100, Damian Tometzki wrote:
> > On Sat, Dec 02, 2023 at 09:17:24PM +0800, Minda Chen wrote:
> > > ...
> > > Please check this configuation.
> > > CONFIG_PHY_STARFIVE_JH7110_PCIE=y
> > > CONFIG_PINCTRL_STARFIVE_JH7110=y
> > > CONFIG_PINCTRL_STARFIVE_JH7110_SYS=y
> > > CONFIG_PINCTRL_STARFIVE_JH7110_AON=y
> ...

> Hello together,
> the main problemwas was  to find the rquired CONFIG_* options for StarFive
> Board. It would be great to have an CONFIG_ Options with all required
> Dependencies.

I didn't follow all the discussion here so I don't know all the
symptoms and what the resulting working config was, but it sounds like
the Kconfig needs to be simplified somehow so other users don't have
to repeat this struggle.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
