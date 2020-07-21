Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23022C433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 05:36:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE02820792
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 05:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vaIEGmnY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE02820792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nGhDwcgSQ5EfhvLOHebtO6QvJbfYJsajrcxsibfI7Bc=; b=vaIEGmnYSACrGZr2Z831wkPdP
	E7pyomZ8Miw/ahmXTcUx1rDIJT+zQfAnBmnH3A6qCKZhRxXU1vp0FMCrTbJwJ9eJ4jwyvtC2n4WYk
	G1kFO+ZhmxUYyy2oCarXm7DAlJAVwlLbxiq2KSFhEroOJcNz3cX6DH7uskrB1ZF4JaDLHAr/r8FCR
	8sREc0NmVv0CG/sYZC5b2ThghZlzOR6ChEal1LzgzdZcOeADE5Uz9pGY3LI8bTY7UbyNhBJ81Cdut
	wqvl8ZETjv7RYBhwSqmzW9CdVR5wEMnvNTiZRbcOxAeBYZVw+Z+HqqU8HODK6gRQZwQXW8a8JgiTU
	zlljny1TA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxkwN-00046z-DU; Tue, 21 Jul 2020 05:35:47 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxkwL-00046Y-1u
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 05:35:46 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 78C446736F; Tue, 21 Jul 2020 07:35:42 +0200 (CEST)
Date: Tue, 21 Jul 2020 07:35:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/6] syscalls: use uaccess_kernel in addr_limit_user_check
Message-ID: <20200721053542.GA10301@lst.de>
References: <20200714105505.935079-1-hch@lst.de>
 <20200714105505.935079-2-hch@lst.de> <20200718013849.GA157764@roeck-us.net>
 <20200718094846.GA8593@lst.de> <20200720221046.GA86726@roeck-us.net>
 <20200721045834.GA9613@lst.de>
 <eb470677-b569-a6f0-e63b-60149b54863a@roeck-us.net>
 <20200721052022.GA10011@lst.de>
 <7fc565fe-411e-6a0b-8aaf-0bf808f0d6a9@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7fc565fe-411e-6a0b-8aaf-0bf808f0d6a9@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_013545_230851_CE004CD9 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMjAsIDIwMjAgYXQgMTA6MzA6MzBQTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3
cm90ZToKPiBHdWVzcyBJIGxvc3QgaXQgc29tZXdoZXJlLiBBcmUgeW91IHNheWluZyB0aGUgY2hl
Y2sgd2FzIHdyb25nIGFsbCBhbG9uZwo+IGFuZCB5b3VyIHBhdGNoIGZpeGVkIGl0ID8KCk9oLCBp
dCBpcyBhIGxpdHRsZSBjb21wbGljYXRlZC4KCk5vcm1hbGx5IHdlIGhhdmUgdHdvIGFkZHJlc3Mg
c3BhY2UgbGltaXRzLCBLRVJORUxfRFMgYW5kIFVTRVJfRFMsCmFuZCB0aGV5IGFyZSBzdXBwb3Nl
ZCB0byBiZSBkaWZmZXJlbnQuICBhcm1ub21tdSBhbmQgbTY4ayBkZWZpbmUgdGhlbQp0byB0aGUg
c2FtZSB2YWx1ZSBmb3Igbm8gZ29vZCByZWFzb24uICBUaGF0IGxlYWRzIHRvOgoKdWFjY2Vzc19r
ZXJuZWwgYWx3YXlzIHJldHVybmluZyB0cnVlIGFzIGl0IGRvZXMgYSBwb3NpdGl2ZSBjaGVjawph
Z2FpbnMgS0VSTkVMX0RTLCB3aGljaCBkaXNhYmxlcyBhIGJ1bmNoIG9mIGRyaXZlcnMgbGlrZSBz
ZyBhbmQKcmRtYSwgYW5kIGNvdWxkIGFsc28gbGVhZCB0byByZWFsbHkgc3RyYW5nZSBhbmQgcHJv
YmFibHkgYnJva2VuCnJlc3VsdHMgaW4gYSBmZXcgcGxhY2VzLgoKSXQgYWxzbyBsZWFkcyB0byB0
aGUgU0lHS0lMTCBpbiBhZGRyX2xpbWl0X3VzZXJfY2hlY2sgbmV2ZXIKdHJpZ2dlcmluZyBkdWUg
dG8gdGhlIG5lZ2F00ZZ2ZSBjaGVjaywgd2hpY2ggaXMgb2sgYXMgdGhlIGxpbWl0cwpuZXZlciBh
cmUgZGlmZmVyZW50LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
