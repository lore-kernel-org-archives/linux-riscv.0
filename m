Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1094BC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 21:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6hl/h0Q8+eOl4n8M5+wzWWrKjU5s7cCnGVww4n0WcM=; b=VIs4QAr1G5Msvi
	mk1WP+oS/g3m1i1YBaCBBhqNwBxGcpZp09RrrTZ2YPAYRhpr+TMVcxhQ0H/48M6Kezuo+dnKOPdo4
	2QdZ4P9HNC0YHQfmJJJXF/WwyFHIfSl9QAW7mCZ5CFmBYI8ZYHZwA+wuC5ab5q2+nKpyyLkTjw7dO
	tpOVBC6apzQiWqZd48Qh3XQD1idWc/7vMN2wXPXafMoq1jBHOL9RmydUf05Ae59nfT3x6608rx4nk
	Ywj3n1lWgKnGm9SELLdsMToTndBOaNi+dzVaU3Sc/CXDJv/m2+GoCF79dhrSU7gyv+VlBrdjip5P4
	Lw4sxG+9TBF60drLGSTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPNv-00000005aaB-1311;
	Thu, 02 Jul 2026 21:55:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPNt-00000005aZV-3pWo;
	Thu, 02 Jul 2026 21:55:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF748601CA;
	Thu,  2 Jul 2026 21:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A441F000E9;
	Thu,  2 Jul 2026 21:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783029348;
	bh=0zspmW8x8NfjgzmHrmSB3UmdTwxqu95F7yMgPebeJrQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IRpbLabeERee8weUM/6T6duN87T+iRNfQNmjbVOUNAbrYchScx26hK5uaWGIEbgKP
	 FtzvAZNZdQTDNno7w7T+d8BcIxpx5Z6h5wq6aBFkmPvMSgIXOn+CaTszZrHiv6rePW
	 UMpwWSvzlzpdNr6WgmoXtENZzT62dzVwN2HTgf3c6q1BpZAmCTrGyQ+q1IWZRdqW47
	 oIeuRQqDC8EXM+GZxdSZyC7z5an3PE/M9GIQohgu0qZoYri3KBHLv/cSyXbQ/Dso8x
	 YteZfZzoHWSLNoB7RkFy2XsZUWUS8GNsmR4UQJKkOWV5vhcJPslu2vwVP7hQO8WbUV
	 Evp8yulMsGgBA==
From: Thomas Gleixner <tglx@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sunil V L
 <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v3 7/7] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
In-Reply-To: <20260701-gic-v5-acpi-iwb-probe-deferral-v3-7-c5562cf0fe29@kernel.org>
References: <20260701-gic-v5-acpi-iwb-probe-deferral-v3-0-c5562cf0fe29@kernel.org>
 <20260701-gic-v5-acpi-iwb-probe-deferral-v3-7-c5562cf0fe29@kernel.org>
Date: Thu, 02 Jul 2026 23:55:45 +0200
Message-ID: <878q7tnjj2.ffs@fw13>
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

On Wed, Jul 01 2026 at 16:38, Lorenzo Pieralisi wrote:
> Register an ACPI hook in the ACPI interrupt management code for GICv5 to
> retrieve the ACPI interrupt controller handle (if any) of the controller
> handling a specific GSI, by updating the acpi_set_irq_model() call with
> the gic_v5_get_gsi_handle() function pointer parameter.
>
> gicv5_get_gsi_handle() allows ACPI core to detect the ACPI handle
> of the controller that manages a specific GSI interrupt.
>
> Update the IWB driver to clear device dependencies in ACPI core once the
> IWB driver has probed.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>

Assuming this goes through the ACPI tree:

Acked-by: Thomas Gleixner <tglx@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
