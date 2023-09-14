Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21985EDE98C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGMLiOJjrVTckoAG+8Z3SY8wBY4KnTgdkrMH5a9GmOs=; b=UANt0jqTWM6ocm
	Wa9Qo86FKfy9U5tkcQoXQqWsBtclATLfAYzKITo3JRZexq65ED1o0WWo4nzX3/Y3ApOY7CcnjDTPs
	Kf2frTLYb7G5Ar1Aqam6F9zWkIeCHQxz6T0qlZ5HHPKVggpboP+2T6npqHBhpU/nT5rR22BHhH/3n
	gRr/qzWfcoTfxZPF7cluIaCDsD3WI6TzRU7IwzczA69ue3h3Z0YNs7qbDURTPKrFM1XX9HHpTAWRI
	qQZM3f3TgrblBMaxK1LwElhgCnQ65TaLfVt0WyqtN1ulmYGTnA0NE9IfdIdWnW7T7/xIhBDCIkGwW
	zT2tlapAZlQBNHGefaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghRD-007fcj-0L;
	Thu, 14 Sep 2023 08:10:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghR9-007fZv-1A;
	Thu, 14 Sep 2023 08:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HUdy2Po7jkHrYIBNhk+jI+VgvBpeOnh7DGyNEaZXmC8=; b=bkA0oxbWLPss0SERrENqthfcJ8
	J2AlYmp8gSKWUqgvF/LkIJQSR2jnXS0SoProXYe/NPjgBy97H8B5MD63O9wkwJ913QPb0JPAxS/su
	ifx+Cg3vCCr84Fk49A8RbqYpk35LK0nLKqs8wFKLz1bX1l7vt/KLpRGFHwiki1U61EacYCmT5KA6P
	sLpr6XFvgyGZgHg+u2pVg0foJqzGL7fn1+T5puA6qN8aGVWdv4lbvHdJYrp/zx5FRFOJbpZ2hcpUP
	q/Hyiuka6cq0lBT8sBicT12Am9bOuYgK9H/fFgY46fGMdIpz4CURTgZaT8MNejPZYfqDU/eV7xasp
	HtzWmZMQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59502)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qghR6-0003gX-0X;
	Thu, 14 Sep 2023 09:10:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qghR6-0004aN-UR; Thu, 14 Sep 2023 09:10:52 +0100
Date: Thu, 14 Sep 2023 09:10:52 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Morse <james.morse@arm.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 30/35] irqchip/gic-v3: Add support for ACPI's
 disabled but 'online capable' CPUs
Message-ID: <ZQLADHCbOr5J8TpX@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-31-james.morse@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913163823.7880-31-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_011055_422994_38F6B66B 
X-CRM114-Status: UNSURE (   7.69  )
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

On Wed, Sep 13, 2023 at 04:38:18PM +0000, James Morse wrote:
>  static inline bool acpi_gicc_is_usable(struct acpi_madt_generic_interrupt *gicc)
>  {
> -	return (gicc->flags & ACPI_MADT_ENABLED);
> +	return ((gicc->flags & ACPI_MADT_ENABLED ||
> +		 gicc->flags & ACPI_MADT_GICC_CPU_CAPABLE));

... and this starts getting silly with the number of parens.

	return gicc->flags & ACPI_MADT_ENABLED ||
	       gicc->flags & ACPI_MADT_GICC_CPU_CAPABLE;

is entirely sufficient. Also:

	return gicc->flags & (ACPI_MADT_ENABLED | ACPI_MADT_GICC_CPU_CAPABLE);

also works.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
