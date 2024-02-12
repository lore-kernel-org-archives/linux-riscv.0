Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7BEC4829A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 02:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm26erfU9Mdxq5Ids/oRopsS4nnwE5Ealpfg/CgXbDY=; b=Vm6rb1uEjasIEX
	T+PfUoUOW5cisnw8F5xacy1cP0FuwlIE6egmE/Br5IUCGRnTrk+WSJcfJVGOc9k0OtQ4OLe6BIFkn
	Hahpb1Nq5hFV+VD55l1ruDrx6AdtQpRv2nC+SuUB/9tiYL1lRGjrW06ZM8TEKOWode/ZutUmO8ZUW
	g0JD/4VtIwOqN+w5slwh4Eqq+E+7xlxO/Uxhi1Ith9VGjcXeawZgMiJqfeBx9nSC3Yb17CPoQQow6
	kG/l3G7ChJYMzmveV+Vzkslp9XgzjtVfBnwz//hP6SZoY4xgThRwI1T4Q8+qVLGwa5XopQDS8JLxn
	jI/7tpH+/4Nu64rX305w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTn-00000004DA5-3qlT;
	Mon, 12 Feb 2024 02:55:35 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTl-00000004D8A-0KGj
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 02:55:34 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-785d5e6c87cso46968885a.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 18:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707706532; x=1708311332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3jsL0pNyfGhwaczyVRVtmiz/UJ7sxnmY3C1nRyOzZg=;
        b=fdP/9SF/Pkg75Xv2Xp7wb/tFYfmBdFbn6oE8797g/gxY9E6OhSWSzZtsLVc7Hd1rw1
         lpnHIXpl+k98HYEDXii6ctPqYwpPWjPHZe6jS9/dhbuTGNLRDYt2vInP5Upu9Y/JXLmI
         CqLAtmjH0Hu7HgLk7iTErvgmV4OKEFDcITbD6LdB/HlSsA7PthD68MD3RKCPsrqO8a94
         UK0YTsp/byVbY8T4cmG86qgyIMG9HDCJXbseOSlWStibK4aRfbYkLWcHvDvmOfCrlG9F
         WjFLffEq+nmArq9N+JNOSgATvHFEUcS2poJaSoq7/QKfzgTbduARHdlHbUf+I0N8DyaD
         VAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707706532; x=1708311332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3jsL0pNyfGhwaczyVRVtmiz/UJ7sxnmY3C1nRyOzZg=;
        b=jhsmfbWaXHAEZv9r4DGNel1OOtC0LmCWkFkunfJTtRKyaZznu6rF+pkW/JKqHn5VVy
         eLCn8rxiZsAJHa7qPzJwgV6XvZxMVZD35fFwlrzkfesiywCWAtxiGOqcYb8J2IXdqbgQ
         UZsLPvuhFC8ThTMNE7K5EHNyXzAy0DChTjZKqVIU84hx73Yb2p0zwZCbcempaonyaeFJ
         xSCyALIDOKrE46FfU/V/2gmf1ffav60g5+3Wbx6lQXIHYOKPBRgCoqz6+J894ms+vM9E
         selJenJAt9K1IIPpZ2IXrBSdgZfKhLvQN5qKN66uFD3AFVq/yMyBdxM8sQmI2lim166W
         uNPA==
X-Gm-Message-State: AOJu0Yz5VhkV6kCcUBLHI0B4m0O1Prz9Y5S/0Y6mIv/ryUF5JoHuEvps
	fQ8HB7uGJkJ5KhdIKr73lY2j0XW6bvW7zGlH/BG7yBRGUXCFe2ADsf6Y5BPE+ig=
