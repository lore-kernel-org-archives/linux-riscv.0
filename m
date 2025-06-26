Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE596C7EE30
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejAR7G9ZiN4fRlXIdpgyABrOaOvbzhEoVe7T/dTCNEo=; b=qGaMORSF8BRi3S
	ZAG2YFSYkVgChNSzfaUzzhW3rYgtR90o5/0KLaa2bYVexGeUf7xxnhTL4kraGhjP9FpqtzIo1Gsw5
	b9IZGOas4SQ0dhKZyYgdgp4fPJOkEkPpf5QFzttFKhm4gsiC/meHr6hifgdRSM5HSwBXVmZWQiKUO
	7hhGB0PYvwiVOl9mwnPKCyfHSVq7yMm3nn5QXRThVfx+1gFxWsrVFn6oLpcR59FoICH0unsKG5YAk
	jJ02OPUThFs/XGBtpSntgVgYfjNloG/PckT2/HE07DyIN8YEwFcgAe4xgHRPPmAuizfsUZnZF1i4N
	RmdDuQyYY1fj6Bdkx0Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpSH-0000000CH0o-0FOM;
	Thu, 26 Jun 2025 16:28:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpDI-0000000CET6-2PY0;
	Thu, 26 Jun 2025 16:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eljFHNeyDYyRzp+O8F4KzsegQjKW9C3yujFh6Fsq1Qk=; b=WZUaYR4MGDcwA72Cd1oB7SIN0F
	IFMAmPV7c00mJPk2CVhNVrN29w8KbLmEphp3RL4R63R4OUaUKxPZYcVSAN2tY/ZlU8l5OCWyQavDa
	tligsFzmreVUsDgk34KMrgXyQSbPNUTLn4NU80KrGc2yXX2Zv0d+1KKvvkmphxig1Te66I9T+aiAJ
	0ManUiJQs6f4Y/VgDFHI+DQ9mOkPERLaFTlvo2wrN3sLWMy6u6MSlfCO10MRmmqRH0iDoX1jNpwOd
	3EXHrnWTg5FauhOwgr1ZcxKwpULUNMAo1hWX56jzidYQM3pzgPxPJuFnQgPTEoMWcAtTcCVEyDx1L
	pVfwJKTQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpDF-000000068og-3PWS;
	Thu, 26 Jun 2025 16:12:35 +0000
Date: Thu, 26 Jun 2025 18:12:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750954350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eljFHNeyDYyRzp+O8F4KzsegQjKW9C3yujFh6Fsq1Qk=;
	b=0LYeaLtAJ5FAMG3LKAeKdLDltJhvOW1WHfMGoLPpHniE2OZI85uX1GQ2ey33i0w2d3okwY
	y8RJdyrEW9ZY/cT+ZjwXRpUAjWJ0kCU+X2/JsCqHsZ9U3aZ2TChCv+CCVSJp+KV+L4Zxa2
	z1/e8Cw6EEDWNScScFvdTo+JFjdypZBGw3uOzxDCwl0rK8PijcEKtHTsbEtaOJrOY79zE+
	lyYrnQXacHleQNfDRVYS/oxCSupzyLsGdaUVpCsib+pW7FPXQCOPPYoVqYsGycNLqIR0Mq
	0QXD62rY8oOCAC9hVds/VEowvpYLNn7GWPeodcQRkAMgY2ncXFVKyAVu6ZobjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750954350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eljFHNeyDYyRzp+O8F4KzsegQjKW9C3yujFh6Fsq1Qk=;
	b=rtm8MhjqrOGX+yu466ihurQqBVjxnH6Q7AddtO63t9athnBOj9mUFoMRtFMFVGiDMnsQtE
	sk4IQPJV0R8iU4AQ==
From: Nam Cao <namcao@linutronix.de>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Antoine Tenart <atenart@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 02/12] irqchip/bcm2712-mip: Switch to
 msi_create_parent_irq_domain()
Message-ID: <20250626161228.N6byQ97v@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
 <92a6d68db014e945337c10649a41605da05783da.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92a6d68db014e945337c10649a41605da05783da.1750860131.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_171233_972171_AA77809E 
X-CRM114-Status: UNSURE (   8.18  )
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

On Thu, Jun 26, 2025 at 04:48:59PM +0200, Nam Cao wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Switch to use the concise helper to create an MSI parent domain.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Nam Cao <tglx@linutronix.de>
                          ^ oops, that's not my email

I will send v2, but let's wait for a few days if there is something else I
should fix.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
