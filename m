Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E72C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciSBM1YC8vFKAPVTpmgPZv22MvyInYRi+Kc+MKKYSZo=; b=qxmHzexRlceKi5
	R3Y+chdmy3sbj8fn3jhIrKx/B2FaytRNGbWWj+c9EgZCc9IUFRgOzzPzDu5qjRMwSHpc2xWbF62xd
	lQdwT1+lXGxml1p/gsz0vfoAJeN7nW0q1c6Qyt5lbV/ONJVcuqJ5wo7ElO3hjxT3PFwllphKJki0q
	rQuSDGBisIG8fpbIli3VngyWDyj0SF9UauS7J6k+1Yig2SXucLMw+0a+6SW432YyfWXF8PIEyjuuI
	H5cw4+UD57SRx9n5IXnFmqgrbtjCAkJdIfIvzxtBxPDLZP/5WAQX/pxEmLGKx3acSrwFzdYQ6V095
	knScFfYv2vfJ0KS/XvSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q688k-00FEv9-0Q;
	Mon, 05 Jun 2023 11:12:46 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q688g-00FEst-1N
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 11:12:44 +0000
X-QQ-mid: bizesmtp73t1685963542tue2ikmf
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Jun 2023 19:12:20 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: OFQdrTmJ2CTPW1rKDCObcDNnOiZf5G7OS3ydy8gWgcFCDkj+ygtkUgsn400hH
	XcSUWjIUNzPtaf8xdx7SFAnkqm4qlz8q1TNpP2NF7JMWaqIsoZlribWjxH/w1NEo7SbyC5b
	F92p0FGK7JG8wnYKGctbxx6aeT4sz7bKph2fDS5AZpiMLMwk24QctEz8nrwFI6Q1E6Pib2U
	jt5K73G2WlUJGRP5WBbIheVih803jE07C36L5wdUjHC/1cpE/7qTPuGiphDybYWA+244CtI
	jRzwIlx9YqZfIlDJqF99mh2vl/FSgqnL3nxqsgmq1plH+Gxcjh4nrk1izDcpUc34YW5KdsJ
	KLxbUW52+5Oc0+lMblXBmrdRMNdM1huR0Axg8p3D0BBu+d+7gxM6YL82yirIg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5716039531870868684
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH v3 11/12] selftests/nolibc: add new gettimeofday test cases
Date: Mon,  5 Jun 2023 19:12:20 +0800
Message-Id: <20230605111220.252069-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZHx1OliMqHx9U1Lw@1wt.eu>
References: <ZHx1OliMqHx9U1Lw@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_041242_790601_F82FB238 
X-CRM114-Status: GOOD (  25.78  )
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

> On Sun, Jun 04, 2023 at 11:24:39AM +0200, Arnd Bergmann wrote:
> > On Sun, Jun 4, 2023, at 10:29, ??? wrote:
> > >
> > > Sorry for missing part of your feedbacks, I will check if -nostdlib 
> > > stops the linking of libgcc_s or my own separated test script forgot 
> > > linking the libgcc_s manually.
> > 
> > According to the gcc documentation, -nostdlib drops libgcc.a, but
> > adding -lgcc is the recommended way to bring it back.
> > 
> > > And as suggestion from Thomas' reply,
> > >
> > >>> Perhaps we really need to add the missing __divdi3 and __aeabi_ldivmod and the
> > >>> ones for the other architectures, or get one from lib/math/div64.c.
> > >
> > >>No, these ones come from the compiler via libgcc_s, we must not try to
> > > reimplement them. And we should do our best to avoid depending on them
> > > to avoid the error you got above.
> > >
> > > So, the explicit conversion is used instead in the patch.
> > 
> > I think a cast to a 32-bit type is ideal when converting the
> > clock_gettime() result into microseconds, since the kernel guarantees
> > that the timespec value is normalized, with all zeroes in the
> > upper 34 bits. Going through __aeabi_ldivmod would make the
> > conversion much slower.
> > 

Perfectly, this message is really required to be added to the coming
clock_gettime/time64 patches, I did worry about the (unsigned int)
conversion may lose the upper bits, thanks Arnd.

> > For user supplied non-normalized timeval values, it's not obvious
> > whether we need the full 64-bit division
> 
> We don't have to care about these here for the microsecond part,
> because for decades these were exclusively 32-bit. Also the only
> one consuming this field would have been settimeofday() and it's
> already documented as returning EINVAL if tv_usec is not within
> the expected 0..999999 range.
> 

And this one, thanks Willy.

> And when in doubt we should keep in mind that nolibc's purpose is not
> to become a yet-another full-blown libc alternative but just a small
> piece of software allowing to produce portable and compact binaries
> for testing or booting. Being a bit stricter than other libcs for the
> sake of code compactness is better here. Originally for example it was
> necessary to always pass the 3 arguments to open(). Over time we managed
> to make simple code compile with both glibc and nolibc, but when it
> comes at the cost of adding size and burden for the developers, such
> as forcing them to add libgcc, I prefer that we slightly limit the
> domain of application instead.

This explains why it is 'no' libc ;-)

Best regards,
Zhangjin

> 
> Thanks!
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
