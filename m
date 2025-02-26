Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B72C021BF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ijf9LH8MeDYyAQ17whv3GDa+gNCYxzn8dTNf19y5LJE=; b=up5XQ0GiTqX/m+
	oNEh1g0+Rpvj0kPq+PJPf/MyjktvJqKtlefCC0N5PCrwG4HNnqBLXZQnUSU/OZbIemFCk+kzohj5a
	1BH00a67khzFJNT6TxUquxHEHxcQHnQfri5AB2kKWOpGmaZKPC2L/joZqpnBM1mH6Av6DChStJBrI
	tge2swzU5FW8VIDrArBNeu+yfIZpQgcb2qwhnZzGBPvvoLLK89XrLSc4j65bvgy6LrpHqbOkHiuhx
	gmgqdJrBDP0+wPidK8ky3CEYa1AtqAIy3eKphIHS1qxc2YMh7sKunZn3BpcuNfW/LVmlBvBmNiBLG
	jlXfqAqEurvFpy48090w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHRj-00000003tCL-1rYK;
	Wed, 26 Feb 2025 13:27:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGSo-00000003fXd-1x2J;
	Wed, 26 Feb 2025 12:24:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94D281C0A;
	Wed, 26 Feb 2025 04:24:49 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.40.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BC4A3F5A1;
	Wed, 26 Feb 2025 04:24:28 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH V3 2/5] arch/powerpc: Drop GENERIC_PTDUMP from mpc885_ads_defconfig
Date: Wed, 26 Feb 2025 17:54:01 +0530
Message-Id: <20250226122404.1927473-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226122404.1927473-1-anshuman.khandual@arm.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_042434_551054_68C91331 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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

GENERIC_PTDUMP gets selected on powerpc explicitly and hence can be dropped
off from mpc885_ads_defconfig. Replace with CONFIG_PTDUMP_DEBUGFS instead.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Fixes: e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/powerpc/configs/mpc885_ads_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index 77306be62e9e..129355f87f80 100644
--- a/arch/powerpc/configs/mpc885_ads_defconfig
+++ b/arch/powerpc/configs/mpc885_ads_defconfig
@@ -78,4 +78,4 @@ CONFIG_DEBUG_VM_PGTABLE=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_BDI_SWITCH=y
 CONFIG_PPC_EARLY_DEBUG=y
-CONFIG_GENERIC_PTDUMP=y
+CONFIG_PTDUMP_DEBUGFS=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
