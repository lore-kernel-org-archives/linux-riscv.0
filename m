Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E07C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 23:45:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C878D22D00
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 23:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C878D22D00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wahHBOYfIViNkpmTxTb7EsC2tGhJBZYaKIgx5PHWQ2U=; b=RDqAY9AE7YVnBNe7vztF3akmi
	Qazao25zVWVbHX+ZocMQzPP2Zh+yq0xM1K22ty53Tid/us1w9pOyaALrW1yQ2urQ0aNY/j137/YeZ
	snHD/Ybw2vxb9JIQr+BdUn6wvfYAJ9bplxqqupVqmvFicuDOBa6rFFnrOXSMv8vr2Gx8BfzgtmlrA
	2zS3soVgMJWSZV/pjl518G/lOgtf2HqL5AJD3du7T3YDtCCFfpamCZA+Cvebb5kSnqPzrye/dqoJe
	MkM3uPAXZLmn2kVD9RuI8d9ZnAxSZAlVO2UrYveLHkqCRnJ/tOcrOoaWKrp1/1iD2+6STbp4MvtG9
	xN/0+5AlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz6sR-0002Oh-0v; Mon, 11 Jan 2021 23:45:35 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz6sJ-0002L1-FW
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 23:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610408727; x=1641944727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+/8BmP8C7btVepEdnOtx9sho7KAoL9aXx1ciJIHqe4c=;
 b=CJtkK8YSiMLa1uXDAbcjlgIkMH96oxmqJZfFVKMkJYHcu6UFhAaq7F2J
 vYW7HzeIjNB8mS1H3oJbLvJH+qNoQ0QnRufxRvBT4XRPMIcdVdrkN32ke
 Lm+nortISb08y9wl/zxMTEms+OjXTbqE++FR82Vid0UAcwd4nPqg2WOO+
 um8DXq+ewoAk42oXDLOY96vAwpvSkmGcbbM5TsBdqM1lazR/nLdz5i5KL
 nxfixOS1UGjrOaRK3AW7NxHp4gGyLBqXW4wle9uVw4kvBzRTgbAbzi5dN
 3q1LtjD1w5clE0VjTOgDgbmQ/+82/Tv99dx7xSekUsz9uUCL+BhmG7EDN A==;
IronPort-SDR: qEY8ixB9a6Mo+KPT5TKUxu8iCqkdUo3gyRHpXcSLQHvyWU3RL5qLv/V0k+EwxS0zWwtIg9XBMm
 RDUVWkuvuktJfYoS0VWHBdg9jfCuyo9zT3W8oFXayhuYAzKZAoJci6/kde5RdCmg72W505x3ll
 AyPPzlJAkMkI7JA+XJgyuGXACbUEOiKAMGcWon9gATV0/ec6JCX+ni+K+5OSEOOBI9fqiVBNrD
 27HNenVjncaww5TJhc8GKFlpGur2Yno/aof//dPhBO2LdnvdyuzHQNuBxS6l52hkXKRlRduARP
 yvY=
X-IronPort-AV: E=Sophos;i="5.79,339,1602518400"; d="scan'208";a="161629294"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2021 07:45:21 +0800
IronPort-SDR: ak3VxDn+ntEkblC/4kJpxTIC21vdjyXmGdIt/9dM7WvY3WrvrLTRMeo2LUrfCvhbBqiFqOzLMm
 hcoU8sMmGyL8ik19kdV2NzjtXGcOjoLwwI2JKq5J1tsxGTlms91FeYELmfDybQlzKN3luKLspH
 VLui4PCzD2q30lz4Ei8kOXtAEyG/zRDwY7ikCB1Wa8I1Dbma07E6qwzIfpu1gW9tfuNAk6kYcr
 rml2h915VzVmV0ZZXtAV6hf4ZFHJ7pDxM29+K1In3y2BdoVyOk+jJR/KLPW/LQ2It5X6ap7eQJ
 XI0C6rskKBZ86cXVHtMrGo6o
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 15:30:07 -0800
IronPort-SDR: zFde0dV1F7ht98QYkLAXJBORMAjs7tHP3IEAYTIWsA4CUz13AiLqT4r5/9B7sGzVCQj6Arl1F+
 BOv2cKIrsO9wh6aJHd+ew9712SjYCDn0RdQBli4/sR3xKuEMybGbGBoNnXV/664RTCo8k/cbjq
 5D3ZdxYmNucNrCFlp7lNQR6mloDBG1f0AsjygumfCSo3sF5hl289xRO2iMVxG4Q2lqSvnxNboa
 YVd7oah5XAGLjlXnEhZl//krMn/kjLrO9ITDtYEn7cQKOTlKylcAgNuWteZ85PO9NI5iFkHLlo
 DrY=
WDCIronportException: Internal
Received: from usa002483.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.194])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Jan 2021 15:45:21 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] RISC-V: Fix maximum allowed phsyical memory for RV32
Date: Mon, 11 Jan 2021 15:45:04 -0800
Message-Id: <20210111234504.3782179-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111234504.3782179-1-atish.patra@wdc.com>
References: <20210111234504.3782179-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_184527_694140_B98E7198 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Linux kernel can only map 1GB of address space for RV32 as the page offset
is set to 0xC0000000. The current description in the Kconfig is confusing
as it indicates that RV32 can support 2GB of physical memory. That is
simply not true for current kernel. In future, a 2GB split support can be
added to allow 2GB physical address space.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 81b76d44725d..e9e2c1f0a690 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -137,7 +137,7 @@ config PA_BITS
 
 config PAGE_OFFSET
 	hex
-	default 0xC0000000 if 32BIT && MAXPHYSMEM_2GB
+	default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
 	default 0x80000000 if 64BIT && !MMU
 	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
 	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
@@ -247,10 +247,12 @@ config MODULE_SECTIONS
 
 choice
 	prompt "Maximum Physical Memory"
-	default MAXPHYSMEM_2GB if 32BIT
+	default MAXPHYSMEM_1GB if 32BIT
 	default MAXPHYSMEM_2GB if 64BIT && CMODEL_MEDLOW
 	default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
 
+	config MAXPHYSMEM_1GB
+		bool "1GiB"
 	config MAXPHYSMEM_2GB
 		bool "2GiB"
 	config MAXPHYSMEM_128GB
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
