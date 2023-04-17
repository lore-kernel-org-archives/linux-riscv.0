Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3A7C77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 18:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ibp2JFkxFV17S2kDiGha9R93HaQ89r8T2PGsXhxJx5A=; b=rEbuDqWgVeXDtw
	ialg8fWBxX3GGgrXyS0maCkuIsXBXOE6m/mut6CgCWAR614d3+N1GB0uKGo6JIuZLwmQ+5x61CgJw
	IQS2/D110274yia5bRRIv8DKnPmOYmCvTH4nQzVI8OfkYFE6J5Lbp+vYVXfawzJJPtbheLkVbcZsu
	SpUnpWKDDaKGax1WLXc43oQ7c/8GP8Ye1gElvQFv/wPM4yVhjvCrLayM1gaUvvFkW9d2hqiiLv1JE
	WW+vdJCsQ6BNLUv9zlsqdUd0eSl+MGNVOEWdA1zNmIy7V+hUImVnZb7hU4EQB38CmxRvh5O2HHGLm
	TyTEGJwdEPBMpudaRgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poTOU-00HIds-0E;
	Mon, 17 Apr 2023 18:16:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poTOQ-00HIcA-19;
	Mon, 17 Apr 2023 18:16:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8083F4B3;
	Mon, 17 Apr 2023 11:16:35 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CD3BA3F5A1;
	Mon, 17 Apr 2023 11:15:50 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	linux-riscv@lists.infradead.org,
	Radu Rendec <rrendec@redhat.com>
Subject: [GIT PULL] cacheinfo/arch_topology: Updates for v6.4
Date: Mon, 17 Apr 2023 19:15:40 +0100
Message-Id: <20230417181540.1926349-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_111558_446766_F692141B 
X-CRM114-Status: GOOD (  12.80  )
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

Hi Greg,

Couple of the patches are fixes but I wanted them to be in the next for some
time to get better testing. Few others are addressing issues in RT kernel.

Please pull !

Regards,
Sudeep

-->8

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/cacheinfo-updates-6.4

for you to fetch changes up to ef9f643a9f8b62bcbcc51f0e0af8599adc2e17ed:

  cacheinfo: Add use_arch[|_cache]_info field/function (2023-04-14 10:13:39 +0100)

----------------------------------------------------------------
cacheinfo and arch_topology updates for v6.4

The cache information can be extracted from either a Device Tree(DT),
the PPTT ACPI table, or arch registers (clidr_el1 for arm64).

When the DT is used but no cache properties are advertised, the current
code doesn't correctly fallback to using arch information. The changes
fixes the same and also assuse the that L1 data/instruction caches
are private and L2/higher caches are shared when the cache information
is missing in DT/ACPI and is derived form clidr_el1/arch registers.

Currently the cacheinfo is built from the primary CPU prior to secondary
CPUs boot, if the DT/ACPI description contains cache information.
However, if not present, it still reverts to the old behavior, which
allocates the cacheinfo memory on each secondary CPUs which causes
RT kernels to triggers a "BUG: sleeping function called from invalid
context".

The changes here attempts to enable automatic detection for RT kernels
when no DT/ACPI cache information is available, by pre-allocating
cacheinfo memory on the primary CPU.

----------------------------------------------------------------
Pierre Gondois (4):
      cacheinfo: Check sib_leaf in cache_leaves_are_shared()
      cacheinfo: Check cache properties are present in DT
      arch_topology: Remove early cacheinfo error message if -ENOENT
      cacheinfo: Add use_arch[|_cache]_info field/function

Radu Rendec (3):
      cacheinfo: Add arch specific early level initializer
      cacheinfo: Add arm64 early level initializer implementation
      cacheinfo: Allow early level detection when DT/ACPI info is missing/broken

 arch/arm64/kernel/cacheinfo.c |  25 ++++++++-
 drivers/base/arch_topology.c  |  11 ++--
 drivers/base/cacheinfo.c      | 124 +++++++++++++++++++++++++++++++++---------
 include/linux/cacheinfo.h     |   8 +++
 4 files changed, 133 insertions(+), 35 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
