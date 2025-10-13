Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523B9CCA476
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ura88DlzO/nRDftD0XDVxTmzLCVfZpjknXAg9UG3cks=; b=3tMc6coBXabZ9g
	NO61SX5MBOPGXHPkWqfJNCSI6cqpUe8vWB0SppgT8nGTiVswT0UN/Hu20M7Nj2v9WdnrfEchn7AiY
	mo3aHxcPeXOVrfO/Rl5FzfA1TXeQzCQJp5IFXDO/A56IWA6LHOpReHJV8YNpq7GlcKNpr56kdJXlZ
	P0O7lfEklk1VNn7yDFEtj7/XrZsq43un+F2YiJnFu/VtjA+iDl0TikWi6jACm4r82nRkcH3cucPo+
	RIHzWsbPgdPueEiEwFs37d0p/uQIf3Xexg3OLN7oG7iQO2Fs+c84zd2oy+aAJMOLEzGL5oXCvKyqn
	aLinkt56p1Nmsi/ddxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EcY-0000000ChKi-0kxp;
	Mon, 13 Oct 2025 09:13:34 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EcW-0000000ChKF-02QM
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 09:13:33 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3322e6360bbso3684451a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 02:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760346811; x=1760951611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8Y70FtM73eem1DqR0aER86RyTdB5RacsbefhqzztUc=;
        b=K1y1BDnDVAdbv4pQU+H081hrAJzdFaKFrUPH8wdUilVt4pQwkwvLN6Kf8xDmJij9cY
         ukH5EUsVEC6sc6pHBhLvHMqOkLs+9fZkes99zcE67QbMEsUsxK7oril8bOevz/ImfdVl
         Aa5mKvYRZzADapkHCFqahEVoYwwkQyI3Cuv2VKxjf9yzWAb2jyKZSSDR5iWLfSICo91Z
         OYpbIqNL7Qc3xw1CSKsP2tmohV7Yc9hiJYaIjcOMNuLNiHO+qDDXTal3xVo2zzLcCVHe
         uxaNB419ORuT3ZvkPdtKsCGheL5BWs8rvxtHnoTHoWXKcuaDFmq+9r95n/Ga+v3nCIwk
         lS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760346811; x=1760951611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8Y70FtM73eem1DqR0aER86RyTdB5RacsbefhqzztUc=;
        b=n20KWnwuoOkHsJquYWbw5i2HZCgooGq6zwOQTKKd0px5V5B5/GGQ3b7CgmzCw4opxI
         rNcpgUgvVzbzRHiNTKaNvtJtK06rPEm1tL2ugz6ATr3K4zwRL0O8vy/isvVYsNFpDzFq
         b8swQvm3Ck7C+oOxND/7v6zwQinMUhUFOFb8gAgA0nUuzx9tGiC7mdFDjtfTScQMnAPC
         i3aUPXUmOJBydIVghWvk1hSbrXzAddncqWAMRFkNjplRNk8CH4ICK0g7j5QcPH6mH5r4
         MhnB4H1qkMCnf7oTXOURDPBxJPpnTTzBVu1UlpqeX3TrHuz1V1oBjgQJpzFtIZUTYBWU
         De/g==
X-Forwarded-Encrypted: i=1; AJvYcCW6e9OQNnBCw7ae9/Ycx0CWv+hBpl05Uv35F/zUdSc9GWRef90SxH6E7P6rRwhc4o4pmlwaBiSG6f0kPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbek575IiQnUCLvOX9jxFiUO9KcgF5oGkX4pRL7EBxVXCbjAjV
	U9RKCRlLCWvxQmr/Fx5N25zEVgvfGr6pdpDtyB7xsM3lHpTZulH7hpSuFoaF96RXxs8=
X-Gm-Gg: ASbGncvmx6TuTxfoMWgzRT/Um4bVwO0gpYSNUP6CvDRTeY0lHRAQRP9AJSAdo8KOZQV
	KWgE2vdtdOrwLvzuszKT4irUx4StV/2u3qSBy+Y3VPifcuLL/OQwAgBXZQoGXcmpixPSAI2gsIK
	8R8MtvrdqIGFw+goXi0sKfSmhX5ww9V39hgCNISf4jNywtZcwiLIltlt4mxeaxn2vR8m4JtghRb
	2Fw/JEgFi8ZwnjrI0tb91HyA9vS6oDaGAaCSIzeKSHT5A/RpuN0rC/80r8TgdyNU4ZJxY2CK+MN
	xA06Rkd82iw3cXbvZzeg9i81c5DkUuRM0esghJDqg3FGISBaSRWn9nhDfXVNgvzw+/p8D2eVOGD
	91NJDx/KF5ylU3qHeqgRCyfhdVEoyWABlbwwsnXNwCljs3jDP/EkvJrn9Lrxnu8cjOO7UwdQ=
