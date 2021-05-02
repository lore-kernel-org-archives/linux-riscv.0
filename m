Return-Path: <SRS0=OIoX=J5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84929C433ED
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 20:39:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5CF16117A
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 20:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5CF16117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aD8TfWfDN5O4kx4Jo7yEAtEd+oo6scyXGe3LVU7Vfhs=; b=iAS2ZeCmJufzkf46P7+asFr6s
	6+dXzh3gkU5UB34FjlvrYA0+8zfD4kBrFCu4GAQIeJbAA5UjyHfI/6ttwqQB7QB61hzzYDPXyplZy
	BNojRFaArrr2smLojFud89/lqhN3GIRZXPBG75TfZA0fPwDvThGePkfsTb0Z7YaXxMVcWOHpnwxDP
	/TKSQtQYl4w9QDdaxRt3efTGWNVJwwGNdS+Q3jk2xTyn6edwAGRytdLUqBEfrtVg5GenwsY6MYKwA
	L6Em+lkFZT1bcjr4wumZI1qhyDY+n2px9SbJGw73HxyaRJxVFIDhFuHPqlEnlIkY5qNGK3p1U4rQm
	zPFATwZRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldIs4-00CQum-43; Sun, 02 May 2021 20:39:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldIs0-00CQub-Ee; Sun, 02 May 2021 20:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:Mime-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lEQ5rPk7dALmDqRwuQxk9AEj+ey29FsFuJIk0wPAA6g=; b=rZn8io3+VWolZfbASGBLTDwHym
 yQZBYoZ4vUQ2nf9kynVSJlstGgZ9wIjF4L/A7SxIe8fj9h1q3VfPcbsrVNi3EDv0B2a7dE3x0twJb
 kHShsNzc4a3K0TgkcCZigVfaPl2y+nK1Cu1hZncCY2wmd+IuX+k47pFsj1W+MHHhYDIRWgfC1NkyT
 NbMjkuAtOOONPll/U5+zA3UyuhKKcXh5FFJNxtXIYiZTCTWc1Zwr0C9a1jubXHHGDYxRvG3hPgZRl
 y0Uu1Z4404SN5udlpmqoaS9pbW+47jWQ6HeSpcEHedT6yl5pNwoDCgtrWDqfMNBgNWFZBnXE4I6o0
 Os5MdrXg==;
Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1ldIrw-002gEL-33; Sun, 02 May 2021 20:39:14 +0000
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 142KWu7A032481;
 Sun, 2 May 2021 15:32:56 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 142KWrfq032479;
 Sun, 2 May 2021 15:32:53 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sun, 2 May 2021 15:32:53 -0500
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
Message-ID: <20210502203253.GH10366@gate.crashing.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
User-Agent: Mutt/1.4.2.3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_133913_502171_2ECB8948 
X-CRM114-Status: GOOD (  15.05  )
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

On Sun, May 02, 2021 at 01:00:28PM -0700, Joe Perches wrote:
> On Sun, 2021-05-02 at 13:30 -0500, Segher Boessenkool wrote:
> > On Sat, May 01, 2021 at 07:41:53PM -0700, Joe Perches wrote:
> > > Why not raise the minimum gcc compiler version even higher?
> 
> On Sun, 2021-05-02 at 13:37 -0500, Segher Boessenkool wrote:
> > Everyone should always use an as new release as practical
> 
> []
> 
> > The latest GCC 5 release is only three and a half years old.
> 
> You argue slightly against yourself here.

I don't?

> Yes, it's mostly a question of practicality vs latest.
> 
> clang requires a _very_ recent version.
> gcc _could_ require a later version.
> Perhaps 8 might be best as that has a __diag warning control mechanism.

I have no idea what you mean?

> gcc 8.1 is now 3 years old today.

And there will be a new GCC 8 release very soon now!

The point is, you inconvenience users if you require a compiler version
they do not already have.  Five years might be fine, but three years is
not.


Segher

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
