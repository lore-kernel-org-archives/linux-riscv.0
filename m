Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD6BC47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmZ1Hr9ExoLYpRD3aCZ7gF0PITy8IJnVXm49xkG1OYg=; b=LxsfJG+4MPKrP9
	LZOIXlxf9HIAz8ojNA7JUGExPskJzeA2eGJ19oikG0894xXvuU0Y04N1Tpo9Tj13up7E6y3p1IpuQ
	GLrbRULM5j+R3YuqBa1t0pcN25XQuC5rpHhky/eW9zecVMerBETCplgAT4cMijpxRYJt8yF3j10Q6
	jsZhaOQFc2OzxaZn6Tlkz8sCyrjZV1xnBWAvLMevRGMbW9/fLFOKvBTXnFEkCl6mx+o6uJoCz9wez
	TZioaJe1uKHxAYsPixyx8TIlhJJ+N6zXih9+IAYImPsqVmjNA6LweBl2LZusnocEUlpGkQ28GkovF
	eAlAHOCOHVTbaZ18cS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuwB-0007jW-1N;
	Thu, 11 Jan 2024 13:17:35 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuw8-0007gz-11
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 13:17:34 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3bbbc6bcc78so4296082b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 05:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704979049; x=1705583849; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nNt6uSdbZ7DbOtq3KjOLhDCh+Jm85/iAkPBdV5go9e0=;
        b=XNLMqdGeScCMm18JgO/v1+0qwZPcHF8n0vYaFUDZgEbp1Lk8eRwTHeDaUqcy0OV0Si
         ACe61Uwz0DRKEpOP+3iRjJLeFY/g6ugHsrgxbTr2Bl4TmUYQh0uXi+qRn90YOmuh+aOX
         +UzIEtvsUO6sUTKqfsL/u+UH+rpzp4aZGOegvo3jsMZiCAFCCezfXu414r0D1z/Oj25v
         rD54+XYWv6dTiOlVgix4G+0mSC6xf23loUAJYMAsy/moLzzRkq23u0r4rA77q0kNtXwf
         +V5QUFUpEeZvkS7HqKiigPCRjmSBjMYtxWVzpfJbbd3QyT8qOyRvHRKjYs2e0jFZakUb
         xY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704979049; x=1705583849;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNt6uSdbZ7DbOtq3KjOLhDCh+Jm85/iAkPBdV5go9e0=;
        b=iBtF1hyiwDezgWwmuk7+jA52TEaWXalWBvjZeVBYJYibgs4X5n5drSVMjJrF+aB82D
         LEm5IrYMkpeNPpAobrHobu1voimIwDuPFQ6YfG4LZoXYqCjQ2xn0AjRCs1znFVpUFuNv
         s7HcopWEJlTcwfA1vlbBC8Jv76ov6eum/Ep/ilj+AsF858ZkwlnZCJ9yJ9bZ029chvRr
         Rwhs0ztFvjUt3IGzEyB41nY8U+3NXMyTpQRGdgl0isLl7Sp7dgzmMKpaVhgigQCCX3RJ
         eE94X6nc3PZr+tQCrk8LviJR2XLKUmx0cw2jZB7Eaw5h8gjnwPSNZHPiS7QC68/t+Oo8
         CVxw==
X-Gm-Message-State: AOJu0Yw6FNEpnHTRg8KlqeRsgsB68pw+vsycmUMrTqlkrJucFK40h0y6
	sAKnu1V5ajQqHM91L9SmDQ6eMkKwKhE1+xVDvP+KV2Knb46VlXB520t59AHFH70nKRQWW6m0s+L
	uKRR0VYIc7RoFwA0pYEZru22zIYN7okrCd7ailb20a/3BWA60x+nuGnwYV/XHEUvS7lw5b/Gj8T
	ONKsqM9leD/As14xaFft7A
X-Google-Smtp-Source: AGHT+IEQpwjudjxUK0b5f5PgyOInJeZknfCEy+jbODXngBeF3+wa9MQmccDjMzssTFajM9OY+wjgCw==
X-Received: by 2002:a05:6808:2092:b0:3bd:44c4:6311 with SMTP id s18-20020a056808209200b003bd44c46311mr1636021oiw.72.1704979049620;
        Thu, 11 Jan 2024 05:17:29 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id ei30-20020a056a0080de00b006d9a6a9992dsm1103202pfb.123.2024.01.11.05.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 05:17:28 -0800 (PST)
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
Subject: [v10, 09/10] riscv: vector: use kmem_cache to manage vector context
Date: Thu, 11 Jan 2024 13:15:57 +0000
Message-Id: <20240111131558.31211-10-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240111131558.31211-1-andy.chiu@sifive.com>
References: <20240111131558.31211-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_051732_353541_D149F55F 
X-CRM114-Status: GOOD (  11.86  )
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
index d75079520629..7b316050f24f 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -26,6 +26,8 @@ void kernel_vector_begin(void);
 void kernel_vector_end(void);
 void get_cpu_vector_context(void);
 void put_cpu_vector_context(void);
+void riscv_v_thread_free(struct task_struct *tsk);
+void __init riscv_v_setup_ctx_cache(void);
 
 static inline u32 riscv_v_flags(void)
 {
@@ -227,6 +229,8 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
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
