Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3BFC636D4
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 23:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3ujKS5h8TqGyLDdLf1sYV71lga2xSiRdVdD//opMBc=; b=0AEP3bN0K6Wx7V
	PsW+zn9IhxEyEBirF2VfMdtBF2mIaWnvm9m1Ruz6qljvs2yTYzIaYONNmjYvJzj2wvQPgiJXAIokX
	tPSzihliviQA3lCGzFD5RmGkEYC7YUv1KT62BPaMpTWEOAceJHcOB+2O4pY+6leuZMd/VNgvImL/L
	irL9//x2JE8XHXiuVymWGmRpvBXWO99P/ckUyq9tEgqtExx+TNu+0IzB25MGG9xAVqtqqDbwNSRYC
	VcG9uBdFSFAelw7dT1YZKVAD7RnTChFALadraaIEYybnr8SSzcKZeld2I8grHLvlHosHwedwBB1u6
	ogAToBqJvD3/InJAaf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNMI1-00DrUX-Vv; Wed, 01 Feb 2023 23:13:18 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNMHs-00DrKz-OJ
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 23:13:14 +0000
Received: by mail-pj1-x1033.google.com with SMTP id e8-20020a17090a9a8800b0022c387f0f93so3837335pjp.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCMwx+bNWqE6Uw0wVFvOC8mb8JgaxncZy1aDemdVBjk=;
        b=mdNqkzYUs2zpA4DU4VEmsE/uQMZGivSWSfYeFb6rmpfasEsLsAcZPkheNKsoOFTjd/
         vq9cpIn8un8CiRxkgXJuDEjVEYrtJ32FDY0W7HHlquY0qlzqPXTcULeK+8fOMeeOu4q2
         KFCm+0LEilFqCX77NN1juCn9Vsy8dCUzU+XMU+VY4HOD7MUu/P4iJlmI9p2JWXUxJMek
         PFCms9ed2SH/2qADoAi9aUd56mwgsDRaJ8qXSYWlqAfPFPqBzVuVn5/izTeKikNZjBbu
         uLGwwhc5JtW06s+X/OhthIZeYKsfpk7/u4oZ+Kf3xMlvFwzbWXO9KAYnvfWKrspcZmap
         vTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCMwx+bNWqE6Uw0wVFvOC8mb8JgaxncZy1aDemdVBjk=;
        b=h+RbeLvWjGFFZ1xrkZAl5xDK5QWdsIiuo+jF3GJ5R6Jw6/fUvIXS4rrtMkEPKMgxLX
         ijjzW3PF3h3T0wM8CSnKE15AZJoqTdtFFlKILaRsc4tn2GgGNCJBcFxmUnkfSi+bBltm
         mvlK3g6mkdfeZmxgjrLaY+U9rq1Xrv+IE5WdkC8buxcb/TvJGjUeKiSp9ECrSkjZwM0E
         CnoR/U128YKRFj4u9eMH7a76/5x2XKvVDk0SdPYogkwQzMdUhv6lAsgzoJC8PjxqB5y9
         Yi4QUuoTtVEAxhtCNziZWM5zvKq8YpB7HiFcMd81JRGmZH1fPaR5vJLb97lIIVOQqML1
         qjuw==
X-Gm-Message-State: AO0yUKVJazDeoBb6ESyRwoXLelwvVKE66zfJezag1Ksy8CxqK+bTdjxl
	uol1pdw0QoVR5yAJvwjDtitDzg==
X-Google-Smtp-Source: AK7set9HfqeuPhdedfadqcZDEVftRlnyWsjXY3IpoobY3rvnO7Fx5H9DRvVWwp0++NVgN6ZbRqMVQQ==
X-Received: by 2002:a17:90b:1c05:b0:22b:b5c7:4fc with SMTP id oc5-20020a17090b1c0500b0022bb5c704fcmr4086441pjb.46.1675293176534;
        Wed, 01 Feb 2023 15:12:56 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:12:56 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 04/14] RISC-V: KVM: Define a probe function for SBI extension data structures
Date: Wed,  1 Feb 2023 15:12:40 -0800
Message-Id: <20230201231250.3806412-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_151308_871635_53E52C64 
X-CRM114-Status: GOOD (  15.46  )
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
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
 arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

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
index 5d65c63..846d518 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -19,6 +19,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	const struct kvm_vcpu_sbi_extension *sbi_ext;
 
 	switch (cp->a6) {
 	case SBI_EXT_BASE_GET_SPEC_VERSION:
@@ -43,8 +44,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			 */
 			kvm_riscv_vcpu_sbi_forward(vcpu, run);
 			*exit = true;
-		} else
-			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
+		} else {
+			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
+			if (sbi_ext) {
+				if (sbi_ext->probe)
+					*out_val = sbi_ext->probe(vcpu);
+				else
+					*out_val = 1;
+			} else
+				*out_val = 0;
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
