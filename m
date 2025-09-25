Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A641FCAC5BA
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 19:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBjRBQkm29etVpV9bAYycEVS+DY2doI1w5U9OQldUJY=; b=BEC41ApbaNQwJM
	BzeYTyQNe6IT47uA8/9EkLCzpeeSH5FRFkzNwRUgBkJjKXvOt3vmykM92qHacVL369GIR5ba4EnDP
	hAjImh0zA7/WD6ULCjiXXlsFb7H725BeMlJJFdxBrp4DwvkYNZpCKEB2/XmVRa1lF0dOtSl5mpsYR
	R9ZN7C/8mhbpr2TVWgywYTTt+MvZKMBoaoIT3PvU8NE/KKW2YV5ukI8HfstRN9Crv6rvlTqStNuXm
	WJXN8AYORkE//D8EAnL/ieG7CA5TNWfpEHooPB0QzsR1TQ6SHL17LO6CnWeCDL9dESLGepWayWi9j
	81aqkOQVCjjY7BEjWV8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rSK-0000000CEvf-3vyL;
	Thu, 25 Sep 2025 19:16:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rSJ-0000000CEty-1gHA
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 19:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF1E86120B;
	Thu, 25 Sep 2025 19:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A58C4CEF0;
	Thu, 25 Sep 2025 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758827798;
	bh=r+K4st9QKZHdJzM3ip/Ne+u4Np4HMFMIRhcr81fP8so=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nqpV0y+PTJTfgqdWWcsTAfEiafK7DaHqrLI+QZ3oGfNOW4pCVcPjUoKEFj9SO1Cag
	 N9TT2qPZfY00NsO+HY0v4Hr/PjHiy8XvWqo2+22lQEqS/XWEUbqCN+l4NIXST0+EdW
	 Cu3T0/ZfwyVaiWdLMlA2nKbjm/T04l20eqCKsc+/51/+R0a+yBarX9HoMw6VKhqe/H
	 yi5dEHLbP9TSB1QvIXEVpOeRAmCwjHd4iTGBDSybSMqOuOvevcmQyOeYm1N7E7CD19
	 VzORlV9PXCAlhQjFl4GHpE/hayaU2Q31x0Aj1PVQWyzHKjxO80gJ5W9VOs0FlOdgBS
	 /FpFui7izU9Ig==
Date: Thu, 25 Sep 2025 13:16:30 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
cc: Paul Walmsley <pjw@kernel.org>, 
    Michael Turquette <mturquette@baylibre.com>, 
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
Subject: Re: [PATCH v10 07/24] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
In-Reply-To: <CAK9=C2Vr4rgj8wfT+Ogow1H-7Lu=6XdWA2Qe++6523P76pMZzQ@mail.gmail.com>
Message-ID: <703b00fa-d02c-1eaf-e4de-ea66da5b8002@kernel.org>
References: <20250818040920.272664-1-apatel@ventanamicro.com> <20250818040920.272664-8-apatel@ventanamicro.com> <405a78ce-de03-382b-cab9-bb086e28505b@kernel.org> <CAK9=C2Vr4rgj8wfT+Ogow1H-7Lu=6XdWA2Qe++6523P76pMZzQ@mail.gmail.com>
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

On Thu, 25 Sep 2025, Anup Patel wrote:

> The usage of channel_ids array is limited only to this function
> (mpxy_mbox_populate_channels()) hence we are using scoped
> kcalloc() so that channel_ids will be automatically freed when
> mpxy_mbox_populate_channels() returns.
> (Refer, "__free(kfree)" attribute in the channel_idsm declaration)

Thanks, I missed that part.  Looks fine the way you posted it.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
