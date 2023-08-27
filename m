Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5774C83F10
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 10:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U6SeAnbe4X6werBL1yNlzDM6qmxbsF3UPixMCOOjIvw=; b=a3XpaLvJepliqQ
	aYhZi4r+I1HERM0aAFxC6rXCVrnaqiz1jdGVD3CxMkRaAezchaSzahZkP0dFomCZ4lDPdbbijVS4h
	g7L5kO93sSWblEGpPswb1U3wR5kwLaG34OWVlPxM7zDqPreBRqNHpk4qaohyUXaXsws1AJPnwh8RW
	QEMAhYldrlW+DSHzeFslMFwYee8PXalLW0kcc8Z2Ask3W4WJxqgjqzxlufYK85mTQRhkWs8l625A6
	1woIPzKyzaNXKUGs3c2QQBm3xE39JuYENhXPE5L7EsX8O8ncXvppJA9p++zQJDVWNVH4Wcj8vDYeL
	88yIvE6zAJyujou4quNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCkI-007oQq-1i;
	Sun, 27 Aug 2023 10:11:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCkE-007oJC-0F
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 10:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693131100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fg4otpgPmKt9KaByfspMaEC8zG3oBR6gcXrny0pY4kM=;
	b=cwmCmVj62bzxRM290Fvc8YekKHrcPFL0REPOD1uS7p761UhxWNoxebzTHgWzzyvjq0nFYQ
	dbAK5lYva+dsCEXTfaaQ+lA47Bw58wRruTYNk4PbCBvYTjegrLSM4lPSvNyD3lziQ3OHvf
	ib9goopm0w+poJyFhPLIR1UltSxnq0Q=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-5aQtTWKvOGW19Ky3V7f6fg-1; Sun, 27 Aug 2023 06:11:36 -0400
X-MC-Unique: 5aQtTWKvOGW19Ky3V7f6fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD2553806631;
	Sun, 27 Aug 2023 10:11:35 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E5EE2166B25;
	Sun, 27 Aug 2023 10:11:31 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	thunder.leizhen@huawei.com,
	dyoung@redhat.com,
	prudo@redhat.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 0/8] kdump: use generic functions to simplify crashkernel reservation in architectures
Date: Sun, 27 Aug 2023 18:11:19 +0800
Message-ID: <20230827101128.70931-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_031146_214792_DC55B042 
X-CRM114-Status: GOOD (  14.18  )
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

In the current arm64, crashkernel=,high support has been finished after
several rounds of posting and careful reviewing. The code in arm64 which
parses crashkernel kernel parameters firstly, then reserve memory can be
a good example for other ARCH to refer to.

Whereas in x86_64, the code mixing crashkernel parameter parsing and
memory reserving is twisted, and looks messy. Refactoring the code to
make it more readable maintainable is necessary.

Here, firstly abstract the crashkernel parameter parsing code into
parse_crashkernel() to make it be able to parse crashkernel=,high|low.
Then abstract the crashkernel memory reserving code into a generic
function reserve_crashkernel_generic(). Finally, in ARCH which
crashkernel=,high support is needed, a simple arch_reserve_crashkernel()
can be added to call above two functions. This can remove the duplicated
implmentation code in each ARCH, like arm64, x86_64.

I only change the arm64 and x86_64 implementation to make use of the
generic functions to simplify code. Risc-v can be done very easily refer
to the steps in arm64 and x86_64.

History:
- RFC patchset:
  https://lore.kernel.org/all/20230619055951.45620-1-bhe@redhat.com/T/#u
  [RFC PATCH 0/4] kdump: add generic functions to simplify crashkernel crashkernel in architecture
  Dave and Philipp commented the old parse_crashkernel_common() and
  parse_crashkernel_generic() are quite confusing. In this formal post,
  I made change to address the concern by unifying all crashkernel
  parsing into parse_crashkernel().

Baoquan He (8):
  crash_core.c: remove unnecessary parameter of function
  crash_core: change the prototype of function parse_crashkernel()
  include/linux/kexec.h: move down crash_core.h including
  crash_core: change parse_crashkernel() to support
    crashkernel=,high|low parsing
  crash_core: add generic function to do reservation
  arm64: kdump: use generic interface to simplify crashkernel
    reservation
  x86: kdump: use generic interface to simplify crashkernel reservation
    code
  crash_core.c: remove unneeded functions

 arch/arm/kernel/setup.c              |   3 +-
 arch/arm64/Kconfig                   |   3 +
 arch/arm64/include/asm/kexec.h       |   5 +
 arch/arm64/mm/init.c                 | 140 ++--------------------
 arch/ia64/kernel/setup.c             |   2 +-
 arch/loongarch/kernel/setup.c        |   4 +-
 arch/mips/kernel/setup.c             |   3 +-
 arch/powerpc/kernel/fadump.c         |   2 +-
 arch/powerpc/kexec/core.c            |   2 +-
 arch/powerpc/mm/nohash/kaslr_booke.c |   2 +-
 arch/riscv/mm/init.c                 |   2 +-
 arch/s390/kernel/setup.c             |   4 +-
 arch/sh/kernel/machine_kexec.c       |   2 +-
 arch/x86/Kconfig                     |   3 +
 arch/x86/include/asm/kexec.h         |  32 +++++
 arch/x86/kernel/setup.c              | 143 +++-------------------
 include/linux/crash_core.h           |  35 +++++-
 include/linux/kexec.h                |  14 +--
 kernel/crash_core.c                  | 170 +++++++++++++++++++++++----
 19 files changed, 266 insertions(+), 305 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
