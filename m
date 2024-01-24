Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533A1C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoRHhoJLJLp7CB/PqpTH8LphYLWNRoKrAsbMomIQ4/k=; b=sZ+ca4N6Ro1TYO
	qlEjqNKEvKzp+myyprAvV+Hr+0vbyVyNELJOduIZvqdk1R971oJKSPOW8PsWl+wM0JYYro/8Ln1Hr
	Mtlt9qVm2iufuH9ayvKBy1rQ3SvITz2M7sdVjDNO+zS1qytJ8ajHlZseM2H4LSE+rCIPzkXepmty1
	AXKOx4L5gi8ThNqNFuH+/Z3NcElJc6zQrITo5gG+SDoGndxsQfP28njkg40lCXm2vi7sONkhRS4DM
	2qCDPIxle+5HyXIBwMQ08UorWN/3HR4SlibbkGkY7ussVLKGj2W1xCnU8w+lArJC4/CdJfKSS1MKY
	SGPwfdG9dM+SBp3TcAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYpG-0022jM-1Y;
	Wed, 24 Jan 2024 08:41:38 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYpC-0022hb-2i
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 08:41:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8E3760002;
	Wed, 24 Jan 2024 08:41:27 +0000 (UTC)
Message-ID: <65bd3d38-dcc0-4e64-b35b-8a2e697768ff@ghiti.fr>
Date: Wed, 24 Jan 2024 09:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [PATCH] riscv: Fix wrong size passed to
 local_flush_tlb_range_asid()
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Dennis Zhou <dennis@kernel.org>, yunhui cui <cuiyunhui@bytedance.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240123132730.2297719-1-alexghiti@rivosinc.com>
 <CAEEQ3wk5edUFTuE3H3KDGkCXj0+=i7Z1BM2M+6X-Tk9_m8X_iQ@mail.gmail.com>
 <ZbDICZkatO3/lGf/@snowbird> <cd68cf4e-7a6b-4875-ae1b-0c28a6eacaad@ghiti.fr>
