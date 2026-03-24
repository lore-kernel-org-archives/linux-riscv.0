Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB941F54AAC
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPDLZJTY+u2HFZAzW+UGS/3ZBzqsDozxMTUeiEwkLL8=; b=TEK1ois8rqhz8H
	eBmK8LXtaBN+m/4O6eU6Jrwl5hkYghOmrDUBWIjqXm3Qy4u8IDofMjic+wJa/W3pvw6WCjEoQfVD6
	1Wsb5H85y0DYA+gJcRh78ym2iL5Y74DjPy7Q/5PW51djTReHkDODjMjI0tnyyrR7R7i+GMm+oLss3
	xyVj0Qbs1we7/4wDkkQ2KKkdDwU1KFJcSzWOw6HOB03SwRiuCDYxIO5eiTp94nlnUUZYoawDzOemW
	LBy5cgYUswEJnwUWeyweaMijEsKxU8EpSsqwo6ZQV+9IsnJ7dAm4Ktf8wsJ3nwGtULMpi0gvpsN0R
	vMSadxMetY2w2qpmKqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51PM-00000001U2g-0nBf;
	Tue, 24 Mar 2026 13:02:56 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51PJ-00000001U1l-1iQM
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 13:02:55 +0000
Received: from Vostro-3710.lan (unknown [116.25.95.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 381dc3069;
	Tue, 24 Mar 2026 21:02:36 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: thinh.nguyen@synopsys.com
Cc: amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	huang.ze@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] usb: dwc3: Add optional VBUS regulator support to SpacemiT K1
Date: Tue, 24 Mar 2026 21:02:28 +0800
Message-Id: <20260324130228.2913662-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324014144.yq7s46fmo5gx72ym@synopsys.com>
References: <20260324014144.yq7s46fmo5gx72ym@synopsys.com>
MIME-Version: 1.0
X-HM-Tid: 0a9d1ff09f9903a2kunmd38b0164305f11
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSRpNVk9CSExLSRhISk1JQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSktKWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_060253_672077_0C2A8212 
X-CRM114-Status: UNSURE (   4.46  )
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

> Set .properties = DWC3_DEFAULT_PROPERTIES,

I missed it. I'll add it in the next patch.

> Any reason for moving this to the bottom? To avoid cherry-pick/rebase
> conflict in the future, can we place this where it was before?

Sure, I'll move it back to the original place.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
