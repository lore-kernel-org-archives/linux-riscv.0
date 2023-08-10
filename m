Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ADDC001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujt5NcAo/Dh+9l/iA+zieKfsedhXisjBxWjcHdf5waw=; b=RNwgNfhPzLwq8E
	bv5XHaOhz735gBG8nAFZai52GUJONbImeJneKVi+DJLUxML2YwHD/xBnUGHuGKDdCIyMfl50axZkg
	0s61OtvD8jnvIRQn/008Iw2OUSmmZ7w8Z1h43AskrQHpbVIeCqXeBrig6/i9JL5ryeSTgukKgieX0
	uoFLm5ndtLqG5Ys58SuI9+mSal0mPHhcyLVf9x4Zkinf8EVLvDKyvioKZNF8hXb1f1gYAHc84tFgd
	cwGVufj+ATsmHa3HTJW7+XM+uNinLEVdc+PmVaT2xYDEUm6iyZSdggCIkZ5AP5gWo4bpcEoENIr4A
	a+QfTmr66Nj9SwYCYBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzWd-006hbK-1R;
	Thu, 10 Aug 2023 06:52:03 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzWa-006ha1-1F
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 06:52:02 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C48C15C0179;
	Thu, 10 Aug 2023 02:51:55 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 10 Aug 2023 02:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1691650315; x=1691736715; bh=4F
	oTlnoMN6A/uYlUhjKSEMdo/swdmRehA0FhkCE34tw=; b=aPi2qeyLe78Q08jyOg
	r9XmGTVyKLpQWDHzhGKeVpdozJJxVS06mzroO2CXqiQdE1GsI98lhiHxDuwIbD2H
	4uhBjIqOv+V3FCABherEhoioYticeDWE4s2zuzeXjF1hqZovkiZc7tXtYYolf8oP
	eWnuHAaKOwj2H4H60+5LjKFLTgQXLcvSlutnqGFx0xRiefTYFHWVz7P8RY2BhYBV
	+zNAYCyC6+8dU9yIfZ3WUAVJiXrh8LuMpa4Y2kgxIPA7ZRSY9aUQ7hcFxOgF37iP
	mNgU4M+AMW216RNL50vi1o2L8mW4X0o7rCPynAPbgGXjDG6PzaKeuJhG3hP1wG+k
	RIBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691650315; x=1691736715; bh=4FoTlnoMN6A/u
	YlUhjKSEMdo/swdmRehA0FhkCE34tw=; b=h9EIjnYZ7tDZvmUPEbYmOeS4Qsq4B
	/z5TCwas9+9/Jaa/1sg7MKHwFwyNAWrp3Pczi7uKPwRyxa7FNjDIqQ/Wq6Ht60YY
	H3Gbat+SZSJ2BlF88VguptlcfoV4K93ePagUeufFbCFLt5UOMb32G/1amP8+mvIa
	h7qbPL+py6S2saGoTsGu4B4cdF8UIwhrAVMEBTg4MmuVrXqJeA26GBk9N/kBd4WC
	AxBzA3mPOT84zvl1I4AZ3SwYKaKuaTU//Em2ttf5T6UZLuY9UWAlHAnLleR9m9UE
	YtUTBTCpYKT0OoQr6H2me9xfsGVYQQWBcg4qk0/8wzgAPb50slt0OnF2Q==
X-ME-Sender: <xms:C4nUZNGbY-UF72Zc7gBsr8lJam5ByDCHhHEsArCFZboqrYOsHF55mw>
    <xme:C4nUZCU6CVSwKlKGj9zyiIWp8kDiNAns8UGIa3lidtubDXIK1ygGfApQIHCT8CZF-
    _i_gI41-A1XL_NmEII>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleehgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:C4nUZPJXp7ne-9m761LIFuZpvxy1Uqwp2nHzv-ngy7_hYwFP5UStbw>
    <xmx:C4nUZDFKP5lScvrR834Jmo32HrBg0vmNrFrHPfwXUM2uONyirsI4vQ>
    <xmx:C4nUZDVhCjxUGmnunMsi33YQEHic4huOoD4szXkvUZgvwKUWdhZSyg>
    <xmx:C4nUZGPvGMncJhnRrl5TYDMUofB1og0dVd7ameId6Ta4seLseWMMug>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E2DE5B60089; Thu, 10 Aug 2023 02:51:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <b0cc2cd8-e246-40d1-b091-f40a74b31f61@app.fastmail.com>
In-Reply-To: <20230810040349.92279-7-leobras@redhat.com>
References: <20230810040349.92279-2-leobras@redhat.com>
 <20230810040349.92279-7-leobras@redhat.com>
Date: Thu, 10 Aug 2023 08:51:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Leonardo Bras" <leobras@redhat.com>, "Will Deacon" <will@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Andrea Parri" <parri.andrea@gmail.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, guoren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables of size 1
 and 2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_235200_860241_7E0CC1D6 
X-CRM114-Status: GOOD (  12.39  )
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

On Thu, Aug 10, 2023, at 06:03, Leonardo Bras wrote:
> xchg for variables of size 1-byte and 2-bytes is not yet available for
> riscv, even though its present in other architectures such as arm64 and
> x86. This could lead to not being able to implement some locking mechanisms
> or requiring some rework to make it work properly.
>
> Implement 1-byte and 2-bytes xchg in order to achieve parity with other
> architectures.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Parity with other architectures by itself is not a reason to do this,
in particular the other architectures you listed have the instructions
in hardware while riscv does not.

Emulating the small xchg() through cmpxchg() is particularly tricky
since it's easy to run into a case where this does not guarantee
forward progress. This is also something that almost no architecture
specific code relies on (generic qspinlock being a notable exception).

I would recommend just dropping this patch from the series, at least
until there is a need for it.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
