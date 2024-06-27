Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC122C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B10/B0gbKzgUnxffELpOVRIqB1OKAbk6XGdsj3m5NkY=; b=l0DZSmPWWFgalY
	uvt/CExQoUGKQK2tqJ1zci+j9TENPywOpeXE4Rn9J+UUfqgD0XbN3xIo0vA9reKCo3fhrgSH4BHXq
	uaxetU4F+lcM1El0ZbUE71O3hNVVWL70Re8ikhjr/In7fDRPehF0lHFYH/kvH/lEcRU4q1DN+8UDs
	h8AAtPORVwGxuU/QDfjRikmpJVTAyOJhkQGrRj6Q30MQ+GJkhGOtM71oBd9q1e/mpwTbPNCAkG7zt
	FTFIZNDbtQ5va350Z7O7YfYnkgBrFbtk2QIhleVD0M/kkpP8TvXogz9VxY4ktBzBHt5X8e59Iw88H
	c8SUCsry6NGaIDhVqxtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMm3I-00000009sgv-24RR;
	Thu, 27 Jun 2024 10:08:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMm3H-00000009sgX-2Yas
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Jun 2024 10:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=s6vU3rpDWRH8naKZi/HqHgG7Z9ZPWbzDS5Kv4z4L2/I=; b=mWZsKgc2uIWSC9TtQxiYpD93Sj
	U+GN1cOPpN4Rdc2qNxgs4xZ9FKQwSO4obVPp2KtyZeKRdDmblH1aCB/OY2SlWFa8UsmiaRUCqOjl+
	4sKD9VnJ17OBoOfZ6y5oFkEejIzli8/XqxzCbI2Y2doxvIN2M39glkjxgeBLGV7+UPeFYjbSCnibu
	n+WVzL4WsOVYPCXS7bTFOxeFi9rBG/SKcXdOsX2GrFubVrIy79i8UFbl2XLHtur2KBAtzELZCvPMz
	YYqC5EcfWAfpueavFGdgeJxdvs/D4V1I4kvXld7jdz+vDpcPA+c4UXvHNNCMjXD69JJOx+OBlPCGb
	oJZkQhrw==;
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by casper.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMlp9-0000000DPUw-2msM
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 09:53:53 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id B8BF172C8CC;
	Thu, 27 Jun 2024 12:52:58 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 9F34E7CCB3C; Thu, 27 Jun 2024 12:52:58 +0300 (IDT)
Date: Thu, 27 Jun 2024 12:52:58 +0300
From: "Dmitry V. Levin" <ldv@strace.io>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Cc: Celeste Liu <coelacanthushex@gmail.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andreas Schwab <schwab@suse.de>,
	David Laight <David.Laight@aculab.com>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"Ivan A. Melnikov" <iv@altlinux.org>
Subject: Re: [PATCH v5] riscv: entry: set a0 = -ENOSYS only when syscall != -1
Message-ID: <20240627095258.GA2977@altlinux.org>
References: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
 <20240627071422.GA2626@altlinux.org>
 <9c102328-6bb3-46b6-bc2f-d011a284d5b0@gmail.com>
 <CA+FstbVf7TJx==WsY5fBoFrdeY8php5ETn8kMq5s6YScy-2O=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+FstbVf7TJx==WsY5fBoFrdeY8php5ETn8kMq5s6YScy-2O=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_105351_841792_4964354A 
X-CRM114-Status: GOOD (  28.80  )
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

