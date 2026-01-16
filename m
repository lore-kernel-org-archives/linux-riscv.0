Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBACCD4A605
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 06:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCO8ITPDTaEW2zvzHPlh53D8CbTXIECiUROf/wdeivI=; b=4yYKVNOC+IjzpT
	y24yBM1V7nxVYXW0PTxpC06/JdK0KmKXMK2TNdHwTf6vmt96G0YO48rQpUDxVknHUGypAaEU4aO2c
	V9OvOCOhcY24ii777/DlCrmEia1uwXUAuYaLbz7anAHc9hREnxArwBjjWggT58U4kUQcvdiWEPpMv
	qC79cgQftngJZ9HbpQ6+Z/dBlOHP6MXvGUuHImIRCatslp8qTvzCil/6r4uX6FYCIQrfamRu3SHQm
	Mi0It1gJwzu68jpXPZMxOUgPZHWq+DI2c/150Vb4qaLNBPBM4Q1Y7Op82MXy0F5PxkvgviWXDyXIN
	aTbO49bTXeafLFk9Oe/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcxw-0000000DdxC-3pRn;
	Fri, 16 Jan 2026 06:05:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcxs-0000000Ddwd-0dQU
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 06:05:45 +0000
Date: Fri, 16 Jan 2026 07:05:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768543539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JeJ1NpG9pEP9v5X+c5s9Iawpn/8GKOVrJ32G4YJqViE=;
	b=QHH5FxhPzYGEddItckzsFRjhRxjYfZqGQzwxeZSkDetjDho35ZkZwR6umybkZG1rgNDIZV
	cwmSvwHiIRvgyrbWD4J3GErdd+2VqeGWGUlZnZvcrWeyPuY5jZKebDA5IY41WHXshC6853
	Mini9O9jfd3AO+NpK9XOOl+rg90QV2jxy0+3n453hKSdOWVsJk3/NnmMdcnSE9Xs2nf5yg
	++ROIiw4qBZg5nijwromYfWLLxMCCex6aIckfcKVUpchkQ40iuLBT7drmVUUK7jQXElRmC
	gYLZH3+qMfERrpFsbtq7bdQRynSfNc5vibjE800050mZtJoTRt86IqrEW8wVzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768543539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JeJ1NpG9pEP9v5X+c5s9Iawpn/8GKOVrJ32G4YJqViE=;
	b=b7k1mUY1GKl83MZEvAiJ8Ik6UKyPlTPKz0jctIq+M6vocxbgdFLFcpFQEsxEvWWZigmfYU
	HjMOx36BZgJTrAAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Implement ARCH_HAS_CC_CAN_LINK
Message-ID: <20260116065400-9deb9bae-1621-4e3a-b12a-22e34906cb85@linutronix.de>
References: <20251222-cc-can-link-riscv-v1-1-633e39e4a60d@linutronix.de>
 <74cdaaf4-598d-29f8-584a-3c6a242adee1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74cdaaf4-598d-29f8-584a-3c6a242adee1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_220544_333305_DB7BF57B 
X-CRM114-Status: GOOD (  18.10  )
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

Hi Paul,

On Thu, Jan 15, 2026 at 09:50:20PM -0700, Paul Walmsley wrote:
> On Mon, 22 Dec 2025, Thomas Wei=DFschuh wrote:
> =

> > The generic CC_CAN_LINK detection relies on -m32/-m64 compiler flags.
> > These are not supported by riscv compilers.
> > =

> > Use architecture-specific logic using -mabi instead.
> > =

> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  arch/riscv/Kconfig | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > =

> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 6b39f37f769a..b4c1f922eed5 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -25,6 +25,7 @@ config RISCV
> >  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> >  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> >  	select ARCH_HAS_BINFMT_FLAT
> > +	select ARCH_HAS_CC_CAN_LINK
> >  	select ARCH_HAS_CURRENT_STACK_POINTER
> >  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
> >  	select ARCH_HAS_DEBUG_VM_PGTABLE
> > @@ -1351,6 +1352,16 @@ config PORTABLE
> >  config ARCH_PROC_KCORE_TEXT
> >  	def_bool y
> >  =

> > +config ARCH_CC_CAN_LINK
> > +	bool
> > +	default $(cc_can_link_user,-mabi=3Dlp64d) if 64BIT
> > +	default $(cc_can_link_user,-mabi=3Dilp32d)
> > +
> > +config ARCH_USERFLAGS
> > +	string
> > +	default "-mabi=3Dlp64d" if 64BIT
> > +	default "-mabi=3Dilp32d"
> > +
> =

> Any reason why this patch shouldn't use the non-d ABI variants, as the =

> rest of arch/riscv/Kconfig does?  I suspect this may not work for =

> !CONFIG_FPU builds.

Toolchains tend to only provide a libc for the 'd' ABI variants.
At least the ones I checked in Debian, Arch Linux and
https://toolchains.bootlin.com/. So I'd like to prefer those to increase
the chance of CONFIG_CC_CAN_LINK=3Dy.

I'll add dedicated clauses for FPU=3Dn in the next revision.

It would also be possible to have non-d as a fallback for FPU=3Dy, but it
is slightly more complex to represent and will probably never be used.


Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
