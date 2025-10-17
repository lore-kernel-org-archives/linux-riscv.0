Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07871CCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLwPqerYmZ0Hii7zVoeU9KjVxW4RotFXmoROBo3W6QQ=; b=jj+BZ0sb1gZa5+
	awlYCqZabk0ZpZG9qO0EjKb59s3zLRTBnPj1yFza9sTSnglctGs7K9vYL20Mv1ArhiD3FeuTwBQT5
	mmFM7nQ+3DGGTkBxjQYhH+lY4e2I3rMBDLMdrs3rsdYYRTufAyVpm+Vnh6ykfvLJemIBY8Z4uuoBU
	yfS+wwD8S3Bay466hFrvlXyZkPpVE0PSipFqWDKDnmPXmVcfYruJ6KhPciOexHceP4z2iRczVBEil
	jCmdq43GHUhLcPIM8bGzisGH0jo23wMGNEs3BhLpCp31ZWtrw+3oeQm808uhE1dZbf/9k7cG7LvXW
	oJD7p3P+5dsIQ+p+zCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ia8-00000007g2t-19HE;
	Fri, 17 Oct 2025 11:25:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ia6-00000007g0j-17pq;
	Fri, 17 Oct 2025 11:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6NUdGt9MtwvZM8jFQHDsw1CCYzG2H7JFSs9BY7PdJqA=; b=Hs9rnXkxHjJhukQH8YKpfmx1MG
	VZA60esTzih9n9wz+52eqcD59QOx+XDFIHyh7c+pophLHqgU4pS4pFhzbPljuZVWqPytPuzxcaLl7
	S+E7SYSRSFwMybJrMhDmdTjSEfc00iD7BHmyfTmTRiICFGeQllh5SzKuMB3fgb9Ax4AAWWvj3Uavu
	KjG5+YOXW8tPPa0//Qqm1AlGRYRbcs7Y3JxSsHqhWz2AGe38QnB6cYh9h9t3xtx3WZuOcipGJF8lQ
	1baXzfSn292iNCLYPtUPcw5e9HmK8yNQQvOc+EEUeIP/k8jyFwFcGC+J6+je+9353wqrDfz3kSPye
	pecvA4Gw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ia1-00000007Web-1SpD;
	Fri, 17 Oct 2025 11:25:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E1F4030023C; Fri, 17 Oct 2025 13:25:04 +0200 (CEST)
Date: Fri, 17 Oct 2025 13:25:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Cooper <andrew.cooper@citrix.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
Message-ID: <20251017112504.GE3245006@noisy.programming.kicks-ass.net>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de>
 <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
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

On Fri, Oct 17, 2025 at 12:08:24PM +0100, Andrew Cooper wrote:
> On 17/10/2025 11:09 am, Thomas Gleixner wrote:
> > --- a/include/linux/uaccess.h
> > +++ b/include/linux/uaccess.h
> > +#define __scoped_masked_user_access(_mode, _uptr, _size, _elbl)					\
> > +for (bool ____stop =3D false; !____stop; ____stop =3D true)						\
> > +	for (typeof((_uptr)) _tmpptr =3D __scoped_user_access_begin(_mode, _u=
ptr, _size, _elbl);	\
> > +	     !____stop; ____stop =3D true)							\
> > +		for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop=
;		\
> > +		     ____stop =3D true)					\
> > +			/* Force modified pointer usage within the scope */			\
> > +			for (const typeof((_uptr)) _uptr =3D _tmpptr; !____stop; ____stop =
=3D true)	\
> > +				if (1)
> > +
> =

> Truly a thing of beauty.=A0 At least the end user experience is nice.
> =

> One thing to be aware of is that:
> =

> =A0=A0=A0 scoped_masked_user_rw_access(ptr, efault) {
> =A0=A0=A0=A0=A0=A0=A0 unsafe_get_user(rval, &ptr->rval, efault);
> =A0=A0=A0=A0=A0=A0=A0 unsafe_put_user(wval, &ptr->wval, efault);
> =A0=A0=A0 } else {
> =A0=A0=A0 =A0=A0=A0 // unreachable
> =A0=A0=A0 }
> =

> will compile.=A0 Instead, I think you want the final line of the macro to
> be "if (0) {} else" to prevent this.
> =

> =

> While we're on the subject, can we find some C standards people to lobby.
> =

> C2Y has a proposal to introduce "if (int foo =3D" syntax to generalise the
> for() loop special case.=A0 Can we please see about fixing the restriction
> of only allowing a single type per loop?=A0=A0 This example could be a
> single loop if it weren't for that restriction.

So elsewhere, Linus suggested to use a struct to get around that. See
for example this lovely thing:

  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?=
h=3Dlocking/core&id=3D1bc5d8cefd0d9768dc03c83140dd54c552bea470


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
