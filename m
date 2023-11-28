Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDAEC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxtcqAPUerKv18Bn9qf03RJLF2uI1c/4COt8zjYijfA=; b=gy24xDCnARNYYb
	WGvnSMO6l4BxHbfm5GTqMuMsYOeqXIpUAKYmJwubouI5uxr3W4C2ew+9eQ0B4crgwHNCaztOCrXGU
	iK46GwsWf9enAyGCl2qoBaR7P+v/YrSr6Y1WopG0YoXKgyjEzgGWiBhQDU/3PL77J6OHUfKEH2AJo
	yTCl3TuujU6CdlGG1tTaVQmMvqGkHvQ5IQgIGCnxT7fIZnt0/1B8D1OG5xnAJ50+4JCRTSkJMmNid
	kwDm2eiK9W4xqF+a4JPLF+aJQ2UNOPnHBJYelP6VMP9nNTGJHNzkQhwkFS2pzk6LGmudFUixm+Onz
	XobUUcNNbNaCfN/8cjIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zU8-005ZdS-2R;
	Tue, 28 Nov 2023 14:54:48 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zU6-005ZZp-1W
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:54:47 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28591079eb5so2927478a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183285; x=1701788085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfMEYFNY4t0wNlr3hA5A82AOB/2KSEl3zEL3USkF3fk=;
        b=UOdiMn4lRV3Kn2rDT/FNMa5Ci/RmORxWqyBb2ZpTwLdtLcoz5nsaq9YI89j2eWUS2t
         NT/DEjcxluPRAxn6PUrQomSkNOA2ZU8qBsE0IXi8KH/eoTrwEvxNRRHgwFKd1r/VF5Qm
         sAptsRr2s/i4VAOtK3sUYLW5/p/91u3AjZ6WEMl46t44VWjWkg+bRF/Ua/mwFultSrn9
         y93e7FiKq+Yp73y9/heTUmldG4lzEYdeU2y8I4QmbiQti6qtdsKB7HevMwyCSz94B6Qz
         4JTm/8by0KnfKdl2ifZ7XSHizx/uLZDWQcgMX+sctZU3VxKN905LNqBpFl07FNTzuJWv
         u4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183285; x=1701788085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfMEYFNY4t0wNlr3hA5A82AOB/2KSEl3zEL3USkF3fk=;
        b=usXhZuxhhqrE7C1Lnxn/yH+UDfODhxfT0Vz7NvXXvMSir0HICpZ2Cq7+vVzN0Sytd3
         T8+JhER7UU5nqzZrr+CtwvKF8iO7XrdaR60EvJBpEat+MWJ7CBVqjSyuuNDa3+Rnonnd
         ufLwvAvgEhWCRu05/3wx50O3zWsoq14IgvyybwglhMionlC67rPySzxvK8XiujH2fVzd
         CuKICkkA6bExYWD7NTk9Fw2DhOmb5w63cLm0Q/8uRFOOaF3pxc4+6qdX9miE76PGEmLt
         qlL6ZodViYiMO5GndIet7FuRS/cza0gQydKYLoMDmGVri0DoEhSmbFZFPhkJ5fQZvy+b
         PL7w==
X-Gm-Message-State: AOJu0YzwXU9Viulepw55b4Ig6AjJArIzgkTkg1DS1wtS7z4XtipEEZHG
	Wo8AZ3ZRIdH2xZ0j1gwZlxVFLIUW6jnazuuh/EI=
X-Google-Smtp-Source: AGHT+IE6h2fUA1tLYkF7nxYU5YCCr84rmf1flbtFaYMziBR2dmaX4sBzK4UtuEfEDYJpjxQHNuwUGw==
X-Received: by 2002:a17:90b:1b07:b0:285:9cce:a63f with SMTP id nu7-20020a17090b1b0700b002859ccea63fmr17562386pjb.23.1701183284854;
        Tue, 28 Nov 2023 06:54:44 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:54:44 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 07/15] KVM: riscv: selftests: Add vector crypto extensions to get-reg-list test
Date: Tue, 28 Nov 2023 20:23:49 +0530
Message-Id: <20231128145357.413321-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065446_508977_4A5270E8 
X-CRM114-Status: UNSURE (   8.96  )
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

The KVM RISC-V allows vector crypto extensions for Guest/VM so let us
add these extensions to get-reg-list test. This includes extensions
Zvbb, Zvbc, Zvkb, Zvkg, Zvkned, Zvknha, Zvknhb, Zvksed, Zvksh, and Zvkt.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index aabc05e4b02b..04ff8836c474 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -64,6 +64,16 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSED:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSH:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKT:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVBB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVBC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKG:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNED:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNHA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNHB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKSED:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKSH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKT:
 		return true;
 	/* AIA registers are always available when Ssaia can't be disabled */
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
@@ -392,6 +402,16 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(ZKSED),
 		KVM_ISA_EXT_ARR(ZKSH),
 		KVM_ISA_EXT_ARR(ZKT),
+		KVM_ISA_EXT_ARR(ZVBB),
+		KVM_ISA_EXT_ARR(ZVBC),
+		KVM_ISA_EXT_ARR(ZVKB),
+		KVM_ISA_EXT_ARR(ZVKG),
+		KVM_ISA_EXT_ARR(ZVKNED),
+		KVM_ISA_EXT_ARR(ZVKNHA),
+		KVM_ISA_EXT_ARR(ZVKNHB),
+		KVM_ISA_EXT_ARR(ZVKSED),
+		KVM_ISA_EXT_ARR(ZVKSH),
+		KVM_ISA_EXT_ARR(ZVKT),
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name))
@@ -781,6 +801,16 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zkr, ZKR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zksed, ZKSED);
 KVM_ISA_EXT_SIMPLE_CONFIG(zksh, ZKSH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zkt, ZKT);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvbb, ZVBB);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvbc, ZVBC);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvkb, ZVKB);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvkg, ZVKG);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvkned, ZVKNED);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvknha, ZVKNHA);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvknhb, ZVKNHB);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvksed, ZVKSED);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvksh, ZVKSH);
+KVM_ISA_EXT_SIMPLE_CONFIG(zvkt, ZVKT);
 
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_aia,
@@ -814,5 +844,15 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zksed,
 	&config_zksh,
 	&config_zkt,
+	&config_zvbb,
+	&config_zvbc,
+	&config_zvkb,
+	&config_zvkg,
+	&config_zvkned,
+	&config_zvknha,
+	&config_zvknhb,
+	&config_zvksed,
+	&config_zvksh,
+	&config_zvkt,
 };
 int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
