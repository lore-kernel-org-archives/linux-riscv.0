Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEAFC02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GokmLEYrdfNhPI1ydakrvVzg64AaBb7D5aYd0QLqkrQ=; b=z9Lk+U4R7kqo0Z
	GwU/6eK5PcyzUYhfZ2+0aO/2GmevfAwWI0dFuLu9y8W/z7exj+pmJWjFyo7XiUDhCu7qmKSLu/69a
	1AIVxP/j+SZA29+0qysNrqpz5mpobA1XKKQIeCyxaspwbDTcsiipH+6wHiEkMw/UiSuL+LzJZBGNl
	IkemmNuwQt2NzGZkMnV9u+DTwiEqLQMK4PlrEGYhvdhFTeDi4GMSqEQ44DcEp9+OjP4EOfmg9ECUr
	Cau4U2xQ4XuC3rz3H/BaHIGOk5VeEAZExpr/gXL3O42d0OSGk37LtCdQ/F89ZzDoarLyE9btDfSwC
	fxwrJobIquMk25QwvFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewxG-0000000FaZB-2p5L;
	Mon, 03 Feb 2025 13:57:38 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewxE-0000000FaY4-1GCH
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 13:57:37 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id BA45492009C; Mon,  3 Feb 2025 14:57:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B7E6F92009B;
	Mon,  3 Feb 2025 13:57:30 +0000 (GMT)
Date: Mon, 3 Feb 2025 13:57:30 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jessica Clarke <jrtc27@jrtc27.com>
cc: Andreas Schwab <schwab@suse.de>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
In-Reply-To: <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
Message-ID: <alpine.DEB.2.21.2502030510390.41663@angie.orcam.me.uk>
References: <mvmed0k4prh.fsf@suse.de> <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> <mvm5xlw4anb.fsf@suse.de> <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr> <mvmwmec2t7u.fsf@suse.de> <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_055736_497409_15C41C3D 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

On Thu, 30 Jan 2025, Jessica Clarke wrote:

> >> a2 is used as it is passed by the calling function, so we can't be sure a2
> >> is sign extended to me, what am I missing?
> > 
> > 32-bit scalar arguments are guaranteed to be sign extended on entry.
> 
> Firstly, the calling convention is irrelevant if the function is
> inlined, which this almost always will be.

 Umm, that would be a compiler bug then, as inlining is supposed not to 
change language semantics.  IOW the compiler is expected to explicitly 
sign-extend the arguments of an inlined function at their evaluation point 
just as it would at an actual function call unless the compiler is able to 
prove they have come out sign-extended already from previous operations.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
