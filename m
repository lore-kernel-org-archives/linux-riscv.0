Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF28C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGZjJ/S4zl7pYaSkLvFEyaK3vHlhX6N672s6JJhLDMg=; b=N7LugBeXFWySsq
	qBaR1mdoc7AWUgVpbNde60GiI6BY0Og5s0LP3dBIM9nOC0O0JLmA0DfbdD6muwTS6KBbN8ie9UyzQ
	OQm2YKqyarR/3sAhYjP/wdAM8L2sF6jzDWshqEWqT8eBwgsG6r33dBSJSGh+zSfr5zwWG42b6GmJd
	WCmKcCUY2tp4lRkhELBLUM67HXLH2ndzKudIcwacm7e/M+4/hOfMvEkYiUDu/4dhr5/vajKhzFsPO
	hiw+ErFd40q1gdLAS45YAMwwJwjnzA3kmRGD07gEctdDJAvGlV+8A+bx8Mz46As+/9c95KMF9ggQC
	k09r6VJ1Jr6/036rJIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP9M0-000VWS-9m; Tue, 01 Mar 2022 20:44:16 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP9Lo-000VSm-Nu; Tue, 01 Mar 2022 20:44:06 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 8EF2392009D; Tue,  1 Mar 2022 21:43:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 88C9F92009B;
 Tue,  1 Mar 2022 20:43:58 +0000 (GMT)
Date: Tue, 1 Mar 2022 20:43:58 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, 
 linux-kernel@vger.kernel.org
Subject: [PING][PATCH v2] parport_pc: Also enable driver for PCI systems
In-Reply-To: <alpine.DEB.2.21.2202141955550.34636@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2203011751030.11354@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202141955550.34636@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_124404_954538_1C301B11 
X-CRM114-Status: UNSURE (   8.58  )
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

On Mon, 14 Feb 2022, Maciej W. Rozycki wrote:

> Nowadays PC-style parallel ports come in the form of PCI and PCIe option 
> cards and there are some combined parallel/serial option cards as well 
> that we handle in the parport subsystem.  There is nothing in particular 
> that would prevent them from being used in any system equipped with PCI 
> or PCIe connectivity, except that we do not permit the PARPORT_PC config 
> option to be selected for platforms for which ARCH_MIGHT_HAVE_PC_PARPORT 
> has not been set for.

 Ping for:

<https://lore.kernel.org/lkml/alpine.DEB.2.21.2202141955550.34636@angie.orcam.me.uk/>

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
