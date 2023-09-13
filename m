Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57278EDEC4D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kqtnpk9OixtwEJCMPrf/k2P68lGh31k60205eXjcuHI=; b=24MsBv36qdmt4Y
	ohZlwexTIgB1SaaDGYHgvyk/vXUNpNQaFVTZvOim1BwUQgBsVwVtFJtiGsX0hfIsSF0gmDdQdAMO9
	g0HCj+sJqN/cW0m11NHN50Hm67+5yaxPVvIL2f8gDC2taUrO3zE/o6KUXyDWrFio8iTVLVd2iEcp1
	SpambNMUZUiwYlBUlm01PQf8SPbAd3HKRsGWfia4A1+VdtwKf5mBOehlzpZfFJ8DgrjpWdFHPOi7L
	I9+9viUj5BTzSoM3cT89iRl7Z5SCEan2oHgMhcwmd6rkn1T/kVbnfjUDdfWLqHnOptfnSdmp2t9HE
	NUR+FscI3gJwMrp09ynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQLq-0064HA-1H;
	Wed, 13 Sep 2023 13:56:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQLn-0064GG-2w
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 13:56:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72EF261973;
	Wed, 13 Sep 2023 13:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3854C433C9;
	Wed, 13 Sep 2023 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694613374;
	bh=WyGoT/IpS4j5guw4pY2xjfZcTVdCNCPd7Kqn0VeALVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GIJP4AIvy0hbT5V2SKk9Xef/Tet7mmZsFqwesBKgS0l/MJcvZRnrwSfaYQOg5sI5B
	 VDszCrfPZYxDgVjH4Kli3Ra6USYi6QnTBzWeMrDxDruxZq2XSABptBehKv0irJ+VN6
	 egn88/8CYZrfyS4KHwd5sQXx1hLX7sxg8cpUGMu/rippOTS3zSO9IOFVEOtOqrkMQn
	 vYwaS+3kggf0yyDlYZ4a/uTxc63xZfXrIMdqaVIyDSDrI/fNfzDrgRxZNqL46Wm8B2
	 VmzY/t4NirRGAhKKJV1ULWXhVyBgtAcuN1BJjsg12EH7aALHIGTs/wCxllbpzcGVxm
	 uy0Kukji+LjlA==
From: Conor Dooley <conor@kernel.org>
To: ulf.hansson@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	arnd@arndb.de,
	changhuang.liang@starfivetech.com,
	jiajie.ho@starfivetech.com,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh@kernel.org,
	walker.chen@starfivetech.com
Subject: [GIT PULL 3/5] pmdomain: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
Date: Wed, 13 Sep 2023 14:54:26 +0100
Message-Id: <20230913-legibly-treachery-567cffcb5604@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=920; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ROTpWeJDGZli0o85OeBFiNqOQk1oLZRZwx1V2xQWjsQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmM+wX8dq5l7svdNaMwJ6/jAdvtOas8BA7q+j4+cPNqI /Om+DiDjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEykZDnDL+Yd3r82bvJefniC NLvGiYRLn6qET0y3LZHdtmBHwNG25ZIMf3ivbNmzOuDpg03rQkS46vortgjZ9HY8bb+c3Cq6dLe WITMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_065615_988884_7A402908 
X-CRM114-Status: UNSURE (   9.28  )
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

From: Changhuang Liang <changhuang.liang@starfivetech.com>

Using ARCH_FOO symbol is preferred than SOC_FOO.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/starfive/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
index bdb96dc4c989..1e9b0c414fec 100644
--- a/drivers/soc/starfive/Kconfig
+++ b/drivers/soc/starfive/Kconfig
@@ -3,8 +3,8 @@
 config JH71XX_PMU
 	bool "Support PMU for StarFive JH71XX Soc"
 	depends on PM
-	depends on SOC_STARFIVE || COMPILE_TEST
-	default SOC_STARFIVE
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	default ARCH_STARFIVE
 	select PM_GENERIC_DOMAINS
 	help
 	  Say 'y' here to enable support power domain support.
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
