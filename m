Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C30EC433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 06:06:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E71F2065D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 06:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pYwTojpc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E71F2065D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i2Ncq5NlX9IvvHgkFGNvIa6qPH6kCedcJKc4IjwdZkU=; b=pYwTojpcwtVuq1bPK1ASWpMCL
	gmINwHwHtaVSdOsNEFlnuCO7fUMCZoih/ypMuMnmMvCtX125C+vxgIPDBvypHbgbu/1Yadsk7g6ml
	rh0eZhDxXW7+LC92r3+tsQlvswJDVDa9MXSLZWAhKUs0X0m8wufuU9DkF4Z19MZPZe3JXT06Vnw0m
	D6wpuUgZu6aaYHKHYCnIx39CRBgLZ1mvYhr36cmDex6Hm2/QuG+iNz1MurhMm36kmG8yrEhmov/6j
	WEGP0ZHzLpuzWMdB1dvGJfVMiFjMutWZ+aQ2TPkWaarZ45wY+k2FepmWRmUsff0HdYUv55+WwhRQH
	lcvMs+UWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvaYl-0008Eu-Fi; Wed, 15 Jul 2020 06:06:27 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvaYh-0008EK-Gn
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 06:06:24 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 518DE67357; Wed, 15 Jul 2020 08:06:20 +0200 (CEST)
Date: Wed, 15 Jul 2020 08:06:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH 6/6] exec: use force_uaccess_begin during exec and exit
Message-ID: <20200715060620.GA21385@lst.de>
References: <20200714105505.935079-1-hch@lst.de>
 <20200714105505.935079-7-hch@lst.de> <87v9ip4fm6.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v9ip4fm6.fsf@x220.int.ebiederm.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_020623_678826_AE08F9F8 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: linux-arch@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 10:33:05PM -0500, Eric W. Biederman wrote:
> Christoph Hellwig <hch@lst.de> writes:
> 
> > Both exec and exit want to ensure that the uaccess routines actually do
> > access user pointers.  Use the newly added force_uaccess_begin helper
> > instead of an open coded set_fs for that to prepare for kernel builds
> > where set_fs() does not exist.
> 
> Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>
> 
> Have you played with a tree with all of your patches
> and placing force_uaccess_begin in init/main.c:start_kernel?

No, I have converted the early boot code to not require KERNEL_DS
and except for a pending network item remove set_fs entirely.  Older
series here, will need some rework:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/set_fs-removal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
