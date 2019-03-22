Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F483C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:21:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C4612075E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:21:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jl8VuMyn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C4612075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9xgf8YKZ3tuKQLgStr/8QdwmoGDp94c4QaKI1hY/uw=; b=Jl8VuMynecKOfX
	Clzpru0X/ZAunVcC6aRPhGRumaGpq/yTP/0w5Cxlchidufe+CkjX4G2nC/Lx6NW1tQtlG9onb0K/h
	RTfHNbMFU4LsdXablzUn02xzGCgJfB8VhiZdPpj9wKPaVfYgNfPwrIfcaZwHE9yRpICu2APZsFhru
	/Cjzr1U+ZYgF4J0Y09na9q49r5z19qQUE3gDfF7LePdPQNloximOj0vpgcTHT+HhjJJYRWAqsLwUv
	VvgkBFx9hkhbEnu6KNkRMFbgT6wrOAwCcjIq9yMbo6+kYPgiYbt7IHM2MzmQyihKyMoB/Gx43uUWd
	lI8yq460ZREb17cl5N4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7K7M-0004dm-Mu; Fri, 22 Mar 2019 13:21:52 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h7K6x-00047T-Fh; Fri, 22 Mar 2019 13:21:27 +0000
Date: Fri, 22 Mar 2019 06:21:27 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 1/4] arm64, mm: Move generic mmap layout functions to mm
Message-ID: <20190322132127.GA18602@infradead.org>
References: <20190322074225.22282-1-alex@ghiti.fr>
 <20190322074225.22282-2-alex@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190322074225.22282-2-alex@ghiti.fr>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Paul Burton <paul.burton@mips.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

PiBJdCB0aGVuIGludHJvZHVjZXMgYSBuZXcgZGVmaW5lIEFSQ0hfV0FOVF9ERUZBVUxUX1RPUERP
V05fTU1BUF9MQVlPVVQKPiB0aGF0IGNhbiBiZSBkZWZpbmVkIGJ5IG90aGVyIGFyY2hpdGVjdHVy
ZXMgdG8gYmVuZWZpdCBmcm9tIHRob3NlIGZ1bmN0aW9ucy4KCkNhbiB5b3UgbWFrZSB0aGlzIGEg
S2NvbmZpZyBvcHRpb24gZGVmaW5lZCBpbiBhcmNoL0tjb25maWcgb3IgbW0vS2NvbmZpZwphbmQg
c2VsZWN0ZWQgYnkgdGhlIGFyY2hpdGVjdHVyZXM/Cgo+IC0jaWZuZGVmIFNUQUNLX1JORF9NQVNL
Cj4gLSNkZWZpbmUgU1RBQ0tfUk5EX01BU0sgKDB4N2ZmID4+IChQQUdFX1NISUZUIC0gMTIpKQkv
KiA4TUIgb2YgVkEgKi8KPiAtI2VuZGlmCj4gLQo+IC1zdGF0aWMgdW5zaWduZWQgbG9uZyByYW5k
b21pemVfc3RhY2tfdG9wKHVuc2lnbmVkIGxvbmcgc3RhY2tfdG9wKQo+IC17Cj4gLQl1bnNpZ25l
ZCBsb25nIHJhbmRvbV92YXJpYWJsZSA9IDA7Cj4gLQo+IC0JaWYgKGN1cnJlbnQtPmZsYWdzICYg
UEZfUkFORE9NSVpFKSB7Cj4gLQkJcmFuZG9tX3ZhcmlhYmxlID0gZ2V0X3JhbmRvbV9sb25nKCk7
Cj4gLQkJcmFuZG9tX3ZhcmlhYmxlICY9IFNUQUNLX1JORF9NQVNLOwo+IC0JCXJhbmRvbV92YXJp
YWJsZSA8PD0gUEFHRV9TSElGVDsKPiAtCX0KPiAtI2lmZGVmIENPTkZJR19TVEFDS19HUk9XU1VQ
Cj4gLQlyZXR1cm4gUEFHRV9BTElHTihzdGFja190b3ApICsgcmFuZG9tX3ZhcmlhYmxlOwo+IC0j
ZWxzZQo+IC0JcmV0dXJuIFBBR0VfQUxJR04oc3RhY2tfdG9wKSAtIHJhbmRvbV92YXJpYWJsZTsK
PiAtI2VuZGlmCj4gLX0KPiAtCgpNYXliZSB0aGUgbW92ZSBvZiB0aGlzIGZ1bmN0aW9uIGNhbiBi
ZSBzcGxpdCBpbnRvIGFub3RoZXIgcHJlcCBwYXRjaCwKYXMgaXQgaXMgb25seSB2ZXJ5IGxpZ2h0
bHkgcmVsYXRlZD8KCj4gKyNpZiBkZWZpbmVkKEhBVkVfQVJDSF9QSUNLX01NQVBfTEFZT1VUKSB8
fCBcCj4gKwlkZWZpbmVkKEFSQ0hfV0FOVF9ERUZBVUxUX1RPUERPV05fTU1BUF9MQVlPVVQpCgpO
b3Qgc3VyZSBpZiBpdCBpcyB3ctGWdHRlbiBkb3duIHNvbWVod2VyZSBvciBqdXN0IGNvbnZlbnRp
b24sIGJ1dCBJCmdlbmVyYWwgc2VlIGNwcCBkZWZpbmVkIHN0YXRlbWVudHMgYWxpZ25lZCB3aXRo
IHNwYWNlcyB0byB0aGUKb25lIG9uIHRoZSBwcmV2aW91cyBsaW5lLgoKRXhjZXB0IGZvciB0aGVz
ZSBuaXRwaWNrcyB0aGlzIGxvb2tzIHZlcnkgbmljZSB0byBtZSwgdGhhbmtzIGZvciBkb2luZwp0
aGlzIHdvcmshCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
