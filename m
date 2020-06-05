Return-Path: <SRS0=8iYN=7S=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9400EC433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2020 05:15:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D9C20659
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2020 05:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VPQspB5R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D9C20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eswin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UZ/9MU32j84dkDwAJ0kpI/1OK7iKb6ILv4tynni/7lc=; b=VPQspB5RX3txMf
	Bx/ebizI0mUKaHcBITDa7QqoNb3lns1qdGXO/1nvBuVzCVJsLwm1E7i9nRGC94GEGRve2Y40V8wyf
	VhmvjrZTD9dREQTMBEFoWyWkUoohD5ogMpgNHz2I9jeP0JKmBIiplmFffpe0BKjaRTsIfQ2Kfh6t9
	5bRp2vGzIhuoorNMtE/ugC5r1UdjHITvVuTCzXAAj596n1JqTX+m7rH/jsxX/YsO5JytLh2iq6/TV
	48UvdTYpqKCSd1Fit0IdYd/Xrp4ey5Kd2BPxKNOFvzWLy4mN8RyZ2KQj68VlGkm6iTbxRH/BHziJF
	XIwf1+c2LEDrr3XKV9YA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jh4hR-0005Mb-A2; Fri, 05 Jun 2020 05:15:25 +0000
Received: from out28-52.mail.aliyun.com ([115.124.28.52])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jh4hO-0005M9-Un
 for linux-riscv@lists.infradead.org; Fri, 05 Jun 2020 05:15:24 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4216212|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0499898-0.00367699-0.946333;
 FP=3314605746006315246|2|2|6|0|-1|-1|-1; HT=e01a16378; MF=maochenxi@eswin.com;
 NM=1; PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.HiPnlBB_1591334112; 
Received: from localhost.localdomain(mailfrom:maochenxi@eswin.com
 fp:SMTPD_---.HiPnlBB_1591334112)
 by smtp.aliyun-inc.com(10.194.97.171);
 Fri, 05 Jun 2020 13:15:16 +0800
From: Chenxi Mao <maochenxi@eswin.com>
To: paul.walmsley@sifive.com
Subject: [PATCH v2 1/1] riscv: Select ARCH_SUPPORTS_ATOMIC_RMW by default
Date: Fri,  5 Jun 2020 13:15:10 +0800
Message-Id: <20200605051510.51590-1-maochenxi@eswin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_221523_151821_3BE2EBFE 
X-CRM114-Status: UNSURE (   4.76  )
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
Cc: maochenxi@eswin.com, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Select ARCH_SUPPORTS_ATOMIC_RMW by default to enabel osqlocks.

PS2: Add signed off info.

Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a31e1a41913a..cbdc605d20d9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -68,6 +68,7 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select HAVE_COPY_THREAD_TLS
 	select HAVE_ARCH_KASAN if MMU && 64BIT
+	select ARCH_SUPPORTS_ATOMIC_RMW
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
-- 
2.25.1


