Return-Path: <SRS0=eLsP=VJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F711C742D2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2019 17:34:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F4C520665
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2019 17:34:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uAD23Unk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F4C520665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZQon9jOm8lLo0ZuIcCPBgxMGj1U8xRwbbe7Wjf6mXo=; b=uAD23UnkWAXnRl
	boqpMZVfFGZmrxW5vo2jpHHxdWOndFzzH4vQdwHfSUn8eZbiqjsfbh3NfcLBnDuQEqO1pKca8kDs5
	hYCPVTThvskw4+x5KdaravbO5VH6NymFR5T399xG7JMfjH3fJL0uoZOSE0ryrtWNM+m+bgKINryE3
	rSoAz9BXGnpetdo+MKbyA9TEzm24wkNptiqe1EAVY271Vg3EL9z4nxaF0G9mviB8iPH9/U3RBs0rp
	crOB1Vy7PeMMg/xF8UI5ZsOZbNP1c1ugC1echGEmjuMYahYPdwnzUygx9QrcDnwSH4daxZqy7zJhd
	oYQplwlS4d+zJr21YyZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hlzRZ-0000up-Vx; Fri, 12 Jul 2019 17:34:50 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlzRO-0000lf-Gm; Fri, 12 Jul 2019 17:34:39 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B29512CC;
 Fri, 12 Jul 2019 17:34:28 +0000 (UTC)
Date: Fri, 12 Jul 2019 11:34:27 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Alex Shi <alex.shi@linux.alibaba.com>
Subject: Re: [PATCH 01/12] Documentation: move architectures together
Message-ID: <20190712113427.62fa7ffc@lwn.net>
In-Reply-To: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190712_103438_560705_5D592733 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 12 Jul 2019 10:20:07 +0800
Alex Shi <alex.shi@linux.alibaba.com> wrote:

> There are many different archs in Documentation/ dir, it's better to
> move them together in 'Documentation/arch' which follows from kernel source.

So this seems certain to collide badly with Mauro's RST-conversion monster
patch set.

More to the point, though...if we are going to thrash up things this
badly, we want to be sure that we're doing it right so we don't end up
renaming everything again.  Grouping stuff into a new arch/ subdirectory
adds a bit of order, but it doesn't do much toward trying to organize our
documentation for its readers, and it doesn't help us to modernize the
docs and get rid of the old, useless stuff.  A quick check shows that many
of these files have seen no changes other than typo fixes since the
beginning of the Git era.

So, in my mind, this needs some thought.  Maybe we want a
Documentation/arch in the end, but I'm not convinced that we should just
create it and fill it with a snow shovel.  This might be a good thing to
discuss at the kernel summit in September.

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
