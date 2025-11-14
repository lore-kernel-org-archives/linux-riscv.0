Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A531ECDE00A
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 04:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXF3VHoKQqzHTi2bOH15FJU9tMK/v0nbAwIKBhlDWF4=; b=Ff820NRqcfgmhk
	lFC/Um85r/zmp0VfJ50veNkXNcXNqGREVdXUSgr1y6fg8PahZhfhPf+sl/rPiclCR9iHu7XI6uD/d
	pRhr1Qk2RBOxAlMc99tBi2okqDQ+EY+GogEqjzRducXG4NmyyQoiP64QXIlYc0izlLpTD4W2EF9BO
	6f1DkrQu25gc2VHoUEyCEEvCtLzI6FTBg0UNSlMnEp4dkwDahiTpofij7NFMWzr9EAy07448r9wvr
	GY/b3/Vc56G0LIUeLWQ7t+d17e+CNf1yTuJDzRVIvlIXt5+lC4nsnQnLDNpRpsU7/Ar6y4h62scf4
	72rkmK1+8m0cJdpsO9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlL1-0000000BXJC-46Ex;
	Fri, 14 Nov 2025 04:23:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlL0-0000000BXIm-09iA
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 04:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C07E4004E;
	Fri, 14 Nov 2025 04:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C574FC16AAE;
	Fri, 14 Nov 2025 04:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094183;
	bh=RobVRCgZWKDAOE0gDSu7wYFNPR+HLgdW/UejZYDDlGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpQ9qeouOkhcbiv4XbYPE+RA9hjIDmMQ+z1O63pqvJGFha1JCpQaMOcKWJgzbo8tk
	 XJ4yA30qSWHnrF0Xbwx9XxwaF0nqeyeu8ltfDqZPbN3oex3L07o5IThMLseHcDg6Bv
	 1fAuESBIcya76J7XaQggkHMa4Yk+pn7g9Vu2i9/p55spB0NQ8CVygWnFp30/HA2jVh
	 P2AYeyhI/xe9XkmCwZgHndjonZMsbW6q7wfnGOteYAV8PYxLE0bQz5bLBmRsnPFe95
	 PgIaRb96v6thoR4zQ8OxMZQCYI5p7PTlsPB72vjiLqaxbzH5FAExUCREc5KTbvjwxG
	 7NLMjsjSUxLpA==
Date: Thu, 13 Nov 2025 21:22:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
Message-ID: <20251114042254.GB2566209@ax162>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <aRToC77bNUy2sKAK@derry.ads.avm.de>
 <20251113102307-ca2180c8-4876-46ea-8678-aaedd9ba36f0@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251113102307-ca2180c8-4876-46ea-8678-aaedd9ba36f0@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_202306_135524_282320ED 
X-CRM114-Status: GOOD (  23.36  )
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

On Thu, Nov 13, 2025 at 10:31:10AM +0100, Thomas Wei=DFschuh wrote:
> On Wed, Nov 12, 2025 at 09:03:23PM +0100, Nicolas Schier wrote:
> > Thanks for the patch set and all the work behind!  I found only one
> > issue in patch 3, the rest looks good to me as they are.
> > =

> > I haven't reviewed the compiler flags for the archs, but from the formal
> > point of view they look good to me, too.
> > =

> > How shall we proceed with here?  I think, easiest would be if we get
> > appropriate acks from the architecture maintainers, so we could take
> > this via kbuild.
> =

> That would surely be the best option. Unfortunately quite frequently it i=
s hard
> to get architecture maintainer's feedback on a cross-architecture series.
> =

> > Other opinions?
> =

> It would also work to only take the first three patches through the kbuil=
d tree
> and push the other ones through the architecture trees.
> =

> I don't really have a clear preference.

If you do not have a preference, I think it would be easier if Nicolas
picks up the first three patches (which I will go review formally
shortly, sorry again for the delay on that) to make sure they make
6.19-rc1 then you can send out the architecture changes individually
with plans to pick up any ones that have been left behind after a
development cycle? That should give architecture maintainers enough time
to properly react and review the series (since they will know if those
flags are appropriate). We could probably send the last patch as a fix
if those changes do not land until 6.20-rc1.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
