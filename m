Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669B8C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 10:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+/qADQJwoeYu9HWLwbhSBkaCOyYcTEhkIpLkXAH/nQ=; b=VnyAkkdfBnkJ13
	oKP61n1j2uAArM+Bidrrq/XugAJ99A698GWlzV7hpgQrtlPxo6/ufH1Q6PPX6c45uB+L3zUObPw+I
	g5VRU8sB/QlbLlnV5dE3hbc3ozjagWARZE3S/W0LKmJLF8KK6MADv4CePyhGbgC61ySwpZRsmae6o
	Qcw2TLd7kAVYPOSn6HLIeMPahuyt1lPSrN03V0hX2xoc77uOtYeNbAQdqvxz44/QDltr/dp20miQM
	9txBEmha+dbShD72jalCmk+WfUHQ2cplVt+m7C9gsUkAmcoDxBcJDWoX7IVwON28twUvzNAQX3ueV
	qytREsD4nrWXdm7kvvGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ely-0000000F2df-30BU;
	Wed, 08 May 2024 10:43:42 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4elu-0000000F2Zn-22sh
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 10:43:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD2DC1BF204;
	Wed,  8 May 2024 10:43:28 +0000 (UTC)
Message-ID: <d14c1d04-2fd9-4c9b-affb-f4335bd7e6fc@ghiti.fr>
Date: Wed, 8 May 2024 12:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] riscv: smp: fail booting up smp if inconsistent
 vlen is detected
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>,
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com>
 <4acc62d0-d62b-4d42-805b-0bc7f663a81c@ghiti.fr>
 <CABgGipXcjY9KDU=fN6KtER3mPbxsQdb+Y5Czhq7QDBFFc6p__w@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CABgGipXcjY9KDU=fN6KtER3mPbxsQdb+Y5Czhq7QDBFFc6p__w@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_034338_933548_A772A90A 
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

