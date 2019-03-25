Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10923C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 15:25:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7989D20896
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 15:25:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eiauUUBz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="Gb0MkZXr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7989D20896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EJg9HUXbKgqO1bgc5RPs01+N1h9++yKyACfOqYvgdsA=; b=eiauUUBzTyfpDl4O8Psndu88L
	DXuqMqTawCNAkFKCoESm2uYzffgtYxxqg0LaoS+TsNCarn5zYGRXDe3cIdyIPz17TUyViGMTCqLCD
	zunhFThzW4mhqqAiBBaFcr1zxPSO8OoxoGKOhMJDVhLcFQn/eHZDU7jXp4YNRaH+uKmTg0oaw6dRE
	TFq5Dse2ep1urNb1V8J9fvdy3cw3XHw0MaeFKkH4X9k6dir8wzFavjWZIkJrlRliF7oXNjmFtulwt
	TJH0YPxfo0362juJtAc1sKNrn/kd/cBpweqiFmAAJ5tYJwxTtIz1AOdHbH2KafRZA9/67ZlQLHe3o
	tkl2GxDhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8RTt-00033D-2M; Mon, 25 Mar 2019 15:25:45 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8RTj-0002vy-4v; Mon, 25 Mar 2019 15:25:37 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44SdPD2xnBz9v0lr;
 Mon, 25 Mar 2019 16:25:20 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Gb0MkZXr; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id CrK4rxgSxrO3; Mon, 25 Mar 2019 16:25:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44SdPD1fbZz9tyDn;
 Mon, 25 Mar 2019 16:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1553527520; bh=JrL7MExoxenGmOAA8+6zfD5VS8gV08AijePqq6+rivY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Gb0MkZXr4cfDzR19n8lna6H+IPA5AH3vZL1jNvOtCev91KCVbckg3/MYHKcjqkio5
 h3ZxOQHblb9nHvTSJ7+rGRyQcDlyWn4FJ8MQkFBX2AdS6cvQu/8kr1/7uriihL47lA
 Q8KeTVo/1kkW9DTDs2sH3feGWWW85xlVR3ifVPe8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 464268B8AB;
 Mon, 25 Mar 2019 16:25:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PjtKP9S86Vzq; Mon, 25 Mar 2019 16:25:25 +0100 (CET)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.2])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DA4758B74F;
 Mon, 25 Mar 2019 16:25:24 +0100 (CET)
Subject: Re: [PATCH v5 3/3] locking/rwsem: Optimize down_read_trylock()
To: Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will.deacon@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20190322143008.21313-1-longman@redhat.com>
 <20190322143008.21313-4-longman@redhat.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <014279a5-8998-8e03-adb3-c3d611dff171@c-s.fr>
