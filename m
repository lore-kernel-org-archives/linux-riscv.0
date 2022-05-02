Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D25AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 May 2022 11:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bgv0g7O5Uap+kIk9eU/KtGl/FQ/cvrqY0zMfaGm23wI=; b=Q2L5SutltL4oFr
	yUzjjVlXzLwQwq5xsEWMTHMmV/whoL6gcSCreE1kRSb+cMIhk0p2ZCIDvLOOlp8rPdSwUbDORMksl
	arnL05bu4bcYczqgX4tdZ18NAV5qiB7HYxPwswpG0znWl3TPz29Dp2+wws5A+COSCTe3i8CeJIfcr
	cmoFZuMGxxhUbuZ0SoS0Cn3JXB4Uz9seMTAzCChVxmSZcoUoOcu8xiH6b5r1QUxRZ/PUZ1Oo0Sf6e
	LtJzQtxTLNKmXgdH7e+oCA+Y1OOTmqbiQErqZbuewJKs5/FV0qCsSSPYCVX1gXMRWRehwwBMeANzb
	X+BGoX9gWRxxNMLpIDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlUVP-0010Tu-0q; Mon, 02 May 2022 11:46:19 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlUVK-0010Qw-Sm
 for linux-riscv@lists.infradead.org; Mon, 02 May 2022 11:46:16 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id A665B92009C; Mon,  2 May 2022 13:46:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id A19A992009B;
 Mon,  2 May 2022 12:46:11 +0100 (BST)
Date: Mon, 2 May 2022 12:46:11 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>
cc: Alexandre Ghiti <alex@ghiti.fr>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Rob Herring <robh@kernel.org>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Greentime Hu <greentime.hu@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>, 
 Neill Whillans <neill.whillans@codethink.co.uk>
Subject: Re: [V3] PCI: fu740: Drop to 2.5GT/s to fix initial device probing
 on some boards
In-Reply-To: <3acd20b2-5882-7cc0-8a7b-7b406b768c1c@codethink.co.uk>
Message-ID: <alpine.DEB.2.21.2205020049130.9383@angie.orcam.me.uk>
References: <20220318152430.526320-1-ben.dooks@codethink.co.uk>
 <2442936e-a53e-59bf-488f-95eac26d1252@ghiti.fr>
 <85e864fd-762e-0780-f829-bfbb178ab24e@ghiti.fr>
 <bded4b1e-3404-6bcd-3289-dc8d5b4d713a@codethink.co.uk>
 <alpine.DEB.2.21.2204140048460.9383@angie.orcam.me.uk>
 <3acd20b2-5882-7cc0-8a7b-7b406b768c1c@codethink.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_044615_145337_179B3C7E 
X-CRM114-Status: GOOD (  11.32  )
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

Hi Ben,

> >   Any idea what might be causing it?  I can't see it being explicitly set
> > or cleared anywhere, be it in U-Boot or Linux, so it must be done by the
> > device itself depending on something.  And the lack of this capability
> > seems to me like non-compliance for a multiple-lane, multiple-speed
> > device.
> 
> I'll see if we can reproduce this

 Have you been able to look into it?

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
