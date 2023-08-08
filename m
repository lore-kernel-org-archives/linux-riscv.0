Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7B0C001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkLdBswSpDg04tqS4Jcl2dMCjt5Eg0Ig97x1BNu38v4=; b=TOs61Y9GlVNvcs
	sY4pTWdeRXDivcamyBurCXEyLsrWuJvHFOtxfU/kQT2f3wP7enr+K3N38KKSsFTdKVRHmVbXy4bI8
	+d3+csFskOTUy4uiYQB3ldfOtkhU9uiPm6xVsJQOneF5g2m5w45lY1kkaDiJLTBUAIXkIpa13pLy4
	ha5oaiiPFaSA1O82isEsGZNv2LC3187ETB/rOWUGX+NGJJHMOJEtsBy0A3B1/BYCh+4cVsN4dKzBt
	R/E3zyGZF+4n9HinCihMYrVKuRwXXSJ3pw/3VhfTVMiW286l7rey9QiEtecKtS6tV0+GNPWuBs/DR
	SJ77UQw5dnwsJlyCo4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTJlx-002D4C-3D;
	Tue, 08 Aug 2023 10:17:05 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTJlu-002D3m-39
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 10:17:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E6DC1BF204;
	Tue,  8 Aug 2023 10:16:51 +0000 (UTC)
Message-ID: <5681817e-2751-0166-b823-df03aebedf9f@ghiti.fr>
Date: Tue, 8 Aug 2023 12:16:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] riscv: Implement arch_sync_kernel_mappings() for
 "preventive" TLB flush
To: Dylan Jhong <dylan@andestech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
 alexghiti@rivosinc.com, anup@brainfault.org, rppt@kernel.org,
 samuel@sholland.org, panqinglin2020@iscas.ac.cn,
 sergey.matyukevich@syntacore.com, maz@kernel.org,
 linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
Cc: ycliang@andestech.com, x5710999x@gmail.com, tim609@andestech.com
References: <20230807082305.198784-1-dylan@andestech.com>
 <20230807082305.198784-2-dylan@andestech.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230807082305.198784-2-dylan@andestech.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_031703_300550_18FF891F 
X-CRM114-Status: GOOD (  26.11  )
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

