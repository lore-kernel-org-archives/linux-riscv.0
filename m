Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727CBC41513
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 07:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c64p/c6oJ1khFcYn7NbZHfcWcWNBhBBnk7+QCfCaGBw=; b=zBOlFLoKwfwTzs
	Djy+dr7D7gMi5IQOojGu/QlwCHEc17uf4lKxuWpv0s5O5/ngnuTF8YlXfiDFTu7yNRpRTVCVdvkd9
	JmyUPMP3M5ymzuFXPylQY2i74DH2BJpYsv8UlUv8cdh1UiDwc2z5RV3w6h/ejeEpoBNLC6iRL+FmK
	Law4bvLeD9NDPv8UnfmxPgB/npOOvdV9Oubwx6Zpr0J1S3PEgadLhozzyudh6XNwqL/zAKAHfyOLJ
	Ea1ckrbm3IgyraDgq5R/BUY/psPUUDzso3OaWumeyGeYKwLQTJNN2tQPGbPs96H8pfv/b9b1ir337
	a4ctn+4j+MBtKTzwPaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZAQ-009Suq-1w;
	Wed, 26 Jul 2023 07:42:42 +0000
Received: from m12.mail.163.com ([220.181.12.216])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZAM-009Ss8-2z
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 07:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CIorq
	VVzQAbHZJUC4BNCOgZhZAEVr+TjS5Zo30Detsc=; b=l/NGQ3KMJcSYdMQcAXRCC
	Kb6LTOmgan9yuAZWYFc9dTLL9qZKqcxiYbCwaWlHrL/AMmUAOxWuem0hy+DtysGH
	JE/M5DiERCZ5aOjSkXxNpK5IyC5J+iE9QRUmzYacY9FxJ8Vbl7jY/L7h3TQnQDzc
	xMhBJQRSmJInihcjjR84do=
Received: from yw-virtual-machine.localdomain (unknown [180.110.115.47])
	by zwqz-smtp-mta-g4-1 (Coremail) with SMTP id _____wDXEzFczsBkuNlkBQ--.45898S2;
	Wed, 26 Jul 2023 15:42:21 +0800 (CST)
From: wang_yang <wang_yang6662023@163.com>
To: palmer@dabbelt.com
Cc: aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wang_yang <wang_yang6662023@163.com>,
	Wang Yang <yangwang@nj.iscas.ac.cn>
Subject: [PATCH] RISC-V: Use GCC __builtin_prefetch() to implement prefetch(). GCC's __builtin_prefetch() was introduced a long time ago, all supported GCC versions have it.So this patch is to use it for implementing the prefetch. RISC-V Cache Management Operation instructions has been supported by GCC last year.you can refer to https://github.com/gcc-mirror/gcc/commit/3df3ca9014f94fe4af07444fea19b4ab29ba8e73 It is worth noting that CPU based on RISC-V should support Zicbop extension. This has been already done on other architectures (see the commit: https://github.com/torvalds/linux/commit/0453fb3c528c5eb3483441a466b24a4cb409eec5).
Date: Wed, 26 Jul 2023 15:42:18 +0800
Message-Id: <20230726074218.32933-1-wang_yang6662023@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDXEzFczsBkuNlkBQ--.45898S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4kKr13Xw4DKFWxCw4xCrg_yoW3uwb_Cw
	1xJa10grW8ZF48uFy2yw4rtrWjy395tF9rWF4Iy3WYy3srWa1UXa9rGw1UJryUZrs0qFsr
	uF98Zay8GryakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjsXotUUUUU==
X-Originating-IP: [180.110.115.47]
X-CM-SenderInfo: 5zdqwsp1dqwlawwsijqt6rljoofrz/1tbiYx649VaEP9up8gAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_004239_380910_72657BAA 
X-CRM114-Status: UNSURE (   9.10  )
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

Signed-off-by: Wang Yang <yangwang@nj.iscas.ac.cn>
---
 arch/riscv/include/asm/processor.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index c950a8d9edef..f16d4c85ca5b 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -70,6 +70,17 @@ extern void start_thread(struct pt_regs *regs,
 
 extern unsigned long __get_wchan(struct task_struct *p);
 
+#define ARCH_HAS_PREFETCH
+static inline void prefetch(const void *ptr)
+{
+	__builtin_prefetch(ptr, 0, 3);
+}
+
+#define ARCH_HAS_PREFETCHW
+static inline void prefetchw(const void *ptr)
+{
+	__builtin_prefetch(ptr, 1, 3);
+}
 
 static inline void wait_for_interrupt(void)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
