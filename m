Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21709CA0EDC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWsT3DMuPK9X5oq1NAi+tLfNgq3QbBeidq6S5mfOZ3Q=; b=On2QlFxuuaozdc
	NPfwfWdMQQhzbjP9UndWbJI+yGNVcuPVFgKo49rp+BgTI3QpAqav0Egj9VnnNPXf3GAAIMfSLdKsh
	/4DGA7o4h3ATy5wewmxyO2f33UqrNDfHlMU9/4hooMzlhjRdpzUViVet+WG5c/EwvxJ92pXTcp57+
	xQ0iawO1JSJxZPzCrFGfsLBBDh0szLOcdMc6tDB96vRuKZMGLSfPvBR+hFTSfj8WAcNTAKmzLhWoi
	kQojX/xE5QrsPLe5zSMcnE9327dCIb4VB5LLOPb27+u1YiM+/JbEdZHnUsb95GFMTpvVXEWlyInET
	PGXYTz74S/XK6LFgteiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unca5-00000005evV-0kTr;
	Sun, 17 Aug 2025 12:33:49 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unca2-00000005etv-23dd
	for linux-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 12:33:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso2314318a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755434026; x=1756038826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdtyVjgEpxnmEVvN9KL7OGdIrEXqBJ3Mt9H1T0gTjFI=;
        b=m+eFc5U7toOPYoQTvJZ7sfG+9rj4dtbYKlnee/CN89gTHUZ582qxPoY+DDEUvLPpfc
         QE3l9/9acVGH4kWmXBXzS7bWZRB++2GCOHA61KtiQonU/iFYBZ0d5eMFukc1j9iAm/iS
         0vtqHHi1w47pGvMpEM1tjRENJI6ObuUSlYWUUVmv7FNV8AcHIguku3YcAg0WdlizV58R
         l5zeqaM5tbXf1QRzlflznitDMJejCL+I9aGgLpAIQE/LHp/9KkdCPo7XOORxhLHwOnzg
         Dhmrsa66ZxDHDe7qPN7X0mzuWv5TvRC0RT4R96rAjp86faFE7jqnLBflHbgw93HDDT/5
         2aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755434026; x=1756038826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdtyVjgEpxnmEVvN9KL7OGdIrEXqBJ3Mt9H1T0gTjFI=;
        b=H9f/ay5UFJcW4P4plUMbF2SRtEO5Vn4neFqTSCu7/KfwItvt+rOkdRnixuWdeYpb1g
         /leBD7B5yjHi9mDrZ9rycOy1Ix1cOdjMsJbIMB6pnswXw7fTTFEzzx+r6L9Md1fNARxW
         OCrEKACx6mVU5LK7NZT8M0voLv0E+rVjunZPRKpHnSH8otK68wmUJC+RUc8IJRhOOHX5
         LYvCbB5kF1cfzPyalXAwjhwEGShtPnduCqLYUD+K/uvoE+Nin1madXbXEyoWDqtTy5+3
         IMgcSpTu74n1KVj7OT3qMvjIKbufL4CUZ0wEoYy2XolBSY2ZYUf/lSyQdJE2XehcNKMY
         n2gw==
X-Forwarded-Encrypted: i=1; AJvYcCXRKc7A5qZtdNbMqMetDBn8hDocqknAz46ynTuQlybLXPnWzeYJetuGDVMYYz5MJOhMpgdpzYCc9+1kfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0/1gc7JuT2D6IFngBa0p9yepUFzT4GWmWYZ/8t+BO2tfUFgVM
	TA3s/QWTq0ikzOIqy2p0EOQwC4jPLBpdcjSv3OXblLLWjPeuVGaT0AblcD+97f+EzY0=
X-Gm-Gg: ASbGnctzbW+PlphJWbn2O/KQAGWCnGF+b6ERTJrO7cioYfNfcw9lWoufysM8E74J88+
	jtM0zWAHMT8Sbc4hQWDi0vPfSSPiIEuaEtBuX2Zyu7FG3q8AjEJ5gHb5ejMjdkmVp+6Xbqd4e2Y
	Oc1ZAoBAbwLyIrL4owHc7gzXugA6BuZgOVulXqNVpAsqMKCel8kbf63A+h1AWcTN6/yIBVpmnHt
	9aOQyWK/oCnDK22URiW91W5YS2B2y8t5lIsZ+l/sC/zdjhmZaOCbDOAnuHGkHBwbA8rXRQFYBAu
	ylEccNrVBp8SPWaOqVZ+kuogdRikmVIluHHXeonf4fOBCOM7yfZiVzUdIf9zijKxhLfb5QMT5+r
	sdyjqm+h6udMoWsp8X0PeFdgZ3f3sq0g2jSxWahnAWV2zp+mwdL7wPz0=
X-Google-Smtp-Source: AGHT+IEDEZ+sKN9pizGMbZuUmdosnGUt8+j6ILexLeYj3eWsbGW9HTYMbtimVNOhIKuNFlbVtoY1Dw==
X-Received: by 2002:a17:90b:2d43:b0:31e:c62b:477b with SMTP id 98e67ed59e1d1-32341ec4ed7mr12210812a91.11.1755434025641;
        Sun, 17 Aug 2025 05:33:45 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232b291449sm4480912a91.0.2025.08.17.05.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:33:45 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 1/6] RISC-V: KVM: Set initial value of hedeleg in kvm_arch_vcpu_create()
Date: Sun, 17 Aug 2025 18:03:19 +0530
Message-ID: <20250817123324.239423-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817123324.239423-1-apatel@ventanamicro.com>
References: <20250817123324.239423-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_053346_527482_58AA4E0A 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

The hedeleg may be updated by ONE_REG interface before the VCPU
is run at least once hence set the initial value of hedeleg in
kvm_arch_vcpu_create() instead of kvm_riscv_vcpu_setup_config().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f001e56403f9..86025f68c374 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -133,6 +133,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	/* Mark this VCPU never ran */
 	vcpu->arch.ran_atleast_once = false;
+
+	vcpu->arch.cfg.hedeleg = KVM_HEDELEG_DEFAULT;
 	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
 	bitmap_zero(vcpu->arch.isa, RISCV_ISA_EXT_MAX);
 
@@ -570,7 +572,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
 	}
 
-	cfg->hedeleg = KVM_HEDELEG_DEFAULT;
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
