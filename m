Return-Path: <SRS0=mtPM=MQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D618C64EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 20:43:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41A8520877
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 20:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a7Z2/uGq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Q80NZw2i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41A8520877
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dmiqCD5LwptloAJhMAQ5A2MiEwsh/jiMN12NMTvBv8I=; b=a7Z2/uGqu4JHkDuIriLrjUdLS
	U/ckKpdJ5HZfhUNn8MH4T3kjr+pOrVUX/3u8f6/W+JvEn9KZu0K0rnuw+M+lXAAcxbCINfSiOdALF
	dCAouDg5sbnKTMrGc/UyCuzV/TaCqRjHv5yp5W29afGCaRE85+5luqRUyKrB9X5x9NrIyHfVeBwgf
	V5MrpV2bZEj9vzXOAhiCNSGCrd9M6BrERllwAnV09gmmXppmT1W1xdFss1mww0pGxm9vCgNj0uFUr
	PpvACCa+gfsIJ6zcrs4zmbdRzBJdxyUpZc3zm4olKkbEEUva4isBvEOtC/SyoD1FXmHsyXvlm9e7S
	mYsuoOMmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g8ASc-0007U3-Jd; Thu, 04 Oct 2018 20:43:02 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8ASZ-0007T5-NJ
 for linux-riscv@lists.infradead.org; Thu, 04 Oct 2018 20:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538685779; x=1570221779;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DMgGBxog/B7EQ2Et3W9Zj2qLfpOhuifn7bTpiKAmft0=;
 b=Q80NZw2iKZWTzGHN8098QfXg345qODNH++vUeIXDUhk1BugTVdPxHYcm
 RrMxFbeEh81G4cFyKu4Ehjajet2tEtyZZvvojYBkkn4jXSw4bLwbwRzL4
 7Qg6a56xxQG+cPdVo9fZLFs3x8vY+wrVEZJC+GbiOVqf8cggtDyKqsQ5w
 tDxje/qza39ldS9bdXQjMtsQOzzpfrSY4Ut6SE43EmyOeDywZ0DhzliZT
 yh8g3rivA7nHhfage3H/PeP2Yw4sIvYjlgrKlzf4t52Em6Xa5K/boMMrP
 IwTvXRqzf8rhWEClMVwdFpTU9u3mXTZ1aZlpojtd0F8SId8UAF9uGwRlD A==;
X-IronPort-AV: E=Sophos;i="5.54,341,1534780800"; d="scan'208";a="92934953"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Oct 2018 04:42:48 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 04 Oct 2018 13:28:22 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.73.114])
 ([10.111.73.114])
 by uls-op-cesaip02.wdc.com with ESMTP; 04 Oct 2018 13:42:48 -0700
Subject: Re: [PATCH] OF: Handle CMDLINE when /chosen node is not present
To: Nick Kossifidis <mick@ics.forth.gr>
References: <20181004123110.8487-1-mick@ics.forth.gr>
 <fdd03e2e-4c1e-e89d-a336-ab4a716e7abc@wdc.com>
 <b57f9b47d5c8227c3170d3d54d22919e@mailhost.ics.forth.gr>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <3e42d09e-8e49-2766-596c-37200f395097@wdc.com>
