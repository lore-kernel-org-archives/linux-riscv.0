Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B03DC77B73
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ujj1KEYnsSWD59hnVIh5Sm/BT0YD7AqBxHHygvs1ljs=; b=yDshXaPAVHelHg
	N7b7XK6ahXb1dK+QRIXWcNYToLhzFZ77iF5HBpvvYbrhuZmUXWNIXlokkr4xDmsuWRVNUDrTA1HNr
	Wi5eekyaNR5UPmV3m8UyXaeZL7zddAO0Zn/JBvkjTfkyszRzAfVdtXF0Q6wuq2RZCayaHHHsnVInr
	viyp70OVlVF54/Y6bAMcFPDZO+P/Lkab6Yh2n7U+wymijZpO4Yv5FQkeXtZOdD5yRR/SzCSCPhJyD
	OmqpS74qUguX3F/opIQi52eyft9jTX8DtcqESZG61nanATwvR7LZiZAaYpUW6O+XoC1xZN9Qd68y0
	Z2I6ucDPyuFrukI88jVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nEj-00CAqd-0e;
	Sun, 04 Jun 2023 12:53:33 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nEg-00CApD-1D
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 12:53:32 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 354CrO4h002296;
	Sun, 4 Jun 2023 14:53:24 +0200
Date: Sun, 4 Jun 2023 14:53:24 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 02/12] tools/nolibc: add missing nanoseconds support
 for __NR_statx
Message-ID: <ZHyJRJW872Ft1GeR@1wt.eu>
References: <cover.1685777982.git.falcon@tinylab.org>
 <bcb69a382bbb68826f974ef4f521c8f1c60e47bc.1685777982.git.falcon@tinylab.org>
 <ZHxzC6X5dgzmH+Ek@1wt.eu>
 <0c0537d6-5cba-43e9-8ca2-0e1605d64e8a@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c0537d6-5cba-43e9-8ca2-0e1605d64e8a@t-8ch.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_055330_854432_17678A0D 
X-CRM114-Status: GOOD (  19.98  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jun 04, 2023 at 02:00:02PM +0200, Thomas Wei=DFschuh wrote:
> On 2023-06-04 13:18:35+0200, Willy Tarreau wrote:
> > On Sat, Jun 03, 2023 at 04:02:04PM +0800, Zhangjin Wu wrote:
> > > Commit a89c937d781a ("tools/nolibc: support nanoseconds in stat()")
> > > added nanoseconds for stat() but missed the statx case, this adds it.
> > > =

> > > The stx_atime, stx_mtime, stx_ctime are in type of 'struct
> > > statx_timestamp', which is incompatible with 'struct timespec', should
> > > convert explicitly.
> > > =

> > >     /* include/uapi/linux/stat.h */
> > > =

> > >     struct statx_timestamp {
> > >     	__s64	tv_sec;
> > >     	__u32	tv_nsec;
> > >     	__s32	__reserved;
> > >     };
> > > =

> > >     /* include/uapi/linux/time.h */
> > >     struct timespec {
> > >     	__kernel_old_time_t	tv_sec;		/* seconds */
> > >     	long			tv_nsec;	/* nanoseconds */
> > >     };
> > > =

> > > Without this patch, the stat_timestamps test case would fail when
> > > __NR_statx defined.
> > > =

> > > Fixes: a89c937d781a ("tools/nolibc: support nanoseconds in stat()")
> > > Suggested-by: Thomas Wei=DFschuh <linux@weissschuh.net>
> > > Link: https://lore.kernel.org/linux-riscv/3a3edd48-1ace-4c89-89e8-9c5=
94dd1b3c9@t-8ch.de/
> > > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > =

> > Thank you. I've queued it immediately after Thomas' patch.
> > I'll let the two of you tell me if it's better to squash them
> > together to avoid breaking bisect and mark you co-authors.
> =

> Squashing them sounds like the correct solution to me.

OK I've done it for now in my branch. I'm going to push it as
20230604-nolibc-rv32+stkp6. All tests pass fine again for me now on
all supported archs. I'll pass this one to Paul, I think it's fine
for 6.5. I just don't know if he still has tests planned on his side
for 6.5 (Paul always re-runs the whole tests after integration and
often spots failures).

By the way, I'm still using my test-all script that's extremely
convenient to test the expected results from user-mode (it basically
does what run-user does, but for all archs and at -O0, -Os, -O3).

I'm sharing it attached since I think it can help you and Zhangjin in
your respective tests. That's how I'm cheating to spot build issues in
contributed changes. I have not committed it because it's ugly and I
don't know where to put it, but I think you'll find it convenient
nevertheless. I'm starting it like this:

   $ ./test-all-opts.sh | tee test16.out
   $ grep passed test16.out
   136 test(s) passed, 2 skipped, 0 failed. See all results in run-arm64.out
   135 test(s) passed, 3 skipped, 0 failed. See all results in run-arm-marc=
h=3Darmv5t_-marm.out
   135 test(s) passed, 3 skipped, 0 failed. See all results in run-arm-marc=
h=3Darmv5t_-mthumb.out
   135 test(s) passed, 3 skipped, 0 failed. See all results in run-arm-marc=
h=3Darmv7-a_-marm.out
   135 test(s) passed, 3 skipped, 0 failed. See all results in run-arm-marc=
h=3Darmv7-a_-mthumb.out
   136 test(s) passed, 2 skipped, 0 failed. See all results in run-i386.out
   136 test(s) passed, 2 skipped, 0 failed. See all results in run-i386-mar=
ch=3Di586.out
   (...)
   $ grep ' [^0] failed' test16.out || echo OK
   OK

Hoping this helps,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
