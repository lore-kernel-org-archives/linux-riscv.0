Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E4FCD8CB9
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtueV8tMLuYhBvTkwQk8HWqRxxwF2OQGKtyjEf7qe0s=; b=alz1Os9VL+Vfj1
	nkUNNM+XGIegp7nysYyAIHfB1gnaNt/ir61CEnzRqQHIlgYX7SR85Ttiecqpf1oKC4+jaUWeFVzSF
	iBgc2VyzFuNjFuRBWu9XPiJNQvrpK3eM4eEBCW3MX9nbumNlfVgG4q3u0d1xoDIYKrkaFGszmC1s3
	yODtJxjinOcOpDx1OI8pd2OyuRdlnOBG0ft/k96dVPLPvJtOrXpQm6GC7FVVDTuf4yrSc/KGPMf1A
	Vo+An0qfqksG6i0pZF5hiELz/ncWlNLJHajLmO4qJ1ZnpwoNQ5j9/0GsH9P0yScsERiIYpeEcwk+O
	KFqwmrS4TBJAqACIKyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXECY-000000073gU-1xJ1;
	Wed, 10 Jun 2026 08:22:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXECX-000000073fx-3Gan
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jun 2026 08:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CBF1445D2;
	Wed, 10 Jun 2026 08:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00768C4AF0F;
	Wed, 10 Jun 2026 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781079737;
	bh=YSQJCU6UP8xSjWxbVovXreGZS/Xd6/2Gt8PJB5MgUBM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DssbTQ4MZwLSydMjj4GKgx5FU+ps1NurdtpBZ8tq4k0kiIspg4PmLTAGHfCj213vU
	 Uwv3fPo1FpsBaNt9ufl94ULfYYKPHw5w6vZVKQMcpYxaux02RuAd+rSUgowdFSjy9P
	 gpqyGd/b//NZpQArwVxQL5LkwSdPDkp+E5HaNIb/xf8Z0SI2Hse6v+GcmO/iHWZKnL
	 JoJrWjwHve6KM8WBI8Ww00+rqMHwRjW/7SqGpsQr/LJFEIY4nrBAnVe/cUZ68LCxbB
	 ipvWP4KmlFVJvn09UsTeEYnDrr/4soCQOSW5+ouoUYCIKzI1e3FqDqkV8f61yQ3yUw
	 aNaTo/csjZx4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC9BCD98CC;
	Wed, 10 Jun 2026 08:22:16 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 10 Jun 2026 10:22:14 +0200
Subject: [PATCH v8 2/3] riscv: clocksource: Add readq options to
 clocksource mmio
MIME-Version: 1.0
Message-Id: <20260610-riscv-time-mmio-v8-2-a865206675c6@htecgroup.com>
References: <20260610-riscv-time-mmio-v8-0-a865206675c6@htecgroup.com>
In-Reply-To: <20260610-riscv-time-mmio-v8-0-a865206675c6@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781079735; l=1938;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=xJr18GUgwDimiDlbxKI0yWHxvsNJAqXLsf1ztMWXw7U=;
 b=yv5D2RvaX+sHBRQBuSlIIRHz3jJTMIdXpatDDma79NEGCiv2+aRFC0J0r9pLUfMHguQVbone0
 c0ySsuGxYzMDzaLESRDP3HwkEDEFXOW+38seVYnhH5YD5/qnmQ3mGGB
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
