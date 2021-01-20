Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15719C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:29:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B470820449
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B470820449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/d1v217JDSEwU4WCcr56tYpDKqfAifGU6/U4FrW7y5U=; b=1lKhQ9xG2fvAlkPX6IR94v7e0
	5IkPc88nU5a/rGbQzUdhXtvRqc8pVl6Cqsv+8DTqeYH+QOElFMsh6YNV3qc1nkfg/J4GPjeeYtr5a
	HcBMF4xfqFQirnZO2gV0y471XnScDHBqO5GRsyq5Zy7GC3rejsfU7d53Guqx+9mhcxnWSHydJnYGd
	wChE5kOEfOOT8qfr72lHOjwfah8Q8c8sBuzY7zyPBQ/EQjb4HzCnZX8LvB4tokPeZoNC4IW23pDqn
	i7rWUzOnPC20lbp4po7IVmnQLUGtEAkI1Ltq6XyuR+QnM+0FbH//BHEyl7FIHpiXxCIXRH/HkZShn
	atDEuXsvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22JV-0004ai-8e; Wed, 20 Jan 2021 01:29:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22HS-0003L7-Ug
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 01:27:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95C5723426;
 Wed, 20 Jan 2021 01:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106050;
 bh=vQtWiPkKsULz+3Pgk2ydlIu7asw7caLs9bmvdVS17LI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JHKheC7VKD9soLAbVFfGyYjz6BwWC4cbD7jzZVSkN6nyVrD9oyUsxzJ32eIg/z08R
 E4A3Pg4ECsZgK923DQ6t8CpaHF+h7PyEgdVNbBCr3kz4cmub9bs0vStVCYwxA5dMTf
 8hKfyqe7JKHnZuZmjx3+6EOJZjm2Gq/ijyqWGt+o2O8ABFMfGHgI7x+AOIvKywh/kY
 E0cgq78e0it/ndMXFStCohuF3MiDKJzHKO0bQqm1CRTdpoX1Mj/C1xMopoQBS+X/jC
 4u1I9ziOhR+wjlY1EzvrUc0llknarLBwx42mBVtnNh3B6ErFxMVq/i8p+aLGkc9516
 qdJ9ATICjDgGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 19/26] riscv: defconfig: enable gpio support for
 HiFive Unleashed
Date: Tue, 19 Jan 2021 20:26:56 -0500
Message-Id: <20210120012704.770095-19-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012704.770095-1-sashal@kernel.org>
References: <20210120012704.770095-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202731_104111_E42E6C2A 
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
index 420a0dbef3866..3c656fe97e583 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -62,6 +62,8 @@ CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_SPI=y
 CONFIG_SPI_SIFIVE=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SIFIVE=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_DRM=y
 CONFIG_DRM_RADEON=y
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
