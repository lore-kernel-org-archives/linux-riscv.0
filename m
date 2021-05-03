Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA89C433B4
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 00:53:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 264B161284
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 00:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 264B161284
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hr4nFzbu5W6IT43VNeiflEaDTxFJNRvIfiL1oceyuMk=; b=mYa9VAnoCVGJ+U9uRM0+aN/Wa
	PCoJtMhNXAPNzlPwCqXiYykQ8RDfsZVHCh2qem7DH3rbJHbURx6BXZFIwzvSFPQ0XzQBQbw24/ecw
	tJaS+iMTfcD92SJBCW/vyu2WA4Pe8kCeuqBJD66yjszHmZ2M9DFhxWT5GTs2EM9rVF7T+fLmYGIwA
	GjroTp3kCU/8Idp2jfpwG72oAibRl+s7h0O4eh0/KvDoJ23PuTSc2oPYay8ixDDv6CP/CwkgudhTp
	o7GvKKiYgIsE1/7Ldu2JUQ3+kRgrE8tCbOuxWwT7koogr3YtsFC6Zth8L/yGnVgzEnrZShD9OS9fL
	ci1lqD76A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldMp3-00CpGb-Et; Mon, 03 May 2021 00:52:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldMo0-00CpB8-Rc; Mon, 03 May 2021 00:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:Mime-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IDhySqU+Lk+s5GHdK6vgLUXqyiNVJP1ZTC0GsDjbXIE=; b=J1EdItx9cM2VmjlD0g79ZwkII3
 znXr+Ffue1ywrUiz/Ad9gpl7g7kaJdWnjQIAZNpSbdy4a3dSzepJtsYhFSyN73/WmzpgmSv32YMYo
 1gVWP8kcSeNYgYm4/54Lt2SrCid4KxoGNd8NtXj+umBhS+eOAdSVxc8XVM0/Cajhk9kJt9gFEp++9
 bhXbujQ4fkkBSo/4eHsN9feaWa9y7OJ1iNqw1BTtBblnhCoFydWD5kSOwISJgsXfgZJ5ATNhgryoD
 ritr1A04jJeCCv/37s2I5nUVb6oTOxhE9z7cGSQ/vrT04F4C+l9M1UPw+5htlPITH6V5JwGt4eCiq
 qYiyHROQ==;
Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1ldMnw-002l0F-TR; Mon, 03 May 2021 00:51:22 +0000
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1430j0Yc013128;
 Sun, 2 May 2021 19:45:00 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 1430ivVE013125;
 Sun, 2 May 2021 19:44:57 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sun, 2 May 2021 19:44:57 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Joe Perches <joe@perches.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210503004457.GI10366@gate.crashing.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <fcffe807353391339a03106f175ffa71377752b1.camel@perches.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fcffe807353391339a03106f175ffa71377752b1.camel@perches.com>
User-Agent: Mutt/1.4.2.3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_175121_318785_F38E76D1 
X-CRM114-Status: GOOD (  12.60  )
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

On Sun, May 02, 2021 at 02:23:01PM -0700, Joe Perches wrote:
> On Sun, 2021-05-02 at 15:32 -0500, Segher Boessenkool wrote:
> > On Sun, May 02, 2021 at 01:00:28PM -0700, Joe Perches wrote:
> []
> > > Perhaps 8 might be best as that has a __diag warning control mechanism.
> > 
> > I have no idea what you mean?
> 
> ? read the last bit of compiler-gcc.h

Ah, you mean
#pragma GCC diagnostic
(which has existed since GCC 4.2).  Does anything in this __diag stuff
require GCC 8?  Other than that this is hardcoded here :-)


Segher

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
