Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144C5C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vaj5urGiGP1HsP9JjTue0YWKNO2knjS/e1esnaxehDI=; b=rDFxsWSO+HnUWJ
	RkudIZeRboAfnxLwE6JSkot553eUH57IITTJOfjUO198CD0R5ekcM0lA5CV9SM/VIGSK0j0dr/q0b
	1GjFCZuMCxWsyvoiasHANjgGSQkENEUjQySm12UNZ2lTiNSD1+IEfqsICBpg/rm23dArZszh9/kBA
	rAY2U9XcKgk5bx4I78eQQUAnFnqcBufCoOv4GlM6MirH+8V/QlqfHWjA/DTuMy0lREeaRxoggqyCq
	uMOSjd5iUg+m7yvrCpuj6JSJC4NZzNOFvpeJP6lKvvHfySemy9VTUtasyuDoU1NNfxDQvwQJQwC1U
	Zf+Jz46NJwxna/qGfjHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp5-0000000BMaB-1vVm;
	Mon, 06 Jul 2026 02:12:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp2-0000000BMYG-3yxo
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:12:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cae1a3a744so17418465ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783303956; x=1783908756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YsyBUeISRtTsmCW0fRgq5oh/PaolZ1FgVZ4dpWHLHI=;
        b=mCXfbKy+4i+MTFJib5C5qNalINqFJqPwrwDxwpigakL4oA8NTXmNge+a8EOw0zbvlI
         So35s3lFGjkqXG5ArXPRQnSonyMP+bFkRdunpJyDK0moftN+Q7XeY0z/dkNrgBOT/ygO
         wLnt9kSneB0CY24PqPtPPcDVZ5ruX++FyeHNWLuD/kXKrqgMItoTa/UqRD/kz5KyP+MI
         YLaolOlrZtKqRQf6/5aGpjkR2pNnf5didPTwmL9X9Wb9/0Yq3KabpaT4xTGXPSpfCsDv
         y4tnG7NY7Xub0Zlt+PyTpzvbgr8KjeROA47nxxhFee077n7YSGIQZrLR6/sjjW0exbWy
         KWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783303956; x=1783908756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/YsyBUeISRtTsmCW0fRgq5oh/PaolZ1FgVZ4dpWHLHI=;
        b=sHxhB7sGW065ZBmXv14unoZPH1fN0ZxBPeAilwRPQeUhUmlo9xeTgX6U1OktL08VqH
         dVZ9catA/YjM9bCwmu8xnHzFdT+6BmkumcA6rPCt8iNx4dM8n7+U2U2v1CEUrHFN+EIi
         JCgWs8bcFM6w97xxRnMrWAQ21dcYPvxJl5tloriyaJs7AiySyP42e9fzKHWdYBeryRCr
         thNuz2TToAR8kzANZPAKu1tpcu46Gusezc3JbdgXG0qqK+3DbFBT0MiaE6jkIZeeiscD
         2AgReTkwDMzlFuC4dOOKdYm4QbaQNg6yttYc94xV9pCCMgptaCTKD3llnYsbjA8ZgiwQ
         hF6g==
X-Forwarded-Encrypted: i=1; AHgh+RqEpoYrUb6ffSe/zXPzlb5U07ZJWB+E7ga+ySSf4PwLRVvwvDyL/md4SXjQdlW/BlyFscRJKBmsNaLgcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUCJVJE5/vml2hl2GcCyYt6bl94E2HaVpLIkzqIatUnmg67rYM
	82gWEgn7WJfOkQWqrfSiGf8+qEXA1HNkY1gAmOqzZaqF+2rNJAKljtgV
X-Gm-Gg: AfdE7cnBRCm4WBMuYF65zgS82lccj0vG0OAjmuzVEYiPH+5BPr8JLoh4gsO7G4QGT59
	REioggyYnjYlUEeieZMDyV8/IHkBwipFb6uQJH6Xv+nL9NEB+qi2yc9wek1F4jEF7pituhPdy2n
	nHe+ecLQhWTK5o59CUwet1F8q4tGylBEgeQ8xVNb6rDEWsFyQUWOR8AfAmwaUSoexuw0EBmWEUv
	UzKWZ9TvzXYkDSVYVje6Uq4SKbEN79iNAGc2je9SDGGDsgZAlfjUwL2thcLv3bhp+1sSsfYyCHT
	TS/OMtZebWd2KVAeoNUoV5hnzBZTkcrRiIbLk0y96suLwTxgOMYtzAqFAHMyssKkQ6deXET7DU4
	Tmp3TNpUmt6qasz4kSQp+wd7IQMn8UCpyW2Wdrl3z1/P7TSWGBXJdyqrmsy4Dl+bI
X-Received: by 2002:a17:903:3bcb:b0:2ca:e08e:9e70 with SMTP id d9443c01a7336-2cbb9f479a9mr84564265ad.46.1783303956077;
        Sun, 05 Jul 2026 19:12:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad71270e5sm40338495ad.23.2026.07.05.19.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:12:35 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] RISC-V: KVM: Add SBI extension validate callback
Date: Mon,  6 Jul 2026 10:11:50 +0800
Message-ID: <20260706021154.210289-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706021154.210289-1-inochiama@gmail.com>
References: <20260706021154.210289-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_191236_988880_FDCBB623 
X-CRM114-Status: GOOD (  13.12  )
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

When user disable FWFT extension after setting any value of the
FWFT feature, the state of vCPU will be broken since the value
of disable FWFT feature is still functional.

Add the generic SBI extension validate callback so the FWFT
extension can fix its parameters before the first run.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++++
 arch/riscv/kvm/vcpu_config.c          |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 23 +++++++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index c1a7e3b40d9c..f01a2860c751 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -60,6 +60,9 @@ struct kvm_vcpu_sbi_extension {
 
 	void (*reset)(struct kvm_vcpu *vcpu);
 
+	/* Allow the extension to correct its parameters before the first run */
+	void (*validate)(struct kvm_vcpu *vcpu);
+
 	unsigned long state_reg_subtype;
 	unsigned long (*get_state_reg_count)(struct kvm_vcpu *vcpu);
 	int (*get_state_reg_id)(struct kvm_vcpu *vcpu, int index, u64 *reg_id);
@@ -93,6 +96,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_sbi_validate(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index 238418fed2b9..b68aa830aaf5 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -69,6 +69,8 @@ void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)
 
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
+
+	kvm_riscv_vcpu_sbi_validate(vcpu);
 }
 
 void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 46ab7b989432..b737e9a7a12a 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -723,3 +723,26 @@ void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu)
 		ext->reset(vcpu);
 	}
 }
+
+void kvm_riscv_vcpu_sbi_validate(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int idx, i;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+		idx = entry->ext_idx;
+
+		if (idx < 0 || idx >= ARRAY_SIZE(scontext->ext_status))
+			continue;
+
+		if (scontext->ext_status[idx] != KVM_RISCV_SBI_EXT_STATUS_ENABLED ||
+		    !ext->validate)
+			continue;
+
+		ext->validate(vcpu);
+	}
+}
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
