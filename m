Return-Path: <SRS0=n1sQ=GK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D613C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:27:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEA8D2312E
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEA8D2312E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CxQcdzbGXRfmdC8WDkDClC+b1aO5HTN38QTcqvxcWVU=; b=ClyUnlvi4tyQGHRtbwi1uzdnJE
	Ku7V3xVrvRNjTuiojfFwu8NDgpg6y94PpMAPAxD+cAeAUapsWU7ltC0H9Ii5UuoW0k/6ORXpnh66U
	hWmQV/2Gj8sQhSUTpdQW5fyfwhB0f9yMita91Z7K4Ri0Q9QMyWq3TV2koqWr5q/+/MYbaL+DMgGcQ
	eCC/VzIwWwV1GRctBNI41UJvttZhdTWEwypDAGlOgbHvW5PLQWCSgWiYjSkTvjKsRO7gSwniYQe7m
	VD5daFJrw5omyzZt3CjeBBZWdFP5jYsdNplcntygw4ws6qLu9QSWX0K3hSQwxHX73y8svDU/hzpLc
	qW1xTS0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxRZv-00019h-7N; Thu, 07 Jan 2021 09:27:35 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxRZs-00018a-UT
 for linux-riscv@lists.infradead.org; Thu, 07 Jan 2021 09:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610011652; x=1641547652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5ByP4Y2MXebg7K5MMh53/5S5y8lmTDokOMvG6dAOPT4=;
 b=WSsTsHOyx0SopRZ3gJ+eagdj+vDkTHL+o2BZEfBeZk5c0qz2mPhXKRKH
 gm2Mk7Xcu/9HWeRXRvOGHgZlwDpC8PCGUuGmQ7XmBNYF2Fwjso2GABsSV
 nUgMh5z9nOXqMyGhSAORl6h5cY3y9cAq96iMbtxeWJSgiDPdG/thpTx2f
 euVPo3j/R7dpBVIDf/Lmc8LUTq1zwvfWfp6BxwhgoGABCVTmkTbHq4E6H
 6b6Suh+nCb/Hlhs7bRlnp+ra6HRqadrmiwJJhm51/RYsFcYC0hv7+Ryi3
 Akl3KKrZS+5Cq939WBf4xYTT6V3cpw9EG6hDY7VsyyZLMPSeyLpTD2Ufg Q==;
IronPort-SDR: Wl5L24lbAi3qKrmGCa6bdqyXu/wS6rCVwteucR1ih+zl6xYJqgsMPhC5Xy8iqowd3pCFk8h6Yf
 yNZEbzn3z0rMw9R5J29Jv5IoTFG/KLBwFnA1YEFYvVYG7lbX0G7M2aaqHm7jnSeeSVXtKrOeKh
 V2Z0vOOviuLtLlYCDOhtEpt8oAFlEQ2TWcKD1Vi+yZHhnMDz5eo+/UznfIzGSqbXuNdOmfSPQl
 ipbV2cALZrT7kk+jwjYevha+Ft3ebOtBGATai1lvJgy2eQjmWJkPWZZcbiHoFV/pWBkMpOlkDY
 TfA=
X-IronPort-AV: E=Sophos;i="5.79,329,1602518400"; d="scan'208";a="156751184"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jan 2021 17:27:29 +0800
IronPort-SDR: mhCGsV43zFxBklG+aigQiwBXcuDI8xArvoX2MJAd+3KZjyOah0HVtmE5oO7a92cFfJGS/splVB
 GiKiZ+YdH7yjL4R9DiKxXzPAqgBcpReNKvrSUOxPjdLrsENFn9OFYcmPjgAAzE/BvN/DaGfVqH
 X7ySGb/ZCWX+vEGk13+wNY6XlYbnWO8lcf5JN9O/JB8GH+XRdLlzGhdBTbklrUkObnCksN6umu
 EMSh0oLpcghym+l2h4higZZNl7N6ISqSxUTHgWG1nPtN6xgSh0W8gRzgF8VAhRzagANZYGsOT+
 NFfpGLpe1ZqSTSTbajaBzvC9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 01:12:20 -0800
IronPort-SDR: kr+h0ka0huc4Zv/VwhAr08nh9zKSBr1QFmPF6J/ILRbhiEAuciNDSDeD1XDQur+VG4aW80gEtd
 37xIVRq2k1FM9HxvDxtH9T4PgP3LYXUyn5nbwORH5Ja+Y9JqVMelPfPZU5BpngIlF/dY87HOFy
 WfI/DUTQKcynW1cilYC5nkbAWFsKOWfcxPnTThA40fbD+bdg752WTQfN4KJSPKRCS+YD7ezBz+
 9tdbb+oH3vrBho4n7sZhiM96RCSCCYBeuxUeEc0JRp0PUM5IDFHDRULp/xBme2aU6K3ksAAzbc
 4o8=
WDCIronportException: Internal
Received: from usa002483.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.136])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jan 2021 01:27:29 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Assorted fixes for RV32
Date: Thu,  7 Jan 2021 01:26:48 -0800
Message-Id: <20210107092652.3438696-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_042733_213062_6834D349 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 linux-riscv@lists.infradead.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
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
