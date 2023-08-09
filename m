Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2D5C001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6m2U8GjMCIZ12wHWZOGwzQHb8Eo0AQVeFal+jSbliig=; b=e0hrkKsZtYbtBi
	/uUYbenpgfPDTwi9vx9qJT8wS5Jrto1kkVvoqMBLBikE4jy3gGUbnO5ZGQdWhiikPiNVSbwN2rQrq
	fiKMigVs92SszUYG8BBF6/SCEostnspX2sYWr3K4nkIlnYBTe8fupWzfhnH+V4ypiW+UTRJttKRjy
	WYC7yOQ5io4BzmhyqySMmIjSgf9V+d46+A3sIVLMoEsOSEaDsCuj0FUaf1uerrJvFPRnenLXCAJGq
	xFodoVIe5q/uBRuMKZRaxkWDqP7nKI1BF49NxVZAiLdbyMIcJiZC0+U9LQ98Yp3cn9zEYfhkS1tyt
	hmwU0RxKbtTT79Af4xKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qThBA-004kav-01;
	Wed, 09 Aug 2023 11:16:40 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qThB6-004ka3-04
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 11:16:38 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 379BG0TM087502;
	Wed, 9 Aug 2023 19:16:00 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Wed, 9 Aug 2023
 19:16:01 +0800
Date: Wed, 9 Aug 2023 19:16:00 +0800
From: Dylan Jhong <dylan@andestech.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <ajones@ventanamicro.com>, <alexghiti@rivosinc.com>,
        <anup@brainfault.org>, <rppt@kernel.org>, <samuel@sholland.org>,
        <panqinglin2020@iscas.ac.cn>, <sergey.matyukevich@syntacore.com>,
        <maz@kernel.org>, <linux-riscv@lists.infradead.org>,
        <conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>,
        <ycliang@andestech.com>, <x5710999x@gmail.com>, <tim609@andestech.com>
Subject: Re: [PATCH 1/1] riscv: Implement arch_sync_kernel_mappings() for
 "preventive" TLB flush
Message-ID: <ZNN1cEO1jMrPlPfj@atctrx.andestech.com>
References: <20230807082305.198784-1-dylan@andestech.com>
 <20230807082305.198784-2-dylan@andestech.com>
 <5681817e-2751-0166-b823-df03aebedf9f@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5681817e-2751-0166-b823-df03aebedf9f@ghiti.fr>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 379BG0TM087502
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_041636_501836_C70DF26F 
X-CRM114-Status: GOOD (  37.33  )
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