T24gVGh1LCBKdW4gMjcsIDIwMjQgYXQgMTE6NDM6MDNBTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiBPbiBUaHUsIEp1biAyNywgMjAyNCBhdCA5OjQ34oCvQU0gQ2VsZXN0ZSBMaXUgPGNv
ZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gT24gMjAyNC0wNi0yNyAxNToxNCwg
RG1pdHJ5IFYuIExldmluIHdyb3RlOgo+ID4KPiA+ID4gSGksCj4gPiA+Cj4gPiA+IE9uIFR1ZSwg
QXVnIDAxLCAyMDIzIGF0IDEwOjE1OjE2UE0gKzA4MDAsIENlbGVzdGUgTGl1IHdyb3RlOgo+ID4g
Pj4gV2hlbiB3ZSB0ZXN0IHNlY2NvbXAgd2l0aCA2LjQga2VybmVsLCB3ZSBmb3VuZCBlcnJubyBo
YXMgd3JvbmcgdmFsdWUuCj4gPiA+PiBJZiB3ZSBkZW55IE5FVExJTktfQVVESVQgd2l0aCBFQUZO
T1NVUFBPUlQsIGFmdGVyIGYwYmRkZjUwNTg2ZCwgd2Ugd2lsbAo+ID4gPj4gZ2V0IEVOT1NZUyBp
bnN0ZWFkLiBXZSBnb3Qgc2FtZSByZXN1bHQgd2l0aCBjb21taXQgOWMyNTk4ZDQzNTEwICgicmlz
Y3Y6Cj4gPiA+PiBlbnRyeTogU2F2ZSBhMCBwcmlvciBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9t
b2RlKCkiKS4KPiA+ID4+Cj4gPiA+PiBBZnRlciBhbmFseXNpbmcgY29kZSwgd2UgdGhpbmsgdGhh
dCByZWdzLT5hMCA9IC1FTk9TWVMgc2hvdWxkIG9ubHkgYmUKPiA+ID4+IGV4ZWN1dGVkIHdoZW4g
c3lzY2FsbCAhPSAtMS4gSW4gX19zZWNjb21wX2ZpbHRlciwgd2hlbiBzZWNjb21wIHJlamVjdGVk
Cj4gPiA+PiB0aGlzIHN5c2NhbGwgd2l0aCBzcGVjaWZpZWQgZXJybm8sIHRoZXkgd2lsbCBzZXQg
YTAgdG8gcmV0dXJuIG51bWJlciBhcwo+ID4gPj4gc3lzY2FsbCBBQkksIGFuZCB0aGVuIHJldHVy
biAtMS4gVGhpcyByZXR1cm4gbnVtYmVyIGlzIGZpbmFsbHkgcGFzcyBhcwo+ID4gPj4gcmV0dXJu
IG51bWJlciBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlLCBhbmQgdGhlbiBpcyBjb21w
YXJlZCB3aXRoCj4gPiA+PiBOUl9zeXNjYWxscyBhZnRlciBjb252ZXJ0ZWQgdG8gdWxvbmcgKHNv
IGl0IHdpbGwgYmUgVUxPTkdfTUFYKS4gVGhlCj4gPiA+PiBjb25kaXRpb24gc3lzY2FsbCA8IE5S
X3N5c2NhbGxzIHdpbGwgYWx3YXlzIGJlIGZhbHNlLCBzbyByZWdzLT5hMCA9IC1FTk9TWVMKPiA+
ID4+IGlzIGFsd2F5cyBleGVjdXRlZC4gSXQgY292ZXJlZCBhMCBzZXQgYnkgc2VjY29tcCwgc28g
d2UgYWx3YXlzIGdldAo+ID4gPj4gRU5PU1lTIHdoZW4gbWF0Y2ggc2VjY29tcCBSRVRfRVJSTk8g
cnVsZS4KPiA+ID4+Cj4gPiA+PiBGaXhlczogZjBiZGRmNTA1ODZkICgicmlzY3Y6IGVudHJ5OiBD
b252ZXJ0IHRvIGdlbmVyaWMgZW50cnkiKQo+ID4gPj4gUmVwb3J0ZWQtYnk6IEZlbGl4IFlhbiA8
ZmVsaXhvbm1hcnNAYXJjaGxpbnV4Lm9yZz4KPiA+ID4+IENvLWRldmVsb3BlZC1ieTogUnVpemhl
IFBhbiA8YzE0MTAyOEBnbWFpbC5jb20+Cj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBSdWl6aGUgUGFu
IDxjMTQxMDI4QGdtYWlsLmNvbT4KPiA+ID4+IENvLWRldmVsb3BlZC1ieTogU2hpcWkgWmhhbmcg
PHNoaXFpQGlzcmMuaXNjYXMuYWMuY24+Cj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBTaGlxaSBaaGFu
ZyA8c2hpcWlAaXNyYy5pc2Nhcy5hYy5jbj4KPiA+ID4+IFNpZ25lZC1vZmYtYnk6IENlbGVzdGUg
TGl1IDxDb2VsYWNhbnRodXNIZXhAZ21haWwuY29tPgo+ID4gPj4gVGVzdGVkLWJ5OiBGZWxpeCBZ
YW4gPGZlbGl4b25tYXJzQGFyY2hsaW51eC5vcmc+Cj4gPiA+PiBUZXN0ZWQtYnk6IEVtaWwgUmVu
bmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgo+ID4gPj4g
UmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiA+ID4+IFJl
dmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+ID4+IC0tLQo+ID4gPj4K
PiA+ID4+IHY0IC0+IHY1OiBhZGQgVGVzdGVkLWJ5IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWls
LnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgo+ID4gPj4gdjMgLT4gdjQ6IHVzZSBsb25n
IGluc3RlYWQgb2YgdWxvbmcgdG8gcmVkdWNlIHR5cGUgY2FzdCBhbmQgYXZvaWQKPiA+ID4+ICAg
ICAgICAgICBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkIGJlaGF2aW9yLCBhbmQgbWFrZSB0aGUganVk
Z21lbnQgb2Ygc3lzY2FsbAo+ID4gPj4gICAgICAgICAgIGludmFsaWQgbW9yZSBleHBsaWNpdAo+
ID4gPj4gdjIgLT4gdjM6IHVzZSBpZi1zdGF0ZW1lbnQgaW5zdGVhZCBvZiBzZXQgZGVmYXVsdCB2
YWx1ZSwKPiA+ID4+ICAgICAgICAgICBjbGFyaWZ5IHRoZSB0eXBlIG9mIHN5c2NhbGwKPiA+ID4+
IHYxIC0+IHYyOiBhZGRlZCBleHBsYW5hdGlvbiBvbiB3aHkgYWx3YXlzIGdvdCBFTk9TWVMKPiA+
ID4+Cj4gPiA+PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDYgKysrLS0tCj4gPiA+PiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+ID4+Cj4g
PiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMKPiA+ID4+IGluZGV4IGY5MTBkZmNjYmY1ZDIuLjcyOWY3OWM5N2UyYmYg
MTAwNjQ0Cj4gPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiA+PiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiA+PiBAQCAtMjk3LDcgKzI5Nyw3IEBAIGFz
bWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9icmVhayhzdHJ1
Y3QgcHRfcmVncyAqcmVncykKPiA+ID4+ICBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2Vj
dGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4+ICB7
Cj4gPiA+PiAgICAgIGlmICh1c2VyX21vZGUocmVncykpIHsKPiA+ID4+IC0gICAgICAgICAgICB1
bG9uZyBzeXNjYWxsID0gcmVncy0+YTc7Cj4gPiA+PiArICAgICAgICAgICAgbG9uZyBzeXNjYWxs
ID0gcmVncy0+YTc7Cj4gPiA+Pgo+ID4gPj4gICAgICAgICAgICAgIHJlZ3MtPmVwYyArPSA0Owo+
ID4gPj4gICAgICAgICAgICAgIHJlZ3MtPm9yaWdfYTAgPSByZWdzLT5hMDsKPiA+ID4+IEBAIC0z
MDYsOSArMzA2LDkgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBk
b190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+Pgo+ID4gPj4gICAgICAg
ICAgICAgIHN5c2NhbGwgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsIHN5c2Nh
bGwpOwo+ID4gPj4KPiA+ID4+IC0gICAgICAgICAgICBpZiAoc3lzY2FsbCA8IE5SX3N5c2NhbGxz
KQo+ID4gPj4gKyAgICAgICAgICAgIGlmIChzeXNjYWxsID49IDAgJiYgc3lzY2FsbCA8IE5SX3N5
c2NhbGxzKQo+ID4gPj4gICAgICAgICAgICAgICAgICAgICAgc3lzY2FsbF9oYW5kbGVyKHJlZ3Ms
IHN5c2NhbGwpOwo+ID4gPj4gLSAgICAgICAgICAgIGVsc2UKPiA+ID4+ICsgICAgICAgICAgICBl
bHNlIGlmIChzeXNjYWxsICE9IC0xKQo+ID4gPj4gICAgICAgICAgICAgICAgICAgICAgcmVncy0+
YTAgPSAtRU5PU1lTOwo+ID4gPj4KPiA+ID4+ICAgICAgICAgICAgICBzeXNjYWxsX2V4aXRfdG9f
dXNlcl9tb2RlKHJlZ3MpOwo+ID4gPgo+ID4gPiBVbmZvcnR1bmF0ZWx5LCB0aGlzIGNoYW5nZSBp
bnRyb2R1Y2VkIGEgcmVncmVzc2lvbjogaXQgYnJva2Ugc3RyYWNlCj4gPiA+IHN5c2NhbGwgdGFt
cGVyaW5nIG9uIHJpc2N2LiAgV2hlbiB0aGUgdHJhY2VyIGNoYW5nZXMgc3lzY2FsbCBudW1iZXIg
dG8gLTEsCj4gPiA+IHRoZSBrZXJuZWwgZmFpbHMgdG8gaW5pdGlhbGl6ZSBhMCB3aXRoIC1FTk9T
WVMgYW5kIHN1YnNlcXVlbnRseSBmYWlscyB0bwo+ID4gPiByZXR1cm4gdGhlIGVycm9yIGNvZGUg
b2YgdGhlIGZhaWxlZCBzeXNjYWxsIHRvIHVzZXJzcGFjZS4KPiA+Cj4gPiBJbiB0aGUgcGF0Y2gg
djIsIHdlIGFjdHVhbGx5IGRvIHRoZSByaWdodCB0aGluZy4gQnV0IGFzIEJqw7ZybiBUw7ZwZWwn
cwo+ID4gc3VnZ2VzdGlvbiBhbmQgd2UgZm91bmQgY2FzdCBsb25nIHRvIHVsb25nIGlzIGltcGxl
bWVudGF0aW9uLWRlZmluZWQKPiA+IGJlaGF2aW9yIGluIEMsIHNvIHdlIGNoYW5nZSBpdCB0byBj
dXJyZW50IGZvcm0uIFNvIHJldmVydCB0aGlzIHBhdGNoIGFuZAo+ID4gYXBwbHkgcGF0Y2ggdjIg
c2hvdWxkIGZpeCB0aGlzIGlzc3VlLiBQYXRjaCB2MiB1c2VzIHRocyBzYW1lIHdheSB3aXRoCj4g
PiBvdGhlciBhcmNoaXRlY3R1cmVzLgo+ID4KPiA+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjMwNzE4MTYyOTQwLjIyNjExOC0xLUNvZWxhY2FudGh1c0hleEBnbWFpbC5jb20v
Cj4gCj4gTm90IHJldmVydGluZywgYnV0IGEgZml4IHRvIG1ha2Ugc3VyZSB0aGF0IGEwIGlzIGlu
aXRpYWxpemVkIHRvIC1FTk9TWVMsIGUuZy46Cj4gCj4gLS04PC0tCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gaW5k
ZXggMDVhMTZiMWYwYWVlLi41MWViZmQyM2UwMDcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBAQCAtMzE5
LDYgKzMxOSw3IEBAIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+
IAo+ICAgcmVncy0+ZXBjICs9IDQ7Cj4gICByZWdzLT5vcmlnX2EwID0gcmVncy0+YTA7Cj4gKyBy
ZWdzLT5hMCA9IC1FTk9TWVM7CgpHaXZlbiB0aGF0IHN0cnVjdCB1c2VyX3JlZ3Nfc3RydWN0IGRv
ZXNuJ3QgaGF2ZSBvcmlnX2EwLCB3b3VsZG4ndCB0aGlzCmNsb2JiZXIgYTAgdG9vIGVhcmx5IHNv
IHRoYXQgdGhlIHRyYWNlciB3aWxsIGdldCAtRU5PU1lTIGluIHBsYWNlIG9mIHRoZQpmaXJzdCBz
eXNjYWxsIGFyZ3VtZW50PwoKCi0tIApsZHYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
