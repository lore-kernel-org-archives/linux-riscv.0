Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDFBC54FCD
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 23:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tBzWVwfp/4wjgfCA7oDhs7k255DJIXpQ4cPqnxagOQ=; b=RB+Mtl3M/foB7u
	8wrFbE6GeMRq/D4UVInP7PwF1dMiThedtMi4UWYheY4E76yXsPtQmMky5dtLSMObYUwbwgGXmHt04
	QMJuGdi0Ki3M40OLJuHfxLuIzkrXv+6OawlR8q1cJke3UV0j0W18hP7HBr+lk136b2m2mOrDonIjR
	cYacv7KRzqqvGa96mBH5AdyMvbAZkRGUgWM7eYOiqYmb0eXbFl58pQxfp6rHjZiM5oFi0r/VpHtuK
	wCWCGXjpWzDSWdX3nrTP5NFPPBJGbCom9oKl5S1niPDlEq6RsmzjES0k4N6A3IGmd5W/QJjCycq/S
	vlJ7W3EDiFNehR+PLmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDep-0000000971e-1Alt;
	Wed, 29 Jul 2026 23:25:51 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDem-000000096yz-3Kph
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 23:25:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ced3386430so15247655ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 16:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785367548; x=1785972348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOohDTGKU0Fji4CKKyS8ZYpTWzbljIE/mTc4CCY1QKo=;
        b=BVfnGZ/tkSwSN9pSSV9lS+wuXFOo+7VOSMwMGQHVXiwbKAQH6rZQ8LpiuIZsi1mVud
         TrIVyDyW4vax9gyQTrDYCv0sISBWiXjWeEo8k+0hIvX7H2rCqP3Gm/9tYJYYWzGr+fcV
         B+nmZXv61IuUdMBlilBPTLgTDM7YmjdVaPIxHTviIp3D3/VMc+fI3ih2jkA0Pymi6M3F
         hHp5fbajlxRRzMeEXbfeJwdjg4OpOnDrsrqXvAw7IRlNoA1uJRV/RiD0ymwbsjD9jiIl
         Bo4ZDAcnN5zNB06O4wq7yfWPcQcl5mp7F5ybHpIY4XIY34tX2f0pdFh3T+xj/8yAJsNG
         /imA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785367548; x=1785972348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOohDTGKU0Fji4CKKyS8ZYpTWzbljIE/mTc4CCY1QKo=;
        b=FslxXh/QnOYCs5yGiuLN7BGsVn5Qv73gIr5iBDjwyRqfVeGksMI0gP4agSMq+ACvNs
         /UbpUxPwblhizqm9mRGm7pfWc1deigr67DzMIPcL2tDM5ilDLWMCyRBjV6kQXdLGA7lo
         IdYB80PEXZdJ2g2l+uExuEpzFIHlCgxqoeBkfFoaJMxmeI6sQ6ou08Mfw5jhzCgd+0Gn
         f3DOfrkN1HbWDy2K0VkWQbSEMM5Q/EaSS+LigfyyosM7o0evPZIME4kNR2ro+u1SYjk5
         dmQG6FcYmi7MdYPGTHV8k4FG27YE1t1Eu1x1NFQw5pwwOCtlgI6u5OI3VKkdfAX5gEQe
         E1aA==
X-Forwarded-Encrypted: i=1; AHgh+RpOmOtNWe2cpVi4pgZB2O6lPlHtTxnVXcOpJMoIsCrMbLIGrqqlC8Eyziz4qqF2Kj5VelxPTw2Hh2N9OA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvcTNK/xq3I2zeqFntoixzyeikSVITHyAc3/J6boGDB5kUPquN
	wfvXdasWE0AnXipgE1aYMxrgsFb+j+SfDBqgcQgkhCGlgfxofeN3GRut
X-Gm-Gg: AR+sD11BTAUKjBxreJcYdQBu1xf64DfnV8W7xjqPd9e5ytcuLB+fZFPzKrxCRugJNhc
	z7Ge1jmcs+ZrjaqlRjzMEFdEqpERTFZvnY0ygaYCFpfTi4YYhx7u/j0/OT4tkO/yJZd2RgRLqdG
	QrvFZK3NDA72o+N1tu9RomODalza4mnzKfBpsj7cbb+2tiRDy4SgTzfkZ4qhJUdG25ZLrt6eVAK
	rR8iORCgb5ZxmxxINHpSySOYW1jCzip3qi04V24sv26v4hnwcqQPhWT3UZbLv/sgt4iOWLw/a/F
	n/UHX6Szp60hVIKrHUJptExBt4carUmr8MxnYtBw5PQZIREnGLIMWrcYPFENG/VFKmZrw6XvCyr
	/EnfDFXbmqXiwXccgMJqDGeGmZlH3wJBtUItWrF7Rnuz9I/e5QX43qXUScFcerypYdJyF0AsaJv
	semKdSqaRk4ZZMIHo4USjXqy0rs0/zGh0+cUZm0iGzlkztXOMkJCy2n6qBQDk=
X-Received: by 2002:a17:902:d48b:b0:2cc:80c5:73be with SMTP id d9443c01a7336-2d035d154dfmr3101295ad.40.1785367547941;
        Wed, 29 Jul 2026 16:25:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a15215sm17512995ad.8.2026.07.29.16.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 16:25:47 -0700 (PDT)
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
Subject: [PATCH v3 3/4] RISC-V: KVM: Reset the SBI extension when disable it
Date: Thu, 30 Jul 2026 07:25:24 +0800
Message-ID: <20260729232527.139183-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729232527.139183-1-inochiama@gmail.com>
References: <20260729232527.139183-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_162548_841261_E4EF798B 
X-CRM114-Status: GOOD (  11.61  )
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

The SBI extension validation callback can only fix the parameter if
the extension is enabled. However, if the extension is disabled after
modifty some parameters, the state of the extension is still broken.

Reset the extension when the extension is disabled so it can have
a clear context.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index b737e9a7a12a..1c4f874368fb 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -221,6 +221,7 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 {
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
 	const struct kvm_riscv_sbi_extension_entry *sext;
+	const struct kvm_vcpu_sbi_extension *ext;
 
 	if (reg_val != 1 && reg_val != 0)
 		return -EINVAL;
@@ -229,6 +230,12 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext || scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE)
 		return -ENOENT;
 
+	ext = sext->ext_ptr;
+
+	if (!reg_val && scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_ENABLED &&
+	    ext->reset)
+		ext->reset(vcpu);
+
 	scontext->ext_status[sext->ext_idx] = (reg_val) ?
 			KVM_RISCV_SBI_EXT_STATUS_ENABLED :
 			KVM_RISCV_SBI_EXT_STATUS_DISABLED;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
