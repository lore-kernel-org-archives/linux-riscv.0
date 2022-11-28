Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973B2C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjJVluj8G6kBTHKtf4RM6g8ccP8VRdQ8kDIp67fyHGQ=; b=4eFwow2JoM0NQJ
	OJRBoUbNauJ58nosNWnc8xvCRm6oxJ/NyAF4ssOQfkSwGt/k8S8+g7a6DSootpL1zntD/yMcnzUWL
	aMNRSujIwgJlEH7pbAH93k/mssGaJrA1MfRhXLZ5VnaYrssu0LVunHUtH43e6VYs6TorxKpaGQWM0
	7o2tC51XeUY7lHJDZ+RcLmAmBjFKk4mojhzcaUgp4uj9PP9P+GqN9rhQiPxOfM2H/duh67JGR18wV
	H7ZERwxcY6AVixwUu/VZk5StJmNioalld/g62OpJnd0ExgHc7j7GDsxcVxF2uTyC+Fgd3ErK81xlx
	MuY4h3gpAAH+JjVevW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmS-002izA-Pp; Mon, 28 Nov 2022 16:14:52 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmO-002itN-Hj
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:14:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 136so10370765pga.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 08:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRYTh3DpQ80LeZuXMwrf/BBG8HZ9tRsbrJY4o7VrTgs=;
        b=e1sLIlmJiHEANPq+U54eAHf3W4Nh0ttJp7jgZEIsl19CGXzTS5KTdXxdGnZVN95VOm
         +fAjj4XJIlDcHqh/lhmM2cKyH8S7xnJ6+xt9Xoc3zF1xyNHKqfxdMk+nr7kzDY35QfXJ
         sXCb4pmj60ibe5fwRoceD8yLBnBMr8xYrO8nlMwYwUpdcrzfzC0l9xsHZAejcc0BYvlG
         mSYPf0SqDvsN/0nnevlQ3Ndz/freshRH8YX0YTQfmVaUuKSzIelx2EoRE/8e5aVkTNKg
         oNksB5v1mkmr1c36OgBHsAdJ7725WTdLQuwabxSvQntLoGYMzYNq2l5CjNVxBGc/URnO
         hkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRYTh3DpQ80LeZuXMwrf/BBG8HZ9tRsbrJY4o7VrTgs=;
        b=71BhB11NtJeqzvobuarh73ApH2FNOD+6MFvn1FCQw/rmRqDSuNhU+FBMos3CRZtn65
         E55nBwOlp+x7Fi0LzWX2c24DmAzAXJjLkNuzkf+SnWpVsKqSdeNAb3hEYS/FjTCZrpbS
         FlGKNGMoGdYH4YJyj/vuzec7vD0GnH3TPZJB8k1sZdv2Y6k5Nbu6JP65/EBAO0MYNZhO
         2/Lt/Niy01UUF6u/ga6Bnhfp95ZPRoDTt5YTPcgjjM4WtLP2uWkavkIGs7Va+BoTZUAt
         l3gIuefyay9HhLpWJgDy4MZniKokd07jWIpAaAWNC5KuMYEVNatMioW0mPWp7B0VmWDJ
         iSHQ==
X-Gm-Message-State: ANoB5pmiOOXqUq6qoNlYPWB11uvdIPHqpO9H7AmvL42vv0ByYt+nNpXy
	GUXu4J3HHSJ2p7WQwO9QwBL0TQ==
X-Google-Smtp-Source: AA0mqf6vP9RNcrwrw3LdbjlhLu/1pbC3GRsHHYss/6pjysHf8CgIMVkMyhfjH/kOyyBMFMTwZ7i6GQ==
X-Received: by 2002:a63:5c0f:0:b0:470:8e8a:8e11 with SMTP id q15-20020a635c0f000000b004708e8a8e11mr28249402pgb.490.1669652078905;
        Mon, 28 Nov 2022 08:14:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.0])
        by smtp.gmail.com with ESMTPSA id k145-20020a628497000000b0056246403534sm8210805pfd.88.2022.11.28.08.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:14:38 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/9] RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
Date: Mon, 28 Nov 2022 21:44:16 +0530
Message-Id: <20221128161424.608889-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_081448_611130_230FF050 
X-CRM114-Status: GOOD (  11.28  )
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

The reg_val check in kvm_riscv_vcpu_set_reg_config() should only
be done for isa config register.

Fixes: 9bfd900beeec ("RISC-V: KVM: Improve ISA extension by using a bitmap")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 17d5b3f8c2ee..982a3f5e7130 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -296,12 +296,15 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
 
-	/* This ONE REG interface is only defined for single letter extensions */
-	if (fls(reg_val) >= RISCV_ISA_EXT_BASE)
-		return -EINVAL;
-
 	switch (reg_num) {
 	case KVM_REG_RISCV_CONFIG_REG(isa):
+		/*
+		 * This ONE REG interface is only defined for
+		 * single letter extensions.
+		 */
+		if (fls(reg_val) >= RISCV_ISA_EXT_BASE)
+			return -EINVAL;
+
 		if (!vcpu->arch.ran_atleast_once) {
 			/* Ignore the enable/disable request for certain extensions */
 			for (i = 0; i < RISCV_ISA_EXT_BASE; i++) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
