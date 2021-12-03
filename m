Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889CEC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 09:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iRe/wL3a3SaAi4LO4P5NTC2vGcQ5U2dFayGml/pogEk=; b=v8LsdKsUSBEktU
	4U3tGwanW51Jn2u6p0R3LP9tIG86N++v0rLd1ksKdNJlg6/dosc/j1TIIW4/yGcsZK8Yig7mMLocr
	x28GXd9XE+FODzoWjn1Yi3kKqT2fDprhN+K8CBYLam8oynA5D+OJ0uJdyeCLA353MlHAU0xpdHxdS
	XOeSInRa6XOsSubpkQR2xMtWQOtn+pboVpfuPSl4zxsL9Cia2wnllJg9jnUONtvwlhf7zKl6h75s4
	gUgOSWIDJnI2dYupWkNN4O+2JhpFfG1KWsW0jUDnG9HF4q50YG7ByK9AZtnL7kX4WC3kwswG7qo+M
	kyTc2Lm7NXw4lv18E9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt5Ls-00F3qR-Kc; Fri, 03 Dec 2021 09:59:36 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt5Lp-00F3pH-Mf
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 09:59:35 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BAEDA43810;
 Fri,  3 Dec 2021 09:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received:received; s=mta-01; t=1638525567; x=
 1640339968; bh=2rFdliiJV8XqSf7cvBQN7gL4U5vbe0M4lFGQ3r15YGA=; b=e
 qRu937A+oCjPy+FqKA4tu+WZMzDgIOQj4D7cvqYwfWdID1lMG8Vez80QwmhO8iSz
 NtDodZzImR8Fxtn1ZTEIoS70itpAVsKAZVHN7TofhLRS/n29WnLGLXMBQte3LDpl
 EVsMjCYDYZpDehbn6r9RbdOcoKwX7tYEUKvu4NgyZo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szY3lLunkAyv; Fri,  3 Dec 2021 12:59:27 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B62144380D;
 Fri,  3 Dec 2021 12:59:23 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 3 Dec 2021 12:59:23 +0300
Received: from rdma-x86-2.dev.yadro.com (172.17.27.112) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 3 Dec 2021 12:59:22 +0300
From: v.v.mitrofanov <v.v.mitrofanov@yadro.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Atish Patra <atish.patra@wdc.com>, Yash Shah
 <yash.shah@sifive.com>, Greentime Hu <greentime.hu@sifive.com>,
 v.v.mitrofanov <v.v.mitrofanov@yadro.com>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/1] riscv: dts: fu740: Add PDMA node
Date: Fri, 3 Dec 2021 09:57:37 +0000
Message-ID: <20211203095744.1717706-1-v.v.mitrofanov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [172.17.27.112]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-Exch-05.corp.yadro.com (172.17.10.109)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_015933_962425_CB84DF10 
X-CRM114-Status: UNSURE (   6.83  )
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

Sifive FU740 supports PDMA but is not implemented in DT. The same
PDMA module implemented in FU750 chip. I added DT description with all
required fields. I also tested PDMA robust with drivers/dma/dmatest.ko test.

v.v.mitrofanov (1):
  riscv: dts: fu740: Add PDMA node

 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