X-Google-Smtp-Source: AGHT+IGE6p2GX8nv0LK6w4qN/cEZpc/XaGzoZf/flFr9L0xcubk7H6sKJW7BAPJLpx7bcAcNWpCDXw==
X-Received: by 2002:a17:90b:4a84:b0:32e:a10b:ce48 with SMTP id 98e67ed59e1d1-33b51114f9emr30667288a91.12.1760346810709;
        Mon, 13 Oct 2025 02:13:30 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a3cc0dsm11727220a91.9.2025.10.13.02.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 02:13:30 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andybnac@gmail.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <joel.granados@kernel.org>,
	Anna Schumaker <anna.schumaker@oracle.com>
Subject: [PATCH v2 1/2] riscv: ptrace: Optimize the allocation of vector regset
Date: Mon, 13 Oct 2025 17:12:31 +0800
Message-ID: <20251013091318.467864-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013091318.467864-1-yongxuan.wang@sifive.com>
References: <20251013091318.467864-1-yongxuan.wang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_021332_054186_36BE9AEA 
X-CRM114-Status: GOOD (  13.62  )
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

The vector regset uses the maximum possible vlen value to estimate the
.n field. But not all the hardwares support the maximum vlen. Linux
might wastes time to prepare a large memory buffer(about 2^6 pages) for
the vector regset.

The regset can only copy vector registers when the process are using
vector. Add .active callback and determine the n field of vector regset
in riscv_v_setup_ctx_cache() doesn't affect the ptrace syscall and
coredump. It can avoid oversized allocations and better matches real
hardware limits.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Andy Chiu <andybnac@gmail.com>
---
 arch/riscv/include/asm/vector.h |  1 +
 arch/riscv/kernel/ptrace.c      | 24 +++++++++++++++++++++---
 arch/riscv/kernel/vector.c      |  2 ++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index b61786d43c20..e7aa449368ad 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -51,6 +51,7 @@ void put_cpu_vector_context(void);
 void riscv_v_thread_free(struct task_struct *tsk);
 void __init riscv_v_setup_ctx_cache(void);
 void riscv_v_thread_alloc(struct task_struct *tsk);
+void __init update_regset_vector_info(unsigned long size);
 
 static inline u32 riscv_v_flags(void)
 {
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 8e86305831ea..e6272d74572f 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -153,6 +153,17 @@ static int riscv_vr_set(struct task_struct *target,
 				 0, riscv_v_vsize);
 	return ret;
 }
+
+static int riscv_vr_active(struct task_struct *target, const struct user_regset *regset)
+{
+	if (!(has_vector() || has_xtheadvector()))
+		return -ENODEV;
+
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return 0;
+
+	return regset->n;
+}
 #endif
 
 #ifdef CONFIG_RISCV_ISA_SUPM
@@ -184,7 +195,7 @@ static int tagged_addr_ctrl_set(struct task_struct *target,
 }
 #endif
 
-static const struct user_regset riscv_user_regset[] = {
+static struct user_regset riscv_user_regset[] __ro_after_init = {
 	[REGSET_X] = {
 		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = ELF_NGREG,
@@ -207,11 +218,10 @@ static const struct user_regset riscv_user_regset[] = {
 	[REGSET_V] = {
 		USER_REGSET_NOTE_TYPE(RISCV_VECTOR),
 		.align = 16,
-		.n = ((32 * RISCV_MAX_VLENB) +
-		      sizeof(struct __riscv_v_regset_state)) / sizeof(__u32),
 		.size = sizeof(__u32),
 		.regset_get = riscv_vr_get,
 		.set = riscv_vr_set,
+		.active = riscv_vr_active,
 	},
 #endif
 #ifdef CONFIG_RISCV_ISA_SUPM
@@ -233,6 +243,14 @@ static const struct user_regset_view riscv_user_native_view = {
 	.n = ARRAY_SIZE(riscv_user_regset),
 };
 
+#ifdef CONFIG_RISCV_ISA_V
+void __init update_regset_vector_info(unsigned long size)
+{
+	riscv_user_regset[REGSET_V].n = (size + sizeof(struct __riscv_v_regset_state)) /
+					sizeof(__u32);
+}
+#endif
+
 struct pt_regs_offset {
 	const char *name;
 	int offset;
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 901e67adf576..3ed071dab9d8 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -66,6 +66,8 @@ void __init riscv_v_setup_ctx_cache(void)
 	if (!(has_vector() || has_xtheadvector()))
 		return;
 
+	update_regset_vector_info(riscv_v_vsize);
+
 	riscv_v_user_cachep = kmem_cache_create_usercopy("riscv_vector_ctx",
 							 riscv_v_vsize, 16, SLAB_PANIC,
 							 0, riscv_v_vsize, NULL);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
