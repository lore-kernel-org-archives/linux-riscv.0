Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D0CC3DA6F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Baebze5TuRQszRVEp5ItmVCL9Ja4WRWTQO2CROrnxuU=; b=suyZhto8ITSsqs
	Vuv0LFkAkfALCeLoZjCe8DxHLX0ffbjfN6Zi+i3MahmVO+nj5EBaW+2GnYLpF6TYZi78w/lnzPqnC
	3qmrGjC/Y/P6MlC9nLlsMe1MDak2YFwhtn6Rro4SMBhGUSzs2tHyh/ntU2tOxS6qYuSVRWOBFpJa+
	gbH+jIDHdOEyJ+ZLeejS0MnNokujHz0VcKuFWBfX627PgZsYHaJcq3u0/GR6+J88lt6OMrNWZiSKs
	26YouzMwslxgVYrEb+y+aO/ItWSFzf4Wn3m0nNQF8OIuQ5CYjDo/tWAbnyF8f2kdkJhziL1usv4DC
	sZ7AZh/044jScDPmwcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZceQ-005wTV-2Y;
	Fri, 25 Aug 2023 19:39:22 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZceM-005wSl-0y
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 19:39:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51F5B60002;
	Fri, 25 Aug 2023 19:39:07 +0000 (UTC)
Message-ID: <6dcfcf22-08a4-ba1f-17c2-75f93efb6329@ghiti.fr>
Date: Fri, 25 Aug 2023 21:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] riscv: support arch_has_hw_pte_young()
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, Jinyu Tang <tjytimi@163.com>
Cc: palmer@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 yuzhao@google.com, conor.dooley@microchip.com, ajones@ventanamicro.com,
 guoren@kernel.org, tongtiangen@huawei.com, anup@brainfault.org,
 akpm@linux-foundation.org, falcon@tinylab.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>
References: <20230129064956.143664-1-tjytimi@163.com>
 <CAMWQL2gBj84qhBopi=YKmHaUose2ggALKtOWqb6adDiuvS5xcg@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAMWQL2gBj84qhBopi=YKmHaUose2ggALKtOWqb6adDiuvS5xcg@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_123918_641369_24282CBA 
X-CRM114-Status: GOOD (  22.46  )
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

