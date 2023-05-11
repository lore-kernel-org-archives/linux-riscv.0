Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B966DC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 01:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/hqtrmEm8VFJDbWCwuQpSca4EFeX67iEvkpHMKT1xw=; b=CvEWea3QIAZX7d
	qaNHBNoPGwVt5U+xcdADGU+DFl7jOwSkojBejZC7ziLPuRK8DAGDaVG0+6VNdevTA5impeevtrUyT
	B8XxgKLWdfunvjJfWFqMwrqZMRQ5sVIXA2QiXULwsDGv7EWLN666PrxM9Ui2q8MzuuEJj6/AEq9cY
	aq6kHQpYE8QXm/m5c7AJCX1da5TWSHOiwNaM9e3kNWPWDAG7nymTH/r+q4xXwpV1qD0rHNG64w51r
	LX97sqiCN87VErEn2bjgpuUgYBjCtOw5D4nl5y9RdOtDuCTnCl2NoLadhVajWp+/RR6Kp1m0ePKRU
	dRm4OqcDSM2xH+Jh8hpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwvWz-007UQo-13;
	Thu, 11 May 2023 01:55:45 +0000
Received: from m12.mail.163.com ([220.181.12.217])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwvWw-007UQK-29
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 01:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=cn2Bc
	LMyMhxye3IxabtnbH4ZW+Rn/MMBFx9wan1/8Qw=; b=WkpwlhZOUtkAIyKMD5dMU
	FfhWQ6WdpmuXGxKoNzLhrIaikgJaGO29pY9mTGIfbfBPjv4MM1U+EEdwJsO1yTAZ
	QZfrdDPO8q5W6ssAO7qDkbm6wwjASdKdphl8mRpO7K2N/70maZx8XNuf25XAHJOs
	2ORHuWxFwX6zgrXYN6+T5k=
Received: from zhangf-virtual-machine.localdomain (unknown [180.111.102.183])
	by zwqz-smtp-mta-g2-2 (Coremail) with SMTP id _____wB3f7MQS1xkGnWFAA--.60569S2;
	Thu, 11 May 2023 09:55:29 +0800 (CST)
From: zhangfei <zhang_fei_0403@163.com>
To: conor.dooley@microchip.com
Cc: ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	zhang_fei_0403@163.com,
	zhangfei@nj.iscas.ac.cn
Subject: Re: [PATCH 1/2] RISC-V: lib: Improve memset assembler formatting 
Date: Thu, 11 May 2023 09:55:23 +0800
Message-Id: <20230511015523.3430-1-zhang_fei_0403@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510-cricket-dwindling-a35d40f1da10@wendy>
References: <20230510-cricket-dwindling-a35d40f1da10@wendy>
MIME-Version: 1.0
X-CM-TRANSID: _____wB3f7MQS1xkGnWFAA--.60569S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4R9txSUUUUU
X-Originating-IP: [180.111.102.183]
X-CM-SenderInfo: x2kd0w5bihxsiquqjqqrwthudrp/xtbCfABsl2DcJgufkwABsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_185543_052282_C41E66E8 
X-CRM114-Status: UNSURE (   2.97  )
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

From: zhangfei <zhangfei@nj.iscas.ac.cn>

Hi,

Due to the chaotic response in my previous email, I am sorry for this. I have 
reorganized patch v2 and sent it to you. Please reply under the latest patch.

Thanks,
Fei Zhang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
