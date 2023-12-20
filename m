Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359C0C46CCD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZDpG9eOj/DqNq4PDJHmw5uH4Vq2oOK0A3nzNPwphyo=; b=eZyxl305rVkByT
	OohlH44HlaJ3A2TuUxxHsiknTpVCfMCQG7dnsqDddh0CgwBYvpcNsFc/arZTmeLQZ2hvBVfxtJDyK
	H0WNteEHqxV5aeJGANIv/thXVB2xwZTnc1aFEeKX5wbEB0S32TchPzRbnJRGwqoeI4FElmIMagDZf
	wBdhyBlNEz8mIJAnFbSRvsv6i1b0PxCFChPHOCd1rDu8VDM03qz+j0p61NbDGJ/hWavNEMgv5jTXK
	2abZD0SzlDVKh4p2Cey+JUfJpTl3zKrmxpjmcMai10Dlzedyi7jZCT/XqU6GsFc642isFv7kphF2l
	NvNHF+iHKVJHm134gd5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrTX-00GV0J-0f;
	Wed, 20 Dec 2023 07:58:43 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrTS-00GUwS-0n
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 07:58:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d3ce28ac3cso18223635ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 23:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703059114; x=1703663914; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gyaAcQXJB9Pn9Hs/a7PNDEHYRp3nfW2OLz+IfLnmB1A=;
        b=MEOroDvB/NpJxxRsz3kfLXAJpdrli/5Yh2NCp1ICb5/I6CiUAJttFm27iV5C0PfqVV
         QJx9OcCePfKN8pnm96MbSeO3FhFoR1jmKEgpnLp5mq10iBknPkc/gLXzYE8kEQ8kfpX6
         AKow9114e06WZPzc+6eOkF+GlKD822q4V+fc91iUkgyEvO3xYx87iMIqkbUnoPbaX6N7
         Dzb5z/8HBLRHkufe4/226ziWtvXwO2AxgrfTOU9MkQQbVUDYVuq+pTcEiMT8c84d3gLR
         Lrc+lY1M3Y3eyW8UdmYqVuf2edAeso1DtCAHbXwfqRWCmWdc+YtDrFuq8del14w3Kh8c
         C0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059114; x=1703663914;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyaAcQXJB9Pn9Hs/a7PNDEHYRp3nfW2OLz+IfLnmB1A=;
        b=dYpdn2uq8HYmtC9F0z3RKSJrpaIePKj1w6P59V8alcl4fb0sEyojRkS+MYoq1RkjyJ
         MiZsfJYNpeFLsB9Z8tVQucYV+BEozZsY1BpOaYxZoJ+2XiPbfdS1cHNgSR+s/w4UgSRS
         O+bIwU7eZ4BxMBxuRe1o+JLbFADjelKj0AhVGWYjFQJe9j0fam+VE+bYUJhSjRw9uuah
         3X3IccOY73E5WYnIj33j5t6QzroRMQMEiDtcK8yWSv9sk7KIvgmSMJzayruIgkj6zmYs
         5DunwC/DOjCncm6Q9SzRpyqil1orz0GsBnOJcnHz1Q0IjtMmsYN06SJZLvgXmAgbgU42
         6M6A==
X-Gm-Message-State: AOJu0YwPajL/2ueHGp4S569i37Wipytp5T8QGl84ezhHI10PVCD/rZNp
	5gMYpyxK5zdk23Q6bH6+p8+bLZPRfrRV2vqf1n6KA7/Tak81/AMsi+DFJFxNL2809MXHWdSfE1+
	SgFMt+/aF29DGSuK9w3ogEx5NjaHhSG6TVHNG2MXhnMyLE/zhLqdRc5lZH8D0arKx8Ng5XPe/fe
	GCBeC/eFh1ICRl
X-Google-Smtp-Source: AGHT+IGalfOT82tCup2UHErKLlWkzx0UVPBobwmFKOmxD7EOSJHU34YA8VpM5UHiePwNjwLNKFZSyA==
X-Received: by 2002:a17:903:2450:b0:1d0:7407:3557 with SMTP id l16-20020a170903245000b001d074073557mr11070566pls.15.1703059114177;
        Tue, 19 Dec 2023 23:58:34 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902789400b001cf8546335fsm3441453pll.5.2023.12.19.23.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:58:32 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Xiao Wang <xiao.w.wang@intel.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <j.granados@samsung.com>
