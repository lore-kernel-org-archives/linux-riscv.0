Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24960E9413C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 00:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uoLqXwcB1SwzfnaoRY26oPvyjA6iv8pG1IXisz/0R8k=; b=yVebdtM/1PO88n
	z8hdZGYRKAdjaSlMAYqcRmulEpCoZ4H2nVcCp7eQ+kLU3+uHx9VV4yDF7xn7fNlnQtSY0sX8RTLUD
	KndBHSqd7OTCsPxEE2Rv77Jamk2DLl43LusFRYnkoCIVr+b8eNa9pTrHj0vCqDZlbGkA6X8f6omlt
	WQiRitp0b/vw6qGgwYp8kLEUZvT0pv+5hWQXb6itwtd9MxrX7FhY0LSf9SrlXOPCHwiHQvTLd5b/i
	n7QQU1XiSEspmJIq+mwSoeANT7CmIaZYzjovHCl13MoL01wTi2PKcpFaGhHuaO16o3VUesX0jfkew
	deInaaWHhcE9TITm5uHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qovNl-006iLO-1l;
	Sat, 07 Oct 2023 00:41:25 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qovNh-006iJw-1o
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 00:41:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c0ecb9a075so20660435ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Oct 2023 17:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696639278; x=1697244078; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Hp0ECJm0gFf8INn0HiZKpVqg/IUsayxsh+1diajkmI=;
        b=JZJOHEFytV2zNJ357DNpMEL/3k5pC8Ca+BJE6SQZPytfJp4vzfNhvq0Vxh1zlU23JW
         IEl60/2EglFMthK/ftvysRPbMh4Uea9leFGO50KpbYz4Glg/hobwmGDbIw1TZp3+01ij
         cwW9x8iZXvSVLygHET97gM7abul7WhOZP3HOlYiZ8JS8QstxSSy/UrdcLf9Q9ZBpxidu
         QfT6PhtDFYJ7zcZBIYk6PDRqU/G98A9EyNLpB22ProeceNrew/Qiz1DGw3J8bjmJGFXe
         EVjSftSyz6NdUm2Tk8Pr9Q25xnCSugMT8FkJH77KsaoEBSvJfrXSXgcxQfO2QJHuyMdT
         TM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696639278; x=1697244078;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Hp0ECJm0gFf8INn0HiZKpVqg/IUsayxsh+1diajkmI=;
        b=xHIuCPgDgFvWoa/nl8XH+g6OS/qfOt9w+7Bm/dKr7rFsfDjtx3WnbTeiCS6l9otUU6
         qr9F/rQCmGGacIEc5PP7/sj0UXKRBAR8MlZc2W0My8a/Rfre7bhHOGe1x/FKbYOuJfjh
         3r/x6GdTQN2a+2BiSPkL/hJ6zdvy55JrEeSihLWPAy6qi1hGGVK4KaJuEOkOhZSrGmLL
         75Y0dJk5aa5tZRy6ySB+jmLOWyDOBC+exlmWzLcVa00fe5RBbDqT77QhX3Oiuaew7eo0
         GkZg2QOnZ5VlkBnvAS4OD7XDLtVkOfBd1dJomfsGj3tF5EL1Ls2AtiNpk+T3TlpQtlv1
         hSHg==
X-Gm-Message-State: AOJu0Yw/uE7ohgu6/n8BOJi9mw+cVJjlnc71cGFsh/snCxkYDRmfDqnZ
	Uv/4kdGraBiEdwu0HaP3iiC4ZQ==
X-Google-Smtp-Source: AGHT+IH9WxpF3kdiS9QaTEtUj5obvaHiYFW9XD6AGPsPbfksFSz9GOfBX62HTFtC8jFHFpfd0gjD2A==
X-Received: by 2002:a17:902:c112:b0:1c0:93b6:2e4b with SMTP id 18-20020a170902c11200b001c093b62e4bmr9338829pli.33.1696639278389;
        Fri, 06 Oct 2023 17:41:18 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x16-20020a170902ec9000b001c582de968dsm4534540plg.72.2023.10.06.17.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 17:41:17 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/2] riscv: Add remaining module relocations and tests
Date: Fri, 06 Oct 2023 17:41:05 -0700
Message-Id: <20231006-module_relocations-v2-0-47566453fedc@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACGpIGUC/22Nyw7CIBREf6W5azFQlD5W/odpTAu39iYtGKhE0
 /DvYuPS5ZnMnNkgoCcM0BYbeIwUyNkM5aEAPfX2joxMZih5KXnDa7Y485zx5nF2ul9zO7BRSY1
 GncVgKsjDh8eRXrv02mWeKKzOv/ePKL7pTyfkP10UjLNhkKY+qQqrRl48RRfI6qN2C3QppQ8nx
 buxtwAAAA==
To: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_174121_816413_5CB64C52 
X-CRM114-Status: GOOD (  10.09  )
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
dynamic linking.

ULEB128 handling is a bit special because SET and SUB relocations must
happen together, and SET must happen before SUB. The module linking
ignores a SET unless it is followed by a SUB. In order to find the
corresponding SET, module linking starts at the relocation above the SUB
and iterates up until it hits the SET. If a SET is not found, module
linking fails.

This can be tested by enabling KUNIT, RUNTIME_KERNEL_TESTING_MENU, and
RISCV_MODULE_LINKING_KUNIT.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v2:
- Added ULEB128 relocations
- Link to v1: https://lore.kernel.org/r/20230913-module_relocations-v1-0-bb3d8467e793@rivosinc.com

---
Charlie Jenkins (2):
      riscv: Add remaining module relocations
      riscv: Add tests for riscv module loading

 arch/riscv/Kconfig.debug                           |   1 +
 arch/riscv/include/uapi/asm/elf.h                  |   6 +-
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/module.c                         | 247 ++++++++++++++++++---
 arch/riscv/kernel/tests/Kconfig.debug              |  32 +++
 arch/riscv/kernel/tests/Makefile                   |   1 +
 arch/riscv/kernel/tests/module_test/Makefile       |  15 ++
 .../tests/module_test/test_module_linking_main.c   |  73 ++++++
 arch/riscv/kernel/tests/module_test/test_set16.S   |  23 ++
 arch/riscv/kernel/tests/module_test/test_set32.S   |  20 ++
 arch/riscv/kernel/tests/module_test/test_set6.S    |  23 ++
 arch/riscv/kernel/tests/module_test/test_set8.S    |  23 ++
 arch/riscv/kernel/tests/module_test/test_sub16.S   |  22 ++
 arch/riscv/kernel/tests/module_test/test_sub32.S   |  22 ++
 arch/riscv/kernel/tests/module_test/test_sub6.S    |  22 ++
 arch/riscv/kernel/tests/module_test/test_sub64.S   |  27 +++
 arch/riscv/kernel/tests/module_test/test_sub8.S    |  22 ++
 arch/riscv/kernel/tests/module_test/test_uleb128.S |  20 ++
 18 files changed, 574 insertions(+), 26 deletions(-)
---
base-commit: 82714078aee4ccbd6ee7579d5a21f8a72155d0fb
change-id: 20230908-module_relocations-f63ced651bd7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
