Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74018C3ABC3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 06:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IwhHmJcQcd75AJ6y5o/Toowpj/9d3ILH0mbRWZGaYrw=; b=h/jtefWNAaUX/P
	lLUuNSBvH9nZ9/dIbo33pDw9vyonoX5guq+DwT0ILIQo4U40QECCzmBEb+m51l3+mHmJTlIuIztis
	RBES5I6STsAxg+vcCBdYzgNNBawt8uTCutUUTF/lxwm86R0KWa6jP8F4MN6qSWjP9e/dzYqf5hPAp
	Vwv6m2Wq8btUHHMTUG/z+gpzra9v/hLl+kn7fHcmVh27NyARKIW3RGAOqSFJyA5L71E8W24KwItGf
	BegzgkPEitwHxsN+CIDNak6mb2MjCnp1Q2oVkv6Wle6OrxRs3UgsB+q63BJXiJggkWM96I7fZpiMF
	0p1O97NtgDvN8yINv7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDH4i-00000002b9E-0nid;
	Fri, 09 May 2025 06:19:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDH4f-00000002b7y-0351
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 06:19:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 374E843C68;
	Fri,  9 May 2025 06:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866D6C4CEE4;
	Fri,  9 May 2025 06:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746771548;
	bh=NYM1/STB/SI2JzqgJlobo7dJE80eQHq/fsb0VCpU9RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jf35wBd1dAn1FMXBlyvwKAPBK+QlZtSeAYasNL4hs+ZTIqS/R/HHL0j0PaTmWWWNu
	 6dRsc2KRapfXpq4QgqRPbmyGs7mbtoVsZpafv3vab+Bi7iza8rbNMCU+51dCndLHrY
	 5+AxpKOIE8rzuy7X6E0VUbt44NpsltTf4Zo1QayA=
Date: Fri, 9 May 2025 08:19:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 6.6 000/129] 6.6.90-rc2 review
Message-ID: <2025050917-dismay-scary-7261@gregkh>
References: <20250508112618.875786933@linuxfoundation.org>
 <CA+G9fYsKqxUExVW1rEhU8_5pYOuhkzXyeL9TmTyGVsV2-C-PFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYsKqxUExVW1rEhU8_5pYOuhkzXyeL9TmTyGVsV2-C-PFQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_231909_092575_0F9FEEDC 
X-CRM114-Status: GOOD (  22.66  )
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

On Thu, May 08, 2025 at 06:16:12PM +0530, Naresh Kamboju wrote:
> On Thu, 8 May 2025 at 17:00, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 6.6.90 release.
> > There are 129 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Sat, 10 May 2025 11:25:47 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.90-rc2.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> Regressions on riscv with allyesconfig and allmodconfig builds failed with
> clang-20 and gcc-13 toolchain on the stable-rc 6.6.90-rc1 and 6.6.90-rc2
> 
> * riscv, build
>   - clang-20-allmodconfig
>   - gcc-13-allmodconfig
>   - gcc-13-allyesconfig
> 
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
> 
> Build regression: riscv uprobes.c unused variable 'start'
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Build error riscv
> arch/riscv/kernel/probes/uprobes.c: In function 'arch_uprobe_copy_ixol':
> arch/riscv/kernel/probes/uprobes.c:170:23: error: unused variable
> 'start' [-Werror=unused-variable]
>   170 |         unsigned long start = (unsigned long)dst;
>       |                       ^~~~~
> cc1: all warnings being treated as errors

Oh that's wierd.  riscv defines flush_icache_range() as "empty" so then
this patch does nothing in these older kernels.  Ah, it's an inline
function in newer kernel trees as well so that the build warning isn't
there anymore.

As this change feels odd for 6.6 and older kernels, AND it's causing
build warnings, I'm just going to drop it and if the riscv maintainers
really want it applied to these trees, will take a working backport from
them.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
