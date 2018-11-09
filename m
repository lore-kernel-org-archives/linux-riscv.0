Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CABEC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 01:50:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D2F20840
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 01:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aofwAW6P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LceStvsm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ilZpeQ8j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51D2F20840
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=U//YK80af/KMOUipagRowlGpcWpgw12MlJImcfcUfo8=; b=aof
	wAW6PMZsFu/I9ztwNl4XKEtQUFUN790Lk0pGFa+D2NVYj+cZFK+zOAVRgSI19tNkpIqY5fawSdtY8
	47zEYawu90Lgoqbr2HRKGmkkCrz4LkNyX62SPgVk5rcOsaXXHLB7qQO/VGSqcY3b8zu4RUSLV7sBp
	YZGOsPu6fjP446vAKDj1mXxN/5RkMl+JZQSL7XWmA+spZfjpK22EaYAqT1miVUSk9NG0ZkNF83G2K
	seOnQjX2PqFSfkSTjDDH+101Ptv+9ejWq8Y5CxQmUZLhGW1TcGVDJJ9TRYPjaOERFcwOnhNB7H6Xl
	nvV/K1P0j6IXrXyeZnerMZAQlZTQ2Ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKvwL-0000FW-PT; Fri, 09 Nov 2018 01:50:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKvwK-0000FC-Ld; Fri, 09 Nov 2018 01:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3gO6i754AHIiEy311pHr+AmmiKPxyBupSir5I8iCPH4=; b=LceStvsmT788Oz9xpQpiq892R
 a1JW+PioplWWtAw96dHHq0nt8ilmiQ47nzSmBQeHxGOlR2YW1jb9wer9MDC3aPJjLJNjXoxcZ1mKy
 fSsWXM6u52ggz+jiB8ODTsMBhhVs/hRpCEXO91gbfETRSiXQb8NlOgKIi8yEKpgZITmoU3CMiJUWH
 +ChPFjeO2fi379aGrdhUS3vs9CqQv4svzsmNuAEUtFMp77QzKmqBbn0S0dXqEG7vnsPiTaqmqE41d
 wY45n5n6HtSs3ATbRrVsopThK6L/QylEjry86dHLGHGfudkwSehJETPyYCZG/T8Xil87HUZ2IcVSc
 1BVmiFU1w==;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKvwG-0003pb-82; Fri, 09 Nov 2018 01:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541728225; x=1573264225;
 h=from:to:cc:subject:date:message-id;
 bh=VF4xDTCd1cf9MNbFtsKdQRmCcMT129PQWO/5Qc0m0p0=;
 b=ilZpeQ8jyyVFtFdn4Lc5JugewvC4kZiES8qraBhxNsx7lXFkiIiOZ5Sw
 B1xq3auPPhzJ13GKVsC9CxoJ1SndGBoZUsMqsK82biTUVwuNpBLmmtYtA
 l9wgz6gRRDMznwM+9/oi4FAkARb4WlUbrmePGH8v6KIAHE/vz53DUqGpM
 XyeYMWG93hbwb49dwNaisN9qiAExg/zPLov5z3MIz4kinKUvohseUEWwS
 p4IiF26AN9Rdb49TtGwIlrkYkHJQAJL6PMe6NMXLXpBQSFoNYnXwPlUMz
 Ve0x5/CLplt4/T2cr/iRBGiwqXoAc9nVrmLA3iPPI+89/DkYW8rl+RRx0 A==;
X-IronPort-AV: E=Sophos;i="5.54,481,1534780800"; d="scan'208";a="93844215"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2018 09:50:10 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Nov 2018 17:33:43 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Nov 2018 17:50:10 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 0/3] Unify CPU topology across ARM64 & RISC-V 
Date: Thu,  8 Nov 2018 17:50:06 -0800
Message-Id: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_015024_559797_430A72B4 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 juri.lelli@arm.com, anup@brainfault.org, palmer@sifive.com,
 jeremy.linton@arm.com, atish.patra@wdc.com, robh+dt@kernel.org,
 sudeep.holla@arm.com, mick@ics.forth.gr, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109015006.mPKfMT5CmxYGJTd3NEbAWVgkrGxNndcUwbH7kc4rtHM@z>

The cpu-map DT entry in ARM64 can describe the CPU topology in
much better way compared to other existing approaches. RISC-V can
easily adopt this binding to represent it's own CPU topology.
Thus, both cpu-map DT binding and topology parsing code can be
moved to a common location so that RISC-V or any other
architecture can leverage that.

The relevant discussion regarding unifying cpu topology can be
found in [1].

arch_topology seems to be a perfect place to move the common
code. I have not introduced any functional changes in the moved
to code. The only downside in this approach is that the capacity
code will be executed for RISC-V as well. But, it will exit
immediately after not able to find the appropriate DT node. If
the overhead is considered too much, we can always compile out
capacity related functions under a different config for the
architectures that do not support them.

The patches have been tested for RISC-V and compile tested for
ARM64.

The socket changes[2] can be merged on top of this series or vice
versa.

[1] https://lkml.org/lkml/2018/11/6/19
[2] https://lkml.org/lkml/2018/11/7/918

Atish Patra (3):
  dt-binding: cpu-topology: Move cpu-map to a common binding.
  cpu-topology: Move cpu topology code to common code.
  RISC-V: Parse cpu topology during boot.

 Documentation/devicetree/bindings/arm/topology.txt | 475 -------------------
 .../devicetree/bindings/cpu/cpu-topology.txt       | 526 +++++++++++++++++++++
 arch/arm64/include/asm/topology.h                  |  23 +-
 arch/arm64/kernel/topology.c                       | 305 +-----------
 arch/riscv/Kconfig                                 |   1 +
 arch/riscv/kernel/smpboot.c                        |   6 +-
 drivers/base/arch_topology.c                       | 303 ++++++++++++
 include/linux/arch_topology.h                      |  23 +
 include/linux/topology.h                           |   1 +
 9 files changed, 864 insertions(+), 799 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/topology.txt
 create mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