Date: Thu, 4 Oct 2018 13:42:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b57f9b47d5c8227c3170d3d54d22919e@mailhost.ics.forth.gr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181004_134259_802079_6EFA7188 
X-CRM114-Status: GOOD (  30.78  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "frowand.list@gmail.com" <frowand.list@gmail.com>,
 "palmer@sifive.com" <palmer@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181004204247.E5wSW44Ew3m4Ss8uOknnIQVi0RPKFcwWwNARlLgcyqs@z>

T24gMTAvNC8xOCAxOjE1IFBNLCBOaWNrIEtvc3NpZmlkaXMgd3JvdGU6Cj4gzqPPhM65z4IgMjAx
OC0xMC0wNCAyMTo1NCwgQXRpc2ggUGF0cmEgzq3Os8+BzrHPiM61Ogo+PiBPbiAxMC80LzE4IDU6
NDYgQU0sIE5pY2sgS29zc2lmaWRpcyB3cm90ZToKPj4+IFRoZSAvY2hvc2VuIG5vZGUgaXMgb3B0
aW9uYWwgc28gd2Ugc2hvdWxkIGhhbmRsZSBDTURMSU5FIHJlZ2FyZGxlc3MKPj4+IHRoZSBwcmVz
ZW5jZSBvZiAvY2hvc2VuL2Jvb3RhcmdzLiBNb3ZlIGhhbmRsaW5nIG9mIENNRExJTkUgaW4KPj4+
IGVhcmx5X2luaXRfZHRfc2NhbigpIGluc3RlYWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTmlj
ayBLb3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4KPj4+Cj4+PiAtLS0KPj4+ICAgIGRyaXZl
cnMvb2YvZmR0LmMgfCA2OQo+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25z
KCspLCAyMSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9mZHQu
YyBiL2RyaXZlcnMvb2YvZmR0LmMKPj4+IGluZGV4IDgwMGFkMjUyYy4uODY4NDY0YjBiIDEwMDY0
NAo+Pj4gLS0tIGEvZHJpdmVycy9vZi9mZHQuYwo+Pj4gKysrIGIvZHJpdmVycy9vZi9mZHQuYwo+
Pj4gQEAgLTMxLDYgKzMxLDE0IEBACj4+PiAgICAgICNpbmNsdWRlICJvZl9wcml2YXRlLmgiCj4+
PiAgICArI2lmZGVmIENPTkZJR19DTURMSU5FCj4+PiArI2lmZGVmIENPTkZJR19DTURMSU5FX0ZP
UkNFCj4+PiArc3RhdGljIGNvbnN0IGNoYXIgZml4ZWRfY21kbGluZVtdIF9faW5pdGNvbnN0ID0g
Q09ORklHX0NNRExJTkU7Cj4+PiArI2Vsc2UKPj4+ICtzdGF0aWMgY2hhciBidWlsdGluX2NtZGxp
bmVbXSBfX2luaXRkYXRhID0gQ09ORklHX0NNRExJTkU7Cj4+PiArI2VuZGlmCj4+PiArI2VuZGlm
Cj4+PiArCj4+PiAgICAvKgo+Pj4gICAgICogb2ZfZmR0X2xpbWl0X21lbW9yeSAtIGxpbWl0IHRo
ZSBudW1iZXIgb2YgcmVnaW9ucyBpbiB0aGUgL21lbW9yeQo+Pj4gbm9kZQo+Pj4gICAgICogQGxp
bWl0OiBtYXhpbXVtIGVudHJpZXMKPj4+IEBAIC0xMDg4LDI4ICsxMDk2LDEwIEBAIGludCBfX2lu
aXQgZWFybHlfaW5pdF9kdF9zY2FuX2Nob3Nlbih1bnNpZ25lZAo+Pj4gbG9uZyBub2RlLCBjb25z
dCBjaGFyICp1bmFtZSwKPj4+ICAgICAgCS8qIFJldHJpZXZlIGNvbW1hbmQgbGluZSAqLwo+Pj4g
ICAgCXAgPSBvZl9nZXRfZmxhdF9kdF9wcm9wKG5vZGUsICJib290YXJncyIsICZsKTsKPj4+IC0J
aWYgKHAgIT0gTlVMTCAmJiBsID4gMCkKPj4+ICsJaWYgKHAgIT0gTlVMTCAmJiBsID4gMCkgewo+
Pj4gICAgCQlzdHJsY3B5KGRhdGEsIHAsIG1pbigoaW50KWwsIENPTU1BTkRfTElORV9TSVpFKSk7
Cj4+PiAtCj4+PiAtCS8qCj4+PiAtCSAqIENPTkZJR19DTURMSU5FIGlzIG1lYW50IHRvIGJlIGEg
ZGVmYXVsdCBpbiBjYXNlIG5vdGhpbmcgZWxzZQo+Pj4gLQkgKiBtYW5hZ2VkIHRvIHNldCB0aGUg
Y29tbWFuZCBsaW5lLCB1bmxlc3MgQ09ORklHX0NNRExJTkVfRk9SQ0UKPj4+IC0JICogaXMgc2V0
IGluIHdoaWNoIGNhc2Ugd2Ugb3ZlcnJpZGUgd2hhdGV2ZXIgd2FzIGZvdW5kIGVhcmxpZXIuCj4+
PiAtCSAqLwo+Pj4gLSNpZmRlZiBDT05GSUdfQ01ETElORQo+Pj4gLSNpZiBkZWZpbmVkKENPTkZJ
R19DTURMSU5FX0VYVEVORCkKPj4+IC0Jc3RybGNhdChkYXRhLCAiICIsIENPTU1BTkRfTElORV9T
SVpFKTsKPj4+IC0Jc3RybGNhdChkYXRhLCBDT05GSUdfQ01ETElORSwgQ09NTUFORF9MSU5FX1NJ
WkUpOwo+Pj4gLSNlbGlmIGRlZmluZWQoQ09ORklHX0NNRExJTkVfRk9SQ0UpCj4+PiAtCXN0cmxj
cHkoZGF0YSwgQ09ORklHX0NNRExJTkUsIENPTU1BTkRfTElORV9TSVpFKTsKPj4+IC0jZWxzZQo+
Pj4gLQkvKiBObyBhcmd1bWVudHMgZnJvbSBib290IGxvYWRlciwgdXNlIGtlcm5lbCdzICBjbWRs
Ki8KPj4+IC0JaWYgKCEoKGNoYXIgKilkYXRhKVswXSkKPj4+IC0JCXN0cmxjcHkoZGF0YSwgQ09O
RklHX0NNRExJTkUsIENPTU1BTkRfTElORV9TSVpFKTsKPj4+IC0jZW5kaWYKPj4+IC0jZW5kaWYg
LyogQ09ORklHX0NNRExJTkUgKi8KPj4+IC0KPj4+IC0JcHJfZGVidWcoIkNvbW1hbmQgbGluZSBp
czogJXNcbiIsIChjaGFyKilkYXRhKTsKPj4+ICsJCXByX2RlYnVnKCJHb3QgYm9vdGFyZ3M6ICVz
XG4iLCAoY2hhciAqKSBkYXRhKTsKPj4+ICsJfQo+Pj4gICAgICAJLyogYnJlYWsgbm93ICovCj4+
PiAgICAJcmV0dXJuIDE7Cj4+PiBAQCAtMTI0MCw2ICsxMjMwLDQzIEBAIGJvb2wgX19pbml0IGVh
cmx5X2luaXRfZHRfc2Nhbih2b2lkICpwYXJhbXMpCj4+PiAgICAJCXJldHVybiBmYWxzZTsKPj4+
ICAgICAgCWVhcmx5X2luaXRfZHRfc2Nhbl9ub2RlcygpOwo+Pj4gKwo+Pj4gKwkvKgo+Pj4gKwkg
KiBUaGUgL2Nob3NlbiBub2RlIG5vcm1hbHkgY29udGFpbnMgdGhlIGJvb3RhcmdzIGVsZW1lbnQK
Pj4KPj4gL3Mvbm9ybWFseS9ub3JtYWxseQo+Pgo+IAo+IEFDSwo+IAo+Pj4gKwkgKiB0aGF0IGlu
Y2x1ZGVzIHRoZSBrZXJuZWwncyBjb21tYW5kIGxpbmUgcGFyYW1ldGVycy4KPj4+ICsJICogSG93
ZXZlciB0aGUgcHJlc2VuY2Ugb2YgL2Nob3NlbiBpcyBub3QgbWFuZGF0b3J5IHNvCj4+PiArCSAq
IGluIGNhc2Ugd2UgZGlkbid0IGdldCBhIGNvbW1hbmQgbGluZSB3aGVuIHNjYW5uaW5nCj4+PiAr
CSAqIG5vZGVzIGFib3ZlLCB3ZSBzaG91bGQgcHJvdmlkZSBvbmUgaGVyZSBiZWZvcmUgd2UKPj4+
ICsJICogcmV0dXJuLCBpZiBwb3NzaWJsZS4KPj4+ICsJICoKPj4+ICsJICogVGhlIGJ1aWx0LWlu
IGNvbW1hbmQgbGluZSBjYW4gYmUgdXNlZCBhcyBhIGRlZmF1bHQKPj4+ICsJICogY29tbWFuZCBs
aW5lIGluIGNhc2Ugd2UgcmVjZWl2ZWQgbm90aGluZyBmcm9tIHRoZQo+Pj4gKwkgKiBkZXZpY2Ug
dHJlZS9ib290bG9hZGVyLiBJdCBjYW4gYWxzbyBiZSB1c2VkIGZvcgo+Pj4gKwkgKiBleHRlbmRp
bmcgb3IgcmVwbGFjaW5nIHRoZSByZWNlaXZlZCBjb21tYW5kIGxpbmUuCj4+PiArCSAqLwo+Pj4g
KyNpZmRlZiBDT05GSUdfQ01ETElORQo+Pj4gKyNpZiBkZWZpbmVkKENPTkZJR19DTURMSU5FX0VY
VEVORCkKPj4+ICsJLyoKPj4+ICsJICogT3JkZXIgb2YgcGFyYW1ldGVycyBzaG91bGRuJ3QgbWF0
dGVyIGZvciBtb3N0IGNhc2VzLAo+Pj4gKwkgKiBzbyBwcmVwZW5kaW5nIG9yIGFwcGVuZGluZyB0
aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lCj4+PiArCSAqIHNob3VsZG4ndCBtYWtlIGEgZGlmZmVy
ZW5jZS4gSW4gY2FzZXMgd2hlcmUgaXQgZG9lcwo+Pj4gKwkgKiBpdCdzIHVwIHRvIHRoZSB1c2Vy
IHRvIGNvbmZpZ3VyZSB0aGUga2VybmVsIGFuZC9vcgo+Pj4gKwkgKiB0aGUgYm9vdGxvYWRlciBw
cm9wZXJseS4KPj4+ICsJICovCj4+PiArCWlmIChidWlsdGluX2NtZGxpbmVbMF0pIHsKPj4+ICsJ
CXN0cmxjYXQoYm9vdF9jb21tYW5kX2xpbmUsICIgIiwgQ09NTUFORF9MSU5FX1NJWkUpOwo+Pj4g
KwkJc3RybGNhdChib290X2NvbW1hbmRfbGluZSwgYnVpbHRpbl9jbWRsaW5lLCBDT01NQU5EX0xJ
TkVfU0laRSkKPj4+ICsJfQo+Pj4gKyNlbGlmIGRlZmluZWQoQ09ORklHX0NNRExJTkVfRk9SQ0Up
Cj4+PiArCWlmIChmaXhlZF9jbWRsaW5lWzBdKQo+Pj4gKwkJc3RybGNweShib290X2NvbW1hbmRf
bGluZSwgZml4ZWRfY21kbGluZSwgQ09NTUFORF9MSU5FX1NJWkUpOwo+Pj4gKyNlbHNlCj4+PiAr
CS8qIE5vIGFyZ3VtZW50cyBmcm9tIGJvb3QgbG9hZGVyLCB1c2Uga2VybmVsJ3MgY21kbGluZSAq
Lwo+Pj4gKwlpZiAoIWJvb3RfY29tbWFuZF9saW5lWzBdICYmIGJ1aWx0aW5fY21kbGluZVswXSkK
Pj4+ICsJCXN0cmxjcHkoYm9vdF9jb21tYW5kX2xpbmUsIGJ1aWx0aW5fY21kbGluZSwgQ09NTUFO
RF9MSU5FX1NJWkUpOwo+Pj4gKyNlbmRpZgo+Pj4gKyNlbmRpZiAvKiBDT05GSUdfQ01ETElORSAq
Lwo+Pj4gKwo+Pgo+PiBBbnkgc3BlY2lmaWMgcmVhc29uIGZvciBkb2luZyB0aGlzIGluIGVhcmx5
X2luaXRfZHRfc2NhbiBpbnN0ZWFkIG9mCj4+IGVhcmx5X2luaXRfZHRfc2Nhbl9jaG9zZW4/Cj4+
IEkgdGhpbmsga2VlcGluZyBhbGwgYm9vdCBjb21tYW5kIGxpbmUgbW9kaWZpY2F0aW9ucyBhdCBv
bmUgcGxhY2UgbWFrZXMKPj4gbW9yZSBzZW5zZS4KPj4KPj4gUmVnYXJkcywKPj4gQXRpc2gKPiAK
PiBXaGVuIHBhcnNpbmcgdGhlIGRldmljZSB0cmVlIHRocm91Z2ggZWFybHlfaW5pdF9kdF9zY2Fu
LCBhZnRlciB2ZXJpZnlpbmcKPiB0aGUgZmR0IGZpbGUncwo+IGludGVncml0eSwgdGhlIGNvZGUg
d2lsbCBzdGFydCB0cmF2ZXJzaW5nIHRocm91Z2ggdGhlIHZhcmlvdXMgbm9kZXMgb2YKPiB0aGUg
dHJlZSB1c2luZwo+IG9mX3NjYW5fZmxhdF9kdCAob24gdGhlIHNhbWUgZmlsZSBJIHBhdGNoZWQp
LiBUaGF0IGZ1bmN0aW9uIGdldHMgYQo+IHBvaW50ZXIgdG8gYSBzZWFyY2gKPiBmdW5jdGlvbiBh
cyBpdHMgZmlyc3QgYXJndW1lbnQgYW5kIHRoZSBzZWNvbmQgYXJndW1lbnQgaXMgYW4gYXV4aWxp
YXJ5Cj4gYnVmZmVyLiBUaGUKPiBzZWFyY2ggZnVuY3Rpb24gd2lsbCBydW4gZm9yIGFsbCBub2Rl
cyBvbiB0aGUgdHJlZSB1bnRpbCBpdCByZWFjaGVzIHRoZQo+IGV4cGVjdGVkIG5vZGUKPiBpbiB3
aGljaCBjYXNlIGl0IHJldHVybnMgMSBhbmQgdGhlIHNlYXJjaCB3aWxsIGVuZC4KPiAKPiBJZiB3
ZSBkbyB0aGUgdHdlYWtpbmcgb2YgdGhlIGNvbW1hbmQgbGluZSBpbnNpZGUKPiBlYXJseV9pbml0
X2R0X3NjYW5fY2hvc2VuIGJlZm9yZSB0aGUKPiBjaGVjayBpcyBkb25lLCB3ZSdsbCBtZXNzIHVw
IHRoZSBjb21tYW5kIGxpbmUgYmFkbHkgc2luY2Ugd2UnbGwgYmUKPiB0d2Vha2luZyBpdAo+IGZv
ciBldmVyeSBub2RlIG9uIHRoZSB0cmVlICh1bnRpbCB3ZSByZWFjaCB0aGUgL2Nob3NlbiBub2Rl
LCBpZiB3ZSByZWFjaAo+IGl0KS4gSWYgd2UgZG8KPiBpdCBhZnRlciB0aGUgY2hlY2sgLXdoaWNo
IGlzIHdoYXQncyBoYXBwZW5pbmcgbm93LSB3ZSBtaWdodCBub3QgcmVhY2gKPiB0aGUgY29kZSBz
aW5jZQo+IHRoZSAvY2hvc2VuIG5vZGUgaXMgb3B0aW9uYWwgc28gdGhlIGNoZWNrIG1heSBuZXZl
ciBzdWNjZWVkLiBTbyB3ZSBuZWVkCj4gdG8gZG8gdGhlIGNoZWNrCj4gYWZ0ZXIgdGhlIHNlYXJj
aCBmaW5pc2hlcy4gSSBjaG9zZSB0byBkbyBpdCBvbiBlYXJseV9pbml0X2R0X3NjYW4gc2luY2UK
PiBpdCdzIHNvbWV0aGluZwo+IHRoYXQgSU1ITyBzaG91bGQgYmUgY2hlY2tlZCBiZWZvcmUgdGhh
dCBmdW5jdGlvbiByZXR1cm5zLgo+IAoKSXQgbWFrZXMgc2Vuc2UuIFRoYW5rcy4KClJlZ2FyZHMs
CkF0aXNoCj4gUmVnYXJkcywKPiBOaWNrCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
