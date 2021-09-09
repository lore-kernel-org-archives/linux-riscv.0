Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BA9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 05:59:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E58FD61167
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 05:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E58FD61167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D59WjYxlGq0CVCd1I7Kx+5jSTy9V9o8mWdxbQr/1DrI=; b=Jyp1LM+6qNwyKkAa20W4zIcwEV
	yldAP1xeluhMKIyHF3O1BBsSN/HNSKQjtiOvp5V9XX9J2eO7+gdgFWq0h8msdVzO1+Uv3FDzT9zVi
	joz0Xr9AMLjz9xFPUnIhHE9GyIEZsz+jvnc15kn29fL54WB8EsfYucV1sFIC2hhK++tW2z09ALv/k
	aJrSUJBgNmh5bZxXvcpb/qR+DHEDbe7ydjORvKuWvFZZAxMxKZwUmoynF7rMSbn3SyoVYVRpSbq/Q
	5b90qhuIg9YknwOt8aZT+X9yOZh4bFY8vPWQ8jJ0jb6M3NwnOpzjTcVF/Hctn5pK481KNCnqGIHF0
	umPuT6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOD5j-008JKh-Gy; Thu, 09 Sep 2021 05:59:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOD5i-008JKV-De
 for linux-riscv@bombadil.infradead.org; Thu, 09 Sep 2021 05:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=EmyOmO4OA1vu17LO++qu8IgyrFImV3HoLCHV1XeAKXU=; b=m7G+7uozvp+6qWoVstSpXJCgaX
 UPOdR2T7SaQtREbiqpM6Jcsh5kaHXhhj3aflDl5LkolWq3yc27aonGNNrXtPKCr4tb5Uy2lVEExDP
 8zROfQNLR6zByM+dZokX6WIBi3FnjaCUChyLZmAkNIbZzSLhZMXNaOZN9r0BEyYXJttayMFKqt15c
 OS2R1emd8XY987B+kWdUPOJYTR0OjotOItygDpYek33SuKTY8EcDJkR4XmQRXyunwghdk/0L/QExf
 +xJ7HG7FkmIFERFpzkFMIdCo35aQxb8lqtvvw2CRQKyytkhukTWgTJu/D/V+arn0kWKLJ6xwR32Fo
 WvKtaFUQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mOD4f-009WcX-Hg; Thu, 09 Sep 2021 05:58:27 +0000
Date: Thu, 9 Sep 2021 06:58:13 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Marco Elver <elver@google.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Nathan Chancellor <nathan@kernel.org>,
 Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com,
 Christian =?unknown-8bit?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
Message-ID: <YTmidYBdchAv/vpS@infradead.org>
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
 <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com>
MIME-Version: 1.0
In-Reply-To: <YTkyIAevt7XOd+8j@elver.google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Content-Type: multipart/mixed; boundary="===============0605743426535969209=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0605743426535969209==
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Sep 08, 2021 at 11:58:56PM +0200, Marco Elver wrote:
> It'd be good to avoid. It has helped uncover build issues with KASAN in
> the past. Or at least make it dependent on the problematic architecture.
> For example if arm is a problem, something like this:

I'm also seeing quite a few stack size warnings with KASAN on x86_64
without COMPILT_TEST using gcc 10.2.1 from Debian.  In fact there are a
few warnings without KASAN, but with KASAN there are a lot more.
I'll try to find some time to dig into them.

While we're at it, with -Werror something like this is really futile:

drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function ‘amdgpu_bo_support_uswc’:
drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:493:2: warning: #warning
Please enable CONFIG_MTRR and CONFIG_X86_PAT for better performance thanks to write-combining [-Wcpp
  493 | #warning Please enable CONFIG_MTRR and CONFIG_X86_PAT for better performance \
      |  ^~~~~~~


--===============0605743426535969209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0605743426535969209==--
