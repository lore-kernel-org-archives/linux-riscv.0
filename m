Return-Path: <SRS0=NEFo=63=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F2FC2D0F8
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 May 2020 06:59:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BEB8206F5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 May 2020 06:59:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S5tTv4do";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBjTTdWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BEB8206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GBni9W+3zMuEMCwAC9XyfQXSJKLHraNwrOtDrxpupyI=; b=S5tTv4dokXCEsqppWVM5BZc8Q
	BJP1dPvNjobEXCtRkPz9U4CiczhuZBijroan4m2eznq878/0Ycyn0GD9j/zUxQ+rruBAoFFvM9aOX
	NFAubWokd/HOCwlMYBUOzs9tIkWG8HjH7vE/pfgORQZF/vynaao77ES6KcIO9WHFqiTy+fX+J+JmW
	ZDNGYxovxhIt+oUft62qC3SQW30TvdNUqmWrnGIyqGs5wDMupLiQ1HzMmIjMByaXqmz0UnWZYI7Sb
	sMC7DCVbRjfL4wr946Cdx21EbElJST2CKWYkC+EWuPzI1a3LwdzrLFvPRYMHFUdSy2Hs4LFayJ4GB
	6MwAvgSNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYlMn-0003tV-Gz; Wed, 13 May 2020 06:59:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYlMk-0003r6-Cm
 for linux-riscv@lists.infradead.org; Wed, 13 May 2020 06:59:43 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92652206F5;
 Wed, 13 May 2020 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589353181;
 bh=zxZDltAXJe3Nap9miVFjgcOT4pDcGn1grjxSUVSlpg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PBjTTdWKQVrfNIV+c0F9sgcgf79yhfKAzQO4hmoCvqL06wln2BSXnCTIvxcv40Z4V
 VguYJQGq7+CsZRExhkO54WRMzt4UDl51+NLrUCc3S8NFpeY7/3jGVC5Omax3KQXs54
 rLZYR7PYD69y+dfyLAppoLZntOd4ZU5zeTl85lSA=
Date: Wed, 13 May 2020 08:59:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 1/1] tty: serial: add missing spin_lock_init for
 SiFive serial console
Message-ID: <20200513065938.GA764901@kroah.com>
References: <1589019852-21505-2-git-send-email-sagar.kadam@sifive.com>
 <mhng-b2e9c16c-ee06-4c78-800d-a7725d6c74a3@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-b2e9c16c-ee06-4c78-800d-a7725d6c74a3@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_235942_456121_59BD5D24 
X-CRM114-Status: GOOD (  16.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 sagar.kadam@sifive.com, linux-serial@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 12, 2020 at 04:00:23PM -0700, Palmer Dabbelt wrote:
> On Sat, 09 May 2020 03:24:12 PDT (-0700), sagar.kadam@sifive.com wrote:
> > An uninitialised spin lock for sifive serial console raises a bad
> > magic spin_lock error as reported and discussed here [1].
> > Initialising the spin lock resolves the issue.
> > 
> > The fix is tested on HiFive Unleashed A00 board with Linux 5.7-rc4
> > and OpenSBI v0.7
> > 
> > [1] https://lore.kernel.org/linux-riscv/b9fe49483a903f404e7acc15a6efbef756db28ae.camel@wdc.com
> > 
> > Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
> > Reported-by: Atish Patra <Atish.Patra@wdc.com>
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> > ---
> >  drivers/tty/serial/sifive.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> > index 13eadcb..0b5110d 100644
> > --- a/drivers/tty/serial/sifive.c
> > +++ b/drivers/tty/serial/sifive.c
> > @@ -883,6 +883,7 @@ console_initcall(sifive_console_init);
> > 
> >  static void __ssp_add_console_port(struct sifive_serial_port *ssp)
> >  {
> > +	spin_lock_init(&ssp->port.lock);
> >  	sifive_serial_console_ports[ssp->port.line] = ssp;
> >  }
> 
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> I'm assuming it's going in through Greg's tree.

Sure, I'll be glad to take it.

greg k-h

