Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F8CC5B555
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jun 2025 18:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acFl8Q5EloAhypf4D96xQ+n3fWfcS96NLRZ952OZKSc=; b=f6f+n21gzcUViu
	WhOItEwqBxzerRWmnYyOgD5wBZE/TafBg7Ptj6a8qoPWK8NKc4r2Q9Ny+nl5tmHT9sLUMp/TMCv3i
	X01/nYPHXImrV0eOuW/HckD/SHKGlm8k43QY5FqqJ7qIO3vL3IFteI0R/zBLrKDi0JYMbJw+joQkK
	fiizIrxcN+LEY/KSWRcg7y+8UVxWwaODMC0JtCwxyyiLaD2ATeH6BqfWYYZRgWxxMd+PO60FalsKT
	U713zu2+FxKRE807qujCHsFvoM3rAqLbU3rO1v6a+DSWJmuDVJNr5vPMKYKvDbmduAd2yTGnjvOOA
	UdepHy+L/WyHt6raG/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLnJU-00000005piB-0GqY;
	Sun, 01 Jun 2025 18:21:40 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLmac-00000005lay-0F19
	for linux-riscv@lists.infradead.org;
	Sun, 01 Jun 2025 17:35:19 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3404292009D; Sun,  1 Jun 2025 19:35:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2631792009B;
	Sun,  1 Jun 2025 18:35:13 +0100 (BST)
Date: Sun, 1 Jun 2025 18:35:13 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Laight <david.laight.linux@gmail.com>
cc: =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
In-Reply-To: <20250531192801.5d6329c3@pumpkin>
Message-ID: <alpine.DEB.2.21.2506011830130.28395@angie.orcam.me.uk>
References: <20250530205658.624195-1-cleger@rivosinc.com> <20250530205658.624195-3-cleger@rivosinc.com> <20250531192801.5d6329c3@pumpkin>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_103518_262801_7D6863CA 
X-CRM114-Status: GOOD (  16.21  )
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

On Sat, 31 May 2025, David Laight wrote:

> > Such behavior was detected with GET_UNALIGN_CTL() that was doing
> > a put_user() with an unsigned long* address that should have been an
> > unsigned int*. Reenabling kernel misaligned access emulation is a bit
> > risky and it would also degrade performances. Rather than doing that,
> > we will try to avoid any misaligned accessed by using copy_from/to_user()
> > which does not do any misaligned accesses. This can be done only for
> > !CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS and thus allows to only generate
> > a bit more code for this config.
> 
> For get_user() you are much better off reading the two words that contain
> the value and then doing 'shift' and 'or' to get the correct value.
> 
> Even for put_user() doing the explicit byte accesses will be faster than
> going though the generic copy_to/from_user() function.

 FWIW I think optimising copy_to/from_user for such cases would be a more 
robust approach moving forward than sprinkling open-coded implementations 
across code.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
