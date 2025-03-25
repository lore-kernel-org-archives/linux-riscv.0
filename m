Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0CCC3600B
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 00:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7LbkM6zAfuRIh9a63iZ5hd4Bq/TiFt08eWN7KPzN34=; b=rDZcqwWBObWhaH
	f+S/UIVy21FJNAY2yUn9NqK+AH1I68fyUYpgZymz4owgDALmzoqeTbehwrylNrc0i+jgiN6vo4Lvv
	QE9oaUvssK5x8objqupf/t2QdRc4cf4gPoBGf4k/TLc6BRM71ECS2m/a2sk+n4UBHzkw/ZTrJ4c+S
	Pa2XmulZ4JLmmmthsw5vyiOEfjzZRnH4I3zSlhuuNfyRRoA2YgcIKWVlDn6ex+ezd6e7wAWOTDOGl
	M+0pSKl/N7jrH+4J8RVX9805M6VW1Bri2LMwhRVgD17pMbxit23OVVsSXTkTg90Bju2Akb6wxpjT/
	Isj/+TV5UQOGl83R9oSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twsLZ-00000004Y77-2L0d;
	Tue, 25 Mar 2025 00:40:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twsLV-00000004Y4I-3MdE
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 00:40:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-227914acd20so48713995ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 17:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742863245; x=1743468045; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNqfGek6IDvMlkuJpE58iTKo9lOFsf02qvhKRUoqiBo=;
        b=x0LbciOU00CEvbSPPzj+gBq6Q8fu6XUFFwTolG9AZ2xalVWSYqIOFrKZC/vd7JWW+v
         LmP1fs0sLZUY9WnW3Yc3AQfKh11T2z4X6BAuJlnCXKCRh818552ddm4HPOjowMaLOoI/
         lDTguVsw6Vj78P5O+rt8BZQ35QrudD5xBKoe06gOROCLke1iCGN8sF6IrlWkfUR8VfJ8
         5bEe5ljMi6oJ94M9NPgi2QzYuyT7bNGMkLY/z61SEpm8Tu1AN9i8PKGRJL0eabMhwn3k
         BKrjvE5U59VK9u2hPl2Pli5etEHeVXL1fRyMN2C8wNUEDKvxbupUiVwerHQUEShbd39i
         iq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742863245; x=1743468045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNqfGek6IDvMlkuJpE58iTKo9lOFsf02qvhKRUoqiBo=;
        b=Fjx2Y7klUK2+G+BAiXw5BVw++AuB/PYZXrWQyJ7UVRpv7+TUfkVCWecw91G1DEJb+B
         h6yBFJTPP0a/onAsi8PjePvx/fhvCm+apY7K+r+pYO3wyrxIhqa0FU3/IUMqF6BM2koY
         qKMngu9rr+dUVhrrHc95jZgsPPnbM3xNwVWI7d9qu6aau8b44BlZfcMG6/5iUqkaGx9x
         SXFAb/PSCq6mjz4/G+BXHl4wVC+hdysZUKM8zK5fHOjg0qJMOIDiAMhqrc30arygnndf
         8tDC24LT9eugv/tpXm3SQlbvtBEeNm0MjhKfjQZ+updHsiPXxtnBmCSB/hIUzoEUsHxC
         spiA==
X-Forwarded-Encrypted: i=1; AJvYcCXxDyspKHAvw1h1+aaQOEz67VPwaFNsebtqLRWAic3fxNvluHcBTpHHppqDCptiAZv07gY8udPIs39hrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMLpWIrKx+DyMtnX5+6lxDdeqCcBpZF03ys08u8cwx04NaDjVD
	y6LZI8OyNjo4h0nJ7B4JXFaNQ3gELobeRET78ujVZXwCvp3AwGW3UVVOnfW4z4o=
