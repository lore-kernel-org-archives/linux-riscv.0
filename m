Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDC2EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 02:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppl+bVC+7xyn9eH+3FmICCwASGEImyH5oIuHA8+JWN4=; b=4olkI69aRBg4F1
	xzoOR/2kSZH9UWIIlCFK8qefnLO904aNweivJen46vdL0K/ZMiJ31FCLYmrXVOh+Dv0W8vFyy/4by
	nr8OYISV+GPhy0yLjUFDSpc3729ZB1b9aXuZSSb4Ka5bWkeW1sMEcMnIXec/xofG70sDmwn3h/q+U
	UKcLMPNepULGfnzdShCFqvuspfLgbajXh/B8QDbqHTEmi2+sX0hr1eUK5ivciwD/GGyJ0Wb40VfTf
	3xgTLozwJsmRbpb6YHmXNFSxqMJt/C7UDjxMfP82eYYUyJO40sn4WvkboKDfb2Mk73IlzZ7Srn0LD
	y07s8xkJcCfuA/L/CEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkHf-00BLFP-19;
	Fri, 04 Aug 2023 02:11:19 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkHa-00BL8O-0y
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 02:11:17 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-686f090310dso1510922b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 19:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691115071; x=1691719871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ih06HArn9iAryRcOKi/nyaTeAf4B1pYQ5n3lzBGwExw=;
        b=ew4rB+H6wBVVmeh/ui4LIzo+yvnm98oRAW4V9bmZm0KpT/glMjqRgPghU5Pe7h4Esc
         ULiTigZbpum8dCcqLDUYCXDomBKmpj2JOHEklft07nNCBx1z82UYhCKCpuxj1PHAOzaE
         NMax1U3YW9v1aHa4//bwc1cTcDl4jdIR8DOmMX78OtylMdsneAv0M+DVuZ/oUvlzDjuy
         /Eo3HBz3BDHFXmGEXCMfBNAi9hv3UebxWREasDtlfQDxVygFxm5W9omrOT80TWEdv1+I
         6Q3E3HhXfnIfxGtKYjYgSXjJeDKzMUjL0JxLCdBqUgV5jfcWHjIg0Oq1bhb98rkkscuS
         E9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691115071; x=1691719871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ih06HArn9iAryRcOKi/nyaTeAf4B1pYQ5n3lzBGwExw=;
        b=F4KmF1QZnnFYcBkMD82BN6GxxsE0EsnUGCOfFha0kEVsarZUQoD//Fgq6Ne1VzTPYm
         08b40mtyqFXrxYlerJipi0sGPQHtDpntvmZjg96h0gSsOlPEhOhhZSpKQ1OXhDEAZVpt
         DjNlUiY6jjrgpyzA1wDRO/GmvynW+N5U/VHMOUeMgk6ktxl/YnE1KhqikrsrYcG3EHKZ
         13kKvXCfFp9nesnqVlH4hiyJwesWxnJVRi8DELHm55v9AMCmunMkAXGI++nJJFIz+LjO
         QHwRponCN/t8yiMZw+yg0tgxLhxqD6Ga2u9sxfMBuec9xZNgAM0GuvRf8MrRJVbsTK2h
         /8NA==
X-Gm-Message-State: AOJu0Yy7zowd2frp2moXkJsTg31cQROLZ9beXowpKh4+xJZuXUzlbxmB
	3YI7aJrJeHzrYgdCu+IVF8Xldw==
X-Google-Smtp-Source: AGHT+IHuwaCo50Vehua+AGfdkcRKSRRWmSFHlzqzBP1tYtF/TOsW9qAWFW9rXyDnlZAMKZPqtqPdwQ==
X-Received: by 2002:a05:6a00:189d:b0:687:2be1:e2f6 with SMTP id x29-20020a056a00189d00b006872be1e2f6mr555577pfh.16.1691115071421;
        Thu, 03 Aug 2023 19:11:11 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g6-20020a655806000000b0055c558ac4edsm369499pgr.46.2023.08.03.19.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 19:11:10 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 03 Aug 2023 19:10:35 -0700
Subject: [PATCH 10/10] RISC-V: Refactor bug and traps instructions
MIME-Version: 1.0
Message-Id: <20230803-master-refactor-instructions-v4-v1-10-2128e61fa4ff@rivosinc.com>
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
X-CRM114-CacheID: sfid-20230803_191114_356611_1919FD15 
X-CRM114-Status: GOOD (  10.77  )
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

Use shared instruction definitions in insn.h instead of manually
constructing them.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/bug.h | 18 +++++-------------
 arch/riscv/kernel/traps.c    |  9 +++++----
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..6d9002d93f85 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -11,21 +11,13 @@
 #include <linux/types.h>
 
 #include <asm/asm.h>
+#include <asm/insn.h>
 
-#define __INSN_LENGTH_MASK  _UL(0x3)
-#define __INSN_LENGTH_32    _UL(0x3)
-#define __COMPRESSED_INSN_MASK	_UL(0xffff)
+#define __IS_BUG_INSN_32(insn) riscv_insn_is_c_ebreak(insn)
+#define __IS_BUG_INSN_16(insn) riscv_insn_is_ebreak(insn)
 
-#define __BUG_INSN_32	_UL(0x00100073) /* ebreak */
-#define __BUG_INSN_16	_UL(0x9002) /* c.ebreak */
-
-#define GET_INSN_LENGTH(insn)						\
-({									\
-	unsigned long __len;						\
-	__len = ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) ?	\
-		4UL : 2UL;						\
-	__len;								\
-})
+#define __BUG_INSN_32	RVG_MATCH_EBREAK
+#define __BUG_INSN_16	RVC_MATCH_C_EBREAK
 
 typedef u32 bug_insn_t;
 
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f910dfccbf5d..970b118d36b5 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -22,6 +22,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/bug.h>
 #include <asm/csr.h>
+#include <asm/insn.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/syscall.h>
@@ -243,7 +244,7 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
 	if (get_kernel_nofault(insn, (bug_insn_t *)pc))
 		return 0;
 
-	return GET_INSN_LENGTH(insn);
+	return INSN_LEN(insn);
 }
 
 void handle_break(struct pt_regs *regs)
@@ -389,10 +390,10 @@ int is_valid_bugaddr(unsigned long pc)
 		return 0;
 	if (get_kernel_nofault(insn, (bug_insn_t *)pc))
 		return 0;
-	if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
-		return (insn == __BUG_INSN_32);
+	if (INSN_IS_C(insn))
+		return __IS_BUG_INSN_16(insn);
 	else
-		return ((insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16);
+		return __IS_BUG_INSN_32(insn);
 }
 #endif /* CONFIG_GENERIC_BUG */
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
