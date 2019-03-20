Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E17C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 02:31:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA5CA2183E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 02:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G5/CbJY8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Nq1SfXRC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MLII/Zpr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA5CA2183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rKK5LHyb6l6A1hBNkTjaCfvWYyIZkFXtXvvhmjA1bkQ=; b=G5/CbJY8t+yV54
	e8ZIYI+W7NR8KwyjMBrz6j5MRQ+4J1R+ljGMvMjgDmkbf1RLi4vizJWM/n32t6gzUuw7Bi0shxwBo
	sSSCUmsG5Ifenay03KAQtponsMjC/mu6FWsd9sR4qDvYBg8DO4rArwb805+1ehXMM0QozAwayMFwJ
	8Um3j+CgF3URUu0oNd7QTLR8CK76hLXtI5DrczQWwLJOOzZBzsPgRQTch5rT2MALr8QsEURgMEFdn
	qlDsEahjKu9ZZpBcE8JmHnl/FCsOxbRo1mBzQ84xueX8Tjc/pQJvt5Hn82EBqNoXjuhRBG4M3Q1HY
	ptKHc7qFKOnCcz+sqK7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6R0P-0007Rd-3K; Wed, 20 Mar 2019 02:31:01 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6R0N-0007QQ-5K
 for linux-riscv@bombadil.infradead.org; Wed, 20 Mar 2019 02:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RgxTNdpyjGGB9dtPaNdHly41ps2gGPvu+Ckfu0ekCeM=; b=Nq1SfXRCTiacO3kX3RBAco4CCa
 cGY3bCgQt+ZNOR1L4bz59Leew/XXtfxDfQ56cstGyq1rb++LyIr8snQZc7tMVrwAccO8i1+1zULQ8
 U8dsVRDXDyEEcVgbJqOgGf//+Wy5VBip8i0//5YIM79vWXiXRHslxjq0/CKvoteD6dg/T0i+EZLpC
 kOPakdw5HeZD5Xyj1EdjkWzUPGN8JPH1a0KEvyJmoWTrbVA/sPXOkML9fbgs8Y0rn3CoalKcPc1LI
 4HAS899puxWpI40qdHDhfLm4QPgcDzETM6WqvZcdLxeiFxeQYkMOIkghh2JqHq4mT0SXzKu8jmfTZ
 zD94WA2g==;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Pxa-0007Xx-2F
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 01:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553045042; x=1584581042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lYOiNVXIFijZTchZR9w80k81iGI9ZC4OCoqKQHxX6mo=;
 b=MLII/Zprj+Lmu6E/j7z7KLeq/LPBkWzSYsXnlFc+53hRndeDox3k818p
 ngGiWHMzfWGfPAGCCYtY/Ljh5Us8k+W5jxppOzcpGic8HET5Hg+C2pNro
 dRdqp/qzVEgtgjoBwesZ+2CzHBQsGY/pLk4Dqk49Ntg7GAt+PsVRamgli
 p9yG5LP4v0vMTwfBSQML16Oiya1bzX//z/0xXVPVOcTnpmYO1RQG7dhdB
 yOP3dHh1Go/rQPpJcEqy0jgRPhCXJdbM8E5R97inGeMcQiyAlkD3wAM1i
 ZH1n06Zp2cZzGK17sEpahWxOljNEXOwJvGHmbxMA8Gxv6lPn47YDwRH2p A==;
X-IronPort-AV: E=Sophos;i="5.60,246,1549900800"; d="scan'208";a="105533370"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 09:22:58 +0800
IronPort-SDR: K0W8anphCrJ2bhubk6TwzMEGDlkVmFYzSF49SP+wxEBykAjbD3FAHNnJz5rBfc4niHntxojHB3
 NZEYjmGwtiyZpSlDssCIxoFQJXt5lzgM1D1ulxtugnNGghTchsFCS+cSnoJqa0cHNxX+T/1OCo
 cBFUEMo6mrViCDEVt+/do38rFyM78ibdQg2sUO3tKKoG1IUrQwGMZxbPpxzoZVTZD9nMRCMInR
 qBFZT7OFYGSikMOwxR32g2VvPnPmmTTMHD6Q9TwjJpoOTq4/dRHObP0LVhMsmNLJ2zTw2QwHeU
 5gJ82e+bRn4mMJcb7BzgLRvK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 19 Mar 2019 18:00:34 -0700
