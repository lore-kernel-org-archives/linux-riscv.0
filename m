Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C0FC77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJmAkyR/qx04iQqAWBKoXEFOfjId1aKHbbe4B5sWq5Y=; b=Q8Cz0lwgVXNOvv
	frsRWLCYqy0DTCMT7+1SaGys+3CoWMK0oH03ZhOkLNF/iP5S+UuQsr2wTBZYxY70qQgW4xii/W4h8
	ZisHYPiJ8Z/uwrBChz9IJNLrXvLPPQqtfOS5EW7CyhljJ0Dg8h6QnLISKtDSG/oOdJ3ds5t8crpnN
	9xdLuqvuMOlFUK3U+twp7UAtWrxUVOYwY41krCt5kvBzoh/yEx9ZwicNNQcYENSLfU8dI3HxPdbSg
	f72x6ZGpvrr+Kc2wVCKZPS7TLmElVEwNjyRJ7chwezkp/WgXgHFXRgpPYY97QdowxVF8Dy/9/Ot9W
	/ot9p2F8dPFN051i+edA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIVj-00AC0j-2S;
	Wed, 17 May 2023 14:52:15 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIVV-00ABti-0m;
	Wed, 17 May 2023 14:52:02 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 10A63320030E;
	Wed, 17 May 2023 10:51:50 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 17 May 2023 10:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1684335110; x=1684421510; bh=U9
	81mgJN5ZcIFGHHfNRtTYm9tIIshD/j5t+czAqBesk=; b=Ca9f/D4SJr14QvZGkc
	+q7KTRGXT7JBFRrs75d+HJ2OHOSFueAY0un/ZGcKbVEoscZFW6SjqbiPXereZTY1
	4lcT5rbc2J//JZIJSnLiqFoKjl+7sEm3mRPxHdA8kVhx6i+8Gv6Gs3tgeghB9AVx
	tiFExJee1gfnnXfCGEqrMCOAyztqrVmVbbh4Vx8kBzBcchhCWGq9jE4AWpdrn/zc
	KlbDH9cn2VZKKpo3BlHq2vmDVsjsuLASyEKUhF08I7lpQUUHqQi2ze3FpKl0U9IV
	yp0n5gg/GsUfq8IoMt1JUB+wlGdGrbDiz4LfVQ/hM2UiQ/AKZgZzMrsWIQF+mwUG
	o5Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684335110; x=1684421510; bh=U981mgJN5ZcIF
	GHHfNRtTYm9tIIshD/j5t+czAqBesk=; b=EMWrwTfyiN4WwFm97r9VWWS6w2uAq
	LgvmOB2bNzX3Nj1iJRBecCwthhPNqACErPlWa7ntFlYoaEwBhGN78KcLN3yBTNyu
	Aqk3H67Dg6iVzIE2eoyn3hmWBvqBblRgzb3TZygGJHtSCh3YrmYDvNM1AlrxXI+/
	YZMWcHS8mskGNb1OcG10Hh5tBRVj/WtG2lS25NQwWzGjSsjt1yoy6lceEwD7hdEp
	ICxlryjGqFpBvOblk/or/mLmEinMRAIO7vCr/4QUi2/F6B8hv2rXwNtgp21zzcmi
	W3WRrfgi52k7r9ApnTs4X2/2idzkX3KZD72Lp+8DQ9oBBrfMF6Te9k6Qg==
X-ME-Sender: <xms:BOpkZAX-ah2gC9qXHRhxL9Jdqt9kqu-VKcGSuWg1GW_5ZN0t_KBOcg>
    <xme:BOpkZEnCWHECQenDSE928iVzgjeKtfqwlYib_ujabtOEKkQ-iVrevetsmAAqV2PXz
    oO1vUF8ZrqpGe5ciQc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeiuddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:BOpkZEanBGI8-zi50JEHLFiN5OCN7u3f1N-fS6wbkXOhNFZcQlB9RQ>
    <xmx:BOpkZPWIrxfeze0hM1uxKpTiRjSQF0E2dM8RjNSgq_9LgDgcz5l8Gg>
    <xmx:BOpkZKky6b4GKmAWHHstx-M_Q2MTJ0Mg84yM6a-OyBPfxMEqp1e5aA>
    <xmx:BupkZNFPTGYv1tkCdtIpLzc7PK5bJcAAEF0LFfyPqwuQNavihPAm3g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9F93DB60086; Wed, 17 May 2023 10:51:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-431-g1d6a3ebb56-fm-20230511.001-g1d6a3ebb
Mime-Version: 1.0
Message-Id: <83422cf8-5d77-4e2f-a854-c2b9a9a94d75@app.fastmail.com>
In-Reply-To: <e1a07eed22cb33af2733bdffe42b09f0.paul@paul-moore.com>
References: <20230517131102.934196-5-arnd@kernel.org>
 <e1a07eed22cb33af2733bdffe42b09f0.paul@paul-moore.com>
Date: Wed, 17 May 2023 16:51:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Paul Moore" <paul@paul-moore.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 x86@kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
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
Subject: Re: [PATCH 4/14] audit: avoid missing-prototype warnings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_075201_340544_9BE9CEC8 
X-CRM114-Status: UNSURE (   9.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 17, 2023, at 16:33, Paul Moore wrote:
> On May 17, 2023 Arnd Bergmann <arnd@kernel.org> wrote:

> We probably should move the audit_serial() and auditsc_get_stamp()
> away from the watch/mark/tree functions, but that isn't your problem.
>
> Anyway, this looks okay to me; do you have a problem if I merge this
> via the audit/next branch or were you hoping to have this go in
> through a different tree?

Merging it through your tree is probably best, Andrew can either
pick the ones that nobody else took, or I can resend the rest.


    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
