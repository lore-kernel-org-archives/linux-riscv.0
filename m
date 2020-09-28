Return-Path: <SRS0=7Vio=DF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC8BC4727F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2020 12:49:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F17821974
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2020 12:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ABF0i6zt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F17821974
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AKKd3rYXIinhBwEa9MjBZLXjiSBUwISyQAKwUdX5Qec=; b=ABF0i6ztrmVqKvyzzQ7tBEkxT
	cgt8mVXzzrTN1kYdi0eWIGPuINSz6s5TYKMCVZmaFDXBBtpDdoAA/BFouiJ+LyxoOgZ39L9c8P/sW
	BKJKx9DxPDZxaa54HpCxaBt7qwhc/RLOEzbStFdlzbIevw2cnKbxOqukfIPMNit9dVesbngvjx/4a
	An4eiQxerm4tEvo2wlBUbxLGQJaq2Xr9EDhbU/bgbAV9LfXmHRrIaoJbMGdJypFJNkLRcYc9FLxvm
	spNEf03UGzV3WGoXUFSaM9oJ/4G+XvFBaQoI8CSRk0YwxCjVbzpzRhHShB4/RWtVzT9emMYEUH+eJ
	N/qvIBruA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMsb1-0007Qv-55; Mon, 28 Sep 2020 12:49:35 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMsay-0007Q8-H8
 for linux-riscv@lists.infradead.org; Mon, 28 Sep 2020 12:49:33 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6CC5468B02; Mon, 28 Sep 2020 14:49:29 +0200 (CEST)
Date: Mon, 28 Sep 2020 14:49:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: remove set_fs for riscv v2
Message-ID: <20200928124928.GA5834@lst.de>
References: <20200922043752.GA29151@lst.de>
 <mhng-9b0b114e-a104-40b7-b4f5-ad64dbbbd5bd@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-9b0b114e-a104-40b7-b4f5-ad64dbbbd5bd@palmerdabbelt-glaptop1>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_084932_712633_75523D30 
X-CRM114-Status: GOOD (  20.48  )
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 26, 2020 at 10:50:52AM -0700, Palmer Dabbelt wrote:
> On Mon, 21 Sep 2020 21:37:52 PDT (-0700), Christoph Hellwig wrote:
>> Given tht we've not made much progress with the common branch,
>> are you fine just picking this up through the riscv tree for 5.10?
>>
>> I'll defer other architectures that depend on the common changes to
>> 5.11 then.
>
> I'm OK taking it, but there's a few things I'd like to sort out.  IIRC I put it
> on a temporary branch over here
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=riscv-remove_set_fs
>
> under the assumption it might get lost otherwise, but let me know if that's not
> what you were looking for.

Well, we'll want it in linux-next and then 5.10.  Either a merge through
the RISC-V maintainer, or as part of the base branch from Al would
make sense to me.

>
> Arnd: Are you OK with the asm-generic stuff?  I couldn't find anything in my
> mail history, so sorry if I just missed it.
>
> Al: IIRC the plan here was to have me merge in a feature branch with this
> stuff, but it'd have to be based on your for-next as there are some
> dependencies over there.  I see 5ae4998b5d6f ("powerpc: remove address space
> overrides using set_fs()") in vfs/for-next so I think we should be OK, but let
> me know if I'm doing something wrong.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
