Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB62BC7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 06:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIY97QrfAeb9CyMy00XZ1/CI6dBd6MKpWR/PUxIaHj8=; b=rC3sE4BNGiQCrN
	rHJCyR8KfvFwdh7bjhN3Xa5H0D1QWMTp9nAUBWkC12A3WF/RygHouRj/9Ofc16r3o97d1qwSQoAeP
	HJKELNW7ZDoCoROhaKbcCws8rPo1q+rujdhCqC3GXsQb0DmJEP2MJTByUqE2JlGBfPB4YCz/oHIh8
	xkrsRnnowUZuaRl0TwWEQnsajE/y2P8yNro49+fxbRuowUaCD7y7Ofuip5ZXA4SAMrm+BkxjamKyq
	tIoOc31bLsQxi8kjq2dWj7RqVXcUxqw2xB4xVkuYSM8X459nlCpNfxl2E3Lov8/9DtRDmPwg6nhI5
	Jo1ocOnWJV9PURAGsxdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QRq-000PxV-0D;
	Tue, 06 Jun 2023 06:45:42 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QRm-000Puj-11
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 06:45:40 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3566jWuo018103;
	Tue, 6 Jun 2023 08:45:32 +0200
Date: Tue, 6 Jun 2023 08:45:32 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v3 0/3] nolibc: add part2 of support for rv32
Message-ID: <ZH7WDDgACvzVzV6e@1wt.eu>
References: <ZH65QKQ1dlY+HsK7@1wt.eu>
 <20230606063421.355411-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606063421.355411-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_234538_790949_2EEF6FBF 
X-CRM114-Status: GOOD (  29.18  )
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

On Tue, Jun 06, 2023 at 02:34:21PM +0800, Zhangjin Wu wrote:
> Willy, Thomas, Arnd
> 
> > Hi Zhangjin,
> > 
> > On Tue, Jun 06, 2023 at 12:25:35PM +0800, Zhangjin Wu wrote:
> > > The first two convert all compile failures to a return of -ENOSYS, if you do
> > > like it, welcome your Reviewed-by. These two are required by the coming new
> > > time64 syscalls for rv32, because they depends on how we cope with the
> > > unsupported syscalls, returning -ENOSYS is really better than simply fail the
> > > compiling.
> > 
> > I had a look now and I can sya that I like this. Initially the supported
> > syscalls were so restricted that it was not even imaginable to accept to
> > build without any of them, but now that we're completing the list, some
> > of them are less critical and I don't see why we'd fail to build just
> > because one is missing. So yeah, a big +1 for -ENOSYS.
> >
> 
> Cool, I will prepare the new patchsets on them, welcome your new branch
> with both of them, of course, still weclome Reviewed-by from Arnd and Thomas.

I don't even think a new branch is needed, I can take them as-is it seems.

> > > The third one is not that urgent, because some important syscalls are
> > > still missing for rv32. It is added here only for compile test.
> > 
> > I personally have no opinion on this one. I can't judge whether it will
> > make things easier or more complicated at this point. It seems to me
> > that for now it's just avoiding one extra line at the expense of some
> > $(if) on several lines. Maybe it could help add more such archs, or
> > maybe it can make them more complicated to debug, I don't know. I'm
> > interested in others' opinions as well.
> 
> As I explained why we did it in current way in this reply [1], Thomas had no
> more questions on it, so I think Thomas was happy with it now and I got his
> only left suggestion is that may be this patch should be applied after the
> missing 64bit syscalls being added for there are several important test
> failures currently, for me, it is ok before or after.
> 
> Thomas, welcome your Reviewed-by on the makefile patch itself If you are really
> happy with it now, thanks very much ;-)
> 
> Willy, I will send the v2 syscalls helpers (also required by the coming 64bit
> syscalls) and some other patches (mainly for test with faster kernel build)
> about selftests/nolibc later, because we have not enough time for v6.5 test,
> so, I suggest we can create new branch for v6.6 and my new patchsets will be
> for v6.6.

Agreed, thank you!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
