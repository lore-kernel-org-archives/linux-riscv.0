Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645CEEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 09:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tiCDwNVGp/rRMtZk1OZeqhgGIwbRM/MrHNZwwkfH9BQ=; b=b7WdOHGVbLlaZR
	mh8E9+SQg4wJ7clgMhfzN/8xC3vPogtTLsR1sDd8ALbg/ObDNiSPwlVp24sQQZ7z7XEU+J2BqmzAu
	whqQ6KPMOQmAYXNALieb5AaHHNhYgLIDis0WfEZuTrVbgOUayuLk5fkYjjsI9ntapav/1HX0QtkSs
	Twh1b/kR4KGZJ4sfl5LBYSMfa5yL1kUqPf58+rQhIai6rKsd5L6FS2mFfceDvcJMRWI8JYVYYCANA
	gfMoU/0aHzmJsWB8nlqLd2sv5ARosIMwXg89YcM4ZGwM6Az3+q8iAwDPGml7nNJTn67gZoaBI4pIp
	Rl7lHpoZfT1Iui4n+t0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGKc-00A2RO-0J;
	Mon, 03 Jul 2023 09:58:54 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGKY-00A2PU-33
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 09:58:53 +0000
X-QQ-mid: bizesmtp79t1688378314to1hdzr5
Received: from linux-lab-host.localdomain ( [119.123.131.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Jul 2023 17:58:33 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: swyrzWPvyR2MHnEm0gEV1f52S7C1AsQZQ8BAWWwXSoI4RGVChMko0pt9DVKSn
	8hALMuPjl9kFUwWdtEjIlPuRYHSPZghjqqEaIvzXTdd9rwqgZwWZhRJ0GbLQDAlNB42qiqI
	Gcd24WBNFPRfXCwNAwNTXq6fMAmlUE4SgB+VlBwcczsRgD9sH9c6UN3WWMAxQSJ0WvF0AdH
	aO8Lijwo1OTGHcbjuRdyXxJzDs1ByHvoJwprheuyS+FQZDmdsvpoWCRELEyn+VhVfawYvw2
	ZtYl3euUkf8nLT0YgGvP8eaqjTYMe75UMPW8hGaGlxxH5LD/FuWRiN0WieEvAVcjaj5emKS
	hFS60sGyhllezb+ILTwLzm19IPjANH0XIS1292ny9aHMvvuMTycIKeeknMUww==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18250716996633539476
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	w@1wt.eu
Subject: Re: [PATCH v1 03/11] tools/nolibc: include crt.h before arch.h
Date: Mon,  3 Jul 2023 17:58:32 +0800
Message-Id: <20230703095832.493137-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e1cf8fd3-f8cd-4c3c-9f8c-24bbc0a7cde3@t-8ch.de>
References: <e1cf8fd3-f8cd-4c3c-9f8c-24bbc0a7cde3@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_025851_300557_D07FB67E 
X-CRM114-Status: GOOD (  17.52  )
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

Hi, Thomas

> 
> On 2023-06-29 02:54:35+0800, Zhangjin Wu wrote:
> > The crt.h provides a new _start_c() function, which is required by the
> > new assembly _start entry of arch-<ARCH>.h (included by arch.h), let's
> > include crt.h before arch.h.
> > 
> > This '#include "crt.h"' doesn't let the new _start_c() work immediately,
> > but it is a base of the coming patches to move most of the assembly
> > _start operations to the _start_c() function for every supported
> > architecture.
> 
> Why don't the arch-*.h files include this new header?
> They are the users of the new symbol.
>

I have tried so, but since crt.h itself is not architecture specific, add it
before arch.h will avoid every new arch porting add the same thing again and
again, currently, we only need to add once. I have even planned to move
compiler.h out of arch-*.h, but not yet ;-)

And also, crt.h may require more features in the future, like init/fini
support, it may be not only used by arch-*.h files.

> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/include/nolibc/Makefile | 1 +
> >  tools/include/nolibc/nolibc.h | 1 +
> >  tools/include/nolibc/signal.h | 1 +
> >  tools/include/nolibc/stdio.h  | 1 +
> >  tools/include/nolibc/stdlib.h | 1 +
> >  tools/include/nolibc/sys.h    | 1 +
> >  tools/include/nolibc/time.h   | 1 +
> >  tools/include/nolibc/unistd.h | 1 +
> >  8 files changed, 8 insertions(+)
> > 
> > diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
> > index 875e13e3c851..00471e59b11e 100644
> > --- a/tools/include/nolibc/Makefile
> > +++ b/tools/include/nolibc/Makefile
> > @@ -37,6 +37,7 @@ NARCH            = $(or $(NARCH_$(ARCH)),$(ARCH))
> >  arch_file := arch-$(NARCH).h
> >  all_files := \
> >  		compiler.h \
> > +		crt.h \
> 
> This should be part of the patch adding the file.
>

Ok, thanks very much.

Best regards,
Zhangjin

> >  		ctype.h \
> >  		errno.h \
> >  		nolibc.h \

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
