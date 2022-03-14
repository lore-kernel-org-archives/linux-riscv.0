Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219DEC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 10:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7oKZ/N4TqHW28SPZyhztayqH7NAtR4udrHpj2c7Jbo=; b=1sl63FOU0k6/nv
	7BhniWUshRDV5rdbUqgG+kB1NvNSTkjSrIoRzWolNkcZAwPslV4+CK91VObH6nBSYLGhJ55Jl80bu
	l3RBcxpFdxzZUx7SLZdgYzm8TlSciGkuTQP6EnLhFObXsfWV300Ov8wRxcqGywjBrbFZSHGh+akxf
	JuuCy4A1b0eAQGXdYkTLAOwrJdIjMbCaWLrkY2pFXOSC6s+s21bqz7wt89r95Z1I7eD3aFZ2PBCfy
	5nMCKMPj22UjrvKeFz3J36GC9yJpKf8BIUd+DU215yewo5oGayM3cpq7s5KUYuvazMSnoq82LjubZ
	007nAzbxipuO6BeY+YLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTiBN-00513r-LR; Mon, 14 Mar 2022 10:44:09 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTiBJ-00511f-UV
 for linux-riscv@lists.infradead.org; Mon, 14 Mar 2022 10:44:07 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-405-xB69G3nOOuef7tBQjIgr_Q-1; Mon, 14 Mar 2022 10:43:59 +0000
X-MC-Unique: xB69G3nOOuef7tBQjIgr_Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Mon, 14 Mar 2022 10:43:58 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Mon, 14 Mar 2022 10:43:58 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dmitry Vyukov' <dvyukov@google.com>, syzbot
 <syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com>
CC: "davem@davemloft.net" <davem@davemloft.net>, "dsahern@kernel.org"
 <dsahern@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
 "yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>, linux-riscv
 <linux-riscv@lists.infradead.org>
Subject: RE: [syzbot] kernel panic: corrupted stack end in rtnl_newlink
Thread-Topic: [syzbot] kernel panic: corrupted stack end in rtnl_newlink
Thread-Index: AQHYN4MkQzi6nDqsbUGqHyChCsNTUKy+sQcw
Date: Mon, 14 Mar 2022 10:43:58 +0000
Message-ID: <fb12b19d57c34928895e0faa8067f64c@AcuMS.aculab.com>
References: <0000000000008ec53005da294fe9@google.com>
 <CACT4Y+YXzBGuj4mn2fnBWw4szbb4MsAvNScbyNXi1S21MXm8ig@mail.gmail.com>
 <CACT4Y+a1AvU4ZA3BXPpQMQ15A2T0CT_mrNTXv0NttJ0B06fH=w@mail.gmail.com>
In-Reply-To: <CACT4Y+a1AvU4ZA3BXPpQMQ15A2T0CT_mrNTXv0NttJ0B06fH=w@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_034406_277323_D51AEABF 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

From: Dmitry Vyukov
> Sent: 14 March 2022 09:09
> 
> On Mon, 14 Mar 2022 at 09:22, Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > On Mon, 14 Mar 2022 at 09:17, syzbot
> > <syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot found the following issue on:
> > >
> > > HEAD commit:    0966d385830d riscv: Fix auipc+jalr relocation range checks
> > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=17fe80c5700000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=6295d67591064921
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=0600986d88e2d4d7ebb8
> > > compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for
> Debian) 2.35.2
> > > userspace arch: riscv64
> >
> > +linux-riscv
> >
> > Riscv needs to increase stack size under KASAN.
> > I will send a patch.

With vmalloc()ed stacks is it possible to allocate an extra page
of KVA that isn't backed by memory as a 'guard page' so that
stack overflow faults immediately?

Probably worth enforcing for KASAN builds where the compilers
have a nasty habit of using lot more stack space that might
be expected.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
