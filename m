Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7061E64002
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MiJ4K5ytohS9uyu7mYafb5abgZs+ALxwNcfYV+J6oJc=; b=gV22FiWX7TCfgO
	RbmMuqAJeSDJBJXih21+VRuUXxxUwZCwo0xOlB05VfBfri6C061jC8yLFTQedNrLNRrKKOorqAxvu
	9FEtulGttIrzV1fB1p/bTrH3u9dzehjH1wMDlszRlVhdl/Yt8H0EpP7LznWhiVnQor0Bve7g3z0pF
	rczHl4YRk4Ue+QWUmwNt8fa160nnXw2R/2AQUzc0KtJfuIZYLk3Rhq5wE1AdoZXCOZbTNG3Y3otgv
	rF6tjKgV8NkdDgw0WuzsBv41T1w2h8KvkXrSVA5vwERHXpmSIUZOHE9VGxVl1s8BrGrLgxru/rVLV
	dAjm0Bt5/sqk0Yprgo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9HkS-000000041Z2-0TTm;
	Sun, 05 Apr 2026 07:18:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9HkQ-000000041Yb-1wy7
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 07:18:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5DA160018;
	Sun,  5 Apr 2026 07:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23BFC116C6;
	Sun,  5 Apr 2026 07:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775373497;
	bh=anSaiWX7cVtfquctI4JqwVS84SkW1qwqzSFgSaqpjC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qZXIXPVoZG+PM3PJKipM749jxpJeAdGu235QSI1Ag1J0T7Z9QRA5EwL4oAD0PSPdc
	 kqHJA6OrPt5bVPmLHfUsOhGOFXdXUU3kHLtqN5jFkcpu+POmxP31C6Uy512FWP6mZD
	 4I+2835O0C8o+SmuN/TBGyogWP4YdPc+CtyJKke8n98ozWMZ/IzmZkBj8P0Ds2goOo
	 F2PxV7eqXNrdQk3lFjj0+GOdPCi8xXGFYn1CprRLH7p1HMAHhP4/ZbuEp2if4b0xir
	 vK2BfAngEIEnf7JavI3KyUo9Th2HYFrp64xy2f+FewZxQYo+jzO6AnaZ7Zk6mAMJkQ
	 orhhpwtRDNMJQ==
Date: Sun, 5 Apr 2026 09:18:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 02/13] dt-bindings: clock: Add system-0 domain PLL
 clock
Message-ID: <20260405-godlike-pistachio-mackerel-7ab494@quoll>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-3-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403054945.467700-3-changhuang.liang@starfivetech.com>
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

On Thu, Apr 02, 2026 at 10:49:34PM -0700, Changhuang Liang wrote:
> Add system-0 domain PLL clock for StarFive JHB100 SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/clock/starfive,jhb100-pll.yaml   | 44 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   |  6 +++

You did not test your code. Apply patch #1 and test it. Do you see
build-level errors?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
