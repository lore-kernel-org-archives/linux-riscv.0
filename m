Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91189C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 00:02:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 534C660FC3
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 00:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 534C660FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5qCbtg0P11Frb0w8skRQlyXa61CnTqu/E9D1nETAAI=; b=YK17nrklNuvsOO
	WmC+iN4+LwSMa+/nCJAUq+/rmURnXAsNPflQ79s6bGpoK69X5fkPHQF9PFvb8dh3p7rm8I3OuLhSB
	2PUiuxlhHwAwozXIM7buOpBr9WdfLPHtFzcYJAAV3muOIqmVKFV+M4guQF84P/dHVy7esNtplA4wo
	l+ZEHlCJtSVK3Kamo3MKXqK1g2e/Rxbnrh7BBEib5RTR+hsmgXCDWU52J/7F+QURgcULTSDEFyQwd
	ifVA/86NUrNu7GFuxIJ1+3ce+1+I63TBwoBUOKkgrRuRaGg/XSCXSr4i1lGWAY07lgBlX4ws80whJ
	/yYqHHzJLcye+x5sd/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcz3N-0031o0-LE; Wed, 20 Oct 2021 00:01:57 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcz3J-0031kJ-QH
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 00:01:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id 8D6C01F43E27
Message-ID: <0d55b0a0-dd8c-0494-a200-7acb1976e32a@collabora.com>
Date: Tue, 19 Oct 2021 21:01:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] perf bench futex: Use a 64-bit time_t
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-perf-users@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Darren Hart <dvhart@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Atish Patra <atish.patra@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20211015005634.2658470-1-alistair.francis@opensource.wdc.com>
 <YW74wK03ibOS3jVZ@kernel.org>
 <CAKmqyKP6AU-9tcYOp-ERvYFP7t6DMp4kbQgDmJxD6wb0WTUy+w@mail.gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
In-Reply-To: <CAKmqyKP6AU-9tcYOp-ERvYFP7t6DMp4kbQgDmJxD6wb0WTUy+w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_170154_141175_8AF44E7D 
X-CRM114-Status: GOOD (  21.83  )
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