X-Google-Smtp-Source: AGHT+IFJ/32sYPLw6KUWw7AmSfnLopVclPa2F2gsTA8+qbyJLtPgqsEkwvhed221ymOVdWewDwFSuA==
X-Received: by 2002:ae9:e905:0:b0:785:cb7c:8554 with SMTP id x5-20020ae9e905000000b00785cb7c8554mr5700867qkf.14.1707706531837;
        Sun, 11 Feb 2024 18:55:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWy6qXPXNq8zE7X4aCqdUsGkzZSwcuXpP36Aqhia9FpyMYlSA46fzz3fov1YRllNfE3l79P88bKmGeSWd+kTI+Bsjos0Hy63ENvtL9y4gwO8qWroxFx2r63uA7nX8YAmOUoULqR8j1rZ9/GKNNLLoqSM22Fxp4u5cvUscnfQytng3hHRougX121AExZPirXPuRcnFvb3QyZVPOBI1Wlvt4AwcFcltkbtfd46crhuW1wpeiDCtayROslVQJRF68X9aZUTc6/tizcK4QUVA==
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id lb3-20020a170902fa4300b001d9af77893esm4906443plb.58.2024.02.11.18.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 18:55:31 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 1/7] riscv: jump_label: Batch icache maintenance
Date: Sun, 11 Feb 2024 18:55:12 -0800
Message-ID: <20240212025529.1971876-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212025529.1971876-1-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_185533_136880_5148CB61 
X-CRM114-Status: GOOD (  11.69  )
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

Switch to the batched version of the jump label update functions so
instruction cache maintenance is deferred until the end of the update.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/jump_label.h |  2 ++
 arch/riscv/include/asm/patch.h      |  1 +
 arch/riscv/kernel/jump_label.c      | 16 ++++++++++++----
 arch/riscv/kernel/patch.c           |  2 +-
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 4a35d787c019..6290b26f4a14 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -12,6 +12,8 @@
 #include <linux/types.h>
 #include <asm/asm.h>
 
+#define HAVE_JUMP_LABEL_BATCH
+
 #define JUMP_LABEL_NOP_SIZE 4
 
 static __always_inline bool arch_static_branch(struct static_key * const key,
diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
index e88b52d39eac..9f5d6e14c405 100644
--- a/arch/riscv/include/asm/patch.h
+++ b/arch/riscv/include/asm/patch.h
@@ -6,6 +6,7 @@
 #ifndef _ASM_RISCV_PATCH_H
 #define _ASM_RISCV_PATCH_H
 
+int patch_insn_write(void *addr, const void *insn, size_t len);
 int patch_text_nosync(void *addr, const void *insns, size_t len);
 int patch_text_set_nosync(void *addr, u8 c, size_t len);
 int patch_text(void *addr, u32 *insns, int ninsns);
diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index e6694759dbd0..11ad789c60c6 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -9,13 +9,14 @@
 #include <linux/memory.h>
 #include <linux/mutex.h>
 #include <asm/bug.h>
+#include <asm/cacheflush.h>
 #include <asm/patch.h>
 
 #define RISCV_INSN_NOP 0x00000013U
 #define RISCV_INSN_JAL 0x0000006fU
 
-void arch_jump_label_transform(struct jump_entry *entry,
-			       enum jump_label_type type)
+bool arch_jump_label_transform_queue(struct jump_entry *entry,
+				     enum jump_label_type type)
 {
 	void *addr = (void *)jump_entry_code(entry);
 	u32 insn;
@@ -24,7 +25,7 @@ void arch_jump_label_transform(struct jump_entry *entry,
 		long offset = jump_entry_target(entry) - jump_entry_code(entry);
 
 		if (WARN_ON(offset & 1 || offset < -524288 || offset >= 524288))
-			return;
+			return true;
 
 		insn = RISCV_INSN_JAL |
 			(((u32)offset & GENMASK(19, 12)) << (12 - 12)) |
@@ -36,6 +37,13 @@ void arch_jump_label_transform(struct jump_entry *entry,
 	}
 
 	mutex_lock(&text_mutex);
-	patch_text_nosync(addr, &insn, sizeof(insn));
+	patch_insn_write(addr, &insn, sizeof(insn));
 	mutex_unlock(&text_mutex);
+
+	return true;
+}
+
+void arch_jump_label_transform_apply(void)
+{
+	flush_icache_all();
 }
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 37e87fdcf6a0..bccd9ed04a05 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -188,7 +188,7 @@ int patch_text_set_nosync(void *addr, u8 c, size_t len)
 }
 NOKPROBE_SYMBOL(patch_text_set_nosync);
 
-static int patch_insn_write(void *addr, const void *insn, size_t len)
+int patch_insn_write(void *addr, const void *insn, size_t len)
 {
 	size_t patched = 0;
 	size_t size;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
