Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCE5C4453E
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 06:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSE3qiyErVIrJmFYmB4nPmaQTYfCcEcNXzi0K35fhrI=; b=qd3cZsln/ht6mD
	gPJTwosUXmMPJo9LCeDp85dBOoghb7KDTxq98wN8ufYCzRsU/GhD+V97O4o5HTRZbYxnOli97siSc
	tdGgJBkJXGxtcPgk/aBUz8ONIvXieMI2kkj5SPQOQ10JLhUd/ta/4V61PE5WU7avlIzo5s++H5H1B
	FtsIb9yQf3oKOMKy29jbc63HbuZSk1NtS453p0NbOwquDJOLbgNccYWrGv92d+kogRqQqy1N0+gG0
	l+BU/EX+MsGaUyRCirfRJyBq9EWeP2Wm1acPMQNpk4D4TAhhhMSveaLsIuXiuelpS1RL2UkLDicBl
	YFpsBKkWnwjBkeDg6MTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmn6P-0000000DYxm-1Iu5;
	Thu, 23 Jul 2026 06:40:17 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmn6K-0000000DYwQ-0vi5
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 06:40:15 +0000
Received: from Vostro-3710.lan (unknown [113.80.141.55])
	by smtp.qiye.163.com (Hmail) with ESMTP id 474627f12;
	Thu, 23 Jul 2026 14:40:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: amadeus@jmu.edu.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PCIe on OrangePi R2S
Date: Thu, 23 Jul 2026 14:40:00 +0800
Message-Id: <20260723064000.848512-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
References: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9f8db3e5c003a2kunm85ffac06197a60
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTRlLVkIYHkkfSB1NQ0NOSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVU5OWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_234012_480204_4E0AAB07 
X-CRM114-Status: UNSURE (   2.96  )
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

Hi,

> Enable the two RTL8125 network controllers and corresponding
> PHYs connected via the PCIe controllers on the OrangePi R2S.

friendly ping

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
