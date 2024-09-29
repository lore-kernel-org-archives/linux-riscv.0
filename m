Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6944CF6498
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 15:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8BGK1AyqMG7IbszGkk6JUcDiYO98Q2aywpNQIYh1ao=; b=bI03HXze9XJZc+
	MnSXuKC74N8VemTZNYuXsuofFw2+LfF29B55KNFwUEj9q4/hiczCNiKMF2vaklrtXTue5WamD7FCm
	wpCNSdQIq5Wp4b0qDOdikfsz0/iuSyg9aLy1niwqNrP8nDWSkTKNYNYcDjPD1ur0pScpFD6SEtdRO
	QwTUewoy6Js+GZur83WtwhY31M0Nxzx7FMgSejdUeA524/z3NLQrjtLRUgk6o0Jbvwslj/dHEzbax
	Gzn/biV9q9P3Stu62hGhOGDVu54zZYGbTUfAWtx4aRI3/vc3De5chMtn6kGWTliZDc5EvZCQew8U+
	aVFLT2QZ0QVXKmZHeqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suwB5-0000000EytZ-0qgY;
	Sun, 29 Sep 2024 15:49:43 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suwB2-0000000Eyt8-1ggU
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 15:49:42 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0B06292009C; Sun, 29 Sep 2024 17:49:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0414892009B;
	Sun, 29 Sep 2024 16:49:34 +0100 (BST)
Date: Sun, 29 Sep 2024 16:49:34 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jeff Law <jeffreyalaw@gmail.com>
cc: Florian Weimer <fweimer@redhat.com>, linux-riscv@lists.infradead.org, 
    Palmer Dabbelt <palmer@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>
Subject: Re: Page sizes supported by RISC-V
In-Reply-To: <cbbc9925-12a5-4043-a6c5-ccd1ef0997c8@gmail.com>
Message-ID: <alpine.DEB.2.21.2409291631010.21893@angie.orcam.me.uk>
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com> <e55950a2-beb0-4f2a-81da-1c66724116d7@gmail.com> <8734lixzss.fsf@oldenburg.str.redhat.com> <cbbc9925-12a5-4043-a6c5-ccd1ef0997c8@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_084940_625657_3C2D3919 
X-CRM114-Status: GOOD (  10.03  )
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

On Sun, 29 Sep 2024, Jeff Law wrote:

> I strongly suspect the lack of specification here is mean to give degrees of
> freedom to the implementors, but sometimes those writing the specs don't
> really understand the implication of leaving things like this unspecified and
> how much pain it really causes in the end.

 But 64KiB pages have already been mentioned, so sanctioning this possible 
size in binutils (or LD specifically) would be a reasonable thing to do at 
this time IMHO.

 FWIW out of the plethora sizes (from 1KiB up to 256TiB) possible to have
in hardware (and available on a page-by-page basis) the MIPS/Linux port 
has settled on a fixed for a given kernel configuration page size choice 
among 4KiB, 16KiB, 64KiB, and this has been reflected in binutils, so 
perhaps copying the MIPS bits might be the path of least resistance.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
