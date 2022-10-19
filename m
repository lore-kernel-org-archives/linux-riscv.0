Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4863AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 10:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oluzev2r9Ct3vOx19yE5lkcZo/w6Xli/OdlbC9D5Gs=; b=JslYx2zRdiHk8wHim7IyR1LZ9a
	qEyKEPavL6/fikS+847ZVHbct15ezEt97YZKAsCS051r6XStvw25toOI/9qvTseMRnRpfA09+Aucn
	YWPAlHnMfxsmkA/5wyl3r0XBOTezqgJAEx3mitAAbRDPa1CRy/W69dSKSX8PySLCDqHrQJO1aHz8B
	Sp4qE8CRi8AJnkuRgqf/uf//dVtdoxDp52SxZuCP+MRYOhF2WOnzWzzbQHHYnUGDVPAhq4pwyoimU
	aS69FjgQXzEtQlKnJdnwlIVA8XV8vRpM209NuAwkVAvt1P0h6y1FqOzOtQPZFVWxCCXpFFOQLioRF
	Lz3hx7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol61a-0005OQ-5I; Wed, 19 Oct 2022 10:10:10 +0000
Received: from mail.galaxycrow.de ([162.55.242.111])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol61U-0004KH-Pc
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 10:10:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 369A060842;
	Wed, 19 Oct 2022 12:08:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=galaxycrow.de;
	s=dkim; t=1666174111;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=blnn0G2Cx37+alWbaZeVkXAz2TsiK7y6SUZFku7+j4c=;
	b=eeJqCDM9BjAlTDZnKUkEEje1BHk15WYclfhI6BnmOpw2LfbT1OYmNGFnWnNs1GECAq7adb
	F1fjSLNSM7yGfpWzJilumKYvjs9rpXTx4BDa+H4Qdk6cDtgQ5ZBmCqEnrDFKfbgExJBaY/
	FyFqhsuhPfVsH9GNWJLU7MV6W+g0iOV4fCJMwucg/za8rpYy2GF1alDr1b25QEVR9CEBPt
	ia94MT69a8JUAK8x1T1HzPlk7seCQ6BymA5xICQxyoSGEK9oJ067iT6SS0FUsqvIuBGIz1
	IU2B1nYRjXxNbz7VzCJdWVm+VmYYbZLDKAoL8HosZcokEGuxdhS7d4BYzHqCaA==
From: Cleo John <waterdev@galaxycrow.de>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: fix styling in ucontext header
Date: Wed, 19 Oct 2022 12:07:58 +0200
Message-ID: <4763163.GXAFRqVoOG@watet-ms7b87>
In-Reply-To: <Y0SDZEXQ5kXGJZLh@spud>
References: <20221010182848.GA28029@watet-ms7b87> <5631093.DvuYhMxLoT@watet-ms7b87> <Y0SDZEXQ5kXGJZLh@spud>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_031005_197548_BAC73044 
X-CRM114-Status: GOOD (  40.18  )
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
Content-Type: multipart/mixed; boundary="===============8215942508390060779=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8215942508390060779==
Content-Type: multipart/signed; boundary="nextPart1845179.tdWV9SEqCh"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1845179.tdWV9SEqCh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Cleo John <waterdev@galaxycrow.de>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2] riscv: fix styling in ucontext header
Date: Wed, 19 Oct 2022 12:07:58 +0200
Message-ID: <4763163.GXAFRqVoOG@watet-ms7b87>
In-Reply-To: <Y0SDZEXQ5kXGJZLh@spud>
MIME-Version: 1.0

