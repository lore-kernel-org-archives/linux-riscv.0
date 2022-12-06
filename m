Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23188C47089
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 00:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZO57c3kh35MiuPSCybpuK5AzHMDnnB1txfUJKdMCS8w=; b=XI2JfdMh9leyj6
	2ywjG/uQC10OVgy9+WexjcSFlBx9kXAfufuMSeFepspXcO5R2nIf9u9dG74S/si6RrLLr5xM+1QFv
	rktXB7mgCeETGE32lpW5+0lWGQ4oYTyaHcIT4EK5LRGxN1YdZ0DpO0Xi2veo1/BBBVIPirkQUeFMC
	6N0rwrYMeWtxdv7RLORBJt8dja6kwsTVUdfPp9XULGu3mbuLQCUaP9VKoARtvJHTBVUsOaYGR0SfD
	3EpvzXvgtScPTOqUyMKSeksEHeCATN+vAI2UCcswgl0nsJuKS9rATqglJoYfFWNefFA26q/gBTRtC
	04OUs/1ELNYfk9SghK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2M0K-00E786-C0; Tue, 06 Dec 2022 00:40:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2M0G-00E6jD-TP; Tue, 06 Dec 2022 00:40:10 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p2Lzz-0007ay-NO; Tue, 06 Dec 2022 01:39:51 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
Date: Tue, 06 Dec 2022 01:39:50 +0100
Message-ID: <12207576.O9o76ZdvQC@diego>
In-Reply-To: <Y45LRu0Gvrurm5Rh@spud>
References: <20221204174632.3677-1-jszhang@kernel.org> <10190559.nUPlyArG6x@diego> <Y45LRu0Gvrurm5Rh@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_164008_973282_ABF89469 
X-CRM114-Status: GOOD (  34.68  )
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

Am Montag, 5. Dezember 2022, 20:49:26 CET schrieb Conor Dooley:
> On Mon, Dec 05, 2022 at 07:49:01PM +0100, Heiko St=FCbner wrote:
> > Am Montag, 5. Dezember 2022, 19:36:45 CET schrieb Conor Dooley:
> > > Heiko, Jisheng,
> > > On Mon, Dec 05, 2022 at 11:40:44PM +0800, Jisheng Zhang wrote:
> > > > Yesterday, I also wanted to unify the two instruction fix into
> > > > one. But that would need to roll back the
> > > > riscv_alternative_fix_auipc_jalr() to your v1 version. And IMHO,
> > > > it's better if you can split the Zbb string optimizations series
> > > > into two: one for alternative improvements, another for Zbb. Then
> > > > we may get the alternative improvements and this inst extension
> > > > series merged in v6.2-rc1.
> > > =

> > > Heiko, perhaps you can correct me here:
> > > =

> > > Last Wednesday you & Palmer agreed that it was too late in the cycle =
to
> > > apply any of the stuff touching alternatives?
> > > If I do recall correctly, gives plenty of time to sort out any
> > > interdependent changes here.
> > > =

> > > Could easily be misremembering, wouldn't be the first time!
> > =

> > You slightly misremembered, but are still correct with the above ;-) .
> > =

> > I.e. what we talked about was stuff for fixes for 6.1-rc, were Palmers
> > wisely wanted to limit additions to really easy fixes for the remaining
> > last rc, to not upset any existing boards.
> =

> Ahh right. I was 50-50 on whether something like that was said so at
> least I am not going crazy.
> =

> > But you are still correct that we also shouldn't target the 6.2 merge w=
indow
> > anymore :-) .
> > =

> > We're after -rc8 now (which is in itself uncommon) and in his -rc7
> > announcement [0], Linus stated
> > =

> > "[...] the usual rule is that things that I get sent for the
> > merge window should have been all ready _before_ the merge window
> > opened. But with the merge window happening largely during the holiday
> > season, I'll just be enforcing that pretty strictly."
> =

> Yah, of all the windows to land patchsets that are being re-spun a few
> days before it opens this probably isn't the best one to pick!
> =

> > That means new stuff should be reviewed and in linux-next _way before_ =
the
> > merge window opens next weekend. Taking into account that people need
> > to review stuff (and maybe the series needing another round), I really =
don't
> > see this happening this week and everything else will get us shouted at
> > from atop a christmas tree ;-) .
> > =

> > That's the reason most maintainer-trees stop accepting stuff after -rc7
> =

> Aye, in RISC-V land maybe we will get there one day :)
> =

> For the original question though, breaking them up into 3 or 4 smaller
> bits that could get applied on their own is probably a good idea?
> =

> Between yourselves, Drew and Prabhakar there's a couple series touching
> the same bits. Certainly don't want to seem like I am speaking for the
> Higher Powers here, but some sort of logical ordering would probably be
> a good idea so as not to hold each other up?
> The non-string bit of your series has been fairly well reviewed & would,
> in theory, be mergeable once the tree re-opens? Timing aside, Jisheng's
> idea seems like a good one, no?

yeah, I had that same thought over the weekend - with the generic
part being pretty good in the review and only the string part needing
more work and thus ideally splitting the series [0] .

Jisheng's series just made that even more important to do :-)


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
