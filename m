Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94A2C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 18:40:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C53320657
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 18:40:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VMWgANao";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PIPJwOcl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C53320657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nWf3sgu8epf8vsMLNv/otiTV2bfG0xVn/hbqw/i7sH4=; b=VMWgANaoichjkbBq5/8DT6vx9
	0GY7ClxqwI+BDeVjXiffxzIm3xT3Y1Py938BdNvLCzxsKGQ7rlCNbwvjOQh0YJ/HeTBwLzr+KLgF7
	I97VCtdAgl/Y6HtWuUJs//QS6ftsGMZSkpB+YGUSdE0x/9D89FRJrl8ZlpVsTjCtOg7ek4vAIf2sA
	4Xx+YXKZNsx5m8QCRd4+UQei0HQ4M0sJYA0MiCVDMV+DjH1Zba4F8MQT7+CqPAp83hmyZqf36zfaS
	gNqdzkdqPeJvlN2kgWRWzBS/3js2T9wPYlH2yORRT6rR2nuJa9RRybdMuPlSGRf8y5rbu9lHGKg7V
	EtAZXH4oA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3PqP-0000WA-Bc; Mon, 11 Mar 2019 18:40:13 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3PqB-0007h7-3L
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 18:40:00 +0000
Received: by mail-io1-xd44.google.com with SMTP id u12so4977880iop.11
 for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2019 11:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=hjIgaAFa+sbDMCUWTAh/pXVQ6BYtNS/IzPpG823tVJw=;
 b=PIPJwOcleSu9xzFT1rOWEYhEqNYLUyRxpZSew3bnh7tDjOB6+m7RVsJLSMk7RDCXdB
 Vyk7WqhpKszTxH753J+1iPSjOi9acfLaLtZE+KLvrUam5nu3MpKunIwV+VI79r3ZLXQs
 j6SbmOz2cIlOs9BZ26b/ZE8lipPP5d709yLggZDYgmsFjWq92lP2ilqIqGsMW8Wi2q/6
 fxiu57T6w2d0x33WoBtdw5ThXLMVlzjfb8SCXyr/wWP1G1mmvSuUqp60wpEHan8ZNeHi
 xIMddUUd/zHO8BELHeyPJtNTsxU4HLdD5a8wjdbZnpWQGi5+x/qWwERFo/1US+l59YkX
 A3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=hjIgaAFa+sbDMCUWTAh/pXVQ6BYtNS/IzPpG823tVJw=;
 b=Y9GiI2PzzgXp9P9AOLPXy7mmK+oHciDr/uuVtKj29D+N+BcxYBFLyZ5IsIJ2ctBzqX
 nS6pPzUNUwwE7fVaB8l3NjvLEIGTLWtMZAEmr0YiSs2ypAgqp4wNqWGy+kBLZIQzfIbJ
 3/i2aHP5CcFoA3PT+hZf4YVVfFS3b2W21HpL/wdX11XOeofjKA/DLgu9aBzPBsVg5gbM
 x8HWWYfxznFeN8uLioV7Y6ij6xI/VNcsJKwtPrEllgCSph5Xooi2d+LK9K58zinDh6iY
 kW+ggWF07qxTirqTuW+qx+Rfx9IPQ85YJlHa8RxQIoOsauwtLj6uEV37T/n1GKp3yQzi
 TbRg==
X-Gm-Message-State: APjAAAXOXWKNSxPx+MRwcUdZE5U5TrH2Zrrjj9V3G93ERar1Id9FaCpu
 uPKK9uabPSpsSUTMXojIENZvJQ==
X-Google-Smtp-Source: APXvYqzTRddAHh5QAcIZK8DepFHh08bNrQ5Tl3LvsZEirIgIQLpEfoILZYdkX473pjENmw/JA5sGMw==
X-Received: by 2002:a6b:6e0f:: with SMTP id d15mr10465949ioh.111.1552329597896; 
 Mon, 11 Mar 2019 11:39:57 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 w8sm2622630iob.34.2019.03.11.11.39.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 11 Mar 2019 11:39:57 -0700 (PDT)
Date: Mon, 11 Mar 2019 11:39:56 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Mark Rutland <mark.rutland@arm.com>, Christopher Lameter <cl@linux.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <20190311164837.GD24275@lakrids.cambridge.arm.com>
Message-ID: <alpine.DEB.2.21.9999.1903111110520.11892@viisi.sifive.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
 <20190311164837.GD24275@lakrids.cambridge.arm.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-10155141-1552329596=:11892"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_113959_138362_3172F8EA 
