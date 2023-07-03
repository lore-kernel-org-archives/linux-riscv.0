Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8C9EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8jKLmJlLlOsnMUF5Hg9DvoGpaseSNY02T62MXlD7h4=; b=FlUirydiRnsg8y
	ZxaT87GOO5IPb7uAfqZf0BHqSRnn2jUK42SSw77zDyeRaAuK416JTULZlg0ciOFVTxQG08S0ZzZLj
	xBJM4BhEYSveejFp2kD+vuPncPHiCOMqgWIj5pVXzJ+8bUP1E7rKUieXRvyGGo4rm3EMw1qa4Va90
	Vdani3elB0OfTrbQbPoyVSxhUz6ExAxqSgU2EZ/KrGKYXQJ3BM+ohb9vEJM7M9fGxe+EUrPUfsulK
	RfpDJErGWxFe7Eb1pXwhtP29HyE2aya5UeOlaTYpbfd8dkvulUMBZQ1M+K7hjcGz7CxG9EWMTLjfn
	sOjcb7Pl9wEdjt2a+RZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGKxg-00AnzI-02;
	Mon, 03 Jul 2023 14:55:32 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGKxc-00AnyB-1Y
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 14:55:31 +0000
X-QQ-mid: bizesmtp91t1688396105toirk3qq
Received: from linux-lab-host.localdomain ( [119.123.131.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Jul 2023 22:55:04 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: wF64VgvUy+XW25I0Wt/l4ClCmQe+EcewDJAv2OzfTTi1/Kqk/exL/s/rgKMIW
	7enRh87YMrErrt6GxFYbLCbURLdcXBq3YM5IZBc0yJlpq1xkQJAhMAbSsHbBu3FbxTc/77w
	xYNDnfsHlH9m1hqqGp6sjqp72HxCGvSx5l9mFmxPUeJF2lNI2U8UkjPmYQ0AMFrDD/M+aqf
	creE7SXPGgWcgDWP1o1OzC9/Xhlqka+E46ZTWcTd5oo9scK+UI8GzPjkIM2S27VUoHQ+4ZP
	AMOrO0AUPU2SseunmD1MuqKx7Kf2bDB2/o/W5GrX/AD4mdaRsDdmjeEGAcUVE9iRQu9VQiz
	6ZWSYUmk2gT5UsSmtW6hxxsFUeG+ZQLBfr/NlfPcdRUwsFW+9lZfFWICrW1JQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7014001186347428389
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	w@1wt.eu
Subject: Re: [PATCH v1 03/11] tools/nolibc: include crt.h before arch.h
Date: Mon,  3 Jul 2023 22:55:00 +0800
Message-Id: <20230703145500.500460-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <8efbbfe5-1c3f-46df-9bc3-2ba62015f17e@t-8ch.de>
References: <8efbbfe5-1c3f-46df-9bc3-2ba62015f17e@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_075528_842142_CDE5C7A9 
X-CRM114-Status: GOOD (  20.91  )
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

> On 2023-07-03 17:58:32+0800, Zhangjin Wu wrote:
> > Hi, Thomas
> > 
> > > 
> > > On 2023-06-29 02:54:35+0800, Zhangjin Wu wrote:
> > > > The crt.h provides a new _start_c() function, which is required by the
> > > > new assembly _start entry of arch-<ARCH>.h (included by arch.h), let's
> > > > include crt.h before arch.h.
> > > > 
> > > > This '#include "crt.h"' doesn't let the new _start_c() work immediately,
> > > > but it is a base of the coming patches to move most of the assembly
> > > > _start operations to the _start_c() function for every supported
> > > > architecture.
> > > 
> > > Why don't the arch-*.h files include this new header?
> > > They are the users of the new symbol.
> > >
> > 
> > I have tried so, but since crt.h itself is not architecture specific, add it
> > before arch.h will avoid every new arch porting add the same thing again and
> > again, currently, we only need to add once. I have even planned to move
> > compiler.h out of arch-*.h, but not yet ;-)
> 
> While this saves a few lines of code in my opinion it hurts clarity to
> rely on implicitly pre-included things.
>

To be clearer, what about split the arch.h to sys_arch.h (my_syscall*)
and crt_arch.h? (_start part) and then, we can include crt_arch.h in
crt.h and at the same time, include sys_arch.h in sys.h, and at last
we need to create a <ARCH> directory for the them.

    crt.h:
        #include "crt_arch.h"

	_start_c ()

    sys.h:
        #include "sys_arch.h"

	sys_xxx()
	{
            my_syscall<N>(...)
	}

    crt_arch.h:

        #ifdef ARCH
        #include "<ARCH>/crt_arch.h"
	#endif

    sys_arch.h:

        #ifdef ARCH
        #inculde "<ARCH>/sys_arch.h"
	#endif

I just found musl uses such structure ;-)

> > every new arch porting
> 
> That doesn't seem like a very frequent occurrence :-)
>

Yes, it is not often.

> > And also, crt.h may require more features in the future, like init/fini
> > support, it may be not only used by arch-*.h files.
> 
> Do you have a mechanism in mind that supports init/fini without needing
> an ELF parser at runtime? I guess an ELF parser would make it a complete
> no-go.
>

I didn't really think about this yet ;-)

> Also the value added by init/fini seems fairly limited for a statically
> linked (tiny) application.
>

Yeah.

Thanks,
Zhangjin

> > [..]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
