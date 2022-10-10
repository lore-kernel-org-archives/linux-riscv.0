Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27530C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 19:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9DzlpVxOFNOShTUn8d89TdgCvAQe0cBXNME9b5nmE8=; b=x9bQXIkUwsqEovGT0ZwbJRfizf
	UBRwyXGW5CJ7vONv+gBSQv99UdXju7vyz7REohqvK1Msq7NBxsKdRiYjVpNXH01e3XE6gfDYrgE+C
	xIeftm3dSsohRkiW/nIPQxOpIh0lK9FedLXhh5ECZYbms77YntKLEWObiS12XIi5Dl8IdnLSjXAUp
	MhQyI7l7mcwBH6SIz9HhYlAmeSTf+Ypc6B6/QD/cwvKiP2+D8MpMLsaao3agDExnABvoi+u7DT6Xe
	WighR3HbQhz2BIuo5gyTiT8PFMg2Cn6ukREhSvLOdqkjG5f7f8dnUWriYY9tcSeZ9ld2zwqqt73Iw
	RTvy+aUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohysL-001zpj-4b; Mon, 10 Oct 2022 19:55:45 +0000
Received: from mail.galaxycrow.de ([162.55.242.111])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohysH-001zni-HQ
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 19:55:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FD17617FB;
	Mon, 10 Oct 2022 21:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=galaxycrow.de;
	s=dkim; t=1665431734;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=dCrp5kDtpKtiEQs2m0iGGoNE6y+hz0Z4JZZ8eurS4Q4=;
	b=orYa2PxPN3P6rN0Mu7mVnezkFOtsWTLxlPhZcXOLwBZNAGF/QEM2m5Al/5thcqb+rFUpNF
	I+evJXYQlLS0yCap4faTh3cDHzkfPSeUPkgKPlJSdFV0Bz0UfjiZhykNuN7l64CRkyb54t
	2Lr0IjlSDUIrCRnjeXWr7m16QsFLgYWU0xKw0ya6pF2byhNPJZW2NNHjw28Jc2iqfVndSO
	bZi/tu8zPeT0xCa1KXQUxUL1zFjrhDRnNnL9odu1Rvj9GipRoYGzOsL1DDLFDpFR40rEN6
	jXvQA0KmGgB5HhAyLSEWK7cIcZFPFSd1LCaSF0KiRhYKOd9gJvOOlz3+GgB/Bw==
From: Cleo John <waterdev@galaxycrow.de>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: fix styling in ucontext header
Date: Mon, 10 Oct 2022 21:55:17 +0200
Message-ID: <5631093.DvuYhMxLoT@watet-ms7b87>
In-Reply-To: <Y0RpkI66dwEKD9Kw@spud>
References: <20221010182848.GA28029@watet-ms7b87> <Y0RpkI66dwEKD9Kw@spud>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_125541_781141_9C0C4D97 
X-CRM114-Status: GOOD (  32.20  )
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
Content-Type: multipart/mixed; boundary="===============5129866843466109333=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5129866843466109333==
Content-Type: multipart/signed; boundary="nextPart5887775.lOV4Wx5bFT"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5887775.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Cleo John <waterdev@galaxycrow.de>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2] riscv: fix styling in ucontext header
Date: Mon, 10 Oct 2022 21:55:17 +0200
Message-ID: <5631093.DvuYhMxLoT@watet-ms7b87>
In-Reply-To: <Y0RpkI66dwEKD9Kw@spud>
MIME-Version: 1.0

Am Montag, 10. Oktober 2022, 20:50:56 CEST schrieb Conor Dooley:
> On Mon, Oct 10, 2022 at 08:28:48PM +0200, Cleo John wrote:
> > Change the two comments in ucontext.h by getting them up to
> > the coding style proposed by torvalds.
> > 
> > Signed-off-by: Cleo John <waterdev@galaxycrow.de>
> > ---
> > In my opinion this also improves the readability so I think this is a useful change to do.
> > Please also tell me if you have a different opinion.
> 
> I don't think it is all that /important/ of a change, but it does make
> things match between this file and the other headers.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks.
> 

