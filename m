Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D293CAC5A7
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PR63oWfoJjkg9z6ieFfyU9sQLT2JiJ11AA9KR4u6DpA=; b=paAvc2HBgAK8CB
	aAAjIAoJnB2F657LmUS343k61bmX5N3SePBRwCCqproyAWYu7fGCmOsbZdjJAQnwsLOD69d4uI1gq
	MMoX9M2JKg0yYojuG+MQ2YdhadoeFe0kWwOQMZNfZSAaOY6euFIhhn0et0bYSfu26h/Mzy1dAdZcZ
	Q7n8OSe4Xip01dpXhxcxASS4GuczlrgxkvqRp1OLGwkz4SF+r/gVMWPBvpE40a6leHKMfS2ew6FDH
	xrNwtI0ZIDi4I3xDbDZelaFektsvW470oLWLJhK4n+oHZh3L/2n8JPSZqrKz74tVLQn1pStvyjV6c
	kewbRvVoCn0jr1bjBibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NoE-00000007vWO-44Q2;
	Sun, 21 Sep 2025 17:25:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NoC-00000007vVt-0jlC
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 17:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6BAF4444C;
	Sun, 21 Sep 2025 17:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849EBC4CEE7;
	Sun, 21 Sep 2025 17:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758475507;
	bh=WKwhxvq7jY3OZNVkywwrxdkcffohNo1hcW1y9XvV6Vs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=c0OaBZS9yKp9WHcw4ElnO4EXvPtp2u/u8xRmD4tCK1EW5wMuUNxGbK4cSa2LlgBEG
	 ulSLvr8OIZI0BQaKmRvo3SLXtI4meKy6aa4StSY9FJYT1BbOqdcYXPA/dJftS/qOCj
	 YIQ0SiL0lSPD5S6zBIQ/iIk0Rk1wOMdoVPYeu2qzAFOi56IPQ0j7OEDFJCx7W0lncv
	 MwiUF3qwWJ3doA81mqzIm3TgEZsIygvvCyC10ZvycRDExQ2MxrFqZagdGhL0Nxw+ei
	 2KCN4bZ/kyUj3CPCABT06BJEFmyul7Pm8EyGOGnQuEGEkLssa7dEQNJS1JW2oRNEzP
	 dw8mapgNhUOMA==
MIME-Version: 1.0
In-Reply-To: <20250818040920.272664-9-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com> <20250818040920.272664-9-apatel@ventanamicro.com>
Subject: Re: [PATCH v10 08/24] dt-bindings: clock: Add RPMI clock service message proxy bindings
From: Stephen Boyd <sboyd@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Rafael J . Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Sun, 21 Sep 2025 10:25:06 -0700
Message-ID: <175847550625.4354.7736204929282849019@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_102508_245951_1E4F49A0 
X-CRM114-Status: UNSURE (   6.77  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Anup Patel (2025-08-17 21:09:04)
> Add device tree bindings for the RPMI clock service group based
> message proxy implemented by the SBI implementation (machine mode
> firmware or hypervisor).
> 
> The RPMI clock service group is defined by the RISC-V platform
> management interface (RPMI) specification.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
