Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143C7CD3439
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 19:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0KWwvlN5A9XOsjpjNwJ6iC4+kq02EywEQFCRu3qprw=; b=4VRltgwu2fGSRX
	hW4A7if4tNHvYRs8K+7NfI1eKcoNR0zRxtrFEaezGSxKOPGEgD8R7gpkf1nYGByblKN7ur0VZNzWT
	IcxhRaUFTTUw/huJfL7ehFVAxgEGsv95X4e6TYjIhz//fggpNN5hwucMyuUlqUNikm+rtZCLlSGUj
	MGUGgPsDiHpjeS/FDXGwV4tHzB+QLa/FrDJuycckuqKYycAqd0T3FZaSXUvDtm/FlvjC5oBPLPI36
	AZWgPw+GgSZjpx0qenGUbEWnJGEaBp0y7QhzbKSXzIKEcWJQc/Lu6LJgKRtI/V16HP0hcnM/BfQr+
	Nl0d9ndNrzUNFn1gjb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLuG-0000000HMMk-3gGd;
	Tue, 05 May 2026 19:58:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLuE-0000000HMMA-3sab;
	Tue, 05 May 2026 19:58:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10C076091C;
	Tue,  5 May 2026 19:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6F1C2BCC7;
	Tue,  5 May 2026 19:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778011089;
	bh=W35jp3biyC/4M1gGUsqXaJV7TzLzXnjHGt9kg58DRgs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QcaDx0FMqLlc6iPx8AsHb8msnT8tv7l82kZ2wMuIxS725ruXkCWQa7lla4brnDN+A
	 qBIqFuOK1nkBDGy4BZaPYVnof9zYrxYav4xzusCyDeaapZR+FGAX8+IObQQrldg7MT
	 OS2sSb7wNREHqg/bJKy0OKvBod7Sun4yV3SA7HYwVkX4iHojA5WY52pPJhkmaJL9Kr
	 luMT83FCuRpPJjsLx+B6ZLXB0CPEaUCvyCgjmkjbddOx7u1xN2bBCmS6Dr7m5CUhsb
	 mWHiUNQJ8ZhN6Zn8Jf+NlaOK0UQV17oGcfd3to43MXPDLJ2RmWlRquPQK06ERgwuuS
	 eSWm5QLwEQeuw==
From: Thomas Gleixner <tglx@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sunil V L
 <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 2/2] irqchip/gic-v5: Add IWB to ACPI probe dependency
 control
In-Reply-To: <20260505-gic-v5-acpi-iwb-probe-deferral-v1-2-b37b85998362@kernel.org>
References: <20260505-gic-v5-acpi-iwb-probe-deferral-v1-0-b37b85998362@kernel.org>
 <20260505-gic-v5-acpi-iwb-probe-deferral-v1-2-b37b85998362@kernel.org>
Date: Tue, 05 May 2026 21:58:05 +0200
Message-ID: <875x51y6gi.ffs@tglx>
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

On Tue, May 05 2026 at 10:48, Lorenzo Pieralisi wrote:
> On Arm GICv5 systems, wired IRQs routed to an IWB may require resolving

S/IRQs/interrupts/g

Changelogs are prose and not an acronym dump ground.

>  drivers/acpi/arm64/iort.c        | 22 +++++++++++++++++++---
>  drivers/acpi/scan.c              |  1 +
>  drivers/irqchip/irq-gic-v5-iwb.c |  5 +++++
>  drivers/irqchip/irq-gic-v5.c     | 13 +++++++++++--
>  include/linux/acpi_iort.h        |  3 ++-

I'm confused about the conglomerate of files affected by an irqchip
change...

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
