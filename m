Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8665C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 07:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OZL4b+DKqqCKPLBx6y+VvjNyUInX/0Ji6F2A/UGjMU=; b=jUP2jnhc9GM0Om
	nyKG/FVSpLEmYu0SLIpQSvB0blAEDlxN6QkSDSJ2FpvZ+53r0sk67Y+8wJQGMs045vnPkBDhkcWdc
	lM2egMkHxJAOxGziJX7ouniM5ZEX7ivvwJ11JmyfP1L+LNIq86LFXE6PtJVXcn+4GZUxbInxqtTQr
	SwrAzBm11SWQzV3trOX1rkFSNkaAg0VpWKU6JbJauT0fYlqnKvpSJKvrIKHKikocp7e7j8x5PNV92
	rCLWJ7sdj6xDhwaXA1lQf3gUqLiLmC2YT29SIygJsgLHvMBvlRc0q7+cgcrB6HlejKPJ3v581NzDY
	0QqAHZXq6ED9p9dcC1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHexQ-0000000FUg5-2i55;
	Thu, 13 Jun 2024 07:33:16 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHexN-0000000FUcl-2TNy
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 07:33:15 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-704313fa830so513751b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 00:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263992; x=1718868792; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlJIkXaRaXYEOo0FtAy4w5B+d0jhj99dMDrjOpWfyi4=;
        b=XtgteywTdO3XQELyIBELowQHcElUaMuq+jlgevkqoqwhIT18AkXgruu3wim0jLDDAL
         tit//EXYFkZVgCFyK2HCXvY1bqDVSI+1zRlE+LTr5y3YL0uPSge8J9tZzqlLJfsD6Uf6
         zLmvCAHcXmuYPxUggFPhUxHMP/2LV++7ZIWFz5l1Ht3jqmyxDH/bwT7M96iZ3DMoR9T9
         6Gmo26C09cAlCho96bq3fD3LYYiDcQPPjmFM/9h663xFzTkNhfmN+ilVKm2uwv+jMJJd
         A+LcjBO0WQNvKet4yR/GnN7s6yGvADQ+5IWYEqhkBXsUxINUMXQYolt1eWBK8gv2Hk+X
         XgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263992; x=1718868792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlJIkXaRaXYEOo0FtAy4w5B+d0jhj99dMDrjOpWfyi4=;
        b=iYGQSn2vDAWKB7QmFPJKb8t/x63rllvEb/XOIbgBpNfzHodFcDJH5CqR2RVVz0scyZ
         kwy9Wk+2+Qt1v3AJxFlH96Wb1PxsP4b3U/Tw7Yp9RMRCNAfOd3EjnPZCTB8WZilZGNrd
         dtflOa8aMyqgENlwQBzysSvn6NVT2oxxAV5n5j6UPy6q7Y7KWbfFsmKQCK/b676ckufM
         FwA31ZnTROyEB4+Qv1Qd0fYtc8Wqdi0kqlCQm8z9h19u2qZvz9ZbbViNrkrqMy23MZY/
         +/qh8TDHE9lGGzLMHhJxFEhglUUOKc4XVAV6J9frQN1Cm5uvHLp/yEnWusOxFaBF5AMO
         TxeA==
X-Forwarded-Encrypted: i=1; AJvYcCVwZr6cK+xm9flH6gU5/j+xnYetpoD/zmK8zFTrtoIHGUVZMhUYhmOhwfW+t4giMcRKj4iWfGstu8TOGvAtQ62SwXkAb2mAbTThh4+DtgvE
X-Gm-Message-State: AOJu0YzQqrHVhALwz5SdukN8lv5q9dR26kMeIjebRTrzvZOSJ382/dT+
	ANSNxtKCy/wdn0nMeoWwsWuL9mNqmAIjK4JkLroXAkEu2Q+8fHudC3gVXYia+dI=
X-Google-Smtp-Source: AGHT+IEyM0ONI7ICTx6DjS1SeAdMKnjMDIyvhgY/AOB26Jk18oYzU1QW75t2bRm257+1EVhnYwVCTA==
X-Received: by 2002:a05:6a20:3d88:b0:1b2:a889:f7da with SMTP id adf61e73a8af0-1b8a9c887fdmr4702279637.55.1718263991983;
        Thu, 13 Jun 2024 00:33:11 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:33:11 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 13 Jun 2024 15:11:13 +0800
Subject: [PATCH 8/8] riscv: ftrace: support PREEMPT
MIME-Version: 1.0
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-8-1a538e12c01e@sifive.com>
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
In-Reply-To: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_003314_100498_785D2DAE 
X-CRM114-Status: UNSURE (   9.86  )
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

Now, we can safely enable dynamic ftrace with kernel preemption.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 80b8d48e1e46..c1493ee1b8cd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -133,7 +133,7 @@ config RISCV
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
