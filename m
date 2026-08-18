Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2101AC5DF85
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jGT6Z4idWERRUPP5mwJWPJ9BOeTW40AMxmIyfEWRqpc=; b=V+qlk27yzXm8wj
	km/LjUKpI0xO5VlbdZ8c+SpRi89FxavJE3AKKXBHszF5G6FZpX9nK3jm+dB9bE3e1OoKe1vMg3cbG
	8DoIA2OJz0Ub29lNZWyr+YXf1cxXWsM8J9159QgPfj8RYWA9Xn0fqg0lAxJNHcPN6JPM8imAUnh0Z
	4f+7BBuFKiblS4XkO8Pe9l8B9eB3Kj3VfK1igfQUeIpl/Ik+zdf4/CN9T8bKOaYbyi0U2gSVGYL+E
	KLQBNv/8oqKRajmplQQ2CicyIUApvtmrz/6gjnwcsPblRGGc96CcnJ9Mmllb+Qvs3iR5P9TfIJBNa
	X+e7RCjcQP+rPwt7bqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4kF-0000000Bo3I-3jNZ;
	Thu, 20 Aug 2026 15:31:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4kC-0000000Bo1V-0iNH
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 15:31:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F22DD153B;
	Thu, 20 Aug 2026 08:31:44 -0700 (PDT)
Received: from fedora (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AFEA3F763;
	Thu, 20 Aug 2026 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787239908; bh=SE7+SQCOB6oqaAE0wuDA+ZGR622dOiLN2dcvrAwIA+o=;
	h=From:To:Cc:Subject:Date:From;
	b=UCP6uYrk3v7L+sJmDPNwjvHM7Ke4Cq7H879K7vY1wi1HFXX/bdzj1h8SSRA8TVDCx
	 l7Z7e5iF77mejezmqwdFkccafqa5mh2kL/hBjdzohspCJUZtvrJp7yH7p96Ym9dXb6
	 FXmXWzfLfvbKrrkWguFveeFGAQTkbn621OgLnwCo=
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
Subject: [PATCH v3 0/5] x86: Support shstk via prctl
Date: Tue, 18 Aug 2026 17:54:23 -0500
Message-ID: <20260818225428.1983328-1-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_083152_347759_61267B75 
X-CRM114-Status: GOOD (  11.02  )
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

This is a continuation of adding prctl support for x86:
  - https://patchew.org/linux/20260714154740.140431-1-bill.roberts@arm.com/

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

FWIW X86 Maintaners and Rick, I structured this so you can just pull the bug fixes only
(up to but not including commit "x86/shstk: support via prctl") if you have concerns
on the other patches for me to address, this will allow you to take the bug fixes
and additional test now if desired.

Bill Roberts (5):
  selftests/x86: fix Makefile dependencies
  selftests/x86: fix fork bug
  selftests/x86: add shadow stack lock test
  x86/shstk: support via prctl
  selftests/x86: add generic prctl shadow stack test

 arch/x86/kernel/shstk.c                       |   56 +
 tools/testing/selftests/x86/Makefile          |   12 +-
 tools/testing/selftests/x86/shadow_stack.c    | 1287 +++++++++++++++++
 tools/testing/selftests/x86/shadow_stack.h    |   14 +
 .../testing/selftests/x86/test_shadow_stack.c | 1168 +--------------
 .../selftests/x86/test_shadow_stack_prctl.c   |   12 +
 6 files changed, 1384 insertions(+), 1165 deletions(-)
 create mode 100644 tools/testing/selftests/x86/shadow_stack.c
 create mode 100644 tools/testing/selftests/x86/shadow_stack.h
 create mode 100644 tools/testing/selftests/x86/test_shadow_stack_prctl.c

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