SGkgRHlsYW4sCgpPbiAwNy8wOC8yMDIzIDEwOjIzLCBEeWxhbiBKaG9uZyB3cm90ZToKPiBTaW5j
ZSBSSVNDLVYgaXMgYSBtaWNyb2FyY2hpdGVjdHVyZSB0aGF0IGFsbG93cyBjYWNoaW5nIGludmFs
aWQgZW50cmllcyBpbiB0aGUgVExCLAo+IGl0IGlzIG5lY2Vzc2FyeSB0byBpc3N1ZSBhICJwcmV2
ZW50aXZlIiBTRkVOQ0UuVk1BIHRvIGVuc3VyZSB0aGF0IGVhY2ggY29yZSBvYnRhaW5zCj4gdGhl
IGNvcnJlY3Qga2VybmVsIG1hcHBpbmcuCj4KPiBUaGUgcGF0Y2ggaW1wbGVtZW50cyBUTEIgZmx1
c2hpbmcgaW4gYXJjaF9zeW5jX2tlcm5lbF9tYXBwaW5ncygpLCBlbnN1cmluZyB0aGF0IGtlcm5l
bAo+IHBhZ2UgdGFibGUgbWFwcGluZ3MgY3JlYXRlZCB2aWEgdm1hcC92bWFsbG9jKCkgYXJlIHVw
ZGF0ZWQgYmVmb3JlIHN3aXRjaGluZyBNTS4KPgo+IFNpZ25lZC1vZmYtYnk6IER5bGFuIEpob25n
IDxkeWxhbkBhbmRlc3RlY2guY29tPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
YWdlLmggfCAgMiArKwo+ICAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgfCAxMiArKysr
KysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wYWdlLmgKPiBpbmRleCBiNTViYTIwOTAzZWMuLjZjODZhYjY5Njg3ZSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGFnZS5oCj4gQEAgLTIxLDYgKzIxLDggQEAKPiAgICNkZWZpbmUgSFBBR0VfTUFT
SyAgICAgICAgICAgICAgKH4oSFBBR0VfU0laRSAtIDEpKQo+ICAgI2RlZmluZSBIVUdFVExCX1BB
R0VfT1JERVIgICAgICAoSFBBR0VfU0hJRlQgLSBQQUdFX1NISUZUKQo+ICAgCj4gKyNkZWZpbmUg
QVJDSF9QQUdFX1RBQkxFX1NZTkNfTUFTSwlQR1RCTF9QVEVfTU9ESUZJRUQKPiArCj4gICAvKgo+
ICAgICogUEFHRV9PRkZTRVQgLS0gdGhlIGZpcnN0IGFkZHJlc3Mgb2YgdGhlIGZpcnN0IHBhZ2Ug
b2YgbWVtb3J5Lgo+ICAgICogV2hlbiBub3QgdXNpbmcgTU1VIHRoaXMgY29ycmVzcG9uZHMgdG8g
dGhlIGZpcnN0IGZyZWUgcGFnZSBpbgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3RsYmZs
dXNoLmMgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiBpbmRleCA3N2JlNTlhYWRjNzMuLmQ2
MzM2NDk0OGM4NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiArKysg
Yi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiBAQCAtMTQ5LDMgKzE0OSwxNSBAQCB2b2lkIGZs
dXNoX3BtZF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxv
bmcgc3RhcnQsCj4gICAJX19mbHVzaF90bGJfcmFuZ2Uodm1hLT52bV9tbSwgc3RhcnQsIGVuZCAt
IHN0YXJ0LCBQTURfU0laRSk7Cj4gICB9Cj4gICAjZW5kaWYKPiArCj4gKy8qCj4gKyAqIFNpbmNl
IFJJU0MtViBpcyBhIG1pY3JvYXJjaGl0ZWN0dXJlIHRoYXQgYWxsb3dzIGNhY2hpbmcgaW52YWxp
ZCBlbnRyaWVzIGluIHRoZSBUTEIsCj4gKyAqIGl0IGlzIG5lY2Vzc2FyeSB0byBpc3N1ZSBhICJw
cmV2ZW50aXZlIiBTRkVOQ0UuVk1BIHRvIGVuc3VyZSB0aGF0IGVhY2ggY29yZSBvYnRhaW5zCj4g
KyAqIHRoZSBjb3JyZWN0IGtlcm5lbCBtYXBwaW5nLiBhcmNoX3N5bmNfa2VybmVsX21hcHBpbmdz
KCkgd2lsbCBlbnN1cmUgdGhhdCBrZXJuZWwKPiArICogcGFnZSB0YWJsZSBtYXBwaW5ncyBjcmVh
dGVkIHZpYSB2bWFwL3ZtYWxsb2MoKSBhcmUgdXBkYXRlZCBiZWZvcmUgc3dpdGNoaW5nIE1NLgo+
ICsgKi8KPiArdm9pZCBhcmNoX3N5bmNfa2VybmVsX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgc3Rh
cnQsIHVuc2lnbmVkIGxvbmcgZW5kKQo+ICt7Cj4gKwlpZiAoc3RhcnQgPCBWTUFMTE9DX0VORCAm
JiBlbmQgPiBWTUFMTE9DX1NUQVJUKQoKClRoaXMgdGVzdCBpcyB0b28gcmVzdHJpY3RpdmUsIGl0
IHNob3VsZCBjYXRjaCB0aGUgcmFuZ2UgW01PRFVMRVNfVkFERFI7wqAgCk1PRFVMRVNfRU5EWyB0
b28sIHNvcnJ5IEkgZGlkIG5vdCBub3RpY2UgdGhhdCBhdCBmaXJzdC4KCgo+ICsJCWZsdXNoX3Rs
Yl9hbGwoKTsKPiArfQo+IFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQoKCkkgaGF2ZSB0byBh
ZG1pdCB0aGF0IEkgKnRoaW5rKiBib3RoIHlvdXIgcGF0Y2ggYW5kIG1pbmUgYXJlIHdyb25nOiBv
bmUgCm9mIHRoZSBwcm9ibGVtIHRoYXQgbGVkIHRvIHRoZSByZW1vdmFsIG9mIHZtYWxsb2NfZmF1
bHQoKSBpcyB0aGUgCnBvc3NpYmlsaXR5IGZvciB0cmFjaW5nIGZ1bmN0aW9ucyB0byBhY3R1YWxs
eSBhbGxvY2F0ZSB2bWFsbG9jIHJlZ2lvbnMgCmluIHRoZSB2bWFsbG9jIHBhZ2UgZmF1bHQgcGF0
aCwgd2hpY2ggY291bGQgZ2l2ZSByaXNlIHRvIG5lc3RlZCAKZXhjZXB0aW9ucyAoc2VlIApodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjAwNTA4MTQ0MDQzLjEzODkzLTEtam9yb0A4Ynl0
ZXMub3JnLykuCgpIZXJlLCBldmVyeXRpbWUgd2UgYWxsb2NhdGUgYSB2bWFsbG9jIHJlZ2lvbiwg
d2Ugc2VuZCBhbiBJUEkuIElmIGEgCnZtYWxsb2MgYWxsb2NhdGlvbiBoYXBwZW5zIGluIHRoaXMg
cGF0aCAoaWYgaXQgaXMgdHJhY2VkIGZvciBleGFtcGxlKSwgCml0IHdpbGwgZ2l2ZSByaXNlIHRv
IGFuIElQSS4uLmFuZCBzbyBvbi4KClNvIEkgY2FtZSB0byB0aGUgY29uY2x1c2lvbiB0aGF0IHRo
ZSBvbmx5IHdheSB0byBhY3R1YWxseSBmaXggdGhpcyBpc3N1ZSAKaXMgYnkgcmVzb2x2aW5nIHRo
ZSB2bWFsbG9jIGZhdWx0cyB2ZXJ5IGVhcmx5IGluIHRoZSBwYWdlIGZhdWx0IHBhdGggKGJ5IApl
bWl0dGluZyBhIHNmZW5jZS52bWEgb24gdWFyY2ggdGhhdCBjYWNoZSBpbnZhbGlkIGVudHJpZXMp
LCBiZWZvcmUgdGhlIAprZXJuZWwgc3RhY2sgaXMgZXZlbiBhY2Nlc3NlZC4gVGhhdCdzIHRoZSBi
ZXN0IHNvbHV0aW9uIHNpbmNlIGl0IHdvdWxkIApjb21wbGV0ZWx5IHJlbW92ZSBhbGwgdGhlIHBy
ZXZlbnRpdmUgc2ZlbmNlLnZtYSBpbiAKZmx1c2hfY2FjaGVfdm1hcCgpL2FyY2hfc3luY19rZXJu
ZWxfbWFwcGluZ3MoKSwgd2Ugd291bGQgcmVseSBvbiAKZmF1bHRpbmcgd2hpY2ggSSBhc3N1bWUg
c2hvdWxkIG5vdCBoYXBwZW4gYSBsb3QgKD8pLgoKSSdtIGltcGxlbWVudGluZyB0aGlzIHNvbHV0
aW9uLCBidXQgSSdtIHByZXR0eSBzdXJlIGl0IHdvbid0IGJlIHJlYWR5IApmb3IgNi41LiBJbiB0
aGUgbWVhbnRpbWUsIHdlIG5lZWQgZWl0aGVyIHlvdXIgcGF0Y2ggb3IgbWluZSB0byBmaXggeW91
ciAKaXNzdWUuLi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