On Mon, Oct 10, 2022 at 22:41:08 CEST, Conor Dooley wrote:
> On Mon, Oct 10, 2022 at 09:55:17PM +0200, Cleo John wrote:
> > Am Montag, 10. Oktober 2022, 20:50:56 CEST schrieb Conor Dooley:
> > > On Mon, Oct 10, 2022 at 08:28:48PM +0200, Cleo John wrote:
> > > > Change the two comments in ucontext.h by getting them up to
> > > > the coding style proposed by torvalds.
> > > > 
> > > > Signed-off-by: Cleo John <waterdev@galaxycrow.de>
> > > > ---
> > > > In my opinion this also improves the readability so I think this is a useful change to do.
> > > > Please also tell me if you have a different opinion.
> > > 
> > > I don't think it is all that /important/ of a change, but it does make
> > > things match between this file and the other headers.
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > Thanks.
> > > 
> > 
> > Yes, its not that important. Thats why I chose it. :D
> 
> :)
> 
> > To be honest this is my first commit to the kernel so 
> > I wanted to do something simple to start things of
> > easy and to get more familiar with the procedure,
> > before getting my feet wet into some real kernel
> > additions.
> 
> Cool, nice to have you & good luck!
> 
> > Thanks for helping!
> 
> nw, hopefully I wasn't too direct/negative.
> 
> Conor.
> 
> > 
> > > > 
> > > > Changes in v2:
> > > >  - change the styling of the top comments too
> > > > 
> > > >  arch/riscv/include/uapi/asm/ucontext.h | 12 ++++++++----
> > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/include/uapi/asm/ucontext.h b/arch/riscv/include/uapi/asm/ucontext.h
> > > > index 44eb993950e5..516bd0bb0da5 100644
> > > > --- a/arch/riscv/include/uapi/asm/ucontext.h
> > > > +++ b/arch/riscv/include/uapi/asm/ucontext.h
> > > > @@ -15,19 +15,23 @@ struct ucontext {
> > > >  	struct ucontext	 *uc_link;
> > > >  	stack_t		  uc_stack;
> > > >  	sigset_t	  uc_sigmask;
> > > > -	/* There's some padding here to allow sigset_t to be expanded in the
> > > > +	/*
> > > > +	 * There's some padding here to allow sigset_t to be expanded in the
> > > >  	 * future.  Though this is unlikely, other architectures put uc_sigmask
> > > >  	 * at the end of this structure and explicitly state it can be
> > > > -	 * expanded, so we didn't want to box ourselves in here. */
> > > > +	 * expanded, so we didn't want to box ourselves in here.
> > > > +	 */
> > > >  	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
> > > > -	/* We can't put uc_sigmask at the end of this structure because we need
> > > > +	/*
> > > > +	 * We can't put uc_sigmask at the end of this structure because we need
> > > >  	 * to be able to expand sigcontext in the future.  For example, the
> > > >  	 * vector ISA extension will almost certainly add ISA state.  We want
> > > >  	 * to ensure all user-visible ISA state can be saved and restored via a
> > > >  	 * ucontext, so we're putting this at the end in order to allow for
> > > >  	 * infinite extensibility.  Since we know this will be extended and we
> > > >  	 * assume sigset_t won't be extended an extreme amount, we're
> > > > -	 * prioritizing this. */
> > > > +	 * prioritizing this.
> > > > +	 */
> > > >  	struct sigcontext uc_mcontext;
> > > >  };
> > > >  
> > > 
> > 
> 
> 
> 

Hey, because I am new to Kernel submissions I wanted to ask if there is a way for me to see / track how far this commit has gone in the pipeline of commits?

Thanks,
Cleo
--nextPart1845179.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nzORJA3JEiNR015AnApHozuxisFAmNPzH4ACgkQAnApHozu
xisJEQ//VwUTcssY2/bbX8TuDCQ3OyPaxkD70GaPagHsIs+ZwcGKPDqYmeKIEyUq
sCj1ul3WfeoCi8/TiSaruGDvq0Gw7A+LFgnUZUR96uVnF2rb0IFOi9DOvVTWgNX7
GXpzeAEU/japPXutthcGaf12ZZprMi8mh7UULSA3WnsOjOTvfST0tpEQkPGIACh8
1tu5cXIVQG703tuttA0Y6Y3mFekFns1GWFfEpHqJQtOH61BW9JbNvjH7SWmxvI//
pExCNGbLFbMQH2jfD3S1irHLX1QGLEJzztP6jQOEAP8+ov3ToaOU1kpieKdbaG3a
CMSojxyVTglf99HiqJW8xqeEUm721hLC6dycf8GoLbsJwwX1yo5eiWF3XsVrI2IH
xmenUzUcjAb0LUkg2ooF6CjnhHkmdd/3phJTR5d4V4PdHxr4UyWwIElbJStxpeQu
Hflf9n6BV4eZptTMhXsRJ/8C2A5urDtt5ShoDWTuJ5515SDfTxcE41AYGrGj3IHe
kvK4e0lt7HNt06DjVtV572oCI1ChR2FUW4koNZY59YI/f4ppF+sKJ0eAG8xNf+wY
6K/UuWxmMoy1TiGoXb3mNhwv4Mw7IdVAm49qvpBGbFvmGLbZCNfXBSgsme+u/xxD
jc8TUGzWalaIhxqy/RcADomYXmk+SjxvJQGa1LgLyQ7IsmNj0pQ=
=I2Se
-----END PGP SIGNATURE-----

--nextPart1845179.tdWV9SEqCh--





--===============8215942508390060779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8215942508390060779==--




