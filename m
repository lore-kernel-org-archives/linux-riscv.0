Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88994C79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 06:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5SWFgUEWrE4YBd6t3BXKH7OeoL968P7L6oYDOtbrgg=; b=qBgYKvTp/xzh3r
	fuDoFlEYTzBHIhfMQyDp5onxHWDHolMosMME46R+aE9CLeXBJsJ+kDBejBOVOYb+DtdCj3gMvM8jl
	1/7tun171VsC2KpWKumlf2DY6359qpgqrCVvPQAdO4pmDvTwB0LVp41YRJ6W8zba/z20RY2aHtqka
	LTAcP35QKo0mTmhmC+O4Fpl5WYi+iIzJTmAolUSkxe2VvOlpGHzK84phYn+qaTQaUUMjx3BEYE+ee
	7voILM2j70VdHjUpYbnUkV3zhNpJHBl/YAK37zF4e3Ur7SmHR0PuV3rBsefPDwq6ZwoEK+yb5cu5v
	AVp2xBMR0iDUnlrcPUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SsE-000000061S3-0aZA;
	Mon, 07 Sep 2026 06:30:34 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SsA-000000061QI-1lnh
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 06:30:33 +0000
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cc5f275b;
	Mon, 7 Sep 2026 14:30:20 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gsh517025@gmail.com
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for OrangePi
Date: Mon,  7 Sep 2026 14:30:10 +0800
Message-Id: <20260907063010.1882362-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4e8e6f90-9731-4416-8b1a-be1cef12bb72@gmail.com>
References: <4e8e6f90-9731-4416-8b1a-be1cef12bb72@gmail.com>
MIME-Version: 1.0
X-HM-Tid: 0aa07a8f81c903a2kunmf8319171daf5f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ01OVkhOTkgZSx8dTEIYSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_233030_643285_B081A875 
X-CRM114-Status: UNSURE (   7.43  )
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

> -         mac-address {
> +         mac_address: mac-address {

This requires removing the aliases for Ethernet.

> But I am not sure whether this wiring should be part of this patch.
> Without such wiring, the kernel falls back to random MAC addresses
> on this board.

Currently, U-Boot patches the MAC address using the Ethernet alias
from the Device Tree. The vendor U-Boot reads the MAC address from
the eeprom. I think the mainline U-Boot will add this feature, so
we don't need to add this one?

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
