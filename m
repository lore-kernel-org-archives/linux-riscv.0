Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDFFCAC5B5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 01:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xqc+Op+reWQcFRhD5ZbLdc8y0t0AYPAFUDCfaSPK34w=; b=s5o6lWaRnI50Tb
	9dOCHNd7j/9R0qPckbtrMIxIGPJbF/9a7S0NFPh2MFh/tPePaSOJBpc/Mpo4uVeUAtGtkBlkoZLLt
	jtp/Tj0+iGtCmWqAUIUI9I+a5WE918ruklUt1WKmsXRFJlta55Es21WLIF7M9HNpfzsmXTuZ7nYa6
	7grNmT5V/kR4Xz/kZ/4qMzRiEhB8XH5RLdqs6A0m47UL2jqpzK584VKVBt4vufMJU819XGeMCJDBP
	HkZJvVa0fRav3o6U3Bf7L3/P1bxJaeELo9f6LFdXohMQob/fGUOt/TQwx/OUgEky/1Tcd/HTeXuIU
	P/8WgHHGjSSTbpcQkS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1xa8-0000000Emg5-0DyS;
	Fri, 26 Sep 2025 01:49:08 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1xa4-0000000EmWx-2QVW
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 01:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758851246;
	bh=f9pOdE67HES7VaiKOaqJeSWoyMdjon32UaYW5I7wfMk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=xfEP0tWPqxSsv+wZERQL+pimB1qwKBdtDvv+TcDGaASGMPZMluqmTSHM8A1WIhzWe
	 heRtll9kIgtKbi4STFKylQtAaEEyg7VzPKa7eAYXfx7XYsWEmifnN2/aSnlKplVWDF
	 oC4H1VwRbUjgvxcE3upD28bdWjRes68BMZ80BJBQ=
X-QQ-mid: esmtpsz19t1758851244t6712949d
X-QQ-Originating-IP: WYNt+5eiH0pKnAuyyFLmJQkwXQ0+Zpro86iKA3t0UVc=
Received: from = ( [14.123.253.220])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Sep 2025 09:47:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 817829598830566685
EX-QQ-RecipientCnt: 11
Date: Fri, 26 Sep 2025 09:47:22 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 0/6] i2c: spacemit: fix and introduce pio
Message-ID: <48B175EBF0F1A347+aNXwqlO1mD-7BGtE@kernel.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <aNW5KfIg-_4-Et1S@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aNW5KfIg-_4-Et1S@shikoro>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OUC5DGN0mB58BnpMipajIoeGxqThYQSyy4jSZq+zXnU7ySETUPRJ7rRr
	RN6Izm2Nt7Cnp14wllbMbZ4PVdToTVoPysUyzWK2QpWNcXlmYLB6xSO1sEJG2fkeECptSAK
	fJqsexHwABot6bJU657ddIMblpp3aJa07r6T8OzttncbXsR1dvILGLe+7s+44wuCXVo5Wu8
	tn2GHViK/1Rl4kIDely8TG6VZUDnWrD++I3q5vusRs1gMbxtet544Z/y/rfeUV9zyLsuVsF
	+mQkIjOhhLmjl9IWs3NqBOP55AFoHmbURMUgNniT9beaJrN3xNaC6AXyOZisgqbnp0XTEiy
	9dugW1iUpbwynfgBztxXTsgejay0MRLSgagg6JGsmJA9M4sFFVnDWX9mP7C2Uftv2NW29u7
	gL0cenrQ3NK9ksSdinn3zH7PtOt0Hrrhr1xX/w699cEcuXFd29Bqppa8gTGwKvU0GNUIiaZ
	Sy73UmrUJu5kDyzF9QBo2XksNeBGRvDZWfnC4qnxBIKUt9h9+6vc/8kwqwXX/BhQZnuc9RN
	h7VAJc8zuBVtdd3I2yhKi8iYwItLTCurG1bCT98rgJIp4ktqc/0+zeYfdtT090B+fmVJYBg
	FIzM6B/17dB0DSE1x2npGCQyKy3FxI/IDUveZMJmu5V8McVQrgRep6Gy0wnSB9wTeccIsls
	E4tw4meDRnZweh476O+5r85M0Ug6kd5JFr1HmcAk5x4Ai+ztz7M5Q1SAukQIHcGrIOYEzRC
	xTsQnAIcb7QVQByUgY3llkss6chRI+QXcGPJG845LZ/oEHarScC/91AxMwhmY7h/aMB0lMV
	n4pFK4hHn+7jEm1Cq0y36QTAkER+is/b07U/yuOSTDX+9rZDzsywzOMIRT9oc72V3RLQ9PC
	9iPxDmDNBaD0szR48nAcrb/qpMPgKbYyIWLde9pMV1WRwbXPa9qur0ckFGj2DG3w2zlQi0l
	r+Pq4HcAVzXaNffBdsKFX2cqyIpWwH/OtpHzluPyEGMvuDcZ3dvhLs117LBVjvmD8Fd29JJ
	SxwJIk4/q8to42Uh9f
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_184905_356108_90E77837 
X-CRM114-Status: GOOD (  13.63  )
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

Hi Wolfram,

On Thu, Sep 25, 2025 at 11:50:33PM +0200, Wolfram Sang wrote:
> On Thu, Sep 25, 2025 at 10:02:24AM +0800, Troy Mitchell wrote:
> > Previously, there were a few latent issues in the I2C driver.
> > 
> > These did not manifest under interrupt mode, but they were
> > still present and could be triggered when running in PIO mode.
> > 
> > This series addresses those issues and adds support for PIO
> > mode transfers.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> Applied patches 1-5 to for-mergewindow, thanks!
Thanks.
> 
> Waiting for a possible review for patch 6.
> 
> Troy, maybe you want to add yourself as a maintainer for this driver?
Yeah, I'd be happy to.
I'll add myself to the MAINTAINERS file ASAP.

                - Troy
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
