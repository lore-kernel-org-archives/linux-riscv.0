Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BF6CAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWB4ekj4Qnm0oUoibKd+e4RgzbJWwaKGv3x2OveIBWA=; b=Ufh0zjx2MkI3bg
	aZ5H0QHmHvJPmZ+7XyRA65AFAE3GSkJowZ1qSMmZnJ3Vl7QEp8f/hCxegGsvqse7stJdEeK/JqvVp
	Qif8uZWJYOAno/q9uS56jo/9NepUiuehHPeM5m9Z3YcC6TeSb3X/0FMW1dEMrXrVa0g+GrZETIQiL
	4G6Ik5qQDRcLvktYQPhdjSp32JL/RlnIC7MMGy0rRJ/S08s0H5Hvy1zfBx4yA3CKAI//aovVcglSc
	ZpeKo4SJfjrAeJfx3UAXDgeg6067I6B3v+vd8M+o5YDxS57mp3K7+dt9TN3oEV6c5Ocy5e0khDkph
	oIHppsgVgp0OEuh5hCcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3unn-00000007MB2-0DIO;
	Wed, 01 Oct 2025 11:15:19 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3unk-00000007M9h-1Xrr
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 11:15:17 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b553412a19bso4934539a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759317315; x=1759922115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duIDlBd6DWondZbhFgBkxnIom+/wxjruSnguKN5DCTE=;
        b=bxbypcP6Bm0NHlRqz9gBJQrLWQAUSZ9Y7PDbrxFVlPJn4esg+qqs5YHYDOizAJnD34
         Iuegh+x4XR/7Tomzzy/0fq5kV83LuDUcS9jml2Dk0XDhM9ECigKKfgYoRxRciDUYOz+U
         iiDRy1fsv/Oe9wty5u4gml2+dUeM6RHhZsgo5eKi7ShOTIQEVWE4witqrPJfPWYL0DZU
         YtPvAq+H8k+lEiudiC3u2JND+2RC77WvguHnZvQ5SI3kWXHu5QtqpRNI+6T6vdjAS5/N
         l8n5jv61cPPPbkUiAlWzVZNyWEobpwLZzS735tIik3gUv3vbcv0/0LRRDH4pSg3tJTAr
         58Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759317315; x=1759922115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duIDlBd6DWondZbhFgBkxnIom+/wxjruSnguKN5DCTE=;
        b=F5TY7TA3BRC01Rk7z33ABJV12YVvbLwz49JaykGcFFnU4q8gfzBi4DcKRHPNlT2thZ
         BEXQea0FkF+D7qdx8kQ6JwlkATIIiBiUJv002K85TPjZigFvPN0gyCnE30s+5D2AEAVp
         dU0FjY7KokMYAPvngZPnAthreFGiC2PMmG2R1Q2tAHg+PDQX71Rd0FP9vMh1DxHax40m
         S6ZDg8mAsYfr6meRIUOdnsirQMmW/fq0VH/th70GrPv3N1v8QXcoNNjZvBMdB8DsYbSW
         2nHpY7b9/T2EUuGVFVNAGjeKuI8fHKACBePol4PdL5d+w2WpWd75MRqml36suqb1wNYr
         sX4A==
X-Forwarded-Encrypted: i=1; AJvYcCW5m6HP2Nnt6S/Dryttk2NZJPWoAVu9kP0m5fo+XNE2G1/i7MW0AC54i6gkPMSLRDVNm5RoHzKinJnItg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkPtOjNXd92dOCGuS0ydEmioZQN8OPlUaqg3vvxWobKmY3eNHy
	CgONHRVjQAC3mjHHp0PCKTPz5/MClh6YvOgaG+wsJ8BENnVZ2P6pvcGY8PJ9W6Cie/A=
X-Gm-Gg: ASbGnctD125HseIv1CXQ8hhLdjegXcWwF9Bp/pPnsmfA9NxL+lTnpjTzDiNnqY4Asx/
	kK9jdqWFS2AWH/wruqZtq2RYPLyAWh13laZ28x2jG1Ulk/9jQOijis/VEEkxXkjynqkf6Ts4oih
	FXqD/FQ0u1HqddIJmo8CNEiJvdQQVoVv2Ufwzg0/Hh2Ej1Y/MRRr6DIJXt0QjNtsTYHjCJyRYpw
	XKe8MONFL7MTv2Li68zqhv0NM0w3txNzP4/ZmaRmUGTEoWfHi4OLB22SgfLSdfXOsuqzmPQ2p7a
	9bz8/vWr8NaGMiXgA5PGuqQAapFawlu4tDAvFNhziMcCepGhJSs9j1Hw+Wecfa5ZnpY239M6N9X
	H7igSOUpYyMdfSyDYkFH3De0Cv8HZCO1itrCWIpo4I1pSDbC4EkOzrcPDGWPiiAJNPx1DSaTOHa
	QyIFIWZGMRHOU=
X-Google-Smtp-Source: AGHT+IHjVNODYRhSl9w8wTzY7/4OarsvAh7QM7qsu5LY7xOefbG8sewwIMg0Z1M/bBWd3fTkCwMIyA==
X-Received: by 2002:a17:903:17c5:b0:26e:62c9:1cc4 with SMTP id d9443c01a7336-28e7f26f791mr35301405ad.4.1759317315540;
        Wed, 01 Oct 2025 04:15:15 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27eeb9a8ebfsm155163455ad.67.2025.10.01.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 04:15:15 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andybnac@gmail.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Bill O'Donnell" <bodonnel@redhat.com>,
	Joel Granados <joel.granados@kernel.org>
Subject: [PATCH v 1/2] riscv: ptrace: Optimize the allocation of vector regset
Date: Wed,  1 Oct 2025 19:14:26 +0800
Message-ID: <20251001111451.299163-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001111451.299163-1-yongxuan.wang@sifive.com>
References: <20251001111451.299163-1-yongxuan.wang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_041516_426731_D8EA2AE6 
X-CRM114-Status: GOOD (  14.41  )
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
