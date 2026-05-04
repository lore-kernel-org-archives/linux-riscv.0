Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F8CFF885A
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 07:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q0VYkoJ1+HYayAjhBrpfv/mzX+Xt2QQoLQBNljAtZDU=; b=nOl+GsD++1GhNU
	XwYnVS4v3IbSdo8rmTD7dNe1Bspjl4+MZmgt3TZK3O8rzUanO+lFCO3OutSdjeXHMrk+IKWBWB+TI
	68uUp9oVIRmS5OTWLxTtxqSE7foCTmRaNbryYOdX9FKmuthqEOsWDhRI/ZpinlrrA+SLfpwkqDPVG
	jKhlVsw/eYyl5k1V4JMIxqM9BkNLedZVQu/Qzyrp8bML0avi6HekPAq5lnraVWtwxMlW6k2GcKwDg
	Xa/nCe57GyCgYyZIHxn+ziPvra5GqcXo3KxUT4QB3hizxxNVfn6TV44M3x/pho7JDd8YauWOa5BiT
	+BKeT+vj63KHLXLqOCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnwc-0000000Cd9S-2SfJ;
	Mon, 04 May 2026 07:42:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnwY-0000000Cd8i-3rbw
	for linux-riscv@bombadil.infradead.org;
	Mon, 04 May 2026 07:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=vf+HSG6lzyoZZtZMHsZSQKiJNNXRlnzisj4czBT4HTQ=; b=BN7fIgnWOj/JSk3gsE3F6jMyUX
	6JpBmOKeJDedj5BxXYdlWpfpqYimHmaQAxmAkVfaklvmjTgt/nNx+0Vf9vImjDUYVfv5RSbN5uwYt
	jewLv1Wg405ZrqkLdQA+Wxoytf9NsRvoV11G7xKCQ7OzeGDcwXAJ6Sknvf/XLap+cuCTZS41sXlE4
	MierDo4xFOcLfQ3kDJSQ1AZDs8Q7Xhd+8BUPrJAWYYKrVT+jRREXD38eK9sx/ng2PkDJnwz0p5zyI
	daQwRreFKjzBKAi9zv2Kg5i2dZOtiE47dPHakStWtSxfLP/aDQ7bY0c/h+kbQN0+RHgwbtFNfddDr
	WyIw//Ww==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnwG-0000000B3qj-2FKp
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 07:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777880510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vf+HSG6lzyoZZtZMHsZSQKiJNNXRlnzisj4czBT4HTQ=;
	b=Q9ALEUy23FSnY5wPTMRMMCt2aUHC8WxPE5o8Q28hpC+F3GuRZwjrG7HD1cwg8Yql71mKuT
	eu+v0UHpixoA1xVGZAyrcq0EueolvoRKJSIYbo5tnrmM6R+2AeUI5Rw5AXY+vVQEI9x3ku
	oXpyA6M/AfHJELoGvubQGLYm0U3CmUI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777880519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vf+HSG6lzyoZZtZMHsZSQKiJNNXRlnzisj4czBT4HTQ=;
	b=hGsXT0e7TNpOUlHRQrYWY5Yxn1dCdEVxd2DNRg4nDbRQHseVsbdApwoCSXSPPnMo1Ci1P+
	hHIDg61N9zjy+iNIdqwqHAMkb9lLJQ4uAKE6UR0974JKG4mtZkL6VgG45DbFP5vMLdIb/R
	pzLxG+aV/Fh7lkCyUdKu7kPv9O873f0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-294-fWzwJPGLNlyG0PRMA6RgKQ-1; Mon,
 04 May 2026 03:41:45 -0400
X-MC-Unique: fWzwJPGLNlyG0PRMA6RgKQ-1
X-Mimecast-MFC-AGG-ID: fWzwJPGLNlyG0PRMA6RgKQ_1777880501
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3163019560A2;
	Mon,  4 May 2026 07:41:40 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4661F196B09E;
	Mon,  4 May 2026 07:41:30 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v8 0/4] kunit: Add support for suppressing warning
 backtraces
Date: Mon, 04 May 2026 09:41:24 +0200
Message-Id: <20260504-kunit_add_support-v8-0-3e5957cdd235@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OQWrDMBCF4asErasgjSvJzSr3CCXInlEtii0zU
 kxL8N0jB0JayPIt3sd/FZk4UhaH3VUwLTHHNNXRvu1EP/jpi2TEugUosKrRIL8vUyxnj3jOl3l
 OXCSExrTKdvoDUdTfzBTiz908fdYdOI2yDEz+IRllwOoGnDF7ba02Smrpe89jnPyRCQdf9n0aN
 22IuST+vQcudjMfLe5Fy2KlkogAnromkMG/2hazuCfxDuoV4SpBbddbUsEppH/Euq43F/Z98jQ
 BAAA=
X-Change-ID: 20260312-kunit_add_support-2f35806b19dd
To: Arnd Bergmann <arnd@arndb.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>, 
 Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>, 
 Albert Esteve <aesteve@redhat.com>, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Kees Cook <kees@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
 David Gow <david@davidgow.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777880489; l=8271;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=erQ03JI6SrYNARYzJm/2YyqhpgwzdnxG5DBrDpElEWU=;
 b=sRhx6zDxIpD2+MuE6WZxU4Js3eoJAjGupZqFb9sxdUwpsUl5/zr/vMWNqqMrR2uKILugzru4S
 YgboAAiARnzBzA1KOoiHKSgz2t026tsMDNKbC89v/UVnVosPp8ozEtB
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: fgOvmt67r3Xu5rBW5LEhqfTbUnhhsysW1gXIHzdRcFk_1777880501
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_084204_755008_499718DF 
X-CRM114-Status: GOOD (  24.90  )
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
nor useful for a number of reasons:
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address the problem would be to add messages such as
"expected warning backtraces start/end here" to the kernel log.
However, that would again require filter scripts, might result in
missing real problematic warning backtraces triggered while the test
is running, and the irrelevant backtrace(s) would still clog the
kernel log.

