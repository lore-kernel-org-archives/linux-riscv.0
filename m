Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B67C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJBFbDe+Ws/AG4AZcUXWj6uFkPALLZ9y35vBPPcC67U=; b=I0/gEHaQ2spytH
	c/Wfr52rYIHo6YUNpMYaTYDsy5oDX3verJonCDY3KyKlfEbZsl6NS6sUEqhUBZImZx4v0j8qyVa0e
	+ij6Azi6sU204u0Wt1rgd+NUoY5qiiXMMz83+/kt7zjrinI5TaL8dl3FQwhOHH8Qx8GxSkXP6bBTZ
	Zy/Dm/6U2vO1lZnUA07ixbJGtdTk2/FEuS1g1aPffefEXdidUtCVwXRGp59t/IJYPfoG3Lk79afb1
	Tqh+N20EALrOAzA6XaoaL0F4UdPLq0Iocs0yrkJQYJrTcFL4WRtHgzY4BmPiOl0MiHp1hYrOec7Ok
	Q4lUdKKLODRjAvxUS9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWnk-003kNV-RI; Tue, 08 Mar 2022 10:10:45 +0000
Received: from m228-4.mailgun.net ([159.135.228.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWgR-003hFs-Ia
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 10:03:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=michaelkloos.com;
 q=dns/txt; 
 s=k1; t=1646733790; h=Content-Transfer-Encoding: MIME-Version:
 Content-Type: References: In-Reply-To: Date: Cc: To: To: From: From:
 Subject: Subject: Message-ID: Sender: Sender;
 bh=Ec+FTwZB/iLzxKXR8VZXGGmgAC88RhCDFogwtxD9drM=;
 b=MrdF6EIrBNQ8u8ukz4pd79tMhEqadwslCUjHQ6/Jvc7s+5LJPc3pVfyvZj0kp4jmltS5ymhy
 NxuNuLaK2q9Hh/UA378p6/u5IbR1GVUDFKn0XBHYEpiDvN4GdiGkrvZgiwxRC7xuSPXuXmxM
 ZGE6dxcELVeZ7xQgqZzIO5laHNM=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyIxOGJjMSIsICJsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnIiwgIjQ4Y2MwIl0=
Received: from drop1.michaelkloos.com (drop1.michaelkloos.com
 [67.205.190.89]) by smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 622729ded71d9180ceb6f6ef (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 08 Mar 2022 10:03:10 GMT
Received: from qpc.home.michaelkloos.com
 (cpe-173-88-115-50.columbus.res.rr.com [173.88.115.50])
 by drop1.michaelkloos.com (Postfix) with ESMTPSA id BF7B640176;
 Tue,  8 Mar 2022 10:03:08 +0000 (UTC)
Message-ID: <31720a326b46471a7e50fe6a2e37744c7badc315.camel@michaelkloos.com>
Subject: Re: Question about CONFIG_EFI and CONFIG_RISCV_ISA_C
From: "Michael T. Kloos" <michael@michaelkloos.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Date: Tue, 08 Mar 2022 05:03:08 -0500
In-Reply-To: <67c4d146-3368-a791-361e-4172ec607437@ghiti.fr>
References: <4407a08d90278522b95b7b0e8aba54f372d0ad15.camel@michaelkloos.com>
 <67c4d146-3368-a791-361e-4172ec607437@ghiti.fr>
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_020311_733277_51EE396D 
X-CRM114-Status: UNSURE (   9.97  )
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

Thanks

	Michael

On Tue, 2022-03-08 at 10:54 +0100, Alexandre Ghiti wrote:
> Hi Michael,
> 
> On 3/8/22 09:46, Michael T. Kloos wrote:
> > Does anyone know why CONFIG_EFI selects CONFIG_RISCV_ISA_C ?
> 
> 
> There has been a discussion about that not that long ago: 
> https://patchwork.kernel.org/project/linux-riscv/patch/20220117173941.3798325-2-florian.wagner@nextsilicon.com/#24701077
> 
> 
> Alex
> 
> 
> > 
> > 	Michael
> > 
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
