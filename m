Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9029E7718C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2RzvLVQGapeSaE7zIgrXJLmZeDd2xoznW+x3XwFvxI=; b=K3fYzZrJs5KR/R
	6iZ2s6n4WZESOshfskFUVDiPhOr5FZzwOjk+UIAZsXFZS+fWDmOgz/nfeoSYSivYi6MGKeBI9FqY9
	b5FYrLwlyb08PAW/QxMd09L/+dQwOVziLwAgwO2sQeg29KhKPAv1FxgP5F9SFCDSPFF+nKiDinf9F
	4YqNxUYq3Qu6LQciZMI6F8Pdz8j0OlJ3USukLNADulDTBScbAoM7ubqWR0UmoWywSnlAwN6lKf+0E
	QV2WnA1/IJeqWe0Ky7PSkJW4QTdZhzrjYGBFel/YNlNRY5exj786WD6UGs3IcvjKzhd1HDEWOCGXN
	AXm/cwPVQYqWjbzhCibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOQ-00000005O1q-3TzB;
	Fri, 20 Dec 2024 15:58:22 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOH-00000005NtR-2c9N
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b0zfwuxNYdnEHdCMpmoC+InhanfjUJnBFeJN5WvRGw8=; b=k8rGOxQt2HgjDWjubNykKNvYKk
	G6an+8bzaoUbXLQ6CAAKeYvyQBwQBPAow5hPldA6OJABiypiudl0mXu0pC8bLrSuOHLWON135tZaj
	N7YOj6yNY5VQ2Ie+9de0VY7QU+Hd38/qyhEbUAa7ph2mKVemcBe27l6g9fS1w/lZQM/IXgJT6vwp9
	ClB9kTitkljOzJrRF0ppf53oLRX12CiBObANGQPjrPWx3mjmHn0Zwipokj/iXCabhOm3HyyaYPwb+
	lDSx7s0OYaYxlqFpbcfpRBkO0e/JehjWBDoqywf/2yLltFNAnFYoDqi1vCfCYJaXDFksU25HSIv60
	QLyBPm6w==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfOA-00ADAK-0x; Fri, 20 Dec 2024 15:58:06 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LSv-3Czt;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 07/15] kconfig: remove CONFIG_COMAPT for big-endian (compat cods doesn't build atm)
Date: Fri, 20 Dec 2024 15:57:53 +0000
Message-Id: <20241220155801.1988785-8-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075813_734286_B65A99FA 
X-CRM114-Status: UNSURE (   9.09  )
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

---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d632bfad190c..5a72e7b31095 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -930,7 +930,7 @@ config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 config COMPAT
 	bool "Kernel support for 32-bit U-mode"
 	default 64BIT
-	depends on 64BIT && MMU
+	depends on 64BIT && MMU && !CPU_BIG_ENDIAN
 	help
 	  This option enables support for a 32-bit U-mode running under a 64-bit
 	  kernel at S-mode. riscv32-specific components such as system calls,
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
