Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9907C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lj/0xIHeuEDcmWGFGW8LAK3p5RYb677Er2Lo15CbZ1I=; b=Mm4uNxZIsZdcKA
	olF74EAxag7M3EHB14EN1Fpl4z4/Is+J+sKgLOKRwnnIMG6acQR7KUzh+0KraF1l1/i9CtFKJG5i+
	mcAqsoXQC5hQxuicVuFfHH+LfM2o5OpqCRoUldhq1Pm1TnElMPitsMSgh1r8YVsO/eIRh62eNL1ti
	ZBmbEDnt+q8ejF2L3u2Wx/E620LGKOY6gpEPTOWOgGURyDWORTx3faSmND+c6HkYs3jynrXNjiBOQ
	K/SeTBqczP7v60hTQDwiXXHoRjosA+ldacjgUl7DWteJaL6VO6l7OAQ1/095LJDCQwxwqXaLnT2kD
	FJfvcVXgIK/EbINFlj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDSG-00DAm6-4t; Tue, 12 Apr 2022 10:09:00 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDRu-00DAZ9-EJ
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 10:08:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so2304855pjn.3
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 03:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TPHPVEhymfv8oSdQwn6KZ7VGPONNXumfRuRVQxny474=;
 b=ZjcjKgTMmHHkgO/IqeBOUs/4V91uJO5cAnoFfwZcqQBWRdM1x4KzQIdkPWTuz8bEsK
 feTlunsl4JYlrvlr23mjh2z18M9kwNNH3XhmPEiqJZeP8LyDDqgGtMBuzvLuwFxX28gL
 xDFlsfpaL5UvYRq+zvzdmGLNmKF+bJVW2e/evZmzoH0Wxuu4QLKaJUzR/51eZF5Juny+
 M5la1s5esTCj0/GiWzDL5wIqLF4WVQ94Q7+t4Dr/m2wjxYFX31MQjO3eKpwFn5dmzO91
 Gi+X+HH4ABfSdlvOr1Kyq+tDAqsq/FuYVw3piPy1cdn4sjluJjkX22igFUSYX6qoCIxT
 tZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TPHPVEhymfv8oSdQwn6KZ7VGPONNXumfRuRVQxny474=;
 b=nuoZaOhTZL+v8IAC9J8PAJiDFVfBASMLO4OCj3h6dWXOpRjSmAfkgbjYtnCf6tY2TQ
 m4bZSO5Bkl7FQzCR2inJE5F0bq2exHx8Dxf4Tg4XyPp3bHX++UPTDLYW/q1auiKE3G1s
 O+fAbjHuxTC9OlZi12L3r+IntlIKxkhH5pIZ2YumGSEXe6Xx9FZFIzSJEhViuB96I9IK
 I8YJp5G2E4NzSxh76kvX6HUlVlazbrYY1sBoX/EDEHaHVlP+Ho2lmZnp7rieL5rKze/W
 M/23+HGB6+5xIkUw18bPjWu1vk3MhrSgQ8C9qrXBsZA/OJ9ZrWKq0pab6fCls+YNrQq9
 xx8Q==
X-Gm-Message-State: AOAM531pd8RtmVnvAsqaesf6+0obz7H+DQDQ9TrhDnodJdSUOWvk8OsA
 G/Gyiu2fvs2rsMuJGwaSzximMw==
X-Google-Smtp-Source: ABdhPJySjcKVeXxfT2LuJJZ9/EQNv5DqP9lc+SlW7FJiaLZVmsog51C0vqN5X/FzN69RtBMGMMpdFQ==
X-Received: by 2002:a17:90b:2790:b0:1cb:5cb5:f8ab with SMTP id
 pw16-20020a17090b279000b001cb5cb5f8abmr4132834pjb.190.1649758115322; 
 Tue, 12 Apr 2022 03:08:35 -0700 (PDT)
Received: from localhost.localdomain ([122.182.197.47])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm37515088pfu.82.2022.04.12.03.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:08:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/6] RISC-V: KVM: Add Sv57x4 mode support for G-stage
Date: Tue, 12 Apr 2022 15:37:09 +0530
Message-Id: <20220412100713.1415094-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412100713.1415094-1-apatel@ventanamicro.com>
References: <20220412100713.1415094-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_030838_555322_FE3FE9C7 
X-CRM114-Status: GOOD (  12.79  )
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

Latest QEMU supports G-stage Sv57x4 mode so this patch extends KVM
RISC-V G-stage handling to detect and use Sv57x4 mode when available.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h |  1 +
 arch/riscv/kvm/main.c        |  3 +++
 arch/riscv/kvm/mmu.c         | 11 ++++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index e935f27b10fd..cc40521e438b 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -117,6 +117,7 @@
 #define HGATP_MODE_SV32X4	_AC(1, UL)
 #define HGATP_MODE_SV39X4	_AC(8, UL)
 #define HGATP_MODE_SV48X4	_AC(9, UL)
+#define HGATP_MODE_SV57X4	_AC(10, UL)
 
 #define HGATP32_MODE_SHIFT	31
 #define HGATP32_VMID_SHIFT	22
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index c374dad82eee..1549205fe5fe 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -105,6 +105,9 @@ int kvm_arch_init(void *opaque)
 	case HGATP_MODE_SV48X4:
 		str = "Sv48x4";
 		break;
+	case HGATP_MODE_SV57X4:
+		str = "Sv57x4";
+		break;
 	default:
 		return -ENODEV;
 	}
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index dc0520792e31..8823eb32dcde 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -751,14 +751,23 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 void kvm_riscv_gstage_mode_detect(void)
 {
 #ifdef CONFIG_64BIT
+	/* Try Sv57x4 G-stage mode */
+	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
+	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
+		gstage_mode = (HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
+		gstage_pgd_levels = 5;
+		goto skip_sv48x4_test;
+	}
+
 	/* Try Sv48x4 G-stage mode */
 	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
 		gstage_mode = (HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
 		gstage_pgd_levels = 4;
 	}
-	csr_write(CSR_HGATP, 0);
+skip_sv48x4_test:
 
+	csr_write(CSR_HGATP, 0);
 	__kvm_riscv_hfence_gvma_all();
 #endif
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
