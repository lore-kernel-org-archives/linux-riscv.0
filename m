Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFD2C43461
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 06:55:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB7D620758
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 06:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNXk99in"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB7D620758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MiXdRO4Mlx45N+6mtejWCNF6rGK4Zlf94EPe7qGWN7c=; b=KNXk99inslEqhTPbVl3oI5lvG
	PcvXhc5jWoHCciR/iNpvn9llvMQ9EcudaMG0KqmSgh0VroPl0MCVtZlPtTBCLnnEezc0G5rTchxhk
	Y2+hyXfQ+h0Zhu/B+u6BX5qJX4vG3uZJjUTDjGCFK/GsYIy6mN8xaAYNb3+5Hf8SE/KfQDHul6o+5
	dQy1X7oAyTjmiQjYra7CWMivj3JmLkPrTszsubogOZVW5r0fZwQf7zZRaeT0Jz6E9hqi2t6hfBCob
	W3SLnijXtR1rM6HDLzA+Vwhk9ZnpTzUQ/YZ7FWULBKGx5VJXPBkY7x+lc7KecLC9j6pK7XNlvBmqf
	kVs4frWEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFu0p-0007XH-PM; Wed, 09 Sep 2020 06:55:23 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFu0n-0007WR-28
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 06:55:21 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B53AA6736F; Wed,  9 Sep 2020 08:55:15 +0200 (CEST)
Date: Wed, 9 Sep 2020 08:55:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, viro@zeniv.linux.org.uk,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: remove set_fs for riscv v2
Message-ID: <20200909065515.GA9618@lst.de>
References: <20200907055825.1917151-1-hch@lst.de>
 <mhng-5fa86587-c404-420e-a4c0-43d197d1cd27@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-5fa86587-c404-420e-a4c0-43d197d1cd27@palmerdabbelt-glaptop1>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_025521_254653_9C84C9D5 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 08, 2020 at 09:59:29PM -0700, Palmer Dabbelt wrote:
>>
>> The first four patches are general improvements and enablement for all nommu
>> ports, and might make sense to merge through the above base branch.
>
> Seems like it to me.  These won't work without the SET_FS code so I'm OK if you
> guys want to keep them all together.  Otherwise I think I'd need to wait until
> the SET_FS stuff gets merged before taking any of these, which would be a bit
> of a headache.

now that we've sorted out a remaining issue base.set_fs should not
be rebased any more, so you could pull it into the riscv tree or a topic
branch.

The first four patch should go into base.set_fs, though.  Arnd, can you
re-review the updated patches?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
