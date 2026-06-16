Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF995CD98E1
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 15:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MoJb8SYMJyhXnvRLgb4zReR3Mt4XmDuwVyPCiVHvYQ=; b=0tp5rWbPGuN0D5
	KSOq0270kxb28ijhKlYJFouSo7PXuNvWX78GS0sFSTBY7ywziuGVhvEV2a8lecRZ9XXu7zdy08WuC
	etN4+QTpzkbUNXqP6zCh0ghL/7MrSWAvoFfN8bfmlRTpGnZeDAE3/EV8yG/QaI0JaTHZgW8DCsm+e
	4hVs/5+oDHm6W39OA1Xk+UQYXDGQscqipiCzuf1PTWW+YMS2UfjKxTlqHoD8t2/K+4HZ5lcqtwW3Z
	6D1yezvhJ0xHcgOx51hsyHzzmCab0CrqU80zfztG7sNXglPCL7MQKsUNesKHn4oW0O66DpmFo6Tv7
	4AlK4lg1VLxXXqgY+aLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZW0Y-0000000G2u6-084a;
	Tue, 16 Jun 2026 15:47:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZW0W-0000000G2ty-1oyd
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 15:47:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F26B1445A8
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2026 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75571F0155C
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2026 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781624839;
	bh=G/zUhartSnj7tjHRNF+uBfRGL+KZui8IXJel7Kwg5a0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Aos85ykdopfzZr4qQYDeCoS8xaYTx8wyCcg364B4glmXFk0VztHa4376ujVTbvx4K
	 Yxyp4mdi/8OK96F1JnNDLjJa/m0QMJQ2JvV9hGQ7McHGgj/crFASWYiv+Xvf9/R8ow
	 Usl3A3VgsMpkpsppqLagggq5nqYzKDMl3e7u9avU3UiyaCWFhywVsFyLu4U8YJAdAX
	 QMkVkTT1fvN82VIw/cE9L2B1waJgHOdyGGnRAdfcMMfopRQdOeixm6IZzpbn9eKTEe
	 6rzkE2QkBiiwJ762LP9THd54yOmIfcTGKkOxPn7cDPnQCS5KbEbBX7IR+iwu2RQCp/
	 aCOtFfsdF+ypg==
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so29253265e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2026 08:47:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/LaZk5SDq1NCzZtGZ4S9vUsh6oqm8S+E+MxS/f9OeclUE+bHNhqTSS8b9EMjjRE6BCoipsRxpAqVUeyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy9dxrtbGqrWGI0yI1/nDV1NFOFYw4nyofn6IPWhGmucMkjz2/
	ThfRBeQNhs1gqflh2U6xVmLIWZcPAWe6+Iz9X6zo0Zw/kk8d17GSN1SNtjpo+clQAqpZFSpAbyi
	tJ2/HxuaxJuBeIzkM6t0xVy2wtv+djF0=
X-Received: by 2002:a05:600c:3b0f:b0:491:731c:892a with SMTP id
 5b1f17b1804b1-492333df11bmr680915e9.35.1781624838387; Tue, 16 Jun 2026
 08:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org> <20260616113651.1048a19a@pumpkin>
In-Reply-To: <20260616113651.1048a19a@pumpkin>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 16 Jun 2026 23:47:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTh1zyAZkKt7AQNZptG_H=-8xSum6PVTyxEmw23pN6-9g@mail.gmail.com>
X-Gm-Features: AVVi8CcTPsNyYpI81XM406R0-c5h9wixp30ROEWYygvxB_d53TSoJkwNBAEo5Gw
Message-ID: <CAJF2gTTh1zyAZkKt7AQNZptG_H=-8xSum6PVTyxEmw23pN6-9g@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: David Laight <david.laight.linux@gmail.com>
Cc: zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org, 
	yuanzhu@bytedance.com
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

