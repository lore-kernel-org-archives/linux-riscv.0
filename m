Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF10BC83F34
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jul 2025 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XiL0Ur8/4quSHZwkxNBa6U0I5o1FOvnUSU4xRAQE8Us=; b=L0WYQv4MY2Exoj
	EHoTpE7b5Osl9eOCtx+Ugme846XgegrHClWZgdDu2TxH70Hruetz7VVlIp9sE+C66nbiFlbnxlonI
	mYhZvUJWmzIdv5fMlKsuiOYeP9VAxKHiVIsaI1Pn40Th/hM4MQB9C3hxgPn1f3ui/lVL9DWjFE27j
	Eug4d+YcP/GfnpdyIGuUJ1MNpHM2w3Z37l4XGeaWCKsck0ItRRPpXV10xfZ3aAINyM4quu0zO8IW6
	qBvRtktBGPlqOrCvZi2AZC1X3I/XHC8iC8wT3yJQrRAT0NARJ0/AD53CqdE7IVJZAWv/k4BXh5r6U
	8H/f+EgGN+MFdufT61wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eT-0000000E4eq-0Sum;
	Sat, 19 Jul 2025 09:14:41 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eN-0000000E4ZB-1S8f
	for linux-riscv@lists.infradead.org;
	Sat, 19 Jul 2025 09:14:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bkgw11VP5zKHMqT
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id D7BFA1A179A
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:23 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgCHURLuYXtopCAYAw--.54295S6;
	Sat, 19 Jul 2025 17:14:23 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next 04/10] riscv: Separate toolchain support dependency from RISCV_ISA_ZACAS
Date: Sat, 19 Jul 2025 09:17:24 +0000
Message-Id: <20250719091730.2660197-5-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250719091730.2660197-1-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgCHURLuYXtopCAYAw--.54295S6
X-Coremail-Antispam: 1UD129KBjvJXoWxZw17tF13Xr45Kw4DZr17trb_yoW5Xr4Upr
	4IkrZ5KrykCFy2qrZYyryDWr1kXws7W343Kw4UW345JFW0y3y0qr90v3WfuryqqFWIvrWS
	9F1fur1fZa1jkaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPSb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U0sqXPUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_021435_736168_EBF50962 
X-CRM114-Status: GOOD (  10.26  )
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

From: Pu Lehui <pulehui@huawei.com>

RV64 bpf is going to support ZACAS instructions. Let's separate
toolchain support dependency from RISCV_ISA_ZACAS.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/Kconfig               | 1 -
 arch/riscv/include/asm/cmpxchg.h | 6 ++++--
 arch/riscv/kernel/setup.c        | 1 +
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d71ea0f4466f..191b5d372fdf 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -717,7 +717,6 @@ config TOOLCHAIN_HAS_ZACAS
 
 config RISCV_ISA_ZACAS
 	bool "Zacas extension support for atomic CAS"
-	depends on TOOLCHAIN_HAS_ZACAS
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 0b749e710216..4f4f389282b8 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -133,6 +133,7 @@
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
 	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&				\
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&				\
 	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA) &&		\
 	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {		\
 		r = o;								\
@@ -180,6 +181,7 @@
 		       r, p, co, o, n)					\
 ({									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&			\
 	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
 		r = o;							\
 									\
@@ -315,7 +317,7 @@
 	arch_cmpxchg_release((ptr), (o), (n));				\
 })
 
-#if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS)
+#if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS) && defined(CONFIG_TOOLCHAIN_HAS_ZACAS)
 
 #define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
 
@@ -351,7 +353,7 @@ union __u128_halves {
 #define arch_cmpxchg128_local(ptr, o, n)					\
 	__arch_cmpxchg128((ptr), (o), (n), "")
 
-#endif /* CONFIG_64BIT && CONFIG_RISCV_ISA_ZACAS */
+#endif /* CONFIG_64BIT && CONFIG_RISCV_ISA_ZACAS && CONFIG_TOOLCHAIN_HAS_ZACAS */
 
 #ifdef CONFIG_RISCV_ISA_ZAWRS
 /*
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 14888e5ea19a..348b924bbbca 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -288,6 +288,7 @@ static void __init riscv_spinlock_init(void)
 
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
 	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&
 	    riscv_isa_extension_available(NULL, ZABHA) &&
 	    riscv_isa_extension_available(NULL, ZACAS)) {
 		using_ext = "using Zabha";
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