Subject: [v6, 09/10] riscv: vector: use kmem_cache to manage vector context
Date: Wed, 20 Dec 2023 07:54:11 +0000
Message-Id: <20231220075412.24084-10-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231220075412.24084-1-andy.chiu@sifive.com>
References: <20231220075412.24084-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_235838_300731_E910B007 
X-CRM114-Status: GOOD (  12.29  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The allocation size of thread.vstate.datap is always riscv_v_vsize. So
it is possbile to use kmem_cache_* to manage the allocation. This gives
users more information regarding allocation of vector context via
/proc/slabinfo. And it potentially reduces the latency of the first-use
trap because of the allocation caches.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v6:
 - new patch since v6
---
 arch/riscv/include/asm/vector.h |  4 ++++
 arch/riscv/kernel/process.c     |  7 ++++++-
 arch/riscv/kernel/vector.c      | 16 +++++++++++++++-
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index c5a83c277583..0e6741dd9ef3 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -26,6 +26,8 @@ void kernel_vector_begin(void);
 void kernel_vector_end(void);
 void get_cpu_vector_context(void);
 void put_cpu_vector_context(void);
+void riscv_v_thread_free(struct task_struct *tsk);
+void __init riscv_v_setup_ctx_cache(void);
 
 static inline void riscv_v_ctx_cnt_add(u32 offset)
 {
@@ -239,6 +241,8 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define __switch_to_vector(__prev, __next)	do {} while (0)
 #define riscv_v_vstate_off(regs)		do {} while (0)
 #define riscv_v_vstate_on(regs)			do {} while (0)
+#define riscv_v_thread_free(tsk)		do {} while (0)
+#define  riscv_v_setup_ctx_cache()		do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 58127b1c6c71..38bdbcf9b81d 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -179,7 +179,7 @@ void arch_release_task_struct(struct task_struct *tsk)
 {
 	/* Free the vector context of datap. */
 	if (has_vector())
-		kfree(tsk->thread.vstate.datap);
+		riscv_v_thread_free(tsk);
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
@@ -227,3 +227,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
+
+void __init arch_task_cache_init(void)
+{
+	riscv_v_setup_ctx_cache();
+}
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index c1f28bc89ec6..1fe140e34557 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -21,6 +21,7 @@
 #include <asm/bug.h>
 
 static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
+static struct kmem_cache *riscv_v_user_cachep;
 
 unsigned long riscv_v_vsize __read_mostly;
 EXPORT_SYMBOL_GPL(riscv_v_vsize);
@@ -47,6 +48,13 @@ int riscv_v_setup_vsize(void)
 	return 0;
 }
 
+void __init riscv_v_setup_ctx_cache(void)
+{
+	riscv_v_user_cachep = kmem_cache_create_usercopy("riscv_vector_ctx",
+							 riscv_v_vsize, 16, SLAB_PANIC,
+							 0, riscv_v_vsize, NULL);
+}
+
 static bool insn_is_vector(u32 insn_buf)
 {
 	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
@@ -84,7 +92,7 @@ static int riscv_v_thread_zalloc(void)
 {
 	void *datap;
 
-	datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
+	datap = kmem_cache_zalloc(riscv_v_user_cachep, GFP_KERNEL);
 	if (!datap)
 		return -ENOMEM;
 
@@ -94,6 +102,12 @@ static int riscv_v_thread_zalloc(void)
 	return 0;
 }
 
+void riscv_v_thread_free(struct task_struct *tsk)
+{
+	if (tsk->thread.vstate.datap)
+		kmem_cache_free(riscv_v_user_cachep, tsk->thread.vstate.datap);
+}
+
 #define VSTATE_CTRL_GET_CUR(x) ((x) & PR_RISCV_V_VSTATE_CTRL_CUR_MASK)
 #define VSTATE_CTRL_GET_NEXT(x) (((x) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK) >> 2)
 #define VSTATE_CTRL_MAKE_NEXT(x) (((x) << 2) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
