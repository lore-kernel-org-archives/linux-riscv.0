Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78404D4A5F5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 05:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C03h6aU5rMvzy913xswGUsqJGuNNosPz57f28bsaMb8=; b=gBibSGxd/aTIuj
	CfN4qcRMY39XpF4WPMhsq2CkEW7r0dIXQMNdeX5244sT7UvhjiWWndZcJfph8HQvIUA5deApuBDXE
	WIWj8A9WgIKVl8NjNqUjEetmWG8DD+4v75CANY+FjDS/27ssfDxeT0OsPYJirrIuwSGJNK+sWpk+x
	6pLprlQHN0jSSuseiNL5PFXx7g6KKosmlzfzcQtuG4BjCBy5yvJC6+aEMNNoOvW7szXxinJhHt3Pv
	vsFxEcaAmO4jzxzE/Y+g5d37W+WYctEjZb9ZdKm4X1MYPUvAKgYA8/jG+Vubryb/X/gM5YFlXBkJv
	68e9ommja3n4jINnzYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysw-0000000FF5N-1WTm;
	Sat, 17 Jan 2026 05:30:06 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysV-0000000FEWL-0YzP
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:40 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-1233b91de6bso5020953c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 21:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627778; x=1769232578; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1r7j6oxFgC0ngZMI9Q8295mOsi/2CMN4d5P2svdjAjA=;
        b=CSzPd+Wa9pJRHeTLOAlwMH6tHh9THjeXGncB96q/FgXznF0ZsebROcH6r4RLX5ipxo
         fxf0e7B+SUJdAJrc5Dzd83Re06mux9nJs/52e2PR32dxw01FA6agVG5Fynno7PgzDOJI
         ABQ0hFPCFqXsi6BPfSQjQThOc4vh6jMJq2+Mf1iqmf/I3i+ISN7otxWbuu+N+bIaSkBD
         cxYQ/A+mxEvuetnwLQWq0iumZKCZRdkL3b5SEisriSTf0pk0CPs63VSeAZ9FdN3eOZl0
         CHcW1L5LTUeJTiMNcykZ6IJIlM9yGc/yTTj9jvPZ0Ikbkx/4X86HFl2ffIBypS22iNqG
         8PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627778; x=1769232578;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1r7j6oxFgC0ngZMI9Q8295mOsi/2CMN4d5P2svdjAjA=;
        b=ZGdQ1dcgitxtkwCgmAvDdHnER6YOqcBCWAt2/b1bgkMGE4UbxglboO0UhZmQrZRMrw
         q1F/3OFoVHFZJguMiDAAOvyyo1BP7YIufAEmKYhsM+GffAVxIwqv2r0SibILd3TOiA+h
         xKtOYYzbVwqzilWGqJZoaTNzwHcxrtEQRFto2FAONqASjq9RUvnkV7T7zvGTMBxQmSkv
         +J0PwHtVAhxEeGlAEEpQozymKaHD+mYYX6CQ2dENwrxr4lTgdH89leNvGCt/U1ASJQMz
         E5ScWRSVXIIaHjgEiir7ea2sIXpUZfwiUNPyoDesw/8TzCSnji5MqycnU88eq4sprulj
         GhLw==
X-Forwarded-Encrypted: i=1; AJvYcCVVA3/1Z7uutAVzPPIMRIjVcAFf6RL0PsKF0a2L1elyrKGGsS/J4BCrZ1GVDmoaH82jTSnW3r4w+Az3vA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoEzQIotyPu3YJsp8rkzAn7269bEa27//0TNlrvAl63wQwEapc
	s6PaPcyzAJQf+IDcZ5e79wZpqjhh6/uMbs04U0ADPITVptYSVWn/fw0c0/+yNMAJy/Fa5iKBPQZ
	eszL+Quhujw==
X-Received: from dlbto2.prod.google.com ([2002:a05:7022:3b02:b0:119:9f33:34ae])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:670b:b0:11d:fc64:9562
 with SMTP id a92af1059eb24-1244b30826dmr3833057c88.1.1768627777697; Fri, 16
 Jan 2026 21:29:37 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:36 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-11-irogers@google.com>
Subject: [PATCH v1 10/23] perf dwarf-regs: Remove get_arch_regnum
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_212939_169011_768D4B9D 
X-CRM114-Status: UNSURE (   9.40  )
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

Except in dwarf-regs the function is never called. The weak function
has no strong arch implementations. Remove so that the fall-through
case applies.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dwarf-regs.c         | 12 ------------
 tools/perf/util/include/dwarf-regs.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 28a1cfdf26d4..b2f37299147e 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -71,13 +71,6 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 	return NULL;
 }
 
-#if EM_HOST != EM_X86_64 && EM_HOST != EM_386
-__weak int get_arch_regnum(const char *name __maybe_unused)
-{
-	return -ENOTSUP;
-}
-#endif
-
 /* Return DWARF register number from architecture register name */
 int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags __maybe_unused)
 {
@@ -98,11 +91,6 @@ int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags
 		machine = EM_HOST;
 	}
 	switch (machine) {
-#if EM_HOST != EM_X86_64 && EM_HOST != EM_386
-	case EM_HOST:
-		reg = get_arch_regnum(regname);
-		break;
-#endif
 	case EM_X86_64:
 		fallthrough;
 	case EM_386:
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 6f1b9f6b2466..015d1ade645f 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -101,10 +101,6 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 
 int get_x86_regnum(const char *name);
 
-#if !defined(__x86_64__) && !defined(__i386__)
-int get_arch_regnum(const char *name);
-#endif
-
 /*
  * get_dwarf_regnum - Returns DWARF regnum from register name
  * name: architecture register name
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
