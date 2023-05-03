Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD252C77B75
	for <linux-riscv@archiver.kernel.org>; Wed,  3 May 2023 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuasTcFlPxGLlUWKD2vuQxIzfD8V7giflOA0+LpTHAY=; b=YKGzWsQGHTvvxm
	ov4ZvwQJFVmyMB6UVtpjEUGBALu5dmtIRrmSBV3vrwRjZQO/6+lkoxrSovNMA8KifcWzxe/vjom6E
	3ao+oyMBazzOUsTRjLWxfzMQKBbwUTARMdOHG5n7y+8UqqDhfPvDvVj/a+Mq7JAmXvwE/VPr0udvS
	F82deEdbbSzcYQSuvKom9r1k/yZfXtC0HXRhRkSA/ihMkbLqsQb5Eu6+uS05vl+ifVkvRcUFIxFwO
	qA5zfQS077kRVkawuupZjVJW/ICmVZnwpwgR32eNjcpGvZquZCZq1Ha3D7+bxYonegiILwgHlDWI4
	6NRnM+ksHi7U6pEQ+ptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu9l7-0048Tf-1L;
	Wed, 03 May 2023 10:30:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu9l4-0048SX-0v
	for linux-riscv@lists.infradead.org;
	Wed, 03 May 2023 10:30:51 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pu9kq-00078d-S7; Wed, 03 May 2023 12:30:36 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: philipp.tomsich@vrull.eu, Palmer Dabbelt <palmer@dabbelt.com>
Cc: bjorn@kernel.org, jrtc27@jrtc27.com, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, kito.cheng@sifive.com,
 Conor Dooley <conor.dooley@microchip.com>, matthias.bgg@gmail.com,
 heinrich.schuchardt@canonical.com, greentime.hu@sifive.com,
 nick.knight@sifive.com, christoph.muellner@vrull.eu,
 Richard Henderson <richard.henderson@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject:  Re: [PATCH 0/4] Expose the isa-string via the AT_BASE_PLATFORM aux vector
Date: Wed, 03 May 2023 12:30:36 +0200
Message-ID: <4830085.8hb0ThOEGa@diego>
In-Reply-To: <mhng-4b9e3d86-2f0b-47da-8a5d-bd383a0171d6@palmer-ri-x1c9>
References: <mhng-4b9e3d86-2f0b-47da-8a5d-bd383a0171d6@palmer-ri-x1c9>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_033050_325195_2CA30E8F 
X-CRM114-Status: GOOD (  35.06  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Am Dienstag, 2. Mai 2023, 19:15:29 CEST schrieb Palmer Dabbelt:
> On Tue, 02 May 2023 02:13:10 PDT (-0700), philipp.tomsich@vrull.eu wrote:
> > On Tue, 2 May 2023 at 09:58, Bj=F6rn T=F6pel <bjorn@kernel.org> wrote:
> >>
> >> Philipp Tomsich <philipp.tomsich@vrull.eu> writes:
> >>
> >> > It is a pity that the current interface was designed without involvi=
ng
> >> > RVI (and that I had to ask my team to put together a patch set for
> >> > further discussion, given that none of the other major vendors in RVI
> >> > stepped forward).  I guarantee that plenty of reviewers would have
> >> > highlighted that a central registry (even if it is just a kernel
> >> > header) should be avoided.
> >>
> >> Are you claiming that the hwprobe work was not done in the open, but
> >> secretly merged? That is not only incorrect, but rude to upstream RISC=
-V
> >> Linux developers. I suggest you review how you interact with upstream
> >> kernel work.
> >
> > Please don't put words into my mouth...
> >
> > I was merely pointing out that there was no engagement by the RVI
> > member companies (in regard to this mechanism) within RVI, which would
> > have prevented Jessica's issue.
> > This would have also helped to address the concerns on vendor-defined
> > extensions.
> >
> > Also who do you refer to when you say "how _you_ interact"?  If it is
> > RVI that you refer to: it doesn't interact with upstream work
> > directly, as it doesn't own any engineering resources.
> > RVI provides a forum for member companies to come to an
> > understanding/design and then have the member companies perform the
> > work and take it upstream.
> =

> I'm not even sure what you're looking for here: if RVI doesn't want to =

> work upstream, then complaining that RVI isn't part of upstream =

> discussions is pretty pointless.
> =

> >> Why didn't RVI get involved in the review of the series? The expectati=
on
> >> cannot be that all open source projects go to RVI, but rather the other
> >> way around.
> >
> > That is exactly the point I was making and which you seem to miss: RVI
> > does not own any engineering resources and depends solely on its
> > member companies to project into open source projects.
> >
> >> Take a look at commit ea3de9ce8aa2 ("RISC-V: Add a syscall for HW
> >> probing"). Your team was very much involved in the review.
> >
> > I am aware, as I had reviewed and commented on these are well.
> > And my only request (was and) is that we need to figure out a way to
> > efficiently deal with vendor-defined extensions.
> =

> Maybe you should go talk to you team, then?  Handling vendor extensions =

> via hwprobe has been discussed, sounds like you're confused again.

I too have this vague memory of us talking about vendor extensions,
but my memory is really bad for stuff like this, so I spent the morning
combing through all the hwprobe iterations looking for it, but so far
have only found

https://lore.kernel.org/lkml/CALs-HstoeoTWjTEZrLWouCgwq0t3tDB6uL=3DtB68RJDs=
1ub4Frw@mail.gmail.com/

I'm most likely just blind, but does someone have another pointer?


Thanks
Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
