Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8638DC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 23:05:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DAD217D4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 23:05:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qViZB0/a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="DCRd82DW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DAD217D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TIRD7DSDNooNVigWHDY8DbY/NUsYNWwenMQYCVSqgPQ=; b=qViZB0/aNoT/ur
	eTRMNfe2NJs+ib365fRS8ajzzc1E+vMjwGFStwbiuFIFhoVBNQQiipYnwRA2zUFq/gaA8Gw+6ck4w
	l7fVQ8VE/vC6sHVmVMJJ064RKRN6npjb+xNmQZvMtUZNwb+LjMhg8tjbHarho1J32STt7WcSekcY/
	vr3SS9usChHd4RnNsKqnCOrx7MXpEeOdmZVdLDmEaWpUSsJ/pYu6zXYbkjzHiRBuPmanWqEPoTZ5g
	pc8sfTd41Tlp/6h/Hm+p7ct/hC/VR3lORXj4OL6vlxAPEYw/Q0zlRfhrMaYu4U5TY/Hk+anwTRLsP
	g/5/Xu8bz2on1A9iXVVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEMH8-0008Um-BN; Wed, 10 Apr 2019 23:05:02 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEMH5-0008TX-LF
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 23:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554937500; x=1586473500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GLs0GoxRzUrfv22VND2PfnCLlwY3Um+V6ZRAqFdvJic=;
 b=DCRd82DWgoKQnvCMICabtb9sEHM1psLYYg0jDWGFy4SBbV4xP60kwNXJ
 aCRLn/AHKkN/ILmrLhDbDd170exmcZ4tQyj8yGwiEmOGad0VB5xL3THf8
 F96RHRx2bRIh5WoYiTre97X2y6WvdGwJ087vPJSFblYiaGqU1wU1WbwpU
 apGyVk1qmSKdsyd+KRznecrZ1YHGRudxCXdb2OMkbSDdFvE4c/h5K6OQI
 7Y+m89IrsT5SREoMuMNFK2h94g//l/sya0SARVN0rtLuUr4VeEr2uC+si
 c/WoM6iK8qxZUNyRt0MVaJ2+KnLEadOeWBZ7XJIFlX6QrKuYUv3wFDHd9 A==;
X-IronPort-AV: E=Sophos;i="5.60,335,1549900800"; d="scan'208";a="105472260"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2019 07:04:59 +0800
IronPort-SDR: Mzy+cugifIhcat9n1xBXTpJvwMpezZEfDsyE0lsGclUngIX0t2CYZmkkLMfTE2gbNnfc7cPxeS
 bkLpfhhDzQq9EowZ7BQKbO/vbbOKoqk4N7B2hm9B7kX1MiX/EoXk73G7s4YNYqwVBHZeLw7ByE
 d57mXr9/AqWs3H1/5IEB7pjGeimnC7b7+skc7n+FAH7LwBwMsXcJWXihQ3enRgCNMHTcOE9rDa
 pb/dntOK8tVzz8MUJhtMJqZwt4fo3Oi4Z8HmAHWOJRjJCWlLH+xqDSDUkrUk1oRbu2Tf9voRkj
 MqjQ1gSVksJFJXbABi1FDZ8P
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 10 Apr 2019 15:41:52 -0700
IronPort-SDR: zAezptHMBcF3SaRvVTnC+jsYaiyx1J5/a/GTFW1QBEGumpEwYjawwuSewMtYYPIASdxheJ1JJf
 +PGD2epfHl4RBRz2Ce/FOjT9g7mikC+PnrdwVn944btrwc7I9ktZF6/AlqBsEEHe72gHEkjPcN
 yBStiVZ55Nw/ZSCyqhGhX29gzf0cw9AliY9s5emYMGVjtpHvujPHcY4nCmJHA4Pby1ZcVOfvxD
 WGWJA0XCgYz+a2MGaQGehUZrDKnOpNFR1aPiMT9EuuLrvG7uVowP4Si9MA+9ZFCGo0+hpslTWZ
 DWk=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Apr 2019 16:04:58 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Miscellaneous kernel command line fixes
Date: Wed, 10 Apr 2019 16:04:39 -0700
Message-Id: <20190410230443.15729-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_160459_758916_737677C5 
X-CRM114-Status: UNSURE (   6.72  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Assorted command line option fixes for RISC-V.

Changes from v1->v2.
1. Update pr_err string in patch (4/4) as per review.

Atish Patra (4):
RISC-V: Add RISC-V specific arch_match_cpu_phys_id
RISC-V: Fix of_get_cpu_node usage
RISC-V: Implement nosmp commandline option.
RISC-V: Support nr_cpus command line option.

arch/riscv/kernel/cpu.c     |  3 +--
arch/riscv/kernel/smp.c     |  5 +++++
arch/riscv/kernel/smpboot.  |  0
arch/riscv/kernel/smpboot.c | 22 ++++++++++++++++++++--
4 files changed, 26 insertions(+), 4 deletions(-)
create mode 100644 arch/riscv/kernel/smpboot.

--
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
