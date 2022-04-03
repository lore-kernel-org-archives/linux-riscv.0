Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D29C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Apr 2022 03:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WjsMv2pMJxZehMDE7nhwhMk7/ZlkID4Txvibd9JWX6Q=; b=A2lswF55qbmKLR
	TxwNKNbzsO8Su9VxTDMhmG6sUn9iX5S3MU9zpjpmN46TlTjFTFqb5xeD997Y7rLX22cbUa3TU6FHZ
	uzV1y53TGU7g9+G/kh9i2yk74oyY4wEPUZd4kUIInsiMm4aeuGCdNbAcBUrGechigjVNM7lZoD+/i
	uQKAoouTtP0vWzOvReyZBjveBD38Yh7r03MoRF02Jp3YXC7LwwzOYU6G+2O7FA3FMo7xgEs82K7ax
	793E6xy3LRZUuVm4flp82EgxRYfA0HF/zSOrx+wsXEyuryx2oDT0XmtSBQJFTB9O0MbtS/Z1B1kuz
	qqau2zwcgGkGxA/1aJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naqgh-00AZ3w-4b; Sun, 03 Apr 2022 03:13:59 +0000
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naqge-00AZ3b-Je; Sun, 03 Apr 2022 03:13:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Anup Patel <anup.patel@wdc.com>, Anup Patel <anup@brainfault.org>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next] cpuidle: riscv: support non-SMP config
Date: Sat,  2 Apr 2022 20:13:55 -0700
Message-Id: <20220403031355.20894-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Add <asm/smp.h> for cpuid_to_hartid_map etc.
This is needed for both SMP and non-SMP builds, but not having it
causes a build error for non-SMP:

drivers/cpuidle/cpuidle-riscv-sbi.c: In function 'sbi_cpuidle_init_cpu':
drivers/cpuidle/cpuidle-riscv-sbi.c:350:26: error: implicit declaration of function 'cpuid_to_hartid_map' [-Werror=implicit-function-declaration]

Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20220401.orig/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ linux-next-20220401/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -22,6 +22,7 @@
 #include <linux/pm_runtime.h>
 #include <asm/cpuidle.h>
 #include <asm/sbi.h>
+#include <asm/smp.h>
 #include <asm/suspend.h>
 
 #include "dt_idle_states.h"

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
