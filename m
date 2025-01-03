Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FB6E77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 04:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t5SPsnURoL289H0TehMrqzMZEQTIbX34I3Nf03XZcBQ=; b=LkHk0tEX33/fyH
	3NRqoWH0cF9F1z18WNksYLdX/ZcXxz/KFRw43DJQJC0kYLIIGGZAWLNB9PMRG9rP9984Q5hBTvLp8
	h0B2TxXQ303QfuF4Qqlvc0PwYsWIhfG/8yOIN1o25ZTs6xox5qV9cMIQ1GwZFHwwDwxS1TT3MtSVw
	KHfChu+ieKKaXcIaUZedvxAVS2rxm0lK7vKk62rTfOkS00nov7fAsD2/xfNVuqbry/oF8Bxbd6vaJ
	iFrpzNDPGZVC6j6ezwLhQD7VYtJKoanmPUHvzSFOQOOGYoVN0hGXtUirhFvNAu17+o1yFOqoAqfm6
	FPOVEkQqhb4Jj017wiJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTYuj-0000000C3me-3Orj;
	Fri, 03 Jan 2025 04:03:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTYuh-0000000C3lx-1eMg
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 04:03:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso118594215e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jan 2025 20:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735877033; x=1736481833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJuGqMO/jQ4z+TowIOoPl2aMlmVXNRNIGfU0gnbDMo4=;
        b=K1NnFCJzblXNVcnLwPqr3Xk/C1q4BVidAJLVTfI3UqiVa71MFNc+8wuSdRwkkHjyq2
         fFkZf0R3F12PWym08ZOwW9YfgiFke4UAoW0P7BK7JaTorxrKY4T2mhiMbceCdUc8CdjH
         5tUNSB6JoDROD41+4k7D9NIsytCu0oQIZQVaLhfMkmPIqG7Cy0lE0xndG9jF9PmkPkn+
         Zu0+nH0hLXHspwn8/6nfJlIdWcPD2HSO/neO+62Y9jNdRpxcvou0TdM3gswxgaEdMmRO
         jUZJm+xUlLx1JZU4Xvp83S+K7d3wjiIU/IWnZ/oDd+dHnvUqT+scOVhXzgD0FlBXLaUV
         MUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735877033; x=1736481833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJuGqMO/jQ4z+TowIOoPl2aMlmVXNRNIGfU0gnbDMo4=;
        b=SfEngA95b9JmqhXeBxokCmms+7u98Ui441CDnzWnBfAx5tUZqx7OQ6iK78AmJbU9iy
         S0XCcpD4ZcdTR7yNkKZBXtF4OvBFo30fO+N0Mzw3f69fcg0zpHP69BRGAFq2l9GA89S1
         3DcItIKD7NDqlYS5sfG1bUe+udjWtmmOIYFm43ZqCPdAdf8eSg0y484lPIx5lousJrdF
         RzMGZvdxnJtL+YPANvnPWycek4dHRvcb6lhj0uI0Sw6RjdkDVT9eepvvp5b+L+ct+nVs
         uzANW7LfC2lhYEspkT27aSSLTfkxij1bvKPYcdXk+TcWrAe9tsulJrVw6tsf4hHO/vHD
         94Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWxhZTC4UKeaIqYXZFdKqphTKavsGJSOjzJ+R6WHEQuNAOSQlTWg+jcGajQN5SrZAzDB3OveXF+bWzO1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YycVjB0SYpfQhvZlWg+90WSz+K4/aw11ag5zaYfKLVOPOM5r6Mr
	xp2mMONEo6R8INJUgVxSvDJvJw2PMAvUt6kpaNQ8gwpnKCVmevrV
X-Gm-Gg: ASbGncs1vfAtNMS+WQiXmemztagfYHh9uCoWlOOHceIqmlPP/r+TtwH7sb+EC9i/jnd
	uvoZTUCFRTuqziyUAMRjjwPO7wfnhAnUzmwJEAZjq2+Fih9ZTaLBUcX1QSHMX3m+K8Bg50ylfyB
	Wy0aWKp9wZYQdDImBvTfQCsRMpPmLZrtB7aosDcBelbo7Mp8awV9u1d18V6yVNqnU1pEGUkXhfj
	UFhtlrdnInTuhrsfJ9/lttcuWjf8XozWgca63iCgOqBvJJ9bo7Lot7zHcIlMrgObqrRXVjSwBR7
	VHRYMZFWhBIXpKeSUNZG
