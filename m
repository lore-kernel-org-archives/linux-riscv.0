Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493B7FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ILgnyDBqOQacp6J+QzYw9z6ryUipt/iy/WBuYHg46c=; b=o2oq8oUlObjaeP
	1ny84rR9DrpaOSOJSephZYwqupZAmKIA+lzDlJiRtGgL4RoO+mK7Wnlb6mdp5ksn4WjUgj19q8fLt
	gcRi+b+8FxoFp1vlb6NtL3JTEYNJuV+H/RulHhHfYKXRyJmIa6Ut1z+ArRknNnUvGSUNWTWHM7O8P
	D7roVqk5oh6Zca9Z1Vf6W1b674oUZ+YzmM6pi01OzSoi63Le0o3xKg2s9I2NWfgj5F5Z3h7dUCXyn
	XeWI1ks+mz+1qxjLkWdqyLhgQ5r2oFQ5NWkOiPF3X9rDl8yS4WwIBworcvis4+bcnRV2BuiSKhmkR
	+GlVO2WWb5Dt0BH7wgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRu9-00000005Ygm-1908;
	Thu, 30 Apr 2026 13:58:13 +0000
Received: from smtp-bc0d.mail.infomaniak.ch ([2001:1600:19:d548::bc0d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRu6-00000005YgJ-30tg
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 13:58:12 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g5wjp0P4Rz4Qx;
	Thu, 30 Apr 2026 15:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etik.com;
	s=20210927; t=1777557485;
	bh=6MN5b6AXIZEs5B1CYSHMib1fuxSrQi5mqBq0Yp+0EIo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=XApbek+vslcbPq5JfqS0gPpQ94l6QAmJ3ZxcXoimQGjIafXpEBkCmLzG4HhdU975J
	 XA2Dm50eTGZz2cnO5iKN+ZL7TO+flhCLpyUNTQpuD9X272/smPoJx7tK/qKbHsGH+K
	 Q4tsOAc1wvAT1FE77t4idN1gpVf89N9+0Jpe4sNo=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4g5wjl53RNzqk7;
	Thu, 30 Apr 2026 15:58:03 +0200 (CEST)
Message-ID: <19231338-b525-4943-878a-80414b0015e2@etik.com>
Date: Thu, 30 Apr 2026 15:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/riscv: per-CPU devid setup for Xen event channel IRQ on
 IMSIC
From: Baptiste Le Duc <baptiste.leduc@etik.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, oleksii.kurochko@gmail.com
References: <75820aee-f842-4f40-983b-f360ae6e6d29@etik.com>
 <CAAhSdy2HK2DKF_9Z_Cdx3NzsOs9DxHBPM0-1xVHgMwiYsv9-Og@mail.gmail.com>
 <ea9622c3-3410-4115-9d54-9f11fc99f996@etik.com>
Content-Language: en-US
Autocrypt: addr=baptiste.leduc@etik.com; keydata=
 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
In-Reply-To: <ea9622c3-3410-4115-9d54-9f11fc99f996@etik.com>
Feedback-ID: :bbb8044e0943cee:ham:8bba193fd89ba14
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_065810_922753_F40085C3 
X-CRM114-Status: GOOD (  12.42  )
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

Ck9uIDQvMzAvMjYgMzowMyBQTSwgQmFwdGlzdGUgTGUgRHVjIHdyb3RlOgo+Cj4gT24gNC8yNC8y
NiA2OjU1IFBNLCBBbnVwIFBhdGVsIHdyb3RlOgo+PiBPbiBGcmksIEFwciAyNCwgMjAyNiBhdCAx
MDowOeKAr1BNIEJhcHRpc3RlIExlIER1Ywo+PiA8YmFwdGlzdGUubGVkdWNAZXRpay5jb20+IHdy
b3RlOgo+Pj4gSGksCj4+Pgo+Pj4gV2hpbGUgYWRkaW5nIFhlbi9SSVNDLVYgc3VwcG9ydCwgdGhl
IGd1ZXN0IGV2ZW50IGNoYW5uZWwgaW50ZXJydXB0IGlzCj4+PiBhbGxvY2F0ZWQgdmlhIGlycV9v
Zl9wYXJzZV9hbmRfbWFwKCkgYWdhaW5zdCB0aGUgSU1TSUMgZG9tYWluIGFuZCwgaWYKPj4+IHdl
IHJlZmVyIHRvIHRoZSBBUk0gaW1wbGVtZW50YXRpb24sIGl0IG11c3QKPj4+IGJlIGVuYWJsZWQv
ZGlzYWJsZWQgcGVyIHZDUFUgdGhyb3VnaCBlbmFibGVfcGVyY3B1X2lycSgpIC8KPj4+IGRpc2Fi
bGVfcGVyY3B1X2lycSgpIGluIHRoZSBDUFUgaG90cGx1ZyBjYWxsYmFja3MuCj4+Pgo+Pj4gV2l0
aCBJTVNJQyB1c2luZyBoYW5kbGVfZWRnZV9pcnEgKHRoZSB1cHN0cmVhbSBkZWZhdWx0KSwKPj4+
IGVuYWJsZV9wZXJjcHVfaXJxKCkgbmV2ZXIgY2xlYXJzIElSUURfSVJRX0RJU0FCTEVELiBUaGF0
IGZsYWcgaXMgc2V0IGF0Cj4+PiBpcnFfZGVzYyBhbGxvY2F0aW9uIHRpbWUgKGlycWRlc2MuYykg
YW5kIGlzIG9ubHkgY2xlYXJlZCBieQo+Pj4gaXJxX3N0YXJ0dXAoKSwgd2hpY2ggaXMgY2FsbGVk
IGZyb20gX19zZXR1cF9pcnEoKSBvbmx5IHdoZW4KPj4+IGlycV9zZXR0aW5nc19jYW5fYXV0b2Vu
YWJsZSgpIHJldHVybnMgdHJ1ZS4KPj4+Cj4+PiBpcnFfc2V0X3BlcmNwdV9kZXZpZCgpIHNldHMg
SVJRX05PQVVUT0VOICh2aWEgCj4+PiBpcnFfc2V0X3BlcmNwdV9kZXZpZF9mbGFncyksCj4+PiBz
byBpcnFfc3RhcnR1cCgpIGlzIGludGVudGlvbmFsbHkgc2tpcHBlZCBmb3IgcGVyY3B1LWRldmlk
IElSUXMuCj4+PiBlbmFibGVfcGVyY3B1X2lycSgpIGNhbGxzIGlycV9wZXJjcHVfZW5hYmxlKCkg
d2hpY2ggZG9lcyAKPj4+IGlycV9lbmFibGUvdW5tYXNrCj4+PiBvbiB0aGUgY2hpcCBidXQgbmV2
ZXIgdG91Y2hlcyBJUlFEX0lSUV9ESVNBQkxFRC4KPj4+Cj4+PiBSZXN1bHQ6IGhhbmRsZV9lZGdl
X2lycSgpIGhpdHMgaXJxX2Nhbl9oYW5kbGVfYWN0aW9ucygpIOKGkiBjaGVja3MKPj4+IGlycWRf
aXJxX2Rpc2FibGVkKCkg4oaSIHJldHVybnMgZmFsc2Ug4oaSIElSUSBzaWxlbnRseSBkcm9wcGVk
Lgo+Pj4KPj4+IFRoaXMgd2FzIGNvbmZpcm1lZCBieSBsb2dzOgo+Pj4KPj4+IMKgwqDCoCBYRU5f
VFJBQ0UgaXJxPTEyIHBlcmNwdV9lbmFibGUgY3B1PTAgSVJRRF9ESVNBQkxFRD0xCj4+PiDCoMKg
wqAgWEVOX1RSQUNFIGlycT0xMiBoYW5kbGVfZWRnZSBEUk9QIElSUURfRElTQUJMRUQ9MSBhY3Rp
b249Li4uCj4+Pgo+Pj4gV2hhdCB3ZSB0cmllZAo+Pj4gLS0tLS0tLS0tLS0tLQo+Pj4gLSByZXF1
ZXN0X2lycSgpIGNvcnJlY3RseSB3b3JrcyB3aXRoIHVwc3RyZWFtIElNU0lDIHdoaWNoIHVzZXMK
Pj4+IGhhbmRsZV9lZGdlX2lycSB3aXRoIG5vCj4+PiBpcnFfc2V0X3BlcmNwdV9kZXZpZCgpIGJ1
dCBpdCBtZWFucyB3ZSBvbmx5IGNhbiBoYXZlIG9uZSB2Q1BVIHdoaWNoIAo+Pj4gd2lsbAo+Pj4g
YWx3YXlzIGhhbmRsZSB0aGUgaXJxLAo+Pj4gYW5kIHdlIGRvbid0IHdhbnQgdGhhdC4KPj4+Cj4+
PiAtIEFkZGluZyBpcnFfc2V0X3BlcmNwdV9kZXZpZCgpICsgc3dpdGNoaW5nIHRvIAo+Pj4gaGFu
ZGxlX3BlcmNwdV9kZXZpZF9pcnEgaW4KPj4+IGltc2ljX2lycV9kb21haW5fYWxsb2MoKSBmaXhl
cyB0aGUgWGVuIGNhc2UgYnV0IGJyZWFrcyBhbGwgb3RoZXIgSU1TSUMKPj4+IHVzZXJzIChQQ0kg
TVNJLCBwbGF0Zm9ybSBkZXZpY2VzKSB0aGF0IGNhbGwgcmVxdWVzdF9pcnEoKSwgc2luY2UKPj4+
IHJlcXVlc3RfdGhyZWFkZWRfaXJxKCkgcmVqZWN0cyBJUlFzIG1hcmtlZCBfSVJRX1BFUl9DUFVf
REVWSUQ6Cj4+Pgo+Pj4gwqDCoMKgIFdBUk5JTkc6IENQVTogMCBQSUQ6IDEgYXQga2VybmVsL2ly
cS9tYW5hZ2UuYzoyMTAxCj4+PiDCoMKgwqAgcmVxdWVzdF90aHJlYWRlZF9pcnErMHg4MC8weDEy
Ywo+Pj4KPj4+IFRoZXJlZm9yZSwgZG8geW91IGhhdmUgYW55IHJlY29tbWVuZGF0aW9ucyBvbiBo
b3cgc2hvdWxkIEkgaGFuZGxlIHRoaXMKPj4+IGNhc2UgPwo+Pj4KPj4gVGhlIFJJU0MtViBJTVNJ
QyBkcml2ZXIgZG9lcyBub3QgcmVnaXN0ZXIgcGVyLUNQVSBpbnRlcnJ1cHRzCj4+IHJhdGhlciBp
dCB0cmVhdHMgSURzIGFjcm9zcyBhbGwgQ1BVcyBhcyBpbmRlcGVuZGVudCB2ZWN0b3JzIGFuZAo+
PiBwaWNrcyB0aGUgcmlnaHQgdmVjdG9yIGZvciBhIGRldmljZSBNU0kgYmFzZWQgb24gYXZhaWxh
YmlsaXR5ICsgCj4+IGFmZmluaXR5Lgo+Pgo+PiBPbmx5IHRoZSBSSVNDLVYgaW50YyBkcml2ZXIg
bWFuYWdlcyBwZXItQ1BVIGludGVycnVwdHMgc28gdGhlCj4+IFhlbiBndWVzdCBldmVudCBjaGFu
bmVsIGludGVycnVwdCBzaG91bGQgYmUgYSBsb2NhbCBpbnRlcnJ1cHQKPj4gbWFuYWdlZCBieSBS
SVNDLVYgaW50YyBkcml2ZXIuCj4KPiBEbyB5b3UgbWVhbiB0aGUgc29mdHdhcmUgaW50ZXJydXB0
IGJpdCAoYml0IDIpIG9mIFJJU0MtViBpbnRjIG9yIAo+IHNvbWV0aGluZyBlbHNlID8KPgoKT2sg
SSB1bmRlcnN0b29kLCB3ZSB1c2VkIGJpdHMgMTM6NjQgZnJvbSBodmlwIGNzciBhbmQgaXQgd29y
a3Mgd2l0aCB0aGUgClFFTVUgaW1wbGVtZW50YXRpb24uClRoYW5rcyBmb3IgeW91ciBoZWxwLgoK
Pj4KPj4gUmVnYXJkcywKPj4gQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
