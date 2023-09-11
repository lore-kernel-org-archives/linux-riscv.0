Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D62BEEB580
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 08:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOfQJS5j0bowPN/12hIi8j6iYhoTNRkAkzfaSgE/N9A=; b=1SdwxY9cnI07y+
	A3V0kax4mJVDAeMX0gYRpKAuDD2bkE2xcyqA7lOC0PaKF8Uy1cTDory7zU1KWvk3vIx/rSDvuPP/J
	tNYDohlkd3dWLe+aVlK9SvfMiYURYBS0YbzYk5jg7tmzlmUC0Yn7nnk1AIKCDBM+dsm6jcAGBWDb4
	Qg/CWtT4fbbu3XsaZxewcCGGGIW0d4YTcNtWh3Aq/Ruqxa/KbEBBaIx7SiA/yV6/FTRwpNQBFc2zc
	knMcZ0/xW3LDjjUYDDsJY1qBfA61XGuV5B4auPuNpnOGsrnhsiSX2SuD8u6g5AgNzKqrae3I2qFOz
	CPNYecvDe4KYV1BfOWOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfc2o-00HWIv-2W;
	Mon, 11 Sep 2023 08:13:18 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfc2k-00HWHv-12;
	Mon, 11 Sep 2023 08:13:17 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 38B8CmIs070091;
	Mon, 11 Sep 2023 16:12:48 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Mon, 11 Sep 2023 16:12:45 +0800
Date: Mon, 11 Sep 2023 16:12:45 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Anup Patel <anup@brainfault.org>
CC: <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <conor.dooley@microchip.com>,
        <atishp@atishpatra.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <ajones@ventanamicro.com>, <heiko@sntech.de>, <samuel@sholland.org>,
        <geert+renesas@glider.be>, <n.shubin@yadro.com>,
        <dminus@andestech.com>, <ycliang@andestech.com>,
        <tim609@andestech.com>, <locus84@andestech.com>, <dylan@andestech.com>
Subject: Re: [RFC PATCH 2/4] irqchip/riscv-intc: Support large non-standard
 hwirq number
Message-ID: <ZP7L_ahJOBXnCSP7@APC323>
References: <20230907021635.1002738-1-peterlin@andestech.com>
 <20230907021635.1002738-3-peterlin@andestech.com>
 <CAAhSdy0iy_7-XaE0s97J8jUESUzV-4BMsxsJ8QFNDyHgtv63ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0iy_7-XaE0s97J8jUESUzV-4BMsxsJ8QFNDyHgtv63ZA@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 38B8CmIs070091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_011314_795378_CE1DD0A3 
X-CRM114-Status: GOOD (  26.83  )
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