In-Reply-To: <cd68cf4e-7a6b-4875-ae1b-0c28a6eacaad@ghiti.fr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_004135_156618_91677288 
X-CRM114-Status: GOOD (  28.22  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjQvMDEvMjAyNCAwOTozOCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIERlbm5pcywg
WXVuaHVpLAo+Cj4gT24gMjQvMDEvMjAyNCAwOToxOSwgRGVubmlzIFpob3Ugd3JvdGU6Cj4+IEhl
bGxvLAo+Pgo+PiBPbiBXZWQsIEphbiAyNCwgMjAyNCBhdCAxMDo0NDoxMkFNICswODAwLCB5dW5o
dWkgY3VpIHdyb3RlOgo+Pj4gSGkgQWxleGFuZHJlLAo+Pj4KPj4+IE9uIFR1ZSwgSmFuIDIzLCAy
MDI0IGF0IDk6MzHigK9QTSBBbGV4YW5kcmUgR2hpdGkgCj4+PiA8YWxleGdoaXRpQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4+Pj4gbG9jYWxfZmx1c2hfdGxiX3JhbmdlX2FzaWQoKSB0YWtlcyB0aGUg
c2l6ZSBhcyBhcmd1bWVudCwgbm90IHRoZSAKPj4+PiBlbmQgb2YKPj4+PiB0aGUgcmFuZ2UgdG8g
Zmx1c2gsIHNvIGZpeCB0aGlzIGJ5IGNvbXB1dGluZyB0aGUgc2l6ZSBmcm9tIHRoZSBlbmQgYW5k
Cj4+Pj4gdGhlIHN0YXJ0IG9mIHRoZSByYW5nZS4KPj4+Pgo+Pj4+IEZpeGVzOiA3YTkyZmM4YjRk
MjAgKCJtbTogSW50cm9kdWNlIGZsdXNoX2NhY2hlX3ZtYXBfZWFybHkoKSIpCj4+Pj4gU2lnbmVk
LW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+Pj4+IC0t
LQo+Pj4+IMKgIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyB8IDIgKy0KPj4+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMK
Pj4+PiBpbmRleCA4ZDEyYjI2ZjVhYzMuLjk2MTk5NjVmNjUwMSAxMDA2NDQKPj4+PiAtLS0gYS9h
cmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNo
LmMKPj4+PiBAQCAtNjgsNyArNjgsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgCj4+Pj4gbG9jYWxf
Zmx1c2hfdGxiX3JhbmdlX2FzaWQodW5zaWduZWQgbG9uZyBzdGFydCwKPj4+Pgo+Pj4+IMKgIHZv
aWQgbG9jYWxfZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNp
Z25lZCAKPj4+PiBsb25nIGVuZCkKPj4+PiDCoCB7Cj4+Pj4gLcKgwqDCoMKgwqDCoCBsb2NhbF9m
bHVzaF90bGJfcmFuZ2VfYXNpZChzdGFydCwgZW5kLCBQQUdFX1NJWkUsIAo+Pj4+IEZMVVNIX1RM
Ql9OT19BU0lEKTsKPj4+PiArwqDCoMKgwqDCoMKgIGxvY2FsX2ZsdXNoX3RsYl9yYW5nZV9hc2lk
KHN0YXJ0LCBlbmQgLSBzdGFydCwgUEFHRV9TSVpFLCAKPj4+PiBGTFVTSF9UTEJfTk9fQVNJRCk7
Cj4+Pj4gwqAgfQo+PiBXZWxsIHRoaXMgd2FzIGEgbWlzcyBkdXJpbmcgY29kZSByZXZpZXcuLiBJ
J20gZ29pbmcgdG8gdGFrZSBhbm90aGVyIGxvb2sKPj4gdG9tb3Jyb3cgYW5kIHRoZW4gbGlrZWx5
IHB1bGwgdGhpcyBpbnRvIGEgZml4ZXMgYnJhbmNoLgo+Pgo+Pj4gV2hhdCBtYWtlcyBtZSBjdXJp
b3VzIGlzIHRoYXQgdGhpcyBwYXRjaCBoYXMgbm90IGJlZW4gdGVzdGVkPwo+Pj4gQlRXLCBJdCBp
cyBiZXN0IHRvIGtlZXAgdGhlIHBhcmFtZXRlciBvcmRlciBvZiBhbGwgZnVuY3Rpb25zIGluCj4+
PiB0bGJmbHVzaC5jIGNvbnNpc3RlbnQ6IGNwdW1hc2ssIHN0YXJ0LCBzaXplLCBzdHJpZGUsIGFz
aWQuCj4+Pgo+PiBJIGNhbid0IHNwZWFrIHRvIHRoZSByaXNjdiBjb21tdW5pdGllcyB0ZXN0aW5n
L3JlZ3Jlc3Npb24gc3VpdGVzLCBidXQKPj4gdGhpcyB3b3VsZCBvbmx5IGJlIGNhdWdodCBpbiBh
IHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24gdGVzdC4KPj4KPj4gVGhhdCBiZWluZyBzYWlkLCBBbGV4
YW5kcmUsIGNhbiB5b3UgcGxlYXNlIGxtayB3aGF0IGxldmVsIG9mIHRlc3RpbmcKPj4gdGhpcyBo
YXMgZ29uZSB0aHJvdWdoPwo+Cj4KPiBBbGwgbXkgcGF0Y2hlcyBnbyB0aHJvdWdoIHRoZSBzYW1l
IGxldmVsIG9mIHRlc3Rpbmc6Cj4KPiAqIEJ1aWxkL2Jvb3QgYW4gVWJ1bnR1IGtlcm5lbCB3aXRo
IGFuZCB3aXRob3V0IEtBU0FOICsgYSBmZXcgc2ltcGxlIAo+IHRlc3RzdWl0ZXMgKGxpYmh1Z2V0
bGJmcywgcmlzY3Yga3NlbGZ0ZXN0cyBhbmQgb3RoZXIpCj4gKiBCdWlsZC9ib290IGEgc2ltcGxl
IHJvb3RmcyBvbiB+NDAgZGlmZmVyZW50IHJ2NjQgY29uZmlncwo+ICogQnVpbGQvYm9vdCBhIHNp
bXBsZSByb290ZnMgb24gfjMwIGRpZmZlcmVudCBydjMyIGNvbmZpZ3MKPgo+IEFuZCBJIHJ1biBM
VFAvZnVsbCBrc2VsZnRlc3RzL3BlcmYgdGVzdHN1aXRlIG9uIGEgd2Vla2x5IGJhc2lzIG9uIAo+
IGV2ZXJ5IHJjLiBBbGwgdGhpcyB2YWxpZGF0aW9uIGlzIGRvbmUgb24gcWVtdS4KPgo+IFRoZSBw
YXRjaCBpcyBmdW5jdGlvbmFsLCBpdCAic2ltcGx5IiBmbHVzaGVzIHRoZSB3aG9sZSBUTEIgaW5z
dGVhZCBvZiAKPiBhIGZldyBlbnRyaWVzLCBzbyB0aGUgb25seSB3YXkgdG8gY2F0Y2ggdGhhdCB3
b3VsZCBoYXZlIGJlZW4gYSAKPiBwZXJmb3JtYW5jZSByZWdyZXNzaW9uLiBCdXQgZ2l2ZW4gaXQg
b25seSBydW5zIG9uIHFlbXUsIGl0IHdvdWxkIGhhdmUgCj4gYmVlbiBoYXJkIHRvIGNhdGNoIGFu
eSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uIHNpbmNlIHRoYXQgaW52b2x2ZXMgdGhlIAo+IFRMQi4K
Pgo+IEBZdW5odWk6IFBsZWFzZSBsZXQgbWUga25vdyBob3cgSSBzaG91bGQgdmFsaWRhdGUgbXkg
cGF0Y2hlcyBiZXR0ZXIuCgoKQFl1bmh1aTogQW5kIEJUVywgd2UgbGFjayByZXZpZXdlcnMsIHNv
IGZlZWwgZnJlZSB0byBoZWxwIDspCgoKPgo+IFRoYW5rcywKPgo+IEFsZXgKPgo+Cj4+IFRoYW5r
cywKPj4gRGVubmlzCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
