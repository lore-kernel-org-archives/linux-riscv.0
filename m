Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7001CC61DA4
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 02:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJZHyZ1Zwuy9kQnPbJ36hVmcjb1eTizyRpu/i0o949E=; b=hwpWNI6z1laEtv
	0t6r+U9SxQ+XxXcaYZiGA0nsZZ8i3M9CZYHu4wDIcEadRbrpO4iprj8Q2gsNoamR6qZwiQQaGnI/w
	IlBBir/bYmvdRdRJ3Z0jSXA6smvt/M5lR9MyYQECQDfzIHCF88BkL1Do8Sp4xxJW+7DDuK8G3iIIQ
	/jENSL1XMFPI0wrHqZE6zVATo4LNMfxFp2y/SW6z60VsrsuPdcIH+SbkQSQbuBX+WVTyhZtW1jRjH
	sghLuQxzbwYWs3Ta9wMr7uL5cV491i2y9ga5K/wWF8TVRmN8iwD+dSiWYQX7+h1saRhVxKsJ/y4ux
	DAnxOX4n5pcxYC0HsMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOUa5-005rcY-CM; Sun, 05 Feb 2023 02:16:37 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOTcs-005oDg-Qe
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 01:15:32 +0000
Received: by mail-pj1-x102b.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so12204058pjq.0
        for <linux-riscv@lists.infradead.org>; Sat, 04 Feb 2023 17:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL8v0AQsX+ZaW68BNuHu0nM6ZE+yLKRe23LChc9y1ZE=;
        b=ZRH+09m+6M7w5O02O/M1IQSX6OH9TPKSMDeduT/LPjQfAoHWtVmRHc7KboHPEaBuDh
         e30NIc9hGxOiY3e47LJBY4kbDXEGMn2gvW6j3SIMbRpEdistHyBgozYCQJ4OdE8nNHcx
         u3S5BzL/0EutLz3NwbN2HdsSaWW43/erZLr5RJSHNa6qYLu089XGcFkmyoLBEgajHyHW
         bmmgjiguVeOJntuVmuAt4LBPBF5OMkkG/z6m2aYXWqKpHsxzMcEz81T0/2R1nKJ/hIgo
         loxj97sBJufboe2zjWthIhnQYZP1aC5tcaAhTFzsIvQEDdn8gUK8/hSX3njbdPQ7sPzy
         uaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CL8v0AQsX+ZaW68BNuHu0nM6ZE+yLKRe23LChc9y1ZE=;
        b=2sviJth91GPYx2xSKSSP7qrD5dVoW8yM4G8Zgh011NN7SpM6B4Q8SHwP8GXmdAvx0W
         4fo0aiS1EELp8wlsroZx4OhsvKwITBmOcFOLgNj5wwDGDvb3LceuarroeaJkEXNSn0/T
         D6bN2tAR9uzsp4biz8lnq1cxOpnJlrf/1yqeo2wy7XsV123ZrPY+HN/DpyEoLK5QuzAM
         ebAWHF2KrB/6QDeDnsMe4AfF6+m/Lm+KKkA0NT7YIk1sEZtsEHRTYCJhCFdMIHz9+gYC
         JZo+A8TiI0Qmy8fXuuCZkMTFKpZRNpc0KSkWZjy/+C6365VYVCwV5hInKtawmJaZTc0R
         qOEQ==
X-Gm-Message-State: AO0yUKW0vhZXlX+gUh2Mcn2Z1zHRctito4Mhueg8LpVz6rhPLOMavxwM
	G3tuW2NtoqFybo/Y7TUZA4btuQ==
X-Google-Smtp-Source: AK7set8RpnACAcot1AknBBPjsvtsA7H1/tXvbKnuz/e95wuvEaah03h17AYyNjAOK8R3bSJl4avgDg==
X-Received: by 2002:a17:90b:3ec3:b0:22c:6cd4:2686 with SMTP id rm3-20020a17090b3ec300b0022c6cd42686mr16241370pjb.30.1675559726394;
        Sat, 04 Feb 2023 17:15:26 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090a020700b0023080c4c3bcsm2721917pjc.31.2023.02.04.17.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 17:15:26 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v5 04/14] RISC-V: KVM: Define a probe function for SBI extension data structures
Date: Sat,  4 Feb 2023 17:15:05 -0800
Message-Id: <20230205011515.1284674-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205011515.1284674-1-atishp@rivosinc.com>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_171526_900809_EE979414 
X-CRM114-Status: GOOD (  13.51  )
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

Currently the probe function just checks if an SBI extension is
registered or not. However, the extension may not want to advertise
itself depending on some other condition.
An additional extension specific probe function will allow
extensions to decide if they want to be advertised to the caller or
not. Any extension that does not require additional dependency checks
can avoid implementing this function.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 3 +++
 arch/riscv/kvm/vcpu_sbi_base.c        | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index f79478a..45ba341 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -29,6 +29,9 @@ struct kvm_vcpu_sbi_extension {
 	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
 		       bool *exit);
+
+	/* Extension specific probe function */
+	unsigned long (*probe)(struct kvm_vcpu *vcpu);
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 5d65c63..be47828 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -19,6 +19,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	const struct kvm_vcpu_sbi_extension *sbi_ext;
 
 	switch (cp->a6) {
 	case SBI_EXT_BASE_GET_SPEC_VERSION:
@@ -43,8 +44,10 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			 */
 			kvm_riscv_vcpu_sbi_forward(vcpu, run);
 			*exit = true;
-		} else
-			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
+		} else {
+			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
+			*out_val = sbi_ext && sbi_ext->probe ? sbi_ext->probe(vcpu) : !!sbi_ext;
+		}
 		break;
 	case SBI_EXT_BASE_GET_MVENDORID:
 		*out_val = vcpu->arch.mvendorid;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
