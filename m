Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F1BE7718F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUhvP0DfR955jURsd80PDzVPYftBuBfv0g8CeCFsUhQ=; b=kEhw/AGM2OYSfG
	QQpPeBjMCbEq+LEOeJZRmjf2yRFMzvK3azbfLFElkYPsjVcxY5PttODH65LxCW7+kuvK2a1Chh74a
	PHCnHHDYiPbinAL+mqgSRdrcfY/nwgWHwBJcPRBonUGUGzeC/c3WEh8Wmq4cxpteOjCfdPe93Mnk1
	HDEjeoS0zaWHbzCCyvFIMqDoilwP3c87kOUs/uAHKugCUj9ef37CwVQuceAuG9PUSCwEhc+XBEST8
	SEX4iQUusljVPL5KlaOj7XV9aubH4hYhwC0Q301m5HwgtAc6tojlSI+5kUFMHTnP8JYi232DNx0Fp
	HxIXp1R4GKQwth1IOteg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfON-00000005Nyt-3nOT;
	Fri, 20 Dec 2024 15:58:19 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOF-00000005NqV-3NSm
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BxNHQ+B0HaXyHNwMQnlpMraQTogWmeujailVSyn2wj8=; b=3GScIZWw3YR4JwaudPSHZZZ9SX
	wcihPzwkDzZdcJgbaHXYFAXVDUTvOYgl0NR7Bu5ZFR9WB4BSlgWEdJQam/N5AgoxE1USqQAAqXSL8
	y7Veb5Wv6bEZc8hx0tjqclzjbrfK46ep2LpoJDNlhMw1Trci35A/uG0JHW7U8elFXU6Pz7oKOZnwg
	wF1CU/dngi6LGAvXStNjPJCWY51UU2xKuuiNdbWBxZgx/+FwNllIlFpNzizKYndGU6CZXALIsOamz
	Mk/OQP0NGRg9wa6sQt6ofK5dq9gFLwLJFJy8Ie197mNjDY3ygUc+I6hUc4rBJGQ4q2+grlN8rGUC1
	HC+9/mOg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfO9-00ADAJ-Tn; Fri, 20 Dec 2024 15:58:05 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LSf-2rBD;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 03/15] riscv: disable vector if big-endian, gcc unsupported option
Date: Fri, 20 Dec 2024 15:57:49 +0000
Message-Id: <20241220155801.1988785-4-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075811_843522_CD0693F8 
X-CRM114-Status: UNSURE (   6.93  )
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

You can't build with vector enabled at the moment so remove
this until gcc is changed.
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e352e022ed4a..d632bfad190c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -602,6 +602,7 @@ config RISCV_ISA_V
 	bool "VECTOR extension support"
 	depends on TOOLCHAIN_HAS_V
 	depends on FPU
+	depends on CPU_LITTLE_ENDIAN
 	select DYNAMIC_SIGFRAME
 	default y
 	help
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
