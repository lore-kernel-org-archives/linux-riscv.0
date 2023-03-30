Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691B6C761A6
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kg3sx7/Lq0UfpaDFxHWBnzVEXKh58ugU+hYt/Sq0G3c=; b=KGYDv0vBI0kyD3
	48NzEv5+yLRwFqkwMlIFDsTM9j8llifbehnZ6TP6j3PitNnq5bc7PG39SKMFTgom7Ep/DZpJsI2Q0
	GVrmxLhl8uWvMMVaBg15NMmq7BYACtO+aRLkRlCtOADmFnMRCQu9ypPwrQ/8iWf+dRxt9/0QK1n5h
	e6UYRSzWzmLaugDCOg4ytsI6C5u9YsUhMcpFSH0KeRmSEk1enijhB+kAd45HfgZcgIV+2/LXsWo2G
	uMz+rt8giL5ZI9IIJZc8xHbePNd56Pu9grJBFaEpn1Zncy378lktY4YOpRCP4OGjSRxxARe/tPRgd
	UdpNhGUY0Ha28FOINEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pht48-003zTI-1w;
	Thu, 30 Mar 2023 14:15:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pht44-003zR3-2c;
	Thu, 30 Mar 2023 14:15:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A53FACE2760;
	Thu, 30 Mar 2023 14:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04B9C433EF;
	Thu, 30 Mar 2023 14:15:28 +0000 (UTC)
Date: Thu, 30 Mar 2023 10:15:26 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Donglin Peng <pengdonglin@sangfor.com.cn>, mhiramat@kernel.org,
 linux@armlinux.org.uk, mark.rutland@arm.com, will@kernel.org,
 catalin.marinas@arm.com, rmk+kernel@armlinux.org.uk, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, tglx@linutronix.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 chenhuacai@kernel.org, zhangqing@loongson.cn, kernel@xen0n.name,
 mingo@redhat.com, peterz@infradead.org, xiehuan09@gmail.com,
 dinghui@sangfor.com.cn, huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
 linux-trace-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/8] function_graph: Support recording and printing
 the return value of function
Message-ID: <20230330101526.2c862a42@gandalf.local.home>
In-Reply-To: <20230330135948.GCZCWV1O/IjsxsBmN8@fat_crate.local>
References: <cover.1680176068.git.pengdonglin@sangfor.com.cn>
	<20230330135948.GCZCWV1O/IjsxsBmN8@fat_crate.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_071545_019759_BE0816A3 
X-CRM114-Status: GOOD (  18.60  )
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

On Thu, 30 Mar 2023 15:59:48 +0200
Borislav Petkov <bp@alien8.de> wrote:

> Please control your spamming:
> 
> From: Documentation/process/submitting-patches.rst
> 
> Don't get discouraged - or impatient
> ------------------------------------
> 
> After you have submitted your change, be patient and wait.  Reviewers are
> busy people and may not get to your patch right away.
> 
> Once upon a time, patches used to disappear into the void without comment,
> but the development process works more smoothly than that now.  You should
> receive comments within a week or so; if that does not happen, make sure
> that you have sent your patches to the right place.  Wait for a minimum of
> 						     ^^^^^^^^^^^^^^^^^^^^^
> 
> one week before resubmitting or pinging reviewers - possibly longer during
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> busy times like merge windows.

To be fair, this isn't a ping or a resend. It's addressing comments that
were given in v8 that was sent out on Tuesday.

This isn't v1, where I would agree with waiting a week for comments. v1 was
sent back in 3/6. I do not expect (nor want) someone to wait a week on v8
for all feedback to come in, unless it was a redesign of the code. But it's
now starting to settle, and that "week waiting" period isn't necessary for
fixing up minor suggestions by the reviewers.

I was hoping this would be good to go by the end of the week, so I could
get it into linux-next by next week.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
