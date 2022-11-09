Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AF7C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sl7AZ5ZfOW93s1I/ZZfZqk9mWi/O7Z4dKDndalHS4Y=; b=uHMN6F7vZRWVtx
	IvRC+d8xOcHOqDlJEcTxLBvgZh59sv5q+yWRwZ59hGd515OLcW63Nbcl3omsg8+2CJG3gWZww8qqa
	xQg/sTwhhIULpTnpMFvRZJGZtPNGpfQf4kWXYymHPjGmR/ypBpyFi4g+PampPxFA8VrBfKXdXMG53
	MLaNqudqVXOhUBk8Zi08eOLesxAUa/bcYvqaRk91x50dLmC2FTBvhDrbF+vYLnbOUMjUfb4B9sYr/
	hEYueqS4E64tVio+x7zK6voS7sNSZLFyqKC4asa1M5bua7VBZ7UbpzvoIiWm20FTN6gxGPWyhCKuK
	BUi0SP++1hY4xUx4qSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osfq3-00Bpa6-Mt; Wed, 09 Nov 2022 07:49:35 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osfq1-00BpZK-5K
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 07:49:34 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 4774C3200ABD;
	Wed,  9 Nov 2022 02:49:32 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 09 Nov 2022 02:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667980171; x=1668066571; bh=yYddkPbpEf
	GzyBlkKBdLc2dWHlqVpDGEhVofFV6sGKg=; b=Wzm8Qn68Tui5aRvkeovyhZNW/o
	i2b4t0GyZW4KkDOmyjT3XhpL3CZIQfG9ghswmZg61qjgAnVj22Ty5GiHTVZjPu6t
	zBjpKIOKx/7RjRXS8jsjHd7GLGWkNQT60o2DS+QHgpuycF02SRrj8O7nD8OnkpwJ
	n0AV7vm7qzrpdgWe8CXr29wIlx3loZw3owiqdf8dJ08KzT/llnwBTB/N0lPcGp2d
	+Hjt9y6XoE1rUbwnQh9FViicMYRya92SAyev/YZDB8vpe6lgy2MUbRLptZ3D7Npk
	GOHLOmhIho2uzS5J+V+0xws3l0sEzzHtA+dPf8owxl8ymVgopWrIwbYvkLcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1667980171; x=1668066571; bh=yYddkPbpEfGzyBlkKBdLc2dWHlqV
	pDGEhVofFV6sGKg=; b=Anig35JXMIU7c7UirbMZNm5VByr+TvUCBJzURas9SKfL
	M3RYgPCQZsYhxFdRdC0l//9NEcDkLpTEzphbnBRxlhvu035+zEJcbnNdDP3dcjmI
	mSLykqGo+HkPgWXE0Y0+aCZ/OugNMbVJrAyC20WXizaisveLbA+jf4cIHXEkFdMN
	0fJIZ8lPNAKl9eQ3wMo9TEqTXLjasnaXjON1O/Mu+dgP3jkyeOmpeP0yzLBrfMCO
	r8dTFuz70BwPjzqLbkcD3ASjONs1E4CeJST7FkfZTBe1ytx8E/ykCnoBbvBhiPo0
	CUDrJmC5K1qD5spYMqRirMHFifrY4UFaAsYaJy9ACQ==
X-ME-Sender: <xms:i1trY5Lp-6unI1HT951D95aVzY4mCABhmgTH5xOtSwDnflBOgkGohA>
    <xme:i1trY1K7qcSB-a5R9tgU_gqfcxaup3V46vceVlg5ohSWVHiWXj8muNKe50cYNW5Hd
    NDifJ4tAcxIBGOILQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedugdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:i1trYxvGiP1375yMj8Nss8IQ6ittwkNNzOMYKQC521TGWGFPuFfYEw>
    <xmx:i1trY6YHACUFR4US3ftBd503fvuLJ7Ru7ftlIIzc4IdtkG2QPEbRNQ>
    <xmx:i1trYwYqLgWRyKAkwhTYOCVF7JVubfOhdk8vLnaVnpEKKSo2M3yD3g>
    <xmx:i1trY5Br4DCgDUAhe4Y5ar8bwFgd4NT0Dv2Gd6vokTNSTDnTqmU7Wg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B23AFB60086; Wed,  9 Nov 2022 02:49:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <ea8d23d3-541a-4366-b77f-861d0a9cc5ca@app.fastmail.com>
In-Reply-To: <Y2puchRvbo6+YJSy@wendy>
References: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
 <Y2lPHzaHvpWjEoll@spud>
 <f98d5faf-dd4e-46c0-ba55-9438615b434f@app.fastmail.com>
 <Y2paXPeC51GORPRX@wendy>
 <b3e107e1-475f-470f-be86-deb4bb68c9fe@app.fastmail.com>
 <Y2puchRvbo6+YJSy@wendy>
Date: Wed, 09 Nov 2022 08:49:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor.Dooley" <conor.dooley@microchip.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: Should we merge arch/riscv/boot/dts via the SOC tree?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_234933_250760_B392EACC 
X-CRM114-Status: UNSURE (   6.25  )
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

On Tue, Nov 8, 2022, at 15:57, Conor Dooley wrote:
> On Tue, Nov 08, 2022 at 02:42:16PM +0100, Arnd Bergmann wrote:
>
> I assume your ommission of the SiFive bit from this mail means you're
> happy enough with it?

Yes, that's fine.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
