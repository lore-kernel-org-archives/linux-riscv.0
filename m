Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5587EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pbhr/NTahXInecJOmFq8TziD47QAOyAPMqN+NTns//k=; b=eDJAbdZeCPuwS6
	/48vZL32EdKc03r8N/yylriIybfPDWvBvVkbDf68UuaY6RMyFE2VpqzdBskW7/IixYb0klpcwhdD/
	/fbUVrLFEEc6YhVOS11JnfjnEMvu0VFhj/VwCPIuCZDudW8iP+Ug8GwFG0AqLlEdwZM0N4hUZR/w3
	3BKV8MRvu7Ce4YabZxuVh6VyBB4zrgiCjbpb8yyl11MaGUeZu4kRJRxy0+UnN9LCJNb0pN+H6ta3f
	ipfYJt6d1vJovwSUZOcB4FscptqZt4RSV+lYLtrD/kQHqb3FY5Ljve1dKuZzYNLnX2yv7ev6hSIYK
	chSkhDU/LnUnZXAQeD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6gf-0002Sn-2L;
	Fri, 16 Jun 2023 10:28:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6gc-0002Q8-2w
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 10:28:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 628EB636CF;
	Fri, 16 Jun 2023 10:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48438C433C0;
	Fri, 16 Jun 2023 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686911289;
	bh=CPJtvXq+0UcPj+i21l3YUmyr8tluJ4O7kby0EZfq1Rk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1umlr3UJIfQ/sOB5CLMHNf9mXXhhnz3/EZsqrkoRsq+Hwk40atBSh2csgRpObHQ7
	 G6PTDteOtX+/2ZwxcK/Bqmr8A88V6aC3ZnnE9HO/3TnyPtTlV3Ijdc8nNDo4fSc1Iy
	 P1wpo7bFVNIxwYJPHbKOlHI9f9UbAMNK8Pt4r0jfstrOc18Yg0e1gVS0Pw9aK5FY8t
	 4usVTS3VYBxGHZRfPjvmcRVqwq3MrXHEfYiUkFa2HlccD0HZqUK7RnP1UJXRMDYGMw
	 d3uyGRunsV2kmDyztZn71BQg8A9EkgVdbQTxh001BDPohjpUjs9pY6wdobp2xbcXRl
	 EpZ3BI0iKhW2w==
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
	svens@linux.ibm.com,
	nathan@kernel.org,
	linux-s390@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 07/14] s390/purgatory: disable branch profiling
Date: Fri, 16 Jun 2023 06:27:44 -0400
Message-Id: <20230616102753.673975-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102753.673975-1-sashal@kernel.org>
References: <20230616102753.673975-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_032810_989368_13032CCB 
X-CRM114-Status: UNSURE (   7.58  )
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
index 21c4ebe29b9a2..a93c9aba834be 100644
--- a/arch/s390/purgatory/Makefile
+++ b/arch/s390/purgatory/Makefile
@@ -25,6 +25,7 @@ KBUILD_CFLAGS += -Wno-pointer-sign -Wno-sign-compare
 KBUILD_CFLAGS += -fno-zero-initialized-in-bss -fno-builtin -ffreestanding
 KBUILD_CFLAGS += -c -MD -Os -m64 -msoft-float -fno-common
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
