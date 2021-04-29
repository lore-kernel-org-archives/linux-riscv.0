Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9B4C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 08:05:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F99613F8
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 08:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F99613F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LY4gR72yfM1vuteUJ5mZPsRZuhHXNjDQzmJmFqUUpZs=; b=f+XzgeDY9Z69RYuqPGxkQqEAoK
	7p4LhVxren+ZT42ZZ9zJRlltdAo9wH3kXOTamP20xL8X3kuOEvnk+EcOLRKwZfurR4fZyGwo2dMjK
	GqdMv383/uKb72d2Zm2NwZLXdfkyAZlvIDuYBsufNQ3ApCidKDF8wqGLbWxHhL+Wwfw2CkFzXdr/K
	gcdB8cXL95YW5ff9fG7+qzRLeNkcjajK8b7uGWUzOAzEhH08F6hgjmhMBBehxV3H+OMVux0ss/5bU
	OFEEMoW6uuq1xu7wCx8tUw+Vu2cIl8Z1pgYnsnnYJmWT4zCWsAg6bq6nAjSq2PJHHCpWXCNpjfHaL
	jEP8/wYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc1fQ-005Fpa-KE; Thu, 29 Apr 2021 08:05:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc1fO-005FpU-Ku
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 08:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=COxLyxut35FF++DcEvwtNdhVoc8KFkkAUWYyY8ZW2IU=; b=NJjLUfTdO85Apy2dBPLIIB8nPX
 7qQj79scOe7v8b0pTpVB8C2+CFvLpVdP0TDdEgfvRc2w8kJ+tP1612Fbsd+cR52KUDjQiYHz44swd
 lxAgVbKtkWENS4YAhqDZ5iMMo4EfssxgNL7G64gSiqXA44PvsI71H4QCvDSbypSXgHB1dom/uKKyi
 dYsK+0Ra7U1V0+JWWM2zYZ0d9d9HN9MTvVsUZMrdM5Fb2Wt9H7gLnUNu1UsulNbQMEhHByS7PfPP9
 sLy2FIgxrEjLNPR1iNs7AWKqm9wA5ZKNlxELR6QG3w+zzlg+c0S89sJpK4hhQVEuhyw0WOoOhk79j
 s8EXXhKQ==;
Received: from [64.62.193.209] (helo=transporter.internal.sifive.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc1fM-000TFE-2J
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 08:04:57 +0000
Received: from gamma15.internal.sifive.com (gamma15.internal.sifive.com
 [10.14.21.64])
 by transporter.internal.sifive.com (Postfix) with ESMTPS id 5407A20109;
 Thu, 29 Apr 2021 00:58:38 -0700 (PDT)
Received: from localhost (gamma15.internal.sifive.com [local])
 by gamma15.internal.sifive.com (OpenSMTPD) with ESMTPA id 188a7901;
 Thu, 29 Apr 2021 07:58:38 +0000 (UTC)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	vincent.chen@sifive.com
Subject: [PATCH] riscv: enable SiFive errata CIP-453 and CIP-1200 Kconfig only
 if CONFIG_64BIT=y
Date: Thu, 29 Apr 2021 00:58:36 -0700
Message-Id: <1619683116-196404-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_010456_113114_2CE9D733 
X-CRM114-Status: UNSURE (   8.47  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The corresponding hardware issues of CONFIG_ERRATA_SIFIVE_CIP_453 and
CONFIG_ERRATA_SIFIVE_CIP_1200 only exist in the SiFive 64bit CPU cores.
Therefore, these two errata are required only if CONFIG_64BIT=y

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/Kconfig.erratas | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index d5d03ae..b44d6ec 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -21,7 +21,7 @@ config ERRATA_SIFIVE
 
 config ERRATA_SIFIVE_CIP_453
 	bool "Apply SiFive errata CIP-453"
-	depends on ERRATA_SIFIVE
+	depends on ERRATA_SIFIVE && 64BIT
 	default y
 	help
 	  This will apply the SiFive CIP-453 errata to add sign extension
@@ -32,7 +32,7 @@ config ERRATA_SIFIVE_CIP_453
 
 config ERRATA_SIFIVE_CIP_1200
 	bool "Apply SiFive errata CIP-1200"
-	depends on ERRATA_SIFIVE
+	depends on ERRATA_SIFIVE && 64BIT
 	default y
 	help
 	  This will apply the SiFive CIP-1200 errata to repalce all
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
