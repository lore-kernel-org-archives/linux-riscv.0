Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFE5C433E3
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 23:30:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1D5220658
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 23:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rszRK9HD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MUor4SQp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1D5220658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JaKjOpWHbVPYA0mtG8wi2i1l48DaT6JTUSRxNpIeGYU=; b=rszRK9HDCHN+qJ6dQcTYXDJfqn
	RxvZfQxDV2tHWSuV/oZTpnoFPo2IDGyFhct6yUC/lSRwAQwOi2pqOt2G0IuoRldzKnAOHu3wsp8xR
	MzysVeoOeIeXMyZB5HgCcif4Ar2lHCg2vg09jzNCkWYYfyzuplj6tRee+Vc4U8pAbcsd0Ox0wL3E8
	mPk7kUIpXpyp+YT5zowMHXitcIw91vxjeZU+vJjPx00ruR48ZpjrYBHLnuiGZoZCNNydz86Ds2v2Y
	1G6hFNf6KE/e+4L4xBeIcpcIwRrCgy4fA2PmBFJFG4Gw5k30rWamlfOWD40/Y0LIyggInDtyq+HZx
	vORun7vQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvqr1-00072G-J9; Wed, 15 Jul 2020 23:30:23 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvqqy-00070Y-Bb
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 23:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594855821; x=1626391821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0mCXGabb7HomZL/UNylxftn0LVKsqZIhAFSG2ya7jko=;
 b=MUor4SQptodOECNIdd6aTT88AbQLGv87pdLH2CI8bvgD/EmXOU4YlaNF
 DcPU1eOcxy1yiKXRKQeHsXZSmLEKnsYbYyPGuhjdf2gfoJG69VOSTo1ny
 kWYduCn1u5IwRww5BF+wV5E8wSPDmP3r1XXeiV3SL9vTU9VVLsqyXEYlG
 EHKA35w8bja3Z4YRW39RI0yIJMtN/7rvH4DcEx6hkvvkGFh+oI02e+mgp
 irO/sZdtsFm1BANYxIaTFMiIcp75cEsq+N4qGxMyhOn+7O05BkWX/BmGa
 l1TurqnbzWSmfw5IhsIjHNC1a+WsJrMGBRrhYJMoCC1yTD/xqdhAVFOct Q==;
IronPort-SDR: EmpgnmwJdovl3Qra5+/FiZSOJzzzWhbESC76K50/VbCsHgWBiNnMMErpPp+2uQWYeKE8ZU645k
 tFeqb0WOhEFFi+Tkkan22pNj97DYRMTe6XNLAerpU0w0gDD8mjwYuNGT4txXgGifFT+5A+tMcj
 8OVQ1V1ffJwutVcyCTEwPLrWRLgj1GdoYkP4HwxewwJuJGhTkUFa0Z/A3wUJC/qmKZ5jCVUar2
 FCJXHdvt+TcjBYIwk/NnAHbqvPjCI/FC7q4ozfTAPAEx+BOss51AXTR5zeJJokGeyq3K1qUhl+
 8Mw=
X-IronPort-AV: E=Sophos;i="5.75,357,1589212800"; d="scan'208";a="245592870"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 07:30:29 +0800
IronPort-SDR: 6XbAGOreq5+Rn37z99zHxtWAdiLWDowQD73gD65952C6s/woaOzCCmG++gOVzpYJranN7qIsnj
 J0lnRYPi52uWn6EbfRv/QXW0o8AMnqkK4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 16:18:07 -0700
IronPort-SDR: +CsTUYtNKlPYkJ+S7TcweDE7AVV8Gd7nWEuOO4mFmqvpmmZgOOuPWQccY1e+r16n814OzHcIiJ
 SqnxvWA9ei3A==
WDCIronportException: Internal
Received: from cnf009656.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 16:30:13 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Few mm & exception handling fixes
Date: Wed, 15 Jul 2020 16:30:05 -0700
Message-Id: <20200715233009.27183-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_193020_592815_E66CCCDC 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vincent Chen <vincent.chen@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series addresses some generic fixes that I found while working
on UEFI series. These patches are completely independent from UEFI
implementation and can be merged sooner that UEFI.

Some of the patches were already part of the UEFI series [1]. I will
remove them from next UEFI series (v3).

Patch1 moves set up the exception vector earlier while all other patches
are mm related fixes.

[1] http://lists.infradead.org/pipermail/linux-riscv/2020-July/000942.html

Atish Patra (4):
RISC-V: Setup exception vector early
RISC-V: Set maximum number of mapped pages correctly
RISC-V: Do not rely on initrd_start/end computed during early dt
parsing
riscv: Parse all memory blocks to remove unusable memory

arch/riscv/kernel/head.S    | 10 ++++--
arch/riscv/kernel/smpboot.c |  1 -
arch/riscv/kernel/traps.c   |  8 +----
arch/riscv/mm/init.c        | 66 +++++++++++++++++++++++++------------
4 files changed, 54 insertions(+), 31 deletions(-)

--
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
