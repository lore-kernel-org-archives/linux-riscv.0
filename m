Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ED1C282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sNmTqbclr49vqggY6Du2RgAnggZk4uim182Bui0ZVDs=; b=pfO6Z5MBzlzwCJ
	/EUMiGG91S+3DZWJLYeOUvlP9UkLqpEihr2vC3AJcq3D/79YTOo2rVLEgne6hIj9A8tqpwYCBiXmT
	3IrUCeu5b4BbtrWkZV6EJ7anVI2UnYsRjIyFOpqoLZTwukLJdl7tn614g8aZjqlPlHqLsyph9+EyY
	q535Z7w/xgG5/8XJCeFOUzk8tOMKtwNvLbxENnHxrN90cHdlK25PA6bh9OvgER1w5rRGr+i+9WnT5
	+ZZX9fecAkXbQh2aOg3s4FBWlp8ZWLnV1XWzgXv7364lBR5/p1ZW4Y3J8Qzbwp6aniJhGJTbYMadr
	p/bvwlB0o/AYrk5PCdlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshAY-0000000B9D7-2tn2;
	Thu, 13 Mar 2025 11:56:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh0l-0000000B5ni-1hCo
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 11:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vi3vqlZEjhRyke+tn+Q3MD+zw3p/H2XxVRSJ9/S1eBk=;
	b=KgF/4bmKY66ncN8XBXPHgNHbjLtT/e7Bf2dsf6qCfepJyaxq+TnYWtoGHmqdB82wlYnje6
	j4a3lqdu4uHK/NwGkEa+Njcj+LBAA3SqJmoRH6qpLnsm4m7GZkE/2c3XmOXU+6kgkCVvCs
	ePQRMr/3EtXcuSNSc0T5E9JRubgG16M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-rOBRtzAGNrC_bTbfNuzsTg-1; Thu, 13 Mar 2025 07:44:30 -0400
X-MC-Unique: rOBRtzAGNrC_bTbfNuzsTg-1
X-Mimecast-MFC-AGG-ID: rOBRtzAGNrC_bTbfNuzsTg_1741866269
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912539665cso860801f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 04:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866269; x=1742471069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vi3vqlZEjhRyke+tn+Q3MD+zw3p/H2XxVRSJ9/S1eBk=;
        b=tAbkjYtuLr7crzvIcA69oLqmdnLZfeXf+koreFjG5PqsDplqfv4f8dumQF02odFNUB
         p7kyOW4cVPE47uUYX+Gz1ctUWwvFhzQT7FmM6kN3M6DtgGEuOgbAC/JV2wuzLVFnvgRa
         OVgMmIojZkSug+e198NM9FyZg4sjLeUOCRZ55M3CwtT40vI9l88KU1fnKanB5hOJVMos
         qE+/sbTPaz6rhOF4mXwgTS7j1ZRH0WJBnZhI6EGYdQO+k+ayZdUsRwUGXNE/+5yAFJhG
         cP3sbKrjHSgAoSSehY0qEyJlYOaTZ249GColA4hiyagQMBXJS1e28xWMSlXI7/97r6w7
         QDtw==
X-Forwarded-Encrypted: i=1; AJvYcCVJIKd093y2SJh4IVF9XKxleM85c1x+7AZcTrGkzxDzrzkKWyFZ/r6zw4UavmjcrPSd4q5mjx6Mxlhpig==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiOWHNoHwnHPWEDhjt444wJCL2dFckYxJNfK6C4uFpLNdejGcu
	ZwmYwJN339Muf/IDqn7h2oQncnYHQqvdgWYlP/EwQiUMKCf3VFB9AjNFWeTGvsIE+6GQHWTuHnu
	0yRfCj5MZcLAJVK0lvobkAzoJQQQMhxyeBaEZ5gIQ/UdXVyyF6wQMCLAketrXnxYtJA==
