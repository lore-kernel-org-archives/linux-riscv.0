Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620C5D6AB10
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 21:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J90VJ/3kOSzIevd1nF6+aR8Rcnx2YYoJeB8XFQRwNXU=; b=WcQqAS7E6h6Nvl
	dQhpT33ZgGNzQxvfvtd+ARrZBmnARFLbeHJnFfD05ADdiZ0kpYwbV35o5c5wXDIyvx1ifvvbwfA5L
	2aHNJL1CTXCCESiZhto9HOeXU149+9t1KhUvFxlLEJU373OrY0Ch45B8F4cXnRQnwIsvPaaYBXEZK
	U+nqyw28+agTGzAmpz23BPXppLjOvH76DwUUBaprDTgUSriAwuYDajjjsPAOCueElVUoGvTdhMzpc
	2G4/fJb3hC0O8LLOiaP6Zd7E4MXmT/VFiHJ6ieRTz5z/HBlMTqFFf5cg1jxfrHNDQvBUJt2EzAkna
	fGSioyIehDv887Gj5j2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Pxg-00000000peB-2DFb;
	Thu, 02 Apr 2026 21:52:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Pxe-00000000pdO-1TtF;
	Thu, 02 Apr 2026 21:52:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D587C43B7D;
	Thu,  2 Apr 2026 21:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9D9C116C6;
	Thu,  2 Apr 2026 21:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775166740;
	bh=v9zJEeNVmz7NcsMkpOPkdYk7q2EoPoCfcmjxBRbg/Gw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PTB78iuKGtB1jnCLkrdAAEbFdUBu6bIVdFt5Wka6j9T73o4DOPCGZwiNrnq4PiEr6
	 mBFN0TFFR6noe6wbi63LOXrgXpdD106UW3pCqKSxrNzj8GxdtV8MQyp2Vy1SAsdp3d
	 M6xKXlZbCh0YABGR2JZ5uus7RZzPqgGZDTd9cRTDxhbH89DrUCD35i7ucql2BdpP2E
	 7ULjB46nbQkz0boFssqZvNz1786uWfD+aGTkjAGmooYiXv+ruQ7/oxb1SnuN7wMHKS
	 dZy72w3QSkA4WUNCLllLtT+k1bSnFq6cedLa+/KrtjYL9V2SlHZOhBUsWcX1NjRLrv
	 DcESm7m/FmPPA==
Date: Thu, 2 Apr 2026 15:52:15 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
    Mikko Rapeli <mikko.rapeli@linaro.org>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
    Russell King <linux@armlinux.org.uk>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
    Andreas Kemnade <andreas@kemnade.info>, 
    Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
    Tony Lindgren <tony@atomide.com>, Huacai Chen <chenhuacai@kernel.org>, 
    WANG Xuerui <kernel@xen0n.name>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Sven Schnelle <svens@linux.ibm.com>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Clark Williams <clrkwllms@kernel.org>, 
    Steven Rostedt <rostedt@goodmis.org>, 
    Pablo Neira Ayuso <pablo@netfilter.org>, 
    Krzysztof Kozlowski <krzk@kernel.org>, 
    Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
    Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
    Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
    Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    Geert Uytterhoeven <geert+renesas@glider.be>, 
    Magnus Damm <magnus.damm@gmail.com>, 
    Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, 
    =?ISO-8859-15?Q?Th=E9o_Lebrun?= <theo.lebrun@bootlin.com>, 
    "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
    Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
    =?ISO-8859-15?Q?Jonathan_Neusch=E4fer?= <j.neuschaefer@gmx.net>, 
    Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
    Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, 
    Heiko Stuebner <heiko@sntech.de>, 
    Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
    Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
    Ard Biesheuvel <ardb@kernel.org>, 
    Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
    Bjorn Andersson <andersson@kernel.org>, Michael Walle <mwalle@kernel.org>, 
    Guenter Roeck <linux@roeck-us.net>, 
    Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
    "Rob Herring (Arm)" <robh@kernel.org>, 
    Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Anna Schumaker <anna.schumaker@oracle.com>, 
    Alexandre Gonzalo <alexandre.gonzalo@arm.com>, 
    linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-omap@vger.kernel.org, loongarch@lists.linux.dev, 
    linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
    linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
    linux-renesas-soc@vger.kernel.org, linux-parisc@vger.kernel.org, 
    openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/9] configs: remove obsolete assignments to
 CONFIG_NFS_V4_1
In-Reply-To: <20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org>
Message-ID: <2a5bb9cf-3f0c-6069-6412-cd4c5c4e8b78@kernel.org>
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org> <20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_145222_444952_35431572 
X-CRM114-Status: GOOD (  11.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 17 Mar 2026, Vincent Mailhol (Arm) wrote:

> CONFIG_NFS_V4_1 was revomed in commit 7537db24806f ("NFS: Merge
> CONFIG_NFS_V4_1 with CONFIG_NFS_V4"). However, some defconfigs are
> still referring the old configuration.
> 
> Clean-up all the leftover references to CONFIG_NFS_V4_1.
> 
> FYI, the suppressions were done using:
> 
>   git grep -z -l '^CONFIG_NFS_V4=' -- 'arch/*/configs/*defconfig' |\
>     xargs -0 sed -i -E '/^CONFIG_NFS_V4_1=/d'
> 
> CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN and CONFIG_NFS_V4_1_MIGRATION
> were not in scope of the renaming and still use V4_1 in their name, so
> keep those two untouched.
> 
> Fixes: 7537db24806f ("NFS: Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4")
> Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
