Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01268CD3432
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtzT0nghRp7lFML3QZRwR8Z9X598lA60477tKA2oMuo=; b=A4hdwwlZtDGyaP
	VOWCeiJcmKITa2bEvztsZ+F3iCJ9UOm0y5zgT9JqgB6yfqVQ1xCs6T8xCwnBCWL3YMTBIloA5Ah30
	fHivnlK/EHked/1rfkvWilGPgmTWi6tqv4WcDvFF//cjYjyEgyZMU6EWn9CEBwQdRvL6SgR6MDOyn
	HsAJqgeXf+PfwxJjnEtlNzWcQXdkjOxT7ZG8qUqS3BoTR3lanSYauYWA7diMUw9JXBYsvSDjvEmeR
	yC96wVeR+hafBFrG3ySGZZd6NlN5XvAoYjeMhrVqrWnfkb0zHaL2YUZDYhmtSG2VRuXKfi/NjWyMM
	I9md7M2zcr7AgfwZ4KFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoe-00GqrT-1u;
	Tue, 19 Sep 2023 03:54:24 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoa-00Gqow-2v
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:54:22 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-565334377d0so4292886a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 20:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695095660; x=1695700460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG0THHfqd29pFm5IKGVp9LhjXXrDBkkPoZXxS9VdOEc=;
        b=jsg6i9+o09gjb5UM6HpPXsrdRjl0gmbbiH+Oih7eeX33DIMJF0CYBWWq0tskR+2vyK
         xb+nKRf9C8tI4GtpRMX6PktCYAyiIPtslTb/c0q6foyH82dGh6yiCt0yUSSkzvnzxOeq
         fcu2dAhBsOwjcneuu5LxzfwAeKMcG1Y1T0JNn4JYhQHMfmsUDuY2U5kqhVPdhpRR7hzC
         j4qc0jFLTxCq+L2/XqQfE99551JeBcWjtZV+I4seweAQWb7qQczNoIHNIK8nnK0JpqSl
         quH8Ne4d4zbr8+xVi4XlqG9cFUW0Vvt+iA/htdFA8kvRIncFWBjDBGO+cTZHxXeM84x/
         x8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695095660; x=1695700460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qG0THHfqd29pFm5IKGVp9LhjXXrDBkkPoZXxS9VdOEc=;
        b=M4ZU2ipTX2Snx/GCzroldTLBCZ3MfHHXfao7NFaaIcxVdzERFyLf2oSYhfU2jsPvdn
         x0pEBlmZ96UzAjQupdXCOLgJWdNnQiTdd1Tc8igNMku6n1yUtEAuMpnbPwKK/fmbHg4d
         HYgb0lc6fv1UJjFdG9SzTt2k1QT+fpzhVeUCKn1dlSp5xNNBs18G6DFnUwJRFunDbzhN
         OsZupJvLZvYxtQqc/BK+EFzJPdw3hjNrNCCMBfmBGwx5UD+hbuAcr49py5U+UrlT9N5S
         g4Q4mGpwos45Us3AmSIMV8gweBKFgJsRmQf3Qwjo6J6urXleQH8PDSF7AyASyTLyXHwT
         JLlw==
X-Gm-Message-State: AOJu0YyCbM5KDaASWf6dhWP0iBSiB0q6bMBTr5W4K6Pib5LnQB3yS1Bh
	tOwtaVaUnQockxIZwc7miq/dqg==
X-Google-Smtp-Source: AGHT+IHwzyVCSxSfbot4344shbzr2uf/C2yvQ6tC3JEnX6sYep3WTmCTb6K0EpxLdSLw7odC/FlDig==
X-Received: by 2002:a05:6a20:7288:b0:135:7975:f55 with SMTP id o8-20020a056a20728800b0013579750f55mr13927437pzk.47.1695095660280;
        Mon, 18 Sep 2023 20:54:20 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a034300b00273fc850342sm4000802pjf.20.2023.09.18.20.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 20:54:19 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/7] RISC-V: KVM: Allow Zicond extension for Guest/VM
Date: Tue, 19 Sep 2023 09:23:40 +0530
Message-Id: <20230919035343.1399389-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919035343.1399389-1-apatel@ventanamicro.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205420_949523_7B0CFB0B 
X-CRM114-Status: UNSURE (   9.47  )
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

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable Zicond extension for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e030c12c7dfc..35ceb38a4eff 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -139,6 +139,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIHPM,
 	KVM_RISCV_ISA_EXT_SMSTATEEN,
 	KVM_RISCV_ISA_EXT_XVENTANACONDOPS,
+	KVM_RISCV_ISA_EXT_ZICOND,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 17a847a1114b..d3ca4969c985 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -47,6 +47,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICNTR),
+	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
 	KVM_ISA_EXT_ARR(ZIFENCEI),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
@@ -95,6 +96,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
+	case KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
