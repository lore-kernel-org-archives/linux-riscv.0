Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EBDEE0211
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 21:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uf8QgoClMALhLZnLE5slWmAI4n67eXpdqUICeS0K0eo=; b=NTuOqtorK0fIEL
	ywvWLKTmaxr/EVmlGDbF6mUD8NnaJlxdASV+X/FlIVnI+XCX6bWNkcXa5eSMWy5sHqG7eX8hoFDFd
	WfEmjmBT6iQc6Jzj/9UJ/iKazRfYCJNem4lhmeHUTOM0rDFUSDVjsFdsj6AnySXmiRrg2cIJ7aKmP
	eR5EB3r5mprPjDjnFt3gWv0we+jzcejui358PXcSqodaBfnmo2QW90+aCyTEw9BNgj48XSBT1V0DJ
	ZMflWqCqIRth//4MtZQYte8+N4SpCHZbpKRBz//p9OgdECXsAfo9l+RHVcQobYdABs6GCZTALMdTl
	ptywVPS5Wx2WxKcuXFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgX3R-006j6P-05;
	Wed, 13 Sep 2023 21:05:45 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgX3O-006j5X-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 21:05:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c39bc0439bso2448485ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 14:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694639140; x=1695243940; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IrM1G1X1joN9C/3rPYTl47RElW8sRiJaPs6T25r1A0k=;
        b=r3o19NAEpyiVCU0DJIeocLONuyDV7HuOuwB/nYVxT/OYW2oc2rwJvkDIQk4mXDY9qy
         cQVCaewFVw8HaJKOXEFvj+piG7yT+/ETGhC5e2ugauRb3WteTtBM806auTovgEa6DfGt
         vKJSCSptqNc6OCJjJR3SR7FZEEjWh4/agxXC1WeLgJnNv2JJsuru4tjvNQ43CVq5PCjt
         MqXEQ75giB2ajAldUmauy3uQKNL5WWYfQ1bhfYEM7KZCOq61S2oQ32l2PdeQa4aXroOF
         C5Crmovler7/5vmzIFmxtMfFzt+nImaj1/3YuJUzVl4mxxyJ0kR0pvvDEm4TBGLIyW7b
         pAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694639140; x=1695243940;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrM1G1X1joN9C/3rPYTl47RElW8sRiJaPs6T25r1A0k=;
        b=o6i1Hg0Fl/DPKP1J5XKsT3pwAd+CE1LwpJQlo1wDhDNSFLeaArIN6Swli/K0EVFg7A
         dSo5TC7zcnvddNHVfmjxQtvprq2uvLyFmox+9ER7kexUDfQd/Q8IedR9NC83r7gZsDBW
         RnYtaKjFXrnOg7X5uj14dRwGGBuQNWytl7M6s9lVg0exfdcrlZMuZ8vxERdD0I+3WFxo
         +KeOcPRJI8CQv+dSBOk/AFGnt7Y14+ggChDjCDq1/pyWTP7hmAh7PN8ejNiqszBld7hE
         vsOfI2kBUd7MW6UtYnJjORPXYACZb5iIxI607VCSHq6s3ovZ4tlJ1X1Jy2I9ScGkhJMr
         074Q==
X-Gm-Message-State: AOJu0YwM2KEoqe3nUhOc2eCE0CgSVml6a3qks33hIQUfWSAr26k874Hi
	n9cE6boXdvKhR2ohgYnccgrzmKw3QA4dbT4hIJE=
X-Google-Smtp-Source: AGHT+IHGL3wuen0cvdY0OmpjQGjsmcKpwlYbOm7HmVx+lfYDGKmJjed11FXMUCYGBl/R3WLTRhQF2Q==
X-Received: by 2002:a17:902:d487:b0:1c3:e3b1:98f9 with SMTP id c7-20020a170902d48700b001c3e3b198f9mr5880198plg.24.1694639140186;
        Wed, 13 Sep 2023 14:05:40 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id z16-20020a170903019000b001ab2b4105ddsm66323plg.60.2023.09.13.14.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 14:05:39 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] riscv: Add remaining module relocations and tests
Date: Wed, 13 Sep 2023 14:04:48 -0700
Message-Id: <20230913-module_relocations-v1-0-bb3d8467e793@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPAjAmUC/x2MWwqAIBAAryL7nWBKz6tERLlbLVSGVgTR3ZM+B
 2bmgUCeKUAtHvB0cWC3RUgTAXbut4kkY2TQShtVqVKuDs+FOk+Ls/0R7SDH3FjCPEsHLCCGu6e
 R73/atO/7AV7LNqRkAAAA
To: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_140542_739545_68A01E51 
X-CRM114-Status: UNSURE (   9.53  )
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

A handful of module relocations were missing, this patch includes the
remaining ones. I also wrote some test cases to ensure that module
loading works properly. Some relocations cannot be supported in the
kernel, these include the ones that rely on thread local storage and
dynamic linking. The ULEB128 relocations also seem to be stripped out
of kernel module binaries.

This can be tested by enabling KUNIT, RUNTIME_KERNEL_TESTING_MENU, and
RISCV_MODULE_LINKING_KUNIT.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      riscv: Add remaining module relocations
      riscv: Add tests for riscv module loading

 arch/riscv/Kconfig.debug                           |   1 +
 arch/riscv/include/uapi/asm/elf.h                  |   6 +-
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/module.c                         | 191 ++++++++++++++++++---
 arch/riscv/kernel/tests/Kconfig.debug              |  32 ++++
 arch/riscv/kernel/tests/Makefile                   |   1 +
 arch/riscv/kernel/tests/module_test/Makefile       |  11 ++
 .../tests/module_test/test_module_linking_main.c   |  64 +++++++
 arch/riscv/kernel/tests/module_test/test_set16.S   |  23 +++
 arch/riscv/kernel/tests/module_test/test_set32.S   |  20 +++
 arch/riscv/kernel/tests/module_test/test_set6.S    |  23 +++
 arch/riscv/kernel/tests/module_test/test_set8.S    |  23 +++
 arch/riscv/kernel/tests/module_test/test_sub16.S   |  22 +++
 arch/riscv/kernel/tests/module_test/test_sub32.S   |  22 +++
 arch/riscv/kernel/tests/module_test/test_sub6.S    |  22 +++
 arch/riscv/kernel/tests/module_test/test_sub64.S   |  27 +++
 arch/riscv/kernel/tests/module_test/test_sub8.S    |  22 +++
 17 files changed, 485 insertions(+), 26 deletions(-)
---
base-commit: a48fa7efaf1161c1c898931fe4c7f0070964233a
change-id: 20230908-module_relocations-f63ced651bd7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