T24gVGh1LCBTZXAgMDcsIDIwMjMgYXQgMDY6MzY6NTJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIFNlcCA3LCAyMDIzIGF0IDc6NDjigK9BTSBZdSBDaGllbiBQZXRlciBMaW4K
PiA8cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ3VycmVudGx5LCB0aGUg
aW1wbGVtZW50YXRpb24gb2YgdGhlIFJJU0MtViBJTlRDIGRyaXZlciB1c2VzIHRoZQo+ID4gaW50
ZXJydXB0IGNhdXNlIGFzIGh3aXJxIGFuZCBoYXMgYSBsaW1pdGF0aW9uIG9mIHN1cHBvcnRpbmcg
YQo+ID4gbWF4aW11bSBvZiA2NCBod2lycXMuIEhvd2V2ZXIsIGFjY29yZGluZyB0byB0aGUgcHJp
dmlsZWdlZCBzcGVjLAo+ID4gaW50ZXJydXB0IGNhdXNlID49IDE2IGFyZSBkZWZpbmVkIGZvciBw
bGF0Zm9ybSB1c2UuCj4gPgo+ID4gVGhpcyBsaW1pdGF0aW9uIHByZXZlbnRzIHVzIGZyb20gZnVs
bHkgdXRpbGl6aW5nIHRoZSBhdmFpbGFibGUKPiA+IGxvY2FsIGludGVycnVwdCBzb3VyY2VzLiBB
ZGRpdGlvbmFsbHksIHRoZSBod2lycXMgdXNlZCBvbiBSSVNDLVYKPiA+IGFyZSBzcGFyc2UsIHdp
dGggb25seSBpbnRlcnJ1cHQgbnVtYmVycyAxLCA1IGFuZCA5IChwbHVzIFNzY29mcG1mCj4gPiBv
ciBULUhlYWQncyBQTVUgaXJxKSBiZWluZyBjdXJyZW50bHkgdXNlZCBmb3Igc3VwZXJ2aXNvciBt
b2RlLgo+ID4KPiA+IFRoZSBwYXRjaCBzd2l0Y2hlcyB0byB1c2luZyBpcnFfZG9tYWluX2NyZWF0
ZV90cmVlKCkgd2hpY2gKPiA+IGNyZWF0ZXMgdGhlIHJhZGl4IHRyZWUgbWFwLCBhbGxvd2luZyB1
cyB0byBoYW5kbGUgYSBsYXJnZXIKPiA+IG51bWJlciBvZiBod2lycXMuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogWXUgQ2hpZW4gUGV0ZXIgTGluIDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPgo+ID4g
UmV2aWV3ZWQtYnk6IENoYXJsZXMgQ2ktSnl1biBXdSA8ZG1pbnVzQGFuZGVzdGVjaC5jb20+Cj4g
PiBSZXZpZXdlZC1ieTogTGVvIFl1LUNoaSBMaWFuZyA8eWNsaWFuZ0BhbmRlc3RlY2guY29tPgo+
ID4KPiA+IC0tLQo+ID4gVGhlcmUgYXJlIDMgaHdpcnFzIG9mIGxvY2FsIGludGVycnVwdCBzb3Vy
Y2UgZXhjZWVkIDY0IGRlZmluZWQgaW4KPiA+IEFYNDVNUCBkYXRhc2hlZXQgWzFdIFRhYmxlIDU2
OiBBWDQ1TVAtMUMgc2NhdXNlIFZhbHVlIEFmdGVyIFRyYXA6Cj4gPiAtIDI1NisxNiBTbGF2ZSBw
b3J0IEVDQyBlcnJvciBpbnRlcnJ1cHQgKFMtbW9kZSkKPiA+IC0gMjU2KzE3IEJ1cyB3cml0ZSB0
cmFuc2FjdGlvbiBlcnJvciBpbnRlcnJ1cHQgKFMtbW9kZSkKPiA+IC0gMjU2KzE4IFBlcmZvcm1h
bmNlIG1vbml0b3Igb3ZlcmZsb3cgaW50ZXJydXB0KFMtbW9kZSkKPiA+Cj4gPiBbMV0gaHR0cDov
L3d3dy5hbmRlc3RlY2guY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9BWDQ1TVAtMUMtUmV2Li01LjAu
MC1EYXRhc2hlZXQucGRmCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlu
dGMuYyB8IDEwICsrKystLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWludGMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gPiBpbmRl
eCA0YWRlZWUxYmMzOTEuLjc2ZTEyMjljNDVkZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWludGMuYwo+ID4gQEAgLTI0LDggKzI0LDggQEAgc3RhdGljIGFzbWxpbmthZ2Ugdm9pZCByaXNj
dl9pbnRjX2lycShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICB7Cj4gPiAgICAgICAgIHVuc2ln
bmVkIGxvbmcgY2F1c2UgPSByZWdzLT5jYXVzZSAmIH5DQVVTRV9JUlFfRkxBRzsKPiA+Cj4gPiAt
ICAgICAgIGlmICh1bmxpa2VseShjYXVzZSA+PSBCSVRTX1BFUl9MT05HKSkKPiA+IC0gICAgICAg
ICAgICAgICBwYW5pYygidW5leHBlY3RlZCBpbnRlcnJ1cHQgY2F1c2UiKTsKPiA+ICsgICAgICAg
aWYgKCFpcnFfZmluZF9tYXBwaW5nKGludGNfZG9tYWluLCBjYXVzZSkpCj4gPiArICAgICAgICAg
ICAgICAgcGFuaWMoInVuZXhwZWN0ZWQgaW50ZXJydXB0IGNhdXNlOiAlbGQiLCBjYXVzZSk7Cj4g
Cj4gQ2hlY2tpbmcgaXJxX2ZpbmRfbWFwcGluZygpIGlzIHJlZHVuZGFudCBoZXJlIGluc3RlYWQg
Y2hlY2sgdGhlIHJldHVybgo+IHZhbHVlIG9mIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEoKSBh
bmQgcHJpbnQgd2FybmluZyBvbiBlcnJvci4KPiAKPiA+Cj4gPiAgICAgICAgIGdlbmVyaWNfaGFu
ZGxlX2RvbWFpbl9pcnEoaW50Y19kb21haW4sIGNhdXNlKTsKPiA+ICB9Cj4gPiBAQCAtMTE3LDgg
KzExNyw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNfaW5pdF9jb21tb24oc3RydWN0
IGZ3bm9kZV9oYW5kbGUgKmZuKQo+ID4gIHsKPiA+ICAgICAgICAgaW50IHJjOwo+ID4KPiA+IC0g
ICAgICAgaW50Y19kb21haW4gPSBpcnFfZG9tYWluX2NyZWF0ZV9saW5lYXIoZm4sIEJJVFNfUEVS
X0xPTkcsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZyaXNjdl9pbnRjX2RvbWFpbl9vcHMsIE5VTEwpOwo+ID4gKyAgICAgICBpbnRjX2RvbWFpbiA9
IGlycV9kb21haW5fY3JlYXRlX3RyZWUoZm4sICZyaXNjdl9pbnRjX2RvbWFpbl9vcHMsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKTsKPiAKPiBU
aGlzIGlzIGluY29tcGxldGUgYmVjYXVzZSB5b3UgaGF2ZSBhZGRpdGlvbmFsIGN1c3RvbWl6YXRp
b24gb24tdG9wLW9mCj4gdmFuaWxsYSBSSVNDLVYgSU5UQy4KPiAKPiBJIHN1Z2dlc3QgdG8gZG8g
dGhlIGZvbGxvd2luZzoKPiAxKSBEZWZpbmUgYW4gZW51bSBvZiB0eXBlcyBvZiBJTlRDIChzdWNo
IGFzIGdlbmVyaWMsIGFuZGVzdGVjaCwgZXRjKQo+IDIpIERlZmluZSBuZXcgY29tcGF0aWJsZSBz
dHJpbmcgImFuZGVzdGVjLGNwdS1pbnRjIiBmb3IgeW91IGN1c3RvbSBJTlRDCj4gICAgIGFuZCBw
YXNzIHRoYXQgaW5mb3JtYXRpb24gdG8gcmlzY3ZfaW50Y19pbml0X2NvbW1vbigpCj4gMykgRXh0
ZW5kIHJpc2N2X2ludGNfZG9tYWluX21hcCgpIHRvIHVzZSBjdXN0b20gYW5kZXN0ZWNoX2ludGNf
Y2hpcAo+ICAgICBmb3IgdGhlIGN1c3RvbSBsb2NhbCBpcnFzLiBUaGUgYW5kZXN0ZWNoX2ludGNf
Y2hpcCB3aWxsIHByb3ZpZGUgYW5kZXMKPiAgICAgc3BlY2lmaWMgbWFzay91bm1hc2sgbWVjaGFu
aXNtLgoKSGkgQW51cCwKClN1cmUsIHdlIHdpbGwgaW50cm9kdWNlIHRoZSBBbmRlcyBJTlRDIGZv
ciBhIGN1c3RvbSBJUlEgY2hpcC4KClRoYW5rcywKUGV0ZXIgTGluCgo+ID4gICAgICAgICBpZiAo
IWludGNfZG9tYWluKSB7Cj4gPiAgICAgICAgICAgICAgICAgcHJfZXJyKCJ1bmFibGUgdG8gYWRk
IElSUSBkb21haW5cbiIpOwo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5YSU87Cj4gPiBA
QCAtMTMyLDggKzEzMiw2IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNfaW5pdF9jb21t
b24oc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZuKQo+ID4KPiA+ICAgICAgICAgcmlzY3Zfc2V0X2lu
dGNfaHdub2RlX2ZuKHJpc2N2X2ludGNfaHdub2RlKTsKPiA+Cj4gPiAtICAgICAgIHByX2luZm8o
IiVkIGxvY2FsIGludGVycnVwdHMgbWFwcGVkXG4iLCBCSVRTX1BFUl9MT05HKTsKPiA+IC0KPiA+
ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gCj4g
UmVnYXJkcywKPiBBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