Solve the problem by providing a means to suppress warning backtraces
originating from the current kthread while executing test code.
Since each KUnit test runs in its own kthread, this effectively scopes
suppression to the test that enabled it, without requiring any
architecture-specific code.

Overview:
Patch#1 Introduces the suppression infrastructure integrated into
        KUnit's hook mechanism.
Patch#2 Adds selftests to validate the functionality.
Patch#3 Demonstrates real-world usage in the DRM subsystem.
Patch#4 Documents the new API and usage guidelines.

Design Notes:
Suppression is integrated into the existing KUnit hooks infrastructure,
reusing the kunit_running static branch for zero overhead
when no tests are running. The implementation lives entirely in the
kunit module; only a static-inline wrapper and a function pointer
slot are added to built-in code.

Suppression is checked at three points in the warning path:
- In `warn_slowpath_fmt()` (kernel/panic.c), for architectures without
  __WARN_FLAGS. The check runs before any output, fully suppressing
  both message and backtrace.
- In `__warn_printk()` (kernel/panic.c), for architectures that define
  __WARN_FLAGS but not their own __WARN_printf (arm64, loongarch,
  parisc, powerpc, riscv, sh). The check suppresses the warning message
  text that is printed before the trap enters __report_bug().
- In `__report_bug()` (lib/bug.c), for architectures that define
  __WARN_FLAGS. The check runs before `__warn()` is called, suppressing
  the backtrace and stack dump. 

To avoid double-counting on architectures where both `__warn_printk()`
and `__report_bug()` run for the same warning, the hook takes a bool
parameter: true to increment the suppression counter, false to suppress
without counting.

The suppression state is dynamically allocated via kunit_kzalloc() and
tied to the KUnit test lifecycle via `kunit_add_action()`, ensuring
automatic cleanup at test exit. Writer-side access to the global
suppression list is serialized with a spinlock; readers use RCU.

Three API forms are provided:
- kunit_warning_suppress(test) { ... }: scoped blocks with automatic
  cleanup. The suppression handle is not accessible outside the block,
  so warning counts (if needed) must be checked inside. Multiple
  suppression blocks are allowed.
- KUNIT_START/END_SUPPRESSED_WARNING(test): manual macros for larger
  blocks or post-suppression count checks. Limited to one pair per
  scope.
- kunit_start/end_suppress_warning(test): direct functions that return
  an explicit handle. Use when the handle needs to be retained, or passed
  across helpers. Multiple suppression blocks are allowed.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

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

Changes since v4:
- Rebased to v6.15-rc7
- Dropped all code in __report_bug()
- Moved all checks in WARN*() macros.
- Dropped all architecture specific code.
- Made __kunit_is_suppressed_warning nice to noinstr functions.

Changes since v5:
- Rebased to v7.0-rc3
- Added RCU protection for the suppressed warnings list.
- Added static key and branching optimization.
- Removed custom `strcmp` implementation and reworked
  __kunit_is_suppressed_warning() entrypoint function.

Changes since v6:
- Moved suppression checks from WARN*() macros to warn_slowpath_fmt()
  and __report_bug().
- Replaced stack-allocated suppression struct with kunit_kzalloc() heap
  allocation tied to the KUnit test lifecycle.
- Changed suppression strategy from function-name matching to task-scoped:
  all warnings on the current task are suppressed between START and END,
  rather than only warnings originating from a specific named function.
- Simplified macro API: removed KUNIT_DECLARE_SUPPRESSED_WARNING(),
  the START macro now takes (test) and handles allocation internally.
- Removed static key and branching optiomization, as by the time it
  was executed, callers are already in warn slowpaths.
- Link to v6: https://lore.kernel.org/r/20260317-kunit_add_support-v6-0-dd22aeb3fe5d@redhat.com

Changes since v7:
- Integrated suppression into existing KUnit hooks infrastructure
- Removed CONFIG_KUNIT_SUPPRESS_BACKTRACE
- Added suppression check in __warn_printk()
- Added spinlock for writer-side RCU protection
- Replaced explicit rcu_read_lock/unlock with guard(rcu)()
- Added scoped API (kunit_warning_suppress) using __cleanup attribute
- Updated DRM patch to use scoped API
- Expanded self-tests: incremental counting, cross-kthread isolation
- Rewrote documentation covering all three API forms with examples
- Link to v7: https://lore.kernel.org/r/20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com

--
2.34.1

---
Alessandro Carminati (1):
      bug/kunit: Core support for suppressing warning backtraces

Guenter Roeck (3):
      kunit: Add backtrace suppression self-tests
      drm: Suppress intentional warning backtraces in scaling unit tests
      kunit: Add documentation for warning backtrace suppression API

 Documentation/dev-tools/kunit/usage.rst |  63 ++++++++++-
 drivers/gpu/drm/tests/drm_rect_test.c   |  23 +++-
 include/kunit/test-bug.h                |  25 +++++
 include/kunit/test.h                    | 138 ++++++++++++++++++++++++
 kernel/panic.c                          |  15 ++-
 lib/bug.c                               |  10 ++
 lib/kunit/Makefile                      |   4 +-
 lib/kunit/backtrace-suppression-test.c  | 184 ++++++++++++++++++++++++++++++++
 lib/kunit/bug.c                         | 115 ++++++++++++++++++++
 lib/kunit/hooks-impl.h                  |   2 +
 10 files changed, 571 insertions(+), 8 deletions(-)
---
base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
change-id: 20260312-kunit_add_support-2f35806b19dd

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
