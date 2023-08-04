Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18CDEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 02:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPYoUXWXGZd9rExP+pfdENrjKlcGgrTMC3DUVfEhgHg=; b=h94vXe7poXYwaA
	+mlq5VjH786i4QVvDg3Dk+hQloS3QB+2PForKveB4s1JLk7DksuLJt98jkOj3U6EXBKo1SpLKLlkc
	cd1kUXcnBNNt7elQEDE8567rkWaiJuCaiQYrVWzipuBOFZi3hJ0Se7P9IEJz9atZ9GvAXXoBGJtGN
	vyx03u3gvss2/elauKj2sly+qb1R7gNgVcO+2ehVAnh5qeBZT9qKPS1dap5kg8WJ5H9pqElMOsy9Q
	qp3AYT46AF/hq5JeQ/NjO5tRtMBulmzxQuseQ0NPMSa5VYZtxttvHQ+gmqYoXg4OUC1pGXEneGp+N
	7QppvSpzuwQYDpc43BXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkHO-00BKyy-3A;
	Fri, 04 Aug 2023 02:11:02 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkHL-00BKum-2d
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 02:11:01 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-76ad8892d49so132768785a.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 19:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691115056; x=1691719856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3U++cEq45L7iITV+zLwLaldo0Na07T+o+hHDfRRKC4=;
        b=ayC0Day7CXdP53wwIDs0tv4bKX6RYBEbt+WDQyLb8tpMqzB8hUHeS+pZ/fmXrx4qpA
         3JkEy7VvFQFPwmFiZrOcgMEo3fzpW+ldBC+JO6eugwsbDr7vJSjP1/35CxXsN0MB0Irt
         mkx9hB89+CUahHSi5pi8nO9KgVUWFgp8tr4jlCEdJmhvewPu4OWQqZ3baJYZwvTPdBfy
         +HdxqmvQtuuS7UKmZq8wZJhY55hKFLVGi3/KRn4eaZy7GtYIOEbVuJ5qIJOIr+oSnw4f
         I7cK7giGeGjDDUCgXif5SspsldvYp/giTIrzSG6SdHe7tpD9OaruV+cA9piG0QSIk91/
         G56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691115056; x=1691719856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3U++cEq45L7iITV+zLwLaldo0Na07T+o+hHDfRRKC4=;
        b=Z7m6NxJPFtnAfq8/cQ/QUCISmtrth1QFz1h3QepOvUTnWAYcp+VmZjr1Squ4RhO3Dq
         B7dfOBUCTwOqzDtM2WMgi9pCVl9Ph+6V5aAYILWY+w49+MwppI1Y4M7lmeH6/L7MQcBU
         xE9HWwQdIg8QOKvRj0mVA2h8Xq8Xw5h5nZzSsBk4erW83uoHmdNoVVhPeaY1Srx6cEIb
         AoPoCuR0lUUUwTRNDhoBpZTAsRFxZW6vysqv5gUf8aLTx6TqoFMCZbXoVvRP/K2YxJ96
         5XGJR/aMQ/qu5VDJw4S6E8DN63aJWCzuGJdnvvS+VCk08NyypwZg9++IwBSG3J4eP/HI
         PjwQ==
X-Gm-Message-State: AOJu0Yxong8j7shG+onEEjDATZ1kg8Ab2J4/E16B819eLJUBAhGWPAMf
	pM1lG8NYfnqYP6sxJFjr9DnwFw==
X-Google-Smtp-Source: AGHT+IG+6EaYMDmn7R52Jc4ascni7z5WQFwfR/PJzZqWfgRRzwdONmN63Q30hGcwUi7GhkBgKxKI9A==
X-Received: by 2002:a05:620a:1918:b0:76c:a187:13be with SMTP id bj24-20020a05620a191800b0076ca18713bemr687807qkb.33.1691115056542;
        Thu, 03 Aug 2023 19:10:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g6-20020a655806000000b0055c558ac4edsm369499pgr.46.2023.08.03.19.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 19:10:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 03 Aug 2023 19:10:28 -0700
Subject: [PATCH 03/10] RISC-V: Refactor jump label instructions
MIME-Version: 1.0
Message-Id: <20230803-master-refactor-instructions-v4-v1-3-2128e61fa4ff@rivosinc.com>
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
X-CRM114-CacheID: sfid-20230803_191059_874265_17A83701 
X-CRM114-Status: GOOD (  10.82  )
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
 arch/riscv/include/asm/insn.h  |  2 +-
 arch/riscv/kernel/jump_label.c | 13 ++++---------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 04f7649e1add..124ab02973a7 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -1984,7 +1984,7 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 		<< RVC_J_IMM_10_OFF) | \
 	(RVC_IMM_SIGN(x_) << RVC_J_IMM_SIGN_OFF); })
 
-#define RVC_EXTRACT_BTYPE_IMM(x) \
+#define RVC_EXTRACT_BZ_IMM(x) \
 	({typeof(x) x_ = (x); \
 	(RVC_X(x_, RVC_BZ_IMM_2_1_OPOFF, RVC_BZ_IMM_2_1_MASK) \
 		<< RVC_BZ_IMM_2_1_OFF) | \
diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index e6694759dbd0..fdaac2a13eac 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -9,11 +9,9 @@
 #include <linux/memory.h>
 #include <linux/mutex.h>
 #include <asm/bug.h>
+#include <asm/insn.h>
 #include <asm/patch.h>
 
-#define RISCV_INSN_NOP 0x00000013U
-#define RISCV_INSN_JAL 0x0000006fU
-
 void arch_jump_label_transform(struct jump_entry *entry,
 			       enum jump_label_type type)
 {
@@ -26,13 +24,10 @@ void arch_jump_label_transform(struct jump_entry *entry,
 		if (WARN_ON(offset & 1 || offset < -524288 || offset >= 524288))
 			return;
 
-		insn = RISCV_INSN_JAL |
-			(((u32)offset & GENMASK(19, 12)) << (12 - 12)) |
-			(((u32)offset & GENMASK(11, 11)) << (20 - 11)) |
-			(((u32)offset & GENMASK(10,  1)) << (21 -  1)) |
-			(((u32)offset & GENMASK(20, 20)) << (31 - 20));
+		insn = RVG_OPCODE_JAL;
+		riscv_insn_insert_jtype_imm(&insn, (s32)offset);
 	} else {
-		insn = RISCV_INSN_NOP;
+		insn = RVG_OPCODE_NOP;
 	}
 
 	mutex_lock(&text_mutex);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
