Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B35CA0FFD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LlMk8SGVUae9OjmNnd26G6nM3CGMrBh5vuzWnfkfozM=; b=Fa2MBs7Q/H17J5
	9u8SJUzH179mvgDVyjEyvXX+IF2pfGFk60nyMhe+jvWVvtHpfopnXtQAk7Kk/MPRA1dgcvFO9kjJC
	e3gD55Bru3asEenCvjuHGjSon3OTh0CyM7ZI52uPO+3fuLP14PDOjZBvbJl2cJ4mcc9GoDJWMjXxt
	FVMaOdFd27F0g3Thf8tpNyMnUqYZ+mEdDFQzrOtokWXXS7APQ772iTmisEL86zDFnUUnyt9Yxamp5
	MdCjcUD/Tr5RtdoyxEN4TOAsvNbQllutDwlxwtuKnLjwr+yNpMwE+fp7GI8orlzivWrKgoFORyKnA
	CqP6JHlyZCutpAXbwIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Ao-00000006fqo-40nH;
	Fri, 29 Aug 2025 18:50:06 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0IF-000000064FR-2sYp
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:33 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-771f90a45easo1854334b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478491; x=1757083291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=;
        b=fDDoyj2xTwA37BTZgbu6P7mMiQIAy1EpSSpBUyIGhs0o0zDbJNGpA/PBV2AW+1Bq2r
         8mJu0eTsOOpjsoaM/tL2XshJTR3WoszuNJDWqoCAtgQa03/0JxoieBZdGEeEzx2II8pm
         JmiF36yG8EHtS7xUjPofv3dHh/ydC1Y0z8xOwQZQ8IvG4rHAEQjH9Ht/3Nzq5bbbAr/a
         EvSkNNesRZci3kLfQfpEW8bN3tpKjPFJD3Ul/YaBSCquPq2fJOw1b61DevQZPUCL5KL/
         iq1vUgIRNPZNbbRhUYLJcNH4rJNLbwj1GeDBfX4kRV7wn3HLwJubUS3gCDb/1NPidTLV
         ctRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478491; x=1757083291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=;
        b=uoFWIBFBwSY/UNuSyI9y29/ntaAzdZ5byN5SAcyO4BTGTx2bnlR79k7RS5K10GQaPG
         FFDS0SPVPGJcI9Cs0ctb0d/fCOVP1mXTMNZLZLtnengdqfsQ9St/7i0NKcsgcseCU5YY
         13gxHv1PXWxgRuooVjN7c6z7n5cCnWjvy//OuB6t1cIJuzwq7JkplgbegDNH2tdQx9l2
         F5pZT2UTyZYyZvPIFDA418sduTe2QeCDayvkmv9p6U+gjXtYAk1lFH0hmaYgXqiwOCCe
         vwIE6ADWKw+UxM3+nHbj19UUbUcdspJ+vAm2efO55+pLbRzwniFgnkvAr2KAkqMIZIzR
         Cv2Q==
X-Gm-Message-State: AOJu0YzkqUG5NPd2C+se9hpWaRoG6OwRxiaAqh36EUjPv7E6vTgDQ6tq
	twYVVNFKOFA+3ABaG01f5y55swv1/WEwCmTbcIVSOW/ZH14LXhrK5+gnJa+8/EMXN2w=
X-Gm-Gg: ASbGnctxHWrNafV/1z87D6q4/bke8mdOyWQYelj7BGZKH0r2fM4UiLlydATW6MFSHAF
	Y/m4xts+oTn1dw8EXunRsNY0vATsUvXrsYCxwVgIQphjqIfJRL9k0O42aYX2vDcWBUZY/cTxujx
	sOs0EmA7unn83V4EgT7kaXbvDVAq+1xvTCu0iLZ3bx9/VqJ4cuY3HD05dm1MxkVfnL2CvVbNFaG
	h9F+cgqKb5g+cSISN0Lp8kSVzFdfnKaN2MMpU9kybz3DF7dNXlIvfk+8r7ABl+AoMFFMKmEJlIy
	SbLe/8nx3o8BBKTMnO9Xr+z2KyBgXg6Znd1IWyOceszUSDGAuqFk9+VsVGgidrNFJCZDMXs1I5L
	FXl0GMFu+LiqjYaLbsX8NamO7zbotcB82fu5OnGnLO50KWg==
X-Google-Smtp-Source: AGHT+IFDBhv3MLTcxgH+II4bHiTtnlUQ3Qi3MwL3+YWiPJW3Bh7QRSHoNEvUKcz9tZC69e4QqkawWQ==
X-Received: by 2002:a05:6a00:9a5:b0:770:374c:6c55 with SMTP id d2e1a72fcca58-770374c6e1amr32573308b3a.31.1756478490940;
        Fri, 29 Aug 2025 07:41:30 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:23 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:10 -0700
Subject: [PATCH v5 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Message-Id: <20250829-pmu_event_info-v5-9-9dca26139a33@rivosinc.com>
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
In-Reply-To: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_074131_735354_29429CB9 
X-CRM114-Status: UNSURE (   9.69  )
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

Upgrade the SBI version to v3.0 so that corresponding features
can be enabled in the guest.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index d678fd7e5973..f9c350ab84d9 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 2
+#define KVM_SBI_VERSION_MAJOR 3
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
