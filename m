Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DD6C83030
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlUeBGLVrfTKdCVM8dmdMGbuZpvh1Seq20IwzYYS+e4=; b=UqPNJhC6gIQQ1J
	W9xHqVWFqAfTdSHdKQ2x+jv+HOWQ0bHEmdJeIG77tCPI25xA2MPTknu39Sc/g4e00V1EuHWYLDP80
	dBCsYs980ewJwfHpXfBRHuLRuzU+8CWappoPFw0I3YnG1nnMfzFmP5dUALSPGUHV4LTqvkWpEjnm3
	Kj4VeHMzbTgDGqlX1BicxlabEBpwjUj59lh5BLsbTEAknJAaHbgyzLpz8dhbxbYwj3sqvhhjNjQBL
	b5faxpkUHkIh1R2C8UyCYA5YULToJIFPX7UdJgevFvYOsAcd/AdylryU8yXfJ+cjZrZ8csiDXEgTC
	hRtQYAC75mvmeSzaO4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXb6u-0000000Dc9T-1VDu;
	Fri, 04 Jul 2025 07:45:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXb6s-0000000Dc97-1pPs
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC21B5C26FE;
	Fri,  4 Jul 2025 07:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5B5C4CEED;
	Fri,  4 Jul 2025 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751615124;
	bh=MlLV85r3dwch+8yN0HFwSMWbY/7x6F5+uh7tSezv4b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHujkzYtp97aRLHazCUsI85S6dpbcxBwmcEr4EdBdU3tB//eDUNo7nxpX0inOtZM8
	 S99Gd4s4B0hgH2Gc+37wa0hN80I19zzylKeqyjBFI4kONb3IdwdGBJBTEbHVWI3V7M
	 rspb2wM2stcGWKO+yTJ7hlmsw7VIyEq2VOVvNeFqzMwAYrWEhzXbhyaHzg63orPQM+
	 /9DihUZRVK2ZzgDsxA10A2iP2eYRAViQr8Xvh/VGpZTxBFCJbkVW2kw139NXcrocxI
	 EHebIEiXi0erzIMAj30yaP4syGBf0VQZorSnIofVHl1qlDQn5RJf5lNZuMyiDHAqq4
	 dd12K6Bexqd1g==
Date: Fri, 4 Jul 2025 09:45:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v8 00/24] Linux SBI MPXY and RPMI drivers
Message-ID: <20250704-attractive-sawfly-of-artistry-1c86a3@krzk-bin>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_004526_519837_DAE8A53A 
X-CRM114-Status: GOOD (  12.70  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 04, 2025 at 12:33:32PM +0530, Anup Patel wrote:
> The SBI v3.0 (MPXY extension) [1] and RPMI v1.0 [2] specifications
> are frozen and finished public review at the RISC-V International.
> 
> Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
> Linux only has SBI MPXY mailbox controller driver, RPMI clock driver
> and RPMI system MSI driver This series also includes ACPI support
> for SBI MPXY mailbox controller and RPMI system MSI drivers.
> 
> These patches can be found in the riscv_sbi_mpxy_mailbox_v8 branch
> at: https://github.com/avpatel/linux.git
> 
> To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
> machine with OpenSBI and QEMU from the dev-upstream branch at:
> https://github.com/ventanamicro/opensbi.git
> https://github.com/ventanamicro/qemu.git
> 
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> [2] https://github.com/riscv-non-isa/riscv-rpmi/releases
> 
> Changes since v7:
>  - Addressed comments on PATCH3, PATCH7, PATCH10, PATCH14, and PATCH21

Which comments? What exactly did you change? Provide in-patch changelogs
explaining this, because what you wrote is way too vague.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
