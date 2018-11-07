Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5899CC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:39:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B1032081D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:39:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jy5wirAm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2FCaHyQK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B1032081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZYuKpFaOtggdwhZnPDg2h9FhCttrYhY+A4Ok1ikAjM=; b=Jy5wirAmTDMVbg
	sswRQazWbjVvwLkCxZVtTK2g+9CmB9Xpm1oM/8K1O7oGjXhFBFhXSh7we2kAheyHntAeWKUsQoGDv
	CCLoiCyg8h6Fbl35g32/Vi0UX4fVZZKSPEzkvBYavbgayQYhUdSEL61n3CMu1YzP5Hq5Caf+ksiN3
	CzvZpPw2RKK4Xqn1iu6DqVeNJVmqNQMYXqjAdB/fdnlRcb1UOW4St9dEEKJdIY8Xg3g+ErCI2+GDp
	Y/PHvhe02Tq8F1JBUJL04KtnV94+Kr0/j+WJcv8tluJmaeD/BBapvk0F9aE1xne3YNfs0vQrF4n2n
	Q+aUND1u20T7eBbAOxCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKUbO-0000gi-Dr; Wed, 07 Nov 2018 20:39:02 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUbG-0000T5-EO; Wed, 07 Nov 2018 20:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qlrAfG6UU5+BO01/SRVYsOR41vDXtxMjqhuswXG1ciU=; b=2FCaHyQKkRc+XvR8THLhcZGrk1
 ydQgcBPvuJVRvdapmWzBNcvoK0UXi10y4W8CnipCX4bCyHNXiLzeruvyAcwQr3Ry0BolqPVItjGU8
 7lEozdLvcfInmRa1ojcrZyvD5616agG+4h0NyLCapF2jHGmWvjBrKvIeI01I7JzQ5QkZC7sY/Bkuk
 gNOiFppG/HkI5CEmBlGEEjPQvM4+ccieml5IiWm8yKsFTzRENfvStmQ4qAALFKsDjeEF98UWFOF7y
 zCWifDUERoOwHRw+gN/HGxvfAMjSOsJ4ZH9O+uBpQxZ/9hk2a+vG8KWJs2bsfRxRyGwpSVRMhpVsX
 tXBbXp+g==;
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUbD-0002d6-PG; Wed, 07 Nov 2018 20:38:52 +0000
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 1AB3186F;
 Wed,  7 Nov 2018 20:38:40 +0000 (UTC)
Date: Wed, 7 Nov 2018 12:38:38 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 2/2] mm/sparse: add common helper to mark all memblocks
 present
Message-Id: <20181107123838.1b7234c98a87dec5a2b25e67@linux-foundation.org>
In-Reply-To: <b1cc442e-7314-4a8e-3eec-9adc200d7582@deltatee.com>
References: <20181107173859.24096-1-logang@deltatee.com>
 <20181107173859.24096-3-logang@deltatee.com>
 <20181107121207.62cb37cf58484b7cc80a8fd8@linux-foundation.org>
 <724be9bb-59b6-33f3-7b59-3ca644d59bf7@deltatee.com>
 <alpine.DEB.2.21.1811072125280.1666@nanos.tec.linutronix.de>
 <b1cc442e-7314-4a8e-3eec-9adc200d7582@deltatee.com>
X-Mailer: Sylpheed 3.6.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_153851_935406_8D64BE4A 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: linux-arch@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Stephen Bates <sbates@raithlin.com>, linux-mm@kvack.org,
 Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>,
 Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107203838.k3Wxhjb8kbXyZshdgpWdyIxE6lqlA3dWdNufijfL09s@z>

On Wed, 7 Nov 2018 13:36:34 -0700 Logan Gunthorpe <logang@deltatee.com> wrote:

> > Actually if both names suck, then there also is the option to rename both
> > instead of adding a comment to explain the suckage.
> 
> Ok, well, I wasn't expecting to take on a big rename like that as it
> would create a patch touching a bunch of arches and mm files... But if
> we can come to some agreement on a better name and someone is willing to
> take that patch without significant delay then I'd be happy to create
> the patch and add it to the start of my series.

Some other time ;)  Let's just get the missing documentation added for now?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