X-Gm-Gg: ASbGncvtl2y/rCLfNRtPhdXSGFIC/i5a5HkWGQUNPfKbEfZI2IdZiQjsgoBFgDuyvZS
	b9en5/LJp+b+HSFWx9XWOWxP2kxbIK60MOYQ14wvRs8CARNaabCmbDi2PXHV0WBoiXj4zKf7tku
	6XgxWfUX7HsTcwDQ/P+cjiNyCQDJ/f/IyGtgRbbWlx/KVbf7SXj5vIb7UGhsg6eoWQ6hfINJKu9
	p6LmEwbtagm8F85A0wvPiV/lXTkxSLd/pzbMl5LRRONpyoTMXCSIK/wrgkt05wMjw2ndrr4Umw6
	H6zBTaU6EcCB5U8xLVUr
X-Received: by 2002:a5d:64cb:0:b0:38f:23c4:208c with SMTP id ffacd0b85a97d-395b954ea75mr1784222f8f.18.1741866269089;
        Thu, 13 Mar 2025 04:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5B4S8E4d5tF3TI1rIoUvKO0tSV0G2B0BPE1gxY0qJz2LBrnTYS6FEhx79I2sbOMPQrE3jHw==
X-Received: by 2002:a5d:64cb:0:b0:38f:23c4:208c with SMTP id ffacd0b85a97d-395b954ea75mr1784186f8f.18.1741866268630;
        Thu, 13 Mar 2025 04:44:28 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:27 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
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
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
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
	x86@kernel.org,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 00/14] Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:15 +0000
Message-Id: <20250313114329.284104-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zPRDHoNVUFrzy6JfKplHqFf5WGjx1y_rtPMkLIp4epU_1741866269
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044603_521381_2CF17EF4 
X-CRM114-Status: GOOD (  25.49  )
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

Changes since v3:
- Rebased to v6.14-rc6
- Dropped net: "kunit: Suppress lock warning noise at end of dev_addr_lists tests"
  since 3db3b62955cd6d73afde05a17d7e8e106695c3b9
- Added __kunit_ and KUNIT_ prefixes.
- Tested on interessed architectures.

----
Guenter Roeck (14):
  bug/kunit: Core support for suppressing warning backtraces
  kunit: bug: Count suppressed warning backtraces
  kunit: Add test cases for backtrace warning suppression
  kunit: Add documentation for warning backtrace suppression API
  drm: Suppress intentional warning backtraces in scaling unit tests
  x86: Add support for suppressing warning backtraces
  arm64: Add support for suppressing warning backtraces
  loongarch: Add support for suppressing warning backtraces
  parisc: Add support for suppressing warning backtraces
  s390: Add support for suppressing warning backtraces
  sh: Add support for suppressing warning backtraces
  sh: Move defines needed for suppressing warning backtraces
  riscv: Add support for suppressing warning backtraces
  powerpc: Add support for suppressing warning backtraces

 Documentation/dev-tools/kunit/usage.rst |  30 ++++++-
 arch/arm64/include/asm/asm-bug.h        |  27 ++++--
 arch/arm64/include/asm/bug.h            |   8 +-
 arch/loongarch/include/asm/bug.h        |  42 +++++++---
 arch/parisc/include/asm/bug.h           |  29 +++++--
 arch/powerpc/include/asm/bug.h          |  37 +++++++--
 arch/riscv/include/asm/bug.h            |  38 ++++++---
 arch/s390/include/asm/bug.h             |  17 +++-
 arch/sh/include/asm/bug.h               |  28 ++++++-
 arch/x86/include/asm/bug.h              |  21 +++--
 drivers/gpu/drm/tests/drm_rect_test.c   |  16 ++++
 include/asm-generic/bug.h               |  16 +++-
 include/kunit/bug.h                     |  56 +++++++++++++
 include/kunit/test.h                    |   1 +
 include/linux/bug.h                     |  13 +++
 lib/bug.c                               |  51 +++++++++++-
 lib/kunit/Kconfig                       |   9 ++
 lib/kunit/Makefile                      |   7 +-
 lib/kunit/backtrace-suppression-test.c  | 104 ++++++++++++++++++++++++
 lib/kunit/bug.c                         |  42 ++++++++++
 20 files changed, 519 insertions(+), 73 deletions(-)
 create mode 100644 include/kunit/bug.h
 create mode 100644 lib/kunit/backtrace-suppression-test.c
 create mode 100644 lib/kunit/bug.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
