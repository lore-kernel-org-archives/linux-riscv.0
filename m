Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FA1C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 08:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOirBcik6IO96Ti0T7fc5h4iLiBwjbwIfZB5lkKkLZQ=; b=DVZxU+w9eku3lm
	IHc4Eg1Gy6bEMB7P3whLL96TAWvstYZ6QKrrRzsvIY0qCPkdswfVOsTISRK8Sj8Bc3AFgfPyqOzLb
	kD2KNNfnHTibB6iknUYRvx+Ty3jgJoQXWdPvPfIDkZPavqQejtE3us5NFFWuoCCTDfDX52YMpIqgr
	GzOBTMdtb48Q8vJ/jqqlIeAXwwnOdgY673hC/z39TwBjINgD/kepPMq/Gffl3Gsw7UNPJROqXQVXI
	msaEsFoklQ7rea8GuEET273FNf/accOV9KdrPIXKTQoi+HKyI+S67Jcd5n3bAOkii5cqmWryslI75
	wJQScHf+gDOdjSumKWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYmQ-00220C-0F;
	Wed, 24 Jan 2024 08:38:42 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYmM-0021yW-24
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 08:38:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9D7640002;
	Wed, 24 Jan 2024 08:38:30 +0000 (UTC)
Message-ID: <cd68cf4e-7a6b-4875-ae1b-0c28a6eacaad@ghiti.fr>
Date: Wed, 24 Jan 2024 09:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [PATCH] riscv: Fix wrong size passed to
 local_flush_tlb_range_asid()
Content-Language: en-US
To: Dennis Zhou <dennis@kernel.org>, yunhui cui <cuiyunhui@bytedance.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240123132730.2297719-1-alexghiti@rivosinc.com>
 <CAEEQ3wk5edUFTuE3H3KDGkCXj0+=i7Z1BM2M+6X-Tk9_m8X_iQ@mail.gmail.com>
 <ZbDICZkatO3/lGf/@snowbird>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZbDICZkatO3/lGf/@snowbird>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_003838_830758_2FB17F16 
X-CRM114-Status: GOOD (  24.64  )
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

