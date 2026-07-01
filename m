Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495CEC43602
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 02:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/L6l08eNW/d+NPHRbAUJfk/CJN/RBy5JMG/R4Mezmo=; b=y8k4w2uAOzw7Sb
	ufAMfZzy7DIOJgoMhPo1OvudaLt5wwztr7EP+Qicl3+TkhK+rtob6CfVJnZ9qkUDycQS0uux34Aby
	neI1/M7rWyAR/Eavst3C6lwo3VaOJkyJU+Fv58Q85ymQbR6zVvts5szweIgnkmix2EQRAdpaFc6Vf
	uT/mkosbWk5dQE/N3sCAKlFxGTSnk8bryqOZ82Q4eqKfhPkoDFvgJfLbP6XVEXp/sda/fUrg5jQVC
	myxg8FoMsZoc3kp8B8tF/FMA3JUNHxKu+7VyFksW2g46u6ia6LxUvNfdMZLiEVuHqyt2QEq+anOyO
	RFLHvF6wBWmU3VGwWEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNJ-00000000Upj-1mMI;
	Wed, 01 Jul 2026 02:08:29 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNB-00000000Ukt-1UoT
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:25 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso74364a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 19:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871700; x=1783476500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=po4kDk/lZywXCElmrEehdpcTOcoSsUoCxOEPbUTcYiKB9ie8sNCyIId7E2tIpaXsTT
         C08SE9NVWZm4DFoKrclhOaWeL9fV+gZOjCCJ9D/GQ3Oj8XTI5xO0LW84oDyw6VgJwqRZ
         4dK922VrQboZpxJW+N9YtW5eN2BW6mKlXkjAl+rEVod+s3iWcJ+rMwT+aWbyHnZ6Dwww
         Tg3WBpw+IDmQFawuEEeaTa/1KQWhAIJoa4Oc0P3Ywp37Lk5kXRzNlVkgPOjY52vnpCyN
         tlZOEiuldEqFY3PSPalvmqTbn/9yp2NyM4gchMB2PjlHTsZJtU6J5UgsTvLPqoswhOUu
         v5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871700; x=1783476500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=Pxfntb1dKRUTayQu2R8p+ez/9YOFBk8TsVQjgdWvE4R1ewAd/ywccby4IMvaZWCj5Z
         vTtSvUI8ACmObfhXTo/Q/sLpwJooIp9vHIw54BN1iCPAiImumRYkIJe3Xyloc7Psxk0V
         kbvkFG3D4u3BYF8V7xCZr37RmuBQPdDz2mENOQsWZXA0JIvqdouLjpGtGnHbBgBLl133
         Y8WR2K7jW+PyHAOhOb7IzDstTtz+FTTvVW8sIAs1R9miwvOjsgDq7lxaEsh3Rkg22Pzm
         7EZW57U9RVKTfxowkgVz2uL8g3xTwUZjyc/nVSRfp4anbTjGqv+Rg54/DqIKtDVM4V7x
         I8bA==
X-Gm-Message-State: AOJu0YwsQPyvVK7ra4bt9pzPegmL3V6mBmUMYbV51+po16M6R/dNjlDH
	W5wHjFWY2wxTI5McmeXELJc8Bbz7Arfk7v0GvF4Y3Oqa+hDQ3Y4dDyKc
X-Gm-Gg: AfdE7cnb9vF1xnDLERlMyUklmxxeQBFSvhEGQ9mwD6Veik6DPpi+WmGqPNfpmq0N3ua
	NhoF6IFyXCw9r8LqyxBee4lnw0iQozzbrdv3f0T2sS+0V44Q2Zrv7TFo9812Axczl/D1t7VrUs2
	9Ti1aisl57ch2cF0ypzd88iVc1lNoza9Q5Am+J8LTJeR347xqTfFnqYLhPav/XYWx2QnK8Lilck
	jdp8Ofy3eWCeS1jlQy0rh7rjKc/IzxGBhN84yEUVusN094AFuh3pDuu7Ah9d1L8Fapf8OhPXZ+L
	2kLKWKtmbAHoovLmW3pspzuycvLK7KxMqkFWLRGZJd5yIvcnyLII8pjsWm9DHHaxaKZxGA5aMT/
	U2ZI4QTwop2L36faEuUyQRb9XjE1pKPVhhBoHrSp5dnQWVbBLAXXPRz1MRPsmujsKeGEqFvS01H
	bdv6enR+w97h8=
X-Received: by 2002:a17:90b:5204:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-3808bd62c54mr2410952a91.8.1782871700388;
        Tue, 30 Jun 2026 19:08:20 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3809645185dsm801518a91.15.2026.06.30.19.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:19 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v4 2/8] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Wed,  1 Jul 2026 10:07:39 +0800
Message-ID: <20260701020746.170157-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190822_910923_0FA0A1FA 
X-CRM114-Status: GOOD (  10.22  )
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

The KVM RISC-V allows Svadu FWFT for Guest/VM so add this extension
to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index cb86cb6b3635..94e33b2ee796 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -745,6 +745,9 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 3: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable)";
 	case 4: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags)";
 	case 5: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value)";
+	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
+	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
+	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -944,6 +947,13 @@ static __u64 sbi_fwft_pointer_masking_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
 };
 
+static __u64 sbi_fwft_pte_ad_hw_updating_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -1259,6 +1269,16 @@ static struct vcpu_reg_list config_sbi_fwft_pointer_masking = {
 	},
 };
 
+static struct vcpu_reg_list config_sbi_fwft_pte_ad_hw_updating = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(svade, SVADE),
+		SUBLIST_ISA(svadu, SVADU),
+		SUBLIST_SBI(fwft_pte_ad_hw_updating, FWFT),
+		{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
 	&config_sbi_sta,
@@ -1268,6 +1288,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_mpxy,
 	&config_sbi_fwft_misaligned_deleg,
 	&config_sbi_fwft_pointer_masking,
+	&config_sbi_fwft_pte_ad_hw_updating,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
