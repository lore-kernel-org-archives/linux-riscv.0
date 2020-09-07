Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765E0C43461
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 06:04:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50A820796
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 06:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wYk2eP3d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D50A820796
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H3bA/kO4q76A6CiSZWO4MC3+6rJ/T+dM4ygE3Z18O/A=; b=wYk2eP3dDgcFmtGW1kE3z+NSt
	cDymOm8z+091YYAz/V4JdOLQyKdpw/iZPTK3LpUMvVcRSq30tTwG3S8jTg1nOTa2oVL/nAvkB5MkE
	2joDxMhwrN5e5xHwhzK6k3rg3U3cJee2XF+nuF+flSTJSR4WAftIMGD8WMYArDRHWzBu6Gc5MqXv0
	ouXAhSTBXz6cVBXA6ZhZ6EPCCuVhWIWYGm3xaasDV6qe+5Ey4lefOxsuKIlGVi5A1mRsHUkg4cFVS
	JgF58sBPntj+SvN23K+wP6TLTVX4odmtpukAiSyg/xruACe9XtwlTxAaAh3dPr+PBla+nqduY31iZ
	wKXTCaWMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFAG7-0004RB-7T; Mon, 07 Sep 2020 06:04:07 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAG3-0004QP-Dy
 for linux-riscv@lists.infradead.org; Mon, 07 Sep 2020 06:04:04 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 09E1468BFE; Mon,  7 Sep 2020 08:03:57 +0200 (CEST)
Date: Mon, 7 Sep 2020 08:03:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: remove set_fs for riscv
Message-ID: <20200907060356.GA18655@lst.de>
References: <20200904165216.1799796-1-hch@lst.de>
 <CAK8P3a3t8a0gD2HsoPsMi7whtNb7BdzPN6-oo6ABnqkbQJoBfA@mail.gmail.com>
 <20200905071735.GB13228@lst.de>
 <CAK8P3a3BN-Afy4Gj+mGjxiKODUBZwjh+XRbXqQKV-uEhyhOTfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3BN-Afy4Gj+mGjxiKODUBZwjh+XRbXqQKV-uEhyhOTfA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_020403_580024_D52F4F15 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>,
 Russell King <rmk@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 12:14:59AM +0200, Arnd Bergmann wrote:
> I've had a first pass at this now, see
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=arm-kill-set_fs
> 
> There are a couple of things in there that ended up uglier than I was
> hoping for, and it's completely untested beyond compilation. Is this
> roughly what you had in mind? I can do some testing then and post
> it to the Arm mailing list.

Looks sensible.  The OABI hacks a are a little ugly, but so would be
every other alternative.

Note that you don't need to add a TASK_SIZE_MAX definition to arm if you
base it on my series as that provides a default one.  I also think with
these changes arm/nommu should be able to use UACCESS_MEMCPY.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
