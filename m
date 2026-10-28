Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E20606A31D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 05:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i07hIS9W;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N8TIAltF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3DltlQ/q+h+EMBseJJXiwV1ZK5rTBsQVjrq8QS0tdbI=; b=i07hIS9WCBjPARVrVIB9VFTb8W
	lwqgEg47LbygPJGjNcVKIpKUfLvf21PtLHFpWVjrtAfce+Y01YCaf6vdW+U1qb18gdc94GpETWGCi
	MkXnqTgitEEB0Z07NNbsRLXtTLGM3WQPqQiEpCoGTshcpSMyBoFUxe6CrvKAn0n7pU+iDih1UTW5v
	nDBRxALu7tDMB68LLKsyyVlgHt8yhkTNU8TJSF7cT6XzZc+UezHkrtn4MgHTY2XfczrCTxwpr/UWS
	391Ph2QUboID1bPW+9vN3q8EZ2Yo+Ftb2INATeZFeQ4RmQtcGCASRRiWqZ0KGvUrVTuSr/jQrfrEF
	7Ilil3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvnj-00000006Jwz-08zD;
	Wed, 28 Oct 2026 05:02:15 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvnf-00000006JsQ-0u7H
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 05:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2O
	oM9aqdEMWmFV24OBqNFCnNw9L/ZSPQ/qm/z6qoipM=; b=N8TIAltFsTqJoP2abj
	xeHlFG4XEHZ9TDV4Erbx0qdUYy0k+v79kgJSytxE3At1kFbauel/rOlh9tNpREu9
	RIr7mU5JhCv34XRxiNz1WUWwxTxbGsWBMYwHB80hzqHh0xkGSovCbE0pT3RasCuN
	XABx3Uu4jelnXzY9bF3MwRLHM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3v2KngeFq+hfDCw--.20542S2;
	Wed, 28 Oct 2026 13:01:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 12/12] irqchip/riscv-intc: validate MADT RINTC entries
Date: Wed, 28 Oct 2026 13:01:27 +0800
Message-Id: <20261028050127.122684-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3v2KngeFq+hfDCw--.20542S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uryfuF45KrW8Xr4rJr4xJFb_yoW8Gr1kpa
	y8trW2vr4Yya1Svr17Kw1rJFy3Aw1DCF9FqFWUCay3Xr4FgrWDXFy2yw1FvFn7Gay2ga12
	9r4FgFyru3W8AwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uv-erUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wid12rhgajPTgAA3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220211_703861_716E8DF7 
X-CRM114-Status: GOOD (  10.28  )
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

The ACPI initialization callback copies fields from a typed RINTC record
without checking that the complete record is present. Reject truncated
entries before allocating or reading per-controller data.

Fixes: 7023b9d83f03 ("irqchip/riscv-intc: Add ACPI support")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-riscv-intc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 0595144116e2..6884fa413df0 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -344,6 +344,10 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 	int count;
 	int rc;
 
+	rintc = (struct acpi_madt_rintc *)header;
+	if (BAD_MADT_ENTRY(rintc, end))
+		return -EINVAL;
+
 	if (!rintc_acpi_data) {
 		count = acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, riscv_intc_acpi_match, 0);
 		if (count <= 0)
@@ -354,7 +358,6 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 			return -ENOMEM;
 	}
 
-	rintc = (struct acpi_madt_rintc *)header;
 	rintc_acpi_data[nr_rintc] = kzalloc_obj(*rintc_acpi_data[0]);
 	if (!rintc_acpi_data[nr_rintc])
 		return -ENOMEM;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
