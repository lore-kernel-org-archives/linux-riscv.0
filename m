Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804E1C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdSe3q2APdz/I2YxKW+PuLyNx0eV4XSOTZ9b6zut8sI=; b=U/BVZXMtT52tRA
	EFk3PyUdSOGssUzgJ6Z2I921K6pzAhqFyGnfbkL3JMm70lx757yfbW4Sm2bN90H1vp+a5rNWMalsK
	EiikKxztgCTSpTN+ALzppQWyPXrsVIpGth7BV34pbhMc3S44gn53zTG29qar44n2JCTGlbHzZlTDu
	sTTjsEijW3F1n1OlKdqSAZwjj4aeb1kNmZI+DSFtApecKWLa3Zu1C0/A0/JCOk16Z1/i6mDssrA6Z
	Jms+QcxO1IjANUyzI9vQ8sGmeRA2J+o2p2bvh9JjMDpThndQPwZrJmC6tpcYcTq2dCkRGdOAwslry
	8kmjw4f6Q+YQ99hqnghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASF5-00000008gGN-1NfP;
	Fri, 24 May 2024 10:33:43 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASF0-00000008gAk-3AIR
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 10:33:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-681ad26f277so567413a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 03:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716546816; x=1717151616; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZ6BYwn5mOMy3jrtkhWqLvXB1lQ/8oP4LPFGWsTQioU=;
        b=IiULeMMRGg8zjilqNzS6E+dCMzTQ4bO3/tm5U3JRbAluh5TkjBjLBFfLP2wUqheBgw
         YfLzWwiHGz4P1IYdDUfdPe9/ZkOVv3xXTL6tV7Ti6zr/LQsUFS+YrNYtWjDE8YMHP+Fw
         6JOwYsJtOyskhp9iE+uYuU7x30JBQ5v0qGX900haKuP/fTKrFg92ivVl2T2YdLt4VZxw
         jMs8/MqzwR7Mo2DAd/E5TmB9MMpHKnSdx0aycEjrga3rMtrvPQzxW4ksG6OeRIKcBTif
         2DLCjZ7QOKIY8zuQiYmLzAPT7QPwR93B0JoI3MuWkBjak/gHSUSqPHmy5hOlNu1cVyl8
         6Alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716546816; x=1717151616;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZ6BYwn5mOMy3jrtkhWqLvXB1lQ/8oP4LPFGWsTQioU=;
        b=AFw6lG/VMCFDnGaPAz2WKq8v0BnN07rAPPR7b+74A4nPSrEYkLzxXYKajYIqevJHQu
         DP0z6zQKgQf0X6dNet4ncZfIh+dz/RCKFIxQ+L2gGvI7Dfmnq8Ub8c4khc9lBFX+kMHM
         2daXZKbFQWuzCvBtBApB4FD0wh43swTOFG37Ek3cnDsxaSDLSzrNwvvJ6NQUxUZm24dM
         RVH2uP9vzeB7xX7voWwF6vx4tEGF3PuKY1Qcg2Yf2KjiKGt3mZuFe74GyfUTk/7jiMZL
         dWYLL1UTtHTtu26Io+rZApYcyskDrgT+x7c75T2flfzm+6JpmhRi37fEjM+kdxREWI4Y
         uyhw==
X-Gm-Message-State: AOJu0YzC7d4uMy1y7neEvnjrDA2wwOK8a+jejN3KGSpyLDIXr9lrCAxT
	SdZtuiWAV8DEQGdwdicQQckjy7cI6L7ve5qSuZYB9C1VHaopTyfO7F2moB3p7QSLdN7MTknvVHh
	3TVW7OOcQs26W8JzCZU+xwmCZH6xtkngT+AdwbzDvbytDe8YFWrbtNa7D3gVxDxvpe17j0yJgVn
	8oU7UxV22TZPl3rXj1U++o0r8JY+bZxP1c9hq0ndFkKdsoCpd0tpIMyDM=
X-Google-Smtp-Source: AGHT+IHwYRl01Pr85mA3t2HEOvg+sKlaLLf3SKTeqlscw+r+oqPR6B2j0Lab23cBYZRY16JbGWy4mw==
X-Received: by 2002:a05:6a20:6a2c:b0:1af:f23c:804a with SMTP id adf61e73a8af0-1b212e20716mr2197510637.38.1716546815854;
        Fri, 24 May 2024 03:33:35 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c756996sm10936625ad.8.2024.05.24.03.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 03:33:35 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 4/5] RISC-V: KVM: add support for SBI_FWFT_PTE_AD_HW_UPDATING
Date: Fri, 24 May 2024 18:33:04 +0800
Message-Id: <20240524103307.2684-5-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240524103307.2684-1-yongxuan.wang@sifive.com>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_033338_845994_290BC292 
X-CRM114-Status: GOOD (  12.97  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support for SBI_FWFT_PTE_AD_HW_UPDATING to set the PTE A/D bits
updating behavior for Guest/VM.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  2 +-
 arch/riscv/kvm/vcpu_sbi_fwft.c             | 38 +++++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
index 7b7bcc5c8fee..3614a44e0a4a 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
@@ -11,7 +11,7 @@
 
 #include <asm/sbi.h>
 
-#define KVM_SBI_FWFT_FEATURE_COUNT	1
+#define KVM_SBI_FWFT_FEATURE_COUNT	2
 
 struct kvm_sbi_fwft_config;
 struct kvm_vcpu;
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 89ec263c250d..14ef74023340 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -71,6 +71,36 @@ static int kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static int kvm_sbi_fwft_adue_supported(struct kvm_vcpu *vcpu)
+{
+	if (!riscv_isa_extension_available(vcpu->arch.isa, SVADU))
+		return SBI_ERR_NOT_SUPPORTED;
+
+	return 0;
+}
+
+static int kvm_sbi_fwft_set_adue(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf,
+				 unsigned long value)
+{
+	if (value)
+		vcpu->arch.cfg.henvcfg |= ENVCFG_ADUE;
+	else
+		vcpu->arch.cfg.henvcfg &= ~ENVCFG_ADUE;
+
+	return SBI_SUCCESS;
+}
+
+static int kvm_sbi_fwft_get_adue(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf,
+				 unsigned long *value)
+{
+	if (!riscv_isa_extension_available(vcpu->arch.isa, SVADU))
+		return SBI_ERR_NOT_SUPPORTED;
+
+	*value = !!(vcpu->arch.cfg.henvcfg & ENVCFG_ADUE);
+
+	return SBI_SUCCESS;
+}
+
 static struct kvm_sbi_fwft_config *
 kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum sbi_fwft_feature_t feature)
 {
@@ -177,7 +207,13 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
-	}
+	},
+	{
+		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
+		.supported = kvm_sbi_fwft_adue_supported,
+		.set = kvm_sbi_fwft_set_adue,
+		.get = kvm_sbi_fwft_get_adue,
+	},
 };
 
 static_assert(ARRAY_SIZE(features) == KVM_SBI_FWFT_FEATURE_COUNT);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
