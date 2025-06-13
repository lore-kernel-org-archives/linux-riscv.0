Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7DEC71157
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojeKXlal5kMZtT1jYwkbn69JWnbtocYlfKcZ8DGhPew=; b=iwjFzgrVnJzRTc
	0j7mEs+B681XGzMqLmm5/CvdOXKGi6XKb47FHEZa7P/WWGIKphHkXTduJE10f2Dz4Apx53gOBDcbJ
	7MuJtP7N7p2aPfEy7I6jGCICyehZTitLvo4d/l02WV/BETbCCPolh3DV+/0WTaw28SQPdg36awlP1
	ODGdBH8iftT899YWsS4kWA0+nho88Ya/pAIli1QT/TYmcacvLG/IEzCj7nEgKCi0nsBT57jW2A0vD
	3ML1M2nBU7QemKlMgZwwn1cU6ZPLZ6+Z9hhwlnyt/iB9e4pj5ozh7hoyXRcu+bDZ33MADPzVK69sV
	oiItcN9wVd2JPBOwNcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8ww-0000000HFA1-3OyS;
	Fri, 13 Jun 2025 18:16:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6Pw-0000000GtVM-2vVZ
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 15:34:09 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749828847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ftUktIWQ3FpQ+oNWq9GjbTfGde+p4uG7iLxKXxZnMeg=;
	b=Qk//4p7Pe3ee5tQzv2DP0kCIu9gs47/kMgqEMHEB5VmmrmVvrqS27+Myn5Z6Rk3cObLRpJ
	sWQiPe7ZFPm0q4XjbnL3uVipcCZ7Rt4edDBwMGDOKB0LJ90FAwmYESDXKrzXVpVBvuZybb
	g0xzINxXqmmGQRMN19BKSzywUOVaAPhnXxtFf6TEvX00lC00z4Kzr10YPAR/xjoI9VtSsq
	0CXvmTrDysgu+SavVCQLeTJmNNHKq6qQK5o3RuOI/5qeYaW8KeSKRCEmBAS7AknAuzCy80
	MlFwxTntd52wy03m2jPjaTHP41BWmNuYgLypxGTxuzPssnd6jibdhCYw1hO2HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749828847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ftUktIWQ3FpQ+oNWq9GjbTfGde+p4uG7iLxKXxZnMeg=;
	b=SfGRvKSODKoa8qpc4nvk4dakrEGL44D3qm1o3/S5XU+7X5Wip5K5G4kEDIanl/giVAnCJH
	rgLLj2B+ihreNmAw==
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: [PATCH v5 19/23] irqchip/irq-riscv-imsic-early: Export
 imsic_acpi_get_fwnode()
In-Reply-To: <20250611062238.636753-20-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-20-apatel@ventanamicro.com>
Date: Fri, 13 Jun 2025 17:34:06 +0200
Message-ID: <87ikkzirkh.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_083408_877267_9332DF83 
X-CRM114-Status: UNSURE (   6.74  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 11 2025 at 11:52, Anup Patel wrote:

> From: Sunil V L <sunilvl@ventanamicro.com>
>
> ACPI based loadable drivers which need MSIs will also need
> imsic_acpi_get_fwnode() to update the device MSI domain so
> export this function.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
