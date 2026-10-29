Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9873C606A333
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 03:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T5iER3HC;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ayjl8lBk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=voiizqtkDIu7/9j9b3ObvuAtFP6EDHQouCsag7TO66E=; b=T5iER3HCjqCpBxGapuzZKuKgnA
	VHQ8ftdN+s4A1r/vaGHeBgGz8bqBeq29u+I+CcnVZg3kVw+Rrvh+2vQvkGy/SC3P5ssdTz19G2eTn
	/4V3xwm3QCrPwbq14zUczm3/WuXEdl57W6JTX1++/RbFMc+3YHMGJBg7W8gEdMfJaSzEgKWiIzpQ2
	lGr9mswuTMwXvVQOO7aLhdJxgdLjUR46+sOKgN9ieegLMctr4eC/eqNaobfyexgFiTIXJp/rp6NYt
	NOIEoQ6WlqRSJinmnPAN1gLlTzT8NI6Kn6beKNkYC3hxMN6eUwkPI2K7YXvTj08TPViefOdq3pfp4
	hOUMgZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHD2-00000008HHU-3ENT;
	Thu, 29 Oct 2026 03:53:48 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCx-00000008HDD-2QeR
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 03:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=UY
	7MooYqNCJjJHtEgJ9cEZN73LfDNc9l0RKZDYXUwoA=; b=Ayjl8lBkWnUJmKwyLE
	WqO1vFqQKKQq60H22r2WVq532gIaoDTbzCfRSMPDzX5cwzNfNz15wDS++pu1u3tc
	sLuhr0YsSjHKHCoWyAVFQcCjumnGR3/5R4BSJCe7ieHBsc+UJGcoPL+/j1nBT10z
	tdGI+ZY9bBxPP8mJRY6FMt58g=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCnsSkVw+JqTWv_Cg--.16381S10;
	Thu, 29 Oct 2026 11:53:05 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 08/20] ACPI: riscv: validate interrupt controller MADT entries
Date: Thu, 29 Oct 2026 11:52:39 +0800
Message-Id: <20261029035253.2333852-9-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029035253.2333852-1-yaojiale02@163.com>
References: <20261029035253.2333852-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: PigvCgCnsSkVw+JqTWv_Cg--.16381S10
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF15Ww17ZrW7XrWxJrW8JFb_yoW8XFy7pa
	yUKw1Yyr45tr4fWw17Kw15XFy3G3yUGFsIvFWUua4IqrsrKFW5XF90qF1a9r95Ja1vgw4a
	vr4vyFyUuFW8AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPPEfUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wFMhmriwyFalQAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_205344_019922_D6142335 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PLIC and APLIC MADT callbacks cast generic subtable headers to
fixed-size records before checking that the complete records are
present. Truncated firmware entries can therefore cause out-of-bounds
field reads.

Reject entries that do not contain the complete controller-specific
structure before registering an interrupt controller.

Fixes: e77b8dc02a1c ("ACPI: RISC-V: Initialize GSI mapping structures")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/acpi/riscv/irq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index da2c42e0ebfd..1f6fee5c5746 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -220,6 +220,9 @@ static int __init riscv_acpi_aplic_parse_madt(union acpi_subtable_headers *heade
 {
 	struct acpi_madt_aplic *aplic = (struct acpi_madt_aplic *)header;
 
+	if (BAD_MADT_ENTRY(aplic, end))
+		return -EINVAL;
+
 	return riscv_acpi_register_ext_intc(aplic->gsi_base, aplic->num_sources, aplic->num_idcs,
 					    aplic->id, ACPI_RISCV_IRQCHIP_APLIC);
 }
@@ -229,6 +232,9 @@ static int __init riscv_acpi_plic_parse_madt(union acpi_subtable_headers *header
 {
 	struct acpi_madt_plic *plic = (struct acpi_madt_plic *)header;
 
+	if (BAD_MADT_ENTRY(plic, end))
+		return -EINVAL;
+
 	return riscv_acpi_register_ext_intc(plic->gsi_base, plic->num_irqs, 0,
 					    plic->id, ACPI_RISCV_IRQCHIP_PLIC);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
