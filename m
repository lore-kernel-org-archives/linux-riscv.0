Return-Path: <SRS0=/9Zu=F4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FF9C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 04:38:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0814922AAA
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 04:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0814922AAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tycho.pizza
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Xlz+Vn398YcObjzbeQxpmDwbyBnvrB929TFfFe1Prc=; b=rJuIQAWtsC2lcylaenzHfUkj5
	ZIwLfKrZ4W+od7ZKSOkA8EhncCSyxeu9OudU8iFXNP2njRpoQvgT/EJtfEApVZczNf2WYBrIHOG2E
	UIAVuV7GYqlk5w21pp2hrtVMCPqFMAqa0nPWu2x9XQzAnb9Wh8xeir2OzNKgdSQ5F7CJc9G7wGLNu
	TZzWIxzxAVIjdHcygHITm2KlCJLJWgoiy+pdoRs343pRfXQSq6ZBYoSiSm+wBnNfM1jq88tzjYU9/
	8lKyMzAovFI5wzR3E81MAVmFnXUs8aKTxb5NMDlNzaTKJhzqKYTCFgrGluTfscTBw88hVpvozD2tD
	sM4S41Jvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksIOH-0002G1-WB; Thu, 24 Dec 2020 04:38:18 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksIOE-0002FH-Kn
 for linux-riscv@lists.infradead.org; Thu, 24 Dec 2020 04:38:16 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 510325C00D5;
 Wed, 23 Dec 2020 23:38:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 23 Dec 2020 23:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tycho.pizza; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ZuAOZsuNyuhekGAfAuVc4cPYDPj
 wuvIUZMlI+9EGZFw=; b=P0tHQ73n6Zk/97bKki+yq/zgjYW2E5/0zcclADwMdwW
 hHvXicBzFMFnbiYXVTRynKWcQBIcoyeZ8R+d8XCYlJyuCuEfHVPm3pX70KHVaxKw
 ko+VaehO28E6WXZxQ601VKjvWXvi8nXl2GMfloi9bMtG6JMkxhXPgSLSV4LA1+jW
 heqVQ6vkDmPBWiPD5rK2/ECEgzAk9tE0PejYD7g4wZC6tIM0OU2dLLukFY3NVwn+
 Jj79SFJSduL6jBmYcTn6Ni3m9NLZA2r1xjnVRBGzQG0z8U0WHqWcd7xCk/v8IPpL
 2QeHo7B6XXpWENlyUnyQN1V6NuWGabUZ8qIT2vYy2HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZuAOZs
 uNyuhekGAfAuVc4cPYDPjwuvIUZMlI+9EGZFw=; b=YyvLRtpIJyopSIVz4gqp7p
 t4AZgfleFqUiwzNFyPtIwee9tlvRdp9iiPt3acpSLBn+JFnWZyN07q3XBI7ZoDp8
 H9zbYOdwB+7g0kQ3f/uETALWnr2VOG2QxurzFwLHCtwEvBV/OQKd/M0c5G1f9vWF
 msEUmhz0CcClZRO8eOlTcqsceQPpQbNoK1ohnH7MVlolN4JSNvj7P5OlQEP5JOEC
 U0f44hNj4XKjLh4wEPt11FctECj++Vch/syQDthoLnnQR87f8TzOo/KeIg1NX+1E
 lyVTlaKsiMPGlbJh0Xdgw2g/NgIT+V1u1MPpMc0Iq4bKxcpiH/AaE1Pi3mzKyikA
 ==
X-ME-Sender: <xms:MBvkX7g4h8X4d05Fuk4RuPJI0Ld7wclAueQtbbBho5CEGe9p4YyzhQ>
 <xme:MBvkX4CSHrlJiher9HaRRnMIFs1R0EbPvNv9A0JLaPFj57CIhNj4mFguYaGRjuBsA
 sXsp4a7lkJH_BkoYw8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtkedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhigthhho
 ucetnhguvghrshgvnhcuoehthigthhhosehthigthhhordhpihiiiigrqeenucggtffrrg
 htthgvrhhnpeeifffffeekkeeifffhteekleejhfetledvvdeileefheffveduveevleef
 lefgtdenucffohhmrghinhepvghnthhrhidrshgsnecukfhppeduledvrddvgedurddvhe
 ehrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepthihtghhohesthihtghhohdrphhiiiiirg
