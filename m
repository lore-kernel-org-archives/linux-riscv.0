Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE7B606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j2VVGjox;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=gyL32gXr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aU/TU68ArduMW+Vqw2nAR7VLXPMoaAXcFox0q/wcs2c=; b=j2VVGjoxLmqB3Y
	o4qb6cha5NCC5dZELXLj7A8a4esPvE8F/02XnQofGXO/rr/MsUWXFr9dm/u5LCtEakrirBPUlzrTv
	olu55pcUA1qyZPwDZQdobjEfAx0k2pX5FqHTZBmgjKhJ4Y0UDPKMHoV6GoIUUaYerTPoPhVq/iWTH
	uEfp6Nb0x5iUsWoh8pvz64ers8f0cJ2YC8ksSSyFNFvzwb3Sn/FkW977FODS/2ESdJONpNfptZb6L
	3dPVro4wOBnmAlA5n/k/IovyBD0Z1ITWORtltTojc4zLQdvzsVFMcD/ZFyAaFs4C/1W693/6pLlUu
	08P7wbUBL3k0YONHnPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBw1-0000000A4fi-06ew;
	Tue, 20 Oct 2026 15:39:29 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBvt-0000000A4dF-2oCO
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 15:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1792510768; x=1824046768;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=gYKX22JJXvjBQaFR9/tw6kVOEs7CPr0eQzlXEVHWhAM=;
  b=gyL32gXrCYgmlehO6yjXef8l7vPvakLVQp0UeJsosSa6J9ND/gov9xNt
   f9kBm/pR9bQoS/mvIOylLuXou+NXlEq/1t6TCi0ML7gG9b1laFUdRVTPr
   sGQmZAk6Blbi1K6Sv3EQlAq7NISo2ioCnGjQ+YTl55KwVILUWGlsx+2JF
   f3/a5TjQxV19bor8bgSjvVaKMGExTi9nW/qMjKYou4YvGmZqNjR0jgFcf
   gr2N6RepRjZZ4OyZwl5XhMInxG61ERmd8fLAgD4LHAGr+xXiUPqlOkoiH
   zzk2LbtimeyrbBb3/gcpia1ck9HjwwKTc4biLG/UCVZCJZCUJ0SBF6X9L
   Q==;
X-CSE-ConnectionGUID: a8G1fX0CR7KW1QSEKLpIuw==
X-CSE-MsgGUID: hQ/dm0cDTsOJmg05KdkANQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 18:39:20 +0300
X-CSE-ConnectionGUID: AoT8UrKGTraFis5HMcQdyQ==
X-CSE-MsgGUID: wgiBKU4qQAuY5JlkNLQL6g==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 20 Oct 2026 18:46:49 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 20 Oct 2026 18:39:12 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Tue, 20 Oct 2026 18:38:49 +0300
Subject: [PATCH v5 2/2] irqchip/riscv-aplic: force synchronous probing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-aplic-async-probe-v5-2-c4861c2aafca@mobileye.com>
References: <20261020-aplic-async-probe-v5-0-c4861c2aafca@mobileye.com>
In-Reply-To: <20261020-aplic-async-probe-v5-0-c4861c2aafca@mobileye.com>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jessica Liu <liu.xuemei1@zte.com.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_083921_980658_E6AA6574 
X-CRM114-Status: GOOD (  15.75  )
X-Spam-Score: -4.0 (----)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The APLIC driver leaves probe_type unset, so it follows
PROBE_DEFAULT_STRATEGY and is probed asynchronously when the command line
requests it (driver_async_probe=). The probe of an APLIC instance updates
state shared by all instances without any locking:

- the check-then-set of aplic_syscore_registered; two instances can both
  observe it as false and both call register_syscore(), inserting the same
  list node twice and tripping CHECK_DATA_CORRUPTION ("list_add double
  add") in __list_add_valid_or_report();
- the global aplics list, modified by aplic_pm_add()/aplic_pm_remove();
- aplic_direct_parent_irq, where more than one instance can pass the check
  and register its own CPU hotplug state;

Interrupt controllers are required early and have no benefit from
parallel probing, so rather than adding locks around each of them mark the
driver PROBE_FORCE_SYNCHRONOUS. Probes then run one after another from
driver registration, and deferred probe retries are serialized by the
single deferred probe work item, so the shared state is never accessed
concurrently. Probing is also blocked across suspend, so it cannot overlap
with the syscore callbacks either.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 5369078f3d00..3c10dbf3b492 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -118,7 +118,8 @@ static struct syscore aplic_syscore = {
 
 /*
  * Not __ro_after_init: probe can be deferred (e.g. MSI mode waiting for the
- * IMSIC) and complete after the init memory is made read-only.
+ * IMSIC) and complete after the init memory is made read-only. Probing is
+ * synchronous (see aplic_driver), so no further serialization is needed.
  */
 static bool aplic_syscore_registered;
 
@@ -413,6 +414,12 @@ static struct platform_driver aplic_driver = {
 		.name		= "riscv-aplic",
 		.of_match_table	= aplic_match,
 		.acpi_match_table = ACPI_PTR(aplic_acpi_match),
+		/*
+		 * Probes of multiple APLIC instances share global state (the
+		 * syscore registration and the parent interrupt of the
+		 * direct mode) and must not run concurrently.
+		 */
+		.probe_type	= PROBE_FORCE_SYNCHRONOUS,
 	},
 	.probe = aplic_probe,
 };

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
