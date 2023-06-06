Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D628C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 04:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uK4HaTjz1otDiFAXONV5NVeY1K++jiUKBIekMf0gWc4=; b=2tJulRXsT5Or5m
	aA+2wIewcW+IkAklq4i1UM8ig4H4UWCt/jDVCUV+5/mRHud2N6anGEKhr4NxugxiLofrvXWZ7lRyT
	ggyyKNrpnD/GWOk8v6crtgjYQ+hLffJa6J5RsRxbjYKpiw3YNd0VPuhncdHtb0edxBiRst2BkozGZ
	iWpcjQ2tbq+dyd6N06qPTJ6X5b577C1A+w46k4CkPU/j6XpptIIP048OuiCBkN1WIIbJM8wnLIOR3
	ZWpDg6/bx50uCJ1N1NUdSKbsPWJCR2yolB2zwgrQDVzGm3oOJ8aHMH+RhrG7KJ6wap93SLh9R92ni
	y3ysyTB9mio7mZ5ZLLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6OXL-000A26-09;
	Tue, 06 Jun 2023 04:43:15 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6OXH-0009z0-18
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 04:43:13 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3564geIU017411;
	Tue, 6 Jun 2023 06:42:40 +0200
Date: Tue, 6 Jun 2023 06:42:40 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v3 0/3] nolibc: add part2 of support for rv32
Message-ID: <ZH65QKQ1dlY+HsK7@1wt.eu>
References: <cover.1685780412.git.falcon@tinylab.org>
 <20230606042535.354118-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606042535.354118-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_214312_385985_21819FE0 
X-CRM114-Status: GOOD (  15.21  )
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

Hi Zhangjin,

On Tue, Jun 06, 2023 at 12:25:35PM +0800, Zhangjin Wu wrote:
> The first two convert all compile failures to a return of -ENOSYS, if you do
> like it, welcome your Reviewed-by. These two are required by the coming new
> time64 syscalls for rv32, because they depends on how we cope with the
> unsupported syscalls, returning -ENOSYS is really better than simply fail the
> compiling.

I had a look now and I can sya that I like this. Initially the supported
syscalls were so restricted that it was not even imaginable to accept to
build without any of them, but now that we're completing the list, some
of them are less critical and I don't see why we'd fail to build just
because one is missing. So yeah, a big +1 for -ENOSYS.

> The third one is not that urgent, because some important syscalls are
> still missing for rv32. It is added here only for compile test.

I personally have no opinion on this one. I can't judge whether it will
make things easier or more complicated at this point. It seems to me
that for now it's just avoiding one extra line at the expense of some
$(if) on several lines. Maybe it could help add more such archs, or
maybe it can make them more complicated to debug, I don't know. I'm
interested in others' opinions as well.

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
