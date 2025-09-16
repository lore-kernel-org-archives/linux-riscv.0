Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F7BCAC592
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 03:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zULhEO8LYhXuH+9drBp48gbkGvPrqhdQmRpRttBhAxc=; b=fWv8rtDNptmpgL
	qF6KnKo0c8hVGqZTCrHbgVfg3mH1AXgbM6x4UlJ+9Hhd43BswVh0qcnM/JXIo0On8xf+iC6yGX8IB
	P9FyulB1vOF2lOhDBuE9JzOYZeG0FRdiEKeMy/ZEasMBz3cHNo11qEzC2YM2Di0uJzkviMcCWdAUL
	aGPLPIpE2/GGMLV+H2Wb1HTvupcIqF7I+vI2h2xUBUhYWoE9YqXvpGKFCTod11j9C4HdiJuTiYOXA
	g6Ewvd8Xb1VoDmCXWRyXjulG90ZbGotjQSpKog9vzXYhXIaGDjEKTwrALnyeqRf5mVO9l/1Xd5eJN
	nMGz9WPKVaDHhky9sNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyMV1-00000006bev-0vnj;
	Tue, 16 Sep 2025 03:36:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyMUx-00000006be4-1kPO;
	Tue, 16 Sep 2025 03:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7F3040716;
	Tue, 16 Sep 2025 03:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04DAC4CEEB;
	Tue, 16 Sep 2025 03:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757993814;
	bh=CfVil0FdRSS0PaXQXnEL2MuMd3+XojlUadD8GRWQi7w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CNf7AHxNVzyFResUYW5usorS95/1cgWEfQBxIXzVgEh5LcEryf/UaE9d6FXnmevp/
	 hUOvt/SIiD7/Xfzhk6DVSSkzymHadep7a/+dLaY5Vb+n0WLbUQmf5rY9iYjBaJbYhP
	 EK//AR137efTrjN+qYgc2VP+Ya6Cv8E6hGsRI3+Y=
Date: Mon, 15 Sep 2025 20:36:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, ryabinin.a.a@gmail.com,
 christophe.leroy@csgroup.eu, bhe@redhat.com, hca@linux.ibm.com,
 zhangqing@loongson.cn, chenhuacai@loongson.cn, davidgow@google.com,
 glider@google.com, dvyukov@google.com, alexghiti@rivosinc.com,
 alex@ghiti.fr, agordeev@linux.ibm.com, vincenzo.frascino@arm.com,
 elver@google.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify
 static key across modes
Message-Id: <20250915203653.c17d501a5f4b68936a0e3ea9@linux-foundation.org>
In-Reply-To: <CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
References: <20250810125746.1105476-1-snovitoll@gmail.com>
	<20250810125746.1105476-2-snovitoll@gmail.com>
	<CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com>
	<CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_203655_472941_E9A98182 
X-CRM114-Status: GOOD (  15.21  )
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

T24gTW9uLCAxNSBTZXAgMjAyNSAwOTozMDowMyArMDUwMCBTYWJ5cnpoYW4gVGFzYm9sYXRvdiA8
c25vdml0b2xsQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIFdlZCwgU2VwIDMsIDIwMjUgYXQgNjow
MeKAr1BNIEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ21haWwuY29tPiB3cm90ZToKPgoK
WzQwMCsgbGluZXMgcmVtb3ZlZCAtIHBlb3BsZSwgcGxlYXNlIGhhdmUgbWVyY3ldCgo+Cj4gPiA+
IEBAIC0yNDYsNyArMjU1LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHBvaXNvbl9zbGFiX29iamVj
dChzdHJ1Y3Qga21lbV9jYWNoZSAqY2FjaGUsIHZvaWQgKm9iamVjdCwKPiA+ID4gIGJvb2wgX19r
YXNhbl9zbGFiX3ByZV9mcmVlKHN0cnVjdCBrbWVtX2NhY2hlICpjYWNoZSwgdm9pZCAqb2JqZWN0
LAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaXAp
Cj4gPiA+ICB7Cj4gPiA+IC0gICAgICAgaWYgKCFrYXNhbl9hcmNoX2lzX3JlYWR5KCkgfHwgaXNf
a2ZlbmNlX2FkZHJlc3Mob2JqZWN0KSkKPiA+ID4gKyAgICAgICBpZiAoaXNfa2ZlbmNlX2FkZHJl
c3Mob2JqZWN0KSkKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+Cj4gPiBX
aHkgaXMgdGhlIGNoZWNrIHJlbW92ZWQgaGVyZSBhbmQgaW4gc29tZSBvdGhlciBwbGFjZXMgYmVs
b3c/IFRoaXMKPiA+IG5lZWQgdG8gYmUgZXhwbGFpbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4K
PiAKPiBrYXNhbl9hcmNoX2lzX3JlYWR5IHdoaWNoIHdhcyB1bmlmaWVkIHdpdGgga2FzYW5fZW5h
YmxlZCwgd2FzIHJlbW92ZWQKPiBoZXJlIGJlY2F1c2UKPiBfX2thc2FuX3NsYWJfcHJlX2ZyZWUg
aXMgY2FsbGVkIGZyb20gaW5jbHVkZS9saW51eC9rYXNhbi5oIFsxXSB3aGVyZQo+IHRoZXJlJ3Mg
YWxyZWFkeSBrYXNhbl9lbmFibGVkKCkgY2hlY2suCj4gCj4gWzFdIGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y2LjE2Ljcvc291cmNlL2luY2x1ZGUvbGludXgva2FzYW4uaCNMMTk4
Cj4gCj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHY3IGlzIHJlcXVpcmVkIHdpdGggdGhlIGNoYW5n
ZSBpbiB0aGUgZ2l0IGNvbW1pdAo+IG1lc3NhZ2Ugb25seS4KCk5laXRoZXIgd29ya3MgLSBwbGVh
c2Ugc2VuZCBhbG9uZyB0aGUgYXBwcm9wcmlhdGUgcGFyYWdyYXBoIGFuZCBJJ2xsCnBhc3RlIGl0
IGluLCBjYW4ndCBnZXQgZWFzaWVyIHRoYW4gdGhhdC4KCj4gPgo+Cj4gW2Fub3RoZXIgfjI1MCBs
aW5lcyBzbmlwcGVkXQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
