Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A14CDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DeTqQw0EXrF7zhKlwCPeG79pEvtehafR2dPo824c12k=; b=iZjiz9Xx/CD537
	51xTv60RJlXkrsPixsbB91hw5DGnb8L9qKTbLiwllQkidmRKx98ABgCCpvg9dsOJJt5/JA0JCZ6ZC
	IgGouUMqSh+9Lw2VzLpeXOj1yZKwF8yrB7p2s+c0X0+mfFsOp+ojV/tSSAb/+aQd4SfsWz7Kk6q6G
	I3ramdw21n+Eul9ywEEDf2y4RuTqHl4Ieqjare0l2YrDXz9FxrO0fpSfCmqU/IRvMWF6Kgt8Cg+AF
	DY/ljHzROqu45yB7AapekgnYmO91O77v6lU9SpqaJfJfQFEptGCbPG964CxtYdFPW7q2AesYLHcRQ
	/xBf1uJy4EK2C8CZXTYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJn-006l0t-2d;
	Mon, 23 Oct 2023 08:29:47 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJl-006kzX-1v
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:29:46 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso2348215b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049784; x=1698654584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTPdJw2kGsvWjCGGMUBG2xz20Ji8Kpf17R3X8M8D7Aw=;
        b=d9SNTciTsZYsbbZCBH/t4VLIjxlOv+n3roQksbB7v0unjOq1aNkrIoU7wdON/bXHBK
         EJeEmL40lsgjuB2+EBfgk6K7saL6qHDIM4M58dXMfmVn6E/cquJEaneFMc+bBBuuc5SI
         5eOBei9fpDVCd0fqC7NJ/7tN+Oe4JL8WLUfvu1WUiP+z+Fy6XQ+PbM7CBL65jdkyP27V
         G5WOaqmMoA2XYhoanJTDh4dJZTw5N5mzzK8xbCpsKPMXdwcE6zQuQBUP3ML3q+6cl75D
         MOE2yOPwCrI9EjYcMqF+7bZTUHn65I6B9O/yK3AYsMOo4TLG1LHPnALutWEW+evM9khr
         FP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049784; x=1698654584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTPdJw2kGsvWjCGGMUBG2xz20Ji8Kpf17R3X8M8D7Aw=;
        b=suy/ZMsr24PNNYGP7czBHGbM2E3aQjJ8H3lK07iaGXMgIp4IYxIyEP24leXbzy584t
         3yaddLc0RsEaUbcECtey3zCmoR/O8L0dsvmTLwAU6gE6PzoCzPRUtpUD4JAaWysSqa23
         5gAs9DnMTtveJOLbIbHSeR0jAHLVney4s7p8c/41XZtwrzWpRpMF8ZZdHyd2e6qRC/Lg
         2XgXiK/lQTqVxA9dgjTw4nmdfmYypEuD2UuJIKiPRJBgsVdtiqiWq/bAI0LWqtuoPJDD
         XoI/YBUZqBX02Q9jobIiDdyvJ9lGnK+BquZSnEOlSTAj1rl+DiYoJ3mpa1RsitgP25zw
         v/gQ==
X-Gm-Message-State: AOJu0YwOIG07uVMITCDb3l5l2XJ/c0eO6kvk35C/Tzva9hDi6W1WkW3u
	F47LMnf6AN6F3GsWkOZ+DgudkA==
X-Google-Smtp-Source: AGHT+IHy0ee6CNfNaI0e1G2cSIdQi3bfs3nWqXWt1dZTbNcZKi88wQbICOA1lqr6IbE3K2mo4LQppQ==
X-Received: by 2002:a05:6a21:3398:b0:174:1466:359c with SMTP id yy24-20020a056a21339800b001741466359cmr6820626pzb.61.1698049783818;
        Mon, 23 Oct 2023 01:29:43 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.29.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:29:43 -0700 (PDT)
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
Subject: [RFC 04/12] riscv: Switch back to CSR_STATUS masking when going idle
Date: Mon, 23 Oct 2023 16:29:03 +0800
Message-Id: <20231023082911.23242-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_012945_638879_F61D7BA0 
X-CRM114-Status: UNSURE (   9.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The WFI instruction makes current core stall until interrupt happens.
In WFI's implementation, core can only be waken up from interrupt
which is both pending in CSR_IP and enabled in CSR_IE. After we switch
to CSR_IE masking for irq disabling, WFI instruction can never resume
execution if CSR_IE is masked.

This commit handles this special case. When WFI instruction is called with
CSR_IE masked, we unmask CSR_IE first and disable irqs in traditional
CSR_STATUS way instead.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/irq.c            | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 3e23e1786d05..ab9b2b974979 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -111,10 +111,14 @@ extern void start_thread(struct pt_regs *regs,
 extern unsigned long __get_wchan(struct task_struct *p);
 
 
+#ifndef CONFIG_RISCV_PSEUDO_NMI
 static inline void wait_for_interrupt(void)
 {
 	__asm__ __volatile__ ("wfi");
 }
+#else
+void wait_for_interrupt(void);
+#endif
 
 struct device_node;
 int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 9cc0a7669271..e7dfd68e9ca3 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -15,6 +15,23 @@
 #include <asm/softirq_stack.h>
 #include <asm/stacktrace.h>
 
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+
+void wait_for_interrupt(void)
+{
+	if (irqs_disabled()) {
+		local_irq_switch_off();
+		local_irq_enable();
+		__asm__ __volatile__ ("wfi");
+		local_irq_disable();
+		local_irq_switch_on();
+	} else {
+		__asm__ __volatile__ ("wfi");
+	}
+}
+
+#endif /* CONFIG_RISCV_PSEUDO_NMI */
+
 static struct fwnode_handle *(*__get_intc_node)(void);
 
 void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void))
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
