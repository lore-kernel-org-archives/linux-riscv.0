Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09267C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEfnUF8MIQ7J1vwUg7nW9bOfbjAn/t8O4tBXjwFcs4E=; b=lgteY/Te7pXSrL
	QdHwiBdGtx2hSaexvW1PoXjbwjeZQjLeEvbA5DnbCUdRHLY04vaCT+BzAIl4A4N6MR7nOh8yjmYz0
	V+bWfuyntsjG9XRKR3GXs4TH+G+G4Xn4DbFXCJV7hCxSh+uQ+hnzC0oAxVf3l4pzQ6TzeAplJJaIh
	QLOZhom+R/7ZcwTA+PXqTZ15hZc2SXAsM7cRnSWSLEG9b4mzKPweSTg8aNzF1ndBdmAVnQ3eY7EsD
	u0qgiaBb3dn9PYZE3kfMe9CReh1ZOwTvgx9VejsUg75cVqGBkM4CwJ8ONkWU5N+HkV2L2plD5QrT7
	bf5kv9OOmKATHAG/KFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUa-005a6V-33;
	Tue, 28 Nov 2023 14:55:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUW-005Zzr-08
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:55:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cfafe3d46bso31750335ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183311; x=1701788111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=airu/v47wgDNqhAY8kBHQ9N6G4glvU45jZqVuvQoU4M=;
        b=THecnCuR0B0SkEuVfjCi1az1wNp6Brq8bZU50twWNJRIRtjnLM2t91Q/DGVAa2Yjfw
         Oth8Pfgvlag8MAM9KS46aevJda5GZxGGQfnCYQz3cQdDtel6MAZ4mxvFtNo9+9FKMcJU
         Fnu/AoIoZ5ZW3/fjWyyWLxbNoqpWrE3cd2a597czzpHk9X/TJEwybw7wdvP2PMFvjo8U
         /N8P8aeGz7MRe5flOehy0emD2ieLrVRPzDcmW/OojX8z0kDDSDihSOLMVtqaUXmlyyhr
         dzbylfu4nJogPkgDgXjtPLj3eI4pjgjjL7N5xHHZSoCH83k6MPo2p+Sxr0d0X2TqnSOj
         1ORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183311; x=1701788111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=airu/v47wgDNqhAY8kBHQ9N6G4glvU45jZqVuvQoU4M=;
        b=YmJlKXXmnkDaEzFLZKNz+ls1TUfvOHuGJpproI/ljLQaahM+ah2/M/y6TtAJr6p4nm
         IStmt1aLcGNhShRRmVt8DLVHnnLxJC7YFryA4JNdAGvCAvRpXe4BOtifLiry1PZfZmFQ
         A7L9vfBv5DZRaNYdPMA1o066w4RK0jbTkFry4nC4JwvieJDWHT5QaWbmdApL+qY22EbA
         7sKFuvGFoT5lnIV+vexatzhVklQxXiKOzX1L8CHxbf9K3aTmg0LXBPvtsk9vAAk4YbNJ
         c/lpipi2F7DqP8O0cJgTSZCKRMmTFnUIpFiPXu0Pii8lrVhlTZ5x0u/k0xR/WMUblDrl
         pjww==
X-Gm-Message-State: AOJu0YxMsK8cLjPnasV2ZfeLPDBCWe9S/SQfK50H1UNrCGl87g/4pNtp
	E4EM3+4Q/Ffqkc9zukgIt2jolg==
X-Google-Smtp-Source: AGHT+IH4ZKbRH0sAoue+ms9u+mc6iPKravgS7x++zKnn9LjeTNQidu/8LuA2QuuAYh4M2kbbBqG+gQ==
X-Received: by 2002:a17:902:e88f:b0:1cf:cf40:3cef with SMTP id w15-20020a170902e88f00b001cfcf403cefmr6689569plg.64.1701183311308;
        Tue, 28 Nov 2023 06:55:11 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:55:10 -0800 (PST)
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
Subject: [PATCH 12/15] RISC-V: KVM: Allow Zvfh[min] extensions for Guest/VM
Date: Tue, 28 Nov 2023 20:23:54 +0530
Message-Id: <20231128145357.413321-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065512_105200_3EBAF44B 
X-CRM114-Status: UNSURE (   8.77  )
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
user space to detect and enable Zvfh[min] extensions for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/vcpu_onereg.c      | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 0ed5b0f8a230..32c7ff23ecce 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -163,6 +163,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZFH,
 	KVM_RISCV_ISA_EXT_ZFHMIN,
 	KVM_RISCV_ISA_EXT_ZIHINTNTL,
+	KVM_RISCV_ISA_EXT_ZVFH,
+	KVM_RISCV_ISA_EXT_ZVFHMIN,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index ba0a44b6b757..6b2d81c8cfe7 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -67,6 +67,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZKT),
 	KVM_ISA_EXT_ARR(ZVBB),
 	KVM_ISA_EXT_ARR(ZVBC),
+	KVM_ISA_EXT_ARR(ZVFH),
+	KVM_ISA_EXT_ARR(ZVFHMIN),
 	KVM_ISA_EXT_ARR(ZVKB),
 	KVM_ISA_EXT_ARR(ZVKG),
 	KVM_ISA_EXT_ARR(ZVKNED),
@@ -139,6 +141,8 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZKT:
 	case KVM_RISCV_ISA_EXT_ZVBB:
 	case KVM_RISCV_ISA_EXT_ZVBC:
+	case KVM_RISCV_ISA_EXT_ZVFH:
+	case KVM_RISCV_ISA_EXT_ZVFHMIN:
 	case KVM_RISCV_ISA_EXT_ZVKB:
 	case KVM_RISCV_ISA_EXT_ZVKG:
 	case KVM_RISCV_ISA_EXT_ZVKNED:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
