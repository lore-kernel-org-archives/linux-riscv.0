Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3F3C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 17:16:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BD1820818
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 17:16:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bNe6kxNM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U++FORyI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEICTFYF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BD1820818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8d+LQ8YeiaMkYoRKYFtbY87pad1LKfhMyVc7bFbYdU0=; b=bNe6kxNMlvvZXN
	j2/qQTIi24q4fHqBugRWxRVNm7NuZPU7vY9bGtfTXCAK3avJ8l+KHFttpp3qsiKFlnmazrb7x5a65
	i7j/oqELQLnZt5hnMWnI/2IWIPMAPUjIjR1oPCtS7qOBN0HkwhAAT4dCBKd0g3xx7eJb7lBUN1jMS
	hjeDJ+1X2Y/R4T3Hfk2tVVkE7Mrc5PMRH8ILHGlQ0nJaP3W6uXOS0rF47NmBE76yrgKPo+0utRiBc
	LbYRVHNKe7fkuaNLZU5IQdF8nUEoE2ZTicq8A8bPmONk56pBSIAVgvvAxMEK3dWoWGRb9HeAbp0Kv
	y3cNQQFUh+OTQAcwZrdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLAO1-0006Xu-8M; Fri, 09 Nov 2018 17:16:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLANt-0006KZ-TT
 for linux-riscv@bombadil.infradead.org; Fri, 09 Nov 2018 17:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MXKBmbop2ARIRVdMeHN+VSYnET9lBsgrnPzLbZpgd44=; b=U++FORyI3NESxOuSxh7En6v0o
 ytDCHpwjJevV1iKUSWtrBS0Q6bNsUCscJlCKFcRWOvHpJ3sFFxdhF3nV4k3PL8/0MVj0P54U1/VM/
 tBI97CjUKsvHmIGM+aloUFdOgvnfYsSGdcmdaDox48SW53WaRW5/+g0cpU5oIfxed8In/nJEe9+a2
 TA/hO0N5ik/60CQp4VnmbU4xakkP8chzPfvehcosRdRlbD+KdeI3J5xjqhJMQ9wzTxALPPPnW8Yo9
 U53bRljL5fJFgkRYlNdf+48Ni2NCijEymEqTezU+3W9IF+5slCRbUYOb44N6Of58KJ6bjwZtTPDyu
 IYWMYxzWQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLA8v-0001d2-C1
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 17:00:27 +0000
Received: from localhost (71-6-98-120.static-ip.telepacific.net [71.6.98.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFB5C20855;
 Fri,  9 Nov 2018 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1541782814;
 bh=0y1vxe9UYqU39FgXgs3aaxN1/WJTF7Tn0EspaL/fnC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IEICTFYF2RGJu1bUrvB/wwYfFYzKqF3rgpMpyabaQRP4p3gWAsB5pmuSkGjgsD6KH
 eLRbrNMg719a9olxBH6eZdLGZZIcRLm/Fux5v72XkvdyAx/ya8F0ALZpL7GFqu28zk
 CkGIAzNFAWxJkhIyfMaUkbDLlBFk23KCYb+oEkuw=
Date: Fri, 9 Nov 2018 09:00:13 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] tty: serial: add driver for the SiFive UART
Message-ID: <20181109170013.GB13927@kroah.com>
References: <20181018234352.26788-1-paul.walmsley@sifive.com>
 <20181018234352.26788-3-paul.walmsley@sifive.com>
 <20181109165951.GA13927@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181109165951.GA13927@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_170025_561969_0047D3B4 
X-CRM114-Status: GOOD (  20.97  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109170013.cfhH_JK2nJeSs00dfBElLNBkWbpI9rSCugpFSUjkqoA@z>

On Fri, Nov 09, 2018 at 08:59:51AM -0800, Greg Kroah-Hartman wrote:
> On Thu, Oct 18, 2018 at 04:43:54PM -0700, Paul Walmsley wrote:
> > Add a serial driver for the SiFive UART, found on SiFive FU540 devices
> > (among others).
> > 
> > The underlying serial IP block is relatively basic, and currently does
> > not support serial break detection.  Further information on the IP
> > block can be found in the documentation and Chisel sources:
> > 
> > https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> > 
> > https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/uart
> > 
> > This driver was written in collaboration with Wesley Terpstra
> > <wesley@sifive.com>.
> > 
> > Boot-tested on a SiFive HiFive Unleashed A00 board.
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Jiri Slaby <jslaby@suse.com>
> > Cc: Palmer Dabbelt <palmer@sifive.com>
> > Cc: Wesley Terpstra <wesley@sifive.com>
> > Cc: linux-serial@vger.kernel.org
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > Signed-off-by: Paul Walmsley <paul@pwsan.com>
> > ---
> >  drivers/tty/serial/Kconfig       |   24 +
> >  drivers/tty/serial/Makefile      |    1 +
> >  drivers/tty/serial/sifive.c      | 1070 ++++++++++++++++++++++++++++++
> >  include/uapi/linux/serial_core.h |    3 +
> >  4 files changed, 1098 insertions(+)
> >  create mode 100644 drivers/tty/serial/sifive.c
> 
> Seems like the 0-day bot did not like this driver, can you fix up those
> build errors and resend?

Nevermind, you did, sorry about that...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
