Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FBFC7EE2F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9uzsBuipRgV1xLEKZudQmY+hUIgB1+FU2ulKyPR4Iko=; b=Pufy3AGBY7wRX7
	HWeM4+Ruf6kSMXz4V0L1KvvTv/dRCCzHsWwfdzNYOnV7MdA9koJ2BnNSjqGZdTkhrVHqk2/2LrhSb
	t68/LK+tkwDsxX5d/Jisb93bADUNskWyvYTt8OjTUTPM3G48o2rl3ndwRbKUtKim0+7LCm0VTM5zu
	OjLMGPCWwSD9hbK4LO0GuwUGUqu+7LUCpSiHdL8yPSA5cvt89R3JrZdsEmZXaNSGU/sdDa2QQoTog
	UaJMXWWbMuFK6q4wM85u4ZvrIdCKVOw1HDCTqizcf/UeIPFYkohGTB0AdJvJg8thh78AFSnDJsnv7
	1QBnViI7s+2o1m/PWV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGx3-009uTT-06;
	Wed, 17 May 2023 13:12:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGwz-009uQH-2N;
	Wed, 17 May 2023 13:12:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3AC8364706;
	Wed, 17 May 2023 13:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81DCC433A7;
	Wed, 17 May 2023 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329137;
	bh=7NFY4e1GRdJpBgrCbtxoc1LfzebP5DErPZUbazdtedA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tyU1+/JQyb06JHCoISP/aGPwtCQn0y+G2NG5LZRAoqMZ2rrQjRXynp/TD2rSNP+yu
	 1MAgn39GOwDx0XjC/LCCoz8eWqzWrh1MPxapDvHcn+PH1s06DifD+01A3XTAew1Xad
	 7kiU/kNm6uC/vwrOUnFMNzz/s1aP2ZTB5AZ44+nRwW23Ewv7Oudccx2C7eFBMHX70o
	 bRraU85jXL9lIeSgOiof8kzLy3rFvqHD/NGDlZjQWIMKbB80Ds7TOcR89bmpDrx2M6
	 DjfDS8BLtKEoQUWgQ9ZjdRzMuh416rmJ35iErYbPeR1Cy3wac2W8wJ0tUTeKW2RkF7
	 Kn4dcDyi8DEBA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Pavel Machek <pavel@ucw.cz>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	audit@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH 05/14] lib: devmem_is_allowed: include linux/io.h
Date: Wed, 17 May 2023 15:10:53 +0200
Message-Id: <20230517131102.934196-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061217_827136_5EB9CE0F 
X-CRM114-Status: GOOD (  14.15  )
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

From: Arnd Bergmann <arnd@arndb.de>

The devmem_is_allowed() function is defined in a file of the same name,
but the declaration is in asm/io.h, which is not included there, causing
a W=1 warning:

lib/devmem_is_allowed.c:20:5: error: no previous prototype for 'devmem_is_allowed' [-Werror=missing-prototypes]

Include the appropriate header to avoid the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/devmem_is_allowed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/devmem_is_allowed.c b/lib/devmem_is_allowed.c
index 60be9e24bd57..9c060c69f134 100644
--- a/lib/devmem_is_allowed.c
+++ b/lib/devmem_is_allowed.c
@@ -10,6 +10,7 @@
 
 #include <linux/mm.h>
 #include <linux/ioport.h>
+#include <linux/io.h>
 
 /*
  * devmem_is_allowed() checks to see if /dev/mem access to a certain address
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
