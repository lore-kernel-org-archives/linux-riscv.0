Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09BFCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zodcg/VMBwejW8Cz3NQ6/6bshztxMirBZB+/O0RZiAs=; b=HNpNR1AjitYHcj
	xWIKdUWSm/4AWLPbSC+Fh+0TD/LZ/iSk+GPKjMdaUzwI4utCS3ObZR73h+dZraF+nAzK1+4ROwpsL
	I0b70p8re3/F7oe9U2xHO5djVPY+hPG5w05qrwAM2xJHnd7T5RUgRniHiYBfcFg5FkyNknSdwAvFT
	LxE6Bk1fGpR2myw9/+QYrRMLQp362QziY2th+LYmMg9OKAK7bPLySQYFAgaF3a5sWG6pR7ch+5xd2
	qR+nBhA/puGBuODOKZZllAF4TTal00n2ajU05fegl2LligGfSO3A3gJIbfr2nattTmInQzCn+xGRV
	ap1C7JfmnWGgBuAuov0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0Wq-0000000G8T2-1MPX;
	Wed, 03 Apr 2024 13:19:48 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0Wm-0000000G8Qy-0Woy;
	Wed, 03 Apr 2024 13:19:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so3544713a12.0;
        Wed, 03 Apr 2024 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150381; x=1712755181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5jeOyVY2AHqhv0KvV6kieVXey6Da3SBwUwdCTK976WY=;
        b=gStypI49dWWj4ApvHboc8ned+mafRtvkwao8BFcR1uq65+engdQFZXYZbaA7eVPNJG
         kCDKxeahEp7uLrILHX9uJIefC5tWry+nfS7gqnvx8hE29hnD7fenAdWyDFpvGWQWOa4Y
         Ax8zuwLjB5kG9vB8OaOp4RHmshpOafO78q+30FW0vX9RGI2qttyJBpWLoAZVYmvBhzuS
         LX+ePjbcFuPT5dv3323iP3lucRwxZX5UE5474jtT05SCofYkfCzd2m5ioAF+1OIBUfcO
         5xiJtA+VOVnE/FZB62g/iGXrwuZmHzY3vTOqY8aVukdQdY0W8En+NTByul7pSmv6D9gW
         8YLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150381; x=1712755181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jeOyVY2AHqhv0KvV6kieVXey6Da3SBwUwdCTK976WY=;
        b=sOnlYPd7gv/c1Jrd5N2Z3+8aEVoOOdTkwSoNOiUcpPmL7Odc58C8Zv+8e8803lCB7T
         FvF2fus59/hrvBCaq9jmQipXxaVXrUN0La8iVDIN4a5ZrLiMiBfpNJs1etxnajhZA7QK
         zab09j+tDOP6eNDvamOBvb4foLOovhBFW73u0DKg9MrArI359px5412eD8YOmLVvxmTf
         eq4kOOMnVO6yrcoB9zLndTsr3upEAs+ihPvs5LHf7p1NUGtemvtH+osclF0fq7srgdO2
         ydVO64dj7nKpJREYqVTvg04U+cYSRIUWgAaATtXsd6+lZf67qeLxpBp+oZM84f8zsqnz
         qeUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4Cj/vYS7KeV+voSh3abkN7ZAo6SMKXgnK/w3a36+WvgPvJ4ZbNpdvhU+opaoZGx9Nflb/fX8hXwB19dHZMpznWI85ZFQkPTvLJNcdp0nIGu9RB3GBUenqlgwvdPySm+0OWHovVMXKmU8881ragyZjsVF0qqo=
X-Gm-Message-State: AOJu0Ywweuo128PTeHIDkuw2g/y3CYeuhBfIN8yXhVhuchC2ARyrZiLD
	SZxYS95+4a5MviLV/A0rXkNdlfJxzQGPtTo9zbu272P2C6nlNkgf
X-Google-Smtp-Source: AGHT+IGUUHIUOOsCxCF/TsSf8IWxMRQa7fBTBtgLaZOyDBRCO0Z9+JW6g9cTcLQ9TLR427e8GbHcQA==
X-Received: by 2002:a17:902:f68b:b0:1e2:8ec0:90c4 with SMTP id l11-20020a170902f68b00b001e28ec090c4mr2621403plg.2.1712150381396;
        Wed, 03 Apr 2024 06:19:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p2-20020a170902780200b001e00e17c6e2sm13430178pll.138.2024.04.03.06.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:40 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	x86@kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 00/15] Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:21 -0700
Message-Id: <20240403131936.787234-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_061944_204092_D9748500 
X-CRM114-Status: GOOD (  25.38  )
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

