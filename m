Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D932FC001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 00:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJ5BuxWbecmoaFuxlkraD9Ho1D8zBKm+5Q5hX0UP5dw=; b=bZYnK7xJT/SAYc
	CO7SRPPFYVrcy3Lv5qchz5zFdg/CKtOtuJdDk6KaXsUnf0n5btQ4jJRXFG1wLy1hs74AZXiTalCmY
	25D0FHDgsTHt4FIwHQLiT1iVdEsHconjeV3Yij+PfM4TJufY5qumKjegSfYi0SfFeUbdYEejAA0wD
	iRk+AcQrO6WDp8iK/8rmlddO4YNYDRIlpXiwxJ7NgPU3f6+24O3aJRtjdt1Kg6Zg8yRRrMnvPPls/
	HA5JVkCrq2lyz/Pu4/MCT7Lwsq/28A+OcXc3tp2+u2ZnaNKLUwHFKZrcoAedm/d4GYGCMY5HQ9bHs
	jz6IfeOin2p0p8KjEq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRj4N-00BCG1-3D;
	Fri, 04 Aug 2023 00:53:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRj4L-00BCFH-1a
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 00:53:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0321661EB3
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 00:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1A9C433CA
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 00:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691110406;
	bh=CRmotsznYKjfyxND77PAQgXyzRhutmmLl0P7dFI46Jc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V/mVaAyZGqlEkS1DLcBC4ugem8ZUyfYTmZPgPoI2SVAEOz7xWrJ2r3DaSouk22l8B
	 1hFPittVwSQFWgorxDqTjHPLmXPs4bHnao90o8YD4YYBXKrHgZvYxyZgEHg7mxizvH
	 cHpk1JOyK1pwwiLu+k09UYVnghkOrxNGMoy3SPF+SFZ/iRndu95H29uzqrhPPfH92g
	 qqIvRIMKlAHpgwUnuSBkzeu+y2PFGnnQ4HvQwkMIcACsFUYDIHLhp7D9LMxhZvKNHN
	 iZmkoxnyUk+CYkw8bfEDBol7pIOJ0FgCnQlUch5ec0JfSotADo/5xOysjfeVVqhBV4
	 Db2RtgiGtzUrg==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5222c5d71b8so1944592a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 17:53:26 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy+tzI+po82Z8howAtFOxbBJsLvLmkBCR8uslP9f/yhMO0JPuk8
	+uzkM7bbR17z0IYuPPC39yWnu+bGMKEVgIgiocw=
X-Google-Smtp-Source: AGHT+IEnV9QSSBYloqeE8Xn7qAxFwf1C0m/rkTGjFo8DmCyz7GtOfrlz92sjGCS0P2GJoseOlCzNAAPS88qz2s2/i44=
X-Received: by 2002:aa7:c64f:0:b0:523:f04:b2d3 with SMTP id
 z15-20020aa7c64f000000b005230f04b2d3mr317242edr.11.1691110404557; Thu, 03 Aug
 2023 17:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230803051401.710236-2-leobras@redhat.com>