X-CRM114-Status: GOOD (  18.72  )
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
Cc: Paul Walmsley <paul@pwsan.com>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, will.deacon@arm.com,
 Paul Walmsley <paul.walmsley@sifive.com>, catalin.marinas@arm.com,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-10155141-1552329596=:11892
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi Mark,

On Mon, 11 Mar 2019, Mark Rutland wrote:
> On Mon, Mar 11, 2019 at 08:26:45AM -0700, Paul Walmsley wrote:
> > On Mon, 11 Mar 2019, Bj=C3=B6rn T=C3=B6pel wrote:
> > >=20
> > > But the generic one disables interrupts, right?
> > >=20
> > > I believe the rational for RV is similar to ARM's; AMO+preemption
> > > disable regions is *slightly* better than the generic, but not as goo=
d
> > > as the IA one. Or am I missing something?
> >=20
> > There's been a discussion going on in a private thread about this that =
I=20
> > unfortunately didn't add you to.  The discussion is still ongoing, but =
I=20
> > think Christoph and myself and a few other folks have agreed that the=
=20
> > preempt_disable/enable is not needed for the amoadd approach.  This is=
=20
> > since the apparent intention of the preemption disable/enable is to ens=
ure=20
> > the correctness of the counter increment; however there is no risk of=
=20
> > incorrectness in an amoadd sequence since the atomic add is locked acro=
ss=20
> > all of the cache coherency domain.=20
>=20
> We also thought that initially, but there's a sbutle race that can
> occur, and so we added code to disable preemption in commit:
>=20
>   f3eab7184ddcd486 ("arm64: percpu: Make this_cpu accessors pre-empt safe=
")
>=20
> The problem on arm64 is that our atomics take a single base register,
> and we have to generate the percpu address with separate instructions
> from the atomic itself. That means we can get preempted between address
> generation and the atomic, which is problematic for sequences like:
>=20
> =09// Thread-A=09=09=09// Thread-B
>=20
> =09this_cpu_add(var)
> =09=09=09=09=09local_irq_disable(flags)
> =09=09=09=09=09...
> =09=09=09=09=09v =3D __this_cpu_read(var);
> =09=09=09=09=09v =3D some_function(v);
> =09=09=09=09=09__this_cpu_write(var, v);
> =09=09=09=09=09...
> =09=09=09=09=09local_irq_restore(flags)
>=20
> ... which can unexpectedly race as:
>=20
>=20
> =09// Thread-A=09=09=09// Thread-B
> =09
> =09< generate CPU X addr >
> =09< preempted >
>=20
> =09=09=09=09=09< scheduled on CPU X >
> =09=09=09=09=09local_irq_disable(flags);
> =09=09=09=09=09v =3D __this_cpu_read(var);
>=20
> =09< scheduled on CPU Y >
> =09< add to CPU X's var >
> =09=09=09=09=09v =3D some_function(v);
> =09=09=09=09=09__this_cpu_write(var, v);
> =09=09=09=09=09local_irq_restore(flags);
>=20
> ... and hence we lose an update to a percpu variable.

Makes sense, and thank you very much for the detailed sequences. =20
Open-coded per-cpu code sequences would also cause RISC-V to be exposed to=
=20
the same issue.  Christoph mentioned this, but at the time my attention=20
was focused on per-cpu counters, and not the broader range of per-cpu code=
=20
sequences.

> I suspect RISC-V would have the same problem, unless its AMOs can
> generate the percpu address and perform the update in a single
> instruction.

My understanding is that many of Christoph's per-cpu performance concerns=
=20
revolve around counters in the VM code, such as:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/=
vmstat.c#n355

and probably elsewhere by now.  It may be worth creating a distinct API=20
for those counters.  If only increment, decrement, and read operations are=
=20
needed, there shouldn't be a need to disable or re-enable=20
preemption in those code paths - assuming that one is either able to=20
tolerate the occasional cache line bounce or retries in a long LL/SC=20
sequence.  Any opinions on that?

> FWIW, I had a go at building percpu ops that didn't need to disable
> preemption, but that required LL/SC atomics, reserving a GPR for the
> percpu offset, and didn't result in a measurable difference in practice.
> The patches are at:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?h=
=3Darm64/this-cpu-reg&id=3D84ee5f23f93d4a650e828f831da9ed29c54623c5

Very interesting indeed.  Thank you for sharing that,


- Paul
--8323329-10155141-1552329596=:11892
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-10155141-1552329596=:11892--