X-Gm-Gg: ASbGncujtHkVu+mdSA5IufO5MGONJ/1sDvrjioSd7Apr/re986f2roVfn1C01bbCEGC
	7yfTFsXIo9VOx3GBtJR6vQT4HFJ4tfILsl2v8Ht81vxRCU3v0MrA+vuuujvZUt60ZYlIcu2hupS
	Bxgr+9a/CC6hSX7Cr1wsNApbqxb5TRLUj7a77uCu5gKJiETb+G5yKkkR+UXbxvm01i4/c92SAzm
	SpuvM4be5wxfL4GWz5y6m22t6NOuUui6pCxAT0yR4Cb6sLt5+s53a9rtqFSe5ewKZwU/PA2d/+U
	t6IgCNUp1Fa9XFEp2/OM9XzQLMmjIcyD6nruMvGFIvkqjktOufJlmrQklg==
X-Google-Smtp-Source: AGHT+IEyY0aS2TVZ43j4wneKeZ/YRErGKGqWBRTFQa7kE7mGVqq6ifmaSYPLNtOafQQXufixCh8D6Q==
X-Received: by 2002:a05:6a00:638d:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-7377a08766dmr27319740b3a.2.1742863244847;
        Mon, 24 Mar 2025 17:40:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600a501sm8705513b3a.79.2025.03.24.17.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 17:40:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 24 Mar 2025 17:40:30 -0700
Subject: [PATCH 2/3] KVM: riscv: selftests: Decode stval to identify exact
 exception type
MIME-Version: 1.0
Message-Id: <20250324-kvm_selftest_improve-v1-2-583620219d4f@rivosinc.com>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
In-Reply-To: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_174045_845580_92A6D3EA 
X-CRM114-Status: UNSURE (   9.70  )
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

Currently, the sbi_pmu_test continues if the exception type is illegal
instruction because access to hpmcounter will generate that. However, we
may get illegal for other reasons as well which should result in test
assertion.

Use the stval to decode the exact type of instructions and which csrs are
being accessed if it is csr access instructions. Assert in all cases
except if it is a csr access instructions that access valid PMU related
registers.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 03406de4989d..11bde69b5238 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -128,11 +128,43 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
 		       "Unable to stop counter %ld error %ld\n", counter, ret.error);
 }
 
+#define INSN_OPCODE_MASK	0x007c
+#define INSN_OPCODE_SHIFT	2
+#define INSN_OPCODE_SYSTEM	28
+
+#define INSN_MASK_FUNCT3	0x7000
+#define INSN_SHIFT_FUNCT3	12
+
+#define INSN_CSR_MASK		0xfff00000
+#define INSN_CSR_SHIFT		20
+
+#define GET_RM(insn)            (((insn) & INSN_MASK_FUNCT3) >> INSN_SHIFT_FUNCT3)
+#define GET_CSR_NUM(insn)       (((insn) & INSN_CSR_MASK) >> INSN_CSR_SHIFT)
+
 static void guest_illegal_exception_handler(struct ex_regs *regs)
 {
+	unsigned long insn;
+	int opcode, csr_num, funct3;
+
 	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
 		       "Unexpected exception handler %lx\n", regs->cause);
 
+	insn = regs->stval;
+	opcode = (insn & INSN_OPCODE_MASK) >> INSN_OPCODE_SHIFT;
+	__GUEST_ASSERT(opcode == INSN_OPCODE_SYSTEM,
+		       "Unexpected instruction with opcode 0x%x insn 0x%lx\n", opcode, insn);
+
+	csr_num = GET_CSR_NUM(insn);
+	funct3 = GET_RM(insn);
+	/* Validate if it is a CSR read/write operation */
+	__GUEST_ASSERT(funct3 <= 7 && (funct3 != 0 || funct3 != 4),
+		       "Unexpected system opcode with funct3 0x%x csr_num 0x%x\n",
+		       funct3, csr_num);
+
+	/* Validate if it is a HPMCOUNTER CSR operation */
+	__GUEST_ASSERT(csr_num == CSR_CYCLE || csr_num <= CSR_HPMCOUNTER31,
+		       "Unexpected csr_num 0x%x\n", csr_num);
+
 	illegal_handler_invoked = true;
 	/* skip the trapping instruction */
 	regs->epc += 4;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
