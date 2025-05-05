Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C68C3ABC2
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 21:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HaiXeJuu3KiynirdnYeP0BvMKjl6+f5sovybFAcepS8=; b=GcWenHmdDDdet1
	WKxSGAYkvXt9Rgr9bjaoavZjTt8UyyWBaIwEm3vx7ZQ1jwlha+NEZoz9vq5gN2cAMNxn0vXrlyxH+
	tl7JOnewl50hZb6kEW24dUsl/9CeiFDij+htcZC6yHF9CXy7KbViTK7HO6VlwTZc8B46waaVAZvpt
	3pYPHu3VznQ9ezdWkKoAqRSy/szqU1W3BFh0Ixog6chYDjdGfFWvibddv1c/BH2vX5cl/KHDy8/W6
	CgLojQZNJXpnFVmQJa6gSOvxjXyFgo1vIQ7iiQb35IEA5v9tTTGHFyOBsIPDuYg8ky2N/816Sinv1
	7C+kkstll6RqM1ZUjt0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3Yy-00000008dr1-3Ry8;
	Mon, 05 May 2025 21:41:24 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3XI-00000008dLS-3f4Q
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 21:39:46 +0000
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso5252610b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 May 2025 14:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481180; x=1747085980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfFMvCaGxkt3NeGE85EC76Mka/3yXyXq5JViUm/gzpM=;
        b=GV3ztlbgIUSI3SBPZ4DUON0dZDNc3lU8iqxRc4WC+nDGxyGlkWq+OGQsk43jl2VJ02
         LeWvSvzP7NwSvKcuGOD8UyoCugjAoiSm1mlqMUnne2vLwvTRttBnzuy7unveTFZCEMJE
         W5urCw7eU7mjg9dMQYRdaY3D0x/s1+FtE4i1N9ZVLN1DG+J6OoO+qu075+RBlIX692Xr
         q2s6bn/WrVJhg6sMS6gogThdMXKAeZO3pZB+UJI8L2tNdBZvmh0fp+Qv05cDwtvQiawn
         yVjEvMHZcjgGRCY5N5zTTtRCm4IBdWcjUqnT0V4HsRleZ7h4C3GhartpPjaFHRF3EqBQ
         r5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481180; x=1747085980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfFMvCaGxkt3NeGE85EC76Mka/3yXyXq5JViUm/gzpM=;
        b=bqa3ZJkoAYgMczXGRsfQwenJgU8fS/qh2FRrED6MbQ0AJ7MEAQnSGrgL17ooWqnE0G
         V8lDLB28DlSoo5/cis15O9g1gy6MB1o87aPGtsdLN20IT3yNMv9vz8Jrj1n3zZum627E
         FCoJUFaWA9veGSLIeYDzMf5eD3NIUf5BchU3xlW9whrW00uFRTr/tNq1gOY3HCAblLfW
         +MW6JFtpdyZsbgEQs0d2ziDvjOLXoimiWMCJLd71KO7Nc2O0ueRbtjJZ2MakiatSr6qK
         gnbXrEFRGmC7elO366pjFThlHD5wtSNKZnu5i1MMePf6zOCnVB2Bh+FI1xs9GtR/vgdq
         eABg==
X-Forwarded-Encrypted: i=1; AJvYcCVvd/22dVFPr9VATRvDfldlMwi+9rR55zUSNp51BJADjCqM7W29ZyOEEKg7ygXYw3n0jkxQhcJjxZJ1Hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwH8Ze96iyBVabFNyVvMJhFxWixp2quoHlBijt8/msJJpCU//S0
	fDh+98Fa27ezvf1lGGdWF/gNeRjBN9Gk72tkuZGT7SpRpPvzbTS2PSE/sT3OvZc=
X-Gm-Gg: ASbGncs4Npd8ktqTZKc+C7mwvB5EFVcyvZPHNKaiH8OoVLNKEV+kBABRFdeZZT4xPqW
	DkWRzE3Lk2uqNIDdwTXpCG9TvyKT66AvSJKv3hjkO+Rcb5RnNeIKciuH3sE8tSBbfxC61qOrl0N
	29xwH/xwUFH1KWP+tDO0D7EbdVqLuUJDxteOjB9FCYy9JwpAX2IsI0kVp63mBjDFPrPZCCTArMZ
	CPcofQPfbBAT/i9pGYRDG6ZRGP3+tmo0eRdyMje8l7aYcKscQMsT+ostRoaEggjroHUY4sy6+AX
	1ddNe/4iFTZmcTymUXiHw3UbehgAoQMfmfv8cjvCUyP+3ujp87n3mw==
X-Google-Smtp-Source: AGHT+IHaY1/wqoejX+c2irF8o4c25FVRdJ7OcAVhO20N1cFEts/lKwVCx4wh1gNDM2vBI71ScyuV8g==
X-Received: by 2002:a05:6a00:2793:b0:73e:10ea:1196 with SMTP id d2e1a72fcca58-740919bcf33mr1106942b3a.8.1746481179845;
        Mon, 05 May 2025 14:39:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:39 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:39:29 -0700
Subject: [PATCH 4/5] RISC-V: KVM: Enable envcfg and sstateen bits lazily
MIME-Version: 1.0
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_143940_918554_B5E144E5 
X-CRM114-Status: UNSURE (   8.41  )
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

SENVCFG and SSTATEEN CSRs are controlled by HSENVCFG(62) and
SSTATEEN0(63) bits in hstateen. Enable them lazily at runtime
instead of bootime.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_insn.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index c46907bfe42f..ed6302b1992b 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -256,9 +256,37 @@ int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_
 	return KVM_INSN_CONTINUE_SAME_SEPC;
 }
 
+static int kvm_riscv_vcpu_hstateen_enable_senvcfg(struct kvm_vcpu *vcpu,
+						  unsigned int csr_num,
+						  unsigned long *val,
+						  unsigned long new_val,
+						  unsigned long wr_mask)
+{
+	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_HSENVCFG);
+}
+
+static int kvm_riscv_vcpu_hstateen_enable_stateen(struct kvm_vcpu *vcpu,
+						  unsigned int csr_num,
+						  unsigned long *val,
+						  unsigned long new_val,
+						  unsigned long wr_mask)
+{
+	const unsigned long *isa = vcpu->arch.isa;
+
+	if (riscv_isa_extension_available(isa, SMSTATEEN))
+		return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_SSTATEEN0);
+	else
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+}
+
+#define KVM_RISCV_VCPU_STATEEN_CSR_FUNCS \
+{ .base = CSR_SENVCFG,    .count = 1, .func = kvm_riscv_vcpu_hstateen_enable_senvcfg }, \
+{ .base = CSR_SSTATEEN0,  .count = 1, .func = kvm_riscv_vcpu_hstateen_enable_stateen },\
+
 static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
+	KVM_RISCV_VCPU_STATEEN_CSR_FUNCS
 	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
 #ifdef CONFIG_32BIT
 	KVM_RISCV_VCPU_AIA_CSR_32BIT_FUNCS

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
