Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F567CD37AC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 07:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEXAES++9Lf5tMJlwdOoFHALu1XqY/D1nyM29iNNW4s=; b=bmmBQuhrgUt8WP
	qJ8r6PG7eOF4SNDB8NUVbqHeU10GZGqbreuKGWxxyaBE6RvZUVYnvFdO1gAd8x9aGu88UabMItQR1
	xPAj5G950qFmMmNZ9W2n85O1lgL+Ev22z5FvsjanyBpOz9Fd72P2vR0L2J5ArsHfxC0sTPNZktVqP
	snyRJ+k1NKRAncsxN2nQdVyvWNrMOxVocfWc1OJqjpT/dlc4463r6OW4k968Vlb0hDViLBQLLhgpA
	8BdrdxlJxBiFAEczR9yGyeGXVhiX+/XPxXxNg87hQtjLPdOLlz9P27mLAtzClRu94395QBjtHPqPt
	+9R/ZfEaqp7ta1cWnuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOVUA-0000000CG8a-281v;
	Sun, 17 May 2026 07:00:26 +0000
Received: from mail-m81249.xmail.ntesmail.com ([156.224.81.249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOVU6-0000000CG7k-0lwE
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 07:00:25 +0000
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3eb40bc05;
	Sun, 17 May 2026 15:00:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Date: Sun, 17 May 2026 15:00:06 +0800
Message-Id: <20260517070006.1836396-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <177893657188.2456968.7429508961699495905.b4-ty@b4>
References: <177893657188.2456968.7429508961699495905.b4-ty@b4>
MIME-Version: 1.0
X-HM-Tid: 0a9e34bc44fe03a2kunm6878ac1010c8b4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTRhOVkkZGh4dGhgYS0gaSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JNS0pVSktLVUtZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_000022_486939_B01559F8 
X-CRM114-Status: UNSURE (   3.80  )
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

> Applied, thanks!

Wow, you're so fast!
The robot report has one typo:

> +			uboot@a00000 {
> +				reg = <0xa0000 0x760000>;
> +			};

This should be:
```
			uboot@a0000 {
```

Could you fix it? Or I can send the v2 patch.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
