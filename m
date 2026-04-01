Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BE71076374
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 06:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:In-Reply-To:Cc:Subject:
	To:References:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aPYZCMXBPe7ZaTaxYhwOsSEaei8DT9lDiRH3BjpEU60=; b=NiUXU3w03Gg5P/
	nWH6m6dSkP6EvBIKf4zuuCCBDOVOVyZp40XVHkmri0fgmE7z/htVyB5A+9dsKUYi/IDjkJkN5ELMb
	fSnOdaQ5+SYXt8WCU0XQKTtKSGR4nvwPQReb9iaelxBIlocug5fz6C2qcLn9MZOdWpY98rAvxwiMl
	YHLEN4AHaAHZRXpogqho87ixvFSyJDzQ+3hQrKRENudVPAzhmQ6ALh6aS0njg5V7r8Gu9CFyDQiRB
	DC2DKaPW6Bin/ZrXzuXsGQZABSCk5bOfR/OKFai9Yi1yb48DJHNZYZigQSnBWrZjMN/Gkbm6NmDgZ
	aUSzA1LMokm3W8UGHu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7omW-0000000E5ke-0rBC;
	Wed, 01 Apr 2026 06:10:24 +0000
Received: from va-2-38.ptr.blmpb.com ([209.127.231.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7omS-0000000E5jx-1DE9
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 06:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775023809;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=VbUQOvKGwR1R52hKJcfo6NqJZg0YjUDtMeBwt+ohpDo=;
 b=V+N6vJC/4N4BRZjaJ+N4wQpB8Kq5KF8p47PPMeiuVWty0/P2L4A4HY8I1oH4rWuHCJC/Fi
 /JX2GRORsDCtiSBhzGuFn73skj8B7EFeY3lRFi65XA5F/pfSgKwNA02otH2C7Et9d1zU9f
 kxIis6FmInDklD1mbtOzF+41G8XVa+Ykr/hqG7GRIaPsM0ynFQ8cGADVIHLxUfjHgZO8oI
 YOsJxUwTH0nWPP48l+J5ubtrF0RUzWbhK0BQBk0XnRoGiyzomdT4N+MxaiHtOTHqzB1Hrp
 8k5M5OCFN40bFUZOCnFakj6Abxnm22/sFhSAYeepfnm0gP46IRiwDwq7Er9yTA==
From: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>
Mime-Version: 1.0
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io> <20260331034616.67183-1-sandie.cao@deepcomputing.io>
	<20260331085925-GKB976850@kernel.org>
To: "Yixun Lan" <dlan@kernel.org>
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
X-Lms-Return-Path: <lba+169ccb6bf+be0b1e+lists.infradead.org+sandie.cao@deepcomputing.io>
In-Reply-To: <20260331085925-GKB976850@kernel.org>
Date: Wed, 01 Apr 2026 14:10:06 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4c756029.b64e.488e.905e.99baaf78d6a1@feishu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_231021_026434_4787B1D6 
X-CRM114-Status: GOOD (  17.80  )
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

SGkgTGFuLAoKPiBGcm9tOiAiWWl4dW4gTGFuIjxkbGFuQGtlcm5lbC5vcmc+Cj4gSGkgU2FuZGll
LMKgCj7CoAo+IE9uIDExOjQ2IFR1ZSAzMSBNYXIgwqAgwqAgLCBTYW5kaWUgQ2FvIHdyb3RlOgo+
ID4gRnJvbTogc2FuZGllY2FvIDxzYW5kaWUuY2FvQGRlZXBjb21wdXRpbmcuaW8+Cj4gPsKgCj4g
PiBUaGUgRk1MMTNWMDUgYm9hcmQgZnJvbSBEZWVwQ29tcHV0aW5nIGluY29ycG9yYXRlcyBhIFNw
YWNlbWlUIEszIFJJU0MtVgo+ID4gU29DLkl0IGlzIGEgbWFpbmJvYXJkIGRlc2lnbmVkIGZvciB0
aGUgRnJhbWV3b3JrIExhcHRvcCAxMyBDaGFzc2lzLAo+ID4gd2hpY2ggaGFzIChGcmFtZXdvcmsp
IFNLVSBGUkFOSFEwMDAxLgo+ID7CoAo+ID4gVGhlIEZNTDEzVjA1IGJvYXJkIGZlYXR1cmVzOgo+
ID4gLSBTcGFjZW1pVCBLMyBSSVNDLVYgU29DCj4gPiAtIExQRERSNSAxNkdCIG9yIDMyR0IKPiA+
IC0gZU1NQyAzMkdCIH4xMjhHQiAoT3B0aW9uYWwpCj4gPiAtIFVGUyAzLjEgMjU2RyAoT3B0aW9u
YWwpCj4gPiAtIFFTUEkgRmxhc2gKPiA+IC0gTWljcm9TRCBTbG90Cj4gPiAtIFBDSWUtYmFzZWQg
V2ktRmkKPiA+IC0gNCBVU0ItQyBQb3J0cwo+ID4gwqAtIFBvcnQgMTogUEQgMy4wICg2NVcgTWF4
KSwgVVNCIDMuMiBHZW4gMQo+ID4gwqAtIFBvcnQgMjogUEQgMy4wICg2NVcgTWF4KSwgVVNCIDMu
MiBHZW4gMSwgRFAgMS40ICg0S0A2MEh6KQo+ID4gwqAtIFBvcnQgMyAmIDQ6IFVTQiAzLjIgR2Vu
IDEKPiA+wqAKPiA+IFRoaXMgbWluaW1hbCBkZXZpY2UgdHJlZSBlbmFibGVzIGJvb3RpbmcgaW50
byBhIHNlcmlhbCBjb25zb2xlIHdpdGggVUFSVAo+ID4gb3V0cHV0Lgo+ID7CoAo+ID4gU2lnbmVk
LW9mZi1ieTogc2FuZGllY2FvIDxzYW5kaWUuY2FvQGRlZXBjb21wdXRpbmcuaW8+Cj4gPiBSZXZp
ZXdlZC1ieTogSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmlj
YWwuY29tPgo+IHNob3VsZCBwdXQgeW91ciBvd24gc2lnbmVkLW9mZiBhdCB0aGUgZW5kLgo+wqAK
PiA+IC0tLQo+ID4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L01ha2VmaWxlIMKgIMKg
IMKgIMKgIHwgwqAxICsKPiA+IMKgLi4uL3NwYWNlbWl0L2szLWRlZXBjb21wdXRpbmctZm1sMTN2
MDUuZHRzIMKgIMKgfCAyOCArKysrKysrKysrKysrKysrKysrCj4gPiDCoDIgZmlsZXMgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9i
b290L2R0cy9zcGFjZW1pdC9rMy1kZWVwY29tcHV0aW5nLWZtbDEzdjA1LmR0cwo+ID7CoAo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvTWFrZWZpbGUgYi9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L01ha2VmaWxlCj4gPiBpbmRleCA3ZTJiODc3MDI1NzEu
LmFjYjk5M2M0NTJiYSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvTWFrZWZpbGUKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvTWFrZWZp
bGUKPiA+IEBAIC00LDQgKzQsNSBAQCBkdGItJChDT05GSUdfQVJDSF9TUEFDRU1JVCkgKz0gazEt
bWlsa3YtanVwaXRlci5kdGIKPiA+IMKgZHRiLSQoQ09ORklHX0FSQ0hfU1BBQ0VNSVQpICs9IGsx
LW11c2VwaS1wcm8uZHRiCj4gPiDCoGR0Yi0kKENPTkZJR19BUkNIX1NQQUNFTUlUKSArPSBrMS1v
cmFuZ2VwaS1yMnMuZHRiCj4gPiDCoGR0Yi0kKENPTkZJR19BUkNIX1NQQUNFTUlUKSArPSBrMS1v
cmFuZ2VwaS1ydjIuZHRiCj4gPiArZHRiLSQoQ09ORklHX0FSQ0hfU1BBQ0VNSVQpICs9IGszLWRl
ZXBjb21wdXRpbmctZm1sMTN2MDUuZHRiCj4gPiDCoGR0Yi0kKENPTkZJR19BUkNIX1NQQUNFTUlU
KSArPSBrMy1waWNvLWl0eC5kdGIKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NwYWNlbWl0L2szLWRlZXBjb21wdXRpbmctZm1sMTN2MDUuZHRzIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9zcGFjZW1pdC9rMy1kZWVwY29tcHV0aW5nLWZtbDEzdjA1LmR0cwo+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjM0M2FlM2FjYzJkCj4gPiAtLS0g
L2Rldi9udWxsCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWRlZXBj
b21wdXRpbmctZm1sMTN2MDUuZHRzCj4gPiBAQCAtMCwwICsxLDI4IEBACj4gPiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkKPiA+ICsvKgo+ID4gKyAqIENvcHly
aWdodCAoQykgMjAyNCBEZWVwQ29tcHV0aW5nIChISykgTGltaXRlZAo+IHNob3VsZCBjb3ZlciBj
dXJyZW50IHllYXIsIHdoaWNoIGlzIDIwMjYgbm93Li4KPsKgCj4gPiArICovCj4gPiArCj4gPiAr
I2luY2x1ZGUgImszLmR0c2kiCj4gPiArCj4gPiArLyB7Cj4gPiArIMKgIMKgIMKgIMKgbW9kZWwg
PSAiRGVlcENvbXB1dGluZyBGTUwxM1YwNSI7Cj4gPiArIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9
ICJkZWVwY29tcHV0aW5nLGZtbDEzdjA1IiwgInNwYWNlbWl0LGszIjsKPiA+ICsKPiA+ICsgwqAg
wqAgwqAgwqBhbGlhc2VzIHsKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZXJpYWwwID0g
JnVhcnQwOwo+ID4gKyDCoCDCoCDCoCDCoH07Cj4gPiArCj4gPiArIMKgIMKgIMKgIMKgY2hvc2Vu
IHsKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGRvdXQtcGF0aCA9ICJzZXJpYWwwIjsK
PiA+ICsgwqAgwqAgwqAgwqB9Owo+ID4gKwo+ID4gKyDCoCDCoCDCoCDCoG1lbW9yeUAxMDAwMDAw
MDAgewo+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldmljZV90eXBlID0gIm1lbW9yeSI7
Cj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gPDB4MSAweDAwMDAwMDAwIDB4NCAw
eDAwMDAwMDAwPjsKPiA+ICsgwqAgwqAgwqAgwqB9Owo+ID4gK307Cj4gPiArCj4gPiArJnVhcnQw
IHsKPiBDYW4geW91IGFsc28gYWRkIHBpbmN0cmwgZGF0YSBleHBsaWNpdGx5PwoKVG8gYXZvaWQg
Y29uZmxpY3QswqAgdGhlIGNvbW1vbiBwaW5jdHJsIHRhYmxlICJrMy1waW5jdHJsLmR0c2kiIHNo
b3VsZCBiZSB1cGxvYWRlZCBieSBzcGFjZW1pdC7CoApUaGVuIHdlIHdpbGwgYWRkIHRoZSBwaW5j
dHJsIGRhdGEgYWZ0ZXIgazMtcGljby1pdHguZHRzLiBUaGF0IHNob3VsZCBiZSBhbm90aGVyIHBh
dGNoLsKgClNhbmRpZQoKPsKgCj4gPiArIMKgIMKgIMKgIMKgc3RhdHVzID0gIm9rYXkiOwo+ID4g
K307Cj4gPiAtLcKgCj4gPiAyLjQzLjAKPsKgCj4gLS3CoAo+IFlpeHVuIExhbiAoZGxhbikKPsKg
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