X-ME-Proxy: <xmx:MBvkX7G4A08d8f2fBeohYY-mii_krUFX01seA_TIEOzpOwZSWx1dVQ>
 <xmx:MBvkX4QVlALfD6qcwO4gzME0yOE7lf1lhtYwHGRl-yssqhyP1DwYlg>
 <xmx:MBvkX4yFVa6JUSlW7ead94cGv1VPJWY--ZJ9u-JDhBwa279pB7S3yA>
 <xmx:MRvkXyuZgBxHa9Ht_fbJeBWtshIOzOw1PtEQBcYa9A938ZvFa234nw>
Received: from cisco (unknown [192.241.255.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id DA5FA1080059;
 Wed, 23 Dec 2020 23:38:07 -0500 (EST)
Date: Wed, 23 Dec 2020 21:38:06 -0700
From: Tycho Andersen <tycho@tycho.pizza>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: return -ENOSYS for syscall -1
Message-ID: <20201224043806.GE710211@cisco>
References: <20201223082404.GB24581@infradead.org>
 <mhng-c15e4fab-6487-4875-a392-85669982b8b1@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-c15e4fab-6487-4875-a392-85669982b8b1@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_233814_993948_91431475 
X-CRM114-Status: GOOD (  26.52  )
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
Cc: david.abdurachmanov@sifive.com, schwab@suse.de,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 23, 2020 at 06:54:43PM -0800, Palmer Dabbelt wrote:
> On Wed, 23 Dec 2020 00:24:04 PST (-0800), Christoph Hellwig wrote:
> > On Tue, Dec 22, 2020 at 09:22:19AM -0700, Tycho Andersen wrote:
> > > On Mon, Dec 21, 2020 at 11:52:00PM +0100, Andreas Schwab wrote:
> > > > Properly return -ENOSYS for syscall -1 instead of leaving the return value
> > > > uninitialized.  This fixes the strace teststuite.
> > > >
> > > > Fixes: 5340627e3fe0 ("riscv: add support for SECCOMP and SECCOMP_FILTER")
> > > > Signed-off-by: Andreas Schwab <schwab@suse.de>
> > > > ---
> > > >  arch/riscv/kernel/entry.S | 9 +--------
> > > >  1 file changed, 1 insertion(+), 8 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > > > index 524d918f3601..d07763001eb0 100644
> > > > --- a/arch/riscv/kernel/entry.S
> > > > +++ b/arch/riscv/kernel/entry.S
> > > > @@ -186,14 +186,7 @@ check_syscall_nr:
> > > >  	 * Syscall number held in a7.
> > > >  	 * If syscall number is above allowed value, redirect to ni_syscall.
> > > >  	 */
> > > > -	bge a7, t0, 1f
> > > > -	/*
> > > > -	 * Check if syscall is rejected by tracer, i.e., a7 == -1.
> > > > -	 * If yes, we pretend it was executed.
> > > > -	 */
> > > > -	li t1, -1
> > > > -	beq a7, t1, ret_from_syscall_rejected
> > > > -	blt a7, t1, 1f
> > > > +	bgeu a7, t0, 1f
> > > 
> > > IIUC, this is all dead code anyway for the path where seccomp actually
> > > rejects the syscall, since it should do the rejection directly in
> > > handle_syscall_trace_enter(), which is called above this hunk. So it
> > > seems good to me.
> > 
> > That change really needs to be documented in the commit log, or even
> > better split into a separate patch (still documented of course!).
> 
> Unless I'm missing something, this is already how it works already?

Yes, agreed. My musing was mostly just that this is dead code that
probably should have been in removed in af33d2433b03 ("riscv: fix
seccomp reject syscall code path"), but was overlooked. Maybe this
could use a Fixes: tag for that too.

Tycho

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