IronPort-SDR: n7npuR/gzPCjoFn/NcxReeL9xQgP7vgrhpS9wgdRryR4DGcWftyVtRbhu66rfftDYHvc+6SiMe
 R0fQJloMOcvFy3lFdGLOv9jc2XCDRArw+YRNf6vac2X0hXfNog6po0A9DsGfVvp+2uB5r5Ujrg
 xks9uurhN+8iVmGuhlNVJLzZWaCZtxPpZPhMHICRtFOvTSxELo+1hTllgFUMpMTJ2U+v0aNpM3
 cEatKLEbu7tuCVC2eFWCPT7AqTS/qEQfQj7OSUiFgvctPfPM8j8d8trGKURTkaFo+AdDUGIk4F
 9qs=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2019 18:22:58 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT/RFC PATCH v2 0/4] Unify CPU topology across ARM & RISC-V 
Date: Tue, 19 Mar 2019 18:22:47 -0700
Message-Id: <20190320012251.2728-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_212402_288216_CCFD912E 
X-CRM114-Status: GOOD (  15.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Morten Rasmussen <morten.rasmussen@arm.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Ingo Molnar <mingo@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The cpu-map DT entry in ARM can describe the CPU topology in much better
way compared to other existing approaches. RISC-V can easily adopt this
binding to represent its own CPU topology. Thus, both cpu-map DT
binding and topology parsing code can be moved to a common location so
that RISC-V or any other architecture can leverage that.

The relevant discussion regarding unifying cpu topology can be found in
[1].

arch_topology seems to be a perfect place to move the common code. I
have not introduced any significant functional changes in the moved code.
The only downside in this approach is that the capacity code will be
executed for RISC-V as well. But, it will exit immediately after not
able to find the appropriate DT node. If the overhead is considered too
much, we can always compile out capacity related functions under a
different config for the architectures that do not support them.

There was an opportunity to unify topology data structure for ARM32 done
by patch 3/4. But, I refrained from making any other changes as I am not
very well versed with original intention for some of the functions that
are present in arch_topology.c. I hope this patch series can be served
as a baseline for such changes in the future.

The patches have been tested for RISC-V and compile tested for ARM64,
ARM32 & x86.

The socket change[2] is also now part of this series.

[1] https://lkml.org/lkml/2018/11/6/19
[2] https://lkml.org/lkml/2018/11/7/918

QEMU changes for RISC-V topology are available at

https://github.com/atishp04/qemu/tree/riscv_topology_dt

Changes from v1->v2
1. ARM32 can now use the common code as well.

Atish Patra (4):
dt-binding: cpu-topology: Move cpu-map to a common binding.
cpu-topology: Move cpu topology code to common code.
arm: Use common cpu_topology
RISC-V: Parse cpu topology during boot.

.../topology.txt => cpu/cpu-topology.txt}     |  82 ++++-
arch/arm/include/asm/topology.h               |  22 +-
arch/arm/kernel/topology.c                    |  10 +-
arch/arm64/include/asm/topology.h             |  23 --
arch/arm64/kernel/topology.c                  | 303 +-----------------
arch/riscv/Kconfig                            |   1 +
arch/riscv/kernel/smpboot.c                   |   3 +
drivers/base/arch_topology.c                  | 298 ++++++++++++++++-
drivers/base/topology.c                       |   1 +
include/linux/arch_topology.h                 |  36 +++
10 files changed, 414 insertions(+), 365 deletions(-)
rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (86%)

--
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
