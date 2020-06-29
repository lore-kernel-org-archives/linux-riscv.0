Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F16C433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 03:19:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B60BB20702
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 03:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qE+NrrpH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ftT4z8T6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B60BB20702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TXwlSUHGlhIHXFVFvgDF56FK/i0dLuCuAc6LQqqt1uA=; b=qE+NrrpHlC9zG/rSwKyXgtEkP
	oxA616zF+FGA/Ryafkm+19d9vQkTdkML1AsYwP2m7gzbm+nMTqj9thUnfKTkicerVtn2k7mFaaKNB
	lviCww6irUqEb29sMT/Huv4OGVEh9DQGPfoW0qHeTktWO8tOBEsG9uHRDVXuPqyFEdjO4yzYeOyXq
	5mO2DaNOhwkcATrj7gGQT93RbrHzy2sfkUnr7Y/Vr+O0zQWzNQTRCt6HR2LfsK2Wjtt6NGZD9iD8S
	epVXunF0vJGW/8inM68BfyIdvhDirXALSjIKX7Gc3I8PYraZMsUWgGCXwBPnvdxH4QK6avRtpF3MJ
	7qJFpKjSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpkKU-00014C-EZ; Mon, 29 Jun 2020 03:19:34 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpkKS-00012m-4l
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 03:19:32 +0000
Received: by mail-pg1-x543.google.com with SMTP id e18so7657659pgn.7
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 20:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKfMrSfh/1bie8cySquwojH2PxFPR3ZK3HqOY75MLbE=;
 b=ftT4z8T6YJu06KMqRVdlMDg2q4w/wVXqKAQsM+8ujaw7OMn1HVy6rapb4tpakMEMW7
 nJO4wGpe2sOpbE4oBN8gex/K+LetkiMYiUaLjpjm6NCLaeJugrqNgMXgAjNzYFhD/QCu
 eYzaonWZAkFovEnY6dm+slwZj8kLH3NiR5Ub033AauyRghFnYo6dE1yyQaN1tNf6QHmx
 LvROSBlaYU6tmtfyCAD7RNgvBaZNigsS1PnlCMtcApJaJTLSJsZG5eLPQvA6NlmEgxYn
 1kLcsTLwOP5rlMBvArdJ0OMpEiLx4OFOWNT7GZN48Pdsnx3popYDLD83rbZ9HnKz1ej+
 Ph/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKfMrSfh/1bie8cySquwojH2PxFPR3ZK3HqOY75MLbE=;
 b=RyMwYkQQ5u+O4hpi8AyisCxTsfOSCpMPfmc/6REhRzOPp1YPK6kSkzIXrc1bIDTx16
 681dVADrXGCx12FvSQsJNZ5/dgec9ZwIUxus8W28HssY5zUsr//d4cYQerKP9GEeujvQ
 8Ci5nGUHTeMEWJBGg3Rt1I1JxOY19PyaJ02IiZtbk/aAVVWgNIExb+zrrYXKTAsIhEvR
 MWJPd7tKcmJdGpljjoYDdmfvU7xfn+oBw3Q+eeTRJh/iBhDoCQMrwCPkh+hiaGu/nYw2
 V26hsBELXMKPvcOxPWU5uYUL7mSe7fxLoQlSF0KOhuEr28bgRFpw1cBu0+pT5AsykpGB
 INmw==
X-Gm-Message-State: AOAM532kDLY90MPctFbKL0xSW3wePozvki+mTrlXsu6fVCa0FldkHKPw
 XusG4UdpRC3OACKbkGj6BbhSTg==
X-Google-Smtp-Source: ABdhPJwq3Jh47y19VyyQgPItpKzVqNI4nRh3QCg+GTyihkO1sAimafJfqtC/3470fFtDP3xOa8zeWA==
X-Received: by 2002:a05:6a00:22c2:: with SMTP id
 f2mr13386684pfj.187.1593400770097; 
 Sun, 28 Jun 2020 20:19:30 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id j70sm12876254pfd.208.2020.06.28.20.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:19:29 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 6/6] riscv: remove PMU menu of Kconfig
Date: Mon, 29 Jun 2020 11:19:15 +0800
Message-Id: <f704db6a46b6c4d89fcff28433900d1357ba4f26.1593397455.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593397455.git.zong.li@sifive.com>
References: <cover.1593397455.git.zong.li@sifive.com>
MIME-Version: 1.0
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We only one instance of riscv_pmu now, and use DT file to describe the
platform-specific information, so drop the dependency and menu of
RISCV_BASE_PMU.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/Kconfig                  | 13 -------------
 arch/riscv/include/asm/perf_event.h |  2 --
 arch/riscv/kernel/Makefile          |  2 +-
 3 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 128192e14ff2..deec11e924ce 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -292,19 +292,6 @@ config RISCV_ISA_C
 
 	   If you don't know what to do here, say Y.
 
-menu "supported PMU type"
-	depends on PERF_EVENTS
-
-config RISCV_BASE_PMU
-	bool "Base Performance Monitoring Unit"
-	def_bool y
-	help
-	  A base PMU that serves as a reference implementation and has limited
-	  feature of perf.  It can run on any RISC-V machines so serves as the
-	  fallback, but this option can also be disable to reduce kernel size.
-
-endmenu
-
 config FPU
 	bool "FPU support"
 	default y
diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index e95d3bbaae3e..9ee654381d8c 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -12,7 +12,6 @@
 #include <linux/ptrace.h>
 #include <linux/interrupt.h>
 
-#ifdef CONFIG_RISCV_BASE_PMU
 #define RISCV_BASE_COUNTERS	2
 #define RISCV_EVENT_COUNTERS	29
 #define RISCV_TOTAL_COUNTERS	(RISCV_BASE_COUNTERS + RISCV_EVENT_COUNTERS)
@@ -79,7 +78,6 @@
 #define CSR_MHPMEVENT7	0x327
 #define CSR_MHPMEVENT8	0x328
 
-#endif
 #ifdef CONFIG_PERF_EVENTS
 #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
 #endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index b355cf485671..1f5736e996fd 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -43,7 +43,7 @@ obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
 obj-$(CONFIG_FUNCTION_TRACER)	+= mcount.o ftrace.o
 obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
-obj-$(CONFIG_RISCV_BASE_PMU)	+= perf_event.o
+obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
