Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F637C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WE+VIB4/byUYrL1m3vEw2qjiGWGB0uEvTkGEYZTTqMU=; b=eJoqwcWAap7rWD
	rRcT+oUoIwant4ZqHPbmPoh479zzNBlI/Y+UxybaVocfOArVG1W5mGehNTcImlU3+nSmmbkgRfgom
	NM7PtWFZL8i7O0GazAxzsUYnX4oHWyTFmOWZ2vHipU0b331dClVqLxYSRYS7o70lJdJ8l7+WtXVXJ
	YnUTUjpLleq0NqBNotuGA6/j2Dkx/5rB395d/Tlhq3bbya9Urf7W9tyaZxKM3qZ5k2rW/Jlq3H7HZ
	MX33NxakQFoXtyyiW4zs99Pl12HA9MZOaRm7aNlk4CRJYqiG886BVJWOq2YyJ3tfqjgCXwi0+2KNQ
	TlLYbrutO0fxxwv/l3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWOt-009PWN-34;
	Thu, 02 Nov 2023 12:02:15 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWOo-009POH-0v
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 12:02:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6c3443083f2so148794b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 05:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698926527; x=1699531327; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ftnYGlHohU4PgAvOLDfsNbFmXMcl+RaArmfMB/fCVZg=;
        b=k+JespQaCST83E77rw1HaUgQESJsgN/q/b18AQnj4GUptbMAgAmGgOqqdQv/g1Stw7
         yBFfQptS66p6x640pcqhKioxB9j1ceeyCmzcFfZqyClTac5ei+l/wy2jf1W3KTKM7F0M
         /uHO/AnntD15HHIOncD20CBWIbUDD5dSt8YmzZRI9wSTf1JNtqkUVmUoYXtfEgAku5PF
         R9pIcILRefcz5Gv99zfK4sI6/r3z5XJdyCoxf9jgh42TjJwXpLmv2x/JYzXb/TUKkGTc
         Rl31S/v3KcY9Db1y4ZgvXs+0fVt/oeHhGTRCrssh5FwEMDJGue/HhfhsS1yA27mwEfaa
         BKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698926527; x=1699531327;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftnYGlHohU4PgAvOLDfsNbFmXMcl+RaArmfMB/fCVZg=;
        b=eBawAwTdxifwbFM8HBLMi2qaHc6eN6WU0fVRcBB/LCXufzZzVJKCR6AWlXxNhjUeha
         d0CcILoxVBkOQmnvianJo0PvEdHL0zq1PZaa9UP55R07EOWnyRtoesMrlRH3TSz+IIMp
         BcZ1rQazqaHU+r2Shb+3buW9nehoLZk47cM1CRjyUQYFwlHF5KupC7FglyewRLAuTn10
         A14zHVjZAWmrkBaLyHinVWiLzQw12j3SmNYncnYPM86Ze8726QgZYrRFLSk04cufD+MJ
         /o4dF7/2HoeH+Nvup4hReK8RzgKOwHbL99fY9XCNxA/Brki+UoXawcdr/NOD647lJ5m3
         vT+A==
X-Gm-Message-State: AOJu0YwpFjQjZnXazRUZELN21pkSzsh/G437j8xIewhntEeF6rXKR0jw
	xMQsshel6p3S6oFVEB/5P/7OSBFSeHltiMLfX8ngfzM9W5uI6PlnYwsbds0560l4l2/rSzu+mwT
	sBq2PF+UEy7n02BIHk6R7Y8Ipo4MO2ME4hPrrK3aDNpf3WSniHnqYxMhTxP7H8ZGn74DNgPMxuh
	ComoWBXoKq4oHG0e3PTw==
X-Google-Smtp-Source: AGHT+IGak6vYxyYxJboQzPYtlVELlojzQHOYOuIewHMFX+Z9YpUdKomQpySY+4ZD8wRCrq38FcVPbQ==
X-Received: by 2002:a17:902:d50d:b0:1cc:3875:e654 with SMTP id b13-20020a170902d50d00b001cc3875e654mr12967681plg.26.1698926526894;
        Thu, 02 Nov 2023 05:02:06 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902f68c00b001cc0f6028b8sm2969008plg.106.2023.11.02.05.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 05:02:06 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	tjytimi@163.com,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] KVM: riscv: selftests: Add Svadu Extension to get-reg-list testt
Date: Thu,  2 Nov 2023 12:01:25 +0000
Message-Id: <20231102120129.11261-5-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231102120129.11261-1-yongxuan.wang@sifive.com>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_050210_324964_0CA0F33C 
X-CRM114-Status: GOOD (  12.18  )
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

Update the get-reg-list test to test the Svadu Extension is available
for guest OS.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 .../testing/selftests/kvm/riscv/get-reg-list.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 9f99ea42f45f..972538d76f48 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -49,6 +49,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVADU:
 		return true;
 	/* AIA registers are always available when Ssaia can't be disabled */
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
@@ -340,6 +341,7 @@ static const char *isa_ext_id_to_str(__u64 id)
 		"KVM_RISCV_ISA_EXT_ZICSR",
 		"KVM_RISCV_ISA_EXT_ZIFENCEI",
 		"KVM_RISCV_ISA_EXT_ZIHPM",
+		"KVM_RISCV_ISA_EXT_SVADU",
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
@@ -700,6 +702,10 @@ static __u64 fp_d_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D,
 };
 
+static __u64 svadu_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVADU,
+};
+
 #define BASE_SUBLIST \
 	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
 	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
@@ -739,6 +745,9 @@ static __u64 fp_d_regs[] = {
 #define FP_D_REGS_SUBLIST \
 	{"fp_d", .feature = KVM_RISCV_ISA_EXT_D, .regs = fp_d_regs, \
 		.regs_n = ARRAY_SIZE(fp_d_regs),}
+#define SVADU_REGS_SUBLIST \
+	{"svadu", .feature = KVM_RISCV_ISA_EXT_SVADU, .regs = svadu_regs, \
+		.regs_n = ARRAY_SIZE(svadu_regs),}
 
 static struct vcpu_reg_list h_config = {
 	.sublists = {
@@ -876,6 +885,14 @@ static struct vcpu_reg_list fp_d_config = {
 	},
 };
 
+static struct vcpu_reg_list svadu_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	SVADU_REGS_SUBLIST,
+	{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&h_config,
 	&zicbom_config,
@@ -894,5 +911,6 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&aia_config,
 	&fp_f_config,
 	&fp_d_config,
+	&svadu_config,
 };
 int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