T24gVHVlLCBBdWcgMDgsIDIwMjMgYXQgMTI6MTY6NTBQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IEhpIER5bGFuLAo+IAo+IE9uIDA3LzA4LzIwMjMgMTA6MjMsIER5bGFuIEpob25n
IHdyb3RlOgo+ID4gU2luY2UgUklTQy1WIGlzIGEgbWljcm9hcmNoaXRlY3R1cmUgdGhhdCBhbGxv
d3MgY2FjaGluZyBpbnZhbGlkIGVudHJpZXMgaW4gdGhlIFRMQiwKPiA+IGl0IGlzIG5lY2Vzc2Fy
eSB0byBpc3N1ZSBhICJwcmV2ZW50aXZlIiBTRkVOQ0UuVk1BIHRvIGVuc3VyZSB0aGF0IGVhY2gg
Y29yZSBvYnRhaW5zCj4gPiB0aGUgY29ycmVjdCBrZXJuZWwgbWFwcGluZy4KPiA+IAo+ID4gVGhl
IHBhdGNoIGltcGxlbWVudHMgVExCIGZsdXNoaW5nIGluIGFyY2hfc3luY19rZXJuZWxfbWFwcGlu
Z3MoKSwgZW5zdXJpbmcgdGhhdCBrZXJuZWwKPiA+IHBhZ2UgdGFibGUgbWFwcGluZ3MgY3JlYXRl
ZCB2aWEgdm1hcC92bWFsbG9jKCkgYXJlIHVwZGF0ZWQgYmVmb3JlIHN3aXRjaGluZyBNTS4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogRHlsYW4gSmhvbmcgPGR5bGFuQGFuZGVzdGVjaC5jb20+Cj4g
PiAtLS0KPiA+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmggfCAgMiArKwo+ID4gICBh
cmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgICAgICB8IDEyICsrKysrKysrKysrKwo+ID4gICAyIGZp
bGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgK
PiA+IGluZGV4IGI1NWJhMjA5MDNlYy4uNmM4NmFiNjk2ODdlIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGFnZS5oCj4gPiBAQCAtMjEsNiArMjEsOCBAQAo+ID4gICAjZGVmaW5lIEhQQUdFX01BU0sg
ICAgICAgICAgICAgICh+KEhQQUdFX1NJWkUgLSAxKSkKPiA+ICAgI2RlZmluZSBIVUdFVExCX1BB
R0VfT1JERVIgICAgICAoSFBBR0VfU0hJRlQgLSBQQUdFX1NISUZUKQo+ID4gKyNkZWZpbmUgQVJD
SF9QQUdFX1RBQkxFX1NZTkNfTUFTSwlQR1RCTF9QVEVfTU9ESUZJRUQKPiA+ICsKPiA+ICAgLyoK
PiA+ICAgICogUEFHRV9PRkZTRVQgLS0gdGhlIGZpcnN0IGFkZHJlc3Mgb2YgdGhlIGZpcnN0IHBh
Z2Ugb2YgbWVtb3J5Lgo+ID4gICAgKiBXaGVuIG5vdCB1c2luZyBNTVUgdGhpcyBjb3JyZXNwb25k
cyB0byB0aGUgZmlyc3QgZnJlZSBwYWdlIGluCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9t
bS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiBpbmRleCA3N2JlNTlh
YWRjNzMuLmQ2MzM2NDk0OGM4NSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1
c2guYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiBAQCAtMTQ5LDMgKzE0
OSwxNSBAQCB2b2lkIGZsdXNoX3BtZF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAgIAlfX2ZsdXNoX3RsYl9yYW5nZSh2bWEtPnZt
X21tLCBzdGFydCwgZW5kIC0gc3RhcnQsIFBNRF9TSVpFKTsKPiA+ICAgfQo+ID4gICAjZW5kaWYK
PiA+ICsKPiA+ICsvKgo+ID4gKyAqIFNpbmNlIFJJU0MtViBpcyBhIG1pY3JvYXJjaGl0ZWN0dXJl
IHRoYXQgYWxsb3dzIGNhY2hpbmcgaW52YWxpZCBlbnRyaWVzIGluIHRoZSBUTEIsCj4gPiArICog
aXQgaXMgbmVjZXNzYXJ5IHRvIGlzc3VlIGEgInByZXZlbnRpdmUiIFNGRU5DRS5WTUEgdG8gZW5z
dXJlIHRoYXQgZWFjaCBjb3JlIG9idGFpbnMKPiA+ICsgKiB0aGUgY29ycmVjdCBrZXJuZWwgbWFw
cGluZy4gYXJjaF9zeW5jX2tlcm5lbF9tYXBwaW5ncygpIHdpbGwgZW5zdXJlIHRoYXQga2VybmVs
Cj4gPiArICogcGFnZSB0YWJsZSBtYXBwaW5ncyBjcmVhdGVkIHZpYSB2bWFwL3ZtYWxsb2MoKSBh
cmUgdXBkYXRlZCBiZWZvcmUgc3dpdGNoaW5nIE1NLgo+ID4gKyAqLwo+ID4gK3ZvaWQgYXJjaF9z
eW5jX2tlcm5lbF9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVu
ZCkKPiA+ICt7Cj4gPiArCWlmIChzdGFydCA8IFZNQUxMT0NfRU5EICYmIGVuZCA+IFZNQUxMT0Nf
U1RBUlQpCj4gCj4gCj4gVGhpcyB0ZXN0IGlzIHRvbyByZXN0cmljdGl2ZSwgaXQgc2hvdWxkIGNh
dGNoIHRoZSByYW5nZSBbTU9EVUxFU19WQUREUjvCoAo+IE1PRFVMRVNfRU5EWyB0b28sIHNvcnJ5
IEkgZGlkIG5vdCBub3RpY2UgdGhhdCBhdCBmaXJzdC4KPiAKPiAKPiA+ICsJCWZsdXNoX3RsYl9h
bGwoKTsKPiA+ICt9Cj4gPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKPiAKPiAKPiBJIGhh
dmUgdG8gYWRtaXQgdGhhdCBJICp0aGluayogYm90aCB5b3VyIHBhdGNoIGFuZCBtaW5lIGFyZSB3
cm9uZzogb25lIG9mCj4gdGhlIHByb2JsZW0gdGhhdCBsZWQgdG8gdGhlIHJlbW92YWwgb2Ygdm1h
bGxvY19mYXVsdCgpIGlzIHRoZSBwb3NzaWJpbGl0eQo+IGZvciB0cmFjaW5nIGZ1bmN0aW9ucyB0
byBhY3R1YWxseSBhbGxvY2F0ZSB2bWFsbG9jIHJlZ2lvbnMgaW4gdGhlIHZtYWxsb2MKPiBwYWdl
IGZhdWx0IHBhdGgsIHdoaWNoIGNvdWxkIGdpdmUgcmlzZSB0byBuZXN0ZWQgZXhjZXB0aW9ucyAo
c2VlCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDUwODE0NDA0My4xMzg5My0x
LWpvcm9AOGJ5dGVzLm9yZy8pLgo+IAo+IEhlcmUsIGV2ZXJ5dGltZSB3ZSBhbGxvY2F0ZSBhIHZt
YWxsb2MgcmVnaW9uLCB3ZSBzZW5kIGFuIElQSS4gSWYgYSB2bWFsbG9jCj4gYWxsb2NhdGlvbiBo
YXBwZW5zIGluIHRoaXMgcGF0aCAoaWYgaXQgaXMgdHJhY2VkIGZvciBleGFtcGxlKSwgaXQgd2ls
bCBnaXZlCj4gcmlzZSB0byBhbiBJUEkuLi5hbmQgc28gb24uCj4gCj4gU28gSSBjYW1lIHRvIHRo
ZSBjb25jbHVzaW9uIHRoYXQgdGhlIG9ubHkgd2F5IHRvIGFjdHVhbGx5IGZpeCB0aGlzIGlzc3Vl
IGlzCj4gYnkgcmVzb2x2aW5nIHRoZSB2bWFsbG9jIGZhdWx0cyB2ZXJ5IGVhcmx5IGluIHRoZSBw
YWdlIGZhdWx0IHBhdGggKGJ5Cj4gZW1pdHRpbmcgYSBzZmVuY2Uudm1hIG9uIHVhcmNoIHRoYXQg
Y2FjaGUgaW52YWxpZCBlbnRyaWVzKSwgYmVmb3JlIHRoZQo+IGtlcm5lbCBzdGFjayBpcyBldmVu
IGFjY2Vzc2VkLiBUaGF0J3MgdGhlIGJlc3Qgc29sdXRpb24gc2luY2UgaXQgd291bGQKPiBjb21w
bGV0ZWx5IHJlbW92ZSBhbGwgdGhlIHByZXZlbnRpdmUgc2ZlbmNlLnZtYSBpbgo+IGZsdXNoX2Nh
Y2hlX3ZtYXAoKS9hcmNoX3N5bmNfa2VybmVsX21hcHBpbmdzKCksIHdlIHdvdWxkIHJlbHkgb24g
ZmF1bHRpbmcKPiB3aGljaCBJIGFzc3VtZSBzaG91bGQgbm90IGhhcHBlbiBhIGxvdCAoPykuCj4g
CgpIaSBBbGV4LAoKQWdyZWUuIAoKSWYgd2UgY291bGQgaW50cm9kdWNlIGEgIm5ldyB2bWFsbG9j
X2ZhdWx0KCkiIGZ1bmN0aW9uIGJlZm9yZSBhY2Nlc3NpbmcgdGhlIGtlcm5lbCBzdGFjaywKd2hp
Y2ggd291bGQgdHJpZ2dlciBhbiBTRkVOQ0UuVk1BIGluc3RydWN0aW9uLCB0aGVuIGVhY2ggdGlt
ZSB3ZSBjYWxsIHZtYWxsb2MoKSBvciB2bWFwKCkKdG8gY3JlYXRlIG5ldyBrZXJuZWwgbWFwcGlu
Z3MsIHdlIHdvdWxkbid0IG5lZWQgdG8gZXhlY3V0ZSBmbHVzaF9jYWNoZV92bWFwKCkgb3IKYXJj
aF9zeW5jX2tlcm5lbF9tYXBwaW5ncygpIHRvIHVwZGF0ZSB0aGUgVExCLiBUaGlzIHNob3VsZCBi
ZSBhYmxlIHRvIGJhbGFuY2UgYm90aApwZXJmb3JtYW5jZSBhbmQgY29ycmVjdG5lc3MuCgo+IEkn
bSBpbXBsZW1lbnRpbmcgdGhpcyBzb2x1dGlvbiwgYnV0IEknbSBwcmV0dHkgc3VyZSBpdCB3b24n
dCBiZSByZWFkeSBmb3IKPiA2LjUuIEluIHRoZSBtZWFudGltZSwgd2UgbmVlZCBlaXRoZXIgeW91
ciBwYXRjaCBvciBtaW5lIHRvIGZpeCB5b3VyIGlzc3VlLi4uCj4gCgpJZiB0aGVyZSBhcmUgbm8g
b3RoZXJzIHJlcG9ydGluZyB0aGlzIGlzc3VlcywgSSBiZWxpZXZlIGVuY291bnRlcmluZyB0aGlz
IFRMQiBmbHVzaCBwcm9ibGVtCm1pZ2h0IG5vdCBiZSBzbyBjb21tb24uIFBlcmhhcHMgd2UgY291
bGQgd2FpdCB1bnRpbCB5b3UndmUgZmluaXNoZWQgaW1wbGVtZW50aW5nIHRoZQoibmV3IHZtYWxs
b2NfZmF1bHQoKSIgZmVhdHVyZS4gSWYgYW55b25lIGVuY291bnRlcnMgcHJvYmxlbXMgaW4gdGhl
IG1lYW50aW1lLCBJIHRoaW5rIHRoZXkKY2FuIHRlbXBvcmFyaWx5IGFwcGx5IGVpdGhlciBteSBw
YXRjaCBvciB5b3VycyB0byB3b3JrYXJvdW5kIHRoZSBpc3N1ZSBvZiB1cGRhdGluZyBUTEIgZm9y
CnZtYWxsb2MuCgpCZXN0IHJlZ2FyZHMsCkR5bGFuIEpob25nCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
