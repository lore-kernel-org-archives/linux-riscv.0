Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF09EE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5AvFAKXC89MYtIdhwqa4D/LPEsmedmkedP21ccLtTw=; b=Q+Vg4fdepAnAj7
	LpGSlxeo3qGNFuWoXWA56sDBtsOXXkZ+ZNvXnPBS6b/276dyYHtRIjQEWHxmShjwIKyGbby8gaufd
	vo7TqmP2+MJWbynef5QUgm6xZm2kGwy4OgcXDbrY64BqOMN7ihoKB8f4OaAo76NM0Ds9I/nFkeu3s
	FwcEv8mqnmW2I8sxxK02wgjYHu7kC4PFwZ5IRrBsQHjy8ZJAHnpoDwitQbkgwZoWJvfroZKfjCEZn
	NbKF6dKkgbe1T8p+lvRP+U2PllkbRzavSsI2nxFU+8YBckpPLO+jE2/VZdz6p6mFngIRF/ppAs12x
	c2ZeM/nNWc46DGDhws8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOM-00000005Nxp-1rao;
	Fri, 20 Dec 2024 15:58:18 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOF-00000005Nqk-26xt
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nu7fQAgXUlOppVgqF4FCsVhNZbZKV0RP9V8TletL4wo=; b=n/HHQaYGqjJBSqSbh+lPUPqhEz
	AQFANHXMVUmd0X5t2/QUMsPsL2JaOD9WeChdWiODLsVXzrvhSRWwYht3fLjDPpy/kNmgJ0bZF/hrk
	wOjnv/iaD5fQjem7VVOkmKzFypDBxUFSkMOf6G4AMNSO9X1WFdaNKauAw9Vt00G76HQdq1cKwFygD
	aBA4/bJWft92lfnKUR+dhcxHO4sy8uhbmjyAVyMHjqOkX9M8mo2WaPO+F9FojzeanX5zjzpz+tK1H
	AwDlzhhSQSgBqtZvMH8zTEat9IfdAqtrT6RATbdnqMshwGpIiIWV0GWWTsepjOGIH4w7FPskFxdWT
	AZV3TvWQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfOA-006axk-2l; Fri, 20 Dec 2024 15:58:06 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LSj-2wNC;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 04/15] riscv: word-at-atime: move to generic if we're big endian
Date: Fri, 20 Dec 2024 15:57:50 +0000
Message-Id: <20241220155801.1988785-5-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075811_620914_6249E6D8 
X-CRM114-Status: UNSURE (   8.23  )
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

Use the generic word at a time code if we're running in big endian
for now otherwise this doesn't work. Add better support later.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/word-at-a-time.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 3802cda71ab7..436e3588f50f 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -8,8 +8,9 @@
 #ifndef _ASM_RISCV_WORD_AT_A_TIME_H
 #define _ASM_RISCV_WORD_AT_A_TIME_H
 
-
 #include <asm/asm-extable.h>
+
+#ifndef __RISCVEB__
 #include <linux/bitops.h>
 #include <linux/wordpart.h>
 
@@ -47,6 +48,14 @@ static inline unsigned long find_zero(unsigned long mask)
 /* The mask we created is directly usable as a bytemask */
 #define zero_bytemask(mask) (mask)
 
+#else /* !__RISCVEB__ */
+
+/* use the generic one for now */
+#include <asm-generic/word-at-a-time.h>
+#endif /* !__RISCVEB__ */
+
+
+
 #ifdef CONFIG_DCACHE_WORD_ACCESS
 
 /*
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
