Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB80C77B73
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 11:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VogPP0VG+6pZrX9gPebvk+YZ033t6IhPNX81coGadKk=; b=29Tzp7xcI2Tnd1
	v1rLj5JGsI+PjY+gtPBRkRzWeAEqBXK4gkCw8n3JHx7y0d+V7sPSM1g+CJXhGFIFZSKiK2FOpBric
	Refl7xmTPm870xIt4DPiy/4fzQar1eCb6LIn+OXqJPm08rmMGd+mIvWKYbwBvpe9B6Rlqu49XBN3F
	Oo9ixhAjOtp7XXirg+V+xYnG1xqBZGZJOhJ7M/rhIslsXNsRAEpXS4bjfRSpZdIZIwWG+AXiw3Jpg
	WNB+BUn5yy8cniItUSR7Ar0Tv4b81EKpR1hvJ+Rv9n/OzvElaq/LfDTsODkhCl5PjmADNqTwG80YD
	1yV3QbpMlKnaxs5NqZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ltx-00C2CZ-1f;
	Sun, 04 Jun 2023 11:28:01 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ltu-00C2C5-0p
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 11:27:59 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 354BRs1j001843;
	Sun, 4 Jun 2023 13:27:54 +0200
Date: Sun, 4 Jun 2023 13:27:54 +0200
From: Willy Tarreau <w@1wt.eu>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Zhangjin Wu <falcon@tinylab.org>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-kselftest <linux-kselftest@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 11/12] selftests/nolibc: add new gettimeofday test
 cases
Message-ID: <ZHx1OliMqHx9U1Lw@1wt.eu>
References: <cover.1685777982.git.falcon@tinylab.org>
 <68dace9e2532316ff454894697ecfd99e419a523.1685777982.git.falcon@tinylab.org>
 <2fccaff5-2354-4ac0-8389-1004d47d8dc9@t-8ch.de>
 <tencent_4668A50A08C3D31E7531619E@qq.com>
 <51e1db37-3981-4ea5-9348-b6f6b31ecc8a@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51e1db37-3981-4ea5-9348-b6f6b31ecc8a@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_042758_752126_FD170783 
X-CRM114-Status: GOOD (  20.39  )
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

On Sun, Jun 04, 2023 at 11:24:39AM +0200, Arnd Bergmann wrote:
> On Sun, Jun 4, 2023, at 10:29, ??? wrote:
> >
> > Sorry for missing part of your feedbacks, I will check if -nostdlib 
> > stops the linking of libgcc_s or my own separated test script forgot 
> > linking the libgcc_s manually.
> 
> According to the gcc documentation, -nostdlib drops libgcc.a, but
> adding -lgcc is the recommended way to bring it back.
> 
> > And as suggestion from Thomas' reply,
> >
> >>> Perhaps we really need to add the missing __divdi3 and __aeabi_ldivmod and the
> >>> ones for the other architectures, or get one from lib/math/div64.c.
> >
> >>No, these ones come from the compiler via libgcc_s, we must not try to
> > reimplement them. And we should do our best to avoid depending on them
> > to avoid the error you got above.
> >
> > So, the explicit conversion is used instead in the patch.
> 
> I think a cast to a 32-bit type is ideal when converting the
> clock_gettime() result into microseconds, since the kernel guarantees
> that the timespec value is normalized, with all zeroes in the
> upper 34 bits. Going through __aeabi_ldivmod would make the
> conversion much slower.
> 
> For user supplied non-normalized timeval values, it's not obvious
> whether we need the full 64-bit division

We don't have to care about these here for the microsecond part,
because for decades these were exclusively 32-bit. Also the only
one consuming this field would have been settimeofday() and it's
already documented as returning EINVAL if tv_usec is not within
the expected 0..999999 range.

And when in doubt we should keep in mind that nolibc's purpose is not
to become a yet-another full-blown libc alternative but just a small
piece of software allowing to produce portable and compact binaries
for testing or booting. Being a bit stricter than other libcs for the
sake of code compactness is better here. Originally for example it was
necessary to always pass the 3 arguments to open(). Over time we managed
to make simple code compile with both glibc and nolibc, but when it
comes at the cost of adding size and burden for the developers, such
as forcing them to add libgcc, I prefer that we slightly limit the
domain of application instead.

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
