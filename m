Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6CFD6DDFA
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 13:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PYzQnvYZzxRXdOJni9l9VeJOft9q89KaSvAe8QBadCM=; b=NvXWdhTHEdSiR8
	S8EFWORg2yT0bn+pPcepu4P+0V4tG5D6jmleCwT2SYVPOekW+QwgLc2f3tgFtDQDPaEgzieB/mySQ
	qpdi/oX6pK/7WuE5BLnbJ03wHiMSM8rVtwwaY8jVcoV/39wqJgjgSVgjLvUeXedIcFf0YlfFVxgce
	edmYcbbgA/+Bjz3QL8kcX0OvkV85Z7177Dn19EgarL+hYf9cngsMAN+7Iy5KPvSgACzliiYU2N2gu
	YMDGsYrPKDj77ek88YnljnKNYv2GkK5ptDcQTuERLJONDCXUFZvrzCBFOkQBQSJ3JlvDarE2VAGkN
	vRwcKIoVBVh13rE/+KhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwKB-00000002n8B-2hvm;
	Fri, 15 Nov 2024 13:25:23 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwK9-00000002n6Y-0Lg4
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 13:25:22 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-856dd0bc407so431886241.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Nov 2024 05:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731677119; x=1732281919; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OXYAb6PLHFnX5ddiFPzuGuSWsu4V6JIF0+6sI4IJYrc=;
        b=wbj9ozKXVyLiT354T+caxBNPKUWf77Zu/t8/3oxoHPizxZjF+p6aO0vvApUQ4nspru
         HMnSXF0jQ0u8Sd0NQEfuAUNzT9Rj31oIjS0qQwqxxAXwn9lOP6l26p2CC/KNt4ux53gn
         0ueZnAjut4x8+Yk6maCQ3yVq01exjUfF0PWEhyzG/zQsaD6U7zbkBsDB6K5+qIVP32WW
         b0rY/AFbhH14FfkmJs/LRYBNk/Bx/QF23lsmTm6gTtG6b78msDwdzMGTKM01+aIJO5tk
         SClxqzxopx8Hu7c3Ee+QxQmCBiC3fEmdwt1puqySlofPy2QVS1Pb1mbonfvChj1T4opi
         My5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731677119; x=1732281919;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXYAb6PLHFnX5ddiFPzuGuSWsu4V6JIF0+6sI4IJYrc=;
        b=wfDiMTxICyzRCbbKEgWWbcdhefGmsV1POP/OO3dHOd2csIXcbOdZY03OsrbVAZdlY3
         hTufIkUXgoSjAE9eUgshMbpeJ16pbGFW3KU7mE+nurWeIMVrKi2t6r2mIg5hD74PVLLX
         2JOLYzswlApp0fqd15e+kxHrUJdAjAcwpPoCEFdBvgzGw9pdTEcx6i17YFWfA5w8IuQF
         1OxxkQs1CNswdCCMVCvsWgVIvKwfbuqQBFrDyaYjXRE9CWBqirnDko3Y9YWK6XIUOe0M
         yWII9XwFazfGMYMaUxwC4J1wJYHU1fRLrw1iIhs2AZwFdM0xKx5RxcLBOFz/kKO4Yai9
         w53A==
X-Forwarded-Encrypted: i=1; AJvYcCU93NsHblw1Gm4po6vJN6OiXggm6LMdVMuc1W7BV950QXkzMwYUvhl07Sh678taDUUqy1kJpyK0zt+1ug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv5M+cbj20p1hy/JLcuDQ6XobSclGtid6v7PCiioG9ttDtDeyb
	wt5qDANsePxqFIMKt2hLfRxhs+dbxmR3v5It2fDMqYAQqIonmPLoyJQeDEDlHASUqQlF1OQM+nP
	Y0b/gMTwnJYWFR4NJqF/uexJNBH5sKcW+P2cHRQ==
X-Google-Smtp-Source: AGHT+IHP9qntYDPkv8gz3RyGGvJS5CGBuoRgWcRvYQNEWDKJ0JaS2OYT0qdnUSe+4HP41XhcqjGcI8JG9uxcwd0IfNU=
X-Received: by 2002:a05:6122:1787:b0:50d:85d7:d94b with SMTP id
 71dfb90a1353d-514786d3b56mr2773887e0c.11.1731677119052; Fri, 15 Nov 2024
 05:25:19 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 15 Nov 2024 18:55:08 +0530
Message-ID: <CA+G9fYv=qPeZKkF+ntWxUXbAKjz4gXnBM8y60C4F=YHv+jgZZw@mail.gmail.com>
Subject: riscv: include/linux/perf_event.h:1679:84: error: macro
 "perf_misc_flags" passed 2 arguments, but takes just 1
To: linux-perf-users@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	coltonlewis@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_052521_127444_4DE79E7C 
X-CRM114-Status: UNSURE (   4.72  )
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

The following builds failed with clang-19 and gcc-13 on the
 Linux next-20241115 tags on riscv architecture.

First seen on Linux next-20241115 tag.
  Good: next-20241114
  Bad:  next-20241115

build:
  * clang-13-lkftconfig
  * clang-19-lkftconfig
  * clang-nightly-lkftconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
In file included from include/linux/perf/riscv_pmu.h:12,
                 from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                 from arch/riscv/include/asm/kvm_host.h:23,
                 from arch/riscv/kernel/asm-offsets.c:12:
include/linux/perf_event.h:1679:84: error: macro "perf_misc_flags"
passed 2 arguments, but takes just 1
 1679 | extern unsigned long perf_misc_flags(struct perf_event *event,
struct pt_regs *regs);
      |
                    ^
In file included from include/linux/perf_event.h:25:
arch/riscv/include/asm/perf_event.h:15: note: macro "perf_misc_flags"
defined here
   15 | #define perf_misc_flags(regs) perf_misc_flags(regs)
      |
include/linux/perf_event.h:1679:22: error: 'perf_misc_flags'
redeclared as different kind of symbol
 1679 | extern unsigned long perf_misc_flags(struct perf_event *event,
struct pt_regs *regs);
      |                      ^~~~~~~~~~~~~~~
arch/riscv/include/asm/perf_event.h:14:22: note: previous declaration
of 'perf_misc_flags' with type 'long unsigned int(struct pt_regs *)'
   14 | extern unsigned long perf_misc_flags(struct pt_regs *regs);
      |                      ^~~~~~~~~~~~~~~
include/linux/perf_event.h:1680:22: error: conflicting types for
'perf_instruction_pointer'; have 'long unsigned int(struct perf_event
*, struct pt_regs *)'
 1680 | extern unsigned long perf_instruction_pointer(struct perf_event *event,
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~
arch/riscv/include/asm/perf_event.h:13:22: note: previous declaration
of 'perf_instruction_pointer' with type 'long unsigned int(struct
pt_regs *)'
   13 | extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:102:
arch/riscv/kernel/asm-offsets.s] Error 1


Build image:
-----------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241115/testrun/25823358/suite/build/test/gcc-13-defconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241115/testrun/25823358/suite/build/test/gcc-13-defconfig/log
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2osJj2d60yO8ruYvm0gjhi4YHS5/

Steps to reproduce:
------------
- tuxmake --runtime podman --target-arch riscv --toolchain gcc-13
--kconfig defconfig

metadata:
----
  git describe: next-20241115
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2osJj2d60yO8ruYvm0gjhi4YHS5/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2osJj2d60yO8ruYvm0gjhi4YHS5/
  toolchain: clang-19 and gcc-13
  config: lkftconfig
  arch: riscv

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
