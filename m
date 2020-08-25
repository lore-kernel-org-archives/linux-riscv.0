Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C35C433E5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 00:30:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7C1D20838
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 00:30:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kfdS/v+h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="vNwceFJi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7C1D20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CmRAKt8/iINzsvgoRWntH4Lv4pkabz0syDlUGHvcqhQ=; b=kfdS/v+hQR3hbWvqMO1c6NLE7w
	ZNknPTlgSrCKeZjhvMIeIWWWE3a2MuS2Q9kzBmyqVv6rm/unpXjJq5YS1wkTMgDhf0E7kLSlPZFpn
	tXVBxNCurpp9frQcoTEfSFW37rCnXXGlQlJ1b0zG5GksH47uT2nBFVgAFHIIHLxD+EwrKGVpSWyIk
	5lAN80CQxdSdIqk+3YnQd/BcBfBmGBDERakkfDZKEgJdCSVYdLYfZnfWHQ0465Hrd2tdz1z5DNYo+
	riOyqffpEKiefCIKQyvK4PIk7z+TYHKxeWQSi+VEPxC7tf0Ly5AjgaYv6xby/r+pxZjvQPEwXAec7
	mNhvw/EA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAMqS-0004Li-7y; Tue, 25 Aug 2020 00:29:48 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAMqG-0004BR-J2
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 00:29:42 +0000
Received: by mail-pg1-x543.google.com with SMTP id h12so5552881pgm.7
 for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2020 17:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=RMVD6qaZivOGUI/zEZzB2kS1tRCCV3zkhqhOYX8y8mk=;
 b=vNwceFJio+kfHjb19gqarS5lPvBzOi1DmrnD+KmNbi2nvysNBCXkRkmv13nNw0zPIF
 Xoit3ZPdEF059kJNaatLMDu1Bqzf3OVuORyJhA1o/ngRA6LUHyrMIP8ZideNg3byaOqO
 4C8rE5qHoAl7QXUCAH/PdZmbj3fCPH1HlrQUynJT27/F32W9oC6eZ+59cRPDbojDDQAw
 0tGZKhtarWnIl2zud70f6x60Jw6dJ5s0+gVQQccg0KSrY8C0MvyJOh6n/BMmAf5g6IRn
 04d3Dketd2zXynKav/hRb3/v9le/ylOVEGhu6n+oIMtN58c4JH9yh6G5w7Ydaq/t0zn/
 RckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=RMVD6qaZivOGUI/zEZzB2kS1tRCCV3zkhqhOYX8y8mk=;
 b=t4ttBnQIputfoguVyMG4SsOW6uwEABDusIx1EotDdYAYtF4O/dDwfDL7DCM6G+btLm
 UlA6NONiCz0Jp3MA/IklzByTCz9bQ08WXFT/N9Y8E2XZFLoJXTEr8kP8ehRwKyzlzgB7
 LGeMOiP5y5cSPKrJAh6z13kFWhPHhEB8H5h51fK26kt+zLCZmZmfpkV/zKqLTpnDoyrt
 YJT/EFC55egK74rqCRa5dizXq6dFTSK0AsdkO7SQEpBAJbWXQ7RXAAxMtXo9QFwfK/cT
 cAvCzs63EU+QiVj9eZPe8kX6ZKETDfFSGX9w5MR1inG0f1H2Nevl/lDmV9JplyEtalZf
 YisA==
X-Gm-Message-State: AOAM530RYQ6+byfdEQbowoJ2BqfV4GGgqFe3I5KqgvwQeIkC+oL73NNq
 JNHSAL6tgZfwqkZKoUbuAh468e/dNUVxoQ==
X-Google-Smtp-Source: ABdhPJxH96tMnGBA24GGy9HWiWIbbYkIrQ9lCXJqapQUd/859RDahHpl6tPgW94El/kGTZ2N3upHBQ==
X-Received: by 2002:a05:6a00:14ce:: with SMTP id
 w14mr5806941pfu.119.1598315371880; 
 Mon, 24 Aug 2020 17:29:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u62sm12727929pfb.4.2020.08.24.17.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 17:29:31 -0700 (PDT)
Subject: [PATCH] RISC-V: Take text_mutex in ftrace_init_nop()
Date: Mon, 24 Aug 2020 17:21:22 -0700
Message-Id: <20200825002121.1779187-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: rostedt@goodmis.org, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_202936_832747_5347FF74 
X-CRM114-Status: GOOD (  17.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Without this we get lockdep failures.  They're spurious failures as SMP isn't
up when ftrace_init_nop() is called.  As far as I can tell the easiest fix is
to just take the lock, which also seems like the safest fix.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
I haven't actually tested this, as I don't have a workload that exercises
ftrace in a meaningful fashion, but this seems pretty safe to me.  It smells to
me like we should handle this in the generic code (make the generic
ftrace_init_nop() call brand new
ftrace_arch_code_modify_{prepare,post_process}_init(), which default to calling
ftrace_arch_code_modify_{prepare,post_process}() or just juggling the lock
(depending on what most architectures are doing)), but this at least fixes the
issue on our end so it seems reasonable for now.

Thinking about it: I guess if I just booted with ftrace and lockdep it'd catch
this issue, so that seems like an obvious test case to add.  If someone has an
easy way to exercise more ftrace stuff I'm happy to run that in addition.
---
 arch/riscv/include/asm/ftrace.h |  7 +++++++
 arch/riscv/kernel/ftrace.c      | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index ace8a6e2d11d..845002cc2e57 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -66,6 +66,13 @@ do {									\
  * Let auipc+jalr be the basic *mcount unit*, so we make it 8 bytes here.
  */
 #define MCOUNT_INSN_SIZE 8
+
+#ifndef __ASSEMBLY__
+struct dyn_ftrace;
+int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
+#define ftrace_init_nop ftrace_init_nop
+#endif
+
 #endif
 
 #endif /* _ASM_RISCV_FTRACE_H */
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 2ff63d0cbb50..99e12faa5498 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -97,6 +97,25 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 	return __ftrace_modify_call(rec->ip, addr, false);
 }
 
+
+/*
+ * This is called early on, and isn't wrapped by
+ * ftrace_arch_code_modify_{prepare,post_process}() and therefor doesn't hold
+ * text_mutex, which triggers a lockdep failure.  SMP isn't running so we could
+ * just directly poke the text, but it's simpler to just take the lock
+ * ourselves.
+ */
+int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
+{
+	int out;
+
+	ftrace_arch_code_modify_prepare();
+	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
+	ftrace_arch_code_modify_post_process();
+
+	return out;
+}
+
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
 	int ret = __ftrace_modify_call((unsigned long)&ftrace_call,
-- 
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