Date: Mon, 25 Mar 2019 16:25:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190322143008.21313-4-longman@redhat.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_082535_502312_5688C77E 
X-CRM114-Status: GOOD (  22.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Davidlohr Bueso <dave@stgolabs.net>, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Tim Chen <tim.c.chen@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpDb3VsZCB5b3Ugc2hhcmUgdGhlIG1pY3JvYmVuY2htYXJrIHlvdSBhcmUgdXNpbmcgPwoK
SSdkIGxpa2UgdG8gdGVzdCB0aGUgc2VyaWVzIG9uIHBvd2VycGMuCgpUaGFua3MKQ2hyaXN0b3Bo
ZQoKTGUgMjIvMDMvMjAxOSDDoCAxNTozMCwgV2FpbWFuIExvbmcgYSDDqWNyaXTCoDoKPiBNb2Rp
ZnkgX19kb3duX3JlYWRfdHJ5bG9jaygpIHRvIG9wdGltaXplIGZvciBhbiB1bmxvY2tlZCByd3Nl
bSBhbmQgbWFrZQo+IGl0IGdlbmVyYXRlIHNsaWdodGx5IGJldHRlciBjb2RlLgo+IAo+IEJlZm9y
ZSB0aGlzIHBhdGNoLCBkb3duX3JlYWRfdHJ5bG9jazoKPiAKPiAgICAgMHgwMDAwMDAwMDAwMDAw
MDAwIDwrMD46ICAgICBjYWxscSAgMHg1IDxkb3duX3JlYWRfdHJ5bG9jays1Pgo+ICAgICAweDAw
MDAwMDAwMDAwMDAwMDUgPCs1PjogICAgIGptcCAgICAweDE4IDxkb3duX3JlYWRfdHJ5bG9jaysy
ND4KPiAgICAgMHgwMDAwMDAwMDAwMDAwMDA3IDwrNz46ICAgICBsZWEgICAgMHgxKCVyZHgpLCVy
Y3gKPiAgICAgMHgwMDAwMDAwMDAwMDAwMDBiIDwrMTE+OiAgICBtb3YgICAgJXJkeCwlcmF4Cj4g
ICAgIDB4MDAwMDAwMDAwMDAwMDAwZSA8KzE0PjogICAgbG9jayBjbXB4Y2hnICVyY3gsKCVyZGkp
Cj4gICAgIDB4MDAwMDAwMDAwMDAwMDAxMyA8KzE5PjogICAgY21wICAgICVyYXgsJXJkeAo+ICAg
ICAweDAwMDAwMDAwMDAwMDAwMTYgPCsyMj46ICAgIGplICAgICAweDIzIDxkb3duX3JlYWRfdHJ5
bG9jayszNT4KPiAgICAgMHgwMDAwMDAwMDAwMDAwMDE4IDwrMjQ+OiAgICBtb3YgICAgKCVyZGkp
LCVyZHgKPiAgICAgMHgwMDAwMDAwMDAwMDAwMDFiIDwrMjc+OiAgICB0ZXN0ICAgJXJkeCwlcmR4
Cj4gICAgIDB4MDAwMDAwMDAwMDAwMDAxZSA8KzMwPjogICAgam5zICAgIDB4NyA8ZG93bl9yZWFk
X3RyeWxvY2srNz4KPiAgICAgMHgwMDAwMDAwMDAwMDAwMDIwIDwrMzI+OiAgICB4b3IgICAgJWVh
eCwlZWF4Cj4gICAgIDB4MDAwMDAwMDAwMDAwMDAyMiA8KzM0PjogICAgcmV0cQo+ICAgICAweDAw
MDAwMDAwMDAwMDAwMjMgPCszNT46ICAgIG1vdiAgICAlZ3M6MHgwLCVyYXgKPiAgICAgMHgwMDAw
MDAwMDAwMDAwMDJjIDwrNDQ+OiAgICBvciAgICAgJDB4MywlcmF4Cj4gICAgIDB4MDAwMDAwMDAw
MDAwMDAzMCA8KzQ4PjogICAgbW92ICAgICVyYXgsMHgyMCglcmRpKQo+ICAgICAweDAwMDAwMDAw
MDAwMDAwMzQgPCs1Mj46ICAgIG1vdiAgICAkMHgxLCVlYXgKPiAgICAgMHgwMDAwMDAwMDAwMDAw
MDM5IDwrNTc+OiAgICByZXRxCj4gCj4gQWZ0ZXIgcGF0Y2gsIGRvd25fcmVhZF90cnlsb2NrOgo+
IAo+ICAgICAweDAwMDAwMDAwMDAwMDAwMDAgPCswPjoJY2FsbHEgIDB4NSA8ZG93bl9yZWFkX3Ry
eWxvY2srNT4KPiAgICAgMHgwMDAwMDAwMDAwMDAwMDA1IDwrNT46CXhvciAgICAlZWF4LCVlYXgK
PiAgICAgMHgwMDAwMDAwMDAwMDAwMDA3IDwrNz46CWxlYSAgICAweDEoJXJheCksJXJkeAo+ICAg
ICAweDAwMDAwMDAwMDAwMDAwMGIgPCsxMT46CWxvY2sgY21weGNoZyAlcmR4LCglcmRpKQo+ICAg
ICAweDAwMDAwMDAwMDAwMDAwMTAgPCsxNj46CWpuZSAgICAweDI5IDxkb3duX3JlYWRfdHJ5bG9j
ays0MT4KPiAgICAgMHgwMDAwMDAwMDAwMDAwMDEyIDwrMTg+Ogltb3YgICAgJWdzOjB4MCwlcmF4
Cj4gICAgIDB4MDAwMDAwMDAwMDAwMDAxYiA8KzI3PjoJb3IgICAgICQweDMsJXJheAo+ICAgICAw
eDAwMDAwMDAwMDAwMDAwMWYgPCszMT46CW1vdiAgICAlcmF4LDB4MjAoJXJkaSkKPiAgICAgMHgw
MDAwMDAwMDAwMDAwMDIzIDwrMzU+Ogltb3YgICAgJDB4MSwlZWF4Cj4gICAgIDB4MDAwMDAwMDAw
MDAwMDAyOCA8KzQwPjoJcmV0cQo+ICAgICAweDAwMDAwMDAwMDAwMDAwMjkgPCs0MT46CXRlc3Qg
ICAlcmF4LCVyYXgKPiAgICAgMHgwMDAwMDAwMDAwMDAwMDJjIDwrNDQ+OglqbnMgICAgMHg3IDxk
b3duX3JlYWRfdHJ5bG9jays3Pgo+ICAgICAweDAwMDAwMDAwMDAwMDAwMmUgPCs0Nj46CXhvciAg
ICAlZWF4LCVlYXgKPiAgICAgMHgwMDAwMDAwMDAwMDAwMDMwIDwrNDg+OglyZXRxCj4gCj4gQnkg
dXNpbmcgYSByd3NlbSBtaWNyb2JlbmNobWFyaywgdGhlIGRvd25fcmVhZF90cnlsb2NrKCkgcmF0
ZSAod2l0aCBhCj4gbG9hZCBvZiAxMCB0byBsZW5ndGhlbiB0aGUgbG9jayBjcml0aWNhbCBzZWN0
aW9uKSBvbiBhIHg4Ni02NCBzeXN0ZW0KPiBiZWZvcmUgYW5kIGFmdGVyIHRoZSBwYXRjaCB3ZXJl
Ogo+IAo+ICAgICAgICAgICAgICAgICAgIEJlZm9yZSBQYXRjaCAgICBBZnRlciBQYXRjaAo+ICAg
ICAjIG9mIFRocmVhZHMgICAgIHJsb2NrICAgICAgICAgICBybG9jawo+ICAgICAtLS0tLS0tLS0t
LS0gICAgIC0tLS0tICAgICAgICAgICAtLS0tLQo+ICAgICAgICAgIDEgICAgICAgICAgIDE0LDQ5
NiAgICAgICAgICAxNCw3MTYKPiAgICAgICAgICAyICAgICAgICAgICAgOCw2NDQgICAgICAgICAg
IDgsNDUzCj4gCTQgICAgICAgICAgICA2LDc5OSAgICAgICAgICAgNiw5ODMKPiAJOCAgICAgICAg
ICAgIDUsNjY0ICAgICAgICAgICA3LDE5MAo+IAo+IE9uIGEgQVJNNjQgc3lzdGVtLCB0aGUgcGVy
Zm9ybWFuY2UgcmVzdWx0cyB3ZXJlOgo+IAo+ICAgICAgICAgICAgICAgICAgIEJlZm9yZSBQYXRj
aCAgICBBZnRlciBQYXRjaAo+ICAgICAjIG9mIFRocmVhZHMgICAgIHJsb2NrICAgICAgICAgICBy
bG9jawo+ICAgICAtLS0tLS0tLS0tLS0gICAgIC0tLS0tICAgICAgICAgICAtLS0tLQo+ICAgICAg
ICAgIDEgICAgICAgICAgIDIzLDY3NiAgICAgICAgICAyNCw0ODgKPiAgICAgICAgICAyICAgICAg
ICAgICAgNyw2OTcgICAgICAgICAgIDksNTAyCj4gICAgICAgICAgNCAgICAgICAgICAgIDQsOTQ1
ICAgICAgICAgICAzLDQ0MAo+ICAgICAgICAgIDggICAgICAgICAgICAyLDY0MSAgICAgICAgICAg
MSw2MDMKPiAKPiBGb3IgdGhlIHVuY29udGVuZGVkIGNhc2UgKDEgdGhyZWFkKSwgdGhlIG5ldyBk
b3duX3JlYWRfdHJ5bG9jaygpIGlzIGEKPiBsaXR0bGUgYml0IGZhc3Rlci4gRm9yIHRoZSBjb250
ZW5kZWQgY2FzZXMsIHRoZSBuZXcgZG93bl9yZWFkX3RyeWxvY2soKQo+IHBlcmZvcm0gcHJldHR5
IHdlbGwgaW4geDg2LTY0LCBidXQgcGVyZm9ybWFuY2UgZGVncmFkZXMgYXQgaGlnaAo+IGNvbnRl
bnRpb24gbGV2ZWwgb24gQVJNNjQuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBMaW51cyBUb3J2YWxkcyA8
dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogV2FpbWFuIExv
bmcgPGxvbmdtYW5AcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGtlcm5lbC9sb2NraW5nL3J3c2VtLmgg
fCAxMyArKysrKysrKy0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9rZXJuZWwvbG9ja2luZy9yd3NlbS5oIGIv
a2VybmVsL2xvY2tpbmcvcndzZW0uaAo+IGluZGV4IDQ1ZWUwMDIzNmUwMy4uMWY1Nzc1YWE2YTFk
IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9sb2NraW5nL3J3c2VtLmgKPiArKysgYi9rZXJuZWwvbG9j
a2luZy9yd3NlbS5oCj4gQEAgLTE3NCwxNCArMTc0LDE3IEBAIHN0YXRpYyBpbmxpbmUgaW50IF9f
ZG93bl9yZWFkX2tpbGxhYmxlKHN0cnVjdCByd19zZW1hcGhvcmUgKnNlbSkKPiAgIAo+ICAgc3Rh
dGljIGlubGluZSBpbnQgX19kb3duX3JlYWRfdHJ5bG9jayhzdHJ1Y3Qgcndfc2VtYXBob3JlICpz
ZW0pCj4gICB7Cj4gLQlsb25nIHRtcDsKPiArCS8qCj4gKwkgKiBPcHRpbWl6ZSBmb3IgdGhlIGNh
c2Ugd2hlbiB0aGUgcndzZW0gaXMgbm90IGxvY2tlZCBhdCBhbGwuCj4gKwkgKi8KPiArCWxvbmcg
dG1wID0gUldTRU1fVU5MT0NLRURfVkFMVUU7Cj4gICAKPiAtCXdoaWxlICgodG1wID0gYXRvbWlj
X2xvbmdfcmVhZCgmc2VtLT5jb3VudCkpID49IDApIHsKPiAtCQlpZiAodG1wID09IGF0b21pY19s
b25nX2NtcHhjaGdfYWNxdWlyZSgmc2VtLT5jb3VudCwgdG1wLAo+IC0JCQkJICAgdG1wICsgUldT
RU1fQUNUSVZFX1JFQURfQklBUykpIHsKPiArCWRvIHsKPiArCQlpZiAoYXRvbWljX2xvbmdfdHJ5
X2NtcHhjaGdfYWNxdWlyZSgmc2VtLT5jb3VudCwgJnRtcCwKPiArCQkJCQl0bXAgKyBSV1NFTV9B
Q1RJVkVfUkVBRF9CSUFTKSkgewo+ICAgCQkJcmV0dXJuIDE7Cj4gICAJCX0KPiAtCX0KPiArCX0g
d2hpbGUgKHRtcCA+PSAwKTsKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
