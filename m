Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E810AC35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZDpG9eOj/DqNq4PDJHmw5uH4Vq2oOK0A3nzNPwphyo=; b=p9/pJCa1U7jzdL
	/6JgTjS2qUQ/o/C8mq/rTAjKdcogQ+3+JSr3exB1g97qOVHk/Jar62G1WVSEPIZXPqNwm1pTq9gdh
	RGVzF/ZEb0dWJ1FzbGvGX+ZHEK6exkwhKln51kjX58W3DFunQNg/rCkxSCHFH8OgK/Xrq+LfyOPfP
	M39bs+UmJ6rWteu78lAOa9HxFTUnrPRCYq1jvL9ErjaSPqsbs5VqhwOeZr9IJXk7Mdf3jXLk64xKV
	SJGUqZhBcQ3qmqXtin1jRVNtvX5E1Pn3Qp9OM7G377PA5/zUEZm9hga/PWxhnceZLHQEPB309UpOT
	m4eqIP6mqUkxP2tmD7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJMA-0032HL-1E;
	Thu, 21 Dec 2023 13:44:58 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJM6-0032EJ-0b
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 13:44:56 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d3ef33e68dso5816975ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 05:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703166293; x=1703771093; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gyaAcQXJB9Pn9Hs/a7PNDEHYRp3nfW2OLz+IfLnmB1A=;
        b=V2ukY3RBO2BycCFSqVA8PmkHHYAhCGnOcGIwinUR17BidoSur50Z15fnd67YHEKmeS
         qpRKF1m7HeY/m8s9Bdq//SpVicsygkPiAyw+1C2FIyj9t+/bsG3wZEv4ikDWqfQp319W
         w9Uw6ZqxBCbgbcfEjbZscf4hk2f2QisjsiBRfKf1TBir8Kg40n6N+3yPfSphA8irpDHW
         M39YmabbscAy3y8e/qbn9KeMbdx+H8RhaWQtN7auc+IVhZeMGZHXB3C8DVk4FKwZ/7Bn
         ckaqa7Ul1khLHrBZQ6ryvQHBa7F8w87evTQroXxSmkRG/w0EliKbxG/VAdEXClxcck0j
         SNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166293; x=1703771093;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyaAcQXJB9Pn9Hs/a7PNDEHYRp3nfW2OLz+IfLnmB1A=;
        b=o4Yz5e1uNGVKuAm46npqdml3YJT5iHrC10papUnpdQOXrqWP+fvwMZbXxoOmUS0Q4D
         9zqCxJrcxD0/uDsBXCamk0MXUIiV5Ng8oJ4K65IdZRa5JFTGIDDye+SnZFL2sNzujMIy
         rWQ77HkI1/Tm3HagAKUZcLua/7dFbwdCW2jYjq80sIzQNAB1Noain0+auUF4mGQJFpgE
         3jXHAScRIJYDvYEtGuo19L0Jig/NNp/0pXtt4H1eMXKzxX2BKC9v3K8HGrasqI8k+dTi
         GsayUCDj+/9vLpH1oRWnVe1Xf7Drg7U04FbSIZ/jjroOclwCM8nDo3Nofam6WY+Szha4
         kNIg==
X-Gm-Message-State: AOJu0Yxw2VR1lpJ1raXFcQQSPuLW2aTbV5o2dREeOtefk9u1q5Cplkn7
	hvd8W8K/UUGCg/qWxShbGHnDfQgG+HgscsY7zJSvAESE8qdDWiEst+0aq8dw8KzR/T+WGG+RXsp
	vyScXYByoFwfmkgfnK/wV/x1YekKy76Qy0fbaYZwtat/IUYYen6VKysPLjQhthtVW9plydQ4hMk
	seXwZogDqzCSlg
X-Google-Smtp-Source: AGHT+IHSsaze0fHydA06P2yYiQwpg6QYZhfYxXcDxSWgTU0dG1XNZjYDUGVmFJ5iALoqa23joDWj7g==
X-Received: by 2002:a17:902:e892:b0:1cf:b4bb:9bdc with SMTP id w18-20020a170902e89200b001cfb4bb9bdcmr1012113plg.9.1703166292813;
        Thu, 21 Dec 2023 05:44:52 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b001c72d5e16acsm1646001plb.57.2023.12.21.05.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:44:52 -0800 (PST)
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
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <j.granados@samsung.com>
Subject: [v7, 09/10] riscv: vector: use kmem_cache to manage vector context
Date: Thu, 21 Dec 2023 13:43:16 +0000
Message-Id: <20231221134318.28105-10-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231221134318.28105-1-andy.chiu@sifive.com>
References: <20231221134318.28105-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_054454_269760_7A33B3AA 
X-CRM114-Status: GOOD (  11.90  )
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
