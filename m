Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633EDC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 07:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrygJpyiJdv4eCFhLnHVjQvTuYMkjRL7Ui3kawH3YS4=; b=OM0/pkGx6vlI9p
	wWcaBGlCmrkOcV8U8UQP7iftDT8iQBSSbWPDsBbjeuGhZSLk4wpCX4p6fTdjXYWL5cm2GOgMom0CP
	+fC/o5EEtPkvy63DIp/gehLuQOnj3lIqN0xX5Qj0Hht2a1S8Kca7uTGSJAhxk2rsPMHjdW0dG2YTy
	pxojghh3hId5zgF5YaoiLVpXU4yPO8wR8vZcxLCNySNGpUGcfA5aFRzZ7bPPJfaBrCwpUxYQFaVVj
	+hJtsY2F4C5b+iGtSajRieqm4QJXrzefruGOsPuUQ914JFHlQDNLuEldJHEZOpaMor09vbhYZzc8r
	Nvk/OEuLWPNVmOLVOEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncMwb-00A8Lr-6b; Thu, 07 Apr 2022 07:52:41 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1ncMwY-00A8KX-C6; Thu, 07 Apr 2022 07:52:38 +0000
Date: Thu, 7 Apr 2022 00:52:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Landley <rob@landley.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Rich Felker <dalias@libc.org>
Subject: Re: [RFC PULL] remove arch/h8300
Message-ID: <Yk6YRuFYw7ncoIHI@infradead.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
 <c3e7ee64-68fc-ed53-4a90-9f9296583d7c@landley.net>
 <CAK8P3a14b6djqPw8Dea5uW2PPEABbe0pNXV5EX0529oDrW1ZAg@mail.gmail.com>
 <04c0374f-0044-c84d-1820-d743a4061906@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04c0374f-0044-c84d-1820-d743a4061906@physik.fu-berlin.de>
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

On Thu, Apr 07, 2022 at 09:47:04AM +0200, John Paul Adrian Glaubitz wrote:
> But if it's not a lot of code, would it really accumulate a lot of cruft?
> 
> If the code just works as is and doesn't need much attention to keep it working

Because no one gives it even that little bit of attention.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