SGkgWW9uZy1YdWFuLAoKCk9uIDI1LzA4LzIwMjMgMDc6NDIsIFlvbmctWHVhbiBXYW5nIHdyb3Rl
Ogo+IEhpIEppbnl1LAo+Cj4gSXQgc2VlbXMgbGlrZSBpdCBoYXMgYmVlbiBhIHdoaWxlIHNpbmNl
IHRoZSBsYXN0IHJlbGVhc2Ugb2YgdGhpcyBwYXRjaC4gRG8KPiB5b3UgaGF2ZSBhbnkgcGxhbnMg
Zm9yIHRoZSBwYXRjaCByZWNlbnRseT8gT3IsIGRvIHlvdSBtaW5kIHNoYXJpbmcgYW55Cj4gaW50
ZXJuYWwgcHJvZ3Jlc3Mgb24gdGhlIHBhdGNoPwo+Cj4gV2UgYXJlIHN0YXJ0aW5nIHRvIHdvcmsg
b24gdGhlIFN2YWR1IGV4dGVuc2lvbiBvZiBwdGUgQS9EIGJpdCBmZWF0dXJlIG9uCj4gTGludXgu
CgoKVGhpcyB0YXNrIHdhcyBhc3NpZ25lZCB0byBtZSBvbiB0aGUgUklTRSBrZXJuZWwgc3ByZWFk
c2hlZXQsIGlmIHlvdSAKaW5kZWVkIHRha2Ugb3ZlciwgSSdsbCBjaGFuZ2UgaXQgdG8geW91ciBu
YW1lOiBhbnkgb2JqZWN0aW9uPwoKClRoYW5rcywKCgpBbGV4CgoKPiBEbyB5b3UgZmluZCBhbnkg
cGxhY2VzIHdoZXJlIHdlIG1heSBwb3RlbnRpYWxseSB3b3JrIHRvZ2V0aGVyIHRvCj4gZ2V0IHRo
aW5ncyBtb3Zpbmc/IEFsc28sIEkgYW0gd2lsbGluZyB0byBiYXNlIG9uIHRvcCBvZiB5b3VyIHdv
cmsgYW5kCj4gY29udGludWUgc2VuZGluZyB0aGUgc2VyaWVzIChieSBrZWVwaW5nIGFsbCB0aGUg
Y3JlZGl0cyBmcm9tIHRoZSBvcmlnaW5hbAo+IHdvcmspCj4KPiBQbGVhc2UgbGV0IG1lIGtub3cg
aWYgeW91IGhhdmUgYW55IHRob3VnaHRzLCB0aGFua3MgOikKPgo+IFJlZ2FyZHMsCj4gWW9uZy1Y
dWFuCj4KPiBPbiBTdW4sIEphbiAyOSwgMjAyMyBhdCAyOjUz4oCvUE0gSmlueXUgVGFuZyA8dGp5
dGltaUAxNjMuY29tPiB3cm90ZToKPj4gVGhlIGFyY2hfaGFzX2h3X3B0ZV95b3VuZygpIGlzIGZh
bHNlIGZvciByaXNjdiBieSBkZWZhdWx0LiBJZiBpdCdzCj4+IGZhbHNlLCBwYWdlIHRhYmxlIHdh
bGsgaXMgYWxtb3N0IHNraXBwZWQgZm9yIE1HTFJVIHJlY2xhaW0uIEFuZCBpdAo+PiB3aWxsIGFs
c28gY2F1c2UgdXNlbGVzcyBzdGVwIGluIF9fd3BfcGFnZV9jb3B5X3VzZXIoKS4KPj4KPj4gUklT
Qy1WIFByaXZpbGVnZWQgQm9vayBzYXlzIHRoYXQgcmlzY3YgaGF2ZSB0d28gc2NoZW1lcyB0byBt
YW5hZ2UgQQo+PiBhbmQgRCBiaXQuCj4+Cj4+IFNvIGFkZCBhIGNvbmZpZyBmb3Igc2VsZWN0aW5n
LCB0aGUgZGVmYXVsdCBpcyB0cnVlLiBGb3Igc2ltcGxlCj4+IGltcGxlbWVudGF0aW9uIHJpc2N2
IENQVSB3aGljaCBqdXN0IGdlbmVyYXRlIHBhZ2UgZmF1bHQsIHVuc2VsZWN0IGl0Lgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBKaW55dSBUYW5nIDx0anl0aW1pQDE2My5jb20+Cj4+IC0tLQo+PiAgIGFy
Y2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgIHwgMTAgKysrKysrKysrKwo+PiAgIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgIDcgKysrKysrKwo+PiAgIDIgZmlsZXMgY2hh
bmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29u
ZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+IGluZGV4IGUyYjY1NjA0M2FiZi4uMTdjODI4ODU1
NDljIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPj4gKysrIGIvYXJjaC9yaXNj
di9LY29uZmlnCj4+IEBAIC0xODAsNiArMTgwLDE2IEBAIGNvbmZpZyBQQUdFX09GRlNFVAo+PiAg
ICAgICAgICBkZWZhdWx0IDB4ODAwMDAwMDAgaWYgNjRCSVQgJiYgIU1NVQo+PiAgICAgICAgICBk
ZWZhdWx0IDB4ZmY2MDAwMDAwMDAwMDAwMCBpZiA2NEJJVAo+Pgo+PiArY29uZmlnIEFSQ0hfSEFT
X0hBUkRXQVJFX1BURV9ZT1VORwo+PiArICAgICAgIGJvb2wgIkhhcmR3YXJlIFNldCBQVEUgQWNj
ZXNzIEJpdCIKPj4gKyAgICAgICBkZWZhdWx0IHkKPj4gKyAgICAgICBoZWxwCj4+ICsgICAgICAg
ICBTZWxlY3QgaWYgaGFyZHdhcmUgc2V0IEEgYml0IHdoZW4gUFRFIGlzIGFjY2Vzc2VkLiBUaGUg
ZGVmYXVsdCBpcwo+PiArICAgICAgICAgJ1knLCBiZWNhdXNlIG1vc3QgUklTQy1WIENQVSBoYXJk
d2FyZSBjYW4gbWFuYWdlIEEgYW5kIEQgYml0Lgo+PiArICAgICAgICAgQnV0IFJJU0MtViBtYXkg
aGF2ZSBzaW1wbGUgaW1wbGVtZW50YXRpb24gdGhhdCBkbyBub3Qgc3VwcG9ydAo+PiArICAgICAg
ICAgaGFyZHdhcmUgc2V0IEEgYml0IGJ1dCBvbmx5IGdlbmVyYXRlIHBhZ2UgZmF1bHQsIGZvciB0
aGF0IGNhc2UganVzdAo+PiArICAgICAgICAgdW5zZWxlY3QgaXQuCj4+ICsKPj4gICBjb25maWcg
S0FTQU5fU0hBRE9XX09GRlNFVAo+PiAgICAgICAgICBoZXgKPj4gICAgICAgICAgZGVwZW5kcyBv
biBLQVNBTl9HRU5FUklDCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+IGluZGV4IDRlYmE5
YTk4ZDBlMy4uMWRiNTRhYjRlMWJhIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+
PiBAQCAtNTMyLDYgKzUzMiwxMyBAQCBzdGF0aWMgaW5saW5lIGludCBwdGVwX2NsZWFyX2ZsdXNo
X3lvdW5nKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+PiAgICAgICAgICAgKi8KPj4gICAg
ICAgICAgcmV0dXJuIHB0ZXBfdGVzdF9hbmRfY2xlYXJfeW91bmcodm1hLCBhZGRyZXNzLCBwdGVw
KTsKPj4gICB9Cj4+ICsjaWZkZWYgQ09ORklHX0FSQ0hfSEFTX0hBUkRXQVJFX1BURV9ZT1VORwo+
PiArI2RlZmluZSBhcmNoX2hhc19od19wdGVfeW91bmcgYXJjaF9oYXNfaHdfcHRlX3lvdW5nCj4+
ICtzdGF0aWMgaW5saW5lIGJvb2wgYXJjaF9oYXNfaHdfcHRlX3lvdW5nKHZvaWQpCj4+ICt7Cj4+
ICsgICAgICAgcmV0dXJuIHRydWU7Cj4+ICt9Cj4+ICsjZW5kaWYKPj4KPj4gICAjZGVmaW5lIHBn
cHJvdF9ub25jYWNoZWQgcGdwcm90X25vbmNhY2hlZAo+PiAgIHN0YXRpYyBpbmxpbmUgcGdwcm90
X3QgcGdwcm90X25vbmNhY2hlZChwZ3Byb3RfdCBfcHJvdCkKPj4gLS0KPj4gMi4zMC4yCj4+Cj4+
Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
