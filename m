Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC76C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xP1bbPlZdEMZDZkntz9hoDPkFf2MpYfeJuFMVnm0PI=; b=HCxovJ82cAIoe6
	MO4sJiUloDxjIzJJt4oTMF0SyWkXNxGXZ7Lr61/w3busTuE5JwKrz7H7r+FKiiS7bYzIXfHPqFK1q
	AFyhPQP70g0Aw1YDdBZiNP5m0Y6LN2MOAxxRPw24wcDXYz3M2RztLJIKvsdQqA3f8kY4ztO+xJ9xZ
	cW5WNaDuMIoOU4S67YJAKuK3P76Lo1LEQcdgem3X/w0h8RxYwDw8UE7A8VQLOH7GsdBT56HdG/g1y
	JRY+SDIBwlDlsc5dmWPrW/PfOQHt2RXZapRNKCMngzP69gvVjSEB2HcMy3a7zRkfwBCVN2udqVV0v
	No//z2TF0AaK9YeboERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mwn-003Bfd-6f; Fri, 24 Jun 2022 17:18:21 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mwj-003BbO-5O
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 17:18:19 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8E11392009C; Fri, 24 Jun 2022 19:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 86F1F92009B;
	Fri, 24 Jun 2022 18:18:11 +0100 (BST)
Date: Fri, 24 Jun 2022 18:18:11 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Palmer Dabbelt <palmer@dabbelt.com>
cc: Paul Walmsley <paul.walmsley@sifive.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PING^2][PATCH] RISC-V: PCI: Avoid handing out address 0 to
 devices
In-Reply-To: <mhng-a0733eea-8220-4bf6-b1da-9de3139dbae3@palmer-ri-x1c9>
Message-ID: <alpine.DEB.2.21.2206231750490.57474@angie.orcam.me.uk>
References: <mhng-a0733eea-8220-4bf6-b1da-9de3139dbae3@palmer-ri-x1c9>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_101817_417414_508C0224 
X-CRM114-Status: GOOD (  13.23  )
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

On Wed, 22 Jun 2022, Palmer Dabbelt wrote:

> > > Therefore avoid handing out address 0, by bumping the lowest address
> > > available to PCI via PCIBIOS_MIN_IO and PCIBIOS_MIN_MEM up by 4 and 16
> > > respectively, which is the minimum allocation size for I/O and memory
> > > BARs.
> > 
> >  Ping for:
> > <https://lore.kernel.org/lkml/alpine.DEB.2.21.2204271207590.9383@angie.orcam.me.uk/>
> 
> Sorry, I got this mixed up with the non-RISC-V patch.

 If you mean this:

<https://lore.kernel.org/lkml/alpine.DEB.2.21.2202260044180.25061@angie.orcam.me.uk/>

then we just don't have consensus to move forward.  If we ever do for a 
generic change, then we can revert the RISC-V platform solution, as it's 
merely an internal implementation detail and not a part of the ABI or 
something.

>  David poked me about
> it, this is on for-next.  It's passing my tests, but they're just QEMU so
> probably not all that exciting here.

 Thanks!  I don't know offhand what QEMU supports as far as the RISC-V 
architecture is concerned; I guess you can't just enable a PCI port-I/O 
serial port in the simulator and see if it works with Linux or not.

 Anyway it's just number shuffling, so the change should be reasonably 
safe.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
