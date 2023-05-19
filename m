Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E167EC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 10:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQ5Lg51sKmJhYekMjJGK55W7FgRGwgn+5mrFpaVWV+4=; b=1yGjI7rU24PX3x
	n6pcvjfkj1CYgBUo5suH+K6uF6puHvqs51/hFjR4iWkvLmiG9TfbS+GJVXb/wwFMD6PRK0l66qi/F
	KxVjeREOQn+Xj+dAUyhtb3STJcREQmHtDF3VnTdgZjY2MCDs4izFqIk7wVpgIrNjjbMl6A2vQjrN+
	bW0sof9esqUh5SnwifuP4lDwxSiNBix+Ajqq4oIt3iDVv/WZqXdMV9jQ2jcxyNHzmls9YsCW2oIuj
	BPGIUiQhkATWBPaYV15a+L5apJkOHQwXOodAUnTW0tCoSeiRnWeoHVGAK9cJe2xdHhUEenVuuyJkV
	9aDK2SCay8pBufSd45YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzxCk-00FsJb-0l;
	Fri, 19 May 2023 10:19:22 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzxCf-00FsIz-2h
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 10:19:19 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 34JAJAlK005895;
	Fri, 19 May 2023 12:19:10 +0200
Date: Fri, 19 May 2023 12:19:10 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, Palmer Dabbelt <palmer@rivosinc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] tools/nolibc: riscv: Fix up compile error for rv32
Message-ID: <ZGdNHv/QmAGBIYsM@1wt.eu>
References: <cover.1684425792.git.falcon@tinylab.org>
 <20230519094030.GA24947@1wt.eu>
 <c5140f54-99f2-4d7f-8b53-bd3cd1093727@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5140f54-99f2-4d7f-8b53-bd3cd1093727@t-8ch.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_031918_768378_875B7F32 
X-CRM114-Status: GOOD (  18.82  )
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

On Fri, May 19, 2023 at 12:11:00PM +0200, Thomas Wei=DFschuh wrote:
> Hi Willy,
> =

> On 2023-05-19 11:40:30+0200, Willy Tarreau wrote:
> > Hi Zhangjin,
> > =

> > On Fri, May 19, 2023 at 01:00:18AM +0800, Zhangjin Wu wrote:
> > > Hi, Willy
> > > =

> > > nolibc for riscv is only tested for rv64 currently (see
> > > tools/testing/selftests/nolibc/Makefile), this patchset tries to let =
it
> > > compile for rv32, but still not pass the nolibc selftest:
> > > =

> > > * The first patch uses lw/sw instead of ld/sd for rv32 and verse-vice=
 for rv64
> > >     * This patch may conflict with the stackprotector patch [1], beca=
use
> > >       both of them changed the _start assembly in arch-riscv.h
> > =

> > That's quite embarrassing, I'm having to trace of that series here. Now
> > I can find it in my LKML archives, but I don't have the direct message =
and
> > didn't spot the other ones. I'll have to investigate, thanks for notify=
ing
> > me! I'm CCing Thomas, I will check with him how to best merge the two.
> =

> I think the conflict should be trivial to fix.
> =

> I can also resend my series or just the single riscv patch.

OK then I'll pick Zhangjin's series and will apply yours on top of it.
Do not bother resending the whole series, only the riscv patch will be
sufficient, I have the rest of your series in my lkml mbox.

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
