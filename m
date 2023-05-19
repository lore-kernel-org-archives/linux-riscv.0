Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25682C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLuKW8Q+pqotQc6mhwnTOR6t4P2HL/MxQ6sdjYp3e1I=; b=SqsyVRaK/aMKXF
	lL6u2vbVEE71l8s9nJc76vXIJavVClSIPY26uRilK5qR76+1RGRelHN8uJyjMc998Z3M10tgd/sWQ
	I38Yy3ew7xJKUOl6IqIPV+NBIsc2wb1ogm4LISST/4L1mnU6u9BhJvVHYXzB9XD3z1KzeT9ZKMf/u
	8QIzg6JNs7U8PrrV1PYJjKEacp17cV2f/NFm56vnQGlnDf23lzkkVdBbXvZLD3ljbueJJ+QBPiDnj
	D093k9tR14GDwGtSOEAuEa0vCZ+S9VMoqlTPeHZ3tI6H60segixqmarORGXeTKwLP63PoU7A/9i9M
	T2nV6UqaNYEmMV49534Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzx4q-00FrHV-37;
	Fri, 19 May 2023 10:11:12 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzx4n-00FrFF-0W
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 10:11:11 +0000
Date: Fri, 19 May 2023 12:11:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1684491062; bh=BnKI1wFlnT7b9jk8O+5vwIz927UI6o6heQwO+A058hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hm2Q61hygij7TXQsb0WOKAyTvP/4g8aTkuHcvdRlVmlanj28CwhY2264Zi1sZtA5f
	 2oVsfGRhuWLt7xdgA6TU0hAecM5iwndcUQEUgGEJZg+T/pkMWfgJi9VHIYIwGULR3k
	 7KIJk5DbjaIsz7UGp8jHFcFL3BUWGOM3WsJFutJo=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Zhangjin Wu <falcon@tinylab.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Paul E . McKenney" <paulmck@kernel.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] tools/nolibc: riscv: Fix up compile error for rv32
Message-ID: <c5140f54-99f2-4d7f-8b53-bd3cd1093727@t-8ch.de>
References: <cover.1684425792.git.falcon@tinylab.org>
 <20230519094030.GA24947@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519094030.GA24947@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_031109_663446_047EA0F1 
X-CRM114-Status: GOOD (  16.13  )
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

Hi Willy,

On 2023-05-19 11:40:30+0200, Willy Tarreau wrote:
> Hi Zhangjin,
> 
> On Fri, May 19, 2023 at 01:00:18AM +0800, Zhangjin Wu wrote:
> > Hi, Willy
> > 
> > nolibc for riscv is only tested for rv64 currently (see
> > tools/testing/selftests/nolibc/Makefile), this patchset tries to let it
> > compile for rv32, but still not pass the nolibc selftest:
> > 
> > * The first patch uses lw/sw instead of ld/sd for rv32 and verse-vice for rv64
> >     * This patch may conflict with the stackprotector patch [1], because
> >       both of them changed the _start assembly in arch-riscv.h
> 
> That's quite embarrassing, I'm having to trace of that series here. Now
> I can find it in my LKML archives, but I don't have the direct message and
> didn't spot the other ones. I'll have to investigate, thanks for notifying
> me! I'm CCing Thomas, I will check with him how to best merge the two.

I think the conflict should be trivial to fix.

I can also resend my series or just the single riscv patch.

<snip>

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
