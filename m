Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF70C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTAJNOwdNGoqjUcN8agyLyNMZZazpjKuPvUjjyyykYQ=; b=ZEUR1kg0noJgIT
	NWO3dRFettorF28BmSLjLehbu5wytITWENNsMiQvyPKGVFXWlXNX51lMiDzx9YSuqftxd6e1t3Z+H
	bsOzVSIy0W47ZEg4Dlu1iX/Mv01MUvcssbPROk1/XMns52uooVY6dufaOUPDn0hg4Bg+pyAg4PVqH
	Cc9YvLhrsAWP6u2+5kiwwP9y+9MqM5LG728KEDlRfsaa+2k1KpknPwSDPAC34XIMqxqE/rjmkxulb
	YY5FvIIQNi3NjajSYPlCfEI2/pHpyL3fqW1BG+uGoN36lO6CaoMrJvhLK1t1idqpkx0z4GHepu16I
	8Ohit8B2Bqpt5t9zcSaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyraD-00CBup-KW; Wed, 08 Jun 2022 09:02:33 +0000
Received: from forward500j.mail.yandex.net ([5.45.198.250])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrLc-00C54o-JA; Wed, 08 Jun 2022 08:47:31 +0000
Received: from vla1-6796d9dd75b4.qloud-c.yandex.net (vla1-6796d9dd75b4.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:518f:0:640:6796:d9dd])
	by forward500j.mail.yandex.net (Yandex) with ESMTP id 23B396CB6FDA;
	Wed,  8 Jun 2022 11:47:19 +0300 (MSK)
Received: from vla5-3832771863b8.qloud-c.yandex.net (vla5-3832771863b8.qloud-c.yandex.net [2a02:6b8:c18:3417:0:640:3832:7718])
	by vla1-6796d9dd75b4.qloud-c.yandex.net (mxback/Yandex) with ESMTP id wZforJNtKg-lHfW1R9F;
	Wed, 08 Jun 2022 11:47:19 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1654678039;
	bh=kJRph6KRLggjdnB4kRNp3R8IpwrXtJ9L63C1WZIOf6o=;
	h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
	b=H8JvBCdhmkU8EzCfdJIP0ALb48Cum9Cadp2KNOQW8Oqs4K4elYv5+6Qa0mC/HBJP+
	 0MXswL5D1Cib7JsQZjrm8M5tZhpqD6v7XdU6YTZjjudSgZtQ0B7TY1QvHUgcG8xCnP
	 aOHb1Q+keoU6CxD8/NqTQ5JKNwh7LDZA8S0g1QII=
Authentication-Results: vla1-6796d9dd75b4.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla5-3832771863b8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id V56VOmdH7z-lFN0tPc1;
	Wed, 08 Jun 2022 11:47:15 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
Date: Wed, 8 Jun 2022 11:47:12 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@atishpatra.org>
Cc: Genevieve Chan <genevieve.chan@starfivetech.com>, =?UTF-8?B?Sm/Do28g?=
 =?UTF-8?B?TcOhcmlv?= Domingos <joao.mario@tecnico.ulisboa.pt>, Nikita
 Shubin <n.shubin@yadro.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] RISC-V: Create unique identification for SoC PMU
Message-ID: <20220608114712.608239a5@redslave.neermore.group>
In-Reply-To: <CAOnJCULuQw2E3cD5KQKVs8EbcbPPeJQDqvikagxnkDSH+UWqjQ@mail.gmail.com>
References: <20220607131648.29439-1-nikita.shubin@maquefel.me>
	<20220607131648.29439-2-nikita.shubin@maquefel.me>
	<CAOnJCULuQw2E3cD5KQKVs8EbcbPPeJQDqvikagxnkDSH+UWqjQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_014729_387203_14110006 
X-CRM114-Status: GOOD (  30.13  )
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

