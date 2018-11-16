Return-Path: <SRS0=ssm3=N3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA88C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 17:15:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16B5020811
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 17:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fnzkym9N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L/y2lsMN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16B5020811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8TBs6LuwLgseNnEZDCKtjj/2Nsr/xZJwSkq11y4fItA=; b=Fnzkym9NXv8EDRI8F8oCJbue6
	mZsGU1ASuL8zJWVaXdGYr155wjPeKBQEnzKOS3vvvRQpxlTewVoPs/y5ePripnD6rzzl5gBS8KJJw
	6UW9ddf1dHtwTlu4oMqb4RD433mzAe4qUubSZJfI2TQpOIfxnSR6ThhLREcbhQ/RQJEgjmT9frTAb
	v+Z753zU0IzWKslMU4bATpSYroPfftdXbhd1B3xbs+ayxAfhIvc/q1ygrbsnRVD3ffuquOKwDidCt
	08K1PTH2cuU90C1gemwYD68VYd/ao0LuenPZ7CZIcPR1GSt3N7MIoDk/m5hoLTPKqBwEsVWNGnNK4
	uwf7JwIvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNhic-0007i2-GC
	for infradead-linux-riscv@archiver.kernel.org; Fri, 16 Nov 2018 17:15:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNhib-0007hv-7O
 for linux-riscv@bombadil.infradead.org; Fri, 16 Nov 2018 17:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aN8nbPvGWrkzVhYw6FYmBb8E4TPaL77B2g44t1TQigQ=; b=L/y2lsMN9DSswNVy+a+u/8vWPw
 r1mnu61vvMANQnkYcxdL9svotyyr12Zv8iod+Thnm44HBKwnbBI1Po6jKcNU7Zg/20sfQ3evqkfII
 yJ+4MYJpIjHYrbCnT5FvwSSBZMZRYRzK3tKRG2l4melbswWg1qxVowwmeyAOzOlUSKbD047IjSY+5
 8xqZ/Egk5TSzlG8PeX3sapi4kfAfk7OY3Y3qowXQ+KlES/GACjG0tr0ZAe2+dJyAMeemgJNjsIXZ+
 Qvl9En2qV0O7SWLLUF6Rq/vcHtYsJG+VjG/nkDJ+kMeD7yLlFqDBmPT3uDGFWyRAp4T858M4pX28S
 jCdTdR/g==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNhiX-0004Qc-Rn
 for linux-riscv@lists.infradead.org; Fri, 16 Nov 2018 17:15:43 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAGHE4Ws097010; Fri, 16 Nov 2018 19:14:06 +0200 (EET)
X-AuditID: 8b5b9d4d-903ff70000000e62-7b-5beefadced44
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 88.64.03682.CDAFEEB5; Fri, 16 Nov 2018 19:14:04 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wAGHE4eh014178; Fri, 16 Nov 2018 19:14:04 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 16 Nov 2018 19:14:04 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
Organization: FORTH
In-Reply-To: <86b0b7bc82f6f9b55cfdc7281f4941db@mailhost.ics.forth.gr>
References: <mhng-314e946b-3b14-467c-ad23-85983b75cd8d@palmer-si-x1c4>
 <86b0b7bc82f6f9b55cfdc7281f4941db@mailhost.ics.forth.gr>
Message-ID: <c5493cd7f7f3df0269c8a7d6d33ba199@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRmVeSWpSXmKPExsXSHc2orHvn17togz0/dS22/p7FbrHtcwub
 RfO7c+wWmycsYHVg8Tjc8YXd4+GmS0wem5fUe1xqvs4ewBLFZZOSmpNZllqkb5fAldG39yxb
 wXvtilOHJRoYjyt0MXJySAiYSPz68psFxBYSOMIo8e5YeBcjF5B9iFHi7qyzTBBFphKz93Yy
 gti8AoISJ2c+AWtgFrCQmHplPyOELS/RvHU2M4jNIqAqse//NrA4m4CmxPxLB8HqRQTUJTqf
 vwGKcwDVp0s0TZADCQsLuEi8fHyFDcTmFxCW+HT3IiuIzSngKtE4ZTYrxD2NjBIfvq9hgrjB
 RaJp9yZ2iNtUJD78fgBmiwooS7w4MZ11AqPQLCSnzkJy6iwkpy5gZF7FKJBYZqyXmVysl5Zf
 VJKhl160iREc4HN9dzCeW2B/iFGAg1GJh7fi0btoIdbEsuLKXGDAcDArifD+eAEU4k1JrKxK
 LcqPLyrNSS0+xCjNwaIkznv4RXiQkEB6YklqdmpqQWoRTJaJg1OqgXHGiWkNkrXts1j2Sq/i
 uts2x9dIqKdc9MD8SbsaJvcuUjkmE2ERwjIh5OW0yHeOE/+fuLdEqfVi+KMJqhevmF9z9Y5i
 3XQn/V6QYKEM888Z04zLpBmFWPfvvDVBhlHIP063sVBp64mcS4lJ8jw/0+7fu91iJTXfRkcx
 52GxVn5Va+3kHzXXS5VYijMSDbWYi4oTAT4lS/1sAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181116_171542_094601_DD6BAAC3 
