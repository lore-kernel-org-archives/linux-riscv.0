Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76145C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 07:53:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4476C6113A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 07:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4476C6113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjfDGwQCwH1MFohTsXPdn67JWBK3cfrXY3+RsjTJ3kk=; b=IzBCjp3xtSx7Q+
	s5M3dUKjKdxfx0f0SfNvnDzzuD//z91cf+11OpEZXPRPdq4cUv1APMuPvkVipcvwCWh4j3DLUWW+V
	DhDKz3J7QkBnuarl26Snsg2B20fvR8UY609Vg1aPijBDJtlDfj9bZ4ixE1ZMz+RQEL7vOHDzT1smY
	uSHdwLHtSAPQJBTwJx2vDkpIzmUUKzoyqkoKF1zohPCcwBB5kP3luRznCDvPaolyErAR9N9G6X4o6
	AYoNtSxstgN9d5xYC65RkCmJnMJbH37NgNttkiFZpSpeuJ0yObb4uU8UT8MFeZqFlI9g2a3U88s+H
	fUTOW4RM9Jd6oJrfx3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjzSk-00Fe3v-R8; Mon, 08 Nov 2021 07:53:06 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjzSW-00FdqC-8O
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 07:52:53 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4DAFD6732D; Mon,  8 Nov 2021 08:52:44 +0100 (CET)
Date: Mon, 8 Nov 2021 08:52:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: Wei Fu <wefu@redhat.com>
Cc: Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 liush <liush@allwinnertech.com>,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Gordan Markus <gordan.markus@canonical.com>,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>,
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>,
 Bill Huffman <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>,
 Richard Trauben <rtrauben@gmail.com>
Subject: Re: [RESEND PATCH V3 0/2] riscv: add RISC-V Svpbmt Standard
 Extension supports
Message-ID: <20211108075244.GA26350@lst.de>
References: <20211025040607.92786-1-wefu@redhat.com>
 <mhng-ac32ff92-86cb-4377-ba63-de1856e84fb1@palmerdabbelt-glaptop>
 <CAJF2gTT90V6gQw12XZEXB1TJXb5QNdXM6qcfXh1yzWzDPExgPQ@mail.gmail.com>
 <20211102055857.GB26925@lst.de>
 <CAJF2gTSfp+JZ4YxiynVA4KO0Z4PwJ4_uF8UO3Tx3mDOHPnFTeQ@mail.gmail.com>
 <CA+YCwK=vMtKC0DrhSJ7apgZ4s4_8fzGoRxY2mKEjjyJZjNW2QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+YCwK=vMtKC0DrhSJ7apgZ4s4_8fzGoRxY2mKEjjyJZjNW2QQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_235252_491329_9F6DE4AB 
X-CRM114-Status: GOOD (  11.25  )
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

On Sun, Nov 07, 2021 at 03:12:51PM +0800, Wei Fu wrote:
> How about
> 
> config RISCV_SVPBMT
> bool
> depends on 64BIT && MMU
> default y

Yes.  You can shorten this a bit more using def_bool if you want.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
