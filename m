Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B540FC3065A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 15:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLagNNIdS4K3hOpwtwVpI2s9f3gKaGVlU2xnqzZiB/k=; b=pS3VoWU8Sxy5Nu
	VmtrGYeB0cbxDfmwKg48yiX1HHHx4++v3rEidvM7PPlZsmyZOkb81AdSx0mhAvgwgdOwoCGqVtoMY
	It9vcgmnJi3i8KUBt7BFiCENUupJDc0UPtVF9/zAadrT5f53/DFKasPqIiArqBsogNpzvzVchZB28
	IcEzgkq9D3rbIcQSNqlLryqPj3phC9AegIdpUvTEjPpCwjY8MqeQeQgWhQ1b0q4xewYgmmXHcfolG
	wGyBi2syZ1WJ6qWoZpZ2SrBRQeyhlX2by2ez5QMzNp+BctC65uV74UKoKM4SiRYVhDHmR+j+U93I8
	vNEHlJky9g1Iz6d3RS9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWf7Q-006hg6-2U;
	Thu, 17 Aug 2023 15:41:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWf7O-006her-0K
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 15:41:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 980D2615D7;
	Thu, 17 Aug 2023 15:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E354CC433C8;
	Thu, 17 Aug 2023 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692286861;
	bh=18AW8aCpKWfO2c6tMGdoqGVFmQfyQI0jgGVvrDkG5kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jt176z36Jy+9PRJ4BevwMHGC4aCdaGehM1YRljgK7vDqSkB6eZ9T5CIoNCFZZaZo9
	 r1hAMtJ7xbGz7P4f9dKLj6kemFSzPT5OU9vRvjoJkGAsztoV54NSUJH1icpNSh7Mv5
	 oN9Zmh3cpXiGuciORDfuvUoaNarLjHdhX81VaYHbHsPQmI/D/9UrpCbEQeclcuVpty
	 kbpc2KyV7QcEaZR25PJZi8agQ9yVAZ0r2ZikGPKGfO5OrvtjLt4QO4Q+Y2T3IShLfj
	 mU4pfxqs+pL7uw99e2hqdh6jJlfOS+7VTSz2REZkrkJfg1/FIgv562E76ABJ4nM31L
	 JV78O0LKzi/+Q==
Received: (nullmailer pid 1140695 invoked by uid 1000);
	Thu, 17 Aug 2023 15:40:57 -0000
Date: Thu, 17 Aug 2023 10:40:57 -0500
From: Rob Herring <robh@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-pci@vger.kernel.org, Kevin Xie <kevin.xie@starfivetech.com>, linux-riscv@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Mason Huo <mason.huo@starfivetech.com>, Conor Dooley <conor@kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 09/11] dt-bindings: PCI: Add StarFive JH7110 PCIe
 controller
Message-ID: <169228685644.1140409.12427674208274594176.robh@kernel.org>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-10-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814082016.104181-10-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_084102_188032_4DD3771F 
X-CRM114-Status: UNSURE (   8.92  )
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


On Mon, 14 Aug 2023 16:20:14 +0800, Minda Chen wrote:
> Add StarFive JH7110 SoC PCIe controller dt-bindings.
> JH7110 using PLDA XpressRICH PCIe host controller IP.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../bindings/pci/starfive,jh7110-pcie.yaml    | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