Some unit tests intentionally trigger warning backtraces by passing bad
parameters to kernel API functions. Such unit tests typically check the
return value from such calls, not the existence of the warning backtrace.

Such intentionally generated warning backtraces are neither desirable
nor useful for a number of reasons.
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad-hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address problem would be to add messages such as "expected
warning backtraces start / end here" to the kernel log.  However, that
would again require filter scripts, it might result in missing real
problematic warning backtraces triggered while the test is running, and
the irrelevant backtrace(s) would still clog the kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code. Support suppressing multiple
backtraces while at the same time limiting changes to generic code to the
absolute minimum. Architecture specific changes are kept at minimum by
retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
CONFIG_KUNIT are enabled.

The first patch of the series introduces the necessary infrastructure.
The second patch introduces support for counting suppressed backtraces.
This capability is used in patch three to implement unit tests.
Patch four documents the new API.
The next two patches add support for suppressing backtraces in drm_rect
and dev_addr_lists unit tests. These patches are intended to serve as
examples for the use of the functionality introduced with this series.
The remaining patches implement the necessary changes for all
architectures with GENERIC_BUG support.

With CONFIG_KUNIT enabled, image size increase with this series applied is
approximately 1%. The image size increase (and with it the functionality
introduced by this series) can be avoided by disabling
CONFIG_KUNIT_SUPPRESS_BACKTRACE.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Design note:
  Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT_SUPPRESS_BACKTRACE and CONFIG_DEBUG_BUGVERBOSE are enabled
  to avoid image size increases if CONFIG_KUNIT is disabled. There would be
  some benefits to adding those pointers all the time (reduced complexity,
  ability to display function names in BUG/WARNING messages). That change,
  if desired, can be made later.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

Changes since RFC:
- Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests

Changes since v1:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
  [I retained those tags since there have been no functional changes]
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
  default.

Changes since v2:
- Rebased to v6.9-rc2
- Added comments to drm warning suppression explaining why it is needed.
- Added patch to move conditional code in arch/sh/include/asm/bug.h
  to avoid kerneldoc warning
- Added architecture maintainers to Cc: for architecture specific patches
- No functional changes

----------------------------------------------------------------
Guenter Roeck (15):
      bug/kunit: Core support for suppressing warning backtraces
      kunit: bug: Count suppressed warning backtraces
      kunit: Add test cases for backtrace warning suppression
      kunit: Add documentation for warning backtrace suppression API
      drm: Suppress intentional warning backtraces in scaling unit tests
      net: kunit: Suppress lock warning noise at end of dev_addr_lists tests
      x86: Add support for suppressing warning backtraces
      arm64: Add support for suppressing warning backtraces
      loongarch: Add support for suppressing warning backtraces
      parisc: Add support for suppressing warning backtraces
      s390: Add support for suppressing warning backtraces
      sh: Add support for suppressing warning backtraces
      sh: Move defines needed for suppressing warning backtraces
      riscv: Add support for suppressing warning backtraces
      powerpc: Add support for suppressing warning backtraces

 Documentation/dev-tools/kunit/usage.rst |  30 ++++++++-
 arch/arm64/include/asm/asm-bug.h        |  29 ++++++---
 arch/arm64/include/asm/bug.h            |   8 ++-
 arch/loongarch/include/asm/bug.h        |  38 ++++++++----
 arch/parisc/include/asm/bug.h           |  29 ++++++---
 arch/powerpc/include/asm/bug.h          |  37 +++++++++---
 arch/riscv/include/asm/bug.h            |  38 ++++++++----
 arch/s390/include/asm/bug.h             |  17 +++++-
 arch/sh/include/asm/bug.h               |  28 +++++++--
 arch/x86/include/asm/bug.h              |  21 +++++--
 drivers/gpu/drm/tests/drm_rect_test.c   |  16 +++++
 include/asm-generic/bug.h               |  16 ++++-
 include/kunit/bug.h                     |  56 +++++++++++++++++
 include/kunit/test.h                    |   1 +
 include/linux/bug.h                     |  13 ++++
 lib/bug.c                               |  51 ++++++++++++++--
 lib/kunit/Kconfig                       |   9 +++
 lib/kunit/Makefile                      |   7 ++-
 lib/kunit/backtrace-suppression-test.c  | 104 ++++++++++++++++++++++++++++++++
 lib/kunit/bug.c                         |  42 +++++++++++++
 net/core/dev_addr_lists_test.c          |   6 ++
 21 files changed, 524 insertions(+), 72 deletions(-)
 create mode 100644 include/kunit/bug.h
 create mode 100644 lib/kunit/backtrace-suppression-test.c
 create mode 100644 lib/kunit/bug.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
