Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0367C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77ixWcYnoKzlsWSoKwTgv2x02bP8Bevoj0Gbbh3sbuY=; b=xTwH4K7GuL0LYB
	3yfu5b1dadNQG24/cxjkUnUPYiWOi1y2uX9jvados8k611fy5fW5p9con/9cdupPDF+GxJFe0Om3z
	ruXoIJv+5ZxaISRGBKMkanh95YWHjm9N2tkbNDke+tBK+ke4WtCBgCHOGxr7qcHtrMHYO+6jvYPR7
	KsSKYPC5o7HlWBTMBOp87fI9XTR75n7JUrWXjVDY22g+UvX9xPGc6yMMcFuyzt6JpxJlQwdh55ort
	1z6jQz5nWXE5Q9w5C/r80wy+z1LWEyHdzQsiTWN965YsfqDtFZvrZKu9Fc4xqZhMOSOsJWpIle2FS
	xv/4/4il8309mZ5PfXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUP-005Ztl-1w;
	Tue, 28 Nov 2023 14:55:05 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUL-005Zp8-0p
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:55:03 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cfd04a6e49so17426395ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183300; x=1701788100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5JCc1y7hChZCMhp/0UYXh4hGb5WFeFKUHk/se+Qy3o=;
        b=lVtFitK7B4CHMFZtiqphNlFWYJlWHTdwc2gF8fbBVZUaqU9cqqkTWNohZCY0GY6qUY
         +YEqdfsy42JRUjWlmvYxyTq0K3OlAg/SFFakI8X/6iOxJqaq7j+02zchs1kUcrWz0Cs+
         rxhvRladV7elVgI0u4vFWjzg5c4iJ7CmxYFkfO6MbiAs/buTHyO6+aSl0KEElPsoosKP
         724GSMl1jcg5We9aHuzDXVlYHtMHjy9Gwc0QX+m0QpyAny0HJF4evHNDPXJvOMhSXabm
         /nPOfjS2CqdnENE5OOFAZQTWJOHAjmLqegdCaJlkOCkcBq8iHtdmh8KEJwR5N9kfnRLI
         ZXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183300; x=1701788100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5JCc1y7hChZCMhp/0UYXh4hGb5WFeFKUHk/se+Qy3o=;
        b=m29fkPILH7dgWEISdMiWpgFLLaxwk0sTPBAKyCh2op9oyOnkkaI6qHzjnl1J4FECwW
         BPwdtVCR+Kh0KaN1rqN4j8BQtCOKdFdzJg8x/NR4A/5eKOOPFTgS0WCc4BT3GJtWZcXf
         CHlGb2bD3HnqlvUvhQIuKiPRX9NIG2lrH2TDyIe+uDNUbalDXX/CLcgxhfgBZtomye8/
         Hyq6EOut2774506ZlxBzWKd3lfMQcB7M/ZGQpBSLLK6cNUUpeHKAJavA7cm/hsFj0t+B
         bArkayv1M+O4TjtVicvQnMIeN7Fp3B+z7WBZr6A/af4TO0WxrtvrfNmZm7OarvIEF0wS
         KIKQ==
X-Gm-Message-State: AOJu0Yw0UzpWiItd5BJKCqYirp90obYkoOod1Tsz49Rmx8OLJajb4VHx
	2Nzxd3u3GfIqpivMnRa9+2juRg==
X-Google-Smtp-Source: AGHT+IFHvz2KJ2Ptp4VuMdWWkjIvpDtHxQBvBlRtVm0cv6eOX2vsedmq5SV8bJu7+77gjoAbna9mJQ==
X-Received: by 2002:a17:903:24c:b0:1cf:7e39:feb with SMTP id j12-20020a170903024c00b001cf7e390febmr26796386plh.23.1701183300534;
        Tue, 28 Nov 2023 06:55:00 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:55:00 -0800 (PST)
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
Subject: [PATCH 10/15] RISC-V: KVM: Allow Zihintntl extension for Guest/VM
Date: Tue, 28 Nov 2023 20:23:52 +0530
Message-Id: <20231128145357.413321-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065501_341938_DEB20FC0 
X-CRM114-Status: UNSURE (   8.60  )
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
user space to detect and enable Zihintntl extension for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index fa1a8e01b803..0ed5b0f8a230 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -162,6 +162,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZVKT,
 	KVM_RISCV_ISA_EXT_ZFH,
 	KVM_RISCV_ISA_EXT_ZFHMIN,
+	KVM_RISCV_ISA_EXT_ZIHINTNTL,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index ba418ac47e81..ba0a44b6b757 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -55,6 +55,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
 	KVM_ISA_EXT_ARR(ZIFENCEI),
+	KVM_ISA_EXT_ARR(ZIHINTNTL),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZIHPM),
 	KVM_ISA_EXT_ARR(ZKND),
@@ -126,6 +127,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_RISCV_ISA_EXT_ZIFENCEI:
+	case KVM_RISCV_ISA_EXT_ZIHINTNTL:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_RISCV_ISA_EXT_ZIHPM:
 	case KVM_RISCV_ISA_EXT_ZKND:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
