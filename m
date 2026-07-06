Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D29FC43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=om/Rb/KZ2HMm/PcQw4L4hVX8FoxMey0UIpjlP82NAck=; b=wUazn3Px4Adhvi
	1EyxjeTAD3aq6ThEqMn9Da96lZnaYzUfQIOcHhWfg7FhnWhTV5TNaKPgwSRxhPLr0KJH55cW5ivFg
	mZMkinOrwaJjbL1cRV50iYcyFSZNy5LWGPxjhg4g82VOrpluxx55NmRauDMTf+gjo+Lj40UAw1+FH
	kdf8Acwm0jmcy6rZZjxCIom7t3GNgiOYQUO+5OSP812Bx6jnTT7snBY2MWOkUmFk7v42oGDqp+SUX
	94EcqEWcSR/V7E4KeZIczbYUSFBeK1f1QS4m6NeAiQDGgY5OzgRLdu/+ynFiy6AZrbfQ/8SEycxI3
	qRI9sHkmg1i4pS8LN7DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxw-0000000BNZg-1Zie;
	Mon, 06 Jul 2026 02:21:49 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxt-0000000BNUo-183n
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:21:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so24144335ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304504; x=1783909304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=T1vT17o63Fiz8NbD+3QRGKEJic2kICCHJgi6fjNSabJsGrIwWLGAxNkL5GEZa3PeLg
         ScdKzeAyGaQC4ZE/0p1/vhjFfxQ4OpisulY/bN2MBxxOPNkfI+CVcimkuG2gWe/pVd0o
         S3QlGhVg0uCYGsnP7KDzyaptLaiXEcYCQlFdJSJHCYtp5QAEjxPs7XbmYZCyiEbrmZ8d
         itntscUWuJF7f9RIYXAQsNaq9v0KNy68BLr4aiAY/E1cVU4SzwPXRweKJUvyVFuNfy/e
         U7ar4qdd3vV803nHcodAKV0T2GA1LGqF6x4e1emhyWGCvcqAlYVa1DaVat3TfVU6jlOy
         43TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304504; x=1783909304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=IIfCI5GgpAzZ4wcXbfa9M896frGo5cE7gZ+GtL97xQL+dZyx1eqRT2Qko5EHLVxZiV
         i+w8iZjqhWIaPMApZeNCpR6L4/b6hY2ULhU6Scxqfb0Gd4vn63H+MnuNOjUR+iJ7+3Ba
         dS8OKVMvlJeUzWOlWLGTCGKyzYpdqjR3BQpIx6f2KkKYXA3ze7cfunAwxSnFHFznehqg
         SF3gGUw/WjdsXG27cBO0h1VmymjdE0Yo+5qoiPmPzpkX8hWKwmldvPGYEvNj60am/sF5
         mKZNlTJ9hiQy4uy0WLVEL7CelpNfCu7Em7DsxMi2SgzzVSRMbPYc6FUt2Eu6qcYiYaFZ
         Xayg==
X-Gm-Message-State: AOJu0YznuNXvGgvCxsvd2+Qzc5LChURk5vKuvmV8cble6oZdtFOHeC+/
	rfr5iDuPhJEtmp6wdOdCGGHsf9xeVTV3MV3ZPqFqgC/N2IuokjkBMt0M
X-Gm-Gg: AfdE7cnsVPLjBu5OG+AfhnP1yuZgfPO8kHNuD6obXuTt4p4BTNoWKdusszjaZHCwNzD
	tYtbwQwFW8+gVgRT9Hi/HgZh/Bt1SQpD4hGlun4fMqAiv1jov0+Ya4zxb5KeHwc0c4EGVx29b9h
	KLbJ2MVNF1ZV9VyS7LK5Ap5j86UdYAS3xJHlmRpfo2HJ8fxwy4bQsy01UM7xNnQ9fHhIvGpl/BZ
	9/CPEodh6bz8tIoXb3+n9TD3d79uYk23ruQ/OUbaiv40a0UeBkrxDOLcxaiXeeOo1Q9rqYp2XCH
	7zQ8Pg+HCUTTMm2/RYMf2Av/i2OH6qPr2Vr+y/r5ry6NYrLZlUBIsA01q4zQGnB/kRaiPHE8s95
	6TwfJgVWi74IL12iYRBAiM26jiElnNDRKEJbZeMYLasQudLu9ZTmM24szLRjOxX4Q
X-Received: by 2002:a17:903:2341:b0:2cc:864b:539 with SMTP id d9443c01a7336-2cc864b08c2mr41134205ad.6.1783304504462;
        Sun, 05 Jul 2026 19:21:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad776516dsm39837995ad.52.2026.07.05.19.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:44 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v5 5/8] RISC-V: KVM: Handle software-check exits for VCPU
Date: Mon,  6 Jul 2026 10:20:41 +0800
Message-ID: <20260706022046.214956-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_192145_389141_93CC97C3 
X-CRM114-Status: UNSURE (   9.22  )
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

The extension Zicfiss/Zicfilp introduces a software-check exception
to the privilege architecture. Delegate this exception to VS mode
when vCPU enable Zicfiss/Zicfilp so the CFI violations in VU/VS could
be reported.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/csr.h | 1 +
 arch/riscv/kvm/vcpu_exit.c   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 31b8988f4488..224af9facf1f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -117,6 +117,7 @@
 #define EXC_INST_PAGE_FAULT	12
 #define EXC_LOAD_PAGE_FAULT	13
 #define EXC_STORE_PAGE_FAULT	15
+#define EXC_SOFTWARE_CHECK		18
 #define EXC_INST_GUEST_PAGE_FAULT	20
 #define EXC_LOAD_GUEST_PAGE_FAULT	21
 #define EXC_VIRTUAL_INST_FAULT		22
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..12eebeabdf14 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -243,6 +243,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		run->exit_reason = KVM_EXIT_DEBUG;
 		ret = 0;
 		break;
+	case EXC_SOFTWARE_CHECK:
+		if (vcpu->arch.cfg.henvcfg & (ENVCFG_LPE | ENVCFG_SSE))
+			ret = vcpu_redirect(vcpu, trap);
+		break;
 	default:
 		break;
 	}
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
