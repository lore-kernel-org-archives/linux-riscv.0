Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE0CC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 07:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVMU2TJw87ooBG6k+r3SGZ471CFjqdj2pEitYwb14zo=; b=uXkNO3M7adSxGCvBx3HvfmRFLP
	hBhWD0PS3bQLHkGSSc4Fge813glMZMFrdN2vpCwic1MTj+ZbqZtoneY8zLTOtCekyQUFXEH/+wqUO
	9JwYo0SBNZCk7RiwM+LwJyy8fxuwT6tn5VMg1UyIXeMUnSCB89CZW7zuT1NnTY9tixte9s7OUsPCm
	NagpbEHtGjxCh//jXe0Uj8OMb9x5KMmzPOS+Ey07viypOLtRrH4BRbbJ7v5zqmFOw/qMkLN/43KfB
	gjp6cSvYxQxvZKrD3VdoIsjPuoZnuNHMVDdOtp0RiIaS74UPDI7DMZO9AI1F/K8+C9qfwaEKidsQr
	JS528Liw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvGk-00D7MV-RJ; Fri, 17 Feb 2023 07:34:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvGh-00D7LA-9h
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 07:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676619295; x=1708155295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=93EQnWUD8i7sXN9Tr1UKu7ZZ29hyWtwoCPNnbQNbqLI=;
  b=t5fcMhbKQsJ0y17ZJHj+6VI+tN8zWDjOWAaPMsfCPp/jop15g4/wtZ0x
   yyj1e9JIzgSur0nIwVEMLkuEEygho741QzXT59Fssg9Ce5p/KOWhZ7SNd
   YvyFyv6+PJZQ6ArNA2CXPNCViNhb0xJZMav/AvI6Q5Ao8cD27ydFRbFeT
   /bycJVODxvlSuhJkUkeyp8jd6b8P90qHDo9ZKGG9LymjsIZT+h+BqDZgO
   fpCyEtBz//DGT7+AccnZijYSsTgWtxcAzSptibU6iwYWgak7TcL480+/T
   TGn/iIuG1ahytaXkFGxB6y8Z4jeE9HykfWi/HDLkJCcTKzSEPxlSvz3AL
   w==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669100400"; 
   d="asc'?scan'208";a="212477127"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Feb 2023 00:34:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 00:34:50 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 17 Feb 2023 00:34:49 -0700
Date: Fri, 17 Feb 2023 07:34:23 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor@kernel.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/7] MPFS system controller/mailbox fixes
Message-ID: <Y+8t/ybtKkkrHoUn@wendy>
References: <20230111134513.2495510-1-conor.dooley@microchip.com>
 <CABb+yY3+83AP0B4RUGTabqjR=7rXJFMgAvXsM5Go3sz2RMJA1g@mail.gmail.com>
 <Y8w5NO9E/j/6eT5d@spud>
 <Y+6tK/OS13THpQo4@spud>
 <CABb+yY2u0LNiwiJeOwhYU69U_m+5bx5rsHOk5jbyJTRbVcjeYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABb+yY2u0LNiwiJeOwhYU69U_m+5bx5rsHOk5jbyJTRbVcjeYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_233455_416977_201954A2 
X-CRM114-Status: GOOD (  46.65  )
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
Content-Type: multipart/mixed; boundary="===============6180971194712346592=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6180971194712346592==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4oyuR8DLFUNjYCl0"
Content-Disposition: inline

