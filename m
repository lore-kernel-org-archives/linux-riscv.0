Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FD0CD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVBNDToEk1yF8g2qPUqLxjNl6EtO16xUoioOp/YwnoY=; b=ufSsuuuq9koZeg
	Vx2TAW5s/G/Rfcqw+aQxj5eUHyXrUcn3cc5un66Q8hqps2jgkafvdTJw2LPmMWRzBWKg9Dh/qHVX7
	erBEq+bLlCgvyXf+0SNpOr/MwTAKAhDT5z4dKnvIPlcVFenA0DWYFC7nQ87Zft/mDXRQdkaz1xMKF
	b4TfGnzf/4N15o5wgw4328bKa0ymHoLmOT1pqLvItR7Rl4F8wyILhydnLjF1HRDCY8rz4mMMX/EtB
	VbK2tg+u97OXLOiqv/Z7u4325x4L8SjmivtSREKp8Zln6gN1mf5Ja2SFockKgogNnSzcVa3ELfJhl
	3sSntfcealMSsrmQp1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9Yo-000000003aM-3R6J;
	Fri, 29 Mar 2024 10:34:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8X4-0000000HUhi-131y
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 09:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=D8h7cMSHewFGFYlfFfESe4dUXe0bnXjUVrh6WZkusMc=; b=cE//La2XpNSa4r/87A2CR4xwgR
	zpVly5H1UEKsPKAuz5LCFOQGdrpzA19CKGTRNieAr6PBIaU0y4RiJTgItzlAKJ3PwjX3XaDGIEIqS
	vSmicD6zLBqerFq9Hg3uuvniglr+vcH9BtBqBo+kPfA8VeSljIglAoEPy5dx00GdszMWD++aprYQ8
	DqDuyd9yMityFbiwt1qhi+QVH0S3Unfy/u7ZXIVKSiWb+Ve7psiDzex2XYY+o+BJMroOYBC8jE0Ya
	pIatT0wuUWj9ehVJs+BT01tLdAHOmiocdDLohsQQSnZSyLihytFD0rMxuIOPfAlCGrlBkl32LvC3z
	ytu1dheA==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8X1-00000001TxO-0Eua
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:28:16 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so1255196a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711704493; x=1712309293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8h7cMSHewFGFYlfFfESe4dUXe0bnXjUVrh6WZkusMc=;
        b=D8spwmgqjX0rVjnTv8g52Me2IM6Ck5OAUh4unNlVP8Nb3yD+qpHbIbAkLln6ZSJB3D
         caRR0/SmfYBx5cabWvHzbxjqBGKJlqGaVokCIzv92IiIJEC1O9HxGAJPT+f+x1VdcrHk
         5R19hNKzkVsfWuZ6+tCXs/Fjhc2NHrFBdLk5DSsJohQgVVDxp9SwOvF1ix5aOuZaUPSn
         G61joaaTNzKcx9tkYJdyxFuDCEzWQDyNLJDaHhkh0LeFNW+sZW/f2ZL+S3wER1Jygn76
         WImdgrML9n3KXWGFb9Z4ba2/N9etHSy02x/YJb6OiMrUTKnFyRaNPwfysm7H8rtSnAfI
         Jseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704493; x=1712309293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8h7cMSHewFGFYlfFfESe4dUXe0bnXjUVrh6WZkusMc=;
        b=BQqWMxfEeTfJjI/eYC0maB081LzIj1t72wibrnt/n/OJusPDOHN2F/R6LgBNO22mLD
         CNYb1NrbZvVUQ1aieFTMal3DfspkCv7zwN662Zw2NryTrevf0NvndclDfWL1j8vbNyOt
         iw/hiYUaTTbtwhaBNJnrZSk+Mf7BiC1KYicdIYq56iLvy096IeKXFOwsxp00Zh0f/4n7
         OZNV6Imi07TEqE8VjxEGMG3zulL9F7pOKJC8OVAdVVFkH08FFQrLe7/4VkzfzdwEyu1N
         zDHa7XojrnRZuBXgPQPxfVef7zMvd7nQLCXwkiAMsHlopcGCx0FGA2fS+oXTZwMx080+
         XSUw==
X-Forwarded-Encrypted: i=1; AJvYcCURnR5UMJhMLvB//tcmi0Osk1mnpoykUI4OC+d9FjWK7B8LvwzcnTD+WGhHUJJUs3KywyzBKt7O37Zeg5VATAIQwtWSPbo07ergdt30j7Gc
X-Gm-Message-State: AOJu0YyspiJPkaBfJHZJ7KrqfUT4of7es1e7JCFREu2gshpmdBll7ynU
	8/eixibf1FigrnoqN0Szjkd3McT5a48NLptgduK344eglnynEWV1l6617FaBjTPzGD6zrJh5Jik
	Ykae3KgOmfRsvqFaITFDBnA5KwwO0bSySzw81I6fY3kKZNeTQwJ1TS8PTI1q5Ka7yB9Rxj2PeEf
	1MRVTig20/33Bwk7JJoY4OcPfT28NrXS52mHpxSXuOlZbjoAodmw==
