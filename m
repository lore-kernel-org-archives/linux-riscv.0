Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B776ED59F5C
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Dec 2025 02:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PRA7u2Mq8Ocyi3XstDTfZ1uxgC8N8MKGegzJv0k/bQ=; b=PbG1dbj6e7JiCE
	paoAACgm1AyAwwxTacCJO+zC/kcC7WyYaj+YMDgBRzcjn3v8/MpwC8jGdeGspCLPpUBrvYRQfWOXy
	4Dl7YOHIje3qpyIeoRMKkstMqphPspFT5TCZ81UNzIVd/rMn53XkMWOAIg3wfvGeyziYuU28N3NbL
	Wp1M9RTEU60fQ+i3LZbubz+7/QpFc77r9LIgzeWh7cY2/Bbuoh5C/5tfMUlAz/jyi0Zv5pmEsi6SY
	AqOMbDf3B/GG/u55ckn8X/xMFT9blVz47oSMbT+cZXM7MmC7yGTBKzW+VSD1W6seuJIY5ZA2+ODOE
	o/BwUpZ+NdEJVGR9MbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFL1-00000001Ivx-0YGo;
	Sat, 13 Dec 2025 02:26:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFKz-00000001Ivb-2884
	for linux-riscv@lists.infradead.org;
	Sat, 13 Dec 2025 02:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 329FC42A39;
	Sat, 13 Dec 2025 02:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB322C4CEF1;
	Sat, 13 Dec 2025 02:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765592783;
	bh=GxZ2vw8FKYPTlfiJQoVsAuSjIXnuG/3EJIeoU+E10uw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RmrF5tPHeByyOtMog27xcrcdFsh18kiULGV816VrJwQFhAKivhf1MRWC+UDv9Y/L5
	 vnpfglzhUeNPXk+urijXHOrQUFv+BZbiwr4zws2qmPasTnZM03gRX1Eh0CB5ZB7u5/
	 hEQNcYfTo57CmRHdpW4DnnAgwKk9IgtwzEaAOBiHAPDRuK5nWSGI6EBrpi3SKMhIRI
	 goTpFvY6jg+UTbhdqRlLA9ti58p4EXUAIplwEFZ1TAPNZ8BiAESdRaRdMS+1f6s9oJ
	 xKVGermCeW4p2nz+0WDOtMeUqJaGLa4yF/5D1N2fzcdvspFOUfl15a5Q5IHdN6cRCv
	 KjxaMOtZqnGOw==
Date: Fri, 12 Dec 2025 19:26:16 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Paul Walmsley <pjw@kernel.org>, sfr@canb.auug.org.au, 
    akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V updates for the v6.19 merge window (part
 two)
In-Reply-To: <CAHk-=wiBP2B788uvFxyiy38JvtTb_3HrbjABWkCyXf_Rxbo4vQ@mail.gmail.com>
Message-ID: <736f7ecb-f1fd-5dec-9cb5-88e2d241eda3@kernel.org>
References: <98b74397-05bc-dbee-cab4-3f40d643eaac@kernel.org> <CAHk-=wiBP2B788uvFxyiy38JvtTb_3HrbjABWkCyXf_Rxbo4vQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_182625_567789_918812E3 
X-CRM114-Status: GOOD (  19.35  )
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

On Sat, 13 Dec 2025, Linus Torvalds wrote:

> On Fri, 12 Dec 2025 at 14:36, Paul Walmsley <pjw@kernel.org> wrote:
> >
> > Please pull this second and final set of RISC-V patches for the v6.19
> > merge window.  The primary addition in this pull request is support for
> > CFI in user processes.  This series has been around for almost two years.
> 
> It can damn well be around for another release then.
> 
> Because I'm really tired of these late pull requests. That's true in
> general, but it's particularly true when I've told people I'm
> traveling with a laptop. I was spending extra time the first week of
> the merge window to get things out of the way so that I would *not*
> have to deal with conflicts etc when on the road.
> 
> I appreciate people who send me a second pull request with *fixes* for
> the first one because they are starting to already react to bug
> reports. But your whole thing where you think you send me a first pull
> request and then a second one late in the merge window with more
> development is simply not ok.

It won't happen again.  Thanks for the feedback.  We'll get the CFI series 
early into linux-next for v6.20.

> Either it was ready to go early, or it's not ready to go at all. None
> of this "I have more presents for you".
> 
> The merge window is not for late development or for "Let's make extra
> work for Linus the last day of the merge window when he's on the road
> in a strange time zone"


Understood, and sorry for the noise,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