w4BzIDIwOjE3IGRlIDE5LzEwLzIxLCBBbGlzdGFpciBGcmFuY2lzIGVzY3JldmV1Ogo+IE9uIFdl
ZCwgT2N0IDIwLCAyMDIxIGF0IDI6NTYgQU0gQXJuYWxkbyBDYXJ2YWxobyBkZSBNZWxvCj4gPGFy
bmFsZG8ubWVsb0BnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBFbSBGcmksIE9jdCAxNSwgMjAyMSBh
dCAxMDo1NjozM0FNICsxMDAwLCBBbGlzdGFpciBGcmFuY2lzIGVzY3JldmV1Ogo+Pj4gRnJvbTog
QWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgo+Pj4KPj4+IENvbnZl
cnQgdG9vbHMvcGVyZiB0byBvbmx5IHVzZSBhIDY0LWJpdCB0aW1lX3QuIE9uIDY0LWJpdCBhcmNo
aXRlY3R1cmVzCj4+PiB0aGlzIGlzbid0IGEgZnVuY3Rpb25hbCBjaGFuZ2UuIE9uIDMyLWJpdCBh
cmNoaXRlY3R1cmVzIHdlIG5vdyBvbmx5Cj4+PiBwZXJmb3JtIDY0LWJpdCB0aW1lX3Qgc3lzY2Fs
bHMgKF9fTlJfZnV0ZXhfdGltZTY0KSBhbmQgdXNlIGEgc3RydWN0Cj4+PiB0aW1lc3BlYzY0Lgo+
Pj4KPj4+IFRoaXMgd29uJ3Qgd29yayBvbiBrZXJuZWxzIGJlZm9yZSA1LjEsIGJ1dCBhcyBwZXJm
IGlzIHRpZWQgdG8gdGhlIGtlcm5lbAo+Pj4gdGhhdCdzIG9rLgo+Pgo+PiBObywgcGVyZiBpcyBu
b3QgdGllZCB0byB0aGUga2VybmVsLCBvbmUgY2FuIHVzZSBhIG5ldyBwZXJmIHRvb2wgb24gYW55
Cj4+IHByZXZpb3VzIGtlcm5lbCwgYW5kIGFuIG9sZCBwZXJmIHRvb2wgc2hvdWxkIHdvcmsgb24g
bmV3IGtlcm5lbHMgYXMKPj4gd2VsbC4KPiAKPiArIEFuZHLDqSwgSSB3b24ndCBiZSBkb2luZyB0
aGlzIHRoZSB3YXkgeW91IHJlcXVlc3RlZAo+IAoKT2ssIHRoYW5rcyBhbnl3YXkgZm9yIHlvdXIg
d29yayBhbmQgc29ycnkgZm9yIHRoZSB0cm91YmxlIDopCgo+IE9rLCBzbyBiYWNrIHRvIHRoZSBw
cmV2aW91cyB2ZXJzaW9uIHRoZW4uIEknbGwgc2VuZCB0aGUgcGF0Y2hlcyBzb29uLgo+IAo+IEFs
aXN0YWlyCj4gCj4+Cj4+IC0gQXJuYWxkbwo+Pgo+Pj4gVGhpcyBhbGxvd3MgdXMgdG8gYnVpbGQg
cGVyZiBmb3IgMzItYml0IGFyY2hpdGVjdHVyZXMgd2l0aCA2NC1iaXQgdGltZV90Cj4+PiBsaWtl
IFJJU0MtViAzMi1iaXQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8
YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgo+Pj4gLS0tCj4+PiAgdG9vbHMvcGVyZi9iZW5jaC9m
dXRleC5oIHwgMjYgKysrKysrKysrKysrKysrKysrKystLS0tLS0KPj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEv
dG9vbHMvcGVyZi9iZW5jaC9mdXRleC5oIGIvdG9vbHMvcGVyZi9iZW5jaC9mdXRleC5oCj4+PiBp
bmRleCBiMzg1M2FhYzMwMjFjLi5iOTY2NWQ0M2QyOTg4IDEwMDY0NAo+Pj4gLS0tIGEvdG9vbHMv
cGVyZi9iZW5jaC9mdXRleC5oCj4+PiArKysgYi90b29scy9wZXJmL2JlbmNoL2Z1dGV4LmgKPj4+
IEBAIC0xMiw2ICsxMiw3IEBACj4+PiAgI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+Cj4+PiAgI2lu
Y2x1ZGUgPHN5cy90eXBlcy5oPgo+Pj4gICNpbmNsdWRlIDxsaW51eC9mdXRleC5oPgo+Pj4gKyNp
bmNsdWRlIDxsaW51eC90aW1lX3R5cGVzLmg+Cj4+Pgo+Pj4gIHN0cnVjdCBiZW5jaF9mdXRleF9w
YXJhbWV0ZXJzIHsKPj4+ICAgICAgIGJvb2wgc2lsZW50Owo+Pj4gQEAgLTI3LDEyICsyOCwxNCBA
QCBzdHJ1Y3QgYmVuY2hfZnV0ZXhfcGFyYW1ldGVycyB7Cj4+PiAgICAgICB1bnNpZ25lZCBpbnQg
bnJlcXVldWU7Cj4+PiAgfTsKPj4+Cj4+PiArI2RlZmluZSB0aW1lc3BlYzY0IF9fa2VybmVsX3Rp
bWVzcGVjCj4+PiArCj4+PiAgLyoqCj4+PiAgICogZnV0ZXgoKSAtIFNZU19mdXRleCBzeXNjYWxs
IHdyYXBwZXIKPj4+ICAgKiBAdWFkZHI6ICAgYWRkcmVzcyBvZiBmaXJzdCBmdXRleAo+Pj4gICAq
IEBvcDogICAgICAgICAgICAgIGZ1dGV4IG9wIGNvZGUKPj4+ICAgKiBAdmFsOiAgICAgdHlwaWNh
bGx5IGV4cGVjdGVkIHZhbHVlIG9mIHVhZGRyLCBidXQgdmFyaWVzIGJ5IG9wCj4+PiAtICogQHRp
bWVvdXQ6IHR5cGljYWxseSBhbiBhYnNvbHV0ZSBzdHJ1Y3QgdGltZXNwZWMgKGV4Y2VwdCB3aGVy
ZSBub3RlZAo+Pj4gKyAqIEB0aW1lb3V0OiB0eXBpY2FsbHkgYW4gYWJzb2x1dGUgc3RydWN0IHRp
bWVzcGVjNjQgKGV4Y2VwdCB3aGVyZSBub3RlZAo+Pj4gICAqICAgICAgICAgICBvdGhlcndpc2Up
LiBPdmVybG9hZGVkIGJ5IHNvbWUgb3BzCj4+PiAgICogQHVhZGRyMjogIGFkZHJlc3Mgb2Ygc2Vj
b25kIGZ1dGV4IGZvciBzb21lIG9wcwo+Pj4gICAqIEB2YWwzOiAgICB2YXJpZXMgYnkgb3AKPj4+
IEBAIC00NywxNSArNTAsMjYgQEAgc3RydWN0IGJlbmNoX2Z1dGV4X3BhcmFtZXRlcnMgewo+Pj4g
ICAqIFRoZXNlIGFyZ3VtZW50IGRlc2NyaXB0aW9ucyBhcmUgdGhlIGRlZmF1bHRzIGZvciBhbGwK
Pj4+ICAgKiBsaWtlLW5hbWVkIGFyZ3VtZW50cyBpbiB0aGUgZm9sbG93aW5nIHdyYXBwZXJzIGV4
Y2VwdCB3aGVyZSBub3RlZCBiZWxvdy4KPj4+ICAgKi8KPj4+IC0jZGVmaW5lIGZ1dGV4KHVhZGRy
LCBvcCwgdmFsLCB0aW1lb3V0LCB1YWRkcjIsIHZhbDMsIG9wZmxhZ3MpIFwKPj4+IC0gICAgIHN5
c2NhbGwoU1lTX2Z1dGV4LCB1YWRkciwgb3AgfCBvcGZsYWdzLCB2YWwsIHRpbWVvdXQsIHVhZGRy
MiwgdmFsMykKPj4+ICsvKioKPj4+ICsgKiBXZSBvbmx5IHN1cHBvcnQgNjQtYml0IHRpbWVfdCBm
b3IgdGhlIHRpbWVvdXQuCj4+PiArICogT24gNjQtYml0IGFyY2hpdGVjdHVyZXMgd2UgY2FuIHVz
ZSBfX05SX2Z1dGV4Cj4+PiArICogT24gMzItYml0IGFyY2hpdGVjdHVyZXMgd2UgdXNlIF9fTlJf
ZnV0ZXhfdGltZTY0LiBUaGlzIG9ubHkgd29ya3Mgb24ga2VybmVsCj4+PiArICogdmVyc2lvbnMg
NS4xKy4KPj4+ICsgKi8KPj4+ICsjaWYgX19CSVRTX1BFUl9MT05HID09IDY0Cj4+PiArIyBkZWZp
bmUgZnV0ZXgodWFkZHIsIG9wLCB2YWwsIHRpbWVvdXQsIHVhZGRyMiwgdmFsMywgb3BmbGFncykg
XAo+Pj4gKyAgICAgc3lzY2FsbChfX05SX2Z1dGV4LCB1YWRkciwgb3AgfCBvcGZsYWdzLCB2YWws
IHRpbWVvdXQsIHVhZGRyMiwgdmFsMykKPj4+ICsjZWxzZQo+Pj4gKyMgZGVmaW5lIGZ1dGV4KHVh
ZGRyLCBvcCwgdmFsLCB0aW1lb3V0LCB1YWRkcjIsIHZhbDMsIG9wZmxhZ3MpIFwKPj4+ICsgICAg
IHN5c2NhbGwoX19OUl9mdXRleF90aW1lNjQsIHVhZGRyLCBvcCB8IG9wZmxhZ3MsIHZhbCwgdGlt
ZW91dCwgdWFkZHIyLCB2YWwzKQo+Pj4gKyNlbmRpZgo+Pj4KPj4+ICAvKioKPj4+ICAgKiBmdXRl
eF93YWl0KCkgLSBibG9jayBvbiB1YWRkciB3aXRoIG9wdGlvbmFsIHRpbWVvdXQKPj4+ICAgKiBA
dGltZW91dDogcmVsYXRpdmUgdGltZW91dAo+Pj4gICAqLwo+Pj4gIHN0YXRpYyBpbmxpbmUgaW50
Cj4+PiAtZnV0ZXhfd2FpdCh1X2ludDMyX3QgKnVhZGRyLCB1X2ludDMyX3QgdmFsLCBzdHJ1Y3Qg
dGltZXNwZWMgKnRpbWVvdXQsIGludCBvcGZsYWdzKQo+Pj4gK2Z1dGV4X3dhaXQodV9pbnQzMl90
ICp1YWRkciwgdV9pbnQzMl90IHZhbCwgc3RydWN0IHRpbWVzcGVjNjQgKnRpbWVvdXQsIGludCBv
cGZsYWdzKQo+Pj4gIHsKPj4+ICAgICAgIHJldHVybiBmdXRleCh1YWRkciwgRlVURVhfV0FJVCwg
dmFsLCB0aW1lb3V0LCBOVUxMLCAwLCBvcGZsYWdzKTsKPj4+ICB9Cj4+PiBAQCAtNzQsNyArODgs
NyBAQCBmdXRleF93YWtlKHVfaW50MzJfdCAqdWFkZHIsIGludCBucl93YWtlLCBpbnQgb3BmbGFn
cykKPj4+ICAgKiBmdXRleF9sb2NrX3BpKCkgLSBibG9jayBvbiB1YWRkciBhcyBhIFBJIG11dGV4
Cj4+PiAgICovCj4+PiAgc3RhdGljIGlubGluZSBpbnQKPj4+IC1mdXRleF9sb2NrX3BpKHVfaW50
MzJfdCAqdWFkZHIsIHN0cnVjdCB0aW1lc3BlYyAqdGltZW91dCwgaW50IG9wZmxhZ3MpCj4+PiAr
ZnV0ZXhfbG9ja19waSh1X2ludDMyX3QgKnVhZGRyLCBzdHJ1Y3QgdGltZXNwZWM2NCAqdGltZW91
dCwgaW50IG9wZmxhZ3MpCj4+PiAgewo+Pj4gICAgICAgcmV0dXJuIGZ1dGV4KHVhZGRyLCBGVVRF
WF9MT0NLX1BJLCAwLCB0aW1lb3V0LCBOVUxMLCAwLCBvcGZsYWdzKTsKPj4+ICB9Cj4+PiBAQCAt
MTExLDcgKzEyNSw3IEBAIGZ1dGV4X2NtcF9yZXF1ZXVlKHVfaW50MzJfdCAqdWFkZHIsIHVfaW50
MzJfdCB2YWwsIHVfaW50MzJfdCAqdWFkZHIyLCBpbnQgbnJfd2FrCj4+PiAgICovCj4+PiAgc3Rh
dGljIGlubGluZSBpbnQKPj4+ICBmdXRleF93YWl0X3JlcXVldWVfcGkodV9pbnQzMl90ICp1YWRk
ciwgdV9pbnQzMl90IHZhbCwgdV9pbnQzMl90ICp1YWRkcjIsCj4+PiAtICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCB0aW1lc3BlYyAqdGltZW91dCwgaW50IG9wZmxhZ3MpCj4+PiArICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCB0aW1lc3BlYzY0ICp0aW1lb3V0LCBpbnQgb3BmbGFncykKPj4+ICB7
Cj4+PiAgICAgICByZXR1cm4gZnV0ZXgodWFkZHIsIEZVVEVYX1dBSVRfUkVRVUVVRV9QSSwgdmFs
LCB0aW1lb3V0LCB1YWRkcjIsIDAsCj4+PiAgICAgICAgICAgICAgICAgICAgb3BmbGFncyk7Cj4+
PiAtLQo+Pj4gMi4zMS4xCj4+Cj4+IC0tCj4+Cj4+IC0gQXJuYWxkbwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
