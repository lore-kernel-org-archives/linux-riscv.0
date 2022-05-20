Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8781C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 11:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ti433J9efmoKCtRjOvZ937APsJBFGHhLGlev6OWYSgQ=; b=Lyt9OrX+hRssvM
	YZ+cMuiDn+GDgn9F9ts8Cg2+ly+TeyO74B9MddTIXa7GK2Q9QIq7U39hIJ/O8hef7lF1GN/RgZpmk
	FaI9xvbPUvmM3ehjwRV0W5Xo6MVhoNp+L73mMqI7XxouYDHlmk5gY8rMGoJmCqX0zSF6V4hgyDXqy
	YWEla8+cR+2E5PpTtiUxhG0iFgHErVBObwRMLcUoSt9u/ibCOMwbFwn/dfWKdIXa50ex0kgUu1Rd3
	7vBxiB39voXNTjn6IIioJ7XNQCBaseENUX3YnCz/yI1pGc7MTEwlt4ejLffNUtLFAW4saXtbArn6u
	6ip/pCw4B+pi3sYva5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0Ug-00C0EB-Fu; Fri, 20 May 2022 11:08:30 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns0Ud-00C0Bk-RK
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 11:08:29 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id B5EB292009D; Fri, 20 May 2022 13:08:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id B279192009B;
 Fri, 20 May 2022 12:08:20 +0100 (BST)
Date: Fri, 20 May 2022 12:08:20 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
cc: Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PING][PATCH] RISC-V: PCI: Avoid handing out address 0 to devices
In-Reply-To: <alpine.DEB.2.21.2204271207590.9383@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2205200429300.52080@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2204271207590.9383@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_040828_110611_4CDDFF86 
X-CRM114-Status: UNSURE (   5.36  )
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

On Wed, 27 Apr 2022, Maciej W. Rozycki wrote:

> Therefore avoid handing out address 0, by bumping the lowest address 
> available to PCI via PCIBIOS_MIN_IO and PCIBIOS_MIN_MEM up by 4 and 16 
> respectively, which is the minimum allocation size for I/O and memory 
> BARs.

 Ping for:
<https://lore.kernel.org/lkml/alpine.DEB.2.21.2204271207590.9383@angie.orcam.me.uk/>

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
