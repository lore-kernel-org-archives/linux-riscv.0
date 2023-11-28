Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75B9C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nw/XxysCwXM1mrGJjFbFmJlJK7I7M4jX/rRVQoTel0=; b=oo3jPb+s0uLBLz
	BTtkJHWbfFEU2qHqT3ZUYGPefC8EvoVOItChb135oj0oOBGPZ12q87npQJrfkuzmlyymn1jzfIrRQ
	HaiiY28WmMT6rfBLnGYtPc0dMGkOwM3c4bpiv1Sje0LWZX0ZOlrYvoJtRln2PGi/uIkH2CnBy+3Jx
	JDom4GKG8qJE/x1RXmrj87tp8hels/wMV22t135HC4Q+OMTiXMX8dlhswUMFNKnAeQBxqpzRDU7+G
	mMQ73rJFikflMknHe32j6R86IBacx90z6Hctcroa2rFPBDkXDBr+nvdic1z+5VDF4Nrc5e8zU0L13
	ad2uWn63gSEgwJ9Ao+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUj-005aGJ-2z;
	Tue, 28 Nov 2023 14:55:25 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUg-005aCP-2K
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:55:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cfb4d28c43so26361755ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183322; x=1701788122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+aK5RATSMuwz0R11fQ6d3osSrL0r31QZEh4gl5Kftw=;
        b=DeXqajBqRB1o6NAeP6jzLUlyho5U/JkISKAenMJRcVnIurE+ZBTMUgIEtEX0IyYv6O
         GqhuLl5pvP+YLasv2KDX8wMs1UHu1vn/bFNOfZ4zEg8CoqbHf/2x+Utr4h3Ukhlz9ees
         9hEP0GVlCaZSczcpCgrX0DKMU4582rD5CVLlXfTAGOYNhBtfDAMSxTH/96ROQq7m/i3W
         CAMYHlRbyb24TWzOHsx5uoUbpC+glzAldnUF/nceAZ8OKq82bNnTzFxLujImhELtbyTr
         1xGcdtbzepDw6Edob7vYNxPuCUlNsN4MyJp9WBSPFCy1J9EC7MR8jLr/fCuGpX8yvU87
         xPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183322; x=1701788122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+aK5RATSMuwz0R11fQ6d3osSrL0r31QZEh4gl5Kftw=;
        b=RegmhPvrMXrI0nx8SC3nNIpr+0QjtpWumCH47qa4Sl457f+1ryBFLVWGj2JsPJAIis
         GUslnjimLdY5+PM76b0nKhxTi2T57G8KwLqB4YL3Rtp8UGj3oBQxHrYHdgG+8y0Pdnl3
         seelACzDmV0S72jiLqrb6DEiowbOzyeVAfsn/zLFsihI8yJeyTPjw+QqgBsxkfFrXdKH
         nfezXXqqo379kEom1knst3GodqbDFL0FpZJR1pTzs5tf/68eUD7axe6PzjyL/ptfwpK0
         8k2NFgSWyGk5Ikk9TMv3AOm4D1uQaC+SGcT1AOgWQ9mn8ETLeC/bzA3NlcSIIZBlHMde
         2Yeg==
X-Gm-Message-State: AOJu0YzEpjQxhK3jy5t+Y1TcLuUy2DeFcu15xS7lCf2nN6VUUTdVnWjv
	G81Am0VcXA90vedDe3SCNDmS7Q==
X-Google-Smtp-Source: AGHT+IH2xWVOITfzziniBlNh6pTHruM1083PD+Pd2O1gzhC3MdYm+hsrORloedeBl+KCem0W7nVbUQ==
X-Received: by 2002:a17:902:c949:b0:1cf:bd6c:f7fd with SMTP id i9-20020a170902c94900b001cfbd6cf7fdmr11119342pla.49.1701183322059;
        Tue, 28 Nov 2023 06:55:22 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:55:21 -0800 (PST)
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
Subject: [PATCH 14/15] RISC-V: KVM: Allow Zfa extension for Guest/VM
Date: Tue, 28 Nov 2023 20:23:56 +0530
Message-Id: <20231128145357.413321-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065522_787361_197CA3EC 
X-CRM114-Status: UNSURE (   8.61  )
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
user space to detect and enable Zfa extension for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 32c7ff23ecce..909bd98220ee 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -165,6 +165,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIHINTNTL,
 	KVM_RISCV_ISA_EXT_ZVFH,
 	KVM_RISCV_ISA_EXT_ZVFHMIN,
+	KVM_RISCV_ISA_EXT_ZFA,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 6b2d81c8cfe7..ba18587ae8c7 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -47,6 +47,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZBKC),
 	KVM_ISA_EXT_ARR(ZBKX),
 	KVM_ISA_EXT_ARR(ZBS),
+	KVM_ISA_EXT_ARR(ZFA),
 	KVM_ISA_EXT_ARR(ZFH),
 	KVM_ISA_EXT_ARR(ZFHMIN),
 	KVM_ISA_EXT_ARR(ZICBOM),
@@ -123,6 +124,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZBKC:
 	case KVM_RISCV_ISA_EXT_ZBKX:
 	case KVM_RISCV_ISA_EXT_ZBS:
+	case KVM_RISCV_ISA_EXT_ZFA:
 	case KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_RISCV_ISA_EXT_ZFHMIN:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
