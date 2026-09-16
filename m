Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C45C982C1
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 19:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LAGlEG3RT1Nc9ttjmHVkwJNgscLkAsLpMOZ0XJGPoYA=; b=ZjTcETOlCac9XA
	v2ze2EHKkwgsyPCnZwxEMPg0r+YAM4/Xakkkn2vn2mP1BShealBcuh+ZdxYUBQr7JIyHpWXUSnluj
	AozEzTLKOkNsS8jfF3mWkJ5YNs9fA4J6ISGN4/WyPyJmAJQoRK8Za5Wfepbx9i3G1Cy3kytZv5yvG
	v8CSg3zzjW0f32a9L4rWQO2+cq5ysx5BtxMFx1Xb4afL6Ep9LvcX3pNjvGsYypbd22Ae03p20FaKR
	AZTMRCdXrPxX9pyWTlyuMZbZewqJ/N+KQcI9l84lb2vgcIwUOIC8uQlhWtLflEWR83mo/ounFeVyH
	mhHbpImK3s9Yl0OyUygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoU-00000007qwo-2obB;
	Tue, 15 Sep 2026 19:27:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoS-00000007qva-0QZl
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 19:27:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0846E152B;
	Tue, 15 Sep 2026 12:27:23 -0700 (PDT)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.150.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E6233F7B4;
	Tue, 15 Sep 2026 12:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789500446; bh=SERxyWYD022WZHuV/yT5Rq6DmPEtRTzqUEfVTjwzJkA=;
	h=From:To:Cc:Subject:Date:From;
	b=rqD4xt3etJOFtBmB9JtcZ+IA2lcH52ghXFJRrRk2ZigGVebq73VK+kzoxNkwMMqu8
	 JBW1z9ooL6eEWS2TR05pg5R1KZEsJeO0r/Xx/8EddnvvzZzEj6STm0LnFOA2bkqj0q
	 OGgGc/K2VQbX2SgSLZ8LPJdhJM35lw7r2ompn/ig=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	rick.p.edgecombe@intel.com,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH v4 0/6] 
Date: Wed, 16 Sep 2026 04:52:18 -0500
Message-ID: <20260916095224.1533971-1-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_122728_188904_636837D6 
X-CRM114-Status: GOOD (  10.79  )
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

This is a continuation of:
  - https://lore.kernel.org/all/20260818225428.1983328-1-bill.roberts@arm.com/

FWIW X86 Maintaners and Rick, I structured this so you can just pull the bug fixes only
(up to but not including commit "x86/shstk: support via prctl") if you have concerns
on the other patches for me to address, this will allow you to take the bug fixes
and additional test now if desired.

History:
  - v1: Initial Patches
  - v2: Nacked by author
    - Refactors the test suite
  - v3:
    - Fixes an existing fork bug pointed out by Shashiko
    - Fixes a state rollback issue in the patch itself
    - Fixes Makefile dependencies
    - Add's a test for shadow stack state locking
    - Refactors the arch_prctl and prctl tests into two different files using
      a shared testing suite file
  - v4:
    - fix rollback state logic


Bill Roberts (6):
  selftests/x86: fix Makefile dependencies
  selftests/x86: fix fork bug
  selftests/x86: add shadow stack lock test
  x86/shstk: support via prctl
  selftests/x86: support header files in extra-files
  selftests/x86: add generic prctl shadow stack test

 arch/x86/kernel/shstk.c                       |   83 ++
 tools/testing/selftests/x86/Makefile          |   13 +-
 tools/testing/selftests/x86/shadow_stack.c    | 1287 +++++++++++++++++
 tools/testing/selftests/x86/shadow_stack.h    |   14 +
 .../testing/selftests/x86/test_shadow_stack.c | 1168 +--------------
 .../selftests/x86/test_shadow_stack_prctl.c   |   12 +
 6 files changed, 1411 insertions(+), 1166 deletions(-)
 create mode 100644 tools/testing/selftests/x86/shadow_stack.c
 create mode 100644 tools/testing/selftests/x86/shadow_stack.h
 create mode 100644 tools/testing/selftests/x86/test_shadow_stack_prctl.c

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
