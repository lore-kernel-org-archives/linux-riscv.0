Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8B1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ua9/OEFhJrs3+XNueXiRtNeV2KgbabcYQM0oD5otw8U=; b=D5+aXlML1D8ato
	kB9Sa3KOoydoAFvUkmG7TrelB5uEZfBbMqMOXCHPJNs7+ri1WiCsqiibFLp7yeFbdQ+Iip1xKLX0G
	JuoqlXXBYCLRfzm9TPQrCLx34WtwvdM9bqzskZ+JH9jtvoU0sJonaHgUzA1tZAxXwU9M8YUY5Emm9
	Sb3TXKuN1U1eiLmdss0sSiKImo49NoImh6QDYw9vpwlDodX1oHrtVj7G+ST2ckTtI5IgFXBVdfCwW
	s/xE0X6ODcWsLpiBAipGy29uqskJ2hTuA5CPxdPTUQDj1Ls3T6/Sy+rIF0/XSGU8BgYR3Wtmh+7IU
	KqDT4Idf/5hHUd87wXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxy9-00EGAX-6h; Tue, 17 May 2022 14:14:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqxxU-00EFuk-Gm; Tue, 17 May 2022 14:14:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60CF6615C7;
 Tue, 17 May 2022 14:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E63AC385B8;
 Tue, 17 May 2022 14:13:52 +0000 (UTC)
Date: Tue, 17 May 2022 10:13:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Li kunyu <kunyu@nfschina.com>
Cc: mingo@redhat.com, linux@armlinux.org.uk, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 liqiong@nfschina.com
Subject: Re: [PATCH] kernel: Ftrace seems to have functions to improve
 performance through optimization  through optimization
Message-ID: <20220517101351.273b385f@gandalf.local.home>
In-Reply-To: <20220513021314.59480-1-kunyu@nfschina.com>
References: <20220512110725.22e69e3c@gandalf.local.home>
 <20220513021314.59480-1-kunyu@nfschina.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_071356_662904_A8FAEA12 
X-CRM114-Status: GOOD (  14.06  )
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

On Fri, 13 May 2022 10:13:14 +0800
Li kunyu <kunyu@nfschina.com> wrote:

> Subject: [PATCH] kernel: Ftrace seems to have functions to improve performance through optimization  through optimization

Did you forget to add a subject line. The above looks to be the beginning
of the paragraph below.


> Date: Fri, 13 May 2022 10:13:14 +0800
> Message-Id: <20220513021314.59480-1-kunyu@nfschina.com>
> 
> such as ftrace_ARCH_code_*, return 0, so the FTRACE_* check is not required

And even combined, the above makes no sense.

This patch is not an optimization patch. If it were, the optimization
provided is so small, it's not worth adding it.

Just state that it's a clean up (I already told you this). Here, I'll do
the work for you (but I expect a proper patch):

  Subject: [PATCH v2] ftrace: Remove return value of ftrace_arch_modify_*()

  All instances of the function ftrace_arch_modify_prepare() and
  ftrace_arch_modify_post_process() return zero. There's no point in
  checking their return value. Just have them be void functions.

There, that's what I would like to see.

-- Steve


> 
> Signed-off-by: Li kunyu <kunyu@nfschina.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
