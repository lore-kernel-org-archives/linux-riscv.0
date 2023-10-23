Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7198DCDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JysFqVdfENDyPf5ltNOKFgDFqnkufuI3AvrQvp7XI+k=; b=VFpmhmf4OOF3TG
	/lkduIfJs9nnDNn4NNx+TA9r5WHBGsgnQqMuqufPuWEIGnZb8KHkmgGU1nLR0rn2a8MEboOknYePm
	hPZiWx6aDFVHQY85r5eQPu1cCLLduEfNaTxy4F3sHY1gV13clIG/T+8TlbRqa7VRa0T/i3L/dh4NM
	NwlMlfwv7Ge2GbTqpM+eKOJ0ORGkhtAI2LekR6Sv4wo/d3tW+SfceyzSx+o6vE+/VLWRudNemWmNN
	G35cgT776UAVvg6drC0gODoMIgvHIt746+pvwZxvXUvVN+3CO1c2f/CpOh605TSeY1SVaS7IeG9PV
	GQa0AkpWdCHTNPNAV+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqKR-006lLl-1d;
	Mon, 23 Oct 2023 08:30:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqKO-006lK3-3C
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:30:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c9e06f058bso29330325ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049823; x=1698654623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DBuRxeBwydw4BwBQS/PBMNuUJKwvOuK50YBTu/VQqs=;
        b=fSJk8zMYngAD5EGJ4K0FP25izTLvroaccnT5B6kysHgklXot5Jd74NCsRtc89bveEO
         +z8zH88Ib0SsbxvF2QXOFLgpRU0l1v/iENSdpJV6XJvil8xqYnwB+patPlkGGZCVxLLg
         nHiBu1jh4tf8/maing9yKR+oAVzbXngjCjCgRgX6nhUqrnzKFfG3ET9R3WGO0PQBgxW+
         HvtxZvzdgWny2QENtTfzZHjQl4/oIerWRl/33c5tdV9C1hxSHuUi403+XOowoMn0u7+u
         0xTzWvYVd/FW/v8yFoGM04Y2mrb7uiHQMQL20DFqYA9+sXAm1wuqmmUvAd/UVJFmrMcf
         jfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049823; x=1698654623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DBuRxeBwydw4BwBQS/PBMNuUJKwvOuK50YBTu/VQqs=;
        b=YutzziCu3djhoXlFyX0xbyn5Lj8XDWm/TzI5wjaKzQWpprA6qdKVFXx3ygqUWiZntH
         Sxb4q/vKGdVpQ4JXj/Hnw3CGQCgDiAMnVJeAzO+uUqZtdRFFDbLXWuX6r7bvt6eT0g1u
         sfJpRXk80Kv21yi+whCiq1lXCWHyXMHYRBQVR3CitnrijLAiw2dMtefqSu6aTA1UNZSw
         QlBQHV7v5UCThq6uSd4rgmocSjXMojarDJsRSkLT7LZ1a5JFue4YuFXz89Qldv8yH9op
         W/dynylYL0fVFvC19NwyTi7W+1wYK56NmlLn93biwhKNbELBAUMAptA3NEMAp7fuVC7N
         4D3w==
X-Gm-Message-State: AOJu0YwsaF8ERpaz8cq4q9TQuUn1YahIyh2ICwViYyRIHr56A17i/qaJ
	aWaBbMOfZ1CDcow0kzIV8XFlfA==
X-Google-Smtp-Source: AGHT+IFbYL9LzR1f7qPWMFMhpIw/jq2fW6XuDR85z/dEj8js9eHh6BWdpBWgonHNNRMuACn/U0IMZw==
X-Received: by 2002:a17:903:32d2:b0:1c6:d0a:cf01 with SMTP id i18-20020a17090332d200b001c60d0acf01mr16447416plr.11.1698049823515;
        Mon, 23 Oct 2023 01:30:23 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.30.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:30:23 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	maz@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	liyu.yukiteru@bytedance.com,
	sunjiadong.lff@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	chaiwen.cc@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC 11/12] riscv: Request pmu overflow interrupt as NMI
Date: Mon, 23 Oct 2023 16:29:10 +0800
Message-Id: <20231023082911.23242-12-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_013025_031297_77F893B5 
X-CRM114-Status: GOOD (  11.94  )
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

This commit registers pmu overflow interrupt as NMI to improve the accuracy
of perf sampling.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/irqflags.h |  2 +-
 drivers/perf/riscv_pmu_sbi.c      | 23 +++++++++++++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 6a709e9c69ca..be840e297559 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -12,7 +12,7 @@
 
 #ifdef CONFIG_RISCV_PSEUDO_NMI
 
-#define __ALLOWED_NMI_MASK			0
+#define __ALLOWED_NMI_MASK			BIT(IRQ_PMU_OVF)
 #define ALLOWED_NMI_MASK			(__ALLOWED_NMI_MASK & irqs_enabled_ie)
 
 static inline bool nmi_allowed(int irq)
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 995b501ec721..85abb7dd43b9 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -760,6 +760,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 
 static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
+	int ret = 0;
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 
@@ -778,20 +779,30 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 	if (riscv_pmu_use_irq) {
 		cpu_hw_evt->irq = riscv_pmu_irq;
 		csr_clear(CSR_IP, BIT(riscv_pmu_irq_num));
-#ifndef CONFIG_RISCV_PSEUDO_NMI
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+		ret = prepare_percpu_nmi(riscv_pmu_irq);
+		if (ret != 0) {
+			pr_err("Failed to prepare percpu nmi:%d\n", ret);
+			return ret;
+		}
+		enable_percpu_nmi(riscv_pmu_irq, IRQ_TYPE_NONE);
+#else
 		csr_set(CSR_IE, BIT(riscv_pmu_irq_num));
-#endif
 		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
+#endif
 	}
 
-	return 0;
+	return ret;
 }
 
 static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	if (riscv_pmu_use_irq) {
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+		disable_percpu_nmi(riscv_pmu_irq);
+		teardown_percpu_nmi(riscv_pmu_irq);
+#else
 		disable_percpu_irq(riscv_pmu_irq);
-#ifndef CONFIG_RISCV_PSEUDO_NMI
 		csr_clear(CSR_IE, BIT(riscv_pmu_irq_num));
 #endif
 	}
@@ -835,7 +846,11 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		return -ENODEV;
 	}
 
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+	ret = request_percpu_nmi(riscv_pmu_irq, pmu_sbi_ovf_handler, "riscv-pmu", hw_events);
+#else
 	ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler, "riscv-pmu", hw_events);
+#endif
 	if (ret) {
 		pr_err("registering percpu irq failed [%d]\n", ret);
 		return ret;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
