Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164FF606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RDiZYGOb;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=ICXXVs7e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JOPN7vxFheiXRjz0VXP3U2snDcT0AEaWvqUz3hxZTd8=; b=RDiZYGObukVtlj
	GoFcWPJDOKy8S91110slkdO/tNKHeKyZR3k+VkehEXoECyW4haK3VUta3F0AnY5D0x8pjal5TS2qc
	/mUKTLw2HKjs78YaA0G3ubgI/xlYO8psgVsGtBnxc94bANe/3Rl4dkSjLtOcCyAh6PMarhq6FhVtz
	38pwSAuSjVbms564yycdbwkNMjuXLU/u7sGV1lrSLrMzq/AvVQRVEcW6VtGg30a7ovcW/eV8Lnhj1
	w0EWmq9fmdz8naYbtwiWdr/XAgJbsC5jilCKPyG5qhv/mqb2LUP4y6c6K2EXBHJW8ZmoADg4jBdte
	xcKpO0og6yptQ+sJxOqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBvu-0000000A4eb-3w4u;
	Tue, 20 Oct 2026 15:39:22 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBvm-0000000A4dB-3nz6
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 15:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1792510761; x=1824046761;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=ZKlMgO+Am7f1W6tqLYmCFZtZZ52fpO6WIVEULY/+2O0=;
  b=ICXXVs7eEFwm1xpndMZVmjm6xENIfAKlauz1VGPv7SPh8eV3ciVWJhDs
   JQhsor0aaPokLLhiOJI0gqA72UyooNEfTraVE7a9jO+OiiXp2Pab1U5qE
   ubu7ItESn91FS+EMBwIUExgSkbbQtyYfneir6H/+XMxageHqdHNNzCDzB
   nKuYB7UnlsGL7MeygxxdM54j2uS/cP6AM+wirdgvqmG0TmtvrxadN3jj1
   dYmOj4a9BIHkNC8e645jSt6yh/TPuC87kIxVsbWCH4Ndv94ym4bbWZtpw
   yM6e4mpx84rKjIctTmJLM91fk03LNFMiL9PTDpzRDCV8BHNDFPrWITxaZ
   w==;
X-CSE-ConnectionGUID: a8G1fX0CR7KW1QSEKLpIuw==
X-CSE-MsgGUID: dlrA907vRxCWoNOZMrqIrA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 18:39:18 +0300
X-CSE-ConnectionGUID: mjGPr9p4QrO3rL/VA25XsA==
X-CSE-MsgGUID: W6NDLE3XSNefvPhNS9vl+w==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 20 Oct 2026 18:46:47 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 20 Oct 2026 18:39:10 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v5 0/2] irqchip/riscv-aplic: fix probing of multiple APLIC
 instances
Date: Tue, 20 Oct 2026 18:38:47 +0300
Message-Id: <20261020-aplic-async-probe-v5-0-c4861c2aafca@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAeL12oC/4XNQQ6CMBCF4auQrq1ph7YUV97DuIBhkCZISWuIx
 HB3KytjiCz/l8w3LxYpOIrslL1YoMlF54cU+pAx7KrhRtw1qRkIMFJI4NXYO+RVnAfkY/A1cSs
 NKBK5NqJg6W4M1Lrnal6uqTsXHz7M64tJftZ/2iS55AoBVatrUUpzvvva9TTTEf2dfcAJdhFIi
 DW2KYxVWDZbSL6L5AnR2GpoEKwpxQaivhAQW4hKiLE15poEIckfZFmWNxSqcgCEAQAA
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
X-CRM114-CacheID: sfid-20261020_083915_418837_11D51D2D 
X-CRM114-Status: GOOD (  15.61  )
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

The APLIC driver does not set probe_type, so it follows
PROBE_DEFAULT_STRATEGY and gets probed asynchronously when the command
line asks for it (driver_async_probe=). The probe path of an APLIC
instance modifies state shared by all instances without any locking,
for example the registration of the syscore operations. On a system with
several APLIC instances this triggers a "list_add double add" report from
CHECK_DATA_CORRUPTION, because two instances both call register_syscore()
for the same node.

Looking at the problem showed a second, unrelated issue: the flag guarding
the syscore registration is marked __ro_after_init, but with MSI the probe
can be deferred until the IMSIC is available, and then writes the flag
after init memory was made read-only.

Patch 1 fixes the latter and is independent of asynchronous probing.

Patch 2 marks the driver PROBE_FORCE_SYNCHRONOUS. The shared state also
includes the global aplics list, aplic_direct_parent_irq (together with
the CPU hotplug state registered for it) and the per-CPU IDC structures,
so making probes mutually exclusive is simpler and less error-prone than
adding a lock for each of them. An interrupt controller is needed early
and gains nothing from probing in parallel.

Reproduced by booting with "driver_async_probe=riscv-aplic" on the
not yet upstreamed "Mobileye eyeq7h" platform with 3 APLIC instances.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
Changes in v5:
- split the __ro_after_init fix out into its own patch
- drop atomic_t/atomic_cmpxchg() for the registration flag
- mark the driver PROBE_FORCE_SYNCHRONOUS instead of protecting each piece
  of shared state separately
- Link to v4: https://patch.msgid.link/20261020-aplic-async-probe-v4-1-68bc35e0ece1@mobileye.com

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
Vladimir Kondratiev (2):
      irqchip/riscv-aplic: do not mark the syscore registered flag ro_after_init
      irqchip/riscv-aplic: force synchronous probing

 drivers/irqchip/irq-riscv-aplic-main.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)
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
