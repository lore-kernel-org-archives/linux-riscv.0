Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5AFC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 22:38:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54B24619E8
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 22:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54B24619E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mdyaH2ytpKA9uLMUbGA1VsRqjD2snpWosGuCgNcwMx0=; b=QiHNdJYsKT5WlJd50+++NfiOWC
	4lzQP0zx4aw76lxoeCeZSvSbhhDZDBJSQ95r6GXExrD6lSn00QP2I6OmPtQrZESMpEBBftJSInFzL
	+Rvc4ENQs1p4reD6HIhu0Yt7A4V+ta7ek7Uzxlf+YzMtdlEqhl8N1EZAso3YFeyr+6kgX/iYj928a
	hd7zO0GIsqX4LKF6AdkcQ7TJ1/GJxFWDOSopX638N19tck92T7UdaTfBbFdIK7pWoImHN1yy1OYLJ
	E8vgXaNzpk72Yrk9fF3nQK9Y6sOwufdn4LcSb9u37WZ7oh+ymUoIUd3HMkudsO0tsRgPMSiiWspk0
	F77O2uDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPYca-002IJT-F6; Thu, 25 Mar 2021 22:38:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPYcT-002IIS-H2
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 22:38:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A0E661A3A;
 Thu, 25 Mar 2021 22:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616711903;
 bh=avDQo70jyLVlZwplCA1vAeUbTnOiqdYs1TebXaMbdnk=;
 h=From:To:Cc:Subject:Date:From;
 b=S9zGop5FjZn0ne2gCJwrwMtDLLIYkiq8kLKss27x/99AaEHni1Egu9OsrFnk1oYlW
 upcWJa0o1ND8d0wQMk/d2R+b/aHfaIyNx/EPxCCRvuUDcyoknG1J4fiIAmmp9oXaug
 1k3bJ8WX8fMnFNZbQkLBCgsZPUNAjerJYkjh6CKaO08AKDCPxR/ikmfV/AH4fY34CJ
 JIiY9E/4imdjpWxyifhuP501yGsz1kzVOrGVnK7wmwLQUbPgjzIuwZr7Nu80BB48Zv
 TBxF+yV+tOndA50w8A7Th4MOuydCuZECihgqjFt2B3OHzESRUZwmiV1vzYOQCe//4C
 o6vInuThyjQ4A==
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] Fix CONFIG_FUNCTION_TRACER with clang
Date: Thu, 25 Mar 2021 15:38:04 -0700
Message-Id: <20210325223807.2423265-1-nathan@kernel.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_223825_857126_DEC142CF 
X-CRM114-Status: GOOD (  11.91  )
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

Hi all,

This series fixes function tracing with clang.

Patch 1 adjusts the mcount regex in scripts/recordmcount.pl to handle
the presence of PLT relocations, which happen with clang. Without this,
the mcount_loc section will not be created properly.

Patch 2 adds a workaround for clang less than 13.0.0 in relation to the
mcount symbol name, which was "mcount" rather than "_mcount". This was
written as a separate patch so that it can be reverted when the minimum
clang version is bumped to clang 13.0.0.

Patch 3 avoids a build error when -fpatchable-function-entry is not
available, which is the case with clang less than 13.0.0. This will make
dynamic ftrace unavailable but all of the other function tracing should
work due to the prescence of the previous patch.

I am hoping this series can go in as fixes for 5.12, due to patch 3, but
if not, they can always be backported (patches 1 and 2 are already
marked for stable).

This series has been build tested with gcc-8 through gcc-10 and clang-11
through clang-13 with defconfig and nommu_virt_defconfig plus
CONFIG_FTRACE=y and CONFIG_FUNCTION_TRACER=y then boot tested under
QEMU.

Cheers,
Nathan

Nathan Chancellor (3):
  scripts/recordmcount.pl: Fix RISC-V regex for clang
  riscv: Workaround mcount name prior to clang-13
  riscv: Select HAVE_DYNAMIC_FTRACE when -fpatchable-function-entry is
    available

 arch/riscv/Kconfig              |  2 +-
 arch/riscv/include/asm/ftrace.h | 14 ++++++++++++--
 arch/riscv/kernel/mcount.S      | 10 +++++-----
 scripts/recordmcount.pl         |  2 +-
 4 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.31.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
