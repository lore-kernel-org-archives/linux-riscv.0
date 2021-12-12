Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B70CC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 11:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSPE915eI7c2wPtQPVur9PGE5IIz5y70uSkG6ot8X+U=; b=TtUen6/Lfmjp5y
	kZ0mh59vnI2bbQCH68xphAHE988v4kfKLVlEfUFXXH6ZQTn7dajtH3xW/ThrNuJDE5impjavzF2FV
	hfu6MzBfyajXP8o1kmW0kYKyg45psdRjF2/vlM8mvSTsV0nt0tUIxYENLLgBbe5Er08VaUlyWvyng
	try0VVHb91LW68vmPRln5KGqoMWEXMoAqD+NSNBgsxrM2AvXBpm4Zv9I2Z7oBPYuDUGaW4EDSKWF+
	0RJv9j4RLbHwoZu5e1q8vb+1FTzTlrs2esXP2yPnfGKMLGyQcwe/d45E32p1W80jv+csLAl6aT978
	6N8mhPFuhQED8Y5kfSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwNKZ-006OZc-Ed; Sun, 12 Dec 2021 11:47:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwNKN-006OWH-KW; Sun, 12 Dec 2021 11:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cdIWjpexE795gzuTbGkhPUpnRr/U2TeKiWDOHNiXINU=; b=DBuAHgfzGOIMRSDJohGgbB9HgK
 ghrV2KCPdFwOYiKPJbGZmSBlu830exEyDU1H933xIMmToosr9grTCGE55WJZij6cZJgiJ1q30Hz6n
 hZ10t4g0j/sD0EiJhnKSD6jRzu1/6oOpBcVGGwdhdZP63WKKmTkX5QTrHpV8qjjFHIi/X5QMWkaoG
 kknEssmq/uipXQiDMvDkVUnKo+GmhJFGjhExQwE0EWBz9jMfQIQFxVuyBDOWKu8J+hXb6Owf3uTdh
 8Fl4Is3Mc1bjDe5u/B8VTKoy9i1C2ETLTUE3K71/BU8t21Bssus2/nA1qsleo4QX3UFxfJvaTfFhq
 xMZgWXeA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mwNKJ-00Bt8s-Ff; Sun, 12 Dec 2021 11:47:35 +0000
Date: Sun, 12 Dec 2021 11:47:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <David.Laight@aculab.com>
Cc: 'Tiezhu Yang' <yangtiezhu@loongson.cn>, Dave Young <dyoung@redhat.com>,
 Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2 0/2] kdump: simplify code
Message-ID: <YbXhVxRJfjvKw++W@casper.infradead.org>
References: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
 <0c5cb37139af4f3e85cc2c5115d7d006@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c5cb37139af4f3e85cc2c5115d7d006@AcuMS.aculab.com>
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

On Sat, Dec 11, 2021 at 05:53:46PM +0000, David Laight wrote:
> From: Tiezhu Yang
> > Sent: 11 December 2021 03:33
> > 
> > v2:
> >   -- add copy_to_user_or_kernel() in lib/usercopy.c
> >   -- define userbuf as bool type
> 
> Instead of having a flag to indicate whether the buffer is user or kernel,
> would it be better to have two separate buffer pointers.
> One for a user space buffer, the other for a kernel space buffer.
> Exactly one of the buffers should always be NULL.

No.  You should be using an iov_iter instead.  See
https://lore.kernel.org/all/Ya4bdB0UBJCZhUSo@casper.infradead.org/
for a start on this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