SGkgRGVubmlzLCBZdW5odWksCgpPbiAyNC8wMS8yMDI0IDA5OjE5LCBEZW5uaXMgWmhvdSB3cm90
ZToKPiBIZWxsbywKPgo+IE9uIFdlZCwgSmFuIDI0LCAyMDI0IGF0IDEwOjQ0OjEyQU0gKzA4MDAs
IHl1bmh1aSBjdWkgd3JvdGU6Cj4+IEhpIEFsZXhhbmRyZSwKPj4KPj4gT24gVHVlLCBKYW4gMjMs
IDIwMjQgYXQgOTozMeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNv
bT4gd3JvdGU6Cj4+PiBsb2NhbF9mbHVzaF90bGJfcmFuZ2VfYXNpZCgpIHRha2VzIHRoZSBzaXpl
IGFzIGFyZ3VtZW50LCBub3QgdGhlIGVuZCBvZgo+Pj4gdGhlIHJhbmdlIHRvIGZsdXNoLCBzbyBm
aXggdGhpcyBieSBjb21wdXRpbmcgdGhlIHNpemUgZnJvbSB0aGUgZW5kIGFuZAo+Pj4gdGhlIHN0
YXJ0IG9mIHRoZSByYW5nZS4KPj4+Cj4+PiBGaXhlczogN2E5MmZjOGI0ZDIwICgibW06IEludHJv
ZHVjZSBmbHVzaF9jYWNoZV92bWFwX2Vhcmx5KCkiKQo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+Pj4gLS0tCj4+PiAgIGFyY2gvcmlz
Y3YvbW0vdGxiZmx1c2guYyB8IDIgKy0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxi
Zmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+Pj4gaW5kZXggOGQxMmIyNmY1YWMz
Li45NjE5OTY1ZjY1MDEgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMK
Pj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+Pj4gQEAgLTY4LDcgKzY4LDcgQEAg
c3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9yYW5nZV9hc2lkKHVuc2lnbmVkIGxv
bmcgc3RhcnQsCj4+Pgo+Pj4gICB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5z
aWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpCj4+PiAgIHsKPj4+IC0gICAgICAg
bG9jYWxfZmx1c2hfdGxiX3JhbmdlX2FzaWQoc3RhcnQsIGVuZCwgUEFHRV9TSVpFLCBGTFVTSF9U
TEJfTk9fQVNJRCk7Cj4+PiArICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9yYW5nZV9hc2lkKHN0YXJ0
LCBlbmQgLSBzdGFydCwgUEFHRV9TSVpFLCBGTFVTSF9UTEJfTk9fQVNJRCk7Cj4+PiAgIH0KPiBX
ZWxsIHRoaXMgd2FzIGEgbWlzcyBkdXJpbmcgY29kZSByZXZpZXcuLiBJJ20gZ29pbmcgdG8gdGFr
ZSBhbm90aGVyIGxvb2sKPiB0b21vcnJvdyBhbmQgdGhlbiBsaWtlbHkgcHVsbCB0aGlzIGludG8g
YSBmaXhlcyBicmFuY2guCj4KPj4gV2hhdCBtYWtlcyBtZSBjdXJpb3VzIGlzIHRoYXQgdGhpcyBw
YXRjaCBoYXMgbm90IGJlZW4gdGVzdGVkPwo+PiBCVFcsIEl0IGlzIGJlc3QgdG8ga2VlcCB0aGUg
cGFyYW1ldGVyIG9yZGVyIG9mIGFsbCBmdW5jdGlvbnMgaW4KPj4gdGxiZmx1c2guYyBjb25zaXN0
ZW50OiBjcHVtYXNrLCBzdGFydCwgc2l6ZSwgc3RyaWRlLCBhc2lkLgo+Pgo+IEkgY2FuJ3Qgc3Bl
YWsgdG8gdGhlIHJpc2N2IGNvbW11bml0aWVzIHRlc3RpbmcvcmVncmVzc2lvbiBzdWl0ZXMsIGJ1
dAo+IHRoaXMgd291bGQgb25seSBiZSBjYXVnaHQgaW4gYSBwZXJmb3JtYW5jZSByZWdyZXNzaW9u
IHRlc3QuCj4KPiBUaGF0IGJlaW5nIHNhaWQsIEFsZXhhbmRyZSwgY2FuIHlvdSBwbGVhc2UgbG1r
IHdoYXQgbGV2ZWwgb2YgdGVzdGluZwo+IHRoaXMgaGFzIGdvbmUgdGhyb3VnaD8KCgpBbGwgbXkg
cGF0Y2hlcyBnbyB0aHJvdWdoIHRoZSBzYW1lIGxldmVsIG9mIHRlc3Rpbmc6CgoqIEJ1aWxkL2Jv
b3QgYW4gVWJ1bnR1IGtlcm5lbCB3aXRoIGFuZCB3aXRob3V0IEtBU0FOICsgYSBmZXcgc2ltcGxl
IAp0ZXN0c3VpdGVzIChsaWJodWdldGxiZnMsIHJpc2N2IGtzZWxmdGVzdHMgYW5kIG90aGVyKQoq
IEJ1aWxkL2Jvb3QgYSBzaW1wbGUgcm9vdGZzIG9uIH40MCBkaWZmZXJlbnQgcnY2NCBjb25maWdz
CiogQnVpbGQvYm9vdCBhIHNpbXBsZSByb290ZnMgb24gfjMwIGRpZmZlcmVudCBydjMyIGNvbmZp
Z3MKCkFuZCBJIHJ1biBMVFAvZnVsbCBrc2VsZnRlc3RzL3BlcmYgdGVzdHN1aXRlIG9uIGEgd2Vl
a2x5IGJhc2lzIG9uIGV2ZXJ5IApyYy4gQWxsIHRoaXMgdmFsaWRhdGlvbiBpcyBkb25lIG9uIHFl
bXUuCgpUaGUgcGF0Y2ggaXMgZnVuY3Rpb25hbCwgaXQgInNpbXBseSIgZmx1c2hlcyB0aGUgd2hv
bGUgVExCIGluc3RlYWQgb2YgYSAKZmV3IGVudHJpZXMsIHNvIHRoZSBvbmx5IHdheSB0byBjYXRj
aCB0aGF0IHdvdWxkIGhhdmUgYmVlbiBhIHBlcmZvcm1hbmNlIApyZWdyZXNzaW9uLiBCdXQgZ2l2
ZW4gaXQgb25seSBydW5zIG9uIHFlbXUsIGl0IHdvdWxkIGhhdmUgYmVlbiBoYXJkIHRvIApjYXRj
aCBhbnkgcGVyZm9ybWFuY2UgcmVncmVzc2lvbiBzaW5jZSB0aGF0IGludm9sdmVzIHRoZSBUTEIu
CgpAWXVuaHVpOiBQbGVhc2UgbGV0IG1lIGtub3cgaG93IEkgc2hvdWxkIHZhbGlkYXRlIG15IHBh
dGNoZXMgYmV0dGVyLgoKVGhhbmtzLAoKQWxleAoKCj4gVGhhbmtzLAo+IERlbm5pcwo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
