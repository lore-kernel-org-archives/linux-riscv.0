Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273B7C54F52
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWc8b5nh5WY3T/ChI2IrYAw4zUizMJcY4RCn9GuHKAg=; b=3Lo/FbRRiuHLxx
	NvvJCfTQ6pDvNekgLHd1pdeo6v0eaSot1a4ofc6wAPDvpYl8CYT/UH7tEZvx+FBL5xpO2KelSMnZ0
	bunnijdOhev0frBv99mPeu2ErVc2AMszzddJclATpn+hTJZffVqVj0/Q9gjAE5VSD85YI7Z0RFeSV
	v4vPgC4B6qec0RulDpb1nMRlKpLYpx+hB4zd5poTNrKUliOZZVOab0WdFw3B+uwtlnYRqJJuzLJa8
	d9moHeEBXktcsQn+vmyIcGKGo0wA8Patw0E64IyjI3xeNkEF6WSoigSRT3PWOWVzS1ihBvrph74e3
	oHuXUXUGEFcJXs5Ne0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotFW-00000006cUV-0zDV;
	Wed, 29 Jul 2026 01:38:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotFV-00000006cUP-10n2
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:38:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AA6360A6C;
	Wed, 29 Jul 2026 01:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9750F1F000E9;
	Wed, 29 Jul 2026 01:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785289100;
	bh=BRBw5mkstOYAXEr0e2N2HIMEW5e9mnlMD5LgLX++0HE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D6RhXarUTxl11IJnNeA2w++BJ6tMaQ4Aqoa/+UM+0zOC6o5BmOVsG9WcJuZIHlqqO
	 qgi7bohtVF3qJklGf4WAPrP/fw24lAEo03xZYnTOKMX5NnTTLQ1PzB/FSn86pkJaNJ
	 QVt1p/UzzuamE8Z21tA4jfa8VBUEQls9+Rpxof/YsxCnWbFuvCHnqhRDfhoRJ4/wAx
	 QChkPGwCj7a13JY677AjjqM6UFzTrGQqa1yUbao8XCcpKb+VSpw4JWgZdfS9uXkMRd
	 JMTbha7fqt5R9k3gAPLUWQ579CgTeURsuSfAhJiUh5LEsYSVze+nDR64KuMgX31SRc
	 KKWMEzWArwmsA==
Date: Wed, 29 Jul 2026 01:38:18 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Make dtschema recognize the
 etherent PHY correctly on K3 com260 board
Message-ID: <20260729013818-GKE77474@kernel.org>
References: <20260729012418.154652-1-inochiama@gmail.com>
 <20260729012418.154652-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729012418.154652-2-inochiama@gmail.com>
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


On 09:24 Wed 29 Jul     , Inochi Amaoto wrote:
> Since the previous commit does not change the phy node name,
> the dtschema can not recognize the type of the ethernet phy,
> so the following error is produced:
> 
> /arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> /arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', '
> reset-deassert-us', 'reset-gpios' were unexpected)
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> 
> Change the nodename to make the dtschema can recognize the right
> PHY type.
> 
> Fixes: 9db839d52ccd ("riscv: dts: spacemit: Fix phy id check for the phy on com260 board")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Also, with my R-B
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
