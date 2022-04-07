Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC77C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvBcFcKluE9THgM6tP62k5/rkJE2W/XTHmTBU4W5RbQ=; b=sKt8LVmFNCt36J
	f4fgVmwP3OfqAu3wuu8EBD8WiuAUx5RQXTS/vDGfqxlJLwO84auOomyXK9ha8oxChYgjMVlxXDrAU
	pm3kOoHJE0r8q6wG/cePLBSRZpx9/lleSD5V1kKKc6oip5AEc52bwSX90yMeHXzJWq0EZ2XP8k72Q
	8zF1mNhoN9ogCBfcu4lF29tV1EnKNjQNx/WsIAeuYM2Brvz4Y2NtJLZxbknOK3s9Fl8fqeU8NOxsG
	zDwg+bvcK0BCm4qY3/aPHiFRznY7l3QCWMx8uOwJ3iQZiN7zQIFDJtAv6RsSza+D43BH6lAaJSDVF
	nnLKkIzpI2IWjC8GNOVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncO1Q-00Af1w-LC; Thu, 07 Apr 2022 09:01:44 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncNaz-00ASHu-JX
 for linux-riscv@lists.infradead.org; Thu, 07 Apr 2022 08:34:27 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A93533201D51;
 Thu,  7 Apr 2022 04:34:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 07 Apr 2022 04:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OrAVdtI06jlWzu77P
 ZjIBfUVfDfo5qupQAsNYfVHmic=; b=REyfza793XvLwCmAbyDR3j41ku76wmjj9
 t8ZPCQN8csyCmQMKvB42XV1AmWwt4wNNrxmwPC81RF5b8fAADR0pQalFI8qXYPT0
 7/q14rkEhdtYWx6Ir/coc19eP4KQ2iDLO5MNs9cjC74Tfci0AMnCeGRILehn1Tbg
 zdS1YIVs1JnZtUmSbl0qDXyVGx7RDN2AtppERAi3Ke56NSptXrFZhqEyJaH0jf/o
 R7Q19bQDBPRh9KMpteNmIHQXlpkVdxrVY6aYJfkMqCrUCBayiLSBrdr/ZXf3zR2b
 tu/TkEybMrURbop9YitH5hmy4TK32Gu+HMKnytWHiS9lprsHPdZhg==
X-ME-Sender: <xms:C6JOYtK2DPSocN3KHcYO1iOuhmb_8QucNUitWsEdflBe5SjkWL3z7w>
 <xme:C6JOYpKfOENfQGi6p5TQEf0B56wNDQN0OEWecppa37hMLlUM4UeTRwUsN7v5_uWR_
 gdivHGWAWTeZwKzFeM>
X-ME-Received: <xmr:C6JOYlt1cSyCTnjfVsxU4pZWO98PYUdKI639jzGKmXtOWFI39-wzOshV4dfyZO2-z4mumNSVWnPG-KabALraSf6EYOe47AA-Ns0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
 uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:C6JOYuYlhjomGYyc5L-B0gj8YiRk3ocqfwcnhRXyBdTdBjBsqf4E2Q>
 <xmx:C6JOYkaLdhGJWMS4ZendpX0uu_pT9copGfWauEd59dUXQNsKrfWXUA>
 <xmx:C6JOYiDNCIq3SX3-pZu8JnT1DvO4ImNd48uhrFtgNYCkYCD6b3A6Qg>
 <xmx:DKJOYhL6uTbYkgTwgpQB8D8qsnBrmU8mlCw4mwAwA48dlrIgR419LQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 04:34:17 -0400 (EDT)
Date: Thu, 7 Apr 2022 18:34:15 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Arnd Bergmann <arnd@arndb.de>, Rob Landley <rob@landley.net>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Linux-sh list <linux-sh@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Greg Ungerer <gerg@linux-m68k.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Rich Felker <dalias@libc.org>
Subject: Re: [RFC PULL] remove arch/h8300
In-Reply-To: <04c0374f-0044-c84d-1820-d743a4061906@physik.fu-berlin.de>
Message-ID: <ca79546d-4e64-b8a-b63a-dfd0ebce8fed@linux-m68k.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
 <c3e7ee64-68fc-ed53-4a90-9f9296583d7c@landley.net>
 <CAK8P3a14b6djqPw8Dea5uW2PPEABbe0pNXV5EX0529oDrW1ZAg@mail.gmail.com>
 <04c0374f-0044-c84d-1820-d743a4061906@physik.fu-berlin.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_013425_699410_94947F5B 
X-CRM114-Status: GOOD (  15.79  )
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

On Thu, 7 Apr 2022, John Paul Adrian Glaubitz wrote:

> On 4/7/22 09:17, Arnd Bergmann wrote:
> > On Wed, Apr 6, 2022 at 11:25 PM Rob Landley wrote:
> > 
> >> I'm interested in H8300 because it's a tiny architecture (under 6k 
> >> lines total, in 93 files) and thus a good way to see what a minimal 
> >> Linux port looks like. If somebody would like to suggest a different 
> >> one for that...
> > 
> > Anything that is maintained is usually a better example, and it helps 
> > when the code is not old enough to have accumulated a lot of historic 
> > baggage.
> 
> But if it's not a lot of code, would it really accumulate a lot of 
> cruft?
> 

Where you see "TODO" in Documentation/features/*/*/arch-support.txt it may 
mean that an architecture is preventing the removal of an old API.

You're quite right, though, it is incorrect to call this an "accumulation" 
of baggage. It is actually the failure to remove cruft. (OTOH, shiny new 
things can be said to "accumulate". That's how cruft gets made.)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
