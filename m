Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282C8C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 18:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A242BnIVS3RKfKfVZiFNzJvXMBrGr4qaoGwBiLJXFNU=; b=IJ5u955ozbmdE6
	DgdWV+p4m2t0UtPkOZjj6BFADDLZOXEwJB+gb1FkULCj3xubcLSL0/VKPemctszeWgfwoLthIwm5U
	x7Iy4kj6xveUDQM2hwY4beJ+/HuiAWimus0uXcHqYveuyC4banYzyG86WPsvFkfv5TuoPkUtwpNqs
	Ih38LZtOjOSvwpSRBDoaZegVsJHlEEzMNat2oLcwedoIykcw9wR8Q57CavAIOS6PgUyrWiLYPyLMj
	8bg9chf1ejMIxQKAiJeCHKTylv1E7EUcGdPHDozRQ2FvY667iCByashe3v3YRtFuBdyIt9grWjH78
	Rxelx0APi40LvpUDU/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YAr-00000007n2q-2Ncp;
	Tue, 15 Sep 2026 18:46:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YAq-00000007n2c-2g8L
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 18:46:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC402600CB;
	Tue, 15 Sep 2026 18:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAB51F00893;
	Tue, 15 Sep 2026 18:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789497991;
	bh=/FY10Oyc29wBvCDH2kYSfAlOOlBCfq/+LHP+2MwD5k4=;
	h=From:To:Cc:Subject:Date;
	b=P5nrSP067BPHgZybVo75DanLDkubGvITx9JNmxmLCpXir69onbTJ9OEbNXAR9es/Z
	 jCEIj/pahn03YnDS8rdZEMXSU2ekevz6yq6ZMveuaTZgcrqMna3G8dX4UNh7gErCkC
	 vLdbLuyWXVwZiPxa0dtQTq7rx8u2ItI2NZAhGoISyDpuyrOGCULqJSBCzHqRMSPg6X
	 SJ1sS9ZUXETAEGzh+qTz6tiF8qGMyyLTvWpYVfaIb1DRhP4qFBlfR3vinO2dKRCBAk
	 vMlao90E2s6n2XXTdr2lSIvmNB/kLqUvyT1FE6uAmFMP4kMZVqc5AyQJYymGuuWFER
	 HBUf22rpuHfrQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Valentina.FernandezAlanis@microchip.com,
	Daire.McNamara@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] MAINTAINERS: update RISC-V Microchip maintainers
Date: Tue, 15 Sep 2026 19:46:09 +0100
Message-ID: <20260915184607.273561-3-conor@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=conor.dooley@microchip.com; h=from:subject; bh=PxE56LeQWiGxJF85Srop/AhouFqQqoQ3HzLbugCFhNk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFkrJ+VP+VbIZ+F07Qxzp2tKyps1N/UPvk2OCNZwrLA39 J3yt6ujo5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABP5tJDhf0D0U3nDltaZGe6v xDh2BD04evK7aYrcWXXOzBWN09RyvRn+58vnJzEuKbv3/aBsisk6S6su/Se3Sx11fU2Xa4Wq84X wAQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

Daire is effectively not a maintainer, since only I can apply patches.
Move him to a reviewer instead. Add Valentina as a reviewer because
Daire has mostly been busy and it's her that I have been asking to
provide reviews when needed.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..d57c11cb76a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22916,7 +22916,8 @@ F:	drivers/iommu/riscv/
 
 RISC-V MICROCHIP SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
-M:	Daire McNamara <daire.mcnamara@microchip.com>
+R:	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
+R:	Daire McNamara <daire.mcnamara@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ (dts, soc, firmware)
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