SGVsbG8gQXRpc2ghCgpPbiBUdWUsIDcgSnVuIDIwMjIgMDk6Mzc6MTkgLTA3MDAKQXRpc2ggUGF0
cmEgPGF0aXNocEBhdGlzaHBhdHJhLm9yZz4gd3JvdGU6Cgo+IE9uIFR1ZSwgSnVuIDcsIDIwMjIg
YXQgNjoxNyBBTSBOaWtpdGEgU2h1YmluCj4gPG5pa2l0YS5zaHViaW5AbWFxdWVmZWwubWU+IHdy
b3RlOgo+ID4KPiA+IEZyb206IEpvw6NvIE3DoXJpbyBEb21pbmdvcyA8am9hby5tYXJpb0B0ZWNu
aWNvLnVsaXNib2EucHQ+Cj4gPgo+ID4gVGhlIFNCSSBQTVUgcGxhdGZvcm0gZHJpdmVyIGRpZCBu
b3QgcHJvdmlkZSBhbnkgaWRlbnRpZmljYXRpb24gZm9yCj4gPiBwZXJmIGV2ZW50cyBtYXRjaGlu
Zy4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IHN5c2ZzIGZpbGUgaW5zaWRlCj4gPiB0aGUg
cGxhdGZvcm0gZGV2aWNlIChzb2M6cG11L2lkKSBmb3IgcG11IGlkZW50aWZpY2F0aW9uLgo+ID4K
PiA+IFRoZSBpZGVudGlmaWNhdGlvbiBpcyBhIDY0LWJpdCB2YWx1ZSBnZW5lcmF0ZWQgYXM6Cj4g
PiBbNjMtMzJdOiBtdmVuZG9yaWQ7Cj4gPiBbMzFdOiBtYXJjaGlkW01TQl07Cj4gPiBbMzAtMTZd
OiBtYXJjaGlkWzE1LTBdOwo+ID4gWzE1LTBdOiBtaW1waWRbMTVNU0JzXTsKPiA+ICAKPiAKPiBU
aGlzIGlzIG5vdCBlbnRpcmVseSBjb3JyZWN0IGFzIG1hcmNoaWQgb3IgbWltcGlkIGNhbiBiZSBN
WExFTi4gVGhlCj4gZW5jb2Rpbmcgc2NoZW1lIGlzIGxlZnQgdXB0byB0aGUKPiB2ZW5kb3IuIFdl
IGNhbiBub3QgYXNzdW1lIGFueXRoaW5nIGFib3V0IGl0Lgo+IAo+IFRoZSBwdXJwb3NlIG9mIHRo
ZSBQTVUgSUQgaXMgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiBkaWZmZXJlbnQKPiB2ZW5kb3JzL2dl
bmVyYXRpb25zLiBUaGUgcGVyZiB0b29sIGV4cGVjdHMKPiBhIGpzb24gc3RyaW5nLgo+IEkgdGhp
bmsgeW91IGNhbiBqdXN0IGtlZXAgYWxsIHRoZXNlIDMgcmVnaXN0ZXJzIGludG8gdGhlIEpTT04g
c3RyaW5nCj4gYXMgaXQgaXMgdG8gYXZvaWQgYW55IHBpdGZhbGxzIHdpdGggdmVuZG9yIHdlaXJk
bmVzcy4KClRoaXMgbWFrZSBzZW5zZSB0byBtZS4gSSdsbCByZXdvcmsgdGhpcyBwYXRjaCBhY2Nv
cmRpbmcgeW91cgpzdWdnZXN0aW9ucy4KCllvdXJzLApOaWtpdGEgU2h1YmluLgoKPiAKPiA+IFRo
ZSBDU1JzIGFyZSBkZXRhaWxlZCBpbiB0aGUgUklTQy1WIHByaXZpbGVnZWQgc3BlYyBbMV0uCj4g
PiBUaGUgbWFyY2hpZCBpcyBzcGxpdCBpbiBNU0IgKyAxNUxTQnMsIGR1ZSB0byB0aGUgTVNCIGJl
aW5nIHVzZWQgZm9yCj4gPiBvcGVuLXNvdXJjZSBhcmNoaXRlY3R1cmUgaWRlbnRpZmljYXRpb24u
Cj4gPgo+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogSm/Do28gTcOhcmlvIERvbWluZ29zIDxqb2FvLm1hcmlvQHRl
Y25pY28udWxpc2JvYS5wdD4KPiA+IFRlc3RlZC1ieTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5A
eWFkcm8uY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICB8ICAz
ICsrKwo+ID4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgfCA0Nwo+ID4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrIDIgZmlsZXMgY2hhbmdlZCwgNTAKPiA+IGluc2Vy
dGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+ID4gaW5kZXggNzc1ZDMzMjJiNDIyLi41MGRkOWI2ZWNj
OWUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+ID4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc2JpLmMKPiA+IEBAIC02MjcsMTYgKzYyNywxOSBAQCBsb25nIHNiaV9n
ZXRfbXZlbmRvcmlkKHZvaWQpCj4gPiAgewo+ID4gICAgICAgICByZXR1cm4gX19zYmlfYmFzZV9l
Y2FsbChTQklfRVhUX0JBU0VfR0VUX01WRU5ET1JJRCk7Cj4gPiAgfQo+ID4gK0VYUE9SVF9TWU1C
T0woc2JpX2dldF9tdmVuZG9yaWQpOwo+ID4KPiA+ICBsb25nIHNiaV9nZXRfbWFyY2hpZCh2b2lk
KQo+ID4gIHsKPiA+ICAgICAgICAgcmV0dXJuIF9fc2JpX2Jhc2VfZWNhbGwoU0JJX0VYVF9CQVNF
X0dFVF9NQVJDSElEKTsKPiA+ICB9Cj4gPiArRVhQT1JUX1NZTUJPTChzYmlfZ2V0X21hcmNoaWQp
Owo+ID4KPiA+ICBsb25nIHNiaV9nZXRfbWltcGlkKHZvaWQpCj4gPiAgewo+ID4gICAgICAgICBy
ZXR1cm4gX19zYmlfYmFzZV9lY2FsbChTQklfRVhUX0JBU0VfR0VUX01JTVBJRCk7Cj4gPiAgfQo+
ID4gK0VYUE9SVF9TWU1CT0woc2JpX2dldF9taW1waWQpOwo+ID4KPiA+ICBzdGF0aWMgdm9pZCBz
Ymlfc2VuZF9jcHVtYXNrX2lwaShjb25zdCBzdHJ1Y3QgY3B1bWFzayAqdGFyZ2V0KQo+ID4gIHsK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiBiL2RyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgaW5kZXggYTEzMTdhNDgzNTEyLi4xNWFiM2RjNjhlN2EK
PiA+IDEwMDY0NCAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiArKysgYi9k
cml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiBAQCAtNjkzLDYgKzY5Myw0NiBAQCBzdGF0
aWMgaW50IHBtdV9zYmlfc2V0dXBfaXJxcyhzdHJ1Y3QgcmlzY3ZfcG11Cj4gPiAqcG11LCBzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGUgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMg
dWludDY0X3QgcG11X3NiaV9nZXRfcG11X2lkKHZvaWQpCj4gPiArewo+ID4gKyAgICAgICB1bmlv
biBzYmlfcG11X2lkIHsKPiA+ICsgICAgICAgICAgICAgICB1aW50NjRfdCB2YWx1ZTsKPiA+ICsg
ICAgICAgICAgICAgICBzdHJ1Y3Qgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdWludDE2
X3QgaW1wOjE2Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3QgYXJjaDoxNjsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZlbmRvcjozMjsKPiA+ICsgICAg
ICAgICAgICAgICB9Owo+ID4gKyAgICAgICB9IHBtdWlkOwo+ID4gKwo+ID4gKyAgICAgICBwbXVp
ZC52YWx1ZSA9IDA7Cj4gPiArICAgICAgIHBtdWlkLnZlbmRvciA9ICh1aW50MzJfdCkgc2JpX2dl
dF9tdmVuZG9yaWQoKTsKPiA+ICsgICAgICAgcG11aWQuYXJjaCA9IChzYmlfZ2V0X21hcmNoaWQo
KSA+PiAoNjMgLSAxNSkgJiAoMSA8PCAxNSkpIHwKPiA+IChzYmlfZ2V0X21hcmNoaWQoKSAmIDB4
N0ZGRik7Cj4gPiArICAgICAgIHBtdWlkLmltcCA9IChzYmlfZ2V0X21pbXBpZCgpID4+IDE2KTsK
PiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIHBtdWlkLnZhbHVlOwo+ID4gK30KPiA+ICsKPiA+ICtz
dGF0aWMgc3NpemVfdCBwbXVfc2JpX2lkX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+ID4gKyAg
ICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4g
PiArewo+ID4gKyAgICAgICBpbnQgbGVuOwo+ID4gKwo+ID4gKyAgICAgICBsZW4gPSBzcHJpbnRm
KGJ1ZiwgIjB4JWxseFxuIiwgcG11X3NiaV9nZXRfcG11X2lkKCkpOwo+ID4gKyAgICAgICBpZiAo
bGVuIDw9IDApCj4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJteWRydjogSW52YWxp
ZCBzcHJpbnRmIGxlbjogJWRuIiwKPiA+IGxlbik7ICsKPiA+ICsgICAgICAgcmV0dXJuIGxlbjsK
PiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIERFVklDRV9BVFRSKGlkLCBTX0lSVUdPIHwgU19JV1VT
UiwgcG11X3NiaV9pZF9zaG93LCAwKTsKPiA+ICsKPiA+ICtzdGF0aWMgc3RydWN0IGF0dHJpYnV0
ZSAqcG11X3NiaV9hdHRyc1tdID0gewo+ID4gKyAgICAgICAmZGV2X2F0dHJfaWQuYXR0ciwKPiA+
ICsgICAgICAgTlVMTAo+ID4gK307Cj4gPiArCj4gPiArQVRUUklCVVRFX0dST1VQUyhwbXVfc2Jp
KTsKPiA+ICsKPiA+ICBzdGF0aWMgaW50IHBtdV9zYmlfZGV2aWNlX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3QgcmlzY3ZfcG11ICpw
bXUgPSBOVUxMOwo+ID4gQEAgLTcyOSw2ICs3NjksMTMgQEAgc3RhdGljIGludCBwbXVfc2JpX2Rl
dmljZV9wcm9iZShzdHJ1Y3QKPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikgcG11LT5jdHJfY2xl
YXJfaWR4ID0gcG11X3NiaV9jdHJfY2xlYXJfaWR4Owo+ID4gICAgICAgICBwbXUtPmN0cl9yZWFk
ID0gcG11X3NiaV9jdHJfcmVhZDsKPiA+Cj4gPiArICAgICAgIHJldCA9IHN5c2ZzX2NyZWF0ZV9n
cm91cCgmcGRldi0+ZGV2LmtvYmosICZwbXVfc2JpX2dyb3VwKTsKPiA+ICsgICAgICAgaWYgKHJl
dCkgewo+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgInN5c2ZzIGNyZWF0
aW9uIGZhaWxlZFxuIik7Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsgICAg
ICAgfQo+ID4gKyAgICAgICBwZGV2LT5kZXYuZ3JvdXBzID0gcG11X3NiaV9ncm91cHM7Cj4gPiAr
Cj4gPiAgICAgICAgIHJldCA9Cj4gPiBjcHVocF9zdGF0ZV9hZGRfaW5zdGFuY2UoQ1BVSFBfQVBf
UEVSRl9SSVNDVl9TVEFSVElORywgJnBtdS0+bm9kZSk7Cj4gPiBpZiAocmV0KSByZXR1cm4gcmV0
Owo+ID4gLS0KPiA+IDIuMzUuMQo+ID4gIAo+IAo+IAo+IC0tCj4gUmVnYXJkcywKPiBBdGlzaAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
