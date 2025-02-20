Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC2DC021B1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDs4jXSh1BIAXsvjkDVv/eGlrLCoDig4TP8jWWeg+Mg=; b=KIpqyq7DCD+0U2
	CdiWkiHgJGef/E9sCTFXq24wwE6nwOdbTQWcaSxWmnD9b/HTfhqnaJj1cyTnF+w7ESU+qrw7Ckw0B
	P1+P3vYtfBWwt5Ww3l1eWSEVyh/E3r+IkPdJipL5AwFrwRazBqIhxJFjYjyb+sDcQQVG86TNQsxJy
	2554Ay+WGhkbGVxmMwaiHbvBfzbl20Koh8IH+kR54BDjFHsVBmhTi8zC8o6nWQxxxMgKoV+CFUISi
	dgbm6x9JKZ4q5H6jjEgRov502LuPFML1WZk5ny3rK03alHcf7mDbd7f020GRctU1oRQXiIW26I8Vl
	u7xDNORzQj+3wh4p8a+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl77P-00000001Bwx-23qa;
	Thu, 20 Feb 2025 14:01:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl70s-00000001AGq-30a5;
	Thu, 20 Feb 2025 13:54:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740059685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QD11Ne9DcKnhelWjnLTjIo907OByVtQIcZFYttKj9Mo=;
	b=ZXyZZiu6fQzbxCFJQqDVVgundVzHGnEXcdeIqL8ClGR3W4b1Ey4eB+bTwF/enWU27f8iqb
	6KyA7/MQ5+4mod88342BBvtXI+vCoBPYpCYRijL9dHXlnwtvDBBjL0UlnDDdTX10nwEXmW
	jsYAhyvt6xLy9RlDs67Ql11fUBmelfip+FdZsakH1fprNWVgYX6++nHjJaPYloPBm4VA0v
	IFuty6l3DyATYYOFxtg2zcjAW9Ds2GEw9k7nBYAhVx3ERa6N3DIbq2pGTCTvipVDRjp0gL
	4kJQa5/yTN+Sfg7lfSZUTM6HSWCZzUaCTAp5bmp5CUkg6T9zSKhyM/B5zR7lhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740059685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QD11Ne9DcKnhelWjnLTjIo907OByVtQIcZFYttKj9Mo=;
	b=JOlYIairSeSWXDphePdqMGRdnMIe0izKqy7x+haK/irgiQkE4fPAmmUH2rnIn+wrOo4/nr
	pM3+j/mvSiuJWVCA==
To: Mark Brown <broonie@kernel.org>, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v6 02/10] irqchip/irq-msi-lib: Optionally set default
 irq_eoi/irq_ack
In-Reply-To: <Z7Xto0WZ-Crxunik@finisterre.sirena.org.uk>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
 <20250217085657.789309-3-apatel@ventanamicro.com>
 <Z7Xto0WZ-Crxunik@finisterre.sirena.org.uk>
Date: Thu, 20 Feb 2025 14:54:45 +0100
Message-ID: <87jz9kiuvu.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_055450_894029_C5AEA780 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>, hpa@zytor.com, linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, x86@kernel.org, Andrew Jones <ajones@ventanamicro.com>, Sascha Hauer <s.hauer@pengutronix.de>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Anup Patel <anup@brainfault.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 19 2025 at 14:41, Mark Brown wrote:
> On Mon, Feb 17, 2025 at 02:26:48PM +0530, Anup Patel wrote:
> I'm seeing boot regressions with qemu on arm64 in -next which bisect
> down to this patch.  We hit a NULL pointer dereference:
>
> <6>[    0.898900] virtio_blk virtio1: 1/0/0 default/read/poll queues
> <5>[    0.910197] virtio_blk virtio1: [vda] 3906250 512-byte logical blocks (2.00 GB/1.86 GiB)
> <1>[    0.924459] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> <1>[    0.924508] Mem abort info:
> <1>[    0.924521]   ESR = 0x000000008600002b
> <1>[    0.924559]   EC = 0x21: IABT (current EL), IL = 32 bits
> <1>[    0.924580]   SET = 0, FnV = 0
> <1>[    0.924597]   EA = 0, S1PTW = 0
> <1>[    0.924616]   FSC = 0x2b: level -1 translation fault
> <1>[    0.924667] [0000000000000000] user address but active_mm is swapper
> <0>[    0.924833] Internal error: Oops: 000000008600002b [#1] PREEMPT
> SMP

Uuurg. I wish I had double checked that the final submitted patch covers
_ALL_ incarnations of this. The below delta patch should address it.

Thanks,

        tglx
---
diff --git a/drivers/irqchip/irq-gic-v3-its-msi-parent.c b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
index e150365fbe89..bdb04c808148 100644
--- a/drivers/irqchip/irq-gic-v3-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
@@ -203,6 +203,7 @@ static bool its_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 const struct msi_parent_ops gic_v3_its_msi_parent_ops = {
 	.supported_flags	= ITS_MSI_FLAGS_SUPPORTED,
 	.required_flags		= ITS_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
 	.prefix			= "ITS-",
diff --git a/drivers/irqchip/irq-gic-v3-mbi.c b/drivers/irqchip/irq-gic-v3-mbi.c
index 3fe870f8ee17..3e1d8a1cda5e 100644
--- a/drivers/irqchip/irq-gic-v3-mbi.c
+++ b/drivers/irqchip/irq-gic-v3-mbi.c
@@ -201,6 +201,7 @@ static bool mbi_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 static const struct msi_parent_ops gic_v3_mbi_msi_parent_ops = {
 	.supported_flags	= MBI_MSI_FLAGS_SUPPORTED,
 	.required_flags		= MBI_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
 	.prefix			= "MBI-",
diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
index bd337ecddb40..9c62108b3ad5 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -146,6 +146,7 @@ static const struct irq_domain_ops pch_msi_middle_domain_ops = {
 static struct msi_parent_ops pch_msi_parent_ops = {
 	.required_flags		= PCH_MSI_FLAGS_REQUIRED,
 	.supported_flags	= PCH_MSI_FLAGS_SUPPORTED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_mask	= MATCH_PCI_MSI,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.prefix			= "PCH-",




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
