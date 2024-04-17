Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1D2C001CC
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jw/5q+8CFb15+84ANXZEa00CwuBWn5asHUQaYxhvXiY=; b=d1TNE6lEgnN2mv
	0F3Gs/UvhcETfBD1vzfO4l5xtWsGMRC9ZP8ZYI78L8YkzIW+CAFCkY/DY0MHpAQ0dTpbuSSTIDzNu
	4AadU9wMkBfq9qKXpWC/spB7HPQuLgCjnbbzW1NKacYvrMb7GihRBMfxS9MEhfMbJbI5bbjIO/UzN
	wgwwB8ZgSAwdeEpsm3cvPj5F3kMhZVhYwCBvY34wemR8/ijGPwjYDDNUlrdJrJ3BkFmB4aMVg9Y/d
	oVBwoLfnn5sOk8M0NXO9d8LJ77RJRTPpRRlTl61g++W//oHWBPTuhuJ9LcA8bsijp5MvHeyMMs9n8
	m5WhPE5wGUotkRlnBLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7gz-0000000GiMU-0dkD;
	Wed, 17 Apr 2024 15:59:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7gw-0000000GiL6-3RJb
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 15:59:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9EEF6CE13D4;
	Wed, 17 Apr 2024 15:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65873C2BD11;
	Wed, 17 Apr 2024 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713369558;
	bh=UZiJOhiexQp0bZizQPTKAWHNiRbtg+8aXN8vVVHAyTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rL+H5lBs4TZGMqDH1ZjnQFpDjbQUWqKY3vSv9FtLbLusG/j0bPhVUj750XeNpd4KC
	 /xtzekKpiwXBiRb410H0JcwFWxS4AuzSgclt8RgBSk8N5lS1jJnFM95PjnSGygz7PG
	 SYJdvG07hcqHo3aQj008Jv/klLYQauj19mV1sSEvvpjYL5bg8Z3x4Xw0mIYX4H6Z69
	 cfvEq184UwO48YATqgmpbx8xT5kyWqtPxtvCOayF0HfI3dNDMq/0hkx/tQvjg+/Lvq
	 9NAkKr++ZQ6cAUML0ZIe8Ofct1rBrWrHeBGGQ3CKDzPuc2TvgBz9BaUUe1YTPFFuqa
	 2iVpA7ckmrCdQ==
Date: Wed, 17 Apr 2024 12:59:15 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: cp0613@linux.alibaba.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] tools/perf: Fix compiling with libelf on rv32
Message-ID: <Zh_x0_VSO72xyaer@x1>
References: <20240415095532.4930-1-cp0613@linux.alibaba.com>
 <CAP-5=fWZSPTtk+UjssH4Mhw11CAP0-jZcZAbCesdqrVCnZbu2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fWZSPTtk+UjssH4Mhw11CAP0-jZcZAbCesdqrVCnZbu2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_085923_059506_6B2DF5B9 
X-CRM114-Status: GOOD (  11.35  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgMDg6MDQ6NTVBTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBNb24sIEFwciAxNSwgMjAyNCBhdCAyOjU34oCvQU0gPGNwMDYxM0BsaW51eC5hbGli
YWJhLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGli
YWJhLmNvbT4KPiA+Cj4gPiBXaGVuIGNyb3NzLWNvbXBpbGluZyBwZXJmIHdpdGggbGliZWxmLCB0
aGUgZm9sbG93aW5nIGVycm9yIG9jY3VycmVkOgo+ID4KPiA+ICAgICAgICAgSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIHRlc3RzL2dlbmVsZi5jOjE0Ogo+ID4gICAgICAgICB0ZXN0cy8uLi91dGlsL2dl
bmVsZi5oOjUwOjI6IGVycm9yOiAjZXJyb3IgInVuc3VwcG9ydGVkIGFyY2hpdGVjdHVyZSIKPiA+
ICAgICAgICAgNTAgfCAjZXJyb3IgInVuc3VwcG9ydGVkIGFyY2hpdGVjdHVyZSIKPiA+ICAgICAg
ICAgICAgICAgICB8ICBefn5+fgo+ID4gICAgICAgICB0ZXN0cy8uLi91dGlsL2dlbmVsZi5oOjU5
OjU6IHdhcm5pbmc6ICJHRU5fRUxGX0NMQVNTIiBpcyBub3QgZGVmaW5lZCwgZXZhbHVhdGVzIHRv
IDAgWy1XdW5kZWZdCj4gPiAgICAgICAgIDU5IHwgI2lmIEdFTl9FTEZfQ0xBU1MgPT0gRUxGQ0xB
U1M2NAo+ID4KPiA+IEZpeCB0aGlzIGJ5IGFkZGluZyBHRU4tRUxGLUFSQ0ggYW5kIEdFTi1FTEYt
Q0xBU1MgZGVmaW5pdGlvbnMgZm9yIHJ2MzIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBQ
ZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogSWFuIFJvZ2Vy
cyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgoKVGhhbmtzLCBhcHBsaWVkIHRvIHBlcmYtdG9vbHMtbmV4
dCwKCi0gQXJuYWxkbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
