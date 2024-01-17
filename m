Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8E3C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 13:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DEU//Nlf9wmwIj8zB/VfVERVc68DgVIyCFBGkRG1a28=; b=KTRneSv0c2k6Uy
	NlKa09usJQc4IrhsZox7A3wh2tzy/DjH9+liNdVLJryapa/UkfXMkJfw+t/JNN1fWD8zqMe3Zk6Hu
	yyScmirIbZAB0N1nQuR9Z2FfIaE5Xzgu1govmmr0rAHZ3YMFJRuCXa+E1UrkbVp1SufTAQiOj8pKA
	NDBwboMbfdQicVuGL1lgHD1QUPsXWdpq2T+48J5AJa/oydMC5JBZF/OCqArRyCxNEvXWt0QC4BEqg
	/hqKH/Qy5n9H7NL8GmDx/Mcb6/tx1sV0ZH9jqxK5lillowlNFsrQKpRrX5e5XEAoIlpvFihjcRy5x
	uev45tfytkptx7C2C0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ5fo-00GJUy-1z;
	Wed, 17 Jan 2024 13:09:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ5fl-00GJRU-2z
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 13:09:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-337b38d6568so1822422f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 05:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705496975; x=1706101775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQBRlgg8YRqh0hYBtnAQg4eOs0cvwqHh0f5pcsorVfE=;
        b=BCPzGAno/UOookW8x2pcNT1uqQ1BwNF30Lo38nWg+YxDaeSgwuxsOhn2gQ0KGQ6dFC
         dTRKaHRHZvnoHqHsiVn7OlKL/Q1Nip/HqvQKbjrvRXqsPYzCagcSMpDnckrHXjZEZxNl
         DbTmpC8AhI6nCIv2J2IDEoUT5Ix62hN+TKz72xSuxiXeTJA+mnJVgxosK6kJ3GYvclcN
         JnYXfcbquiemaRpq8TTRZLwmWMhx1xOLHxqCts5i8AAAx9jvHyCW+0Sbo8MSpknDHKdi
         49uasLreWLuHwXgDcZwsFF3DnsgRrtjKlPDavnR91/mifegTUFeo4Q+8iG+xYtGLYw/g
         Kw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705496975; x=1706101775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQBRlgg8YRqh0hYBtnAQg4eOs0cvwqHh0f5pcsorVfE=;
        b=agUGkm4d4/vOxLcwI2PXFa8L58SBlr5VKuXW1TaWEkmT8zbt4C4TxZybV1tkv1KG0M
         O87iB6MJLfWQcSMaKoheFPuGC+MMBOgKq3oLf4KjOc+obAn7RtwuB7AKB23t0ik2zh0Y
         MgQa5jueLR1JbzBpp36m/q2zDNrW4KVBaRJzvdVWR+oBGGScEJEREUr3iPmsfTvYBncU
         4gx/bH+kg8ntKBrlp0yXNh9TSEA4nvewc0OhQ2L1WV7VCpuzMIpSkLmU7xTRvlmPpMhz
         UirvtZoNlTKLjE94f7pKwfljpxZli4x8I7WhDTm7tr+Fym4d/v+xlIER+ci6DIuU+Vf8
         Pv6A==
X-Gm-Message-State: AOJu0Yzl82wOj2dVUIxkR1Y5go4OpiNfswiPZuTBuWq/kN7BhTDMiiUG
	iwyQdaSOGR7B5GfPCLu6hxsnvARtBxbtTAIXpC+dv4i51qA=
X-Google-Smtp-Source: AGHT+IFZK/Y2EcpfFp4ZxqceLVhvht5oEs9T1bBBogi9jpwj6NYaxxW/zswmOYBcVS+Dwgg8X+kgig==
X-Received: by 2002:a05:600c:3151:b0:40e:8d2a:db4c with SMTP id h17-20020a05600c315100b0040e8d2adb4cmr197380wmo.38.1705496974840;
        Wed, 17 Jan 2024 05:09:34 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id j28-20020a05600c1c1c00b0040e52f0e207sm4771200wms.0.2024.01.17.05.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 05:09:34 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com
Subject: [PATCH] RISC-V: selftests: cbo: Ensure asm operands match constraints
Date: Wed, 17 Jan 2024 14:09:34 +0100
Message-ID: <20240117130933.57514-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_050937_973255_28587FC7 
X-CRM114-Status: UNSURE (   7.58  )
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

The 'i' constraint expects a constant operand, which fn and its
constant derivative MK_CBO(fn) are, but passing fn through a function
as a parameter and using a local variable for MK_CBO(fn) allow the
compiler to lose sight of that when no optimization is done. Use
a macro instead of a function and skip the local variable to ensure
the compiler uses constants, matching the asm constraints.

Reported-by: Yunhui Cui <cuiyunhui@bytedance.com>
Closes: https://lore.kernel.org/all/20240117082514.42967-1-cuiyunhui@bytedance.com
Fixes: a29e2a48afe3 ("RISC-V: selftests: Add CBO tests")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index c6a83ab11e22..c537d52fafc5 100644
--- a/tools/testing/selftests/riscv/hwprobe/cbo.c
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -36,16 +36,14 @@ static void sigill_handler(int sig, siginfo_t *info, void *context)
 	regs[0] += 4;
 }
 
-static void cbo_insn(char *base, int fn)
-{
-	uint32_t insn = MK_CBO(fn);
-
-	asm volatile(
-	"mv	a0, %0\n"
-	"li	a1, %1\n"
-	".4byte	%2\n"
-	: : "r" (base), "i" (fn), "i" (insn) : "a0", "a1", "memory");
-}
+#define cbo_insn(base, fn)							\
+({										\
+	asm volatile(								\
+	"mv	a0, %0\n"							\
+	"li	a1, %1\n"							\
+	".4byte	%2\n"								\
+	: : "r" (base), "i" (fn), "i" (MK_CBO(fn)) : "a0", "a1", "memory");	\
+})
 
 static void cbo_inval(char *base) { cbo_insn(base, 0); }
 static void cbo_clean(char *base) { cbo_insn(base, 1); }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
