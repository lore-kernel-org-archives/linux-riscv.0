Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D928C433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:29:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F29A5206F9
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F29A5206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=scnnyGSQ1s21hD33vUARpSC9pQYzLh0arOUMScUVXOY=; b=MA/H54zI0nJ9E2qO2CnnyDb2x
	cGUhvAqSxN18pDYPBqhXosk9u9zOBppLG2/pC09KZXNPS6BG2/I7SzU8ZRtFsFWm02KlX1Jr1TzHZ
	Wn1Bq2N+10BQbwnxr7KE4E2XLH0L2agZyHAlhxEnFkGRWifcW4nWy4jjOCVs7X5ycFkXN4PJDjSNa
	LnsJrsZ2aMM/PRQTCOTk1qAuo+3p4R4iSjtC9JUbBU96uMyCQpMVcQVYKUc5Uj5S6gNt0zhT2q9lP
	Z83MWKOa38GydIkgxwgUy339KLyz/KzC4bxCaGiAVXLypklYu3gaMTQjJqaxL0yRTXcwFwbPwkg8I
	aykqehvnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22JT-0004Yg-9N; Wed, 20 Jan 2021 01:29:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22HR-0003KN-UC
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 01:27:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B1BF23407;
 Wed, 20 Jan 2021 01:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106049;
 bh=1rfwSpVJ+UEYl/EIDIKbdLpUVSO+QYuuMjMAelssO6g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kWPthReLQzMzIsihOhaLz5wqAHkmhGRtfz175sBHeNZFMNA4OoLm02Mi3UjsYea52
 UEN049sSnfokfsnnzzJBlGj1Eb0T6pgzrcYrhvKsY5tiEXi5cEidizOlt2olikwRK5
 pYTf7GNnXxJyaPBB262mZYxaY3S06FNHqjNZUyMXu6frTEW7xMrKfRW7TBzuDy9M12
 +hg69LhksLCY26Exw07tbfkpmMJp6NztRtvBIlhDpBbyqZMtzlubarQTmAb5RB6hsZ
 lCgxyl0V/YgbqTseLMowARFe/Q0mPkhJK/vrbYp1AnToNqBI3e43U35pp9cmf3QoqX
 rmsbPFuehBktA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 18/26] dts: phy: add GPIO number and active state
 used for phy reset
Date: Tue, 19 Jan 2021 20:26:55 -0500
Message-Id: <20210120012704.770095-18-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012704.770095-1-sashal@kernel.org>
References: <20210120012704.770095-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202730_050744_C5720662 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

[ Upstream commit a0fa9d727043da2238432471e85de0bdb8a8df65 ]

The GEMGXL_RST line on HiFive Unleashed is pulled low and is
using GPIO number 12. Add these reset-gpio details to dt-node
using which the linux phylib can reset the phy.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index cc04e66752aac..1ad3dc2fb6343 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -85,6 +85,7 @@ &eth0 {
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0007.0771";
 		reg = <0>;
+		reset-gpios = <&gpio 12 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
