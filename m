Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EE4C7115C
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Jun 2025 21:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlDqEtqCwRlWBm7TjnkzRXvxR7ljvTbuor+rezZYluE=; b=qamiv9Q+hGVrvq
	vIzgFNHDrO1CIFxIiJvZp1jdgTmjoQL1Txjmrqk2w9cezMLrJmqDnidBf0p9TfpCmgMNJ4+KXHQYL
	fWULTkJ8DwYVckTJ2tftxVi4Epxi6/WrRnFxep3Lh3PxD7SZz9/Io1j/1I0ImJ5PXO9+VbLjV1ekU
	uDLGz/4T6e8Il/cFUTJAFvRhq1ySfpptTaC+z9qFKRv7lYudDanrbJPSnal3c+1cAS9ewHIvIKSwb
	FwaMoq6WX2Vz34RNEO6fqtAfWhDgYz3DCczkxDnUF7ODqGnXi2mqFVTRzs2eJyJEk2Lj+bLnw42my
	Ivc2zWQ9NAOZuPhVdY/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT5PE-00000000I2n-3tHE;
	Sat, 21 Jun 2025 21:05:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT5PD-00000000I2W-3FsY
	for linux-riscv@lists.infradead.org;
	Sat, 21 Jun 2025 21:05:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD69161129;
	Sat, 21 Jun 2025 21:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD07C4CEF0;
	Sat, 21 Jun 2025 21:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750539942;
	bh=TMo8k+8IJdqt4u8TLI55e7D9ohk0QRKTGTcOWP4yYe4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nYibt3vibwJeT5u6Oe+0xRB5fmBCmGjuk13rlfTPO7vuG6LGnXpW72u0F5dIAg07+
	 8eybcWPxdm01jpzQ3i05cPKJdlId2nKTWg7Nc+0TGsrKKJMxZQ3obgJvcXb/56UJZY
	 jGCUIEImWNugMJS8lOXUxCfEp+fIsL+tKEW4gpLVprWB4f/Y3TYPEMnf2n6lUGZM46
	 55fAWOma3eXK9Np49/PUA6wEba8vWYkhiP7+qcfT96fuCe1e1dvlHahsUzIgPgp8vn
	 3g+B7h2Ml3DNi/RYemaApVbIRbEkVkvEqGng/EMac9hwexaRdhVfr2oLCsam5VT5op
	 oVQz6TeqtcHHg==
MIME-Version: 1.0
In-Reply-To: <20250618121358.503781-9-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com> <20250618121358.503781-9-apatel@ventanamicro.com>
Subject: Re: [PATCH v6 08/23] dt-bindings: clock: Add RPMI clock service controller bindings
From: Stephen Boyd <sboyd@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Rafael J . Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Sat, 21 Jun 2025 14:05:41 -0700
Message-ID: <175053994174.4372.16441022738031138174@lazor>
User-Agent: alot/0.11
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Anup Patel (2025-06-18 05:13:43)
> Add device tree bindings for the RPMI clock service group based
> controller for the supervisor software.
> 
> The RPMI clock service group is defined by the RISC-V platform
> management interface (RPMI) specification.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
