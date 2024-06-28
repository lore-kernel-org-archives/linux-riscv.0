Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACC6C2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 11:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7htSwF/bns+rgaRgwC9Tge4SDd9tduCehAnkpgbOCXY=; b=xbHTnVKELyCk38
	JN6A4bIfMqx3WXNWJuXxpBC/YBkyJV6v5XNNEkStxgIMtG3tDD0zvk69Xk3Pdc6u1GpH2HiUm/Pgr
	XT8KOwftO11JbWxqws6mZvwMs1arOXoWFlWWY8QiLE+dt3iLtoJRzysVoekufSbvgnUSmApTdg9x/
	O/AHdIjQZIBvoTtLRRMIHfwwj2Rke1IM/h2dGI9QlWPHvSnupcSDrKPNx3EhOLAQyhVqOgsNRENKl
	raR1E94MmU+bSRyGyWtxQ1Cd+CpA95cRHhNKGnTC7rPeTkx4wFIiuIAdsS8IIrgOCGWt8tQaZ0sc7
	0HyP25EdYtV8tKprUMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5Z-0000000DZwd-0tsL;
	Fri, 28 Jun 2024 11:48:25 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5W-0000000DZur-41aT
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 11:48:24 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3d5666a4860so291298b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575302; x=1720180102; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R4ThAGGzyxzKL16VZ/3SLSpBqDh/fGCMoUEXeAx/HQ=;
        b=W/RwbQHtB81aR7yiLjD1/ASQRlh5S/Q3FfXbAy7YwQon0HNgHq69wbhiGQMKnUVEkD
         mQ6H387j4ZEIIudRP6zmQXDkFwWpxVjjr4v8JDJEQdwGJ1S0yFMs0HFpoi0T+n7hFMGw
         DM/Cj3NO8Jr40KCliMCiuE+VNh/umAhY5lgIJ9Xb11rwq5QJCE19pq1GfNqv81ywBHhc
         viYg0mmBdCe8Lmnk1PnrSFCYbg03Gsb1tNBtEMcMukiJ84ha+fpIPI7Kh58lKbX0sGYc
         ra/GydgInWddRXn00jA0g+wY5kMZ1ajYTZXrD77L7pkiEMOpVvLM+xAyCaCZ+U0psdb0
         PRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575302; x=1720180102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0R4ThAGGzyxzKL16VZ/3SLSpBqDh/fGCMoUEXeAx/HQ=;
        b=B+FoAPg8euIxX3ixT24AKl8zkv7/bysWm9ZAS7oGkppGtQQoA3tPJEM44f4XH6LXvl
         lfkn+vqdtibs+XZvV8xue8zi/buYjD7LEsaGw5GKdGF6UPoo8OPFJGmQ/zuCxOVDx0Nl
         lq8FfaNnwONHk0nIJaMNs9Pm1T2kq3QOsGbhi2aq2Hnz37ThNEK5VecA9XiKmLdkLL6k
         ZBEYSsf/dfz8ucCAIJu++n9J/130Uczw6xGy/HMhY9oDx6o4D3duBCPXBmXTCU/fQOnW
         rXkzMNb/U8XiJkMdjRs4ptSbwDc5moj69eWV3EsknTxsFtLcRulVjTQJaIGHQ4mLWXqj
         xVvA==
X-Forwarded-Encrypted: i=1; AJvYcCWFnjro2iqW98vZpF2pv6TqQ7cX99R3/NpEew1ub1KE+oxMSjMvVhN8/7FQmxirEa0YqVSjsoJQ2Wxd9ArhkUEB3ny53I1yFJ/g+oQbPhJr
X-Gm-Message-State: AOJu0Yxf58GSWICjALcTUkBWmdGkNnKF/rQlKa1n1kTiODO33QEGHn42
	IUfITvflaGyGVtFAvNOjIzcsV0CT/Ek0GGRhdLdqf0lvEVjgtbGfHFaRQKg/0F8=
X-Google-Smtp-Source: AGHT+IG4h5F6VzLgJwsJVSFf3Gl7LvgvGwcibgWFpRNTrZUraOpcCSEmqXroyM6n2QyUfXey/pxfEQ==
X-Received: by 2002:a05:6808:16a8:b0:3d2:1a21:782 with SMTP id 5614622812f47-3d541d46720mr17312078b6e.56.1719575301977;
        Fri, 28 Jun 2024 04:48:21 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfb90sm1377775b3a.139.2024.06.28.04.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:48:21 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 28 Jun 2024 19:47:45 +0800
Subject: [PATCH v2 2/6] riscv: ftrace: align patchable functions to 4 Byte
 boundary
MIME-Version: 1.0
Message-Id: <20240628-dev-andyc-dyn-ftrace-v4-v2-2-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
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
 llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>, 
 Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_044823_039098_6B0F2F98 
X-CRM114-Status: GOOD (  12.29  )
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

We are changing ftrace code patching in order to remove dependency from
stop_machine() and enable kernel preemption. This requires us to align
functions entry at a 4-B align address.

However, -falign-functions on older versions of GCC alone was not strong
enoungh to align all functions. In fact, cold functions are not aligned
after turning on optimizations. We consider this is a bug in GCC and
turn off guess-branch-probility as a workaround to align all functions.

GCC bug id: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88345

The option -fmin-function-alignment is able to align all functions
properly on newer versions of gcc. So, we add a cc-option to test if
the toolchain supports it.

Suggested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

---
Changelog v2:
 - Use CC_HAS_MIN_FUNCTION_ALIGNMENT and it friends to prevent reinventing
    wheels (Nathan)
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 704d4683bcfa..55c70efbad0a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -133,6 +133,7 @@ config RISCV
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
+	select FUNCTION_ALIGNMENT_4B if HAVE_DYNAMIC_FTRACE && RISCV_ISA_C
 	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
@@ -208,6 +209,7 @@ config CLANG_SUPPORTS_DYNAMIC_FTRACE
 config GCC_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=8)
+	depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C
 
 config HAVE_SHADOW_CALL_STACK
 	def_bool $(cc-option,-fsanitize=shadow-call-stack)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
