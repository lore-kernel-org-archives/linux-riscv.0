Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9FECD5BAB
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ypInL/DXsgkhkFvsXS+Cmvl/O+mgI5ZtN4Lfe6gOno=; b=v02bpDZWCxuQIP
	gd2eo4F2NS28f7v8OGrz9QSHLiXrsstDO9ORUx+6an5sGMqdC89DJ8ketXRTReT1E9KLXzHgpBMGe
	sQBqxuWWFJ+ManhxiFD61wK1PRi0OyJO/BCZ2CkIbbWBfLy99q7U0mkANw1M+Pt4J+GPTbnCV5H+O
	fJ2+irYTfumdXg5Nyhhi21f30C0lEoDZ98/F0OgtigvD5rcHcauF4XAuYs4KK5NQY+DRYAWKm+lkv
	W01X5dwcdP/5hN94HMVOi3+84oWHPpOezO9+2yr6Mu9p8g2SLGJdhbmJbLq9GHms+Y9ArngQePXK6
	UVUqzgl5cmZ6+Bx6d+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTXm-0000000ABC8-3IQl;
	Thu, 13 Nov 2025 09:23:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTXl-0000000ABBh-0V9Q
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 09:23:06 +0000
Date: Thu, 13 Nov 2025 10:22:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763025779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HMXftlIRLs0I4I5KBEH91u2IIAB76cPs2+aj/P7XaXI=;
	b=ju37J1p2hCJon7Dq3EBdc85zXolYmJpQFCDTDD8FHlvRoEjSOjlt4Yp4KTbgB+KXM8NcYf
	x3XTLgFMg7s207AYx4nl33y1T7AsXPupY2fLhI04LI5i9mGt07hV5/LXgVSxjC9NWmgQAa
	KqW1OH6sg1WZuym+vr+IuqGfgMbqLdr1tI/aw1wSpW86G2aLwk2MCJCFBMALz4sjVRNETn
	KkDa1CbmU1hyAhZyUbsikCLXiGWtupPq5TLM5m+oNtPlFP+wYSHVn6OyRIyBbZiK4RDRII
	854zE6FXH9KIsYP0DkrSuQU61CL7NMT2DNoYB6l8S3LyjnomxgvlNoDIEVa5SA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763025779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HMXftlIRLs0I4I5KBEH91u2IIAB76cPs2+aj/P7XaXI=;
	b=yj3MpOVfBn1X0F5np7dHo4NQ2EaJr+XO2eqbf3c6nh3gZeHlyNtkeRsYccVi0YEIjMy8Pj
	TA7I+NuN5tR4vTBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 03/10] kbuild: allow architectures to override
 CC_CAN_LINK
Message-ID: <20251113102236-1954dc76-ad1b-423d-ad29-104c3e07db17@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
 <aRTmXJVXlbkF2rI4@derry.ads.avm.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRTmXJVXlbkF2rI4@derry.ads.avm.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_012305_322725_31B1AC72 
X-CRM114-Status: GOOD (  19.93  )
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

On Wed, Nov 12, 2025 at 08:56:12PM +0100, Nicolas Schier wrote:
> On Tue, Oct 14, 2025 at 03:05:18PM +0200, Thomas Wei=DFschuh wrote:
> > The generic test for CC_CAN_LINK assumes that all architectures use -m32
> > and -m64 to switch between 32-bit and 64-bit compilation. This is overly
> > simplistic. Architectures may use other flags (-mabi, -m31, etc.) or may
> > also require byte order handling (-mlittle-endian, -EL). Expressing all
> > of the different possibilities will be very complicated and brittle.
> > Instead allow architectures to supply their own logic which will be
> > easy to understand and evolve.
> > =

> > Both the boolean ARCH_HAS_CC_CAN_LINK and the string ARCH_USERFLAGS need
> > to be implemented as kconfig does not allow the reuse of string options.
> > =

> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  Makefile     | 13 +++++++++++--
> >  init/Kconfig |  4 ++++
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> > =

> > diff --git a/Makefile b/Makefile
> > index 17cfa11ca7163aa3297101ceb3c9e85f4878f12d..26e5bca534e27034c355939=
bca4c90db435ecdbd 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1134,8 +1134,17 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
> >  LDFLAGS_vmlinux	+=3D --emit-relocs --discard-none
> >  endif
> >  =

> > -# Align the bit size of userspace programs with the kernel
> > -USERFLAGS_FROM_KERNEL :=3D -m32 -m64 --target=3D%
> > +# Align the architecture of userspace programs with the kernel
> > +USERFLAGS_FROM_KERNEL :=3D --target=3D%
> > +
> > +ifdef CONFIG_ARCH_USERPROGS_CFLAGS
> =

> Is this some left-over from a previous version?
> =

> s/CONFIG_ARCH_USERPROGS_CFLAGS/CONFIG_ARCH_USERFLAGS/

Indeed. Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
