Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AA0FF60CE
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 06:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Mime-Version:
	Subject:Cc:To:Message-Id:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+tzCjTLwPoHTZbUf7mlXKq7ajCrwi5/bB9QT3ksbbc=; b=wfK9u1KpIztdGb
	4yMs4XhhuHW7XW0zXQjl5XvGxgdCRiWF/40FS/UpfsDrNNgDv/oNtmRcuezkmLYRpPXV8IanxUy9/
	2cpY61CcgkUQaRhMXY+1Kl5VpPn2w/KvYNTbwwfJNEPj30HgKDAehOWqIHfm7bmHIqCfeJ6UD6sWD
	+EHSLd0+/cgDy1UmnGfvvvsGIeDza8srWgVks3zUd37qorCbwTFOt4KtywAWxhBbgB8jIpWjz0vPO
	dkS1BfloPvPRSrhVhYS4kZzJGE7mQ4pmis/gPgT0b65jPyzCRgSft5bgoTBKSwlxPhLO2G+pAEdUU
	v9IbKHoWi6aMfmMukZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SSw-0000000CLvc-2fF4;
	Tue, 31 Mar 2026 06:20:42 +0000
Received: from sg-3-43.ptr.tlmpb.com ([101.45.255.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SSt-0000000CLvH-2uKO
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 06:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774937726;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=pt5PETNepaQ0Nw1NJHuQ6irwi3W5lWviOYEgUjg/xA4=;
 b=mS1VllzWGaDrEX1/YecDnor1D42Wk3YStwdygl6pwbSLoZ6IkT5QQtgJEOQt1oUB4e2jYP
 BiKUqDE6RGJmKYZcRXdtD66PYUp45IKurYxPfv97q381rFnBwkH9EHU+gbSfj4YzcvQIEE
 SY8BpEESwHjaniiOSV3Jz86MakTyFWSH9phN87kLBPBLE91hIsQ/z8SeyDg/rS/CYCiNlG
 3b77gHDKRvaFfC0tVYsK0K208MN1JbmtF8dhZYoaPdRzWc8EbKxJMFep4HSUBu/GGHlzGk
 g6RLATAt0MntoqTIah4Uz0TbC8PZDvunKFM5ETwmdvy78ECLn7ndUD40oPMOAQ==
Date: Tue, 31 Mar 2026 14:15:22 +0800
From: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+169cb667c+2e69d6+lists.infradead.org+sandie.cao@deepcomputing.io>
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.d811f619.24b1.431f.ad4d.c0bae1097eb9@feishu.cn>
To: "Yixun Lan" <dlan@kernel.org>
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
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
Mime-Version: 1.0
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io> <20260331034539.67167-1-sandie.cao@deepcomputing.io>
	<20260331060344-GKA976850@kernel.org>
In-Reply-To: <20260331060344-GKA976850@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_232040_027631_44D2ABE5 
X-CRM114-Status: GOOD (  10.37  )
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

Cj4gRnJvbTogIllpeHVuIExhbiI8ZGxhbkBrZXJuZWwub3JnPgo+IERhdGU6wqAgVHVlLCBNYXIg
MzEsIDIwMjYsIDE0OjAzCj4gU3ViamVjdDrCoCBSZTogW1BBVENIIHYxIDEvMl0gZHQtYmluZGlu
Z3M6IHJpc2N2OiBzcGFjZW1pdDogYWRkIGRlZXBjb21wdXRpbmcsZm1sMTN2MDUKPiBUbzogIlNh
bmRpZSBDYW8iPHNhbmRpZS5jYW9AZGVlcGNvbXB1dGluZy5pbz4KPiBDYzogIkNvbm9yIERvb2xl
eSI8Y29ub3IrZHRAa2VybmVsLm9yZz4sICJFbWlsIFJlbm5lciBCZXJ0aGluZyI8a2VybmVsQGVz
bWlsLmRrPiwgIlJvYiBIZXJyaW5nIjxyb2JoQGtlcm5lbC5vcmc+LCAiS3J6eXN6dG9mIEtvemxv
d3NraSI8a3J6aytkdEBrZXJuZWwub3JnPiwgIlBhdWwgV2FsbXNsZXkiPHBhdWwud2FsbXNsZXlA
c2lmaXZlLmNvbT4sICJQYWxtZXIgRGFiYmVsdCI8cGFsbWVyQGRhYmJlbHQuY29tPiwgIkFsYmVy
dCBPdSI8YW91QGVlY3MuYmVya2VsZXkuZWR1PiwgIkhlaW5yaWNoIFNjaHVjaGFyZHQiPGhlaW5y
aWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4sICJUcm95IE1pdGNoZWxsIjx0cm95Lm1pdGNo
ZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4sICJNaWNoYWVsIE9wZGVuYWNrZXIiPG1pY2hhZWwub3Bk
ZW5hY2tlckByb290Y29tbWl0LmNvbT4sICJHdW9kb25nIFh1IjxndW9kb25nQHJpc2NzdGFyLmNv
bT4sICJIZW5kcmlrIEhhbWVybGluY2siPGhlbmRyaWsuaGFtZXJsaW5ja0BoYW1tZXJuZXQuYmU+
LCAiWWFuZ3l1IENoZW4iPGN5eUBjeXlzZWxmLm5hbWU+LCA8c3BhY2VtaXRAbGlzdHMubGludXgu
ZGV2PiwgPGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+LCA8ZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc+LCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBIaSBTYW5kaWUs
Cj4gT24gMTE6NDUgVHVlIDMxIE1hciDCoCDCoCAsIFNhbmRpZSBDYW8gd3JvdGU6Cj4gPiBGcm9t
OiBzYW5kaWVjYW8gPHNhbmRpZS5jYW9AZGVlcGNvbXB1dGluZy5pbz4KPsKgCj4gQ2FuIHlvdSB1
c2UgbW9yZSBmb3JtYWwgZm9ybWF0IGZvciB5b3VyIG5hbWU/IHdoaWNoLAo+IFNhbmRpZSBDYW8g
PHNhbmRpZS5jYW9AZGVlcGNvbXB1dGluZy5pbz4KCk9LLiBHb3QgaXQuIEkgd2lsbCBmaXggaXQg
aW4gbmV4dCB2ZXJzaW9uLgpTYW5kaWUKCj7CoAo+ID7CoAo+ID4gRG9jdW1lbnQgdGhlIGNvbXBh
dGlibGUgc3RyaW5nIGZvciB0aGUgRGVlcGNvbXB1dGluZyBmbWwxM3YwNS4KPiA+IEl0J3MgYmFz
ZWQgb24gdGhlIFNwYWNlbWlUIEszIFJJU0MtViBTb0MgYW5kIGlzIGRlc2lnbmVkIGZvciB0aGUg
RnJhbWV3b3JrCj4gPiBMYXB0b3AgMTMgQ2hhc3Npcywgd2hpY2ggaGFzIChGcmFtZXdvcmspIFNL
VSBGUkFOSFEwMDAxLgo+ID7CoAo+ID4gU2lnbmVkLW9mZi1ieTogc2FuZGllY2FvIDxzYW5kaWUu
Y2FvQGRlZXBjb21wdXRpbmcuaW8+Cj4gc2FtZSBoZXJlCj4gPiBSZXZpZXdlZC1ieTogSGVpbnJp
Y2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPgo+ID4gLS0t
Cj4gPiDCoERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zcGFjZW1pdC55
YW1sIHwgMSArCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID7CoAo+ID4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zcGFj
ZW1pdC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NwYWNl
bWl0LnlhbWwKPiA+IGluZGV4IGI5NThiOTRhOTI0ZC4uYWY4MDMwMjQyYmRjIDEwMDY0NAo+ID4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NwYWNlbWl0Lnlh
bWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zcGFj
ZW1pdC55YW1sCj4gPiBAQCAtMjksNiArMjksNyBAQCBwcm9wZXJ0aWVzOgo+ID4gwqAgwqAgwqAg
wqAgwqAgwqAtIGNvbnN0OiBzcGFjZW1pdCxrMQo+ID4gwqAgwqAgwqAgwqAtIGl0ZW1zOgo+ID4g
wqAgwqAgwqAgwqAgwqAgwqAtIGVudW06Cj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgLSBkZWVw
Y29tcHV0aW5nLGZtbDEzdjA1Cj4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC0gc3BhY2VtaXQs
azMtcGljby1pdHgKPiA+IMKgIMKgIMKgIMKgIMKgIMKgLSBjb25zdDogc3BhY2VtaXQsazMKPiA+
IMKgCj4gPiAtLcKgCj4gPiAyLjQzLjAKPsKgCj4gLS3CoAo+IFlpeHVuIExhbiAoZGxhbikKPsKg
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
