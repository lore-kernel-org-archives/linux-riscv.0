Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6E5EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 02:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJrc+TzGzUKlEMmmf3xWBQOb+r/3yoG58eKGy8f8ZgY=; b=HzUA4r6ZQq+JZD
	kjjzizjie7ohyGZct245UfQSAW6LJx7/Uxud8RUf7sUJUilx265yuQQNHTS+ngl6b18aBXhNkRz8q
	kPkTk12n3wSIudH8S/aBW1SviRX6xMHcx+WmVe8wtf64/eUx99VIUP/aTSwmiHbDkWqDTDBCW7Njm
	3qeZtpjyW1qIQdOgjwiDFY8DMqiuyiHoeKuZ6iGOXXtIlZChAGPeiMWFD4YMT3zPP9NbxcOmgN7Cb
	aPx8e7Jhu7Uts0Hjxe4lcCepSvMnTBgGJTSY6KS+oN9x/0+sRPXBVL3nwX4bRP1DGoVtjhg3KIKoY
	VzBUlYxFuB7FzXg/zAkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkHR-00BL1Q-0v;
	Fri, 04 Aug 2023 02:11:05 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkHM-00BKw4-2M
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 02:11:03 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bc3bec2c95so11704525ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 19:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691115058; x=1691719858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6HgGLGtG7M3LESpN5nTWoHfsSRrv8ioEMKugiOnOTw=;
        b=tu7avlotyozMV/l8NRFA0DJ9nnNC6Iq43LymSGWeqaIFo+4SOLemWteCRxuxVqX1vN
         v5bb3l0plvTmmo2yGXB6uIC1F/QI4lTwiO69NqjpKxuMRfL+xYAnS4u+tegfJm0NuEKP
         0kChJuxf5ozsMipWf8xNnVMnHYeK7CIXvxUiE3DuPC17GkDDWyzdDHCq7v8KNNMZN3aR
         E+nUQYwRE0MLaL/LwTWHQGSQHIoxQ1RLPR4iRDtmnbokti7RepO5Ri/GxUt3bdFA6/dP
         pyxnjsEJpHF1MQS3xf8YsV6SjjvC5Eyd4tgBsMQxdwZBNR6xOFws8g38Zn3skjbBCBfO
         Im3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691115059; x=1691719859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6HgGLGtG7M3LESpN5nTWoHfsSRrv8ioEMKugiOnOTw=;
        b=aNM0fypLHrpI2ieLndU1FQOtOJ1U4BGqcds+wwpPwOJfxbikkn5RRkfa0UbkypY12/
         DBOFTfZhwHVSnC+22sInDqMLkLKILZucY2GZ9JRpVx4GQjAQ4P5Iqi2kZam/endGubOU
         pPJ7FDcuRvnfkZ4Y7Hga4L7dfHkedNkkTahaovNLoqhNcis5SJWdhBBRfgzkItfGHDhZ
         pqMdv7ueNHqBTqMhwLsKF5jpCa6tMiRogdrf8Y/kqLOrXoZj25jUYcw47tmVxvWEH+D9
         c52/ZRF0nSayqNfF5bRePIfNmHqa+kvG14OzC8niwlXcwn9RYs8Qkc5ZAvRMjELBcu4w
         1XqQ==
X-Gm-Message-State: AOJu0Yxkm0nfzStt892Bm1HdFig2oWQcWRteJfHpPKBDpfKu+HiqTL94
	BK2Ay7CiKpbR8j8kovcgNhgqEw==
X-Google-Smtp-Source: AGHT+IEN0Jt5wwNuskL0qGGhhGkOeUg3t8WkQm4o7XfOAfqqqzUJqOVX9dt6wxX88cfzTtEYQSuJcg==
X-Received: by 2002:a17:902:ab48:b0:1bc:e37:aa76 with SMTP id ij8-20020a170902ab4800b001bc0e37aa76mr516147plb.6.1691115058660;
        Thu, 03 Aug 2023 19:10:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g6-20020a655806000000b0055c558ac4edsm369499pgr.46.2023.08.03.19.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 19:10:58 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 03 Aug 2023 19:10:29 -0700
Subject: [PATCH 04/10] RISC-V: KGDB: Refactor instructions
MIME-Version: 1.0
Message-Id: <20230803-master-refactor-instructions-v4-v1-4-2128e61fa4ff@rivosinc.com>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, bpf@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Ard Biesheuvel <ardb@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, 
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Nam Cao <namcaov@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_191100_771354_1474BF71 
X-CRM114-Status: GOOD (  12.55  )
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

Use shared instruction definitions in insn.h.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/kgdb.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 2393342ab362..e1305706120e 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -5,7 +5,6 @@
 
 #include <linux/ptrace.h>
 #include <linux/kdebug.h>
-#include <linux/bug.h>
 #include <linux/kgdb.h>
 #include <linux/irqflags.h>
 #include <linux/string.h>
@@ -25,12 +24,12 @@ static unsigned int stepped_opcode;
 
 static int decode_register_index(unsigned long opcode, int offset)
 {
-	return (opcode >> offset) & 0x1F;
+	return (opcode >> offset) & RV_STANDARD_REG_MASK;
 }
 
 static int decode_register_index_short(unsigned long opcode, int offset)
 {
-	return ((opcode >> offset) & 0x7) + 8;
+	return ((opcode >> offset) & RV_COMPRESSED_REG_MASK) + 8;
 }
 
 /* Calculate the new address for after a step */
@@ -43,7 +42,7 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 
 	if (get_kernel_nofault(op_code, (void *)pc))
 		return -EINVAL;
-	if ((op_code & __INSN_LENGTH_MASK) != INSN_C_MASK) {
+	if (INSN_IS_C(op_code)) {
 		if (riscv_insn_is_c_jalr(op_code) ||
 		    riscv_insn_is_c_jr(op_code)) {
 			rs1_num = decode_register_index(op_code, RVC_C2_RS1_OPOFF);
@@ -55,14 +54,14 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 			rs1_num = decode_register_index_short(op_code,
 							      RVC_C1_RS1_OPOFF);
 			if (!rs1_num || regs_ptr[rs1_num] == 0)
-				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
+				*next_addr = RVC_EXTRACT_BZ_IMM(op_code) + pc;
 			else
 				*next_addr = pc + 2;
 		} else if (riscv_insn_is_c_bnez(op_code)) {
 			rs1_num =
 			    decode_register_index_short(op_code, RVC_C1_RS1_OPOFF);
 			if (rs1_num && regs_ptr[rs1_num] != 0)
-				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
+				*next_addr = RVC_EXTRACT_BZ_IMM(op_code) + pc;
 			else
 				*next_addr = pc + 2;
 		} else {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
