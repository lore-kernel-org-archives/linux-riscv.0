Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC7C44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 02:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2IrMDzjTkzCzfgS8H/QjtDrVYl+exOMuVIQ4or2ILUw=; b=xvterstS7Y9qYK
	6kEzcBriNjHPnFSKBGitdQJXKsSHLe4kO24QrpghjatrEWFxEg5WdzRdd5FuQv8PTCmmb8WTwdXzL
	I2YiE5WkmI3tIHSZOw5V+VUYpwtZ0t/q+qWYpJ/0hGThXw5gvI5gevBhEoM0xzYhHurR5Xn9YrtDS
	ZN8ie2H6m1Kuni5YdqD7BvCb67RQo2qbdZfEmMIsR23Nr7RmgNm02TQsDNTwc3ypPuJqq9IESUihm
	px2y9+9a4JK8xHzxySnIbHg38XmdPT17oSOOgl2gWvTgjeKg5MpscYzHecHn0ugsx9Z2ES/OwradE
	1sSMKXUdaBEGa65z+olA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikdd-00000006LDl-1OhB;
	Thu, 22 Jan 2026 02:41:37 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikda-00000006L7k-0syt
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 02:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1769049651;
	bh=OSp5I9nulPPxdvzFSVI3H8ywydl3nfy34JloJ6SMU30=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=vVD2ezAQeUXmoHQGfJduIJQjTI+k9pnnT9C2zdekHpCRLxsRz4jdogAXC02Ijtm9o
	 5sIryLBv3PKdPUKP4Fw79L/SWGERav0n/2Nbz0uBh5EyStAgnB2hss7Deid2vc5fnr
	 fYbdkKMyTaXUvDRH1im00U6CaHxvOcEtAr3fCwO0=
X-QQ-mid: esmtpsz11t1769049644tbb570909
X-QQ-Originating-IP: qF4nDzfkioILTV6w/tGbU85I+nTwtlrLpsw8UddWtnU=
Received: from = ( [27.42.87.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Jan 2026 10:40:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15349338892100512281
EX-QQ-RecipientCnt: 8
Mime-Version: 1.0
Date: Thu, 22 Jan 2026 10:40:42 +0800
Message-Id: <DFURREI8ELMF.M9ZXCQYVDMZO@linux.spacemit.com>
Cc: "Alex Elder" <elder@riscstar.com>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH] i2c: spacemit: drop IRQF_ONESHOT flag from IRQ request
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org>
In-Reply-To: <20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NEaes6yu2o+mX6JmLuK8H/PF/o8Uemax1hqblB/b9fu1NSWY5tqU1h3J
	qTTziNk4m67+BiC5yGiiQex3JcW6D087pQQ5mMLeVNeJcflaV9di9I+8t/m86byw18RD09S
	CdWPSOUBLwBqvIOKDy4FKmJxMwyx0S2hUsgtoeGLqRNkj4+cbOJJIqqWSVQY4XW5n/LCl6F
	rJWcByMBQlsEIhZ8z2SwjQS8xrf1up3mImmFNEFzu37K7kxDRFsV/SY6/khtYrWH/6hxD0X
	LQBjxWuKGoWdbPY11CBf6UlE04qh364cT+hKbYoRp0/soQmRUnwO3B/zGeuCy3gsC26BQ5T
	4x0GH0yZopgECq6jQo6/QBIdHxRMX9WmZW2PVW6YHC28E9GoR/HLaY+zBURUuQtN2IAVyup
	Z4JxSahRuO652uXxG6hXoi6vBh1Xojie+z3LNWiRuqvYuDU/NSEYq3cQAasvSpk9H5DAXUM
	6EXSTgcjvpnktRvrVgLJq77C4O50HwNseRcjDAn0x8HgvuOnVaXkh5MONp04QTw9tXOxvyx
	Z3fbYniOSpgwcG8uVus0sCYg8w0NmKStN6NpeSakJ91p9emovKZiaEj1tBwJBow5ZO5Io1T
	Oigtyeg0zHr+tkRONX48GbD5l7jcUmJ/7UakcoAVeJO9OPtk9jJLcWhBOq+lEgHJwzNdmf/
	Q2gY+OJXR1t4h3uGU5AqnvhnnC2oVRRqbzxf5x4wuP40nIFp5bQx+rDMxQ/cNp0NHa6eyTv
	d+pr/NroaYPEiO0wGf+iXwKe0A6yAYrFoGhTPjqUYzRuCGZXfGkSMQFNC0k7Rex+Yp53Dye
	dhDqKC1poR3TpKe6+uEB1ZmnQG2XIs9ZXRP7kmvsJmvoyCGyHqSxhonk48BONetxBhQuImG
	bw3kaJyCr5HwbHTjyzZy7bLW3PaE7ITIH6XIra9zSxu+xnsM44EOw3V6Ct6yUP/JHs3s0dj
	Sim14TNipOrqvceODLa7zoXFCKM34LnQn/470Qq9fb/xnJXMlLaP7ZldCfETpaNz3Jp31g4
	OSKEbTUAQ3Ho6vwEW4u9XtXlceOX0+yBfsEfM6luXXsjVfBf4gTd2S7XqtID5Je0qUwHRjI
	1ZroH8FkK/h
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_184135_107626_CD7D7522 
X-CRM114-Status: UNSURE (   4.39  )
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

On Thu Jan 22, 2026 at 7:52 AM CST, Yixun Lan wrote:
> In commit aef30c8d569c ("genirq: Warn about using IRQF_ONESHOT without a
> threaded handler")[1], it will check IRQF_ONESHOT flag in IRQ request,
> and gives a warning if there is no threaded handler. Drop this flag to
> fix this warning.
>
> Link: https://lore.kernel.org/r/20260112134013.eQWyReHR@linutronix.de/ [1]
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
