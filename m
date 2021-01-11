Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F81C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 23:45:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539A522D08
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 23:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 539A522D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lJRw3YWEQ2bbZT1nIKDTinh8xoJPLh068FLhl7EkjjA=; b=yHrcB1hV/vlvH2q+cVNERtNIcO
	dwSQIonV2f2uyPjGL+BR7Dq50ZmA2Ac5DTIbGxH6KNRRfFt/T7pjCWhTrfRGaMe2WoXWfVLeGKcjy
	AZZU++pkRAWB8SOWrv7NzA7JKU4JLrZsaI/M3vcaNr4/FiqkzpWy9FovKsUWIJk4qj9KFIzSDTb7B
	6JHfKdFLYdzumwztkmgdnY8EiFEWQdvl5IsKKLXG/nU7u1Dsvsc8imTeQuDtUf6lw+ywl/rbo2Q3F
	mac01HCESEJl8acyBuPOJMqGBPd9LPv7b4iav/mBdmThd7E+FzErejIItUfSoT0VSlg3+ORekpEya
	FKgysMTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz6sJ-0002Kz-HR; Mon, 11 Jan 2021 23:45:27 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz6sG-0002IU-1G
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 23:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610408724; x=1641944724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tvZB29ktPRPxUbu7K7bplYyQtg0XnG4cGna9D/+Lark=;
 b=rn+y9uemGQVliNIwwR4dRFDod3Af+MlTiXjhzXSZuNcYkvd6R+646KLQ
 +PVS2yLn2D4lTA1EcQlH/zHb717rZkgRtJ5OQG4O7ZGZvv/DBxZNLzMnB
 VrZDkrfbREwb5OfuY+/AGSjd/6cGcw6a5oNqUrzCwy9zyPaZzRMlzXwqJ
 HeFmvoJAgw5/ekWgXj/hwPJmAoH+WL3MIczjEidc/0uquEcgROHZMkC/5
 V54skaLodIvmD9hBF+Nu/fh/DSDC1RXA7q2igIpj6WVhUMpHRceAOSGUo
 dUwHeEdGNbMfAPISwNmPvAb8cMKA44pxwvTylkpxepBlzEJKlwLOlN5Kd A==;
IronPort-SDR: 4OXtBSeolw0tAg9R1KSTqoZ/HSimSSsr7EtJWY7UG9cMpl075GQcVABJcs+Tkt6OlDL7zbWhU3
 +2Kqg7Sziy4vK0mjdP5frvo22nOoPPHhFbfgk3ei50rEYzuA7taITgp0DisqOi/8o+2yJzI6Q7
 T0p1w84W1Y6TKzbPY2I7csDv3jK5xo7xsa3Cc6liQx/IrKOYHONgejQ1NUMN99yZ8+ZrLSIT5/
 FLY29QWJJlLyvcCeErIitnD2y0/ksTPYesf4qybqRVsqLbTgVCBD4KrvftGGmRAlYHpacU7MMB
 BqY=
X-IronPort-AV: E=Sophos;i="5.79,339,1602518400"; d="scan'208";a="161629285"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2021 07:45:19 +0800
IronPort-SDR: 1sQoZoo+kdQG2Oa0IXfqf4Qp2gGxxl4tH0+oDlYm3CvJ8LPAznFwUtQjbuLzlyqR8fzgAilXZ5
 yPlMggpxMlTaaONYghnvDxO0UcaALdVxGSOGcnlnDbE+Vguuznod3rUI8NGz8HTneRsdbsc2Am
 YQ/6Xl0kfk4oNVJjhTWk7iIPMGLbBy2eXw29Efl+v7G8XR4C55a/0kqd8g6nw5ZlmUuCg2SKsO
 XVU+rim0xGdHeRTQEncz9wTeGsiNnlc0Kj90fWq5or5cxpewiIiUNAKKNqh85LI9pdKG5gQM4Z
 DPmcocYTQSfK2RJtnvDzOJt6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 15:30:05 -0800
IronPort-SDR: EQInO/9vri52nvmIWcEUHszD8BfL0SIUPoaYPJJMgKnCYS7YpuPA11r9okTng8jkPiD9/T4zoN
 nDK7ZZbZ+o35kmz5ht5VhN9IuKBxz8SQYNrHp620y6/g3erpMgJ0nxtzqxrRLqYuYqHeZePpMl
 0hjx8o4X9fXPR+AVpGucJCVncJeZDkbIRMH9B1+RFfcqurTCgEGYu3XXbfd5nhr4UF38mV2XPn
 bhX4YrOVKcarwsjP0C0bc6+moIW0MGVkGh0hxtrXMHFBa8vkaPDF3Qj5zKFdiNbT636BzWI/8U
 2hc=
WDCIronportException: Internal
Received: from usa002483.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.194])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Jan 2021 15:45:19 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Assorted fixes for RV32
Date: Mon, 11 Jan 2021 15:45:00 -0800
Message-Id: <20210111234504.3782179-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_184524_310071_CD725A2F 
X-CRM114-Status: GOOD (  12.15  )
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

This series fixes various issues observed in latest kernel on RV32.
The first two patches fixes an resource tree introduced in 5.11-rc1
while the last two fixes the case where 2GB physical memory is used
on RV32.

There are may be better way to fix the issue pointed out in PATCH 3
as it seems a generic kernel issue where kernel pointers can not use
last 4k of addressable memory. I am open to other better alternate
suggestions.

Changes from v1->v2:
1. Added Reviewed/Tested by tags.
2. Replaced PHYS_ADDR_MAX with explicit __pa(~(ulong)0).

Atish Patra (4):
RISC-V: Do not allocate memblock while iterating reserved memblocks
RISC-V: Set current memblock limit
RISC-V: Fix L1_CACHE_BYTES for RV32
RISC-V: Fix maximum allowed phsyical memory for RV32

arch/riscv/Kconfig             |  6 ++++--
arch/riscv/include/asm/cache.h |  4 ++++
arch/riscv/kernel/setup.c      | 24 +++++++++++++-----------
arch/riscv/mm/init.c           | 16 ++++++++++++++--
4 files changed, 35 insertions(+), 15 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
