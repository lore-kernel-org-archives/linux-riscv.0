Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65684CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 02:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIZaWhXAZlaVSxTVUjIyczJmx3R8cPdc1IpkChIsxAI=; b=qqgaCDWP1gHtV8
	b9IuI9Bc203cqbDTQu+afg3qKx5I8gRMvMJGL84weKA9Wue+Vp6fWXDUyJAM2dNxhZWyFj4E600ym
	DH6UyMmcx/SRqblCxmhjTNNlyc/OyMDl3nx4zVyJfC6iQxUYmL9RiqN7z7KyNRwPngF81awWeQ8c7
	LMYkyz/SEijA3bjyAq+JHYb6o38r/nAhDF1JLR1bNkC2RqnC+vDCxlQQMMisHbzOTdHFg4zD7NX/d
	N2lb2H9zU/n4BRXvbNImImPAJfnE2Qc+srKx9c5It6IEb2ZVkoJud2hVq7c1DjdHIZ7OiM7UC8nZV
	8JhV6OkIu45gh1FV9Z0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fyi-000000051NC-3DZQ;
	Thu, 09 Oct 2025 02:02:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fyh-000000051Mg-1xkt
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 02:01:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CE7460229;
	Thu,  9 Oct 2025 02:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2621C4CEE7;
	Thu,  9 Oct 2025 02:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759975318;
	bh=cmwJ00nux7/r0iE9bq3u7flM+mf5JWKL9Ygfu+DRbZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OxACerLfqf7L0d+AYAIEeeGyy5zqxC2ius15pBQc8ETUlL2stiRM2z2SXmX7FqoCe
	 xM16zufcxWF/cjPtXKogBPhPdBmb9eAiLgUNAmUnIztHLtvYqsco8o478BXmuCv1iD
	 hu0Ztn9gD/JRWTVkfk7NCiNdoM01TsTys1SQbx9aRf1wjBGo32ww7hHF0O/jf6Q1bl
	 Sc6d7JhjzZThIKdp0yMNlPe3V8JLEDsQr2pEC9gRX+NQ6+vMVdnsH1XVqVW7xe5+eR
	 3NsTdQgM/EKGMVj9MsZgktijPEJD5SjV3rq1WMdXrp7ZWls0TpJCOjKV+I2rDdvuRi
	 VPAljXaAERqfQ==
Date: Wed, 8 Oct 2025 20:01:54 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: duchangbin <changbin.du@huawei.com>, Alexandre Ghiti <alex@ghiti.fr>, 
    andybnac@gmail.com
cc: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Prevent early kernel panic in instrumented
 apply_early_boot_alternatives
In-Reply-To: <d41d9c7a103f4600a4fc5beea77e0f4e@huawei.com>
Message-ID: <2396743a-480e-2ab3-f7fe-569d8f2adfcf@kernel.org>
References: <20250624113042.2123140-1-changbin.du@huawei.com> <a89f5970-5ea9-4d92-8952-6c26a22ac153@ghiti.fr> <d41d9c7a103f4600a4fc5beea77e0f4e@huawei.com>
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

Hi Alex, duchangbin, Andy,

On Wed, 25 Jun 2025, duchangbin wrote:

> On Tue, Jun 24, 2025 at 02:54:32PM +0200, Alexandre Ghiti wrote:
> > Hi Changbin,
> > 
> > On 6/24/25 13:30, Changbin Du wrote:
> > > Under FTRACE=y, DYNAMIC_FTRACE=n, and RISCV_ALTERNATIVE_EARLY=n, the kernel
> > 
> > 
> > Your above config works fine for me, I guess you meant FUNCTION_TRACER &&
> > !DYNAMIC_FTRACE (which fails).
> >
> Yes, it's FUNCTION_TRACER.
> 
> > We were just talking with Andy about this configuration (FUNCTION_TRACER &&
> > !DYNAMIC_FTRACE): do we really want to support static ftrace? Andy should
> > send a patch soon to remove this possibility as IMO we don't want to support
> > it. Let's wait for this patch and the discussion that will follow before
> > merging your fix. I'll keep it in my list for 6.16 just in case someone
> > comes up with a good argument to keep it.
> > 
> No problem. I'm unable to enable DYNAMIC_FTRACE because GCC_SUPPORTS_DYNAMIC_FTRACE=n
> and CC_HAS_MIN_FUNCTION_ALIGNMENT=n are set. It seems that my GCC version (13.3.0)
> does not support the option -fmin-function-alignment=8.
> 
> By the way, this change also eliminates an empty function call.

Working on cleaning out Patchwork.  Was there any further conclusion 
reached on this patch, or more broadly, static ftrace ?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
