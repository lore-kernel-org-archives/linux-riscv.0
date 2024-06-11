Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C373C25B76
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehuYwU3Elqik/LHttM2IGHiCzQEiYpVX/RAnGhhqszM=; b=sMyLbhARYY9W4V
	PUdxaweatLeF9ABGkUdcAE/ijn8bcKv0gp4Cz/fUF3usHwhVwXDunDCFGMGeO9Mrl1qqG+NsNXwhl
	2FFvrAVymDhDJEJH6l6x2HsRschmtwIadclvhAjVRG6DxKgBzeWMdI9D/q/xoK7hcMx9MIJAQK5ue
	CBhL/2ypIMT52EZjwQKrKaF1WnKgZnp9GciFjqFyb6TnMuhvJM2NaspOG9M1ymvFI2PCZjQ0cIJdX
	iK8hbiD1Bwqdw6NclMHKy+OEx9QTsTWGc3Vbz7sowOdGQ5unCvcWxzzZqPxq7hlj7di/T2Phv50G6
	//yHosWU6ewwEWR+rL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGxDP-00000008Bh7-3kkW;
	Tue, 11 Jun 2024 08:50:51 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGxDJ-00000008Bdn-1uUf;
	Tue, 11 Jun 2024 08:50:48 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sGxBT-0000Ne-00; Tue, 11 Jun 2024 10:48:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 023C9C0120; Tue, 11 Jun 2024 10:41:16 +0200 (CEST)
Date: Tue, 11 Jun 2024 10:41:16 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Celeste Liu <coelacanthushex@gmail.com>
Subject: Re: [PATCH 3/6] mips: defconfig: drop RT_GROUP_SCHED=y from
 generic/db1xxx/eyeq5
Message-ID: <ZmgNrOr1nalSTeja@alpha.franken.de>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
 <20240530111947.549474-11-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240530111947.549474-11-CoelacanthusHex@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_015045_993901_58636937 
X-CRM114-Status: GOOD (  16.97  )
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
Cc: Rich Felker <dalias@libc.org>, Lennart Poettering <lennart@poettering.net>, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>, linux-kselftest@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Sven Joachim <svenjoac@gmx.de>, Mykola Lysenko <mykolal@fb.com>, =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, Gregory CLEMENT <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Nicholas Piggin <npiggin@gmail.com>, linux-rpi-kernel@lists.infradead.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 30, 2024 at 07:19:51PM +0800, Celeste Liu wrote:
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
> needs an RT budget assigned, otherwise the processes in it will not be able to
> get RT at all. The problem with RT group scheduling is that it requires the
> budget assigned but there's no way we could assign a default budget, since the
> values to assign are both upper and lower time limits, are absolute, and need to
> be sum up to < 1 for each individal cgroup. That means we cannot really come up
> with values that would work by default in the general case.[1]
> 
> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
> can only be enabled when all RT processes are in the root cgroup. But it will
> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
> 
> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
> support it.[2]
> 
> [1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
> [2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
> 
> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
> ---
>  arch/mips/configs/db1xxx_defconfig  | 1 -
>  arch/mips/configs/eyeq5_defconfig   | 1 -
>  arch/mips/configs/generic_defconfig | 1 -
>  3 files changed, 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
