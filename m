Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B559AEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 10:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyX58PF2J8Oxj0w9E9FFr1Rn4mbBAf1wTWwVe2D2u0E=; b=gLUhmszq1HLFlp
	hMHbkMFfZae4tSzfBEbFdWQMFX093V1aJ9ZuV2JpHqjtpl9pgDQI93AOwYE5EEDGkV1n54PXbUjtA
	Qml4Bx1Tdfqd8Pa09Rl41h7QJCcsv3BVME/SDHJS/PZa6WPoZ+NRVhKXmg3Rl/ixI8pLq7xHrmX21
	UgPqfMZbuKJew49DU029SrdL80b788UM/1auTwPtvZJB+iBUCH2pTZJyfV5YMeIfHu7djstwVpC83
	+gFBNW3+0SdI7ejPacJOCNPMq2YCtVhDx3sZ0DC6TfCmiKgrUKFidQj3orCOhOVRVpDELs8wbJtgV
	+7ZGpbKFzkF8o1g0bs3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6eR-00015F-16;
	Fri, 16 Jun 2023 10:25:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6eP-00014D-06
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 10:25:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7BC116356C;
	Fri, 16 Jun 2023 10:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38D1C433B8;
	Fri, 16 Jun 2023 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686911152;
	bh=3gJBdkkoAodYuniUryayjLAqsHJEVzhZbdczoKm57UI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eNw0yfMea/53qmKDgJ04BlSUJL8G4y18cm+ktFXU68qvA5LNQyYXQuXH5pTOHGcA6
	 KFMNRBRpttkgk6XjklE4/WKfLCCaNiu9hUQhE0jc0AinxkBEu/nYrCLmCbr3d1f8zL
	 QePVtZ8BqROeMvNzLmqLRIwcNlDPUdr+AEPEV6SUDeUeoYDRnVVQY2iXktpoc+n699
	 zLtWQOHDHf+5GhNH7hdinz/O6DtulSSrmml+1nQOxBvLTaIhBsyJAvetRifePWiuOH
	 x+lmYjnin1Gl0wqBMNJkkRKe7fOH6u5r4PDo/mCiPbhu5M8afN7+U1aejzq7As5B5F
	 DmiH00aSHtNGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	hca@linux.ibm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	masahiroy@kernel.org,
	nathan@kernel.org,
	svens@linux.ibm.com,
	linux-s390@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.3 15/30] s390/purgatory: disable branch profiling
Date: Fri, 16 Jun 2023 06:25:03 -0400
Message-Id: <20230616102521.673087-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102521.673087-1-sashal@kernel.org>
References: <20230616102521.673087-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_032553_108654_F21D1F20 
X-CRM114-Status: UNSURE (   7.69  )
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

From: Alexander Gordeev <agordeev@linux.ibm.com>

[ Upstream commit 03c5c83b70dca3729a3eb488e668e5044bd9a5ea ]

Avoid linker error for randomly generated config file that
has CONFIG_BRANCH_PROFILE_NONE enabled and make it similar
to riscv, x86 and also to commit 4bf3ec384edf ("s390: disable
branch profiling for vdso").

Reviewed-by: Vasily Gorbik <gor@linux.ibm.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/s390/purgatory/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/s390/purgatory/Makefile b/arch/s390/purgatory/Makefile
index 32573b4f9bd20..cc8cf5abea158 100644
--- a/arch/s390/purgatory/Makefile
+++ b/arch/s390/purgatory/Makefile
@@ -26,6 +26,7 @@ KBUILD_CFLAGS += -Wno-pointer-sign -Wno-sign-compare
 KBUILD_CFLAGS += -fno-zero-initialized-in-bss -fno-builtin -ffreestanding
 KBUILD_CFLAGS += -Os -m64 -msoft-float -fno-common
 KBUILD_CFLAGS += -fno-stack-protector
+KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 KBUILD_CFLAGS += $(CLANG_FLAGS)
 KBUILD_CFLAGS += $(call cc-option,-fno-PIE)
 KBUILD_AFLAGS := $(filter-out -DCC_USING_EXPOLINE,$(KBUILD_AFLAGS))
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
