Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9ACC76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 03:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpHKy1uf01fJzAv+VisqTWHSWFr+v6ToB9ZVNWac5ws=; b=jSz9oN4hkqwHq8
	TfGWLZkBYXQ7eb0oGlojgjfhHi85Z9szQvPlFQ7uZVnQceyWOtTmZ3nz/UmqyLofZM4lbVdc9dUnu
	Je/Z/gwRajF/5bU+bn2e9PWT9QLEjmg871dN6F2MuSXKYgNVBD8RrIro5st4Rsox/EgfAmFD9dBpO
	f8s5DgfJzkC1f0sf4j45iLDHL8UxfWBrCcyKfS/mhq4SKm2va+tY31SM5lZN7VeR7MwDOyF0kxKNl
	L+Zqu7DPItFHcKS0FApqEoeT6g0lAT/xD40kMbgUC3ZOzIvJFq4BMzhu7Jp1A3rN1TE+cTo90EJm/
	FkibUcXtqe6jZZH4pOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph0OC-00D3jd-2F;
	Tue, 28 Mar 2023 03:52:52 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph0OA-00D3ig-0V
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 03:52:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id z19so10446764plo.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 20:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679975568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVwIHEbuY4DYODvnj/1FGLFLezToqvIrfjUoJVxDh6c=;
        b=Qzmof5TkaDy435vR/2kdsApGTqv2LymvEK6dsVYIQuJpI6ie6+HAuEc1aygTQHkWBQ
         cj7ZXNIjJglW33iyom/Mczv2lRROzXQLXr2X5OKmJrhqt3Dkrx/aniA5W/kJdQHQYkhR
         cEPASv/mY7OjD3KHCs+xKTey0sijUaC/EDeWIJ0WdmxRmkKupgHN5qHwvbLli5Wgfrt8
         IB7Y91bKDfIngKvahPezqU6zSbtFAfTuwe5MfQpzyTONZkUNBE70T2Lb6/9h2OXMB96G
         fzpnxxnxh1pYfcnMf3u7yRg6LwVUwpI6bm0DnfJ5ZlrMWQ+5hURFvNXnn20hL3k/veGS
         g9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679975568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVwIHEbuY4DYODvnj/1FGLFLezToqvIrfjUoJVxDh6c=;
        b=kJ5nG2uNURjk1+B6+p00hpRtyo5HvLtVd5Nw71FCDrw5A1gCncYksTGUkvQEahFQVu
         fqbBrAfFnAdNsPfaZqb+/Lwb2yuoBX/xVCSwZr3S4MgWLYkkMIOyKhfTIwBjKGHnCF+p
         APcRygm0mfaYx7w72mBxcFGKg9JmgBakukm7WcCrBF6uFZM8faXoaUbOvnIGF8EQWYRL
         ZJvq/2EUrPUGZB8Klg5DWD0FFm4sZspUDQVDVJ9uHYm4H4fv3fJKcBsa6p9ihLhZbV+4
         8ksmg2ZYyOi0Fp3fNsWIIzszt2nTauXpdtzSG/43csj0FKYMpHpLOLTmp1uLdgfxxCqH
         in/Q==
X-Gm-Message-State: AAQBX9dmcrVf/0fNOIcbMI5a4KUm0xaj12itGc7qdA8V7ibCtdtXqaWn
	o27VQDbxEDkeIjHk0iYXF8u5GQ==
X-Google-Smtp-Source: AKy350b7z4snJDo+nMhmAw4uX0lNVsqOnCcXqLC6MBmrd3iAX0+lwbhL8A2ul7tG7f9gnaGPJF+fgQ==
X-Received: by 2002:a17:902:fa47:b0:1a2:3e05:8efc with SMTP id lb7-20020a170902fa4700b001a23e058efcmr6840148plb.33.1679975568486;
        Mon, 27 Mar 2023 20:52:48 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.104])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902740600b0019cb534a824sm19880278pll.172.2023.03.27.20.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 20:52:48 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v18 2/7] irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
Date: Tue, 28 Mar 2023 09:22:18 +0530
Message-Id: <20230328035223.1480939-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328035223.1480939-1-apatel@ventanamicro.com>
References: <20230328035223.1480939-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_205250_192346_CC3FDB28 
X-CRM114-Status: GOOD (  11.65  )
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

Various RISC-V drivers (such as SBI IPI, SBI Timer, SBI PMU, and
KVM RISC-V) don't have associated DT node but these drivers need
standard per-CPU (local) interrupts defined by the RISC-V privileged
specification.

We add riscv_get_intc_hwnode() in arch/riscv which allows RISC-V
drivers not having DT node to discover INTC hwnode which in-turn
helps these drivers to map per-CPU (local) interrupts provided
by the INTC driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/irq.h     |  4 ++++
 arch/riscv/kernel/irq.c          | 18 ++++++++++++++++++
 drivers/irqchip/irq-riscv-intc.c |  7 +++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index e4c435509983..43b9ebfbd943 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -12,6 +12,10 @@
 
 #include <asm-generic/irq.h>
 
+void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
+
+struct fwnode_handle *riscv_get_intc_hwnode(void);
+
 extern void __init init_IRQ(void);
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 7207fa08d78f..96d3171f0ca1 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -7,9 +7,27 @@
 
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
 #include <linux/seq_file.h>
 #include <asm/smp.h>
 
+static struct fwnode_handle *(*__get_intc_node)(void);
+
+void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void))
+{
+	__get_intc_node = fn;
+}
+
+struct fwnode_handle *riscv_get_intc_hwnode(void)
+{
+	if (__get_intc_node)
+		return __get_intc_node();
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(riscv_get_intc_hwnode);
+
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	show_ipi_stats(p, prec);
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 499e5f81b3fe..9066467e99e4 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -92,6 +92,11 @@ static const struct irq_domain_ops riscv_intc_domain_ops = {
 	.xlate	= irq_domain_xlate_onecell,
 };
 
+static struct fwnode_handle *riscv_intc_hwnode(void)
+{
+	return intc_domain->fwnode;
+}
+
 static int __init riscv_intc_init(struct device_node *node,
 				  struct device_node *parent)
 {
@@ -126,6 +131,8 @@ static int __init riscv_intc_init(struct device_node *node,
 		return rc;
 	}
 
+	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
+
 	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_STARTING,
 			  "irqchip/riscv/intc:starting",
 			  riscv_intc_cpu_starting,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
