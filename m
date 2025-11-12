Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563F3CD37BF
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 20:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLCPgvZf3zsoDe9s4Mxneo1h1dQjpxhLENLhbOI+DvI=; b=a9BbE8oMO+vhZO
	cicqOazZX0Ytwj3ZOixVXsrTELjsDW/zax74A1RRsjHxuyxQYVXARKaJPuzuAMAuE6iv7m9ePOW85
	Rx4rY1TZSrTeaT762RmTNc9oJ3ehGQuBkZBbiF9Jk3v/FiTYiRDjGsi6Fd/R8pMpvV0cNiCRzWnPK
	kkixejxg1fJRxaBu4kwTbyx117HJ5kTYEwFwvwnxZDFWE60hCYV5UzEY9xkR2zMxQXAxPSMQwted0
	3eYoI1xA4cU/Tac9dMe0QjXv/ITB7FkFkifMqgGARD3D0OWsxtgRccTc6BoJ1x9BiJRgF5DjeDFYG
	bIbEa8ub68HzylhneSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJH4M-00000009SKQ-0tl6;
	Wed, 12 Nov 2025 20:03:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJH4J-00000009SIW-0v1C
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 20:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6C4240A26;
	Wed, 12 Nov 2025 20:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5E0C19422;
	Wed, 12 Nov 2025 20:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977830;
	bh=nUO9ROu0gW7/ns/uQ28gcX3yc+GW0w13a9/X2aAT8jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/ZMvnzn2CADtOmnEK8oxSBL8h+W0p5Nn5UpsvsKruwJSHxVcUeR4XM3Xql0nKdus
	 bSqKhs+uMkYIkIZuUXwM0okWDFlbTc1b3GFwaLc0i8MS0mArq4SZjPqyfw0pTxylrb
	 kDcACs6NyCZrwCjMXmWAun5aPbx2tyCNun6nsiYlfBKzyIIndQtIzMFJnjIFqLp5W7
	 U7cJIK3dUA8BdBGXaq6srPbi1okyViOeP9mxuL9ACCcf5VmurrX4ECVYI2S9Yt8Co2
	 wGu2c5Zt7YjzPlTh1Ym0osiGu8n7TbyhwjUGx6vHaiztJkPuyn821csRFMNgYBEt1M
	 bcQaFk/gjrsng==
Date: Wed, 12 Nov 2025 21:03:23 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
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
Message-ID: <aRToC77bNUy2sKAK@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_120351_300137_2705C6A6 
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

On Tue, Oct 14, 2025 at 03:05:15PM +0200, Thomas Wei=DFschuh wrote:
> The current logic to inherit -m32/-m64 from the kernel build only works
> for a few architectures. It does not handle byte order differences,
> architectures using different compiler flags or different kinds of ABIs.
> =

> Introduce a per-architecture override mechanism to set CC_CAN_LINK and
> the flags used for userprogs.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Rebase and drop already applied patch
> - Disable CC_CAN_LINK if the test program generates warnings
> - Move to architecture-specific logic
> - Link to v1: https://lore.kernel.org/r/20250813-kbuild-userprogs-bits-v1=
-0-2d9f7f411083@linutronix.de
> =

> ---
> Thomas Wei=DFschuh (10):
>       kbuild: don't enable CC_CAN_LINK if the dummy program generates war=
nings
>       init: deduplicate cc-can-link.sh invocations
>       kbuild: allow architectures to override CC_CAN_LINK
>       riscv: Implement custom CC_CAN_LINK
>       s390: Implement custom CC_CAN_LINK
>       powerpc: Implement custom CC_CAN_LINK
>       MIPS: Implement custom CC_CAN_LINK
>       x86/Kconfig: Implement custom CC_CAN_LINK
>       sparc: Implement custom CC_CAN_LINK
>       kbuild: simplify CC_CAN_LINK
> =

>  Makefile                |  8 ++++++--
>  arch/mips/Kconfig       | 15 +++++++++++++++
>  arch/powerpc/Kconfig    | 15 +++++++++++++++
>  arch/riscv/Kconfig      | 11 +++++++++++
>  arch/s390/Kconfig       | 11 +++++++++++
>  arch/sparc/Kconfig      | 11 +++++++++++
>  arch/x86/Kconfig        | 11 +++++++++++
>  init/Kconfig            |  7 +++++--
>  scripts/Kconfig.include |  3 +++
>  scripts/cc-can-link.sh  |  2 +-
>  10 files changed, 89 insertions(+), 5 deletions(-)
> ---
> base-commit: 10f8210c7a7098897fcee5ca70236167b39eb797
> change-id: 20250813-kbuild-userprogs-bits-03c117da4d50
> =

> Best regards,
> -- =

> Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> =


Thanks for the patch set and all the work behind!  I found only one
issue in patch 3, the rest looks good to me as they are.

I haven't reviewed the compiler flags for the archs, but from the formal
point of view they look good to me, too.

How shall we proceed with here?  I think, easiest would be if we get
appropriate acks from the architecture maintainers, so we could take
this via kbuild.

Other opinions?

Kind regards,
Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
