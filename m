Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C32C7EE2C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 07:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOVzPSps6tKiTTX5E2yGlr5/1M8rTvJ8vNxMhM/uykI=; b=qRcWzT/EyDx9Sj
	C/Uurw+Ek0GaBDesXFAuUv44XIjkmOd46yYvEZ39tmVGwGEATfCg/UU8XF/4+oo8v7CIOeJNlbrB1
	eA4c0vfuzhBJnz3Lz3WdT0ZH/xFTo/ZpYALlUCh1juOcHFjuFKzrdgLh8v7i+Vydhe8QUspOG3S+w
	DJFLRPHc1Asog30ciHYiwhqtnJZF/blFzFOgiqWc4QNGmc4LHfxgItVvFgOW7efQA7Hn7JueNvRsi
	Gdv/8YIA7Q6pD0QEs2jHi9YdYmyzUMHU44ugA/GRiiChmtdfgLzKxwsvyOTdb+a0xBq9lzVmswyc0
	GWBRjQPSyEwP+krbSGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoxc-004cpS-2T;
	Tue, 16 May 2023 07:19:04 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoxa-004col-32
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 07:19:04 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64384c6797eso10885329b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684221541; x=1686813541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Od08TnngvcBflncwckirl6kWgx6glKrr7yMRy+3aZSY=;
        b=CAJyKRIESx3DfkZiuoGMR4C2xu1LepvOjbj6Zf2LgOQd1bzGTAjhH4yPeI3lg7tDaH
         w0yUUTLG1/8KEf/itsWApFOTAJ1oU7cARMd5yqayzEAi2Vkwyo3yYlUMRBcv5y0xIw7Q
         hhWKGL62YQI23mtOfagnADtYQEzNXSLjoNn3X1v31IVS1Iy4f63BBSTK9iaopbhcJvjn
         OniRvKfVVXe1LcYkBrXdP9fjYD3IgAW8igRwMTFSKHeGCpz1zahdxk9mnkIJqi5ZDd5i
         iCErNFvyRYDpVPPKSgHXQ1VJpZp3BkG35TDTLQyzUYbYE/MKcj27OAPYONJ5FxnOe70T
         MTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684221541; x=1686813541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Od08TnngvcBflncwckirl6kWgx6glKrr7yMRy+3aZSY=;
        b=JNSM1l0ybIWVrScEElcn8h7xdGquFvW9zYefcC9GMJtOj5sescbdt4TAHW1fOzX5Ob
         jVjHC7JppVshzdS3ds3W1xkYQ/woIBO8KVSHXD1uPmsMG+mwsogrSDfiMzwipgLkuPlt
         d4Tc2VYhrT0rFgQwtK5ljAQ30Vtgyg8OPbAj91dmoEGf2AjY02HEN926ohL0DkepMcP6
         8T9ea3sS4V3PMCoTDGddcY7F6WVrvIKnF2+3Eh0adtC5ZLTMlx1JAKENMLYz0PLLLJ//
         Kr2uSPJSuKnTp6fonnxUX/ZUDfi/f7nXKnYW2DS9KTpLaEDtoNCpuW9N6Rl/uVREwXuf
         4wYA==
X-Gm-Message-State: AC+VfDwh3JCwxtus2L3jemK8wkFrItwJCyWpGOuVZ3qeKFGfFI4BV0cX
	6k49Ormv2juszWmJQe/m2/w=
X-Google-Smtp-Source: ACHHUZ5AkOuj7oHM//GSH6XREd6vp5E5lGilnWXlY/BIudf1XEHGTKjV4eeZLBZZGIOSbXLwRuYEyA==
X-Received: by 2002:a05:6a00:10d3:b0:641:3ca2:1aec with SMTP id d19-20020a056a0010d300b006413ca21aecmr47315732pfu.27.1684221541531;
        Tue, 16 May 2023 00:19:01 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.15])
        by smtp.googlemail.com with ESMTPSA id 17-20020aa79251000000b006468222af91sm12849830pfp.48.2023.05.16.00.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 00:19:01 -0700 (PDT)
From: Ze Gao <zegao2021@gmail.com>
X-Google-Original-From: Ze Gao <zegao@tencent.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	Ze Gao <zegao@tencent.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] rethook: use preempt_{disable, enable}_notrace in rethook_trampoline_handler
Date: Tue, 16 May 2023 15:18:27 +0800
Message-Id: <20230516071830.8190-2-zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516071830.8190-1-zegao@tencent.com>
References: <20230516071830.8190-1-zegao@tencent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_001902_977599_A96FEB2A 
X-CRM114-Status: GOOD (  12.24  )
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

This patch replaces preempt_{disable, enable} with its corresponding
notrace version in rethook_trampoline_handler so no worries about stack
recursion or overflow introduced by preempt_count_{add, sub} under
fprobe + rethook context.

Fixes: 54ecbe6f1ed5 ("rethook: Add a generic return hook")
Signed-off-by: Ze Gao <zegao@tencent.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: <stable@vger.kernel.org>
---
 kernel/trace/rethook.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/rethook.c b/kernel/trace/rethook.c
index 32c3dfdb4d6a..60f6cb2b486b 100644
--- a/kernel/trace/rethook.c
+++ b/kernel/trace/rethook.c
@@ -288,7 +288,7 @@ unsigned long rethook_trampoline_handler(struct pt_regs *regs,
 	 * These loops must be protected from rethook_free_rcu() because those
 	 * are accessing 'rhn->rethook'.
 	 */
-	preempt_disable();
+	preempt_disable_notrace();
 
 	/*
 	 * Run the handler on the shadow stack. Do not unlink the list here because
@@ -321,7 +321,7 @@ unsigned long rethook_trampoline_handler(struct pt_regs *regs,
 		first = first->next;
 		rethook_recycle(rhn);
 	}
-	preempt_enable();
+	preempt_enable_notrace();
 
 	return correct_ret_addr;
 }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
