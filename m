Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5836EC3064D
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 11:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cS/c7FeaCr3sHOCnAX9FbBWj0t/8LsD5Jm0LWQCCnsQ=; b=ZZ+PmwQTseShxq
	b8mPh7cxJD4LU+qQfwM4PSKAw9MsMAHM0SSZPoijZ1egyGyMDy9Ub3fg+YePBvL2voqd7QqqMKQHg
	6jj5lAPLGeeT/qKNwpZeyiJ55BJ4kUeE0CIpGXvw1O61b1jb/6VBNJWRX297KuEiIjczjAhu3W9VQ
	tKvfkbyfFfCAt1wk9NdhGjfVG1Oa+o3AFiK0qm1AZJUUMvGuUlh4VP3wHr0abU9DXvB++uop0JbdZ
	A+yenZJM93sYgh8GEodoFRaFXmJX3UdrtJG5EAOaaSvIuByOAdgG2vSZM2WiwK0oyi9X64rYOD/Ti
	K5qU2rP4UqbhxezigWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA6w-0000000DarF-446K;
	Fri, 28 Jun 2024 11:49:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA6t-0000000DaoK-15L6
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 11:49:49 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f9aeb96b93so2812175ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 04:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575386; x=1720180186; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HH4LzaMr0mqAdzm5E26L7uIUYBJEjQsUHuIAOuMmrB0=;
        b=PC4LRldodQQ+hDTEghKPh68KHiCujVoa5mEDbLnhiAftTTFP8DimiUn17lCZtrHsRz
         SsgLfG9o8yhEgNtmR+kZyOjbmwlKodom/Bb2J4k3BaVJ4Oh9n3zbmMKpP+RcrmHAwcUM
         j7n3HHj3NKhRfnTxftZnK3C9LcdcdaZW6IGegb9qdMKB/5fxLkN0/R2pS2AP3njiwYIG
         EgBuMd5yhzvyFKTYvn2p3CVZSsvMyQ6bsI3+byuLhNd2/91Cg/a/emJEAdWCr7/jh5lu
         0NYy2wef3QEFtauNkrrt+AtRxTKwyXCVx7eHk+vr1Og15vIgZweKuTNAHF21J3yBKZ8+
         uI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575386; x=1720180186;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HH4LzaMr0mqAdzm5E26L7uIUYBJEjQsUHuIAOuMmrB0=;
        b=cwhlJ6nEem901KOTexjFA97X94tnMGgA9cixvENsisQUqM/FcAefpmqEiRIyF/3bZP
         p3Tc6N3WL/9SW5rgmwvlANQ0wGTrCk1Hpy3oBpI5oZ2B89pj4JFUQD8kZ+MwTfomDX6G
         wq8MiJlwSjUYOYPTuxgC4vkZSkprun5bXRAXupFt4dv5RjVgAnsKGpk8lSOJz/HJP3Y8
         FGTlCRRLkhw9sM2D6yD2ZT6JfZNEJUn8inIsTWt3E3QQF3Uvi7/nttB4onFLQeWtl54f
         uIdb8MCZ67K0muIrr4havlnDT1B8Y3NtqeUqDzXoH79KQ8qHYVGGZZovcJpsJEsAoOBy
         G+eQ==
X-Gm-Message-State: AOJu0Yx9HQwJ8S+k4aYx7cAUvxW7lbsEf2h+5EbbrPbVw9TzPuRpx8w/
	GriyNq8kQLzc6GzDlfjgeGPyQ4acSLe93rIUC1nXGfm78BxIATJ2xvBgJkGF4GQ=
X-Google-Smtp-Source: AGHT+IHDu8SA1RMrM4zoJJjLyMPyVUMO3S5x4KKSa2ipO+ye+by9TbUq/jttoCmYWbgSnnaQg1bGzg==
X-Received: by 2002:a17:902:ccce:b0:1f7:126:5bab with SMTP id d9443c01a7336-1fa23ed509dmr174450865ad.40.1719575386170;
        Fri, 28 Jun 2024 04:49:46 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1a82sm13530635ad.59.2024.06.28.04.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:49:45 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 28 Jun 2024 19:49:12 +0800
Subject: [PATCH] riscv: vector: treat VS_INITIAL as discard
MIME-Version: 1.0
Message-Id: <20240628-dev-vstate_discard-v1-1-18e1c5d7997e@sifive.com>
X-B4-Tracking: v=1; b=H4sIADejfmYC/x3MQQqAIBBA0avErBPKyqyrRITkVLOxcEQC8e5Jy
 7f4PwGjJ2SYqwQeIzHdrqCtK9gv404UZItBNrJvlNTCYhSRgwm4WeLdeCuGUfdqkJPSpoMSPh4
 Pev/psub8ATW0KgBkAAAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_044947_423318_9889180B 
X-CRM114-Status: GOOD (  13.95  )
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

The purpose of riscv_v_vstate_discard() is to invalidate v context at
entries of syscalls. So users happen to use v after a syscall without
re-configuring would see a failure. It was achieved by setting vector
registers and CSRs to -1 and marking the context busy. However, this
results in redundant saving of v-context if the process is scheduled out
in a syscall. Moreover, restoring the invalidated context from memory is
a costly operation. In fact, all can be prevented if we can delay
vstate_discard before returning back to the user space. To be more
specific, the kernel can mark v-context as INITIAL and set the restore
flag at syscall entries. This is the indication for the vstate_restore,
so it awares that the vstate has to be invalidated before returning back
to the user space.

After applying this patch, the context switch performance has improved
6.78% on vector enabled lmbench running on a FPGA with VLEN=512. The
result was obtained by averaging the output from the following command.

$ lat_ctx 2
Before the patch: 599.8357692
After the patch: 559.1748148

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/vector.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index be7d309cca8a..1221f8b8f564 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -170,8 +170,8 @@ static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 	if ((regs->status & SR_VS) == SR_VS_OFF)
 		return;
 
-	__riscv_v_vstate_discard();
-	__riscv_v_vstate_dirty(regs);
+	set_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
+	riscv_v_vstate_on(regs);
 }
 
 static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
@@ -186,7 +186,9 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
-	if ((regs->status & SR_VS) != SR_VS_OFF) {
+	if ((regs->status & SR_VS) == SR_VS_INITIAL) {
+		__riscv_v_vstate_discard();
+	} else if ((regs->status & SR_VS) != SR_VS_OFF) {
 		__riscv_v_vstate_restore(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
 	}
@@ -197,7 +199,7 @@ static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 {
 	if ((regs->status & SR_VS) != SR_VS_OFF) {
 		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
-		riscv_v_vstate_on(regs);
+		__riscv_v_vstate_clean(regs);
 	}
 }
 

---
base-commit: 60a6707f582ebbdfb6b378f45d7bf929106a1cd5
change-id: 20240628-dev-vstate_discard-5784652968a3

Best regards,
-- 
Andy Chiu <andy.chiu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
