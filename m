Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B20CD3435
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLQ7klzQZuJrdkMjcKHo0nZPZZlyHdyxCEatDYFqNQk=; b=Z2wSiUd4MJGoyD
	XvFMnPTaQ/p/vTdU1/Nqz6+nAQHZnTtW8RP+TEWAf1GrIEpzAwoA/WmZdl7yKz1tcKzE1XYINmd1j
	P7bdDjQaZhMCtWjsU5Kba2GdDpaMIFLk3V1B2JFllbzkvaXZNNMZDbYwKfXvPYGVt5wVF2owjK9cU
	Lc9CEHB1oGWxI6JjsUtFN+O5pw7XtfqJf+Eofem3CS82AYMeZ9JgaR3gvegc5cJ1R1lA4FC8hplvV
	sFutgoB74/Ldg7dQYxRNvow2nwE2pKiswYFAxABKiBSVmCTEcBr7f9dPOdtYET+sTrx7q1m5RoF55
	nt3J7qEWXi3UCx8/Mtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRob-00GqpN-1W;
	Tue, 19 Sep 2023 03:54:21 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoX-00Gqlp-0x
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:54:18 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-564b6276941so4350856a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 20:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695095654; x=1695700454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4XXbW7JTA+rX6h2wllSUbALMsH935/QgdVn7NuGhB8=;
        b=LZAqJZRMiPNcP+VFU4oxC5S0N+642QTFfwHM/QOfJOjn2hGXKkSqvF6B6DYobYyAyO
         qf+B1YTaNIAz9yuZNALBCfir9g3yvJ369gvTeFRXw43hyMcOlr3cgSzrSXrY/Tx0g5e7
         qPgqmKW6az3TnSascnFRwWmxyBi6y0lC9Txbv5ysA3zI+Pa2UiG1mZY1QGS2d1dCbT8f
         UkNAKYrZHN8TlpEorVBp1AuFYcxOvrqHEq6oRlP0DQmP1joSmH59r6+7ifauhIrRAKI/
         nF5LBZ/PuDk+nlsQ9ftgHkHDLsq4XHIjgE5qhMIGL0B88tDjSULBcTqsmFSPgJy0dFoF
         pP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695095654; x=1695700454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4XXbW7JTA+rX6h2wllSUbALMsH935/QgdVn7NuGhB8=;
        b=Gz2JDXzm3ZMK1yDcG7Zqejw00UUw+LISlID9TDDzokKQ6Lz8Hx1zGu0psfMovhvPfM
         /AWvbwSa/mGtnhb4+SVdVCWi4O0KzP30V8ENKUwjnv/6NwuPDtxtS2rCO66JLG92Pryl
         KZIo2aIBnWSWtPsrsTvYr4ootVG/+R0tnmnwYQK/yNxC2bN+XGttqROOQTNLOg6vfCXV
         tG8ZQka+ORYm422XIBw/HlTvlWUBo7o6U4RVLmNz8lalT6y/7/wO77nNpi6ANdlKHqQn
         eg7EIPILpY96aYI1QorNVFD4LtKn2Ad9J4wHp5O3+bbL05Ko0+t95wUxwXX1NulI/MLz
         YbLw==
X-Gm-Message-State: AOJu0YzuN4FYeNCrAMi+nl/BiFEXxwpFFu9TZGgcVT+/Ep8Agi1xfoLB
	GpF0GYzbHkWXZCX1HaHbENRMEg==
X-Google-Smtp-Source: AGHT+IER7aDasNv4HryZXs+OqFjdWVOMVvC9oosimk80Dhx9t1V5Xr51sadYHq9bBP2SmlwGRGTGig==
X-Received: by 2002:a17:90a:c0f:b0:274:3a86:4c10 with SMTP id 15-20020a17090a0c0f00b002743a864c10mr9217500pjs.29.1695095654352;
        Mon, 18 Sep 2023 20:54:14 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a034300b00273fc850342sm4000802pjf.20.2023.09.18.20.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 20:54:14 -0700 (PDT)
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
Subject: [PATCH 3/7] RISC-V: KVM: Allow XVentanaCondOps extension for Guest/VM
Date: Tue, 19 Sep 2023 09:23:39 +0530
Message-Id: <20230919035343.1399389-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919035343.1399389-1-apatel@ventanamicro.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205417_336259_BE882415 
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

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable XVentanaCondOps extension for
Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b1baf6f096a3..e030c12c7dfc 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -138,6 +138,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIFENCEI,
 	KVM_RISCV_ISA_EXT_ZIHPM,
 	KVM_RISCV_ISA_EXT_SMSTATEEN,
+	KVM_RISCV_ISA_EXT_XVENTANACONDOPS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 388599fcf684..17a847a1114b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -40,6 +40,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
+	KVM_ISA_EXT_ARR(XVENTANACONDOPS),
 	KVM_ISA_EXT_ARR(ZBA),
 	KVM_ISA_EXT_ARR(ZBB),
 	KVM_ISA_EXT_ARR(ZBS),
@@ -89,6 +90,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
+	case KVM_RISCV_ISA_EXT_XVENTANACONDOPS:
 	case KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_RISCV_ISA_EXT_ZBS:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
