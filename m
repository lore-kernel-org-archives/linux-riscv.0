Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFCBC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 10:11:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4E161182
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 10:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4E161182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V91zYr9rXH++T9x8XmVH6Lf3CEyTIqvbPO615AWoqtE=; b=gGOfG0YCAQBT3YjUXzykh8uIb
	cIIbPZFac3OELZPemjG2NsL59Dzv8M1l3Kp/gaRtvVQb0YLGn6ee5Qjyet5WPwe8bPx3z8TlYV9+I
	mevQuzLNnNByS9rq20kOcaTeHLKFRT2F36FeYHjqZQV7pI9Fi7lZvCIvE+H77op/8FGN6ptlNDH6l
	mC5pvX+lgSvtcxMN/byouFEx6Y4Xkde5ktJptVinyeh+Mj2aOf3FZotCjeYeZ6nlKhw7xjFS4awF9
	Ok1DgmxNw6ZZMzc25c3ENDpKhgeAPld5djVxIyzY7QQOQpamaI20jbricXTBBZVZTh/7QBzBvWGmc
	A0fOT8daA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUo73-000N2L-GV; Fri, 09 Apr 2021 10:11:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUo6z-000N29-Ur
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 10:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=rUbzlJ0Jb0i3czLsFRU9XIzU5doYvMepKApjJgQSzaw=; b=YcWJ3P/LBMDjirMn4r/tnJ2xOL
 s53jq8CuO2a1KiX1vHlHUqiXfQIDvNtce2U3A0ChJRTS0Ts8VBaMf2LQ6T5Vp9PzYSiJQUVyEMXYr
 A8yj4lXBDXnI1Jt5zICjqLKHejKdAG1yU/yeg9y8lBIBeGpT52cdhr5qywc5W6yXJ5YRFOLpQAXms
 THHQNKW2GTHAk2cE9oyz+8hC2tx1/UH0iRwqU5YHv6ZNPttTr+DhC/6iEl1HBqMKP90Ng+Cl3ii3L
 qfynCawmXWBD5j+V2eV6iFmbdGYwZ0XFjxo3oP8uBz0wQhNkLdNyVvRMKbBAa/yPd1o8bQUlEu/0O
 w3EWunSw==;
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUo6w-004EH5-Un
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 10:11:36 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 139ABXVH022005
 for <linux-riscv@lists.infradead.org>; Fri, 9 Apr 2021 13:11:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1617963088; x=1620555088;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QFV5gLACFlf4gevkP93SS+cgfDbAfoayGgtdPXRAXUE=;
 b=GzrHi45RpDzuDPwwWgvAMn9JV4upmtq6ntwEaN+FRE8uvHx93Qu6lIU7fMqGgIA9
 TmKBInCvcL0jMpsh3wRT3bmxNTp3/zqjSAdqCzFano6bssRQXdwV+Ad+ijkES0my
 bMDnPagm/ZvSK2LmaawDCdRQB+PtC8ZL/wbEHlk1froJchVShdMwJKAZFKwDd9Y+
 XmW3oVS8uZe+vKgRQm9CNmRzJrTENTTHjcAghnpCYQIAyJxDitH3RH1DUOPKmBeE
 oeFVg8QKcIQJHYHhiAxeiFitbHqpjp4+VWG1m0yknzMAZYGKoWZATJrdKmgL0oea
 S6Wt5CXgpDt3E0P7TC4F4Q==;
X-AuditID: 8b5b014d-a70347000000209f-39-6070284fe5d0
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 AA.10.08351.F4820706; Fri,  9 Apr 2021 13:11:28 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 09 Apr 2021 13:11:27 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv
 <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] RISC-V: Improve init_resources
Organization: FORTH
In-Reply-To: <CAMuHMdWnRFuzSzSMCgBtNwxtq+itQ+iuX+i7nu5RD1E1W1FW-g@mail.gmail.com>
References: <20210405085712.1953848-1-mick@ics.forth.gr>
 <20210405085712.1953848-4-mick@ics.forth.gr>
 <CAMuHMdWi+wo0+PCR6B1wyXVesG-kL9NQt8XFBuWhZ3SdVUaLZg@mail.gmail.com>
 <5a09d1f0ded4581c9e7458f546db9329@mailhost.ics.forth.gr>
 <CAMuHMdWnRFuzSzSMCgBtNwxtq+itQ+iuX+i7nu5RD1E1W1FW-g@mail.gmail.com>
