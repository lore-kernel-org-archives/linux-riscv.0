Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A100FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIRselBXp6TSGW2pMl8aGABgM/S/n9QTyR3sMMfR6ZE=; b=O3Y/6nIKIi7NPe
	4UF2qGs9mpKWVp46TKJ2XEXlSsbam00PNZiKnSFa8w6Ws24GLc7H3be24DkA48kvc6X+FSfkuZGwB
	/8aS4Tvu6JYbf6WNIUnKtQ1qIMVzwZSiyUAovRygm1/eDtbZeAIsKjGon24ZsUuZ8zuh4OFHe+SAG
	tUL3rFyKDuaMqGdvbOW9ltDKxRkMTL6wTKYjRyIJr3dJuP/N+kkiX62OvGuIvIccPgcqpLbWsLyzh
	WTyVQSLbKF0hNigXwG3PXFFYtfbBJC05PBl4iyqhMyDWEvwE3qf2tcvnzeZq5mnD7lUiRRWlU9YG7
	65P1SFVeJ50ONU0ITeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okk0r-005ath-Vl; Tue, 18 Oct 2022 10:39:58 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okk0V-005aLy-6n; Tue, 18 Oct 2022 10:39:37 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2958692009C; Tue, 18 Oct 2022 12:39:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 231E192009B;
	Tue, 18 Oct 2022 11:39:20 +0100 (BST)
Date: Tue, 18 Oct 2022 11:39:20 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: linux-kernel@vger.kernel.org, 
    D Scott Phillips <scott@os.amperecomputing.com>, 
    Andrew Jones <ajones@ventanamicro.com>, 
    linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
    dri-devel@lists.freedesktop.org, linux-um@lists.infradead.org, 
    linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org, 
    kvm-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
    linux-mips@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.1-rc1
In-Reply-To: <alpine.DEB.2.22.394.2210171653540.9136@ramsan.of.borg>
Message-ID: <alpine.DEB.2.21.2210181126040.50489@angie.orcam.me.uk>
References: <20221017145157.1866351-1-geert@linux-m68k.org> <alpine.DEB.2.22.394.2210171653540.9136@ramsan.of.borg>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_033935_504941_7169B5F1 
X-CRM114-Status: UNSURE (   5.75  )
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

On Mon, 17 Oct 2022, Geert Uytterhoeven wrote:

> >  + {standard input}: Error: branch to a symbol in another ISA mode: 1339 =>
> > 2616, 2621
> 
> mips-gcc11/micro32r2_defconfig
> mips-gcc11/micro32r2el_defconfig

 Where can these configs be obtained from?

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
