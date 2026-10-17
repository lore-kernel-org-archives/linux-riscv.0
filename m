Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA243CCA463
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 07:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QTfQ1/vCLqgsScEyKb6NljGnO+//+9tiCCJSgXxRHU=; b=o9cUMjZZ576Fww
	TEUnHw2zInTYgRJ4nqJVt28hg3cGNLscEEZvdAGQlPw6p+fPAbSN8vtrR9TfuTwsy9dF8SO9pf3QU
	839uuoYPVxtinr1uG+gDPNYQh9xoi1VYA7fwU8RJH27CpN0XAEv0bZ9JC07UDMFcTTVwF2pN3O1Ft
	SfczPADqK/BTKEG2HGjCDXxCji5DtvU60myCgTSdj4PuSX2n6JO+DLv9UzHIXzU+q5AIyZgI05iH9
	LJopbNuxFCEvwV7hrK5H15ld3/f+Jy6duD4ZbdUkcxTzQ7ctl8ddRN2FamYO87GCsW596KISCYr44
	b5Te4rL5NMqwZobRyx9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHypX-00000004VyV-3CzG;
	Sat, 17 Oct 2026 07:27:47 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHypU-00000004Vxd-079E
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 07:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=uag8eDuXNCghqFea+HDD/P9mLBrRtHxF/aw/3zF84HE=; b=G
	0v2yNz0NcKBucBC6zPvgGDAj9irdzxtOpBVLS64PyIDkcTaDyRtDfb6h9ikm9IZ5
	rI3cWVLGvb3VPXDjA1y3KHuD6IrqWoT0DomqD2X0SdQetsG1JEGnyipLrEroD4td
	8YYHyz9HoTX1O52tjoMFyVwkKpd/vwVwCtoVavEXzg=
Date: Sat, 17 Oct 2026 15:27:17 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Sunil V L" <sunilvl@ventanamicro.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Len Brown" <lenb@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>, linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 2/2] ACPI: riscv: validate interrupt controller MADT
 entries
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016141249.2791819-3-yaojiale02@163.com>
References: <20261016141249.2791819-1-yaojiale02@163.com>
 <20261016141249.2791819-3-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvUgo4SmdbekdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JH72PtZul3jkFAPXl2Mno+hw==
MIME-Version: 1.0
Message-ID: <4c6df8ce.1812.1a148c207d4.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZygvCgDnL7VWI9NqDPtaAA--.151W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRZtp2rTI1YCZgAA35
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_002744_448377_213B1F78 
X-CRM114-Status: UNSURE (   4.29  )
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

At 2026-10-16 22:12:48, "Jiale Yao" <yaojiale02@163.com> wrote:
>The PLIC and APLIC MADT callbacks cast generic subtable headers to
>fixed-size records before checking that the complete records are
>present. Truncated firmware entries can therefore cause out-of-bounds
>field reads.
>
>Reject entries that do not contain the complete controller-specific
>structure before registering an interrupt controller.
>

Fixes: e77b8dc02a1c ("ACPI: RISC-V: Initialize GSI mapping structures")

>Signed-off-by: Jiale Yao <yaojiale02@163.com>
>---
> drivers/acpi/riscv/irq.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
>index da2c42e0ebfd..1f6fee5c5746 100644
>--- a/drivers/acpi/riscv/irq.c
>+++ b/drivers/acpi/riscv/irq.c
>@@ -220,6 +220,9 @@ static int __init riscv_acpi_aplic_parse_madt(union acpi_subtable_headers *heade
> {
> 	struct acpi_madt_aplic *aplic = (struct acpi_madt_aplic *)header;
> 
>+	if (BAD_MADT_ENTRY(aplic, end))
>+		return -EINVAL;
>+
> 	return riscv_acpi_register_ext_intc(aplic->gsi_base, aplic->num_sources, aplic->num_idcs,
> 					    aplic->id, ACPI_RISCV_IRQCHIP_APLIC);
> }
>@@ -229,6 +232,9 @@ static int __init riscv_acpi_plic_parse_madt(union acpi_subtable_headers *header
> {
> 	struct acpi_madt_plic *plic = (struct acpi_madt_plic *)header;
> 
>+	if (BAD_MADT_ENTRY(plic, end))
>+		return -EINVAL;
>+
> 	return riscv_acpi_register_ext_intc(plic->gsi_base, plic->num_irqs, 0,
> 					    plic->id, ACPI_RISCV_IRQCHIP_PLIC);
> }
>-- 
>2.34.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
