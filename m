Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0512C77B73
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6TknB71VhCrnI8glWB3l+kvdukusZimH+akt4Ap2+U=; b=VWpBuA1F5JjjOf
	f2Ht+eCagOeQRcAvXrjEo7Q2vGU4I8yTfgh6ImS4k91sLfN4gHqLDHKqR1Jdp/enmrjmdwffO3kBB
	aFgMSooM3yvRfc4khsvOvU/u6t0Hvt2d69poRKDtsXhw2duN1uZVaybdqj6kuNGAAmhWvF7kWc+s9
	5i89QYEWunDrNOQ1qHzVaz76J+P3E7W5Hz1SopC9PztxitGfLBfkSpSQHxHOHW8LdoQO4JS4vcFdj
	pnt+eJY70Ntj/9oy9ysQONaLy4LIx+WdRTD9LoEh/QkouTzPHfd939G8zehCIyA7cnZNj340lDFAP
	tYKnQlPK7cHCWLjuC4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5mBZ-00C3ik-0o;
	Sun, 04 Jun 2023 11:46:13 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5mBV-00C3iE-2r
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 11:46:12 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 354Bk6rF001904;
	Sun, 4 Jun 2023 13:46:06 +0200
Date: Sun, 4 Jun 2023 13:46:06 +0200
From: Willy Tarreau <w@1wt.eu>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Zhangjin Wu <falcon@tinylab.org>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-kselftest <linux-kselftest@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 11/12] selftests/nolibc: add new gettimeofday test
 cases
Message-ID: <ZHx5fghesYtnpPoi@1wt.eu>
References: <cover.1685777982.git.falcon@tinylab.org>
 <68dace9e2532316ff454894697ecfd99e419a523.1685777982.git.falcon@tinylab.org>
 <2fccaff5-2354-4ac0-8389-1004d47d8dc9@t-8ch.de>
 <tencent_4668A50A08C3D31E7531619E@qq.com>
 <51e1db37-3981-4ea5-9348-b6f6b31ecc8a@app.fastmail.com>
 <ZHx1OliMqHx9U1Lw@1wt.eu>
 <54edae1f-0c1c-4beb-b6ac-fcd61fc81de8@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54edae1f-0c1c-4beb-b6ac-fcd61fc81de8@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_044610_805351_44CFC2B4 
X-CRM114-Status: GOOD (  11.32  )
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

On Sun, Jun 04, 2023 at 01:38:39PM +0200, Arnd Bergmann wrote:
> > Over time we managed
> > to make simple code compile with both glibc and nolibc, but when it
> > comes at the cost of adding size and burden for the developers, such
> > as forcing them to add libgcc, I prefer that we slightly limit the
> > domain of application instead.
> 
> Good point. This also reminds me that the compilers I build for
> https://mirrors.edge.kernel.org/pub/tools/crosstool/ don't always
> have every version of libgcc that may be needed, for instance
> the mips compilers only provide a big-endian libgcc and the
> arm compilers only provide a little-endian one, even though
> the compilers can build code both ways with the right flags.

That reminds me something indeed, I know that MIPS is a great platform
for testing portability due to libgcc and/or atomics not always being
complete depending how it's built. At work when I double-check that
haproxy still builds and starts on my EdgeRouter-X, then it will build
everywhere ;-)

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