X-Google-Smtp-Source: AGHT+IHUaxFv/dBvqwWUSlGt4S9YT575kSY8SadSYy/sbeUKbzKaMImn5kh/n16Q0rGOAx3nqMZItA==
X-Received: by 2002:a17:90a:e386:b0:29b:46f0:6f8e with SMTP id b6-20020a17090ae38600b0029b46f06f8emr2770618pjz.8.1711704492529;
        Fri, 29 Mar 2024 02:28:12 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b002a02f8d350fsm2628830pjb.53.2024.03.29.02.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:28:12 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:25 +0800
Subject: [PATCH RFC 09/11] riscv: KVM: Add scontext to ONE_REG
MIME-Version: 1.0
Message-Id: <20240329-dev-maxh-lin-452-6-9-v1-9-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Max Hsu <max.hsu@sifive.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_092815_210975_96810F58 
X-CRM114-Status: GOOD (  16.88  )
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

From: Yong-Xuan Wang <yongxuan.wang@sifive.com>

Updte the ONE_REG interface to allow the scontext CSR can be accessed from
user space.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Co-developed-by: Max Hsu <max.hsu@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  8 +++++
 arch/riscv/kvm/vcpu_onereg.c      | 62 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 9f70da85ed51..1886722127d7 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -98,6 +98,11 @@ struct kvm_riscv_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+/* Sdtrig CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_sdtrig_csr {
+	unsigned long scontext;
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -224,12 +229,15 @@ struct kvm_riscv_sbi_sta {
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_SMSTATEEN	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_SDTRIG	(0x3 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
 	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)  \
 	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_SDTRIG_REG(name)  \
+	(offsetof(struct kvm_riscv_sdtrig_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 10dda5ddc0a6..2796a86ec70b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -471,6 +471,34 @@ static int kvm_riscv_vcpu_smstateen_get_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static inline int kvm_riscv_vcpu_sdtrig_set_csr(struct kvm_vcpu *vcpu,
+						unsigned long reg_num,
+						unsigned long reg_val)
+{
+	struct kvm_vcpu_sdtrig_csr *csr = &vcpu->arch.sdtrig_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_sdtrig_csr) /
+		sizeof(unsigned long))
+		return -EINVAL;
+
+	((unsigned long *)csr)[reg_num] = reg_val;
+	return 0;
+}
+
+static int kvm_riscv_vcpu_sdtrig_get_csr(struct kvm_vcpu *vcpu,
+					 unsigned long reg_num,
+					 unsigned long *out_val)
+{
+	struct kvm_vcpu_sdtrig_csr *csr = &vcpu->arch.sdtrig_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_sdtrig_csr) /
+		sizeof(unsigned long))
+		return -EINVAL;
+
+	*out_val = ((unsigned long *)csr)[reg_num];
+	return 0;
+}
+
 static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
@@ -500,6 +528,11 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 			rc = kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num,
 							      &reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_SDTRIG:
+		rc = -EINVAL;
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SDTRIG))
+			rc = kvm_riscv_vcpu_sdtrig_get_csr(vcpu, reg_num, &reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -545,6 +578,11 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 			rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num,
 							      reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_SDTRIG:
+		rc = -EINVAL;
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SDTRIG))
+			rc = kvm_riscv_vcpu_sdtrig_set_csr(vcpu, reg_num, reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -803,6 +841,8 @@ static inline unsigned long num_csr_regs(const struct kvm_vcpu *vcpu)
 		n += sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long);
 	if (riscv_isa_extension_available(vcpu->arch.isa, SMSTATEEN))
 		n += sizeof(struct kvm_riscv_smstateen_csr) / sizeof(unsigned long);
+	if (riscv_isa_extension_available(vcpu->arch.isa, SDTRIG))
+		n += sizeof(struct kvm_riscv_sdtrig_csr) / sizeof(unsigned long);
 
 	return n;
 }
@@ -811,7 +851,7 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 				u64 __user *uindices)
 {
 	int n1 = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
-	int n2 = 0, n3 = 0;
+	int n2 = 0, n3 = 0, n4 = 0;
 
 	/* copy general csr regs */
 	for (int i = 0; i < n1; i++) {
@@ -863,7 +903,25 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 		}
 	}
 
-	return n1 + n2 + n3;
+	/* copy Sdtrig csr regs */
+	if (riscv_isa_extension_available(vcpu->arch.isa, SDTRIG)) {
+		n4 = sizeof(struct kvm_riscv_sdtrig_csr) / sizeof(unsigned long);
+
+		for (int i = 0; i < n4; i++) {
+			u64 size = IS_ENABLED(CONFIG_32BIT) ?
+				   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+			u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_CSR |
+					  KVM_REG_RISCV_CSR_SDTRIG | i;
+
+			if (uindices) {
+				if (put_user(reg, uindices))
+					return -EFAULT;
+				uindices++;
+			}
+		}
+	}
+
+	return n1 + n2 + n3 + n4;
 }
 
 static inline unsigned long num_timer_regs(void)

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