T24gVHVlLCBKdW4gMTYsIDIwMjYgYXQgNjozNuKAr1BNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDE1IEp1biAyMDI2IDEyOjM4
OjE3ICswMDAwCj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gPiBIaSBa
aGFucGVuZyBaaGFuZywKPiAuLgo+ID4gMy4gT25seSBwZXJmb3JtYW5jZS1tb25pdG9yaW5nIGNv
dW50ZXJzIHJlcXVpcmUgNjQtYml0IElPIGFjY2VzcyBvciB0aGUKPiA+IGhpZ2gtbG93LWhpZ2gg
ZG8td2hpbGUgcmV0cnkgc3RyYXRlZ3kuIEZvciBvcmRpbmFyeSBzdGF0dXMgYW5kIGNvbnRyb2wK
PiA+IE1NSU8gcmVnaXN0ZXJzLCBhIHNpbmdsZSByZWFkIGlzIHN1ZmZpY2llbnQuCj4KPiBBY3R1
YWxseSB0aGlzIHNlcXVlbmNlIHNob3VsZCBiZSBlbm91Z2ggZm9yIGEgY291bnRlcjoKPiAgICAg
ICAgIGhpID0gcmVhZF9oaSgpOwo+ICAgICAgICAgbG8gPSByZWFkX2xvKCk7Cj4gICAgICAgICBp
ZiAoaGkgIT0gcmVhZF9oaSgpKSB7Cj4gICAgICAgICAgICAgICAgIC8vIFBpY2sgYSB2YWx1ZSB0
aGF0IGhhcHBlbmVkIHdoaWxlIGRvaW5nIHRoZSByZWFkcy4KPiAgICAgICAgICAgICAgICAgaGkr
KzsKPiAgICAgICAgICAgICAgICAgbG8gPSAwOwo+ICAgICAgICAgfQpUaGlzIGlzIG5vdCBhIGZy
ZWUgb3B0aW1pemF0aW9uIOKAlCBpdCBkb2VzIG5vdCBwcmVzZXJ2ZSB0aGUgc2FtZQpzZW1hbnRp
Y3MgYXMgYW4gYXRvbWljIDY0LWJpdCByZWFkLiBUaGVyZSBhcmUgYXQgbGVhc3QgdHdvIGNvcnJl
Y3RuZXNzCmlzc3VlczoKCjEuIExvc3Mgb2YgcHJlY2lzaW9uOiBJZiBoaSBjaGFuZ2VkIGR1cmlu
ZyB0aGUgcmVhZCwgc2V0dGluZyBsbyA9IDAKZGlzY2FyZHMgdGhlIGFjdHVhbCBsbyB2YWx1ZS4g
VGhlIGNvcnJlY3QgYXBwcm9hY2ggaXMgdG8gcmUtcmVhZCBsbwphZnRlciBkZXRlY3RpbmcgdGhl
IGNoYW5nZSwgbm90IGZhYnJpY2F0ZSBhIHZhbHVlLgoKMi4gTXVsdGlwbGUgb3ZlcmZsb3dzOiBU
aGlzIGFzc3VtZXMgYXQgbW9zdCBvbmUgb3ZlcmZsb3cgb2NjdXJzCmJldHdlZW4gcmVhZHMuIElm
IHR3byBvdmVyZmxvd3MgaGFwcGVuIChlLmcuLCBkdWUgdG8gaW50ZXJydXB0CmluamVjdGlvbiks
IGhpKysgd2lsbCBwcm9kdWNlIGFuIGluY29ycmVjdCByZXN1bHQsIHNpbGVudGx5IGNvcnJ1cHRp
bmcKdGhlIGNvdW50ZXIgdmFsdWUuCgpOZWdsaWdpYmxlIGJlbmVmaXQ6IGhpIGNoYW5naW5nIGJl
dHdlZW4gcmVhZHMgaXMgYW4gZXh0cmVtZWx5IHJhcmUKZXZlbnQuIE9wdGltaXppbmcgYXdheSB0
aGUgcmV0cnkgbG9vcCBmb3Igc3VjaCBhIHJhcmUgY2FzZSBwcm92aWRlcyBubwptZWFuaW5nZnVs
IHBlcmZvcm1hbmNlIGdhaW4uIEFuZCBpZiBoaSBuZXZlciBzdGFiaWxpemVzLCB0aGF0CmluZGlj
YXRlcyBhIGhhcmR3YXJlIGZhaWx1cmUg4oCUIGluIHdoaWNoIGNhc2UgaGFuZ2luZyBpbiB0aGUg
cmV0cnkgbG9vcAppcyBhY3R1YWxseSB0aGUgbW9yZSBhcHByb3ByaWF0ZSBiZWhhdmlvciwgYXMg
aXQgbWFrZXMgdGhlIGZhaWx1cmUKdmlzaWJsZSByYXRoZXIgdGhhbiBzaWxlbnRseSBwcm9kdWNp
bmcgZ2FyYmFnZSB2YWx1ZXMuCgpUaGUgaGlnaC1sb3ctaGlnaCBkby13aGlsZSByZXRyeSBzdHJh
dGVneSBleGlzdHMgcHJlY2lzZWx5IHRvIGhhbmRsZQp0aGVzZSBjYXNlcyBjb3JyZWN0bHkuIEkg
ZG9uJ3QgdGhpbmsgdGhpcyBwcm9wb3NlZCBzZXF1ZW5jZSBpcyBhIHZhbGlkCnJlcGxhY2VtZW50
LgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
