Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAFE1125808
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZG4TdeQIKrz/ELExVTuNiTJhqXvtf30tcuE5DjabYY=; b=PkBTO+73gFIOdB
	4hFWfLs41hyKFa/bmFcQzYl6lkz2Q3gygL9K6UwK7tZWqw+F76YQlZ/Eq5dnq6SumfWRGzbPqfDUy
	fJUhCfbd5ebUfNv1qbFv/PjnwMOziq1oN9qKAeO5qQ5+BTWPlHnk3sfzMPMbEpUYR8zKBmYGlADRX
	e3BjXf+S52WsRYagOQzdtGbed7G2AmPoVBdkL9IRxm1e6b0++jmCr2t+2U1sLc+F5BHHDV0qEzoDx
	aTjXeYX4a+X3+F8pLB9YlZB2h4fFgDjt0WI65JnFLWt56EnDep6Faoe1LIeoGnNROLdNTD4SBZoiz
	+hDgcWRaF/lVOQhHkbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Jaq-0000000BdjI-1TmH;
	Wed, 11 Mar 2026 13:27:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Jal-0000000BdhL-3Q1F
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 13:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5BBB4457E;
	Wed, 11 Mar 2026 13:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB58FC2BCB0;
	Wed, 11 Mar 2026 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773235634;
	bh=41IZMqDKuz/6MXeNloPVlflrmSHQD4lgmzdF8Vzr3C4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Wg/z9oGZMQ8Upk/M9sxd5UvjPLn3ccHGiMNUqptULOJmMxWo/9iPpOxqM/oNjprSR
	 XLmF4iO9tjRGo1ITdUgB3Mk8bdYTH6ya9EUi7i3yzyS66JwM4UVFKzR/eK95uIsFXC
	 EWDLYNwQEPjawSucVdg7VP9/PNXVATwDn30CH2zaPs4tXzKonOUVXcufMY4f4pydtV
	 HRYtrPvfXRGx7/09B1kWB5vVian6MwsHH4G9DNLMA7/iSTzJDHWnj6rGmF3mDxeSqs
	 HeqRljlRq6yH1tDKnWx8hoiiCV5ulpCTWFxSRKSwMqai6ItkfVzilB5YCIVNVEP4Eu
	 AswkVwvkivFhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9561125808;
	Wed, 11 Mar 2026 13:27:14 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 11 Mar 2026 14:26:56 +0100
Subject: [PATCH v7 2/3] riscv: clocksource: Add readq options to
 clocksource mmio
MIME-Version: 1.0
Message-Id: <20260311-riscv-time-mmio-v7-2-016845a0f808@htecgroup.com>
References: <20260311-riscv-time-mmio-v7-0-016845a0f808@htecgroup.com>
In-Reply-To: <20260311-riscv-time-mmio-v7-0-016845a0f808@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773235633; l=1888;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=Jv3vpBN1+Uh24vJH4CQZDSOQFXoXTNQJWJ4G2f0Tyms=;
 b=Wm4pnQNuSaGPFUBpuq6TtRUM/iSnjVcf5KngdyLUNX4MMZ1f/TyMH1XPBLeEXuSw7VHoGZkdj
 61dIQnhqjloANjTX9T3btPV0/UEGZ1kT1f/te1W2lVdqHqZ3+XBWhnj
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_062715_896665_FD41E188 
X-CRM114-Status: UNSURE (   8.44  )
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
index 9de75153183124cc8997c6ab61d0c01d9b2637bc..6329d8ce2c0911b5c6de34346b5ca8de40b93099 100644
--- a/drivers/clocksource/mmio.c
+++ b/drivers/clocksource/mmio.c
@@ -17,6 +17,20 @@ static inline struct clocksource_mmio *to_mmio_clksrc(struct clocksource *c)
 	return container_of(c, struct clocksource_mmio, clksrc);
 }
 
+#if defined(readq_relaxed)
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
index 65b7c41471c390463770c2da13694e58e83b84ea..df8ea45ec60a28e0276020cb95ab5328bec89879 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -276,6 +276,10 @@ static inline void clocksource_arch_init(struct clocksource *cs) { }
 
 extern int timekeeping_notify(struct clocksource *clock);
 
+#if defined(readq_relaxed)
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
