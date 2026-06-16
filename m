Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69098CD98E3
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtueV8tMLuYhBvTkwQk8HWqRxxwF2OQGKtyjEf7qe0s=; b=qYTjePzNKHKh3r
	aTFJmAv92WNK+OJKXNYQBVSOZVHRkJGb8Ag7NXXdsf2YEd2WDtPa+3QlXvEXLPnCNc+g/9BrqyVNw
	Qw4aBePKjyC8t4+grWOQM/3AR7v1w7tYxeHnaQwjrb2xwF8ON7RXyZgMfj3J+O6LmWJYHXCqDF85n
	p1A2R9GLhzkjefnyhjEBxUlTEtHAO7XbF917MxWyS86rEAwBfDhQShTAuCkb/FfXG1lpVLpAIer3d
	HROUOT9HbXniQiRE2fi19RRDD3w0PrcBNl2QGpzXySrS5C1Z879U/B08YRMtF08WzwkclWyfLMacY
	TIEAMOPg3nVFAnEYr5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWGN-0000000G4Vy-17SO;
	Tue, 16 Jun 2026 16:03:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWGL-0000000G4VK-1Kzi
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 16:03:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2577445AB;
	Tue, 16 Jun 2026 16:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBDD4C4AF13;
	Tue, 16 Jun 2026 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781625820;
	bh=YSQJCU6UP8xSjWxbVovXreGZS/Xd6/2Gt8PJB5MgUBM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=igb3NArz2SNq99p6/eGKfm+ZwpU8vcYSeyM0Y29KmZS4J1lWke91AmPGozsGg10u6
	 CU6siMFziuQiK/41VA6MboxtdanZaEl4SmbG37fvGsdfNBBJ7avkDad1M6PCj7x30T
	 cpSoad3lf7dLw0EGvqk5Daq+YG/y+V80dg7/xM4k0un0JDu64vAPqr9S0snSBAPfnT
	 pNrpqWUYXbmsprHeMdPtVvzYjgJyrcHdJ5oZso8Oys0KiRhmKW4DN5ujdMCnRBzoPI
	 u5bkrt67ZIFVgiZijDgfQ+VQgZAdXxhSWricaqS7Ydlws4Fmw5vCBooSlmeF9TSpjt
	 8wgYnn1eQYNhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A692DCD98E4;
	Tue, 16 Jun 2026 16:03:40 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 16 Jun 2026 18:03:38 +0200
Subject: [PATCH v9 2/3] riscv: clocksource: Add readq options to
 clocksource mmio
MIME-Version: 1.0
Message-Id: <20260616-riscv-time-mmio-v9-2-03af7bc8f2d8@htecgroup.com>
References: <20260616-riscv-time-mmio-v9-0-03af7bc8f2d8@htecgroup.com>
In-Reply-To: <20260616-riscv-time-mmio-v9-0-03af7bc8f2d8@htecgroup.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Chao-ying Fu <cfu@mips.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781625819; l=1938;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=xJr18GUgwDimiDlbxKI0yWHxvsNJAqXLsf1ztMWXw7U=;
 b=By06W4XK0v5RRGKaBEE57X5AIAtQGToFihzCgmHqkNKkwU+nNA/KnKJmMbbpzH+UjvOaAqS3R
 xbe3ySTGRkXAsxhX9+Q6nB1NohkgOMtPtAr2JRaclgTb6qi86f27crI
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add read functions for 64-bit register size to the generic
mmio clocksource, covering both up and down counters.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 drivers/clocksource/mmio.c  | 14 ++++++++++++++
 include/linux/clocksource.h |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clocksource/mmio.c b/drivers/clocksource/mmio.c
index 9de75153183124cc8997c6ab61d0c01d9b2637bc..f3b6f7e93ffbf0ed68e56c58c3d9f711d2193caa 100644
--- a/drivers/clocksource/mmio.c
+++ b/drivers/clocksource/mmio.c
@@ -17,6 +17,20 @@ static inline struct clocksource_mmio *to_mmio_clksrc(struct clocksource *c)
 	return container_of(c, struct clocksource_mmio, clksrc);
 }
 
+#if defined(CONFIG_64BIT) && defined(readq_relaxed)
+
+u64 clocksource_mmio_readq_up(struct clocksource *c)
+{
+	return (u64)readq_relaxed(to_mmio_clksrc(c)->reg);
+}
+
+u64 clocksource_mmio_readq_down(struct clocksource *c)
+{
+	return ~(u64)readq_relaxed(to_mmio_clksrc(c)->reg) & c->mask;
+}
+
+#endif
+
 u64 clocksource_mmio_readl_up(struct clocksource *c)
 {
 	return (u64)readl_relaxed(to_mmio_clksrc(c)->reg);
diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 65b7c41471c390463770c2da13694e58e83b84ea..39e0df5a0ab52cbb7016b53a4d7500f2697e2797 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -276,6 +276,10 @@ static inline void clocksource_arch_init(struct clocksource *cs) { }
 
 extern int timekeeping_notify(struct clocksource *clock);
 
+#if defined(CONFIG_64BIT) && defined(readq_relaxed)
+extern u64 clocksource_mmio_readq_up(struct clocksource *c);
+extern u64 clocksource_mmio_readq_down(struct clocksource *c);
+#endif
 extern u64 clocksource_mmio_readl_up(struct clocksource *);
 extern u64 clocksource_mmio_readl_down(struct clocksource *);
 extern u64 clocksource_mmio_readw_up(struct clocksource *);

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