Message-ID: <f17d8d4de8f11b9a914e1b413460a756@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsXSHT1dWTdAoyDB4N8KFotnt/YyWVzeNYfN
 YtvnFjaL5nfn2C1eXu5htmibxe/A5vHm5UsWj4ebLjF5HDrcweixeUm9x6Xm6+wenzfJBbBF
 cdmkpOZklqUW6dslcGX8797HVnBQuuLagWXMDYxLRbsYOTkkBEwkDjfeZu9i5OIQEjjKKLFw
 XxsTRMJUYvbeTkYQm1dAUOLkzCcsIDazgIXE1Cv7GSFseYnmrbOZQWwWAVWJpjPzwGrYBDQl
 5l86CGRzcIgI6ErM+ckEMp9ZoJNJ4sf6TWC9wgJWEhNm/gPbxS8gLPHp7kVWEJtTIFDi1+vl
 zBAHbWCS+Lq7ix3iCBeJ2X2vmSGOU5H48PsBO8gCUSB781ylCYyCs5CcOgvJqbOQnLqAkXkV
 o0BimbFeZnKxXlp+UUmGXnrRJkZwuDP67mC8vfmt3iFGJg7GQ4wSHMxKIrzNzfkJQrwpiZVV
 qUX58UWlOanFhxilOViUxHl59SbECwmkJ5akZqemFqQWwWSZODilGpgsatO4Z/iysCnmZdfL
 rxI1OKO4escvqfyrhvMUjZjE/qccV48vCzh+oeXvi4XNLWaCO73PZ5qnrcw0mcAd6Mb0/s7C
 Hw89ZR71PVgTwrE1/L9j3N4zpg/nnjl0+Y7w/6pyi2lxbx2FL1yY9+T9J6bNPuxGZfFmu8wn
 B6zaxM714mSkgsSKHdG5KTsvX9pX+f6Xi3vSqtsTNi6oXt7xIGifzYXJzLPCzHz2h9Qc13Kx
 C/kZrxG5ZB7T5Dm/xXLe5l24Jvroz+PfRg9eiEcE5HjsKA96zHO2Te7ypxknGX8IJs6blGPY
 VbK68nTZ1jupwoXHfva+dVLbcvU1r/b0pdN2qp59YBIV8eMzz7u4k5z/lFiKMxINtZiLihMB
 71MmyeYCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_031135_399414_06305934 
X-CRM114-Status: GOOD (  22.50  )
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