X-Google-Smtp-Source: AGHT+IFz1LXuucqG5XV4LRRH13gBdh5dZWFfNIE1AWBUxiyuEmTm3SbKU5ReRbu84ZTQzvFYvORA9w==
X-Received: by 2002:a05:600c:470b:b0:434:a75b:5f59 with SMTP id 5b1f17b1804b1-43668547127mr431260385e9.3.1735877032812;
        Thu, 02 Jan 2025 20:03:52 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm468388165e9.36.2025.01.02.20.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 20:03:51 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Stafford Horne <shorne@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] rseq/selftests: Fix riscv rseq_offset_deref_addv inline asm
Date: Fri,  3 Jan 2025 04:03:26 +0000
Message-ID: <20250103040326.2603734-1-shorne@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_200355_454122_AEEA07E0 
X-CRM114-Status: GOOD (  12.96  )
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

When working on OpenRISC support for restartable sequences I noticed
and fixed these two issues with the riscv support bits.

 1 The 'inc' argument to RSEQ_ASM_OP_R_DEREF_ADDV was being implicitly
   passed to the macro.  Fix this by adding 'inc' to the list of macro
   arguments.
 2 The inline asm input constraints for 'inc' and 'off' use "er",  The
   riscv gcc port does not have an "e" constraint, this looks to be
   copied from the x86 port.  Fix this by just using an "r" constraint.

I have compile tested this only for riscv.  However, the same fixes I
use in the OpenRISC rseq selftests and everything passes with no issues.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 tools/testing/selftests/rseq/rseq-riscv-bits.h | 6 +++---
 tools/testing/selftests/rseq/rseq-riscv.h      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-riscv-bits.h b/tools/testing/selftests/rseq/rseq-riscv-bits.h
index de31a0143139..f02f411d550d 100644
--- a/tools/testing/selftests/rseq/rseq-riscv-bits.h
+++ b/tools/testing/selftests/rseq/rseq-riscv-bits.h
@@ -243,7 +243,7 @@ int RSEQ_TEMPLATE_IDENTIFIER(rseq_offset_deref_addv)(intptr_t *ptr, off_t off, i
 #ifdef RSEQ_COMPARE_TWICE
 				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
 #endif
-				  RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, 3)
+				  RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, inc, 3)
 				  RSEQ_INJECT_ASM(4)
 				  RSEQ_ASM_DEFINE_ABORT(4, abort)
 				  : /* gcc asm goto does not allow outputs */
@@ -251,8 +251,8 @@ int RSEQ_TEMPLATE_IDENTIFIER(rseq_offset_deref_addv)(intptr_t *ptr, off_t off, i
 				    [current_cpu_id]		"m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
 				    [rseq_cs]			"m" (rseq_get_abi()->rseq_cs.arch.ptr),
 				    [ptr]			"r" (ptr),
-				    [off]			"er" (off),
-				    [inc]			"er" (inc)
+				    [off]			"r" (off),
+				    [inc]			"r" (inc)
 				    RSEQ_INJECT_INPUT
 				  : "memory", RSEQ_ASM_TMP_REG_1
 				    RSEQ_INJECT_CLOBBER
diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
index 37e598d0a365..67d544aaa9a3 100644
--- a/tools/testing/selftests/rseq/rseq-riscv.h
+++ b/tools/testing/selftests/rseq/rseq-riscv.h
@@ -158,7 +158,7 @@ do {									\
 	"bnez	" RSEQ_ASM_TMP_REG_1 ", 222b\n"				\
 	"333:\n"
 
-#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, post_commit_label)		\
+#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, inc, post_commit_label)	\
 	"mv	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(ptr) "]\n"	\
 	RSEQ_ASM_OP_R_ADD(off)						\
 	REG_L	  RSEQ_ASM_TMP_REG_1 ", 0(" RSEQ_ASM_TMP_REG_1 ")\n"	\
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