SGkgQW5keSwKCk9uIDA4LzA1LzIwMjQgMTA6MjEsIEFuZHkgQ2hpdSB3cm90ZToKPiBPbiBUaHUs
IEFwciAyNSwgMjAyNCBhdCA0OjAx4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZy
PiB3cm90ZToKPj4gSGkgQW5keSwKPj4KPj4gT24gMTIvMDQvMjAyNCAwODo0OCwgQW5keSBDaGl1
IHdyb3RlOgo+Pj4gQ3VycmVudGx5IHdlIG9ubHkgc3VwcG9ydCBWZWN0b3IgZm9yIFNNUCBwbGF0
Zm9ybXMsIHRoYXQgaXMsIGFsbCBTTVAKPj4+IGNvcmVzIGhhdmUgdGhlIHNhbWUgdmxlbmIuIElm
IHdlIGhhcHBlbiB0byBkZXRlY3QgYSBtaXNtYXRjaGluZyB2bGVuLCBpdAo+Pj4gaXMgYmV0dGVy
IHRvIGp1c3QgZmFpbCBib290dGluZyBpdCB1cCB0byBwcmV2ZW50IGZ1cnRoZXIgcmFjZS9zY2hl
ZHVsaW5nCj4+PiBpc3N1ZXMuCj4+Pgo+Pj4gQWxzbywgbW92ZSAuTHNlY29uZGFyeV9wYXJrIGZv
cndhcmQgYW5kIGNoYWdlIGB0YWlsIHNtcF9jYWxsaW5gIGludG8gYQo+Pj4gcmVndWxhciBjYWxs
IGluIHRoZSBlYXJseSBhc3NlbWJseS4gU28gYSBjb3JlIHdvdWxkIGJlIHBhcmtlZCByaWdodAo+
Pj4gYWZ0ZXIgYSByZXR1cm4gZnJvbSBzbXBfY2FsbGluLiBOb3RlIHRoYXQgYSBzdWNjZXNzZnVs
IHNtcF9jYWxsaW4KPj4+IGRvZXMgbm90IHJldHVybi4KPj4+Cj4+PiBGaXhlczogNzAxNzg1OGVi
MmQ3ICgicmlzY3Y6IEludHJvZHVjZSByaXNjdl92X3ZzaXplIHRvIHJlY29yZCBzaXplIG9mIFZl
Y3RvciBjb250ZXh0IikKPj4+IFJlcG9ydGVkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+Pj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1yaXNjdi8yMDI0MDIyOC12aWNpbml0eS1jb3Juc3RhbGstNGI4ZWI1ZmU1NzMwQHNwdWQvCj4+
PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+Pj4gLS0t
Cj4+PiBDaGFuZ2Vsb2cgdjQ6Cj4+PiAgICAtIHVwZGF0ZSBjb21tZW50IGFsc28gaW4gdGhlIGFz
c2VtYmx5IGNvZGUgKFl1bmh1aSkKPj4+IENoYW5nZWxvZyB2MjoKPj4+ICAgIC0gdXBkYXRlIGNv
bW1pdCBtZXNzYWdlIHRvIGV4cGxhaW4gYXNtIGNvZGUgY2hhbmdlIChDb25vcikKPj4+IC0tLQo+
Pj4gICAgYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TICAgIHwgMTkgKysrKysrKysrKysrLS0tLS0t
LQo+Pj4gICAgYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIHwgMTQgKysrKysrKysrLS0tLS0K
Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2hlYWQuUwo+Pj4gaW5kZXggNDIzNmE2OWMzNWNiLi5hMDBmNzUyM2NiOTEgMTAw
NjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPj4+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2hlYWQuUwo+Pj4gQEAgLTE2NSw5ICsxNjUsMjAgQEAgc2Vjb25kYXJ5X3N0YXJ0
X3NiaToKPj4+ICAgICNlbmRpZgo+Pj4gICAgICAgIGNhbGwgLkxzZXR1cF90cmFwX3ZlY3Rvcgo+
Pj4gICAgICAgIHNjc19sb2FkX2N1cnJlbnQKPj4+IC0gICAgIHRhaWwgc21wX2NhbGxpbgo+Pj4g
KyAgICAgY2FsbCBzbXBfY2FsbGluCj4+PiAgICAjZW5kaWYgLyogQ09ORklHX1NNUCAqLwo+Pj4K
Pj4+ICsuYWxpZ24gMgo+Pj4gKy5Mc2Vjb25kYXJ5X3Bhcms6Cj4+PiArICAgICAvKgo+Pj4gKyAg
ICAgICogUGFyayB0aGlzIGhhcnQgaWYgd2U6Cj4+PiArICAgICAgKiAgLSBoYXZlIHRvbyBtYW55
IGhhcnRzIG9uIENPTkZJR19SSVNDVl9CT09UX1NQSU5XQUlUCj4+PiArICAgICAgKiAgLSByZWNl
aXZlIGFuIGVhcmx5IHRyYXAsIGJlZm9yZSBzZXR1cF90cmFwX3ZlY3RvciBmaW5pc2hlZAo+Pj4g
KyAgICAgICogIC0gZmFpbCBpbiBzbXBfY2FsbGluKCksIGFzIGEgc3VjY2Vzc2Z1bCBvbmUgd291
bGRuJ3QgcmV0dXJuCj4+PiArICAgICAgKi8KPj4+ICsgICAgIHdmaQo+Pj4gKyAgICAgaiAuTHNl
Y29uZGFyeV9wYXJrCj4+PiArCj4+PiAgICAuYWxpZ24gMgo+Pj4gICAgLkxzZXR1cF90cmFwX3Zl
Y3RvcjoKPj4+ICAgICAgICAvKiBTZXQgdHJhcCB2ZWN0b3IgdG8gZXhjZXB0aW9uIGhhbmRsZXIg
Ki8KPj4+IEBAIC0xODEsMTIgKzE5Miw2IEBAIHNlY29uZGFyeV9zdGFydF9zYmk6Cj4+PiAgICAg
ICAgY3NydyBDU1JfU0NSQVRDSCwgemVybwo+Pj4gICAgICAgIHJldAo+Pj4KPj4+IC0uYWxpZ24g
Mgo+Pj4gLS5Mc2Vjb25kYXJ5X3Bhcms6Cj4+PiAtICAgICAvKiBXZSBsYWNrIFNNUCBzdXBwb3J0
IG9yIGhhdmUgdG9vIG1hbnkgaGFydHMsIHNvIHBhcmsgdGhpcyBoYXJ0ICovCj4+PiAtICAgICB3
ZmkKPj4+IC0gICAgIGogLkxzZWNvbmRhcnlfcGFyawo+Pj4gLQo+Pj4gICAgU1lNX0NPREVfRU5E
KF9zdGFydCkKPj4+Cj4+PiAgICBTWU1fQ09ERV9TVEFSVChfc3RhcnRfa2VybmVsKQo+Pj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3NtcGJvb3QuYwo+Pj4gaW5kZXggZDQxMDkwZmMzMjAzLi42NzM0MzdjY2MxM2QgMTAwNjQ0Cj4+
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3NtcGJvb3QuYwo+Pj4gQEAgLTIxNCw2ICsyMTQsMTUgQEAgYXNtbGlua2FnZSBfX3Zp
c2libGUgdm9pZCBzbXBfY2FsbGluKHZvaWQpCj4+PiAgICAgICAgc3RydWN0IG1tX3N0cnVjdCAq
bW0gPSAmaW5pdF9tbTsKPj4+ICAgICAgICB1bnNpZ25lZCBpbnQgY3Vycl9jcHVpZCA9IHNtcF9w
cm9jZXNzb3JfaWQoKTsKPj4+Cj4+PiArICAgICBpZiAoaGFzX3ZlY3RvcigpKSB7Cj4+PiArICAg
ICAgICAgICAgIC8qCj4+PiArICAgICAgICAgICAgICAqIFJldHVybiBhcyBlYXJseSBhcyBwb3Nz
aWJsZSBzbyB0aGUgaGFydCB3aXRoIGEgbWlzbWF0Y2hpbmcKPj4+ICsgICAgICAgICAgICAgICog
dmxlbiB3b24ndCBib290Lgo+Pj4gKyAgICAgICAgICAgICAgKi8KPj4+ICsgICAgICAgICAgICAg
aWYgKHJpc2N2X3Zfc2V0dXBfdnNpemUoKSkKPj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1
cm47Cj4+PiArICAgICB9Cj4+PiArCj4+PiAgICAgICAgLyogQWxsIGtlcm5lbCB0aHJlYWRzIHNo
YXJlIHRoZSBzYW1lIG1tIGNvbnRleHQuICAqLwo+Pj4gICAgICAgIG1tZ3JhYihtbSk7Cj4+PiAg
ICAgICAgY3VycmVudC0+YWN0aXZlX21tID0gbW07Cj4+PiBAQCAtMjI2LDExICsyMzUsNiBAQCBh
c21saW5rYWdlIF9fdmlzaWJsZSB2b2lkIHNtcF9jYWxsaW4odm9pZCkKPj4+ICAgICAgICBudW1h
X2FkZF9jcHUoY3Vycl9jcHVpZCk7Cj4+PiAgICAgICAgc2V0X2NwdV9vbmxpbmUoY3Vycl9jcHVp
ZCwgMSk7Cj4+Pgo+Pj4gLSAgICAgaWYgKGhhc192ZWN0b3IoKSkgewo+Pj4gLSAgICAgICAgICAg
ICBpZiAocmlzY3Zfdl9zZXR1cF92c2l6ZSgpKQo+Pj4gLSAgICAgICAgICAgICAgICAgICAgIGVs
Zl9od2NhcCAmPSB+Q09NUEFUX0hXQ0FQX0lTQV9WOwo+Pj4gLSAgICAgfQo+Pj4gLQo+Pj4gICAg
ICAgIHJpc2N2X3VzZXJfaXNhX2VuYWJsZSgpOwo+Pj4KPj4+ICAgICAgICAvKgo+Pj4KPj4gU28g
dGhpcyBzaG91bGQgZ28gaW50byAtZml4ZXMsIHdvdWxkIHlvdSBtaW5kIHNlbmRpbmcgYSBzaW5n
bGUgcGF0Y2ggZm9yCj4+IHRoaXMgZml4Pwo+IEkgdGhvdWdodCBpdCB3b3VsZCBiZSBtYWdpY2Fs
bHkgcGlja2VkIHVwIGJ5IGEgYm90IGFzIGxvbmcgYXMgd2UgaGF2ZQo+IGEgZml4IHRhZy4gQW0g
SSBhc3N1bWluZyBzb21ldGhpbmcgd3Jvbmc/CgoKSXQgZ2V0cyBiYWNrcG9ydGVkIHRvIHN0YWJs
ZSB3aGVuIGl0IGlzIG1lcmdlZCwgYnV0IHRoZW4gaXQgaXMgbWlzc2luZyAKZnJvbSB0aGUgZmly
c3Qgc3RhYmxlIHJlbGVhc2VzIChhcyBsb25nIGFzIGl0IGlzIG5vdCBtZXJnZWQpLgoKQnV0IGFu
eXdheSwgNi45IGZpeGVzIGFyZSBhbGwgb3V0LCBzbyBsZXQncyBob3BlIHRoaXMgc2VyaWVzIG1h
a2VzIGl0IHRvIAo2LjEwLgoKVGhhbmtzLAoKQWxleAoKCj4KPj4gWW91ciBwYXRjaCA4IGlzIGFj
dHVhbGx5IGFscmVhZHkgZml4ZWQgYnkgQ2xlbWVudCdzIHBhdGNoCj4+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNDA5MTQzODM5LjU1ODc4NC0xLWNsZWdlckByaXZv
c2luYy5jb20vCj4gT2theSwgSSB3aWxsIGRyb3AgaXQgYXQgdGhlIG5leHQgcmV2aXNpb24uCj4K
Pj4gYW5kIEkgYWxyZWFkeSBtZW50aW9uZWQgdGhpcyBvbmUgdG8gUGFsbWVyLgo+Pgo+PiBUaGFu
a3MsCj4+Cj4+IEFsZXgKPj4KPiBUaGFua3MsCj4gQW5keQo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
