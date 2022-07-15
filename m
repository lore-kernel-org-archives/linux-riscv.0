Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EADC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/hPXGbqYXBXBWiyj0JlTHlT5ax/ahJ6T9bCMyS788DQ=; b=yKicsikrltIiBb
	n3rGsNSrv7yWSRDSyTYF4ROdi1+LVM2zEYiaSjBw28KjGUfk1loTGbQPmn1XW3Bjc95DTUY11ZTIO
	ef5QYB0GIie9m433VzfwC8QU2uapYczkL9kolD6PeSbi8OPtDLrsdKsQIwtpThYa6gve3Vw4400vg
	Kk5gbx8J8AipfnTIz681hlLUAXM7MsJs6TcOlMv7N9zjhobocMM8+xb7l44wZLtnhijlz+wudWqPR
	MoVY8zQojlSgpiXrLNEcjjpLMUSe0jLwtwz2MSH7e7p3UARaXSR8aqQ9uVT6CvmOvkWf1CUQYHrIB
	vScEwKVvMrEDuE6XGJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCIX5-006KrJ-Oh; Fri, 15 Jul 2022 10:26:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCIWm-006Kkz-Na; Fri, 15 Jul 2022 10:26:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 942BD1474;
	Fri, 15 Jul 2022 03:26:18 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C99223F792;
	Fri, 15 Jul 2022 03:26:16 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH -next v2 1/2] cacheinfo: Use atomic allocation for percpu cache attributes
Date: Fri, 15 Jul 2022 11:26:08 +0100
Message-Id: <20220715102609.2160689-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_032632_838076_FFA5CFDE 
X-CRM114-Status: GOOD (  10.21  )
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

On couple of architectures like RISC-V and ARM64, we need to detect
cache attribues quite early during the boot when the secondary CPUs
start. So we will call detect_cache_attributes in the atomic context
and since use of normal allocation can sleep, we will end up getting
"sleeping in the atomic context" bug splat.

In order avoid that, move the allocation to use atomic version in
preparation to move the actual detection of cache attributes in the
CPU hotplug path which is atomic.

Cc: Ionela Voinescu <ionela.voinescu@arm.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Hi Greg,

Can you apply these couple of patches directly if and when you are happy
with them ?

Regards,
Sudeep

v1->v2: This was added in v2

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 65d566ff24c4..4b5cd08c5a65 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -356,7 +356,7 @@ int detect_cache_attributes(unsigned int cpu)
 		return -ENOENT;

 	per_cpu_cacheinfo(cpu) = kcalloc(cache_leaves(cpu),
-					 sizeof(struct cacheinfo), GFP_KERNEL);
+					 sizeof(struct cacheinfo), GFP_ATOMIC);
 	if (per_cpu_cacheinfo(cpu) == NULL) {
 		cache_leaves(cpu) = 0;
 		return -ENOMEM;
--
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
