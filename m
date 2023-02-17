Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4C2C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 04:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUHXcA0b+DhtqcS7xg1rVco6+FP10CAf9WtibJN/17o=; b=M9pdmeIJNY2JTH
	vLrDsO2gXYAOBABVvWeS4uUm8brugLlyOUyZpSGvKWhakLDiEt5aerd9O06CG2nbjz86UUg+lz2C1
	TIk6N9NbG6Bu0Xc9EEUhzJexCb8Hrqm3i8oLpq2FGRZU39eErc83gjuhSJ1UNrnSVb1U+3v7pKgoq
	dfaPL+iuygUI1nIGnFkKi7sdHqMR70escGpSNyDE3qZ+/F6haZQW4PbcflfWp65uszd/dSBUl2Z3/
	0O65YOi8IdLg1Zohd55eRo415pGYmXeBSYBaRNZCOidRFw/jrE76lq23AUhiaK51zY9xpJVhOut6p
	hG2nTvpnEo5qAyimmsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSrzC-00CYUd-At; Fri, 17 Feb 2023 04:04:38 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSrz8-00CYTt-UF
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 04:04:36 +0000
Received: by mail-ed1-x531.google.com with SMTP id l11so121634edb.11
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 20:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HxmUSlJXaf6nTG5D0bylzf06QH492H43qo5VyH1HCv0=;
        b=Oe48S6nFeeuh57y6PJwlajhHUNdjJbA56bg8u8jzeqWafp9VdwUQWtaI4Iv9kimQOw
         bEeU8umc6LtnIkAx+iarURZvIHJP+nV23abXYGn5Mt7fKbMFiawcO1G+uSjsLlPAFlWw
         AhZzpg4wuH4yNoOEacLgs0Hb97xZJlOSZYyo1d8FQgjUUCpKhdBdH1woT6o2mIGsPyjq
         J4+/ZCP087BKhcE9R/JGgMkO3b8MXVhx/rwYxZs8mZkgbIO9ey0/f9ujCSzRVw4SCJ6v
         HqLZ7KODZVRXdFuhgf9Kct+UPi40QOqyAXrwt9/KxC7toh6TEtebKVaXHnTYqIz4oCgJ
         j/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxmUSlJXaf6nTG5D0bylzf06QH492H43qo5VyH1HCv0=;
        b=gcIVBUwTDu3hxNrNIB2ujYqKkpIwJDR/g+Wt1HMImQkfmpH+gQdU9lLsqJt5GI8L5B
         PT9dujXnAiBXAM6YE9UreL0+TAqaCBrHwiee08dT06bhYsfBZb5nWyTPKy8R03q04xEx
         c/786/aXSeYlXOzvH8AGTc6A3H/viKi0MCSggt+LlcYQT2Zyv/0VYxH2F9AGUUYFanJl
         ph0XMf/EhVqFHBv/oKk7wsSh9HHYQqnH07Wg3Dw6pSq/nFf215/aR7RTPNinImgrHr3d
         YQu0LOXYgFcFpTqbGj6u6O7luEvgXPhshpMH2s+h6+0KPwJ/SzacwOaSK/VORnWLErgn
         CZDA==
X-Gm-Message-State: AO0yUKWHmy8lzM/WiChl/rdwdPD1KGd71u3sBa94sff07tDGE3rCyDu4
	uyRm/caIeJj3Ufau1DyGAsfUH6vNERzHWu/crsY=
X-Google-Smtp-Source: AK7set/SgkK+MozdQWfxYPFwSGuOVWulvR54xmNEnad8gOmp2yXZCJe4oU1TESzW5Sre9sFJlDU6+Y+2s4Zslm33OoI=
X-Received: by 2002:a17:906:6896:b0:8a5:c8bd:4ac4 with SMTP id
 n22-20020a170906689600b008a5c8bd4ac4mr3901584ejr.15.1676606669190; Thu, 16
 Feb 2023 20:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20230111134513.2495510-1-conor.dooley@microchip.com>
 <CABb+yY3+83AP0B4RUGTabqjR=7rXJFMgAvXsM5Go3sz2RMJA1g@mail.gmail.com>
 <Y8w5NO9E/j/6eT5d@spud> <Y+6tK/OS13THpQo4@spud>
In-Reply-To: <Y+6tK/OS13THpQo4@spud>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 16 Feb 2023 22:04:17 -0600
Message-ID: <CABb+yY2u0LNiwiJeOwhYU69U_m+5bx5rsHOk5jbyJTRbVcjeYw@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] MPFS system controller/mailbox fixes
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_200435_019830_2370F2F4 
X-CRM114-Status: GOOD (  40.83  )
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

On Thu, Feb 16, 2023 at 4:24 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > > > Secondly, I have a question about what to do if a service does fail, but
> > > > not due to a timeout - eg the above example where the "new" image for
> > > > the FPGA is actually older than the one that currently exists.
> > > > Ideally, if a service fails due to something other than the transaction
> > > > timing out, I would go and read the status registers to see what the
> > > > cause of failure was.
> > > > I could not find a function in the mailbox framework that allows the
> > > > client to request that sort of information from the client. Trying to
> > > > do something with the auxiliary bus, or exporting some function to a
> > > > device specific header seemed like a circumvention of the mailbox
> > > > framework.
> > > > Do you think it would be a good idea to implement something like
> > > > mbox_client_peek_status(struct mbox_chan *chan, void *data) to allow
> > > > clients to request this type of information?
> > > >
> > > .last_tx_done() is supposed to make sure everything is ok.
> >
> > Hm, might've explained badly as I think you've misunderstood. Or (see
> > below) I might have mistakenly thought that last_tx_done() was only meant
> > to signify that tx was done.
> >
> > Anyways, I'll try to clarify.
> > Some services don't set a status, but whether a status is, or isn't,
> > set has nothing to do with whether the service has completed.
> > One service that sets a status is "Authenticate Bitstream". This
> > service sets a status of 0x0 if the bitstream in question is okay _and_
> > something that the FPGA can be upgraded to. It returns a failure of 0x18
> > if the bitstream is valid _but_ is the same as that currently programmed.
> > (and of course a whole host of other possible errors in-between)
> >
> > These statuses, and whether they are a bad outcome or not, is dependant
> > on the service and I don't think should be handled in the mailbox
> > controller driver.
> >
> > > If the expected status bit is "sometimes not set", that means that bit
> > > is not the complete status.
> >
> > If the "busy" bit goes low, then the transmission must be complete,
> > there should be no need to check other bits for *completion*, but...
> >
> > > You have to check multiple registers to
> > > detect if and what caused the failure.
> >
> > ...maybe I have just misunderstood the role of .last_tx_done(). The
> > comment in mailbox-controller.h lead me to believe that it was used just
> > to check if it had been completed.
> >
> > Am I allowed to use .last_tx_done() to pass information back to the
> > mailbox client? If I could, that'd certainly be a nice way to get the
> > information on whether the service failed etc.
> >
> > Hopefully that, plus when you have a chance to look at the code, will
> > make what I am asking about a little clearer!
>
> Just wondering if you've had a chance to look at this again! I know it's
> missed the merge window this time around but I would like to get this
> behaviour fixed as other work depends on it.
>
My opinion about adding a new api just to accommodate remote f/w's
behaviour change across updates is still no.
last_tx_done() is more abstract than you think -- it has to play with
dozens of behaviors of remotes. So may just wrap your whatever logic,
of "tx is done", in that.

This query within the patchset threw me off -- I thought you needed
the new api for the patchset, so I didn't look further.
Looking at it now, I am ok with applying Patches 1,2 and 3. If you want.

cheers.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
