Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF939C433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 05:19:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8762E2053B
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 05:19:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bJ1ZVpLT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8762E2053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eswin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M3stwhb3CkcdiSsKB0zH2IiTnZ5FnaSSA3qUapts+J0=; b=bJ1ZVpLTucVA6s/cmbjpA37LCL
	Z6QcxOXjQuIICAY/dbqa4Xzeu/zPsOXeQa7SdGu3pqvfZRBrYvNJeXz8ABg5meW/u/0HE13wOoOg9
	jVy7lyK4VNllD+bzWgxlzJQricsZWl8epC+1V027H3nZdNjRNhWJz8mWpxiJN3cIxG9U6i0Q1Kjkc
	x0DWOFZ9uY3G4Kt43aseCl8M+jikN79NCAp+VWaRIF9o3zDtIPwNsCYZ+zIrwSuRQMZ7zaaczGF0y
	ioHL3iifIKLamlpp5kbhP7dOAd8sfQnGOiFBMar0NxeOQjEPdX0phr7pwabwEGcc5VgJzXMd+2NSi
	r4zn3sWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtOyK-0001OS-FI; Thu, 09 Jul 2020 05:19:48 +0000
Received: from out28-51.mail.aliyun.com ([115.124.28.51])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtOyG-0001Mm-G5
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 05:19:47 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.48121|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0183385-0.00121183-0.98045;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03310; MF=maochenxi@eswin.com; NM=1; PH=DS; RN=7;
 RT=7; SR=0; TI=SMTPD_---.I-jIyZp_1594271970; 
Received: from localhost.localdomain(mailfrom:maochenxi@eswin.com
 fp:SMTPD_---.I-jIyZp_1594271970)
 by smtp.aliyun-inc.com(10.194.97.171);
 Thu, 09 Jul 2020 13:19:34 +0800
From: Chenxi Mao <maochenxi@eswin.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 1/1] riscv: Enable ARCH_HAS_FAST_MULTIPLIER for RV64I
Date: Thu,  9 Jul 2020 13:19:22 +0800
Message-Id: <20200709051922.13110-1-maochenxi@eswin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_011944_767755_02CDCC69 
X-CRM114-Status: UNSURE (   5.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Chenxi Mao <maochenxi@eswin.com>,
 linux-kernel@vger.kernel.org, chenxi.mao2013@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable ARCH_HAS_FAST_MULTIPLIER on RV64I
which works fine on GCC-9.3 and GCC-10.1

PS2: remove ARCH_SUPPORTS_INT128 because of RV64I already enabled.

Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 128192e14ff2..84e6777fecad 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -202,6 +202,7 @@ config ARCH_RV64I
 	bool "RV64I"
 	select 64BIT
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
+	select ARCH_HAS_FAST_MULTIPLIER
 	select HAVE_DYNAMIC_FTRACE if MMU
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
