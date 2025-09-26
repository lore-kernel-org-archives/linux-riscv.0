Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A136FCAC5B5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 02:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZHEs9LH/kObNioXmEF9YyBvrx+Np1uSdGR/cE8WpG4=; b=Kda/Z6FtdOeopS
	XG9XIkoLcYttwT2F9I742Mc5dvIESu6yYS8wd2bodzwjfQKWgYLHW3yX+rNa+zmjPOGSCh1r4H+0B
	AJIwbGoPOHPMEKIcVssdGe9V244Cu5WVJBy2TO++HpcdfAuzzOVW78lLr708vfGfJSPIE6PclYp9v
	KYArpe3rmNHktZviUt4O2MOLZeEa5M1h6gjR4TPgc6wTYWoYW/w95sm4A+SquNiLgvLAx9BjsmtMt
	+pUtShD4Q5DqknIpKXzUi7iD7An8zPfmSyYWEbVz5CoUEXmljUhk96KYFTdu8EnnjYR0Ff30mvkO0
	W56ksejj+kpEXbq60inA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1xsM-0000000EtBT-0e6i;
	Fri, 26 Sep 2025 02:07:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1xsL-0000000EtBG-1aW8
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 02:07:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 66C85613F9;
	Fri, 26 Sep 2025 02:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91848C4CEF0;
	Fri, 26 Sep 2025 02:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758852476;
	bh=uN2UFL7M3Wj5OaaqksHU4neh8HYrJwUdMjuaAycHFlE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oPXq2mR5I63npQJuqqwLWbiSyJLEipDv14/6HBV4MW/RTth6GxwDgcALvuVwuOB0m
	 8fcN3jG/A3XysoLGxFj9RNyVMmjdQ4rXvsl5REvgBZFZP7QDc5j/s7lN482GdUZn1h
	 MhZo/Es5/3nd0wkW1ezLECgGLd/caqhfUIiMAC+6IsOn5Tkgi2oS7j6SfTPb12NMGn
	 zLQlDPIHTe9Ic5DfR7sxrfDL28nALucWfPWoaJsxWBnsgnsc0dZglOJcjvCkyrL73O
	 hDEsi4pbyvHQRXHyCpqk4RSqui2Y2DekhsX3e1UEYJg6/w58LVueUT2k7MB/aZauoL
	 2DGniZ4+OTsHg==
Date: Thu, 25 Sep 2025 20:07:53 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
cc: Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Mika Westerberg <mika.westerberg@linux.intel.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Linus Walleij <linus.walleij@linaro.org>, 
    Bartosz Golaszewski <brgl@bgdev.pl>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <ukleinek@kernel.org>, 
    devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, 
    Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
    Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
    Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
    Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, 
    Rahul Pathak <rpathak@ventanamicro.com>
Subject: Re: [PATCH v10 00/24] Linux SBI MPXY and RPMI drivers
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
Message-ID: <6d91bd27-bdad-1348-661a-cd2eb84f6250@kernel.org>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
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

On Mon, 18 Aug 2025, Anup Patel wrote:

> The SBI v3.0 (MPXY extension) [1] and RPMI v1.0 [2] specifications
> are ratified by the RISC-V International.
> 
> Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
> Linux only has SBI MPXY mailbox controller driver, RPMI clock driver
> and RPMI system MSI driver This series also includes ACPI support
> for SBI MPXY mailbox controller and RPMI system MSI drivers.
> 
> These patches can be found in the riscv_sbi_mpxy_mailbox_v10 branch
> at: https://github.com/avpatel/linux.git
> 
> To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
> machine with OpenSBI and QEMU from the dev-upstream branch at:
> https://github.com/ventanamicro/opensbi.git
> https://github.com/ventanamicro/qemu.git
> 
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> [2] https://github.com/riscv-non-isa/riscv-rpmi/releases

Thanks, queued for v6.18 (hopefully).


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