In-Reply-To: <20230803051401.710236-2-leobras@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 4 Aug 2023 08:53:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTShfMzVZw5TVqBvLNAzEBMzhWxNGC9JS70euPcKKN85zQ@mail.gmail.com>
Message-ID: <CAJF2gTShfMzVZw5TVqBvLNAzEBMzhWxNGC9JS70euPcKKN85zQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Deduplicate RISCV cmpxchg.h and atomic.c macros
To: Leonardo Bras <leobras@redhat.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_175329_638359_672DD2E3 
X-CRM114-Status: GOOD (  23.42  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCAxOjE04oCvUE0gTGVvbmFyZG8gQnJhcyA8bGVvYnJhc0By
ZWRoYXQuY29tPiB3cm90ZToKPgo+IEkgdW5pZmllZCBwcmV2aW91cyBwYXRjaHNldHMgaW50byBh
IHNpbmdsZSBvbmUsIHNpbmNlIHRoZSB3b3JrIGlzIHJlbGF0ZWQuCj4KPiBXaGlsZSBzdHVkeWlu
ZyByaXNjdidzIGNtcHhjaGcuaCBmaWxlLCBJIGdvdCByZWFsbHkgaW50ZXJlc3RlZCBpbgo+IHVu
ZGVyc3RhbmRpbmcgaG93IFJJU0NWIGFzbSBpbXBsZW1lbnRlZCB0aGUgZGlmZmVyZW50IHZlcnNp
b25zIG9mCj4ge2NtcCx9eGNoZy4KPgo+IFdoZW4gSSB1bmRlcnN0b29kIHRoZSBwYXR0ZXJuLCBp
dCBtYWRlIHNlbnNlIGZvciBtZSB0byByZW1vdmUgdGhlCj4gZHVwbGljYXRpb25zIGFuZCBjcmVh
dGUgbWFjcm9zIHRvIG1ha2UgaXQgZWFzaWVyIHRvIHVuZGVyc3RhbmQgd2hhdCBleGFjdGx5Cj4g
Y2hhbmdlcyBiZXR3ZWVuIHRoZSB2ZXJzaW9uczogSW5zdHJ1Y3Rpb24gc3VmaXhlcyAmIGJhcnJp
ZXJzLgo+Cj4gQWxzbywgZGlkIHRoZSBzYW1lIGtpbmQgb2Ygd29yayBvbiBhdG9taWMuYy4KPgo+
IE5vdGUgdG8gR3VvIFJlbjoKPiBJIGRpZCBzb21lIGZ1cnRoZXIgaW1wcm92ZW1lbnQgYWZ0ZXIg
eW91ciBwcmV2aW91cyByZXZpZXdzLCBzbyBJIGVuZGVkCj4gdXAgYWZyYWlkIGluY2x1ZGluZyB5
b3VyIFJldmlld2VkLWJ5IGJlZm9yZSBjaGVjaGluZyBpZiB0aGUgY2hhbmdlcyBhcmUKPiBvayBm
b3IgeW91LiBQbGVhc2UgY2hlY2sgaXQgb3V0IGFnYWluLCBJIGp1c3QgcmVtb3ZlZCBzb21lIGhl
bHBlciBtYWNyb3MKPiB0aGF0IHdlcmUgbm90IGJlaW5nIHVzZWQgZWxzZXdoZXJlIGluIHRoZSBr
ZXJuZWwuCkkgZm91bmQgdGhpcyBvcHRpbWl6YXRpb24gaGFzIGNvbmZsaWN0cyB3aXRoIHRoZSBi
ZWxvdyBwYXRjaGVzOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDgw
MjE2NDcwMS4xOTI3OTEtMTUtZ3VvcmVuQGtlcm5lbC5vcmcvCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjMwODAyMTY0NzAxLjE5Mjc5MS01LWd1b3JlbkBrZXJuZWwub3Jn
LwoKSWYgeW91cnMgbWVyZ2VkLCBob3cgZG8gd2Ugc3VwcG9ydCB0aGUgaW5saW5lIGNtcHhjaGcv
eGNoZ19zbWFsbApmdW5jdGlvbj8gSXQncyB2ZXJ5IHN0cnVnZ2xpbmcgdG8gdXNlIG1hY3JvcyB0
byBpbXBsZW1lbnQgY29tcGxleApmdW5jdGlvbnMuCgpDb3VsZCB5b3UgY29uc2lkZXIgYSBtb3Jl
IHJlbGF4ZWQgb3B0aW1pemF0aW9uIGluIHdoaWNoIHdlIGNvdWxkCmluc2VydCBpbmxpbmUgY21w
eGNoZy94Y2hnX3NtYWxsPwoKPgo+IFRoYW5rcyEKPiBMZW8KPgo+Cj4gQ2hhbmdlcyBzaW5jZSBz
cXVhc2hlZCBjbXB4Y2hnOgo+IC0gVW5pZmllZCB3aXRoIGF0b21pYy5jIHBhdGNoc2V0Cj4gLSBS
ZWJhc2VkIG9uIHRvcCBvZiB0b3J2YWxkcy9tYXN0ZXIgKHRoYW5rcyBBbmRyZWEgUGFycmkhKQo+
IC0gUmVtb3ZlZCBoZWxwZXIgbWFjcm9zIHRoYXQgd2VyZSBub3QgYmVpbmcgdXNlZCBlbHNld2hl
cmUgaW4gdGhlIGtlcm5lbC4KPgo+IENoYW5nZXMgc2luY2UgKGNtcHhjaGcpIFJGQ3YzOgo+IC0g
U3F1YXNoZWQgdGhlIDYgb3JpZ2luYWwgcGF0Y2hlcyBpbiAyOiBvbmUgZm9yIGNtcHhjaGcgYW5k
IG9uZSBmb3IgeGNoZwo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDQwNDE2Mzc0
MS4yNzYyMTY1LTEtbGVvYnJhc0ByZWRoYXQuY29tLwo+Cj4gQ2hhbmdlcyBzaW5jZSAoY21weGNo
ZykgUkZDdjI6Cj4gLSBGaXhlZCAgbWFjcm9zIHRoYXQgZGVwZW5kIG9uIGhhdmluZyBhIGxvY2Fs
IHZhcmlhYmxlIHdpdGggYSBtYWdpYyBuYW1lCj4gLSBQcmV2aW91cyBjYXN0IHRvIChsb25nKSBp
cyBub3cgb25seSBhcHBsaWVkIG9uIDQtYnl0ZXMgY21weGNoZwo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDIzMDMyMTA3NDI0OS4yMjIxNjc0LTEtbGVvYnJhc0ByZWRoYXQuY29tLwo+
Cj4gQ2hhbmdlcyBzaW5jZSAoY21weGNoZykgUkZDdjE6Cj4gLSBGaXhlZCBwYXRjaCA0LzYgc3Vm
Zml4IGZyb20gJ3cuYXFybCcgdG8gJy53LmFxcmwnLCB0byBhdm9pZCBidWlsZCBlcnJvcgo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDMxODA4MDA1OS4xMTA5Mjg2LTEtbGVvYnJh
c0ByZWRoYXQuY29tLwo+Cj4KPiBMZW9uYXJkbyBCcmFzICgzKToKPiAgIHJpc2N2L2NtcHhjaGc6
IERlZHVwbGljYXRlIHhjaGcoKSBhc20gZnVuY3Rpb25zCj4gICByaXNjdi9jbXB4Y2hnOiBEZWR1
cGxpY2F0ZSBjbXB4Y2hnKCkgYXNtIGFuZCBtYWNyb3MKPiAgIHJpc2N2L2F0b21pYy5oIDogRGVk
dXBsaWNhdGUgYXJjaF9hdG9taWMuKgo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWlj
LmggIHwgMTY0ICsrKysrKysrLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4
Y2hnLmggfCAzMTggKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDEyMyBpbnNlcnRpb25zKCspLCAzNTkgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNDEu
MAo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
