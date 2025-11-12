Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30291CD37BB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 20:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqOlLv8R2e2MYvAPO1Aul2l0FCtIhl+aRgNd/loVFUM=; b=m70Sz2h5p7myHd
	kwhjOePlqRd6JnhiY8ketCAPwM9tm1G8uZvsTaOEGMD1r+ISEitgCVMKkQ2JdDmsE+Uu9SPYJLwjJ
	7dMI1vgHUGw4Iw1TJJDtFGDL6l1GlWSIEN5EpAyYeVOIKsin3X7puRiHFnVahEclj8j//CQq/TJMM
	d9z6A32DLNb+/bNMsTPurbp65MD8kgyIKCF1ZNsKhU799ObDGjqh9/KE4u5fGtwPGuaZGieePiHQp
	m535qDNAXQWBZ4cPhMoeBBkosQ1q8Jm1AFpvRoYY4qB4e9Ri/W6BM35YVbca0PkoZIlxPWgh4zWLB
	ZrKl1iaCK/EGXAHBbMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJH4E-00000009SGO-2VpQ;
	Wed, 12 Nov 2025 20:03:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJH4C-00000009SFK-3iCR
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 20:03:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9223640430;
	Wed, 12 Nov 2025 20:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2030C4CEF7;
	Wed, 12 Nov 2025 20:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977824;
	bh=5XGz0hlFo8UZGbHju91BH5eFiKMsQoRSZ/aU1mUCqXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRShmlGO4OOUEpCIywZ0LyFsNqkWdpHeqkdZ0lgEtfkK82ZFTvPZdRcg6RsBEyHHW
	 EG3blHG/DfGSKdXv+Nh8IFDvUtYTfeOU5dErfiBACZ4MhVabQi+OVv6txDptfOuJX+
	 JHc/fPobgnIOiau5sP0QWHnUIdTQEuUTP97QT/Pmutyjeileznh2IkyNofbsAJxpOK
	 kX9dy3TTJQnavtmWNj70vAwe4KUExZ+gGnm/rMIBIglSfCIlNYXzymsGsLiOhvhhdt
	 Xt/bqmAzZX4ehH4QviVQCXhxU5JFWzhEVtskSohomDNdd7rgIG+zmBCafEUAdBzBCd
	 vfAb2Btlz1Q1Q==
Date: Wed, 12 Nov 2025 20:56:12 +0100
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
Subject: Re: [PATCH v2 03/10] kbuild: allow architectures to override
 CC_CAN_LINK
Message-ID: <aRTmXJVXlbkF2rI4@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_120344_967023_00F76B29 
X-CRM114-Status: GOOD (  17.34  )
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

On Tue, Oct 14, 2025 at 03:05:18PM +0200, Thomas Wei=DFschuh wrote:
> The generic test for CC_CAN_LINK assumes that all architectures use -m32
> and -m64 to switch between 32-bit and 64-bit compilation. This is overly
> simplistic. Architectures may use other flags (-mabi, -m31, etc.) or may
> also require byte order handling (-mlittle-endian, -EL). Expressing all
> of the different possibilities will be very complicated and brittle.
> Instead allow architectures to supply their own logic which will be
> easy to understand and evolve.
> =

> Both the boolean ARCH_HAS_CC_CAN_LINK and the string ARCH_USERFLAGS need
> to be implemented as kconfig does not allow the reuse of string options.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  Makefile     | 13 +++++++++++--
>  init/Kconfig |  4 ++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> =

> diff --git a/Makefile b/Makefile
> index 17cfa11ca7163aa3297101ceb3c9e85f4878f12d..26e5bca534e27034c355939bc=
a4c90db435ecdbd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1134,8 +1134,17 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
>  LDFLAGS_vmlinux	+=3D --emit-relocs --discard-none
>  endif
>  =

> -# Align the bit size of userspace programs with the kernel
> -USERFLAGS_FROM_KERNEL :=3D -m32 -m64 --target=3D%
> +# Align the architecture of userspace programs with the kernel
> +USERFLAGS_FROM_KERNEL :=3D --target=3D%
> +
> +ifdef CONFIG_ARCH_USERPROGS_CFLAGS

Is this some left-over from a previous version?

s/CONFIG_ARCH_USERPROGS_CFLAGS/CONFIG_ARCH_USERFLAGS/

Kind regards,
Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
