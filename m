Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3106EC67877
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 18:02:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 086A32087D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 18:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QVAYH33z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 086A32087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soZD+hcYYKs2ytpQtYXR1v8u97NJvtwowkM2g9feN5g=; b=QVAYH33zQlnXaH
	znyG1rTxSDR9Xzz8HwV9TNpyrxGJgzS3T/5MDlCWBsxGHHQqoKKPkFkZjkVQDy8QyHZuUVze7aSU4
	pfAx0SrWmVMCDNxywzp9D1cgGzDcWl75iDBNRuTa0d7drX3hr/R1HpxtkX+9gNWZv7AIXMwlmFSMS
	ehufdzh9xeoS3nH2IoH1wP1Mvj90AmWxJZbDxc9wI9catZvacHTluJA7+qfCFJEQhgW6RqObdOERH
	aBZa6FGVrS2h/WO8Enw8napUjiUXPXYPOdZJg92ne3DUDkByawkaK9E0FAROETDfnMJKkuzOeZxAg
	ZRxAJCYrLAyq9mx24HLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB1lr-0002KY-E8; Fri, 12 Oct 2018 18:02:43 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB1ln-0002H1-Lx; Fri, 12 Oct 2018 18:02:40 +0000
Received: from localhost (c-67-183-145-105.hsd1.wa.comcast.net
 [67.183.145.105]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 45BE6133E9F9A;
 Fri, 12 Oct 2018 11:02:21 -0700 (PDT)
Date: Fri, 12 Oct 2018 11:02:20 -0700 (PDT)
Message-Id: <20181012.110220.321284613911888246.davem@davemloft.net>
To: kirill@shutemov.name
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
From: David Miller <davem@davemloft.net>
In-Reply-To: <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
X-Mailer: Mew version 6.7 on Emacs 26 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 12 Oct 2018 11:02:23 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_110239_719079_ED323CF2 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, mhocko@kernel.org, linux-mm@kvack.org,
 lokeshgidra@google.com, joel@joelfernandes.org,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 jonas@southpole.se, linux-s390@vger.kernel.org, dancol@google.com,
 linux-xtensa@linux-xtensa.org, linux-hexagon@vger.kernel.org, deller@gmx.de,
 hughd@google.com, jejb@parisc-linux.org, kasan-dev@googlegroups.com,
 kvmarm@lists.cs.columbia.edu, mingo@redhat.com, geert@linux-m68k.org,
 aryabinin@virtuozzo.com, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, fenghua.yu@intel.com, jdike@addtoit.com,
 linux-um@lists.infradead.org, Julia.Lawall@lip6.fr,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, bp@alien8.de,
 luto@kernel.org, nios2-dev@lists.rocketboards.org, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, chris@zankel.net, richard@nod.at,
 linux-parisc@vger.kernel.org, pantin@google.com, jcmvbkbc@gmail.com,
 linux-kernel@vger.kernel.org, minchan@kernel.org, linux-alpha@vger.kernel.org,
 lftan@altera.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012180220.4ttpOBur8jUAZHfUARyzky5-mtQDpw5Dm2BrMCX7WxI@z>

From: "Kirill A. Shutemov" <kirill@shutemov.name>
Date: Fri, 12 Oct 2018 14:30:56 +0300

> I looked into the code more and noticed move_pte() helper called from
> move_ptes(). It changes PTE entry to suite new address.
> 
> It is only defined in non-trivial way on Sparc. I don't know much about
> Sparc and it's hard for me to say if the optimization will break anything
> there.
> 
> I think it worth to disable the optimization if __HAVE_ARCH_MOVE_PTE is
> defined. Or make architectures state explicitely that the optimization is
> safe.

What sparc is doing in move_pte() is flushing the data-cache
(synchronously) if the virtual address color of the mapping changes.

Hope this helps.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
