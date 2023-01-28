Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2765BC27C76
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 03:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7R4gxSrFAdYfKIC9LLgpbSoIN0TvXSOYhvfGR3ZaiEs=; b=EhH3vtmFyVh+AT
	UwdQJi2kmfIdTM94MIIUEehyqoWZInsXo/AfxbY/+5BvSFkOq6JGiFEfOL3aZFO4d3GCN+r8mMAvU
	qtDHhaZlI0SQy8kIL9fOKdFTtxR7FecePqK/Pa8ud1XwtlK9zEBzqqDFyMS7Yzrr8AkNdaU6YzEzw
	RUDE67RCfNeKmf968/a91edRd1CLz7MEQWFe8tnA2lWTpBctMdM33owaHPYdbB+vjCN4wICpGzt9S
	BmGXsvfJ86UoAcsWHN1dQZ6lh47m/S7K6cbu9PxUz1DfwFGopT9OMJ+5F1KBBElu0hb1QhGUOrfLG
	7nRMkntBvA+4ax9lfkeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLcH8-00H8d6-D9; Sat, 28 Jan 2023 03:53:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLcH2-00H8bH-2j
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 03:53:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 598F2B82221
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 03:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF6FC4339B
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 03:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674877980;
	bh=88Fy/MGRX8OjMc3tSFQozorT1nOLF89PQoPQzJVYSKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UmDkP2bjxbg6iKcDj4t8XkqRQylP9wEzTac+qwMewcd2+/+6yaYwiDb7BObdNEs1s
	 iv53qHdIdUmojWFTW0pqmFiG4+falDmpLPCQ4Si9UmoJFsERMccspjCFCEg0evSTle
	 iNLY948OKRcRNCq9MyDnbXklHFVtlvcoCctKoahjn56ejAta2kaA6nJnmVTZhciO+p
	 R8rY/o61wbJQrQoT6OQKGPmCXoyMvgcwws5tA/RPu2H6FW7w/ioAGU+Xd/3OQFpgQl
	 BmMhW6V8jZ0RcHqE+GbWW2vUl0qCDFbNKh7m1CyUO1SVtutcoxDoce5RE5w7lA28uU
	 ha+6xIfXal6Sw==
Received: by mail-ej1-f41.google.com with SMTP id m2so18069640ejb.8
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 19:53:00 -0800 (PST)
X-Gm-Message-State: AO0yUKUCe56pmW1i52VHXqd618r/DUKrwOHkSWOiTI+7kD5xZzSYLlro
	fRBPUsBQMmv+PO79MQpRfhqGN/XrZkvgivxQS64=
X-Google-Smtp-Source: AK7set/98L4ZXutZEZt/qPQiBmkXllLtLzJU07Cl0RaXE6qsysDa7c4Jrq4RZG5zOguM7HyYw/sUbiwxGAemhlmy6AM=
X-Received: by 2002:a17:906:14cf:b0:878:69e5:b797 with SMTP id
 y15-20020a17090614cf00b0087869e5b797mr1820948ejc.228.1674877979109; Fri, 27
 Jan 2023 19:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20230126130509.1418251-1-guoren@kernel.org> <0871074a-cafb-a172-f062-6ada6d2a3a41@huawei.com>
 <CAJF2gTTd9V6PKu6_ip21HbXWgN6X-epw8yc_s6XonssStFNdEQ@mail.gmail.com>
In-Reply-To: <CAJF2gTTd9V6PKu6_ip21HbXWgN6X-epw8yc_s6XonssStFNdEQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 28 Jan 2023 11:52:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTCFPsn+8NJaQyHan9h9b7=UzjY-+H4_qi4DaGXJ_kD3w@mail.gmail.com>
Message-ID: <CAJF2gTTCFPsn+8NJaQyHan9h9b7=UzjY-+H4_qi4DaGXJ_kD3w@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an illegal position
To: "liaochang (A)" <liaochang1@huawei.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org, 
	conor.dooley@microchip.com, penberg@kernel.org, mark.rutland@arm.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_195304_443864_51085E51 
