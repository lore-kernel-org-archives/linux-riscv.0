Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A91C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 03:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuqiWYAjtP/RJixIbQZH5qGkkm7MRbdHpHEF8KdXL2o=; b=u8SgunORPAkuYO
	Xo2+ygGGU5O5WCji+gbXapq5wfGnsyHG9YsYxSpJmhy+Vr2bd1JGCW4A8+tkIfkA/GqNsMMpst7wM
	pJBRbWMLAhpqu5nu+KC6gwEVIv1yVHv5eqNTWeUm0kBe2TLG02e0BNbqXvPrF/M7+BPUctIlDj1KZ
	ZaX/zelWv4dGSBd0XB1Lt/eVMgH7SGAjjBfurGGpGmC0fHq0np3MzTSNkzDlczU6h0IAW9khIwJoi
	vxsM844ZD8Lf+d6dS63dIHmg89BowngD86De1mt9URpqiySpkbofaY00HgkpMQIG/yeqNoWqR3gEh
	nLQO5BW8mr7ZkM+PloAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dZR-000Vkw-2I;
	Wed, 22 Nov 2023 03:06:33 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dZO-000ViW-0x
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 03:06:31 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6c115026985so6373920b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 19:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700622387; x=1701227187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQTyfvTA/sT9rfHfHNgSFRFvzietrqmBvaroSzp1CzI=;
        b=LZzOJ/5RjVLFUPAe4YyiBAyMZMBWGTopBEFS4CXfNNJIUnQBwnEomncGP6NDelmuFM
         9qn6qhnM/ouf+5k35vf8VrJGvsOJ/su5mBrSKWVJ7bcF/MyI+IsGPReegg12qEuNZhcb
         o26h6ztE6emJU6CrOFGyOGwWJEBVNQKKB61zd2GSQ3veeGzRYqCiwNPB+X+KzLwHqrTy
         TRzXBE0QVvz6Y1X2HqIZH6JQHi63MGdEciFQI85MLk54Pm4dHWSMsTDJEsPuhF66NQ2E
         +MqAbL2aKe7OEAEsgfpf6YeS7QfcjeSD3/3TmHIyYi/yYY0NT/HWuMDPMNI7BiuFwReZ
         97SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700622387; x=1701227187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQTyfvTA/sT9rfHfHNgSFRFvzietrqmBvaroSzp1CzI=;
        b=jFyHN4xmWqFLrogf5pdeea3fOP90wA0t3z78xtA4A7yQf0VHvQeuWBrAu5rzWn+Iyy
         n1zYjjIgoZ6w58KRyMuJm+KliMFEFHChAfABy8opSfxHrB6rf3yOFPEbu7y5PhQNIWKU
         VmTutxPNkkoiKDSpkncJvnkJFQwmVvW7URLO32DzJAwCJLhylZ01xV2rGM+Kp65FRQ/6
         vnjvOORzRM7tBFDxdq1GuEdwrsm3we29ehVxJ0quxat5v06Nl6xeOGTCKH1YvdFFsEwZ
         CCpdZVVrTlRs5N5+inllCjbKlrD/+YXa2QPEm+xBCthGx5OHKlJMHfxXUviTRUg3c3+B
         /NFA==
X-Gm-Message-State: AOJu0Yx4RptUiHO55PBTm+1TDoH/P3r4zwkjRnSRBw7PSQS9F69CnWqq
	8xqXVTseyEPX8Oo5dTyRV+CWoA==
X-Google-Smtp-Source: AGHT+IHMBi1+1x3Yt/bfrl9gyv/iDKPNW7+yCziyo+xCTBYWw/hNzj1p+tHsCVOZgnyBdWAdN+80eQ==
X-Received: by 2002:a05:6a20:78a2:b0:186:2389:a73e with SMTP id d34-20020a056a2078a200b001862389a73emr933242pzg.55.1700622387226;
        Tue, 21 Nov 2023 19:06:27 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s2-20020aa78282000000b006a77343b0ccsm8614917pfm.89.2023.11.21.19.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 19:06:26 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/3] riscv: Add support for kernel-mode FPU
Date: Tue, 21 Nov 2023 19:05:13 -0800
Message-ID: <20231122030621.3759313-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122030621.3759313-1-samuel.holland@sifive.com>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_190630_335699_3425388A 
X-CRM114-Status: GOOD (  10.14  )
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

This is needed to support recent hardware in the amdgpu DRM driver. The
FPU code in that driver is not performance-critical, so only provide the
minimal support.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/switch_to.h | 14 ++++++++++++++
 arch/riscv/kernel/process.c        |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index f90d8e42f3c7..4b15f1292fc4 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -63,6 +63,20 @@ static __always_inline bool has_fpu(void)
 	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
 		riscv_has_extension_likely(RISCV_ISA_EXT_d);
 }
+
+static inline void kernel_fpu_begin(void)
+{
+	preempt_disable();
+	fstate_save(current, task_pt_regs(current));
+	csr_set(CSR_SSTATUS, SR_FS);
+}
+
+static inline void kernel_fpu_end(void)
+{
+	csr_clear(CSR_SSTATUS, SR_FS);
+	fstate_restore(current, task_pt_regs(current));
+	preempt_enable();
+}
 #else
 static __always_inline bool has_fpu(void) { return false; }
 #define fstate_save(task, regs) do { } while (0)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 4f21d970a129..6a18bc709d1c 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -225,3 +225,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
+
+EXPORT_SYMBOL_GPL(__fstate_save);
+EXPORT_SYMBOL_GPL(__fstate_restore);
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
