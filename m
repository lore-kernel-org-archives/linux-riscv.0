Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305ADC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Up05Q6vm38WH4QckFJYUwHC+HnFW1L06+NgsDXcWVl0=; b=f7Py4Bdglw2U/J
	EWm+phajwtxi7NmwhIvk1O1Zt+Mjiv5JEiyTBS1lWmuCjQ5KK33I++XQIG49TmzPQlt/gtxz++iZ0
	MRDZ1oEmgkgbqdS2tqbKvsCTZ6QIBNBE1yQbfCUTokSihtMVGGmstZMcSnF+nqcBA7s+xDgjpIjTo
	5v5t8KHXvfvVtPh6eRssAW7Qoo3/mBqG3Kw09JVnGgT81Pt08kDrInFZVVznWRu7IdWVbcFEiBxK7
	Hdi+IOpF0g4qYIIvVIFipaggDKofOLW1EvrH4S47i965cv6tibEQsPXARAWS/BgIV24y29ZmrkDT5
	ZDWca1Fwu1UQ8QBK3iug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9Fo-005bu4-GZ; Wed, 20 Jul 2022 12:56:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9FG-005b9q-7t; Wed, 20 Jul 2022 12:56:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02BD915A1;
	Wed, 20 Jul 2022 05:56:03 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C81EA3F70D;
	Wed, 20 Jul 2022 05:56:00 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>,
	linux-acpi@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ionela Voinescu <ionela.voinescu@arm.com>
Subject: [PATCH v3 1/3] cacheinfo: Use atomic allocation for percpu cache attributes
Date: Wed, 20 Jul 2022 13:55:38 +0100
Message-Id: <20220720-arch_topo_fixes-v3-1-43d696288e84@arm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220720-arch_topo_fixes-v3-0-43d696288e84@arm.com>
References: <20220720-arch_topo_fixes-v3-0-43d696288e84@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_055606_385290_D251FF19 
X-CRM114-Status: UNSURE (   7.19  )
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
b4 0.10.0-dev-54fef

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
