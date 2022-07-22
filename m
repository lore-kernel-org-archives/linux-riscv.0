Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA27C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 22:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCs7b1br5dqVuaG34N99fJyapCWJAjeThTEj5BgXtTo=; b=fyGYYGvzUQHiG0
	++41iJBR1bQqrqOY6ihdSfSdfceJtEr2UaklzTFN6Kah4nupdMnrND5vs01DkZ+oXYzqDrjRnlfBf
	yqGHRzKiwI1tmojJPy29usGOxZBkW83axhPxySreaQkw6inGW75+k8zRS/AH1LfEAXzOOr/lcFd/b
	YUyudblcne2iKAPggGFkhy1fCAeVyE4bA4lehF5XMnvOxXQiDbimodI2jOXBkQw4xhfRgj7PwlsNf
	Wg7uP+apMyvriqjYrgj1WOuhQpRUsliSywrL8QvXHTaDt58+xi+rbbjzV9Z85yEBlRaBXQOIJ29xT
	qAwoWQ/yiFXTJQblgZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF1LX-00CDZT-K4; Fri, 22 Jul 2022 22:42:11 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF1LM-00CDR0-DJ; Fri, 22 Jul 2022 22:42:02 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5D6F792009C; Sat, 23 Jul 2022 00:41:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 598B392009B;
	Fri, 22 Jul 2022 23:41:54 +0100 (BST)
Date: Fri, 22 Jul 2022 23:41:54 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Rob Herring <robh@kernel.org>
cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Richard Weinberger <richard@nod.at>, 
    Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
    Johannes Berg <johannes@sipsolutions.net>, 
    linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
    linux-csky@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
    linux-um <linux-um@lists.infradead.org>, PCI <linux-pci@vger.kernel.org>, 
    "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] asm-generic: Add new pci.h and use it
In-Reply-To: <CAL_JsqKZoru2VZLeovPnQWe01ZMdw0krq0tcPx1O6YFUKa-L0g@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2207222328230.48997@angie.orcam.me.uk>
References: <CAL_Jsq+_5-fhXddhxG2mr-4HD_brcKZExkZqvME1yEpa6dOGGg@mail.gmail.com> <mhng-7e3146ca-79b8-4e16-98a9-e354fb6d03ba@palmer-mbp2014> <CAL_JsqJHZEcnJi+UHQbYWVoy1okQjHSc9T377P1q8oOJnHBWFw@mail.gmail.com> <CAK8P3a2aTS74TG8F+cVHX969hMQHKP3Ai5V0h-m+GeAq6kq5pQ@mail.gmail.com>
 <CAL_JsqKZoru2VZLeovPnQWe01ZMdw0krq0tcPx1O6YFUKa-L0g@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_154200_638766_143CFA54 
X-CRM114-Status: UNSURE (   7.35  )
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

On Fri, 22 Jul 2022, Rob Herring wrote:

> P.S. I really wish I/O space would disappear completely.

 Some systems make it happen already, such as the POWER9 platform and its 
PHB4 host bridge (which doesn't handle PCIe TLP I/O read or write commands 
at all), however some PCI/e devices do require I/O space, such as IEEE 
1284 parallel port adapters.  Some PCI devices dating back as far as to 
1990s provide dual mapping of their resources via an I/O and a memory BAR 
both at a time, so we can choose which to use depending on circumstances.

 FWIW,

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
