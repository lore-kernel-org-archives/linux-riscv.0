Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A003C004C0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vXtpCPJ/uA6K+4TCIlEcvwmmSFMRYF1+uLYEUwewNI=; b=s/8qgXV9Asv+Uv
	1Ce9w5RdX6l+o08erjcIxsAiDJHneflgPNZhcO22a59p5hEEQ8T2fRegrx/gnwppxaGLWwgYfUk+Z
	fvcg+cQ2QFtifos/usw3I3HqftpYJwRHvLq72P72jSoNdlG1VYEKQCWrg+7KSFZmfbI6oa8xXusjE
	O6Cp4TO1B5KcbdteNMuhkYSoCoUveDM7d7cA/E2rXNiJcSujyTzQnM0+Cws0zkJTi9kNoUH/oL+ye
	yGcZv+VZDid0zyiondrX0LFm6+at7sGmR9jIwBrQqLUcYcTEcV/a9RUHZLf2Z71VFBbwSjyvwmoIr
	jzRvhlFeuuhA7NGEI4dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyAT-007rwq-2W;
	Mon, 23 Oct 2023 16:52:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyAO-007rvx-2R
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 16:52:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A7A15CE26BE;
	Mon, 23 Oct 2023 16:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5199C433C9;
	Mon, 23 Oct 2023 16:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698079953;
	bh=nCtnA++YH4GS3eG6W2wL2J30XXMWQEHO20vUYEFJw1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JNJRQ99IjKvayYTywMrhrwcvTxawuFRCQPVt8FxvXRfpypDLUJoCIvwcy7nCJOyxt
	 0tTrh9YBE4II+a8SjnIjo6c3EU4t4IoebfYWcg88gJAytZb+RXpZpTAPjrt8u8oihD
	 Qr4ajVFRo6jqcvyloTtNgGa6itseIG9AdFTG+DqK/G4H76sTAckI6nSZeEuAQkQzZk
	 HPSmChtWH7n+fjTPEQjDY97JfSjcswZJVfdPwxStcdMDD9Z7seGHWwECmRWJUz62g6
	 VQX1MoVxkR/NF7LqnG3unpfpSS6vWPO7ZY3Pm2ZpQf0RNQhxoIBVK3k4zWpyKg7mHk
	 IjLzOLdTImEng==
Date: Tue, 24 Oct 2023 00:40:20 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Schaffner, Tobias" <tobias.schaffner@siemens.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"minda.chen@starfivetech.com" <minda.chen@starfivetech.com>
Subject: Re: [PATCH RT 0/3] riscv: add PREEMPT_RT support
Message-ID: <ZTah9NOMbZkf6dfL@xhacker>
References: <20230510162406.1955-1-jszhang@kernel.org>
 <a37fc706-78cd-4721-9af3-aabb610f49b1@siemens.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a37fc706-78cd-4721-9af3-aabb610f49b1@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_095236_994459_709E62CF 
X-CRM114-Status: GOOD (  21.45  )
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

On Mon, Oct 23, 2023 at 04:33:13PM +0000, Schaffner, Tobias wrote:
> On 10.05.23 18:24, Jisheng Zhang wrote:
> > This series is to add PREEMPT_RT support to riscv. Compared with last
> > try[1], there are two major changes:
> > 
> > 1. riscv has been converted to Generic Entry. And riscv uses
> > asm-generic/preeempt.h, so we need to patch asm-generic's preeempt to
> > enable lazy preempt support for riscv. This is what patch1 does.
> > However, it duplicates the preempt_lazy_count() defintion, I'm sure
> > there must be an elegant solution. Neverless, it doesn't impact the
> > riscv PREEMPT_RT support itself.
> > 
> > 2. three preparation patches(patch1/2/3 in [1]) has been merged in
> > mainline.
> > 
> > I back-ported the lastest linux-6.3.y-rt patches to the lastest Linus tree,
> > then cook this series.
> > 
> > Link: https://lore.kernel.org/linux-riscv/20220831175920.2806-1-jszhang@kernel.org/
> 
> Any news on this series? Are there any open tasks blocking this?
> I am willing to help, but do not see what's missing to get this merged.

Hi Thomas, Sebastian

could you please review? Any comments are appreciated. or do you want a
rebase on linux-6.5.y-rt?

Thanks

> 
> > Jisheng Zhang (3):
> >    asm-generic/preempt: also check preempt_lazy_count for
> >      should_resched() etc.
> >    riscv: add lazy preempt support
> >    riscv: Allow to enable RT
> > 
> >   arch/riscv/Kconfig                   | 2 ++
> >   arch/riscv/include/asm/thread_info.h | 5 ++++-
> >   arch/riscv/kernel/asm-offsets.c      | 1 +
> >   include/asm-generic/preempt.h        | 8 +++++++-
> >   4 files changed, 14 insertions(+), 2 deletions(-)
> > 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