--4oyuR8DLFUNjYCl0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 16, 2023 at 10:04:17PM -0600, Jassi Brar wrote:
> On Thu, Feb 16, 2023 at 4:24 PM Conor Dooley <conor@kernel.org> wrote:
> > >
> > > > > Secondly, I have a question about what to do if a service does fail, but
> > > > > not due to a timeout - eg the above example where the "new" image for
> > > > > the FPGA is actually older than the one that currently exists.
> > > > > Ideally, if a service fails due to something other than the transaction
> > > > > timing out, I would go and read the status registers to see what the
> > > > > cause of failure was.
> > > > > I could not find a function in the mailbox framework that allows the
> > > > > client to request that sort of information from the client. Trying to
> > > > > do something with the auxiliary bus, or exporting some function to a
> > > > > device specific header seemed like a circumvention of the mailbox
> > > > > framework.
> > > > > Do you think it would be a good idea to implement something like
> > > > > mbox_client_peek_status(struct mbox_chan *chan, void *data) to allow
> > > > > clients to request this type of information?
> > > > >
> > > > .last_tx_done() is supposed to make sure everything is ok.
> > >
> > > Hm, might've explained badly as I think you've misunderstood. Or (see
> > > below) I might have mistakenly thought that last_tx_done() was only meant
> > > to signify that tx was done.
> > >
> > > Anyways, I'll try to clarify.
> > > Some services don't set a status, but whether a status is, or isn't,
> > > set has nothing to do with whether the service has completed.
> > > One service that sets a status is "Authenticate Bitstream". This
> > > service sets a status of 0x0 if the bitstream in question is okay _and_
> > > something that the FPGA can be upgraded to. It returns a failure of 0x18
> > > if the bitstream is valid _but_ is the same as that currently programmed.
> > > (and of course a whole host of other possible errors in-between)
> > >
> > > These statuses, and whether they are a bad outcome or not, is dependant
> > > on the service and I don't think should be handled in the mailbox
> > > controller driver.
> > >
> > > > If the expected status bit is "sometimes not set", that means that bit
> > > > is not the complete status.
> > >
> > > If the "busy" bit goes low, then the transmission must be complete,
> > > there should be no need to check other bits for *completion*, but...
> > >
> > > > You have to check multiple registers to
> > > > detect if and what caused the failure.
> > >
> > > ...maybe I have just misunderstood the role of .last_tx_done(). The
> > > comment in mailbox-controller.h lead me to believe that it was used just
> > > to check if it had been completed.
> > >
> > > Am I allowed to use .last_tx_done() to pass information back to the
> > > mailbox client? If I could, that'd certainly be a nice way to get the
> > > information on whether the service failed etc.
> > >
> > > Hopefully that, plus when you have a chance to look at the code, will
> > > make what I am asking about a little clearer!
> >
> > Just wondering if you've had a chance to look at this again! I know it's
> > missed the merge window this time around but I would like to get this
> > behaviour fixed as other work depends on it.
> >
> My opinion about adding a new api just to accommodate remote f/w's
> behaviour change across updates is still no.
> last_tx_done() is more abstract than you think -- it has to play with
> dozens of behaviors of remotes. So may just wrap your whatever logic,
> of "tx is done", in that.

Okay, that's fine. I'd rather not add a new API, so adding that to
last_tx_done() is fine by me! I just wasn't sure from your earlier reply
if that was okay.

> This query within the patchset threw me off -- I thought you needed
> the new api for the patchset, so I didn't look further.

Ahh, sorry. The query was about improving things to report an accurate
status rather than only timeouts. What's here *works* but is
sub-optimal.

> Looking at it now, I am ok with applying Patches 1,2 and 3. If you want.

Ehh, the whole thing needs to go together to avoid breaking behaviour,
so, given the merge window is next week, I'd rather rework it to report
the actual status from last_tx_done().

Thanks!

--4oyuR8DLFUNjYCl0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+8t/wAKCRB4tDGHoIJi
0qPcAP9F4Glm4tYEATS2RSKf8pYpeqdJzDcSyeo7QCXw1TsNEgEA+Zhh12ViwHpO
ArUghO/1zcJXJuxSmM4LaainKUReWg0=
=fCPF
-----END PGP SIGNATURE-----

--4oyuR8DLFUNjYCl0--


--===============6180971194712346592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6180971194712346592==--

