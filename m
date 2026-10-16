Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD27CCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 06:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjhcMLMsJk3noW1MlmnSYJtdPnd3lHg6lCAQ2kDUAe0=; b=QfQqyZDAWmLIrQ
	0esQXAR9AQJhxYjYFWAu/KW7xeMFcqwvYs4p6UNku2dNwtevMgl0aLXLCVDMMaloP9xT20OnuaRFr
	lv8YFkjW6+Qpo78j60ei3DvLIM8OeYN/lLEgj77RkHHkNJC+7PxSu9Bo1muMZqI99m1hZlNx9u2TT
	0mL5zmw2dskQm07BnT8s8AZhlkAyI+J6P/qhwSqrSKKpRHHZpfA7x9DTbER/muP1BdO8iO7iRi44q
	onFjz4jsieX15BbnqQm0j9BnAeR+91PkDHHAZOk2lJfWP8jnTW1K2BXvw0tIwA8axeRiJHl6FeGVA
	H0ceyW5UktpkDTNMIoIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbG9-0000000267Z-1PMY;
	Fri, 16 Oct 2026 06:17:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbG8-0000000265o-1hek
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Oct 2026 06:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9ICQyIKowVj3RyrjMn4gMzYuhROzG3qohL1WARXEfQY=; b=EZqEy0jieMekzTzKtcieD4ck9g
	dKP9PQf4S4pcXBsfbi9/JG1/smkhIwMVHcpSu0KOlWXbPl8aFHenrZloVL0ESP1fXAivJcas4oQwq
	WhYw73zii89eQ/qZ4Wp45g9YUhOG07pjJODWRtZiiuRoS2kBZ7jzY7bPk0M5XZEhe9I1U67QTehVy
	rxCyGSuxmeiDHRQqBbEI0h6fD5rPrlv0Ks4eU0+3mjg6NBRrCgLTf7yz88aZFvVpfFAxGOk6e3yuw
	CpKbPqONW1VM2sLgaIfkvrbwwZtdMNduMDlubFxKF23oDQI2hDuCZyPQRTe/bZTNsqYTHeDNrXfiE
	MHULls+w==;
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHbG2-000000019rK-3oHM
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 06:17:38 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cd65a511e43so73726a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 23:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131453; x=1792736253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ICQyIKowVj3RyrjMn4gMzYuhROzG3qohL1WARXEfQY=;
        b=TGg/1iiwz6O4Zix/0UXhNig29Yfefl+J0q1Mz2KPkZOYD5OWNE6XHQapjJyGZLDX3U
         F50Ddirkxzk6MH9idpoClz3i+Qrc10O8PXG3sECOl4J48m31oQuaT+YfCfAv67a396WF
         1Z2CMbYNTukoqH5fbReRjAoBSfuR+ddTq94bPoi7iy12AGBWRVZsYOaM/u+sZxASichn
         PRosWdk/WvHp2T1IurmPwFA3FFGqYdRKgZ/SFQD9ftiAwVGr3aQ5fKoeTSDUFY656QSb
         rlHXviO7y4xDxEeJCkSmOSLGBSemxs34TSJ7vJIy6FXodVl8L2SkrtBp1TWXdXEE36c8
         ding==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131453; x=1792736253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ICQyIKowVj3RyrjMn4gMzYuhROzG3qohL1WARXEfQY=;
        b=V9uLBIipWO9QW6hxcoTDNP5coH6CQlVSdKdK+zhFEkmf5hXnRfvBnh1GYS8a0Wudgr
         hiuu27fSBBeVo5qH16SuQpp908onh/M1LQya+E0FXPYojx6l9wgUGeJOgoqs/T3igdXs
         2NnznARkkNTTXerEtFbNgDUTB3zYYX8NB2EWt/w2e+464f59MN7NzZLLSOsxl65Mf1Ev
         iKVwnKwnPx5GR9CyX8tkkTUtWfXios7BUgUDq5FpSUmMOMOOirTbzA/YTCK6WIsDkBbA
         zE09EnY8++KkHvtUspX0gp7fdY4/1RhQYmoL8FMgmg17DhCAC/zHYzHQU8yhbq5CEVys
         11xw==
X-Forwarded-Encrypted: i=1; AKwUvBxR+IstXVZ/42n6U4BVDZumiZmzJSAg/0//EM6Vy4ug14iGP6sUy/2HkyEKCaLPyM4IHfkASxkbaBALJw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKFUrAAqhPMi5FcHNvTJMqN/7gGDTSgHgiS1IauBUMOoUNzG97d
	Bb35gNjkp3eZvriLuNPSauzyBSIYVodByYTVMKQJIHQyVr+ocTIXYzTJ
X-Gm-Gg: AYBFou13xyd7S4zW3ImXyMH4ThmuPBFO1c3wZ81KJLlpljm0YBoagU2GaqjAnfs2ob7
	i8n9B+khlo8/RrbNr3bfG8NdEP6ZpTCZbbHHEXFAQl/ihsPFUgWhOPR/rKiqcwYp+0pm6pa2cAd
	W91Y4i7Ajq8nW0nrvFrsonbLIGgd+2OWRpnuNNTQ/4UtBls4+jF8tc9eCjd9icQTRiyctEbyxKR
	Ogcegb2Qhwl/B1RXqRHEgaQwoQKpgLJIqCc2+2SX+mEXy6IVpmd6Ze6Oayk4+U7OhTwOGwBHxAi
	3EI6peA6LL/IobC2AP/NIYhNB6jpGFLmHVKvXDKopyaIUcGQDz6/5eaNp1bGL202UOR5N/Obcie
	TAlVCytek3Cnm2Gtct21GgkwI3MSVT7lgmlQ4PVvwVwyXuireeZd4itKpLG7ikjTujbssVk4DXJ
	1DwaiPjXokZHhLpLmqU5iVW5gCMu45P+X7IPQfisvgxil+TQ6f11+vyUXFUTmpH+rSH3Zq7nIU6
	8b8AFuSIjo=
X-Received: by 2002:a05:6a00:1941:b0:89d:7f51:6492 with SMTP id d2e1a72fcca58-89d7f51698fmr8778955b3a.32.1792131453020;
        Thu, 15 Oct 2026 23:17:33 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:32 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [RESEND PATCH v8 7/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Fri, 16 Oct 2026 14:15:48 +0800
Message-ID: <20261016061549.4181390-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071735_584721_B472051E 
X-CRM114-Status: GOOD (  13.48  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ecc923102622..a5f223a74b7e 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1285,6 +1285,7 @@ void __init unflatten_device_tree(void)
 
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
+	fdt_mark_reserve_mem_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..505735732c13 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_reserve_mem_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..f29a07e8fb23 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -677,6 +677,21 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	reserved_mem_count++;
 }
 
+void __init fdt_mark_reserve_mem_nodump(void)
+{
+	struct reserved_mem *rmem;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+		if (rmem->size && !rmem->dumpable)
+			memblock_mark_nodump(rmem->base, rmem->size);
+	}
+}
+
 struct rmem_assigned_device {
 	struct device *dev;
 	struct reserved_mem *rmem;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
