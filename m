Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353DD606A31D
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=enjSmF+J;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=A+ecPfT2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2eLeHwFXjfNG9qr873XLX5o9XJwUYH7JrTxno4SDZL4=; b=enjSmF+JPtAFf0
	+rmLce5ImklaRK4WN173xGfVyjMh5zmvAJv6tBYv70dsOgvdoz/tcGAJxT34D0wWmPwxd3eVKXBPM
	0zgKNNvaeaSdErbj+3qTV8fBsVFU5KvOOx0PWlR4yeg3Avgwfeow5n9RtBrlE1YjkGA1kIqx78PAo
	5thNAmPacQhVstBF81M5hW41zeZn/jdwPZBld0hhyBkmqcZusdFsQOWslt77Hb0V9CLCZpniUorDw
	hKti2PgUTqMSYbBC85tHwhR78YpKhR6JvzuwpelWsBxf5zlPNI9F8ABoK1OY8aJafjBz0DAqAOdVa
	EhWLde2EW9YdwH/JNVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7mX-00000009VqQ-3vsl;
	Tue, 20 Oct 2026 11:13:25 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7mS-00000009VpS-1lUF
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 11:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1792494800; x=1824030800;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=43DxCqYx74BgNVGggbQM7tZIdXbth+6fcaCniyNMIYA=;
  b=A+ecPfT28OTHQIjvoZZLmQJbkgaETQuk820NtKI4YWDIEehqBaNeFsbJ
   B2SnwLOtEeSTzxP0VpJTFhg8yleMCimW7TBiKJ4ncc9/bC+H+t3G4mxoe
   USKfTa9fhsFK7DeH52lIozNgrB7fKx+a4XlrT8r/FdTr6VENUXYOzuAsH
   jPxjqLEuCzL7bHOJRlmjBjfe0e0qH3pBFHet/mAm1N2YB3P50/uprelqo
   GZ8xtZMLhVygSo7+M6EkgczGESGNpXwatsjx/StsrBArYeo3WRZRSdg48
   BThuPKARLBqU1oVL0YTdUOLjGiUqrdf2PbaTTLmUzPSLoHC17yQcXC5Ga
   A==;
X-CSE-ConnectionGUID: XkXyg04yQNC0DtHWmJFXRA==
X-CSE-MsgGUID: w0u5Y3m8Qbexa3hSGhSGqA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:13:16 +0300
X-CSE-ConnectionGUID: uI3R6ErPQ7GfhVduOyl9aw==
X-CSE-MsgGUID: dJjfW9ApTY2AycJv7XbKzA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 20 Oct 2026 14:20:43 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 20 Oct 2026 14:13:14 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Tue, 20 Oct 2026 14:12:52 +0300
Subject: [PATCH v4] irqchip/riscv-aplic: fix asynchronous probing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-aplic-async-probe-v4-1-68bc35e0ece1@mobileye.com>
X-B4-Tracking: v=1; b=H4sIALNM12oC/4XNQQqDMBCF4atI1k1JxiTGrnqP0oWOYw1YI0mRi
 nj3Rpel1OX/YL5ZWKTgKLJLtrBAk4vODynUKWPYVcODuGtSMxBgpJDAq7F3yKs4D8jH4GviVhp
 QJHJtRMHS3Riode/dvN1Tdy6+fJj3F5Pc1n/aJLnkCgFVq2tRSnN9+tr1NNMZ/ZNt4ASHCCTEG
 tsUxiosm19IfojkCdHYamgQrCnFF7Ku6weOg6JcPwEAAA==
X-Change-ID: 20261012-aplic-async-probe-81624e035607
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
X-CRM114-CacheID: sfid-20261020_041320_907002_F0ECC5BA 
X-CRM114-Status: GOOD (  16.57  )
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
PROBE_DEFAULT_STRATEGY and may be probed asynchronously when the
command line requests it. Multiple APLIC instances can therefore
enter aplic_syscore_init() at the same time. The check-then-set of
aplic_syscore_registered is not atomic: two threads can both observe
the flag as false and both call register_syscore(), inserting the
same list node twice. That trips CHECK_DATA_CORRUPTION
("list_add double add") in __list_add_valid_or_report().

The flag is also marked __ro_after_init, but aplic_probe() can run
after init. With MSI, aplic_msi_setup() returns -EPROBE_DEFER while
the MSI parent is not ready, so the later successful probe writes the
flag after it has been made read-only. That write fault exists even
without asynchronous probing.

Replace the flag with an atomic and claim registration with
atomic_cmpxchg(), so only one caller registers the syscore ops and
the store remains writable after init.

Fixes: b330fbfd34d7 ("irqchip/riscv-aplic: Register syscore operations only once")
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
Changes in v4:
- rework commit message
- rebase onto v7.3
- Link to v3: https://lore.kernel.org/r/20261012-aplic-async-probe-v3-1-5cf52dc28690@mobileye.com

Changes in v3:
- drop __ro_after_init attribute due to write to read-only page concern
- Link to v2: https://lore.kernel.org/r/20261012-aplic-async-probe-v2-1-868d7684c9d6@mobileye.com

Changes in v2:
- fixed potential access to read-only page
- Link to v1: https://lore.kernel.org/r/20261012-aplic-async-probe-v1-1-4c2c4f5b0916@mobileye.com

To: Anup Patel <anup@brainfault.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Jessica Liu <liu.xuemei1@zte.com.cn>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/irqchip/irq-riscv-aplic-main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index d9afb6ae98cf..54e1d5602f15 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -116,14 +116,12 @@ static struct syscore aplic_syscore = {
 	.ops = &aplic_syscore_ops,
 };
 
-static bool aplic_syscore_registered __ro_after_init;
+static atomic_t aplic_syscore_registered = ATOMIC_INIT(0);
 
 static void aplic_syscore_init(void)
 {
-	if (!aplic_syscore_registered) {
+	if (!atomic_cmpxchg(&aplic_syscore_registered, 0, 1))
 		register_syscore(&aplic_syscore);
-		aplic_syscore_registered = true;
-	}
 }
 
 static int aplic_pm_notifier(struct notifier_block *nb, unsigned long action, void *data)

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261012-aplic-async-probe-81624e035607

Best regards,
--  
Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
