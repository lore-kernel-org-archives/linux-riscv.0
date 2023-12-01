Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96051C07E97
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 12:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwZiNGlmBtL3/LGRLIkPJgEvP01M+6a3fPGYwAQP1/M=; b=msvaxS2H6+Xy/u
	b/qoOLg6AqIxQfAuutxeS22jGIZ9u+zlWRklsiZoJLg28R3Tz2xa3Jpo0yuiHYm3mCX9c/Pp9EV0f
	xXY9Lh+bFo6mknH3UL/YdHLDBNtO1UvZI2k4VrW4XpW+f7BHvkY9ctrRm4AJJQtj4WrvRA+qm4WM6
	EEfIWcBNxK9SBinPfoBIfQ7KugfNv4rI68QC8oBwwvIIqDBEY6H3I3ztH78MziGZJe5kuNhDQwNja
	jePBLJvo54dWxrSpfu2+0Ui/3JUiX6FQywDu9KVzBZPJI6/P3xApix93jPPMBpcBijsz6wlO1nhFz
	Jqdw6A0efmIjb6XgwM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r92do-00DZAS-2J;
	Fri, 01 Dec 2023 12:29:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r92dl-00DZ87-0t;
	Fri, 01 Dec 2023 12:29:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 90B83B847A8;
	Fri,  1 Dec 2023 12:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FD1C433C9;
	Fri,  1 Dec 2023 12:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701433742;
	bh=2msErawXU1FtCRCS5sg1Q8l3QB+7X8g5Q4ahABRE7v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dJ8jDacFlSnfz6vHti2Hqo/yYnjTmAowPHXSHHs/ZVAyHKK3vqYmj15fWpmlFSwyK
	 oDGOQXI0cD4TOPugWR4XLWNsKEWov5ibPPHMGBZmtzjTJjHNBvU0cN9CgmbjjZoerF
	 FiLiZFU4qf9MaXbefoLTcFW9iipaY39QNIHlh/Ag=
Date: Fri, 1 Dec 2023 12:28:59 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	James Morse <james.morse@arm.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com, Len Brown <lenb@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Salil Mehta <salil.mehta@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/21] Initial cleanups for vCPU hotplug
Message-ID: <2023120131-leotard-deprecate-4e27@gregkh>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <87plzqxiyl.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87plzqxiyl.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_042905_452996_8EB7B62E 
X-CRM114-Status: GOOD (  15.79  )
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

On Fri, Dec 01, 2023 at 12:25:54PM +0100, Thomas Gleixner wrote:
> Russell!
> 
> On Tue, Nov 21 2023 at 13:43, Russell King wrote:
> > This series aims to switch most architectures over to using generic CPU
> > devices rather than arch specific implementations, which I think is
> > worthwhile doing even if the vCPU hotplug series needs further work.
> 
> I went through the whole series and I can't find anything
> objectionable.
> 
> Vs. merging: It does not make sense to split this up and route
> individual patches.
> 
> So I can pick the whole pile up and route it through tip smp/core unless
> Rafael or Greg prefer to take it through one of their trees. For the
> latter case:
> 
>        Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> 
> Greg, Rafael?

I can take them, will do so this weekend when I catch up on patches on a
14+ hour flight...

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
