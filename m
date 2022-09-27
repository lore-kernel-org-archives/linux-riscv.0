Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FE4C07E9D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyes4Mj/uXsQkaUjX3RTKSpDwE44e4QGnlf2vNinoeY=; b=wyl8tyzRtopDfF
	I2BUxwHd7m0JZe1u6e4e7XXp5e6AXHmX7/qXzBdN8mxp50OzZB9K8ub5UWeuIttpDwG8HBlZGBeD3
	ZWZu9bZ08tYyIYFs9uoPKVPOP8Ebozh3LBBILGxlbiS29R1fqdx4NVjXblBDK3PpyYL4lqMsikraZ
	PYiJ4qtRCiSInpfr0RKcFQZRQckSgweZMmv67T66ktoZymb7YZ35mwE6XaYxnfjyF+4qblcxFiB3h
	8LzTn4UQ9357vKIHgUW2mS4JoW9UrL/htSXGPidsOsD0AGX6dzS/YyiAIA7YTMJWTa4oMIf0QI0D4
	mpf2CmjByMUhWgvEkKdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4Y5-008g6t-0M; Tue, 27 Sep 2022 06:58:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4Y2-008g52-BE
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 06:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664261911; x=1695797911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E2kc/2AqipvFF3jN3ddCE1t9Tc6TQjnGgOwWCAMjdG8=;
  b=R39wFEEtxCAwV9jHJkV6xgytJdKPjZkOwKkJBbN/EpMsu2c2Z5MdSlwq
   0oIYn5P4qm3mNXdzTr8+zPxxziRHuxDFxKXQIDRkgFSdAcFe3Bh+x/6S2
   u9Mq8JzrxhpRyu2Bv3m4f+c3Knmsr2tGrGY25BjHdU2It7lz2bYyRqy7m
   mhL8AHeezspnn+DPBv7mX7OKJCXgoZ4jsZCZJOahz/C4G1wvpGKTI3h7h
   +ovQrGec3wYM/8erQc9eh8bZsl/mnk0XmSeqKuY4DMO0W3WZHqdOC9yzE
   AaIR/NseuScj52mNjmqYK901PU9S7/s7zuHmEv4BTY8dOpQk0+7XknGhw
   w==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="182092160"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Sep 2022 23:58:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 26 Sep 2022 23:58:28 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 26 Sep 2022 23:58:27 -0700
Date: Tue, 27 Sep 2022 07:57:51 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley
	<conor@kernel.org>, <linux-riscv@lists.infradead.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, <kernel@esmil.dk>
Subject: Re: [RFC 00/27] RISC-V: Convert SOC_FOO symbols to ARCH_FOO
Message-ID: <YzKe7y7/Th4Ze1F8@wendy>
References: <20220923185605.1900083-1-conor@kernel.org>
 <CAMuHMdVxx7_im2wtb_Hszf2P6EuxEDjA95sJtkM9Jf9KV3xO4Q@mail.gmail.com>
 <YzKZYoaAbwtLcsSY@wendy>
 <689a9a66-9086-4944-ba08-d0a63d6602fd@www.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <689a9a66-9086-4944-ba08-d0a63d6602fd@www.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_235830_424709_2D428832 
X-CRM114-Status: GOOD (  16.39  )
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

On Tue, Sep 27, 2022 at 08:48:00AM +0200, Arnd Bergmann wrote:
> On Tue, Sep 27, 2022, at 8:34 AM, Conor Dooley wrote:
> > On Mon, Sep 26, 2022 at 11:04:58AM +0200, Geert Uytterhoeven wrote:
> >
> >> and (b) you take this through the RISC-V tree, you will miss all newly
> >> introduced users in other subsystem trees.
> >
> > Aye, your suggested timing makes sense, but there are quite a few
> > subsystems involved here, so maybe doing it at the very end of the
> > window rather than asking everyone to stall until rc2 may be more
> > feasible?
> 
> Since there is no rush here, maybe stage this out over two releases?
> At first, just introduce the new symbols as aliases like
> 
> config ARCH_FOO
>       def_bool SOC_FOO
> 
> then change all the drivers in the following cycle after the syumbol
> exists, and finally rename the user-visible symbols and remove the
> old version.
> 

I think I suggested that at LPC but was told not to bother, which is why
I did a direct conversion. I'd prefer to do it your suggested way
though & I think I will do it that way for a v1.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
