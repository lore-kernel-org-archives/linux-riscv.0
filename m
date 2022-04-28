Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A673C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 01:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gu6ubEPW59Y8ZklK7KZyfAdLwenlLxwPtXZyZADpwPM=; b=SbtFoWDlwcwwvq
	bduRqAoVxGik+QTFbQdWBUWjsSdgN+djhTREypqmMFbndUHdXO07kQ3rLWLIQBbNrJXJMMlZlC146
	5S70/PZ1nwP9BnZ0mk+sfzVW/GqWkcSDsQV675YilIuWKSCjt5l+ShfY6pULdQX12HtaWLer1BDQj
	BR96PR7nD1QdsXUf3V1xwY8UPzrAeraBuPDWcRnXJL5T/vSkIFKKgSJ6tL3c7gLrgHqQOqe6ZBDSl
	ES93xkk7s/oteueU3YGrHjHk1+IjSLIeoDaZUYE2Gp6drM8EQljUq0YqW8t/zIIqMRU6uWgTA0eUL
	A8aLb1icLZ0SptIc0V+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njsar-004EZh-58; Thu, 28 Apr 2022 01:05:17 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njsZw-004ECH-V7; Thu, 28 Apr 2022 01:04:23 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5534B5C010B;
 Wed, 27 Apr 2022 21:04:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Apr 2022 21:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1651107860; x=1651194260; bh=7k
 KZKeaIzmswO5xe/sMVvmN10M9qpUiXUxMfopwBhII=; b=FzcqGCmKSCcG1573ws
 wjrHZ9MgBOtt7+W3nlCZwNSbIvNB9iJgBz0Xw71GL//FMsajq+J5lJPUD/Iynl+h
 hW0vgX+42ZsPjIG/gWQnuTc2M3rWXN3GwxFfBSwq56Jft1QpxeeEhtsboM7s1UAU
 X/WfpXOQEDvZn3tnmJozIpJTiDmvRl3aq4br1AlXMrwX6H9geeWBLqQN7RDmXZmr
 aTTGzNHKb7lV+IGskzD4kNYnUJDmZ/M0QlwpJyTJqK6dPj1RPvFYHHR1fGga0Lj6
 wITbOUkxxwmsGES05YpEHgPzTv4BjfS2O18AdEEuGtk0XcKKDsQ38O+WPos/Jlnx
 jKwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651107860; x=1651194260; bh=7kKZKeaIzmswO5xe/sMVvmN10M9qpUiXUxM
 fopwBhII=; b=LZzqWHfYD2Efj2hch/HZzY2OvSwjH1J+3lKdQ08JNew6snKaNh+
 5V66l6Mxn1bsYtau1gcZu70zX5rtW3VvFxvUEqzW69uVJ+p3T/ecKd+0gdnRmhjf
 ARUWeWI0nu4DgjI87rvqrvtqTY7RZA0wc9u34PU1n3qF0dMjPkuHfQ2zakoUWxWM
 GeJgfJwfhHaCkVIVFgTJU+lcIV2JnMRduBXwvFJfEQWTXXtjRiz5eEChAtYx2wJ8
 WRQAG4xnnE/vtEDthrO0lnZdfswjl3xwy/yDp8IC5GbPTpITGb8eNkakwcfsSYED
 WzE3IPZXkCLefZN2mpBX326hUGLOARqj5FQ==
X-ME-Sender: <xms:FOhpYryLbjZs5NNFdW38MfOrDz3CuY_wPdQ5ITkz-YhY-M_c9bXd_Q>
 <xme:FOhpYjSD4p-r5lhDu8Wf45NH1YZCkMOaTV8u4YCgBSGdAE1BzscWsj2SSr-jKNGKv
 5pmSFUXdwbEbNld4A>
X-ME-Received: <xmr:FOhpYlXtophLVL2t1r6XI4wDoUOD2yIbE65kLIWuU20R2xfC9FtFUb1gKLZa45SlonQCmPj2uj9vzzdfJmWpz2natVK8as1fC3JcPM0CID6mdLmP-9mqt93S97Dv1uR0ZIULAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:FOhpYljX2COH74lmwoWE0UqfU8ajmbY6N2JjMmqobNnE0GKKekSBaQ>
 <xmx:FOhpYtCEMCbftEQes56J1ZWFDyTbUA4srfwCxDaCBcTA-rD_dlgnxw>
 <xmx:FOhpYuIIoiqLX_lD8F0mdIJQjXz8sA_iYcdRU2k_dP97nqO9unVQVw>
 <xmx:FOhpYnQsPWyDjWUqZu2pBEbDnLXlxe2Cb7h5dC56uRH4ogO4gmhuzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Apr 2022 21:04:19 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: [PATCH 3/5] iommu/sun50i: Ensure bypass is disabled
Date: Wed, 27 Apr 2022 20:03:58 -0500
Message-Id: <20220428010401.11323-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428010401.11323-1-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_180421_109862_7A0BB321 
X-CRM114-Status: UNSURE (   8.78  )
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

The H6 variant of the hardware disables bypass by default. The D1
variant of the hardware enables bypass for all masters by default.

Since the driver expects bypass to be disabled, ensure that is the case.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/iommu/sun50i-iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index ec07b60016d3..b9e644b93637 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -374,6 +374,8 @@ static int sun50i_iommu_enable(struct sun50i_iommu *iommu)
 
 	spin_lock_irqsave(&iommu->iommu_lock, flags);
 
+	iommu_write(iommu, IOMMU_BYPASS_REG, 0);
+
 	iommu_write(iommu, IOMMU_TTB_REG, sun50i_domain->dt_dma);
 	iommu_write(iommu, IOMMU_TLB_PREFETCH_REG,
 		    IOMMU_TLB_PREFETCH_MASTER_ENABLE(0) |
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