zqPPhM65z4IgMjAyMS0wNC0wNiAxMToyMiwgR2VlcnQgVXl0dGVyaG9ldmVuIM6tzrPPgc6xz4jO
tToKPiBIaSBOaWNrLAo+IAo+IE9uIFR1ZSwgQXByIDYsIDIwMjEgYXQgMTA6MTEgQU0gTmljayBL
b3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4gCj4gd3JvdGU6Cj4+IEhlbGxvIEdlZXJ0LAo+
PiDOo8+EzrnPgiAyMDIxLTA0LTA2IDEwOjE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gzq3Os8+BzrHP
iM61Ogo+PiA+IE9uIE1vbiwgQXByIDUsIDIwMjEgYXQgMTA6NTcgQU0gTmljayBLb3NzaWZpZGlz
IDxtaWNrQGljcy5mb3J0aC5ncj4KPj4gPiB3cm90ZToKPj4gPj4gKiBLZXJuZWwgcmVnaW9uIGlz
IGFsd2F5cyBwcmVzZW50IGFuZCB3ZSBrbm93IHdoZXJlIGl0IGlzLCBubwo+PiA+PiBuZWVkIHRv
IGxvb2sgZm9yIGl0IGluc2lkZSB0aGUgbG9vcCwganVzdCBpZ25vcmUgaXQgbGlrZSB0aGUKPj4g
Pj4gcmVzdCBvZiB0aGUgcmVzZXJ2ZWQgcmVnaW9ucyB3aXRoaW4gc3lzdGVtJ3MgbWVtb3J5Lgo+
PiA+Pgo+PiA+PiAqIERvbid0IGNhbGwgbWVtYmxvY2tfZnJlZSBpbnNpZGUgdGhlIGxvb3AsIGlm
IGNhbGxlZCBpdCdsbCBzcGxpdAo+PiA+PiB0aGUgcmVnaW9uIG9mIHByZS1hbGxvY2F0ZWQgcmVz
b3VyY2VzIGluIHR3byBwYXJ0cywgbWVzc2luZyB0aGluZ3MKPj4gPj4gdXAsIGp1c3QgcmUtdXNl
IHRoZSBwcmV2aW91cyBwcmUtYWxsb2NhdGVkIHJlc291cmNlIGFuZCBmcmVlIGFueQo+PiA+PiB1
bnVzZWQgcmVzb3VyY2VzIGFmdGVyIGJvdGggbG9vcHMgZmluaXNoLgo+PiA+Pgo+PiA+PiAqIG1l
bWJsb2NrX2FsbG9jIG1heSBhZGQgYSByZWdpb24gd2hlbiBjYWxsZWQsIHNvIGluY3JlYXNlIHRo
ZQo+PiA+PiBudW1iZXIgb2YgcHJlLWFsbG9jYXRlZCByZWdpb25zIGJ5IG9uZSB0byBiZSBvbiB0
aGUgc2FmZSBzaWRlCj4+ID4+IChyZXBvcnRlZCBhbmQgcGF0Y2hlZCBieSBHZWVydCBVeXR0ZXJo
b2V2ZW4pCj4+ID4+Cj4+ID4+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+Cj4+ID4KPj4gPiBXaGVyZSBkb2VzIHRoaXMgU29CIGNvbWUgZnJv
bT8KPj4gPgo+PiA+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZv
cnRoLmdyPgo+PiA+Cj4+ID4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPj4gPj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+PiA+Cj4+ID4+IEBAIC0xMjksNTMgKzEz
OSw0MiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9yZXNvdXJjZXModm9pZCkKPj4gPj4gICAg
ICAgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlcyA9IE5VTEw7Cj4+ID4+ICAgICAgICAgc3RydWN0IHJl
c291cmNlICptZW1fcmVzID0gTlVMTDsKPj4gPj4gICAgICAgICBzaXplX3QgbWVtX3Jlc19zeiA9
IDA7Cj4+ID4+IC0gICAgICAgaW50IHJldCA9IDAsIGkgPSAwOwo+PiA+PiAtCj4+ID4+IC0gICAg
ICAgY29kZV9yZXMuc3RhcnQgPSBfX3BhX3N5bWJvbChfdGV4dCk7Cj4+ID4+IC0gICAgICAgY29k
ZV9yZXMuZW5kID0gX19wYV9zeW1ib2woX2V0ZXh0KSAtIDE7Cj4+ID4+IC0gICAgICAgY29kZV9y
ZXMuZmxhZ3MgPSBJT1JFU09VUkNFX1NZU1RFTV9SQU0gfCBJT1JFU09VUkNFX0JVU1k7Cj4+ID4+
IC0KPj4gPj4gLSAgICAgICByb2RhdGFfcmVzLnN0YXJ0ID0gX19wYV9zeW1ib2woX19zdGFydF9y
b2RhdGEpOwo+PiA+PiAtICAgICAgIHJvZGF0YV9yZXMuZW5kID0gX19wYV9zeW1ib2woX19lbmRf
cm9kYXRhKSAtIDE7Cj4+ID4+IC0gICAgICAgcm9kYXRhX3Jlcy5mbGFncyA9IElPUkVTT1VSQ0Vf
U1lTVEVNX1JBTSB8IElPUkVTT1VSQ0VfQlVTWTsKPj4gPj4gLQo+PiA+PiAtICAgICAgIGRhdGFf
cmVzLnN0YXJ0ID0gX19wYV9zeW1ib2woX2RhdGEpOwo+PiA+PiAtICAgICAgIGRhdGFfcmVzLmVu
ZCA9IF9fcGFfc3ltYm9sKF9lZGF0YSkgLSAxOwo+PiA+PiAtICAgICAgIGRhdGFfcmVzLmZsYWdz
ID0gSU9SRVNPVVJDRV9TWVNURU1fUkFNIHwgSU9SRVNPVVJDRV9CVVNZOwo+PiA+PiArICAgICAg
IGludCBudW1fcmVzb3VyY2VzID0gMCwgcmVzX2lkeCA9IDA7Cj4+ID4+ICsgICAgICAgaW50IHJl
dCA9IDA7Cj4+ID4+Cj4+ID4+IC0gICAgICAgYnNzX3Jlcy5zdGFydCA9IF9fcGFfc3ltYm9sKF9f
YnNzX3N0YXJ0KTsKPj4gPj4gLSAgICAgICBic3NfcmVzLmVuZCA9IF9fcGFfc3ltYm9sKF9fYnNz
X3N0b3ApIC0gMTsKPj4gPj4gLSAgICAgICBic3NfcmVzLmZsYWdzID0gSU9SRVNPVVJDRV9TWVNU
RU1fUkFNIHwgSU9SRVNPVVJDRV9CVVNZOwo+PiA+PiArICAgICAgIC8qICsgMSBhcyBtZW1ibG9j
a19hbGxvYygpIG1pZ2h0IGluY3JlYXNlCj4+ID4+IG1lbWJsb2NrLnJlc2VydmVkLmNudCAqLwo+
PiA+PiArICAgICAgIG51bV9yZXNvdXJjZXMgPSBtZW1ibG9jay5tZW1vcnkuY250ICsgbWVtYmxv
Y2sucmVzZXJ2ZWQuY250ICsKPj4gPj4gMTsKPj4gPj4gKyAgICAgICByZXNfaWR4ID0gbnVtX3Jl
c291cmNlcyAtIDE7Cj4+ID4+Cj4+ID4+IC0gICAgICAgbWVtX3Jlc19zeiA9IChtZW1ibG9jay5t
ZW1vcnkuY250ICsgbWVtYmxvY2sucmVzZXJ2ZWQuY250KSAqCj4+ID4+IHNpemVvZigqbWVtX3Jl
cyk7Cj4+ID4KPj4gPiBPaCwgeW91IGluY29ycG9yYXRlZCBteSBjb21taXQgY2U5ODlmMTQ3MmFl
MzUwZSAoIlJJU0MtVjogRml4Cj4+ID4gb3V0LW9mLWJvdW5kcwo+PiA+IGFjY2Vzc2VzIGluIGlu
aXRfcmVzb3VyY2VzKCkiKSAoZnJvbSB2NS4xMi1yYzQpIGludG8geW91ciBwYXRjaC4KPj4gPiBX
aHk/IFRoaXMgbWVhbnMgeW91ciBwYXRjaCBkb2VzIG5vdCBhcHBseSBhZ2FpbnN0IHVwc3RyZWFt
Lgo+PiA+Cj4+IAo+PiBTb3JyeSBpZiB0aGlzIGxvb2tzIGF3a3dhcmQsIEknbSB1bmRlciB0aGUg
aW1wcmVzc2lvbiB0aGF0IG5ldyAKPj4gZmVhdHVyZXMKPj4gZ28gb24gZm9yLW5leHQgaW5zdGVh
ZCBvZiBmaXhlcyBhbmQgeW91ciBwYXRjaCBoYXNuJ3QgYmVlbiBtZXJnZWQgb24KPj4gZm9yLW5l
eHQgeWV0LiBJIHRob3VnaHQgaXQgd291bGQgYmUgY2xlYW5lciB0byBoYXZlIG9uZSBwYXRjaCB0
byBtZXJnZQo+PiBmb3IgaW5pdF9yZXNvdXJjZXMgaW5zdGVhZCBvZiB0d28sIGFuZCBzaW1wbGVy
IGZvciBwZW9wbGUgdG8gdGVzdCB0aGUKPj4gc2VyaWVzLiBJIGNhbiByZWJhc2UgdGhpcyBvbiB0
b3Agb2YgZml4ZXMgaWYgdGhhdCB3b3JrcyBiZXR0ZXIgZm9yIHlvdQo+PiBvciBQYWxtZXIuCj4g
Cj4gSWRlYWxseSB0aGUgZml4ZXMgYnJhbmNoIGlzIHBhcnQgb2YgdGhlIG5leHQgYnJhbmNoLiAg
VGhhdCBhbHNvIGhlbHBzCj4gdG8gYXZvaWQgb3RoZXIgcGVvcGxlIGhhdmluZyB0byBmaXggY29u
ZmxpY3RzIHdoZW4gbWVyZ2luZyBib3RoLgo+IAoKT0sgSSdsbCByZS1iYXNlIHRoaXMgb24gdG9w
IG9mIGZpeGVzIGluc3RlYWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
