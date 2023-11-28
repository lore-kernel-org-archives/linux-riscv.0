Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EF9C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/DO7Npcf3fs5RckD9InhhmY5y9m45pZQzmJ4Rds+5Q=; b=vZr/oYxXIPaxyT
	/FuP2QnkO5sKJz3O9RyCcc22/rrz3fpVJ+KpJihsXB6Gft40psQPd95JLR33co2k+CQdSY0vME8Vt
	LsVSOaycnGvC1q/bTfyL2vMGZCkKkjGKj1jfoUJRaHxGarEOKK4utwux87ev9HrA6GQrGqWDo/EFW
	zIhRCNHwkkIpTUzWOTYwXdVEO51Uf+uqpq9hV0VOx8CbGRKwkjvh1kum2pAUGaAA3xMw6U0LV7rbr
	NTEhLCnmvFwDaY2lXVfIrZOhsC5GoOor/ESxl+OX1WHKgBPEfQ7Zm0YtvtDhXsbtfdmzrb4hp6/lF
	qmRFf7CMLHrSNZXj0Uxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zU4-005ZYz-2Y;
	Tue, 28 Nov 2023 14:54:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zU0-005ZUu-2y
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:54:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cf5901b4c8so47537825ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183279; x=1701788079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YC/uOewY1L4dDGRSRiyNDutyC8uaZPgPc5G7fpX+EZI=;
        b=Dh/9ubP/z2/nmxLuL8wHFm0PULC3+q0G8/Rpuv4PsswOTf6xzr6thuh48kfa8ktlo0
         DNjFzOaysIa11CttSvOK4RuxHOEqcVcr8GfBP1eLBNJ9JPKgkyuwa2+HJ2XhHpGQvpcC
         BkNgxAd547TNoIGn2igVkEU5/Mf8S5iHWaYrAk6/zPOlex0jwqo6dwQbCbJd1TLDwmIZ
         RyJlFUfcS6dq186wopibsYYxugMxTwoc5CFr4x/9EWkllFeSN6C/YRDUWWHwdJxEJfNM
         uxmOEJx1oEM+NJk0MgNOTSP81XX4nGzQAYbFeMEYCEme8eA1eKwUOZts/CMvaTIuO6e2
         QjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183279; x=1701788079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YC/uOewY1L4dDGRSRiyNDutyC8uaZPgPc5G7fpX+EZI=;
        b=YKy+opdeuIq+8fR3nA+MNY++hfNCbjwmkawrcezVxehyxvXpiLMuKOJ1U4pnH91XfG
         htp9aEM6a31Z9TG6Y2B5MT6BxJ8KjJwvU9iNktywLIqvrZrFTPfUU/N2IM/uACqZOZTq
         dSWjjFCSjLHIXtfb0WzRdK867422ZHNUedCrhcDuURm53Ng5XzWxBIoUyRRCnXhVZ8we
         DgHZ6JJpFdHTLgqqPlbYsZiJxK9SwhekfJmaamK9eNf0CQP+QvyG6I8oZWUhJ81WvGRj
         +oO+k2ELap8QkPdIjMHWLUMFZ+KisHQJMU3kluFXEIwq5k6Ho8Vf4y1GDNMty40ohDqc
         JNXw==
X-Gm-Message-State: AOJu0YxCptlUTP1NHi4NZuVGSsP6nadGcM8mEiCp3G8UbvQu+DGsGnhM
	TNYGJUtMXNY+4snY766kYmeNEA==
X-Google-Smtp-Source: AGHT+IHQfhkrwCZ3ZQtybXZW2+vlSU2eF4Cj6domQu8dtDq+6mb74RlGxsLJug1buiN3Wgw0PJ7u0g==
X-Received: by 2002:a17:902:7483:b0:1cc:6ec2:d24e with SMTP id h3-20020a170902748300b001cc6ec2d24emr17051391pll.53.1701183279334;
        Tue, 28 Nov 2023 06:54:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:54:38 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 06/15] RISC-V: KVM: Allow vector crypto extensions for Guest/VM
Date: Tue, 28 Nov 2023 20:23:48 +0530
Message-Id: <20231128145357.413321-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065440_960626_6E2DCE6E 
X-CRM114-Status: UNSURE (   8.19  )
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
user space to detect and enable vector crypto extensions for
Guest/VM. This includes extensions Zvbb, Zvbc, Zvkb, Zvkg,
Zvkned, Zvknha, Zvknhb, Zvksed, Zvksh, and Zvkt.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 10 ++++++++++
 arch/riscv/kvm/vcpu_onereg.c      | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7b54fa215d6d..241632f91f73 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -150,6 +150,16 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZKSED,
 	KVM_RISCV_ISA_EXT_ZKSH,
 	KVM_RISCV_ISA_EXT_ZKT,
+	KVM_RISCV_ISA_EXT_ZVBB,
+	KVM_RISCV_ISA_EXT_ZVBC,
+	KVM_RISCV_ISA_EXT_ZVKB,
+	KVM_RISCV_ISA_EXT_ZVKG,
+	KVM_RISCV_ISA_EXT_ZVKNED,
+	KVM_RISCV_ISA_EXT_ZVKNHA,
+	KVM_RISCV_ISA_EXT_ZVKNHB,
+	KVM_RISCV_ISA_EXT_ZVKSED,
+	KVM_RISCV_ISA_EXT_ZVKSH,
+	KVM_RISCV_ISA_EXT_ZVKT,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index b0beebd4f86e..4cd075f4cf9f 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -62,6 +62,16 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZKSED),
 	KVM_ISA_EXT_ARR(ZKSH),
 	KVM_ISA_EXT_ARR(ZKT),
+	KVM_ISA_EXT_ARR(ZVBB),
+	KVM_ISA_EXT_ARR(ZVBC),
+	KVM_ISA_EXT_ARR(ZVKB),
+	KVM_ISA_EXT_ARR(ZVKG),
+	KVM_ISA_EXT_ARR(ZVKNED),
+	KVM_ISA_EXT_ARR(ZVKNHA),
+	KVM_ISA_EXT_ARR(ZVKNHB),
+	KVM_ISA_EXT_ARR(ZVKSED),
+	KVM_ISA_EXT_ARR(ZVKSH),
+	KVM_ISA_EXT_ARR(ZVKT),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -121,6 +131,16 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZKSED:
 	case KVM_RISCV_ISA_EXT_ZKSH:
 	case KVM_RISCV_ISA_EXT_ZKT:
+	case KVM_RISCV_ISA_EXT_ZVBB:
+	case KVM_RISCV_ISA_EXT_ZVBC:
+	case KVM_RISCV_ISA_EXT_ZVKB:
+	case KVM_RISCV_ISA_EXT_ZVKG:
+	case KVM_RISCV_ISA_EXT_ZVKNED:
+	case KVM_RISCV_ISA_EXT_ZVKNHA:
+	case KVM_RISCV_ISA_EXT_ZVKNHB:
+	case KVM_RISCV_ISA_EXT_ZVKSED:
+	case KVM_RISCV_ISA_EXT_ZVKSH:
+	case KVM_RISCV_ISA_EXT_ZVKT:
 		return false;
 	/* Extensions which can be disabled using Smstateen */
 	case KVM_RISCV_ISA_EXT_SSAIA:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
