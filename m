Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31BEEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 11:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m/e8r962OkBdPsO+hWck8gJGzEx1lZunaHlml6lXQgg=; b=UgdGS+nLUZLPUr
	l1CXfD02awVx5Klg21zj+coRnK/prPnC1pjmu8g1MSbI6t54GDBhrAcj3UpkCUdVzOE+6Q+oj4JtK
	uFfWT1L76JPziOgzECP+vBSaT0d/Gkl5GEdrY9SN52Og+lrZ4095WtO9YmY/8W2Z56hg9SAX+npKc
	rh3t+DgY+O3h1lF2a1pfEf4wlo1aTRaiA8HgjFMJu2IBdWh+FhcOEVioHPzM09V8BYzmteO4ZmhJJ
	Yu8KUnSSPrFa7Z54apS8fJob1Jh/UrNRmSWaenXFjd4t/xGDADamqVIke3/qZk0WrjXDVghfyff3M
	K4x5DYXfZ9oeBgTGyESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA7sB-000RQ7-2q;
	Fri, 16 Jun 2023 11:44:11 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA7s9-000RNp-02
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 11:44:10 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qA7rx-009P8n-QE; Fri, 16 Jun 2023 12:43:58 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1qA7ry-000fWQ-1H;
	Fri, 16 Jun 2023 12:43:58 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: vdso: include vdso/vsyscall.h for vdso_data
Date: Fri, 16 Jun 2023 12:43:57 +0100
Message-Id: <20230616114357.159601-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_044409_047161_0D65D5F9 
X-CRM114-Status: UNSURE (   7.79  )
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

Add include of <vdso/vsyscall.h> to pull in the defition of vdso_data
to remove the following sparse warning:

arch/riscv/kernel/vdso.c:39:18: warning: symbol 'vdso_data' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/vdso.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 9a68e7eaae4d..2cf76218a5bd 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -15,6 +15,7 @@
 #include <asm/vdso.h>
 #include <linux/time_namespace.h>
 #include <vdso/datapage.h>
+#include <vdso/vsyscall.h>
 
 enum vvar_pages {
 	VVAR_DATA_PAGE_OFFSET,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
