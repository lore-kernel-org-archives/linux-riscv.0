Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB504D6AB16
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 21:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhuQTgohgCxs33MLAsswAJ9cNVS7yS7Le7qTauFI6wk=; b=ihZCG30s00gdki
	qgeI53XhgijqCklgEh/sKiGBGWcj/jc2Lk4lSqWwsV01Lt186amKkOXKTAhDmv3uT/hdZI3zKdpSq
	/2HaQCIQ0ib0TT3jiM62HPPmPzTKV4PzfdbdCeTY3LHh+9ZLTGCZOJD3tTDSsUQhyN9hysxLPcNpd
	UA7i+DaheOnA11VM6VhXWrtdMaL9zLtsD6vhxvGcG91KyMu0beFvbAfpdeg0bEur08RRkuy3b4Cyw
	YghIIEsOJIzVm0VVAHIUwFZvb5cjEVYf+i3J5jDz92brYuKq4P2g7YQB2lLe0G1tiQaJ0SRplC7UJ
	QA1klrUKFwhB/7/c3OnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8PwQ-00000000pXf-16oD;
	Thu, 02 Apr 2026 21:51:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8PwO-00000000pXO-1dOs;
	Thu, 02 Apr 2026 21:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B02160121;
	Thu,  2 Apr 2026 21:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CFAC116C6;
	Thu,  2 Apr 2026 21:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775166660;
	bh=+iWo8G+lGLAR0AEWKadkwlt32LjzfIOHKPITuBCakWs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uh7N/3FRUjqua+aPCo/hGr/AdrmusEl1H/a3Cy2K3ax/7zWAaowq7QLQao9luVbWo
	 hhp+ELOy56vNZgWo/30UXJ+R+KNwAUX+g9t5upzBm19UO38qCmclRomH9W9JilFn3g
	 1M3od6tckFksVcXsO4otmEq7oBs2ncVax1WS/48Gk7Y/jRGn5aI6Ty0S32Qrtb3v+N
	 FCfqxPCfuHXXK+tb8kOeAkmUobWREiK7V0IqzM0OnWy9oCVbOYxajs4XGYlWHY2x7t
	 AkBA5ON0TiTxqW6AtiPnUW+DWm5PHRBPUIiBBcwzXpeViYkdJ68cXcODxvoTFEl/DM
	 YZIYLd1IONOQA==
Date: Thu, 2 Apr 2026 15:50:54 -0600 (MDT)
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
Subject: Re: [PATCH 2/9] configs: remove orphan dependencies of
 NETFILTER_XTABLES_LEGACY
In-Reply-To: <20260317-arm_defconf_cleanup-v1-2-8eecb7fdd24d@kernel.org>
Message-ID: <576cec38-a5e4-5391-2a57-b164e84a813f@kernel.org>
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org> <20260317-arm_defconf_cleanup-v1-2-8eecb7fdd24d@kernel.org>
MIME-Version: 1.0
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

> Since its introduction in commit 9fce66583f06 ("netfilter: Exclude
> LEGACY TABLES on PREEMPT_RT."), the configurations below all depend,
> either directly or indirectly, on CONFIG_NETFILTER_XTABLES_LEGACY:
> 
>   - CONFIG_NETFILTER_XT_TARGET_CHECKSUM
>   - CONFIG_IP_NF_FILTER
>   - CONFIG_IP_NF_TARGET_REJECT
>   - CONFIG_IP_NF_NAT
>   - CONFIG_IP_NF_TARGET_MASQUERADE
>   - CONFIG_IP_NF_MANGLE
>   - CONFIG_IP6_NF_FILTER
>   - CONFIG_IP6_NF_TARGET_REJECT
>   - CONFIG_IP6_NF_MANGLE
>   - CONFIG_IP6_NF_NAT
>   - CONFIG_IP6_NF_TARGET_MASQUERADE
> 
> This new dependency caused many symbols to become orphaned, meaning
> their dependencies are no longer satisfied and Kconfig drops them from
> the final configuration.
> 
> Note that CONFIG_NFT_COMPAT is another parent dependency, so the
> above-listed symbols would not become orphaned as long as NFT_COMPAT
> is present.
> 
> Considering that these are legacy options and that nobody complained
> in recent kernel releases when these options were already missing, it
> is safe to assume they can be removed.
> 
> Suppress all these configuration symbols in all the defconfig files
> that have neither CONFIG_NETFILTER_XTABLES_LEGACY nor
> CONFIG_NFT_COMPAT set.
> 
> FYI, the suppressions were done using:
> 
>   git grep -z -L -E '^CONFIG_(NETFILTER_XTABLES_LEGACY|NFT_COMPAT)=(y|m)$' -- 'arch/*/configs/*defconfig' |\
>     xargs -0 sed -i -E '/^CONFIG_(NETFILTER_XT_TARGET_CHECKSUM|IP_NF_FILTER|IP_NF_TARGET_REJECT|IP_NF_NAT|IP_NF_TARGET_MASQUERADE|IP_NF_MANGLE|IP6_NF_FILTER|IP6_NF_TARGET_REJECT|IP6_NF_MANGLE|IP6_NF_NAT|IP6_NF_TARGET_MASQUERADE)=(y|m)$/d'
> 
> Fixes: 9fce66583f06 ("netfilter: Exclude LEGACY TABLES on PREEMPT_RT.")
> Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
