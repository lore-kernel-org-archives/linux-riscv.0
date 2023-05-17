Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC9AC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tr0ICNt/ugaSmpxpvHtwp2M8VDmX1MPv0jdqIRxTak8=; b=SgZBlAIlgzzOQV
	P3G+qmlhIfPre3mtjxYQ8qQOvmyfm9yDjx7w/0d0knE0RYrBa8VQTi5erHo/kE7FIkEd1QqFf+c9a
	CBBJUD8NeR7+/g+Dzom798CA7mkJwP7KTb/wwWXPK/4lnZsHO10QqZfHtCACcWvPowngt7EFj6Che
	AWazYZMrsOO2jRkNnfwKfwv/KNE2Y1GiUuet9shuHBWbFT+DBjzFq9L05CwwxsUsVyblovMYUBaYT
	+RPsdlfdcWs8MIIauQG9GIgb3gXDjlFJo3JAuwXpLWul/+AznSjHgJyY2PpHTmb5xJ0IEDZUnDKsV
	bY/jOsSo4HhwA9zrzu8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIVz-00AC5I-2P;
	Wed, 17 May 2023 14:52:31 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIVw-00AC3I-0X;
	Wed, 17 May 2023 14:52:29 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 08E9E3200903;
	Wed, 17 May 2023 10:52:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 17 May 2023 10:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1684335144; x=1684421544; bh=5mas8wApaiArBzc/k2qYZpcPuHFX2rPvIJz
	00K7T8oE=; b=PgX23426o57WwtsjjYljjBuol/IGj/CdwDxYdVlzVn9DGm1wDMv
	2FycDR3if/94TiLb5t1Sgx5wgRwymx1kDyNIwk42/KtXRE8cVroHeWsgAD7udiIQ
	lgw15YyHjlw6cKboUDmX2B1BGrMyHuKGFtiHdt3MvWYZYTx0y51flCEMGqwb8oOS
	MDnNcvNC5dTNFZZfjgtys4wAotOWdl5aYw1QNDn9N/EY+a3j4FgO17JnmwNzwyLW
	+L1RWjgOGzhOPrZbZBhgqgdOKvnd6ooChaSPW1J2BgIsil9IBQl3xkgEMrGVh+g1
	nSWTQV1EHEbBLvFTg/YnzpTPVw0G7mO1DaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684335144; x=1684421544; bh=5mas8wApaiArBzc/k2qYZpcPuHFX2rPvIJz
	00K7T8oE=; b=xFz/jAwV3qJ5yapPW/ZMpohG53y24e2YAUcXPuy6+uQd5ShtE1S
	nbNkfhIECkF4nDilsZdooexk1mf11q39LZVWpdl6P52J/kzZsoB2N0SFf8gocyGD
	DMtBEVRH+WgNUlJPkRfXnJGbmi99k5CknZw2t4g1UhJg3NsLgE5zB0Q9C55B/0F4
	JNDlIYNtMogx+WHJANRHNZRztj1wLJJ2IpebT0ltPcIwhY34S42Pgq6Z5ZbvkDPD
	WJTl1ujvi6Ata9f6/+6uuox7hxfXhVkCc+wDEet+vGxY07P0aV10Ih5tLNtm0ji8
	0k7xvpekdrytg0TcK5ykd3p8oZ1pS3qsf8g==
X-ME-Sender: <xms:JupkZHJXUwAnZPNa3E8RuTbb2CNWsCwq_Z5tikjt7ADc18n-mdUfzQ>
    <xme:JupkZLLDGsX9lwAFQBl3acQpMglzqnsfJXPOSxDYTRNJifjsUqnnrrooI49gkDc3o
    kJ1JoyxhrDHMXiN7qU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeiuddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:JupkZPuWr7PbkG8y0OQs8W5jkT7165Fs-hGwQ1dSVjNGZJuoctIlOg>
    <xmx:JupkZAY3sGGDQXi7i1jIpaf7oriSryY6KsNIDvNuiwje_IZhC_FwBQ>
    <xmx:JupkZOaVQhNp_7gXeWPUGsIHD_hREdvTHdUUFKKteLVNN_aws7nsAg>
    <xmx:KOpkZC4wS1szrrY0RrweYZ6FC1I75qf26i68Ll0F1kXm2bXHzRy53Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EB947B60086; Wed, 17 May 2023 10:52:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-431-g1d6a3ebb56-fm-20230511.001-g1d6a3ebb
Mime-Version: 1.0
Message-Id: <6b7f6f66-7890-47a3-a22d-e29f2944823a@app.fastmail.com>
In-Reply-To:  <CAJZ5v0h0spuxK-7LBJSU9BK2TEOUeMjf7hhKScadkxFN_RwStQ@mail.gmail.com>
References: <20230517131102.934196-1-arnd@kernel.org>
 <20230517131102.934196-11-arnd@kernel.org>
 <CAJZ5v0h0spuxK-7LBJSU9BK2TEOUeMjf7hhKScadkxFN_RwStQ@mail.gmail.com>
Date: Wed, 17 May 2023 16:52:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, linux-mm@kvack.org,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 x86@kernel.org, "Paul Moore" <paul@paul-moore.com>,
 "Eric Paris" <eparis@redhat.com>, "Dennis Zhou" <dennis@kernel.org>,
 "Tejun Heo" <tj@kernel.org>, "Christoph Lameter" <cl@linux.com>,
 "Pavel Machek" <pavel@ucw.cz>, "Peter Zijlstra" <peterz@infradead.org>,
 "Waiman Long" <longman@redhat.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 audit@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH 10/14] suspend: add a arch_resume_nosmt() prototype
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_075228_238427_F9C14888 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMTcsIDIwMjMsIGF0IDE1OjQ4LCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToK
PiBPbiBXZWQsIE1heSAxNywgMjAyMyBhdCAzOjEy4oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBr
ZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4KPj4KPj4gVGhlIGFyY2hfcmVzdW1lX25vc210KCkgaGFzIGEgX193ZWFrIGRlZmluaXRpb24s
IHBsdXMgYW4geDg2Cj4+IHNwZWNpZmljIG92ZXJyaWRlLCBidXQgbm8gcHJvdG90eXBlIHRoYXQg
ZW5zdXJlcyB0aGUgdHdvIGhhdmUKPj4gdGhlIHNhbWUgYXJndW1lbnRzLiBUaGlzIGNhdXNlcyBh
IFc9MSB3YXJuaW5nOgo+Pgo+PiBhcmNoL3g4Ni9wb3dlci9oaWJlcm5hdGUuYzoxODk6NTogZXJy
b3I6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ2FyY2hfcmVzdW1lX25vc210JyBbLVdlcnJv
cj1taXNzaW5nLXByb3RvdHlwZXNdCj4+Cj4+IEFkZCB0aGUgcHJvdG90eXBlIGluIGxpbnV4L3N1
c3BlbmQuaCwgd2hpY2ggaXMgaW5jbHVkZWQgaW4KPj4gYm90aCBwbGFjZXMuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBEbyB5b3Ugd2FudCBt
ZSB0byBwaWNrIHRoaXMgdXA/CgpZZXMsIHBsZWFzZSBkby4gVGhhbmtzLAoKICAgICBBcm5kCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