Yes, its not that important. Thats why I chose it. :D
To be honest this is my first commit to the kernel so 
I wanted to do something simple to start things of
easy and to get more familiar with the procedure,
before getting my feet wet into some real kernel
additions. 

Thanks for helping!

> > 
> > Changes in v2:
> >  - change the styling of the top comments too
> > 
> >  arch/riscv/include/uapi/asm/ucontext.h | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/include/uapi/asm/ucontext.h b/arch/riscv/include/uapi/asm/ucontext.h
> > index 44eb993950e5..516bd0bb0da5 100644
> > --- a/arch/riscv/include/uapi/asm/ucontext.h
> > +++ b/arch/riscv/include/uapi/asm/ucontext.h
> > @@ -15,19 +15,23 @@ struct ucontext {
> >  	struct ucontext	 *uc_link;
> >  	stack_t		  uc_stack;
> >  	sigset_t	  uc_sigmask;
> > -	/* There's some padding here to allow sigset_t to be expanded in the
> > +	/*
> > +	 * There's some padding here to allow sigset_t to be expanded in the
> >  	 * future.  Though this is unlikely, other architectures put uc_sigmask
> >  	 * at the end of this structure and explicitly state it can be
> > -	 * expanded, so we didn't want to box ourselves in here. */
> > +	 * expanded, so we didn't want to box ourselves in here.
> > +	 */
> >  	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
> > -	/* We can't put uc_sigmask at the end of this structure because we need
> > +	/*
> > +	 * We can't put uc_sigmask at the end of this structure because we need
> >  	 * to be able to expand sigcontext in the future.  For example, the
> >  	 * vector ISA extension will almost certainly add ISA state.  We want
> >  	 * to ensure all user-visible ISA state can be saved and restored via a
> >  	 * ucontext, so we're putting this at the end in order to allow for
> >  	 * infinite extensibility.  Since we know this will be extended and we
> >  	 * assume sigset_t won't be extended an extreme amount, we're
> > -	 * prioritizing this. */
> > +	 * prioritizing this.
> > +	 */
> >  	struct sigcontext uc_mcontext;
> >  };
> >  
> 


--nextPart5887775.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nzORJA3JEiNR015AnApHozuxisFAmNEeKUACgkQAnApHozu
xivxvA//U3QEUlFlK5+I8/0MnH2zb1SVlPf72FQWtze8TKNY7smuRA3crxMDNP6z
f+h37HWsSMHBxFBuH4e+YJ6Gz/mDsmgNHiZLT2mgOGPzYZ4EQ4ivu/nwdSAPz4jl
wniCTPYLSlK2O+yQyDH26h74xvQRDIyN5LrkXac3YAbmjuPF/UZ0Cqak0wCiT3mc
NT1xLTjIkubnGdr1M1/yLeLbMh4Idr6JbiAx8EIHA5a/t55MYJ7vtdPiaTSs4QsX
eduVq4MIpoc0UMUC2ejGNPIENzIs3g5/hvP8LREOyPllS/cItv3oJcAauxieBpin
54UBumQuUiSU/dp3XHSB0J4ZCMbYwT/ycxxRHR5FWwY/DbblBW/QzAYcjVDyR0k9
8RrItc9oMVjzcy28L6DnH6IcDA/2JK5F1HbSBr76cNfT7f4CLwHOG20DdQYm+SXr
CT/yPsDUvCdtStMydoP333yLoZ2COsLXAw/lxJuH5lkaTgL2+yUlgFjvV9jsx7Lb
TaGTKSxxAsdJo6FyhqHX7Vl80SdFcVTuOKPjzqNo2lfHBxSdI8MK1IQhj/7HHkWG
93MoolaYFnQr9DYsBYrm9m19rythHsjrcwjuCfsoo6S6ksIScfSxGPm4Htk6IYZR
OFnMguev+vrkLHpCPb9nrSKCNbMZ2f3uX0uUYQr2Buax5HChLJI=
=h60/
-----END PGP SIGNATURE-----

--nextPart5887775.lOV4Wx5bFT--





--===============5129866843466109333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5129866843466109333==--




