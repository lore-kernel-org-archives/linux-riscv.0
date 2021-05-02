Return-Path: <SRS0=OIoX=J5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D75AC433ED
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 18:42:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53DBD61353
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 18:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53DBD61353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1n+kceXFlVNl9/E+7tKqa7d2BNzyZx2eOwkJ/qzQWEY=; b=q6YRpIQnyS1+lyUD+5NUdeFno
	ufWrHKNC1EvLiXYP1y/8XUhR2pLHBdvNGzFRS9Fa9txdR0YJ6kDMb8mjxxxF/gVZH7loEszEKXs2W
	n98apyO1gDE+9MNfgH9NrgA6SmaqnoR673uD2lLjlDYiqE15tUSP265YaLzi01SAXTvUD2sUJ6mB+
	pr75/EAVS8zMEqeGP+If4w/zliWOG+9ivElf6NNN9Q+o6sHeIat4jYHKT9H+D5GsTP9mNHW/0kWkf
	0DH/1YyHNcHfT5rOH28x8HrznWG4fXe27AE2lva8ou9y3Y6/oz6e2IO2ICqJWmPVOHgcAT69K1Sog
	Z1jENxBfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldH37-00CEy1-0m; Sun, 02 May 2021 18:42:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldH34-00CExp-JA; Sun, 02 May 2021 18:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:Mime-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=w9UPflmyfPQOb87DtjCqoVw3qr2f/h4Knl5UHZmIR8E=; b=jC0UUSpGEECOM6Zq//LZBDveOA
 0A3skeuf3N0IX7xOg4H2e0k1mfxI5QPwzau5MsUKXK5EaMqB47L4/G3EF2gwTP9o0OG62BZwNDJwF
 XmLhgmhjwG330ByznvkMQkCnWOdezWUFM9EVspOTIZp3b/kK6asdxHsGuDlkLtHIbVx5uZ7C+r6I1
 BHjnU+l5Ki0D9Vs4fB38vrmP/r6H6nLWJkA97nHT+RPLM0SCaYBUsVsg1fEk4HRcJ/lgYhGyUyaN7
 x5Pn4aipIvd0O4SdCqWSP5+DBc3E2ycVowIfn3JbvunXA3P67n7yizEtub4Ek3D2cS6b9kONOXy9n
 R1vI801w==;
Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1ldH31-002dlZ-Lh; Sun, 02 May 2021 18:42:33 +0000
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 142IbL6B028576;
 Sun, 2 May 2021 13:37:21 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 142IbKUo028575;
 Sun, 2 May 2021 13:37:20 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sun, 2 May 2021 13:37:19 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210502183719.GG10366@gate.crashing.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
User-Agent: Mutt/1.4.2.3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_114232_063264_819735A4 
X-CRM114-Status: GOOD (  11.95  )
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

On Sun, May 02, 2021 at 12:15:38AM +0900, Masahiro Yamada wrote:
> The current minimum GCC version is 4.9 except ARCH=arm64 requiring
> GCC 5.1.
> 
> When we discussed last time, we agreed to raise the minimum GCC version
> to 5.1 globally. [1]
> 
> I'd like to propose GCC 5.2 to clean up arch/powerpc/Kconfig as well.

Both of these are GCC version 5.  GCC 5.1 is the first release of that,
GCC 5.2 the second, etc.  Everyone should always use an as new release
as practical, since many bugs will be fixed, and nothing else changed.

See <https://gcc.gnu.org/develop.html#num_scheme>.

So, this means everyone using GCC 5 should be using the GCC 5.5 release!

If there is something about 5.1 that makes it produce bad kernels on
some arch, make that arch's Makefile complain?  Same with binutils etc.


Segher

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
