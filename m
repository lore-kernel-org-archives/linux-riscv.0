Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3A0C04AA9
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 15:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOs8xsSkmoq1fxzRszJsIQ5PY/oRXK0OoAVoAXjkNlM=; b=LpJbIkBSEhNR1d
	2TfP1mgonBblDNHvSrhkLW4Lu8wu2wV1V0zgnPdwUGKNg15LNpXVCfwIaqFW4mlslc8STeU/bCq3x
	eiXetIfe/tw3y61r7lqpiRUySeWYxvE9TU3A7NQpNz9hZ6vhn2AxSqtfgtqO9ZtvRk57JAyz9sdcf
	t6IABvVgZ6olrJ3F/fmmI1/MZlT8WZ7b6LLv3mYSU7nC8nhyaj/BeVPgOG9flTPCH8eLeAefRdEM9
	ZMBFTY07U0aA6XKJXeMAtt50a3ASspRoZkjZKcEHXApbA2rBAjD2yHvuS5xAC+Uir4+/nsMulwoCz
	V0aeFadzMGHTkKKiDS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qizPR-003Xpn-2B;
	Wed, 20 Sep 2023 15:46:37 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qizPO-003XmC-1a
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 15:46:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c434c33ec0so41883215ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695224792; x=1695829592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WW4VSH0fAhQvFEKg4libvP4KxfqhgcxX9zTpJuWWZQ=;
        b=QprYrvXcqd0xVjh6Es+zJZTIkDeSxZJLJ0ZhcnnSBcxnZHPtH4rVWvwt2LeF6Prhx0
         uquQL8DRSXmhJn67PlPJbVAj1nymm598dUrfsbUKUPt/mdSq5UPkTTOiSG4xfn1B1C1z
         8lIaU4ybcsgI+oPMMAO/0GFiqYekzgMj+qbt/LAlz58nvmBaJ3LNUGYTeWJMzMqxNbQj
         izuWaORO6jOG5w17fom+Kzl4Ao74AG8cpYYLC1MAMMWO1+sZRSa5r4qn988xsEeRXXsA
         d1nlng9XXvkj3t8afzpa+WFx2Zx7H+XGcpdZxm5CmjDA+rkrYxiTSb26dT1MOgtvrFO2
         gceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695224792; x=1695829592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WW4VSH0fAhQvFEKg4libvP4KxfqhgcxX9zTpJuWWZQ=;
        b=AjBdlIKWKzFP40qtZ8orm29+cb6MmfMC2+cHB3O7P6NJG8lPuXK5sBdUb28ifxxiXN
         /5BtmPgqVhhf1FPPuljVaqi1mYUynvEHeQdvetbK0+0AogbEygPwICZZmdQ7smgbYRSN
         Kxxfhwb4D+yatgJhPe2LWHPdulH2D0GhzkaVCOm18s6OPNofmI7VzOUqirq+RM322Osd
         kAY5FogihEn9YYGSCvPHmeVc0LCGu+gXrtwL6AA4qbR68wA7m5YBs5efedwTxd5fVKnQ
         o3pjykpC8AHsiYP+w4Fv4gQWXBDIQt/snJh0RpLGpDTGXq1+26cQXXrUnIGhlEE7IzRJ
         M7LQ==
X-Gm-Message-State: AOJu0Yyt7yJJSGvIKOAVh/A4CwpnTwoAPwjdAumIikLRTpbxvTBvRm7O
	Lni9Q+Ppm7+ORTDkRDbF0PjR0Q==
X-Google-Smtp-Source: AGHT+IEQwIPKCinnV/MX16/4WhhXgBUWvl9vAEkhPYp7GStfJsefOl4SMlV88d8R5cEXT5ASSUov4A==
X-Received: by 2002:a17:902:ed54:b0:1c3:9764:764f with SMTP id y20-20020a170902ed5400b001c39764764fmr2676177plb.48.1695224792293;
        Wed, 20 Sep 2023 08:46:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.109])
        by smtp.gmail.com with ESMTPSA id m7-20020a170902db0700b001c0de73564dsm11995153plx.205.2023.09.20.08.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:46:31 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 2/4] RISC-V: KVM: Fix riscv_vcpu_get_isa_ext_single() for missing extensions
Date: Wed, 20 Sep 2023 21:16:06 +0530
Message-Id: <20230920154608.1447057-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920154608.1447057-1-apatel@ventanamicro.com>
References: <20230920154608.1447057-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_084634_550021_B56B2DAE 
X-CRM114-Status: GOOD (  12.46  )
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

The riscv_vcpu_get_isa_ext_single() should fail with -ENOENT error
when corresponding ISA extension is not available on the host.

Fixes: e98b1085be79 ("RISC-V: KVM: Factor-out ONE_REG related code to its own source file")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index e7e833ced91b..b7e0e03c69b1 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -460,8 +460,11 @@ static int riscv_vcpu_get_isa_ext_single(struct kvm_vcpu *vcpu,
 	    reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
 		return -ENOENT;
 
-	*reg_val = 0;
 	host_isa_ext = kvm_isa_ext_arr[reg_num];
+	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
+		return -ENOENT;
+
+	*reg_val = 0;
 	if (__riscv_isa_extension_available(vcpu->arch.isa, host_isa_ext))
 		*reg_val = 1; /* Mark the given extension as available */
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
