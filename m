Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451DDC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 04:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhuzWkXR7iO3siaTlQDj4CpHvsSWk/B5SMw+R52KNcY=; b=1rTydC4iZfNUrl
	D250iNYqFH5tMVeD1USKeCuvZSyKSEGtf2vglUTrq9+BPC8F+QpR+fwGGLJiR/+PFIlZiZe2BfLRw
	lE4k735VjWFq33724mwxN9OJEdd8/UMZTrpz22nGKKeCW1Vc/j+68FjOKeIi4GtAIuWxI+/cJP6QG
	BCl/d0Td/O7eLq2eTAme5ImW+0/+cnLjU3RoYsOq7lshsAQsfLUpFbJiuuCiyGMknPdfuOGMeF7Ca
	sF2GqSMlRyXBnv0vB7QDNf9Gy0JE/JQ+tBnN/9NQX3eOrr6Qx1v3dCAkx4yYCiTzjO9aztCWzIs6n
	MgRe82EVL/9EVKBTdprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtfF-007MNA-10;
	Sat, 23 Dec 2023 04:31:05 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtf8-007MIG-0T
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 04:31:03 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6d93d15db24so2265063b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 20:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703305855; x=1703910655; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QUioTI8ChUPoxvAbO/795+zuvqJ+EYESvZy9n2CvtTk=;
        b=Vm+p7jDUtQpCwppsMk4fgxWKtvIE6WIipfvmRbyZLoJBV1yTlfJ0ojihriinP+5eQy
         67VZnq5FjqBoIBns5hgoygCE/aiVS8gJy7KyXxVX0+XLZJd9aPxD/l2b0IkCxWxnVfiN
         74hivTs9kVuJNm7DY7/H2N6B7SoQDRBtE8DfjLOumixn+G44AehQHdBM9UAtBxbVi3Lq
         4ocbMHxIhfGE9Jw+vFG4YQbl7qPMQEZgbN5UBvV86+f+hHizr6It5D5pTu9TaP7ISOP9
         BejjACgQ6ahWMJsHj3Mf7vz1im/Qrjq11G9CD+wFHGUAZcR1j2AqZcfgbEQwQqdgsuIz
         OyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703305855; x=1703910655;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUioTI8ChUPoxvAbO/795+zuvqJ+EYESvZy9n2CvtTk=;
        b=gfcZaRsVWg8jvH6qEHOD+2RTit9FwrBnYaMq2Z0KkQ1AzAqLVFZHQafijMOi+9z3xR
         0uD+5Z5KdOWV31yNG+CkCwipG7yCtYMQ/hGwNhbFNtgsxQQ9QyEWzT3zi9M35CIndirO
         OrImDLkLmQWpPUQlYnu7S4rZFRYRV12lRAqLcebHIKCEHB1dMhACldt+DijbmuYYzB6r
         m4um0vN5FpGigA9elIhSMriSoVSWCf5NESnulYHLOZDG127hmMEwNJEliV/QfQ04WPfQ
         Mc4UV7f/Cq0CR0i7BXXXEtmK5RnKBhtyyrvsujR5V44MdXY4aXN7QqRT4fkcI/rnP7I7
         UePQ==
X-Gm-Message-State: AOJu0YxFCHg/KEl2nsvABMV+bFwNiLJo5cG3/v/UskaJUZXjlgtxwksr
	UasTO2SKE3Tih5zfQju4FyBC1QIXYSxLmE5kNmL1uUUITm3xVkwPIo1knHZTGxsr/XoTp+ZL+an
	qld3i+MH5jXfMBKfaOZ6CJrV3c6qMASbppcQQAnYr28QODRJQI9DbK14VRLMhLMb6LhIBAc2jMJ
	91lGRsfrpghzuY7/0Ri1dR
X-Google-Smtp-Source: AGHT+IEMMHGzwtQu3ge4GndrHks6ZEwLOpbUDwY/KIrwz6tcWTJY5BpuzjXBDYYznYE0iORWxz41iA==
X-Received: by 2002:a05:6a20:1606:b0:195:3bfc:4908 with SMTP id l6-20020a056a20160600b001953bfc4908mr2278151pzj.51.1703305855413;
        Fri, 22 Dec 2023 20:30:55 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm2623397pjb.33.2023.12.22.20.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 20:30:54 -0800 (PST)
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
	ebiggers@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <j.granados@samsung.com>
Subject: [v8, 09/10] riscv: vector: use kmem_cache to manage vector context
Date: Sat, 23 Dec 2023 04:29:13 +0000
Message-Id: <20231223042914.18599-10-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231223042914.18599-1-andy.chiu@sifive.com>
References: <20231223042914.18599-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_203058_197832_52F58651 
X-CRM114-Status: GOOD (  11.80  )
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
index 36993f408de4..862d59c3872e 100644
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
@@ -228,3 +228,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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
