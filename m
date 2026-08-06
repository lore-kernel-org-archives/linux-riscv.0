Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39558C5AC7A
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 22:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u466BrMMeEq9lWCB8UeA0gcAsheA3SCuAOM0UI3JgCA=; b=W+n271WW6ddTF7
	i0v6XVinfr6Ln5+VH34DHIpqnwbCmvdGEtboId3yHKHaL3FUqvjWOlI3WVC02WPoPzYvQ+Ivhs899
	A3JABXhIw/blroj9fp3f+l9ZnxgY4WwwESzlVU10iSbMQVQUk81qIMDAKKytipIcML6MEFXIJepLa
	5jChnkp+2dELpd0en5VFY6CGZkaPwpLHkHj2EbyYlqnAEHmrdMH4ZeGQBOtSpZpJIx6ayMXWPu/8S
	+UiuyCamuLVs4C9npg2zHbiz02xwOxw9hKR6kJC7yOABBFL9FYPml/ZIA8gKpZIJF3yK5RSXYu4hJ
	V97lrqn+toLV7j98u4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws725-00000006pJ5-2tbC;
	Thu, 06 Aug 2026 22:57:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws724-00000006pIO-3uVl
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 22:57:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C6BF60A6A;
	Thu,  6 Aug 2026 22:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9473F1F000E9;
	Thu,  6 Aug 2026 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786057067;
	bh=BI+X85dq4LlNRPfEIbWIwO8lispM8mVV7OtTMSzPm4I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ikNoYIR4mHOhB1ta+N2cWs//xXsTyXml9LnV/JFysMCvTFr9m8nkw0aNpq5qWrr9p
	 vO+ell6psXcgESEDakVye+kSM6tTz9diOZkE0smIINh5tZXDb8HsUbN8JwMEdsJl2o
	 4EaPfQNxMbKoCCQv0wh0UYMVorMEAsgMZi5T3GVc=
Date: Thu, 6 Aug 2026 15:57:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wilson Felipe Pereira <wfelipe@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH 0/3] init/Kconfig: generalize config COMMAND_LINE_SIZE
Message-Id: <20260806155746.0c3590dc2f3228e7d65e986c@linux-foundation.org>
In-Reply-To: <20260806061429.474992-1-wfelipe@google.com>
References: <20260806061429.474992-1-wfelipe@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

T24gVGh1LCAgNiBBdWcgMjAyNiAwNjoxNDoxMyArMDAwMCBXaWxzb24gRmVsaXBlIFBlcmVpcmEg
PHdmZWxpcGVAZ29vZ2xlLmNvbT4gd3JvdGU6Cgo+IFRoaXMgcGF0Y2ggc2VyaWVzIHByb21vdGVz
IENPTU1BTkRfTElORV9TSVpFIGZyb20gYXJjaC9zMzkwL0tjb25maWcgdG8KPiBpbml0L0tjb25m
aWcgdG8gYmUgZ2VuZXJhbGx5IGF2YWlsYWJsZSB0byBvdGhlciBhcmNoaXRlY3R1cmVzLgo+IAo+
IEluIHNvbWUgdXNlIGNhc2VzLCBzdWNoIGFzIG5ldGJvb3Qga2VybmVscywgcm9vdGZzIGNvbmZp
Z3VyYXRpb25zLCBsYXJnZXIKPiBpbml0cmFtZnMgc2V0dXBzLCByZXF1aXJlIGxhcmdlciBzaXpl
cy4gV2hpbGUgZm9yIGVtYmVkZGVkIHdvcmtsb2FkcywgaXQKPiBjYW4gYmUgcmVkdWNlZCB0byBz
YXZlIG1lbW9yeS4KPiAKPiBTaW5jZSBDT01NQU5EX0xJTkVfU0laRSBjYW4gYmUgbGFyZ2VyLCBp
dCBhbHNvIG1ha2VzIHNlbnNlIHRvIGFsbG93Cj4gSU5JVF9FTlZfQVJHX0xJTUlUIHRvIGJlIGNv
bmZpZ3VyZWQuCgpUaGFua3MuCgpBSSByZXZpZXcgcG9pbnRlZCBhdCBhIGZldyBwb3NzaWJsZSBp
c3N1ZXMgLSBJIGV5ZWJhbGxlZCBhIGNvdXBsZSBhbmQKdGhleSBhcHBlYXIgc2lnbmlmaWNhbnQu
CglodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MDYwNjE0MjkuNDc0OTkyLTEt
d2ZlbGlwZUBnb29nbGUuY29tCgoKPiBPcmlnaW5hbGx5LWJ5OiBNYWNpZWogxbtlbmN6eWtvd3Nr
aSA8bWF6ZUBnb29nbGUuY29tPgoKZnlpLCBpdCdzIG1pbm9yLCBidXQgT3JpZ2luYWxseS1ieTog
aXNuJ3QgYWN0dWFsbHkgYSB0aGluZy4gIEl0J3MKbWVudGlvbmVkIGluIHRoZSAtdGlwIGRvY3Vt
ZW50YXRpb24sIG5vdGhpbmcgZWxzZSBlbmRvcnNlcyBpdC4KCkkgaGF2ZSBubyBpc3N1ZSB3aXRo
IGl0IGJ1dCBmb3JtYWxseSB0aGVzZSBwYXRjaGVzIHNob3VsZCBhbHNvIGhhdmUKTWFjaWVqJ3Mg
U2lnbmVkLW9mZi1ieTogCgoKUGxlYXNlIGxldCdzIHRhcmdldCA3LjMtcmMxIGZvciB0aGVzZSBj
aGFuZ2VzIC0gSSdtIGRlZXAgaW50bwpzdGVtLXRoZS1mbG9vZCBtb2RlIGZvciB0aGlzIC1yYyBj
eWNsZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
