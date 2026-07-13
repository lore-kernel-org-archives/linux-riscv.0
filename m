Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06592C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=om/Rb/KZ2HMm/PcQw4L4hVX8FoxMey0UIpjlP82NAck=; b=DcaHiNO070yyn4
	qHR3BKJuT5JwLS1PT8jah0dJGMIBmmkkOzC7sSsPf9IhCSXswgteqk+223KlkXnwU1OKvxgGycDf4
	KnRRe/G/HXGpkdBvxxfpz3mP68Sh4EZMNWCPjLGnIzT+4+W38au5pzkFNtB2c01ATS0o76pxWp1DO
	s4QYgHM/WH2Y05afzAe0qhOG3zNrYtGDV82YO+qGXSWp3lMUKukP1siW3fEpPIbsz679MmptMgB2G
	isuEjzkvUlMBXp0tWsPH7hy84F5PAQfvvKoEWa99i63MZZn9/joXlSdV4VxAmfRZiYaVL1fgXFW9y
	BKC3BfCm76HGXrhr5MOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55a-00000007tgX-1Sed;
	Mon, 13 Jul 2026 01:04:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55X-00000007tco-1fEo
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:04:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2caea3f742bso28562855ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904642; x=1784509442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=SAerLdE/cORlAgj3bCAwmopm5Kt49YB1EnCz+nyZq7p8xws+9nFo77B5cP35Jmy8eS
         vPMLkP4tw0XJf4DgFvoOISR6+q27Lu+XNmzhelsvRGnVCsWYzoyhvrKdVtiE4tvFZZVc
         sS1rlXR5mFuvGC97fSSKMf69CEXwMdP11OZAN7kHmO+zAfmp7sul6EZfmPUzEOx3gVTZ
         /aN9JlnKSSwHeHwzgKynwm0IIyq4Ub/liCrAQRb2HnK5ltm3yGw1pVP6gEGkWH2fEEFP
         PfxO8756YMJAd7A7EnqYaZds+3V9wyyJOBhMTE/QecWjAKRGywBmdNvIVyIZyD9AA/WR
         4tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904642; x=1784509442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=dZyHDAXMq+Co7331CJCq/JYnFEv+ofDxoedn82SDtgeGejglKRwFf9hX0KVDPsIRr8
         sr36kARfixn52DCSJJVIjX1Hg8+AFets5Tx6sCkHQdQzzYrT5mPpYFRjH0MiArvoAE0s
         3LId/OUwO6FK+h1Ky5MwqHll4q5CxB0aB+vbmlnnJDOsKIQf/h9RaYjXI88IltTmvxY1
         Q4fuUzk8fWHhIi4ShhignpNOTWyZtN6YishHH1RHprFky76Szezd3xZ13gwqVztltZ61
         Dm+QvFYvw85DVoL3y0MReWqwxhJe+kRs6HjXhG12hN8V8qN+4Tm5YJTJlOyJkeHQ1Z7F
         vC1g==
X-Gm-Message-State: AOJu0YyeYIvr6tRryqZ8DA/4ghx+mX1ae/Wq36Rrv108xyXh1Mz4pz+w
	4UukROujNIkPiMoiiUOkOBWI6tQxjdBZRBxouiEWSGo9NdBz5SpuhIN5
X-Gm-Gg: AfdE7cllOqWEq96B9xucYJKZnAS1GaejQrUKbp/ctIrLK0zSTGa9Ze/OTuqA9xCP76l
	4icz4XVMH3YsmsbitKZyZYuszCKMtl60zKvPMxZI7fitcmJJx6IL6bzQqI9XC4YDnC7fuAqo4tv
	4yVBlV+eRkREeoRilY/HHEHHorFjcZT7KL9VM4NdBc50Lgn2a248bzXDg+XvQ6ZtE5pXNQ8ofwm
	nXezlvKdRqkRHpZ5ZJoa1m/XFWI6aTK68P6f858HqJat4/FwRmSn17aydbgbUUMDRM4cYxGQRdQ
	qFGJKnFLJNppoKfpMiWJI8XfAjRuWqPHXqMLznTby4NeRCJvBHsAXpyiKPAAuRwBY241JUIRjOz
	LUe2LONx/wWAQld759ULbLxVgQNX4HxD1Vd0K6CMIs+tt1b2XvXzQ5PftNI+oy1dt/ck/MsIAcn
	WAK+7oxPHNzq0=
X-Received: by 2002:a17:902:e806:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2ce9eac58f9mr71900625ad.17.1783904642652;
        Sun, 12 Jul 2026 18:04:02 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb746sm89165375ad.7.2026.07.12.18.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:04:02 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v6 5/8] RISC-V: KVM: Handle software-check exits for VCPU
Date: Mon, 13 Jul 2026 09:02:58 +0800
Message-ID: <20260713010302.303278-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_180403_439586_C17AB04F 
X-CRM114-Status: UNSURE (   9.67  )
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