X-CRM114-Status: GOOD (  26.36  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181116171404.plgZ1c0twC3H0CoBYBRLqugCE9cRJdxA2k4jvgye7x0@z>

zqPPhM65z4IgMjAxOC0xMS0xNiAxOTowOCwgTmljayBLb3NzaWZpZGlzIM6tzrPPgc6xz4jOtToK
PiDOo8+EzrnPgiAyMDE4LTExLTE2IDE4OjUyLCBQYWxtZXIgRGFiYmVsdCDOrc6zz4HOsc+IzrU6
Cj4+IE9uIEZyaSwgMDkgTm92IDIwMTggMTc6MDI6NDQgUFNUICgtMDgwMCksIG1pY2tAaWNzLmZv
cnRoLmdyIHdyb3RlOgo+Pj4gQWRkIGEgbWVudSB0byBjaG9zZSBob3cgdGhlIGJ1aWx0LWluIGNv
bW1hbmQgbGluZSB3aWxsIGJlCj4+PiB1c2VkIGFuZCBhZGQgQ01ETElORV9FWFRFTkQgZm9yIGNv
bXBhdGliaWxpdHkgd2l0aCBGRFQgY29kZS4KPj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTogTmljayBL
b3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4KPj4+IC0tLQo+Pj4gIGFyY2gvcmlzY3YvS2Nv
bmZpZyB8IDQ1IAo+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygt
KQo+Pj4gCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9L
Y29uZmlnCj4+PiBpbmRleCA1NWRhOTNmNGU4MTguLjgxZjg4NDE2NGI1MiAxMDA2NDQKPj4+IC0t
LSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+PiBA
QCAtMjI3LDM5ICsyMjcsNDIgQEAgZW5kbWVudQo+Pj4gCj4+PiAgbWVudSAiQm9vdCBvcHRpb25z
Igo+Pj4gCj4+PiAtY29uZmlnIENNRExJTkVfQk9PTAo+Pj4gLQlib29sICJCdWlsdC1pbiBrZXJu
ZWwgY29tbWFuZCBsaW5lIgo+Pj4gK2NvbmZpZyBDTURMSU5FCj4+PiArCXN0cmluZyAiQnVpbHQt
aW4ga2VybmVsIGNvbW1hbmQgbGluZSIKPj4+ICAJaGVscAo+Pj4gIAkgIEZvciBtb3N0IHBsYXRm
b3JtcywgaXQgaXMgZmlybXdhcmUgb3Igc2Vjb25kIHN0YWdlIGJvb3Rsb2FkZXIKPj4+ICAJICB0
aGF0IGJ5IGRlZmF1bHQgc3BlY2lmaWVzIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIG9wdGlvbnMu
Cj4+PiAgCSAgSG93ZXZlciwgaXQgbWlnaHQgYmUgbmVjZXNzYXJ5IG9yIGFkdmFudGFnZW91cyB0
byBlaXRoZXIgb3ZlcnJpZGUKPj4+IC0JICB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBsaW5l
IG9yIGFkZCBhIGZldyBleHRyYSBvcHRpb25zIHRvIGl0Lgo+Pj4gLQkgIEZvciBzdWNoIGNhc2Vz
LCB0aGlzIG9wdGlvbiBhbGxvd3MgaGFyZGNvZGluZyBjb21tYW5kIGxpbmUgCj4+PiBvcHRpb25z
Cj4+PiAtCSAgZGlyZWN0bHkgaW50byB0aGUga2VybmVsLgo+Pj4gKwkgIHRoZSBwcm92aWRlZCBr
ZXJuZWwgY29tbWFuZCBsaW5lIG9yIGFkZCBhIGZldyBleHRyYSBvcHRpb25zIHRvIAo+Pj4gaXQu
Cj4+PiArCSAgRm9yIHN1Y2ggY2FzZXMsIGl0IGlzIHBvc3NpYmxlIHRvIGRlZmluZSBhIGJ1aWx0
LWluIGNvbW1hbmQgbGluZQo+Pj4gKwkgIGhlcmUgYW5kIGNob3NlIGhvdyB0aGUga2VybmVsIHNo
b3VsZCB1c2UgaXQgbGF0ZXIgb24uCj4+PiAKPj4+IC0JICBGb3IgdGhhdCwgY2hvb3NlICdZJyBo
ZXJlIGFuZCBmaWxsIGluIHRoZSBleHRyYSBib290IHBhcmFtZXRlcnMKPj4+IC0JICBpbiBDT05G
SUdfQ01ETElORS4KPj4+ICtjaG9pY2UKPj4+ICsJcHJvbXB0ICJCdWlsdC1pbiBjb21tYW5kIGxp
bmUgdXNhZ2UiIGlmIENNRExJTkUgIT0gIiIKPj4+ICsJZGVmYXVsdCBDTURMSU5FX0ZBTExCQUNL
Cj4+PiArCWhlbHAKPj4+ICsJICBDaG9zZSBob3cgdGhlIGtlcm5lbCB3aWxsIGhhbmRsZSB0aGUg
cHJvdmlkZWQgYnVpbHQtaW4gY29tbWFuZAo+Pj4gKwkgIGxpbmUuCj4+PiAKPj4+IC0JICBUaGUg
YnVpbHQtaW4gb3B0aW9ucyB3aWxsIGJlIGNvbmNhdGVuYXRlZCB0byB0aGUgZGVmYXVsdCBjb21t
YW5kCj4+PiAtCSAgbGluZSBpZiBDTURMSU5FX0ZPUkNFIGlzIHNldCB0byAnTicuIE90aGVyd2lz
ZSwgdGhlIGRlZmF1bHQKPj4+IC0JICBjb21tYW5kIGxpbmUgd2lsbCBiZSBpZ25vcmVkIGFuZCBy
ZXBsYWNlZCBieSB0aGUgYnVpbHQtaW4gc3RyaW5nLgo+Pj4gK2NvbmZpZyBDTURMSU5FX0ZBTExC
QUNLCj4+PiArCWJvb2wgIkZhbGxiYWNrIgo+Pj4gKwloZWxwCj4+PiArCSAgVXNlIHRoZSBidWls
dC1pbiBjb21tYW5kIGxpbmUgYXMgZmFsbGJhY2sgaW4gY2FzZSB3ZSBnZXQgbm90aGluZwo+Pj4g
KwkgIGZyb20gdGhlIGJvb3QgbG9hZGVyLgo+Pj4gCj4+PiAtY29uZmlnIENNRExJTkUKPj4+IC0J
c3RyaW5nICJCdWlsdC1pbiBrZXJuZWwgY29tbWFuZCBzdHJpbmciCj4+PiAtCWRlcGVuZHMgb24g
Q01ETElORV9CT09MCj4+PiAtCWRlZmF1bHQgIiIKPj4+ICtjb25maWcgQ01ETElORV9FWFRFTkQK
Pj4+ICsJYm9vbCAiRXh0ZW5zaW9uIgo+Pj4gIAloZWxwCj4+PiAtCSAgU3VwcGx5IGNvbW1hbmQt
bGluZSBvcHRpb25zIGF0IGJ1aWxkIHRpbWUgYnkgZW50ZXJpbmcgdGhlbSBoZXJlLgo+Pj4gKwkg
IFVzZSB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lIGFzIGFuIGV4dGVuc2lvbiBvZiB0aGUgY29t
bWFuZCBsaW5lCj4+PiArCSAgcHJvdmlkZWQgYnkgdGhlIGJvb3QgbG9hZGVyLgo+Pj4gCj4+PiAg
Y29uZmlnIENNRExJTkVfRk9SQ0UKPj4+IC0JYm9vbCAiQnVpbHQtaW4gY29tbWFuZCBsaW5lIG92
ZXJyaWRlcyBib290bG9hZGVyIGFyZ3VtZW50cyIKPj4+IC0JZGVwZW5kcyBvbiBDTURMSU5FX0JP
T0wKPj4+ICsJYm9vbCAiRm9yY2VkIgo+Pj4gIAloZWxwCj4+PiAtCSAgU2V0IHRoaXMgb3B0aW9u
IHRvICdZJyB0byBoYXZlIHRoZSBrZXJuZWwgaWdub3JlIHRoZSBib290bG9hZGVyCj4+PiAtCSAg
b3IgZmlybXdhcmUgY29tbWFuZCBsaW5lLiAgSW5zdGVhZCwgdGhlIGJ1aWx0LWluIGNvbW1hbmQg
bGluZQo+Pj4gLQkgIHdpbGwgYmUgdXNlZCBleGNsdXNpdmVseS4KPj4+ICsJICBVc2UgdGhlIGJ1
aWx0LWluIGNvbW1hbmQgbGluZSBpbiBwbGFjZSBvZiB0aGUgY29tbWFuZCBsaW5lCj4+PiArCSAg
cHJvdmlkZWQgYnkgdGhlIGJvb3QgbG9hZGVyLgo+Pj4gCj4+PiAtCSAgSWYgeW91IGRvbid0IGtu
b3cgd2hhdCB0byBkbyBoZXJlLCBzYXkgTi4KPj4+ICtlbmRjaG9pY2UKPj4+IAo+Pj4gIGVuZG1l
bnUKPj4gCj4+IEl0IGxvb2tzIGxpa2UgdGhpcyBpcyBmdW5jdGlvbmFsbHkgZXF1aXZhbGVudCB0
byB3aGF0IEFSTSBoYXMsIGJ1dCB0aGUKPj4gcG9sYXJpdHkgaXMgYSBiaXQgZGlmZmVyZW50IGFu
ZCB0aGUgaGVscCBzdHJpbmdzIGFyZW4ndCBhcyBlYXN5IHRvCj4+IHJlYWQuICBJcyB0aGVyZSBh
IHJlYXNvbiB3ZSBjYW4ndCBqdXN0IGNvcHkgd2hhdCB0aGV5IGRvPwo+PiAKPj4gICAgY29uZmln
IENNRExJTkUKPj4gICAgICAgICAgICBzdHJpbmcgIkRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3Ry
aW5nIgo+PiAgICAgICAgICAgIGRlZmF1bHQgIiIKPj4gICAgICAgICAgICBoZWxwCj4+ICAgICAg
ICAgICAgICBPbiBzb21lIGFyY2hpdGVjdHVyZXMgKEVCU0ExMTAgYW5kIENBVFMpLCB0aGVyZSBp
cyAKPj4gY3VycmVudGx5IG5vIHdheQo+PiAgICAgICAgICAgICAgZm9yIHRoZSBib290IGxvYWRl
ciB0byBwYXNzIGFyZ3VtZW50cyB0byB0aGUga2VybmVsLiBGb3IgCj4+IHRoZXNlCj4+ICAgICAg
ICAgICAgICBhcmNoaXRlY3R1cmVzLCB5b3Ugc2hvdWxkIHN1cHBseSBzb21lIGNvbW1hbmQtbGlu
ZSAKPj4gb3B0aW9ucyBhdCBidWlsZAo+PiAgICAgICAgICAgICAgdGltZSBieSBlbnRlcmluZyB0
aGVtIGhlcmUuIEFzIGEgbWluaW11bSwgeW91IHNob3VsZCAKPj4gc3BlY2lmeSB0aGUKPj4gICAg
ICAgICAgICAgIG1lbW9yeSBzaXplIGFuZCB0aGUgcm9vdCBkZXZpY2UgKGUuZy4sIG1lbT02NE0g
Cj4+IHJvb3Q9L2Rldi9uZnMpLgo+PiAgICAgICBjaG9pY2UKPj4gICAgICAgICAgICBwcm9tcHQg
Iktlcm5lbCBjb21tYW5kIGxpbmUgdHlwZSIgaWYgQ01ETElORSAhPSAiIgo+PiAgICAgICAgICAg
IGRlZmF1bHQgQ01ETElORV9GUk9NX0JPT1RMT0FERVIKPj4gICAgICAgICAgICBkZXBlbmRzIG9u
IEFUQUdTCj4+ICAgICAgIGNvbmZpZyBDTURMSU5FX0ZST01fQk9PVExPQURFUgo+PiAgICAgICAg
ICAgIGJvb2wgIlVzZSBib290bG9hZGVyIGtlcm5lbCBhcmd1bWVudHMgaWYgYXZhaWxhYmxlIgo+
PiAgICAgICAgICAgIGhlbHAKPj4gICAgICAgICAgICAgIFVzZXMgdGhlIGNvbW1hbmQtbGluZSBv
cHRpb25zIHBhc3NlZCBieSB0aGUgYm9vdCBsb2FkZXIuIAo+PiBJZgo+PiAgICAgICAgICAgICAg
dGhlIGJvb3QgbG9hZGVyIGRvZXNuJ3QgcHJvdmlkZSBhbnksIHRoZSBkZWZhdWx0IGtlcm5lbCAK
Pj4gY29tbWFuZAo+PiAgICAgICAgICAgICAgc3RyaW5nIHByb3ZpZGVkIGluIENNRExJTkUgd2ls
bCBiZSB1c2VkLgo+PiAgICAgICBjb25maWcgQ01ETElORV9FWFRFTkQKPj4gICAgICAgICAgICBi
b29sICJFeHRlbmQgYm9vdGxvYWRlciBrZXJuZWwgYXJndW1lbnRzIgo+PiAgICAgICAgICAgIGhl
bHAKPj4gICAgICAgICAgICAgIFRoZSBjb21tYW5kLWxpbmUgYXJndW1lbnRzIHByb3ZpZGVkIGJ5
IHRoZSBib290IGxvYWRlciAKPj4gd2lsbCBiZQo+PiAgICAgICAgICAgICAgYXBwZW5kZWQgdG8g
dGhlIGRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nLgo+PiAgICAgICBjb25maWcgQ01ETElO
RV9GT1JDRQo+PiAgICAgICAgICAgIGJvb2wgIkFsd2F5cyB1c2UgdGhlIGRlZmF1bHQga2VybmVs
IGNvbW1hbmQgc3RyaW5nIgo+PiAgICAgICAgICAgIGhlbHAKPj4gICAgICAgICAgICAgIEFsd2F5
cyB1c2UgdGhlIGRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nLCBldmVuIGlmIHRoZSAKPj4g
Ym9vdAo+PiAgICAgICAgICAgICAgbG9hZGVyIHBhc3NlcyBvdGhlciBhcmd1bWVudHMgdG8gdGhl
IGtlcm5lbC4KPj4gICAgICAgICAgICAgIFRoaXMgaXMgdXNlZnVsIGlmIHlvdSBjYW5ub3Qgb3Ig
ZG9uJ3Qgd2FudCB0byBjaGFuZ2UgdGhlCj4+ICAgICAgICAgICAgICBjb21tYW5kLWxpbmUgb3B0
aW9ucyB5b3VyIGJvb3QgbG9hZGVyIHBhc3NlcyB0byB0aGUgCj4+IGtlcm5lbC4KPj4gICAgZW5k
Y2hvaWNlCj4+ICAgIEknbSBub3QgcmVhbGx5IG9wcG9zZWQgdG8geW91ciBzb2x1dGlvbiwgSSdt
IGp1c3QgdHJ5aW5nIHRvIGF2b2lkCj4+IGJlaW5nIGRpZmZlcmVudCB3aXRob3V0IGEgcmVhc29u
Lgo+IAo+IEFUQUdTIGFuZCByZWZlcmVuY2VzIHRvIEFSTSBwbGF0Zm9ybXMgc3VjaCBhcyBFQlNB
MTEwIGFyZSBub3QgcmVsYXRlZCAKPiB0byBSSVNDLVYKPiBhbmQgSSB0aGluayBDTURMSU5FX0ZB
TExCQUNLIGlzIG1vcmUgZGVzY3JpcHRpdmUgdGhhbiAKPiBDTURMSU5FX0ZST01fQk9PVExPQURF
Ui4KCk5vdyB0aGF0IHlvdSBtZW50aW9uIGl0IHRoZSB0ZXh0IGNvdWxkIGJlIGJldHRlci4gSSBq
dXN0IHdhbnRlZCB0bwprZWVwIHRoZW0gc2hvcnQgYW5kIGNvbnNpc3RlbnQuIERvIHlvdSB3YW50
IG1lIHRvIHVzZSBBUk0ncyB0ZXh0IGZvcgpDTURMSU5FX0VYVEVORCBhbmQgQ01ETElORV9GT1JD
RSA/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
