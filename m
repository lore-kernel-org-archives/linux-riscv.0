Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681F1C282E3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 21:48:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 390EC2183E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 21:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kBHyjkXl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dJQpKXTz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 390EC2183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kf+3iaV2uVuaFA8646x6tFAO7k/pXOT1LXf2iS+Zelk=; b=kBHyjkXlcN9r2b
	jGYNi1k1H5BQEn575qcw913vfnK9i3hVzgDW+9+DYjQiprZIo3UbIifWoTD/UpcN7U7gF3nAeIJVe
	8Dlrkt2UxzDtPZpyYW5dD0VAwm3cmKEr2079yKx6bual66TVJXpntXD3JtrcbXBODNkpxUUenRucD
	XzSglUeeTa5uJkH+oJMVbM5Qqa/kgXAuFJjjPL+qSCzciUWGC141P8woKWWi5PNeK7isjT40ztbDA
	9gmretUUQ3hVn9i8Dehdsfcc2WPHDAKUq5XBMovmkix7+uhltgN7+7649RxvpGphHbWpAy2s1YXzO
	XaWyh2ibKv9YuVXX1FFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJPkX-00011X-LW; Wed, 24 Apr 2019 21:48:17 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJPkU-0000zs-Sw
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 21:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556142494; x=1587678494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XB0jNm8XAmZo+/vy/Z4p8xplRHuYAnev6DXaDcrItTg=;
 b=dJQpKXTz9Q84QGTSRFhu12cwc6OWPl4kvjvaMCSMJCY+IrIRnE123dp8
 jwPE6bESVMKYmlATUqJIeaNZi6h4xwC+CrwYVOSjHwMqbg5MW8S0YgGPq
 t1X5NyC5lZJklU4RuyOBGv8kgazjxdWmXE3DDocKtQvux9+7bVQaaPRiE
 yI9pqN8SkaYoD40jIrXQmZqnqESiItKIHU0I17LzRLG3a2csmU+LNx/cF
 NhOgxe203kGdSbr6lHYlciUETYbJAX1EhuC1528n6yPZ1EYYmC8xtg7nt
 EBmLB8GNKqEvn9iqAnkfHENphBDTcSGJtN+q2OKwZQ3yuYZezlfE14LOE Q==;
X-IronPort-AV: E=Sophos;i="5.60,391,1549900800"; d="scan'208";a="212581720"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 05:48:09 +0800
IronPort-SDR: R1QJTJ9zEg0l9UdYRgfOFLugcJGR/0Ba7K1XOGroN2OwPMfOBzBigUu2Hgel9NEwUytWhRmx+P
 aLuBN9iDR0HSlaqB4JT+z3DMSG5QciDnwJ5XBCWxovKwcGTZxnzAVsA/cuBOPpfvqQL7i68dPf
 tXvoQOVahDcJISnGopWYlIiXgZUrxLqhOxA7Ok2xl3/wZcEgvVqMUZyg4F6JE23LV2eXKSdIOn
 /eAOI09EREG9PIv3I33elWP6ZgpKXxQuQ7neuNUIQeD4LdAC9cvZAFDYHKzRM7AB9KYtVYVksJ
 oqJYKIwZrS1+GUOgnd1uhYhV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 24 Apr 2019 14:24:40 -0700
IronPort-SDR: HLkDr4BUsM9O2QFWPr3nEUiN5P3LUaDU6JBXt/kqUeRrDEIkSnCaz6SdfwxdnINKhXUlwrQukO
 0oXxnessp/5y57i64ZMlIBpWwCnSeJyGptiU9XJ4bjs/M3yCkLU+x7fSNxWs34DqpwoGUFAzwC
 jj22z1kBSqrEpbqVfuk/Wcm9tM0gHt/Yqs3pKPxigHkBrJdq2JxXDYxMg2Ki4ax6x/5xNmSxNN
 5HLO2nXzam2pATOgsLP1OVa4D4IIh80H/sLg2x/eowj3Xw67eC+a9JfuxONpfKEhvqlCB/RQF8
 1ps=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Apr 2019 14:48:09 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Miscellaneous kernel command line fixes
Date: Wed, 24 Apr 2019 14:47:57 -0700
Message-Id: <20190424214801.18880-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_144815_051574_6EC83CA7 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Assorted command line option fixes for RISC-V.

Changes from v3->v4.
1. Fixed few checkpatch warnings.

Changes from v2->v3.
1. Merged patch 1 & 2 into one patch.

Changes from v1->v2.
1. Update pr_err string in patch (4/4) as per review.

Atish Patra (4):
RISC-V: Add RISC-V specific arch_match_cpu_phys_id
RISC-V: Implement nosmp commandline option.
RISC-V: Support nr_cpus command line option.
RISC-V: Fix minor checkpatch issues.

arch/riscv/kernel/cpu.c     |  3 +--
arch/riscv/kernel/smp.c     |  8 +++++++-
arch/riscv/kernel/smpboot.  |  0
arch/riscv/kernel/smpboot.c | 22 ++++++++++++++++++++--
4 files changed, 28 insertions(+), 5 deletions(-)
create mode 100644 arch/riscv/kernel/smpboot.

--
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
