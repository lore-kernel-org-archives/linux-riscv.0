Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA79EC433E9
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:27:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30DC723600
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30DC723600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FTH3ClIS0oXWTes1mgYOuP8ou2DsCLKrwxkpjd0yL30=; b=Bwvcu2y/CZ4HF01sGTyUAaCSg
	8ie3oG/u6xLdARJ4kHnUPNu5AUc4jwJX5PcvRJmIavYpx+ox6Oo7Kyr4nT0KclUbRTz2tTYU/+Zkt
	StrO5VkXEF2CXRRkNiU4fr6e1Umb5ePKYGkpF1AzM6CSz7kIqihw6sWjO7DiRMM0s0u5vdnAcZw/s
	e0WFrhL2LQ2BLsaTh1h24wQ9yRExusO/vzGWsfT4bTMEReVFgCoKEZyVX5LD588onMEYSmDJY24jR
	kf27fgEU4zVC1LOfeHiRsP/GcgiKsgSPxy9OXdrgit518DywqKZJ3z8aNkvsDYbYHAXhvgf1gk6fb
	L01eeGiMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22HV-0003Lw-E9; Wed, 20 Jan 2021 01:27:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22Gi-0002s0-Tq
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 01:26:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC818221E5;
 Wed, 20 Jan 2021 01:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106003;
 bh=hMs1Enxi29RFmdXP40/oB+4f2xHXZetfroIgBXwOUt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rPUN3LQ7Ss1/VXbohDCt8yrRLDCH4/+/j+vxCtSelaDzdkkA04/y6FLC6DISzDDYm
 iY+q0cMk/BI+mlhKiRrUHSZDd88TylmVzjpfWysQ0aD5nqLKV3DxofP4MSMV4Szy4F
 hWK3Uz3UPKgmyel80jYSp3H0YRq0Saa+HrAobYy5jHy6luC53Y5WsOZc5NVBo40lkc
 Bi/ZvgGg+Z8Vu7s96zQyzwq7cNN7nIZIPT1VVGSzkpHncIFS7rWHYkOHQxVMXGJxX1
 HDGt1syXnUEwnsT/KPm5T37TrPvRjgbOR28aGdfx42+oPjW5def/TGsrgkLBbZMZVt
 hy33v4L68imZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 31/45] riscv: defconfig: enable gpio support for
 HiFive Unleashed
Date: Tue, 19 Jan 2021 20:25:48 -0500
Message-Id: <20210120012602.769683-31-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012602.769683-1-sashal@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202645_098678_BE9D1E60 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

[ Upstream commit 0983834a83931606a647c275e5d4165ce4e7b49f ]

Ethernet phy VSC8541-01 on HiFive Unleashed has its reset line
connected to a gpio, so enable GPIO driver's required to reset
the phy.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d222d353d86d4..8c3d1e4517031 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -64,6 +64,8 @@ CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_SPI=y
 CONFIG_SPI_SIFIVE=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SIFIVE=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_POWER_RESET=y
 CONFIG_DRM=y
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
