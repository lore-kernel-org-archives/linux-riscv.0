Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD080C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 00:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfyqydiSlbqCnItyi3DMDhEFys/vdXpiwq3sPqjJhnI=; b=ACgXLfaBLG9/wr
	dVCqL9etMGvh14FflcEBtyJhKikWjL3/2ZsDV82xp0r6ZALtN26WnGAr1E604uwuGZM0zpfMGfXAl
	MNUiWXGXD1LNKzzUtkOo5vmjHbShkC1PCakYyAyYUybm0/6adZmLvbBr3BIOHM52aXE/AkpDzQhW3
	ndl5k2SISG+PUPjyYFA+BqnRQASIIvklHvKCqRvV7Eg4tv9iIihslrwFtRPNUpMrtD7R7rllsI23H
	oUAV6mgEgVzXvqKeDDwc79CCqvyu175nNKHauSMGaFa4CHinSpDyh7YPTHEeEgC0//n6vcq4ldPHA
	wNGXdF+H4Ygm8PRjq0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nen4P-0038vL-AY; Thu, 14 Apr 2022 00:10:45 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nen4M-0038tL-6Y
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 00:10:43 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id AD3BA92009C; Thu, 14 Apr 2022 02:10:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 9E7F592009B;
 Thu, 14 Apr 2022 01:10:33 +0100 (BST)
Date: Thu, 14 Apr 2022 01:10:33 +0100 (BST)
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
In-Reply-To: <bded4b1e-3404-6bcd-3289-dc8d5b4d713a@codethink.co.uk>
Message-ID: <alpine.DEB.2.21.2204140048460.9383@angie.orcam.me.uk>
References: <20220318152430.526320-1-ben.dooks@codethink.co.uk>
 <2442936e-a53e-59bf-488f-95eac26d1252@ghiti.fr>
 <85e864fd-762e-0780-f829-bfbb178ab24e@ghiti.fr>
 <bded4b1e-3404-6bcd-3289-dc8d5b4d713a@codethink.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_171042_415257_546ABF9C 
X-CRM114-Status: GOOD (  11.76  )
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

On Wed, 23 Mar 2022, Ben Dooks wrote:

> > FWIW, I have tested this and it solved my issue with nvme not being probed,
> > so:
> > 
> > Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> 
> Ok, great. Our test rig seems to be still working with this.

 I ran simple verification of your change by interrupting U-Boot after a 
power-up and issuing:

=> setenv boot_pci_enum true

at the command prompt before booting from the uSD card and curiously 
enough the root port comes up with the Link Capabilities Register 
reporting the lack of Link Bandwidth Notification Capability in this 
scenario, while it reports its presence if booted undisturbed, i.e.:

		LnkCap: Port #0, Speed 8GT/s, Width x8, ASPM L0s L1, Exit Latency L0s <4us, L1 <4us
			ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp+

vs:

		LnkCap: Port #0, Speed 8GT/s, Width x8, ASPM L0s L1, Exit Latency L0s <4us, L1 <4us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+

It is fully reproducible.

 Any idea what might be causing it?  I can't see it being explicitly set 
or cleared anywhere, be it in U-Boot or Linux, so it must be done by the 
device itself depending on something.  And the lack of this capability 
seems to me like non-compliance for a multiple-lane, multiple-speed 
device.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