X-CRM114-Status: GOOD (  31.28  )
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

T24gU2F0LCBKYW4gMjgsIDIwMjMgYXQgMTE6NDYgQU0gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBKYW4gMjgsIDIwMjMgYXQgMTA6NTUgQU0gbGlhb2NoYW5n
IChBKSA8bGlhb2NoYW5nMUBodWF3ZWkuY29tPiB3cm90ZToKPiA+Cj4gPgo+ID4KPiA+IOWcqCAy
MDIzLzEvMjYgMjE6MDUsIGd1b3JlbkBrZXJuZWwub3JnIOWGmemBkzoKPiA+ID4gRnJvbTogR3Vv
IFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPgo+ID4gPiBUaGUga2VybmVsIHdv
dWxkIHBhbmljIHdoZW4gcHJvYmVkIGZvciBhbiBpbGxlZ2FsIHBvc2l0aW9uLiBlZzoKPiA+ID4K
PiA+ID4gKENPTkZJR19SSVNDVl9JU0FfQz1uKQo+ID4gPgo+ID4gPiBlY2hvICdwOmhlbGxvIGtl
cm5lbF9jbG9uZSsweDE2IGEwPSVhMCcgPj4ga3Byb2JlX2V2ZW50cwo+ID4gPiBlY2hvIDEgPiBl
dmVudHMva3Byb2Jlcy9oZWxsby9lbmFibGUKPiA+ID4gY2F0IHRyYWNlCj4gPiA+Cj4gPiA+IEtl
cm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBzdGFjay1wcm90ZWN0b3I6IEtlcm5lbCBzdGFjawo+
ID4gPiBpcyBjb3JydXB0ZWQgaW46IF9fZG9fc3lzX25ld2ZzdGF0YXQrMHhiOC8weGI4Cj4gPiA+
IENQVTogMCBQSUQ6IDExMSBDb21tOiBzaCBOb3QgdGFpbnRlZAo+ID4gPiA2LjIuMC1yYzEtMDAw
MjctZzJkMzk4ZmU0OWE0ZCAjNDkwCj4gPiA+IEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxx
ZW11IChEVCkKPiA+ID4gQ2FsbCBUcmFjZToKPiA+ID4gWzxmZmZmZmZmZjgwMDA3MjY4Pl0gZHVt
cF9iYWNrdHJhY2UrMHgzOC8weDQ4Cj4gPiA+IFs8ZmZmZmZmZmY4MGM1ZTgzYz5dIHNob3dfc3Rh
Y2srMHg1MC8weDY4Cj4gPiA+IFs8ZmZmZmZmZmY4MGM2ZGEyOD5dIGR1bXBfc3RhY2tfbHZsKzB4
NjAvMHg4NAo+ID4gPiBbPGZmZmZmZmZmODBjNmRhNmM+XSBkdW1wX3N0YWNrKzB4MjAvMHgzMAo+
ID4gPiBbPGZmZmZmZmZmODBjNWVjZjQ+XSBwYW5pYysweDE2MC8weDM3NAo+ID4gPiBbPGZmZmZm
ZmZmODBjNmRiOTQ+XSBnZW5lcmljX2hhbmRsZV9hcmNoX2lycSsweDAvMHhhOAo+ID4gPiBbPGZm
ZmZmZmZmODAyZGVlYjA+XSBzeXNfbmV3c3RhdCsweDAvMHgzMAo+ID4gPiBbPGZmZmZmZmZmODAw
MTU4YzA+XSBzeXNfY2xvbmUrMHgyMC8weDMwCj4gPiA+IFs8ZmZmZmZmZmY4MDAwMzllOD5dIHJl
dF9mcm9tX3N5c2NhbGwrMHgwLzB4NAo+ID4gPiAtLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBub3Qg
c3luY2luZzogc3RhY2stcHJvdGVjdG9yOgo+ID4gPiBLZXJuZWwgc3RhY2sgaXMgY29ycnVwdGVk
IGluOiBfX2RvX3N5c19uZXdmc3RhdGF0KzB4YjgvMHhiOCBdLS0tCj4gPiA+Cj4gPiA+IFRoYXQg
aXMgYmVjYXVzZSB0aGUga3Byb2JlJ3MgZWJyZWFrIGluc3RydWN0aW9uIGJyb2tlIHRoZSBrZXJu
ZWwncwo+ID4gPiBvcmlnaW5hbCBjb2RlLiBUaGUgdXNlciBzaG91bGQgZ3VhcmFudGVlIHRoZSBj
b3JyZWN0aW9uIG9mIHRoZSBwcm9iZQo+ID4gPiBwb3NpdGlvbiwgYnV0IGl0IGNvdWxkbid0IG1h
a2UgdGhlIGtlcm5lbCBwYW5pYy4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCBhZGRzIGFyY2hfY2hl
Y2tfa3Byb2JlIGluIGFyY2hfcHJlcGFyZV9rcHJvYmUgdG8gcHJldmVudCBhbgo+ID4gPiBpbGxl
Z2FsIHBvc2l0aW9uIChTdWNoIGFzIHRoZSBtaWRkbGUgb2YgYW4gaW5zdHJ1Y3Rpb24pLgo+ID4g
Pgo+ID4gPiBGaXhlczogYzIyYjBiY2IxZGQwICgicmlzY3Y6IEFkZCBrcHJvYmVzIHN1cHBvcnRl
ZCIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNv
bT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+
IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyB8IDE4ICsrKysr
KysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKPiA+
ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gPiA+IGluZGV4IGYyMTU5MmQy
MDMwNi4uNDc1OTg5ZjA2ZDZkIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9w
cm9iZXMva3Byb2Jlcy5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJv
YmVzLmMKPiA+ID4gQEAgLTQ4LDYgKzQ4LDIxIEBAIHN0YXRpYyB2b2lkIF9fa3Byb2JlcyBhcmNo
X3NpbXVsYXRlX2luc24oc3RydWN0IGtwcm9iZSAqcCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4g
PiA+ICAgICAgIHBvc3Rfa3Byb2JlX2hhbmRsZXIocCwga2NiLCByZWdzKTsKPiA+ID4gIH0KPiA+
ID4KPiA+ID4gK3N0YXRpYyBib29sIF9fa3Byb2JlcyBhcmNoX2NoZWNrX2twcm9iZShzdHJ1Y3Qg
a3Byb2JlICpwKQo+ID4gPiArewo+ID4gPiArICAgICB1bnNpZ25lZCBsb25nIHRtcCAgPSAodW5z
aWduZWQgbG9uZylwLT5hZGRyIC0gcC0+b2Zmc2V0Owo+ID4gPiArICAgICB1bnNpZ25lZCBsb25n
IGFkZHIgPSAodW5zaWduZWQgbG9uZylwLT5hZGRyOwo+ID4gPiArCj4gPiA+ICsgICAgIHdoaWxl
ICh0bXAgPD0gYWRkcikgewo+ID4gPiArICAgICAgICAgICAgIGlmICh0bXAgPT0gYWRkcikKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gPiArCj4gPiA+ICsgICAg
ICAgICAgICAgdG1wICs9IEdFVF9JTlNOX0xFTkdUSCgqKGtwcm9iZV9vcGNvZGVfdCAqKXRtcCk7
Cj4gPiA+ICsgICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ICt9
Cj4gPgo+ID4gTEdUTS4KPiA+Cj4gPiBJIGhhdmUgc3VibWl0IGEgcGF0Y2ggdG8gZml4IHRoZSBz
YW1lIHByb2JsZW0sIGZvdW5kIGF0Ogo+IE9oLCBJIG1pc3NlZCB0aGF0IHBhdGNoLiBPdXIgZ29h
bCBpcyB0aGUgc2FtZS4KPgo+IEJ1dCBpdCB3b3VsZCBiZSBiZXN0IGlmIHlvdSByZXVzZWQgcC0+
b2Zmc2V0LCBub3QKPiBrYWxsc3ltc19sb29rdXBfc2l6ZV9vZmZzZXQsIHRoZSBwLT5hZGRyIGFk
ZGVkIGJ5IF9rcHJvYmVfYWRkcgo+IChrZXJuZWwva3Byb2Jlcy5jKSwgbm90IGp1c3Qga2FsbHN5
bXNfbG9va3VwX3NpemVfb2Zmc2V0LiBTdXJlLCBpdAo+IHdvcmtzIGFyb3VuZCBmb3IgdGhlIGN1
cnJlbnQgcmlzY3YsIGJ1dCB0aGF0J3Mgbm90IGNvcnJlY3QuClNvcnJ5LCB0aGUgYWJvdmUgZGVz
Y3JpcHRpb24gaXMgYSBsaXR0bGUgYml0IGNvbmZ1c2luZy4gV2hhdCBJIG1lYW4gaXMgdGhhdDoK
VGhlIHAtPmFkZHIgPSBmdW5jX2VudHJ5ICsgcC0+b2Zmc2V0LiBOb3Qga2FsbHN5bXNfbG9va3Vw
X3NpemVfb2Zmc2V0LgpZb3VyIHBhdGNoIGNvdWxkIGdldCB0aGUgd3JvbmcgZnVuY19lbnRyeS4K
Cj4KPiA+Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMwMTI3MTMwNTQxLjEy
NTA4NjUtMTEtY2hlbmd1b2thaTE3QG1haWxzLnVjYXMuYWMuY24vCj4gPgo+ID4gU28gdGhpcyBi
b3VuZGFyeSBjaGVjayBpcyBuZWNlc3Nhcnkgbm8gbWF0dGVyIENPTkZJR19SSVNDVl9JU0FfQyBp
cyBlbmFibGUgb3Igbm90LCByaWdodD8KPiBZZXMsIG15IHBhbmljIGV4YW1wbGUgaW4gdGhlIGNv
bW1pdCBsb2cgaXMgYmFzZWQgb24gdGhlCj4gIUNPTkZJR19SSVNDVl9JU0FfQywgeW91IGNvdWxk
bid0IG1pc3MgdGhhdC4KPgo+ID4KPiA+Cj4gPiA+ICsKPiA+ID4gIGludCBfX2twcm9iZXMgYXJj
aF9wcmVwYXJlX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+ID4gPiAgewo+ID4gPiAgICAgICB1
bnNpZ25lZCBsb25nIHByb2JlX2FkZHIgPSAodW5zaWduZWQgbG9uZylwLT5hZGRyOwo+ID4gPiBA
QCAtNTUsNiArNzAsOSBAQCBpbnQgX19rcHJvYmVzIGFyY2hfcHJlcGFyZV9rcHJvYmUoc3RydWN0
IGtwcm9iZSAqcCkKPiA+ID4gICAgICAgaWYgKHByb2JlX2FkZHIgJiAweDEpCj4gPiA+ICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSUxTRVE7Cj4gPiA+Cj4gPiA+ICsgICAgIGlmICghYXJjaF9jaGVj
a19rcHJvYmUocCkpCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSUxTRVE7Cj4gPiA+ICsK
PiA+ID4gICAgICAgLyogY29weSBpbnN0cnVjdGlvbiAqLwo+ID4gPiAgICAgICBwLT5vcGNvZGUg
PSAqcC0+YWRkcjsKPiA+ID4KPiA+Cj4gPiAtLQo+ID4gQlIsCj4gPiBMaWFvLCBDaGFuZwo+Cj4K
Pgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3Vv
IFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
