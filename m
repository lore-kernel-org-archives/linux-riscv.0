Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068C2C433ED
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 07:35:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EC5061221
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 07:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EC5061221
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOYubP4IDOuge3p8JJz995anrX8cjuuIew/b2KWty4g=; b=GTAQOa4TQ4kYEReGxQsxnSAQkl
	fqI5we9BrNDwafdLmgxhROKpwHQwnNCl5J3LJqwcTX3kDPvS/p+dqarf1+OKbW2huFIPPg+xemxho
	RbLfpkWoTRNZkCb/mboyEu7HnCYc21I/nYXEZwWi3KyNMl6xIBTt35rqPLW/AK5eGCNtCRlkJS9v9
	1UcqVxZcch9aDmFQSgNt9XszrpWQ4EIgVAWGN3epPwt/2MkfcB5o9RHxHCrJiq7LZRXx/r+aDM0L2
	28o5lPp8bCNyvD9e0kObozA94isYALcH1ZUEOFuSZJHyxgcbUjKT0ByvdqzZK69HYIVHO7TsTJNdc
	PmOyFcdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldT6s-00DOLA-ML; Mon, 03 May 2021 07:35:18 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldT6X-00DOJ3-PJ; Mon, 03 May 2021 07:35:02 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 73E5F1A09;
 Mon,  3 May 2021 09:34:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UYJc7Wkr1aLP; Mon,  3 May 2021 09:34:44 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 3B5BAECE; Mon,  3 May 2021 09:34:44 +0200 (CEST)
Date: Mon, 3 May 2021 09:34:28 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
Mail-Followup-To: Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
Content-Disposition: inline
In-Reply-To: <20210502223007.GZ1847222@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_083458_460307_D367DBD4 
X-CRM114-Status: GOOD (  19.51  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hei hei,

Am Sun, May 02, 2021 at 11:30:07PM +0100 schrieb Matthew Wilcox:
> On Sun, May 02, 2021 at 02:08:31PM -0700, Linus Torvalds wrote:
> > What is relevant is what version of gcc various distributions actually
> > have reasonably easily available, and how old and relevant the
> > distributions are. We did decide that (just as an example) RHEL 7 was
> > too old to worry about when we updated the gcc version requirement
> > last time.
> > 
> > Last year, Arnd and Kirill (maybe others were involved too) made a
> > list of distros and older gcc versions. But I don't think anybody
> > actually _maintains_ such a list. It would be perhaps interesting to
> > have some way to check what compiler versions are being offered by
> > different distros.
> 
> fwiw, Debian 9 aka Stretch released June 2017 had gcc 6.3
> Debian 10 aka Buster released June 2019 had gcc 7.4 *and* 8.3.
> Debian 8 aka Jessie had gcc-4.8.4 and gcc-4.9.2.
> 
> So do we care about people who haven't bothered to upgrade userspace
> since 2017?  If so, we can't go past 4.9.

Desktops and servers are all nice, however I just want to make you
aware, there are embedded users forced to stick to older cross
toolchains for different reasons as well, e.g. in industrial
environment. :-)

This is no show stopper for us, I just wanted to let you be aware.

Greets
Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
