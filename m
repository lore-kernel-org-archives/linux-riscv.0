Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A564EECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOHt6tSxEAZxtcduBHFGVBh54PxRp8ekmF5jpUSp7TA=; b=Bpr59JZ27PZnRG
	NGq2jPsJtik2iZCzGXD51Mg6QTyZW2zLLJlxspumvHFfV6PbQEMAYjzjz1Z0/2TX3VCmKZbEwOplU
	AmE/IeFhCHfBzFmOWavHHTma0kcz3RH/NqjxpL1v9fEiSdUHTnzMRYuFI02u11fOuwJ54d3XU33Mw
	fPv/ERMnIdkjQML1ihtpwKyLTIDO8HO6t1PFP4pNnIVrDSg9IeVHG+VDl++qrpp2yHtkSLBKsFO8J
	/0wnfVebHgOTtp0Rwg4ykG9WmBmFN5i96znG/6I20xl2BtCqA7HCYqzNT65w8ywDla9DtWndfM2PR
	yNhJfRlmntKjaRP8q4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSypk-00GINQ-1o; Tue, 30 Aug 2022 10:51:04 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSyjs-00GGM9-Ev
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 10:45:02 +0000
Received: from [167.98.27.226] (helo=[10.35.5.6])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1oSyjc-006Sy9-7N; Tue, 30 Aug 2022 11:44:44 +0100
Message-ID: <879a6823-6651-93cf-8500-661bedb050af@codethink.co.uk>
Date: Tue, 30 Aug 2022 11:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.1
Subject: Re: [PATCH v2 6/9] riscv: dts: microchip: icicle: update pci address
 properties
Content-Language: en-GB
To: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Shravan Chippa <shravan.chippa@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril Jean <Cyril.Jean@microchip.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Vattipalli Praveen <praveen.kumar@microchip.com>,
 Wolfgang Grandegger <wg@aries-embedded.de>,
 Hugh Breslin <hugh.breslin@microchip.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220830101803.1456180-1-conor.dooley@microchip.com>
 <20220830101803.1456180-7-conor.dooley@microchip.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220830101803.1456180-7-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_034500_559285_E2ECC307 
X-CRM114-Status: UNSURE (   8.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 30/08/2022 11:18, Conor Dooley wrote:
> For the v2022.09 reference design the PCI root port's data region has
> been moved to FIC1 from FIC0. This is a shorter path, allowing for
> higher clock rates and improved through-put. As a result, the address at
> which the PCIe's data region appears to the core complex has changed.
> The config region's address is unchanged.

Did this also fix the 32bit address apperture issue which plagued
getting pcie graphics cards sorted.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
