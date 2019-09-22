Return-Path: <SRS0=1FLl=XR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C7FC3A5A6
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 22 Sep 2019 18:51:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 615EC21BE5
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 22 Sep 2019 18:51:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j6o8UqIS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1r/gi9PS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 615EC21BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUCqQ6O74gONoR/6frmIBLDzoU4VAAY0JeXPlVkcXxg=; b=j6o8UqISj0YMWW
	ffNE4LAvq2/xWLWqKvwnl3ga5NyLJZvhRe9WwjToyoS7I9/CJal5EsnI3Y1a1aRFTQ+cmSpy2nQtc
	WlweawF0O+z+AqFPdtAC8DivOqCz4fmPr4tYxjBFe1tTEAHE4NgQWRdUgsuqF0FwgI62lPTo8Klxm
	xE7XY5GQD5wHcjaOnMERJvX+5kaT+q0fZxOp84v4XzBE0Z+ZIYqSWBt2Oa5a4DdVbq40Zl0qLqimh
	3gkmOmkJYQrkC3BpyOmJNsEm9LFT04/1uVpxXv5y0oiGxwiy31vLXyWILr1E3rGyXPEcMwDMDWDXH
	iZQOEMvQzG11I/mmHGFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iC6wn-0001RI-BD; Sun, 22 Sep 2019 18:51:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iC6wk-0001Q6-49
 for linux-riscv@lists.infradead.org; Sun, 22 Sep 2019 18:50:59 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5A3021D6C;
 Sun, 22 Sep 2019 18:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569178257;
 bh=CiyScJoSbjEh1dk6sz0/OoVDGfhZZEA9aBDwuupZISg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1r/gi9PSWDQBt/I4yKAskRywb2n+ffK+XcQIERFs1fZpy8ZPAIXnb/m/ubt1MNSvH
 WMZnMIn1B/+vlBiLAnPV7VVCAvOWJAfdQ85QYbWNqEs21CP/ICVTzmO9g51vkvAZAu
 UAGr7VfNACCViE0M7yokmox68qL1AQInDjDw0K5Q=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 047/185] RAS: Build debugfs.o only when enabled in
 Kconfig
Date: Sun, 22 Sep 2019 14:47:05 -0400
Message-Id: <20190922184924.32534-47-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922184924.32534-1-sashal@kernel.org>
References: <20190922184924.32534-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190922_115058_184159_997317C1 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: Sasha Levin <sashal@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Valdis Kletnieks <valdis.kletnieks@vt.edu>, kbuild test robot <lkp@intel.com>,
 x86@kernel.org, linux-riscv@lists.infradead.org, Borislav Petkov <bp@suse.de>,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Valdis Kletnieks <valdis.kletnieks@vt.edu>

[ Upstream commit b6ff24f7b5101101ff897dfdde3f37924e676bc2 ]

In addition, the 0day bot reported this build error:

  >> drivers/ras/debugfs.c:10:5: error: redefinition of 'ras_userspace_consumers'
      int ras_userspace_consumers(void)
          ^~~~~~~~~~~~~~~~~~~~~~~
     In file included from drivers/ras/debugfs.c:3:0:
     include/linux/ras.h:14:19: note: previous definition of 'ras_userspace_consumers' was here
      static inline int ras_userspace_consumers(void) { return 0; }
                      ^~~~~~~~~~~~~~~~~~~~~~~

for a riscv-specific .config where CONFIG_DEBUG_FS is not set. Fix all
that by making debugfs.o depend on that define.

 [ bp: Rewrite commit message. ]

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org
Cc: x86@kernel.org
Link: http://lkml.kernel.org/r/7053.1565218556@turing-police
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ras/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ras/Makefile b/drivers/ras/Makefile
index ef6777e14d3df..6f0404f501071 100644
--- a/drivers/ras/Makefile
+++ b/drivers/ras/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_RAS)	+= ras.o debugfs.o
+obj-$(CONFIG_RAS)	+= ras.o
+obj-$(CONFIG_DEBUG_FS)	+= debugfs.o
 obj-$(CONFIG_RAS_CEC)	+= cec.o
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
