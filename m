Return-Path: <SRS0=mtPM=MQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1554EC64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 20:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC7E42084D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 20:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l8B0ES4Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC7E42084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KYFVfh/jYdzLaEY/FfULv26TMJwKVRARsvnrnz8TNRg=; b=l8B0ES4Q4rijd0vvxLkRvMa4t
	Jg3MjsV3bifChxkn9DAqQ3R91Gn+nBB1Kmag1KOgApI/FBP6lCQkKzabNhWW2Teue+4Whh0jidOOv
	uDkMpqvZ4LDoSSUeOHAnb+elcN1TdtGyWDNlpTSoAExKBYX9wO+9DYX6QqYI3XwSnvJEyegRNkgy/
	ApTtP8R0cyrF3LiDbbfG/Pye4nG3449WCfzOX1aLbAUGi72z/FkcMUbTUeiVJ16I1qFPjRObrvk/v
	5SoXJExmSZiqW6BAKAEw1y7qJc1CVHJctyg+IHIS4AgbFLo9ltR+z4crY96z5JA7xZIY39u4NAlz6
	68zJonwsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g8A1e-0005BJ-6Z; Thu, 04 Oct 2018 20:15:10 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8A1a-0004sm-Gf
 for linux-riscv@lists.infradead.org; Thu, 04 Oct 2018 20:15:08 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 w94KEl7a091814; Thu, 4 Oct 2018 23:14:49 +0300 (EEST)
X-AuditID: 8b5b9d4d-91bff70000000e62-71-5bb674b7dde1
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 2B.8A.03682.7B476BB5; Thu,  4 Oct 2018 23:14:47 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id w94KElQM019103; Thu, 4 Oct 2018 23:14:47 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 04 Oct 2018 23:14:47 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH] OF: Handle CMDLINE when /chosen node is not present
Organization: FORTH
In-Reply-To: <fdd03e2e-4c1e-e89d-a336-ab4a716e7abc@wdc.com>
References: <20181004123110.8487-1-mick@ics.forth.gr>
 <fdd03e2e-4c1e-e89d-a336-ab4a716e7abc@wdc.com>
Message-ID: <b57f9b47d5c8227c3170d3d54d22919e@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsXSHc2orLu9ZFu0wb4z6haLVnxnsZh/5Byr
 xcw3/9kstn1uYbNofneO3WLzhAWsFq17j7A7sHvsnHWX3ePhpktMHptWdbJ5bF5S73Gp+Tq7
 x+dNch7tB7qZAtijuGxSUnMyy1KL9O0SuDIuvu1kK5ipWbF3u2YD43eFLkZODgkBE4nnU5Yx
 dTFycQgJHGGU+LhpPjNIQkjgIKPExP0qEEWmErP3djKC2LwCghInZz5hAbGZBSwkpl7Zzwhh
 y0s0b50N1ssioCrxePERJhCbTUBTYv6lg0D1HBwiQPFZi/hBdjELbGWUuP10PdgcYQEPia2v
 9oLZ/ALCEp/uXmQFsTkFrCWm/7gEdU+axJXpE9kgbnCR+PrlDjvEbSoSH34/ALNFBZQlXpyY
 zjqBUWgWklNnITl1FpJTFzAyr2IUSCwz1stMLtZLyy8qydBLL9rECI6Nub47GM8tsD/EKMDB
 qMTDO0FxW7QQa2JZcWXuIUYJDmYlEd7mfKAQb0piZVVqUX58UWlOavEhRmkOFiVx3sMvwoOE
 BNITS1KzU1MLUotgskwcnFINjAt3C6i6mX7KUwxdPonrwpSQpnUff6Z4zHK7lTNJa8V/ed20
 7xMY39uqMtyalNsrP7Nr59wEFYOgKdv4TiTuSO9fuT/+zfJG52TG9/HPNglFxk78K9wg9CR5
 SnTyJhWWPafto18+andPOz534v59b3ymd5/cUxFsuE0xY96/zQY12z7KOzjsmKzEUpyRaKjF
 XFScCADPaaVgiQIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181004_131507_128849_F09232E8 
X-CRM114-Status: GOOD (  19.57  )
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
Cc: devicetree@vger.kernel.org, palmer@sifive.com, robh+dt@kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 frowand.list@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181004201447.qRNewgCVLwNqOCxr2Wx-qHFRUlV36v3WdH4KsBiWe9I@z>

zqPPhM65z4IgMjAxOC0xMC0wNCAyMTo1NCwgQXRpc2ggUGF0cmEgzq3Os8+BzrHPiM61Ogo+IE9u
IDEwLzQvMTggNTo0NiBBTSwgTmljayBLb3NzaWZpZGlzIHdyb3RlOgo+PiBUaGUgL2Nob3NlbiBu
b2RlIGlzIG9wdGlvbmFsIHNvIHdlIHNob3VsZCBoYW5kbGUgQ01ETElORSByZWdhcmRsZXNzCj4+
IHRoZSBwcmVzZW5jZSBvZiAvY2hvc2VuL2Jvb3RhcmdzLiBNb3ZlIGhhbmRsaW5nIG9mIENNRExJ
TkUgaW4KPj4gZWFybHlfaW5pdF9kdF9zY2FuKCkgaW5zdGVhZC4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+Cj4+IAo+PiAtLS0KPj4gICBk
cml2ZXJzL29mL2ZkdC5jIHwgNjkgCj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlv
bnMoKyksIDIxIGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvZmR0
LmMgYi9kcml2ZXJzL29mL2ZkdC5jCj4+IGluZGV4IDgwMGFkMjUyYy4uODY4NDY0YjBiIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL29mL2ZkdC5jCj4+ICsrKyBiL2RyaXZlcnMvb2YvZmR0LmMKPj4g
QEAgLTMxLDYgKzMxLDE0IEBACj4+ICAgICAjaW5jbHVkZSAib2ZfcHJpdmF0ZS5oIgo+PiAgICsj
aWZkZWYgQ09ORklHX0NNRExJTkUKPj4gKyNpZmRlZiBDT05GSUdfQ01ETElORV9GT1JDRQo+PiAr
c3RhdGljIGNvbnN0IGNoYXIgZml4ZWRfY21kbGluZVtdIF9faW5pdGNvbnN0ID0gQ09ORklHX0NN
RExJTkU7Cj4+ICsjZWxzZQo+PiArc3RhdGljIGNoYXIgYnVpbHRpbl9jbWRsaW5lW10gX19pbml0
ZGF0YSA9IENPTkZJR19DTURMSU5FOwo+PiArI2VuZGlmCj4+ICsjZW5kaWYKPj4gKwo+PiAgIC8q
Cj4+ICAgICogb2ZfZmR0X2xpbWl0X21lbW9yeSAtIGxpbWl0IHRoZSBudW1iZXIgb2YgcmVnaW9u
cyBpbiB0aGUgL21lbW9yeSAKPj4gbm9kZQo+PiAgICAqIEBsaW1pdDogbWF4aW11bSBlbnRyaWVz
Cj4+IEBAIC0xMDg4LDI4ICsxMDk2LDEwIEBAIGludCBfX2luaXQgZWFybHlfaW5pdF9kdF9zY2Fu
X2Nob3Nlbih1bnNpZ25lZCAKPj4gbG9uZyBub2RlLCBjb25zdCBjaGFyICp1bmFtZSwKPj4gICAg
IAkvKiBSZXRyaWV2ZSBjb21tYW5kIGxpbmUgKi8KPj4gICAJcCA9IG9mX2dldF9mbGF0X2R0X3By
b3Aobm9kZSwgImJvb3RhcmdzIiwgJmwpOwo+PiAtCWlmIChwICE9IE5VTEwgJiYgbCA+IDApCj4+
ICsJaWYgKHAgIT0gTlVMTCAmJiBsID4gMCkgewo+PiAgIAkJc3RybGNweShkYXRhLCBwLCBtaW4o
KGludClsLCBDT01NQU5EX0xJTkVfU0laRSkpOwo+PiAtCj4+IC0JLyoKPj4gLQkgKiBDT05GSUdf
Q01ETElORSBpcyBtZWFudCB0byBiZSBhIGRlZmF1bHQgaW4gY2FzZSBub3RoaW5nIGVsc2UKPj4g
LQkgKiBtYW5hZ2VkIHRvIHNldCB0aGUgY29tbWFuZCBsaW5lLCB1bmxlc3MgQ09ORklHX0NNRExJ
TkVfRk9SQ0UKPj4gLQkgKiBpcyBzZXQgaW4gd2hpY2ggY2FzZSB3ZSBvdmVycmlkZSB3aGF0ZXZl
ciB3YXMgZm91bmQgZWFybGllci4KPj4gLQkgKi8KPj4gLSNpZmRlZiBDT05GSUdfQ01ETElORQo+
PiAtI2lmIGRlZmluZWQoQ09ORklHX0NNRExJTkVfRVhURU5EKQo+PiAtCXN0cmxjYXQoZGF0YSwg
IiAiLCBDT01NQU5EX0xJTkVfU0laRSk7Cj4+IC0Jc3RybGNhdChkYXRhLCBDT05GSUdfQ01ETElO
RSwgQ09NTUFORF9MSU5FX1NJWkUpOwo+PiAtI2VsaWYgZGVmaW5lZChDT05GSUdfQ01ETElORV9G
T1JDRSkKPj4gLQlzdHJsY3B5KGRhdGEsIENPTkZJR19DTURMSU5FLCBDT01NQU5EX0xJTkVfU0la
RSk7Cj4+IC0jZWxzZQo+PiAtCS8qIE5vIGFyZ3VtZW50cyBmcm9tIGJvb3QgbG9hZGVyLCB1c2Ug
a2VybmVsJ3MgIGNtZGwqLwo+PiAtCWlmICghKChjaGFyICopZGF0YSlbMF0pCj4+IC0JCXN0cmxj
cHkoZGF0YSwgQ09ORklHX0NNRExJTkUsIENPTU1BTkRfTElORV9TSVpFKTsKPj4gLSNlbmRpZgo+
PiAtI2VuZGlmIC8qIENPTkZJR19DTURMSU5FICovCj4+IC0KPj4gLQlwcl9kZWJ1ZygiQ29tbWFu
ZCBsaW5lIGlzOiAlc1xuIiwgKGNoYXIqKWRhdGEpOwo+PiArCQlwcl9kZWJ1ZygiR290IGJvb3Rh
cmdzOiAlc1xuIiwgKGNoYXIgKikgZGF0YSk7Cj4+ICsJfQo+PiAgICAgCS8qIGJyZWFrIG5vdyAq
Lwo+PiAgIAlyZXR1cm4gMTsKPj4gQEAgLTEyNDAsNiArMTIzMCw0MyBAQCBib29sIF9faW5pdCBl
YXJseV9pbml0X2R0X3NjYW4odm9pZCAqcGFyYW1zKQo+PiAgIAkJcmV0dXJuIGZhbHNlOwo+PiAg
ICAgCWVhcmx5X2luaXRfZHRfc2Nhbl9ub2RlcygpOwo+PiArCj4+ICsJLyoKPj4gKwkgKiBUaGUg
L2Nob3NlbiBub2RlIG5vcm1hbHkgY29udGFpbnMgdGhlIGJvb3RhcmdzIGVsZW1lbnQKPiAKPiAv
cy9ub3JtYWx5L25vcm1hbGx5Cj4gCgpBQ0sKCj4+ICsJICogdGhhdCBpbmNsdWRlcyB0aGUga2Vy
bmVsJ3MgY29tbWFuZCBsaW5lIHBhcmFtZXRlcnMuCj4+ICsJICogSG93ZXZlciB0aGUgcHJlc2Vu
Y2Ugb2YgL2Nob3NlbiBpcyBub3QgbWFuZGF0b3J5IHNvCj4+ICsJICogaW4gY2FzZSB3ZSBkaWRu
J3QgZ2V0IGEgY29tbWFuZCBsaW5lIHdoZW4gc2Nhbm5pbmcKPj4gKwkgKiBub2RlcyBhYm92ZSwg
d2Ugc2hvdWxkIHByb3ZpZGUgb25lIGhlcmUgYmVmb3JlIHdlCj4+ICsJICogcmV0dXJuLCBpZiBw
b3NzaWJsZS4KPj4gKwkgKgo+PiArCSAqIFRoZSBidWlsdC1pbiBjb21tYW5kIGxpbmUgY2FuIGJl
IHVzZWQgYXMgYSBkZWZhdWx0Cj4+ICsJICogY29tbWFuZCBsaW5lIGluIGNhc2Ugd2UgcmVjZWl2
ZWQgbm90aGluZyBmcm9tIHRoZQo+PiArCSAqIGRldmljZSB0cmVlL2Jvb3Rsb2FkZXIuIEl0IGNh
biBhbHNvIGJlIHVzZWQgZm9yCj4+ICsJICogZXh0ZW5kaW5nIG9yIHJlcGxhY2luZyB0aGUgcmVj
ZWl2ZWQgY29tbWFuZCBsaW5lLgo+PiArCSAqLwo+PiArI2lmZGVmIENPTkZJR19DTURMSU5FCj4+
ICsjaWYgZGVmaW5lZChDT05GSUdfQ01ETElORV9FWFRFTkQpCj4+ICsJLyoKPj4gKwkgKiBPcmRl
ciBvZiBwYXJhbWV0ZXJzIHNob3VsZG4ndCBtYXR0ZXIgZm9yIG1vc3QgY2FzZXMsCj4+ICsJICog
c28gcHJlcGVuZGluZyBvciBhcHBlbmRpbmcgdGhlIGJ1aWx0LWluIGNvbW1hbmQgbGluZQo+PiAr
CSAqIHNob3VsZG4ndCBtYWtlIGEgZGlmZmVyZW5jZS4gSW4gY2FzZXMgd2hlcmUgaXQgZG9lcwo+
PiArCSAqIGl0J3MgdXAgdG8gdGhlIHVzZXIgdG8gY29uZmlndXJlIHRoZSBrZXJuZWwgYW5kL29y
Cj4+ICsJICogdGhlIGJvb3Rsb2FkZXIgcHJvcGVybHkuCj4+ICsJICovCj4+ICsJaWYgKGJ1aWx0
aW5fY21kbGluZVswXSkgewo+PiArCQlzdHJsY2F0KGJvb3RfY29tbWFuZF9saW5lLCAiICIsIENP
TU1BTkRfTElORV9TSVpFKTsKPj4gKwkJc3RybGNhdChib290X2NvbW1hbmRfbGluZSwgYnVpbHRp
bl9jbWRsaW5lLCBDT01NQU5EX0xJTkVfU0laRSkKPj4gKwl9Cj4+ICsjZWxpZiBkZWZpbmVkKENP
TkZJR19DTURMSU5FX0ZPUkNFKQo+PiArCWlmIChmaXhlZF9jbWRsaW5lWzBdKQo+PiArCQlzdHJs
Y3B5KGJvb3RfY29tbWFuZF9saW5lLCBmaXhlZF9jbWRsaW5lLCBDT01NQU5EX0xJTkVfU0laRSk7
Cj4+ICsjZWxzZQo+PiArCS8qIE5vIGFyZ3VtZW50cyBmcm9tIGJvb3QgbG9hZGVyLCB1c2Uga2Vy
bmVsJ3MgY21kbGluZSAqLwo+PiArCWlmICghYm9vdF9jb21tYW5kX2xpbmVbMF0gJiYgYnVpbHRp
bl9jbWRsaW5lWzBdKQo+PiArCQlzdHJsY3B5KGJvb3RfY29tbWFuZF9saW5lLCBidWlsdGluX2Nt
ZGxpbmUsIENPTU1BTkRfTElORV9TSVpFKTsKPj4gKyNlbmRpZgo+PiArI2VuZGlmIC8qIENPTkZJ
R19DTURMSU5FICovCj4+ICsKPiAKPiBBbnkgc3BlY2lmaWMgcmVhc29uIGZvciBkb2luZyB0aGlz
IGluIGVhcmx5X2luaXRfZHRfc2NhbiBpbnN0ZWFkIG9mCj4gZWFybHlfaW5pdF9kdF9zY2FuX2No
b3Nlbj8KPiBJIHRoaW5rIGtlZXBpbmcgYWxsIGJvb3QgY29tbWFuZCBsaW5lIG1vZGlmaWNhdGlv
bnMgYXQgb25lIHBsYWNlIG1ha2VzCj4gbW9yZSBzZW5zZS4KPiAKPiBSZWdhcmRzLAo+IEF0aXNo
CgpXaGVuIHBhcnNpbmcgdGhlIGRldmljZSB0cmVlIHRocm91Z2ggZWFybHlfaW5pdF9kdF9zY2Fu
LCBhZnRlciB2ZXJpZnlpbmcgCnRoZSBmZHQgZmlsZSdzCmludGVncml0eSwgdGhlIGNvZGUgd2ls
bCBzdGFydCB0cmF2ZXJzaW5nIHRocm91Z2ggdGhlIHZhcmlvdXMgbm9kZXMgb2YgCnRoZSB0cmVl
IHVzaW5nCm9mX3NjYW5fZmxhdF9kdCAob24gdGhlIHNhbWUgZmlsZSBJIHBhdGNoZWQpLiBUaGF0
IGZ1bmN0aW9uIGdldHMgYSAKcG9pbnRlciB0byBhIHNlYXJjaApmdW5jdGlvbiBhcyBpdHMgZmly
c3QgYXJndW1lbnQgYW5kIHRoZSBzZWNvbmQgYXJndW1lbnQgaXMgYW4gYXV4aWxpYXJ5IApidWZm
ZXIuIFRoZQpzZWFyY2ggZnVuY3Rpb24gd2lsbCBydW4gZm9yIGFsbCBub2RlcyBvbiB0aGUgdHJl
ZSB1bnRpbCBpdCByZWFjaGVzIHRoZSAKZXhwZWN0ZWQgbm9kZQppbiB3aGljaCBjYXNlIGl0IHJl
dHVybnMgMSBhbmQgdGhlIHNlYXJjaCB3aWxsIGVuZC4KCklmIHdlIGRvIHRoZSB0d2Vha2luZyBv
ZiB0aGUgY29tbWFuZCBsaW5lIGluc2lkZSAKZWFybHlfaW5pdF9kdF9zY2FuX2Nob3NlbiBiZWZv
cmUgdGhlCmNoZWNrIGlzIGRvbmUsIHdlJ2xsIG1lc3MgdXAgdGhlIGNvbW1hbmQgbGluZSBiYWRs
eSBzaW5jZSB3ZSdsbCBiZSAKdHdlYWtpbmcgaXQKZm9yIGV2ZXJ5IG5vZGUgb24gdGhlIHRyZWUg
KHVudGlsIHdlIHJlYWNoIHRoZSAvY2hvc2VuIG5vZGUsIGlmIHdlIHJlYWNoIAppdCkuIElmIHdl
IGRvCml0IGFmdGVyIHRoZSBjaGVjayAtd2hpY2ggaXMgd2hhdCdzIGhhcHBlbmluZyBub3ctIHdl
IG1pZ2h0IG5vdCByZWFjaCAKdGhlIGNvZGUgc2luY2UKdGhlIC9jaG9zZW4gbm9kZSBpcyBvcHRp
b25hbCBzbyB0aGUgY2hlY2sgbWF5IG5ldmVyIHN1Y2NlZWQuIFNvIHdlIG5lZWQgCnRvIGRvIHRo
ZSBjaGVjawphZnRlciB0aGUgc2VhcmNoIGZpbmlzaGVzLiBJIGNob3NlIHRvIGRvIGl0IG9uIGVh
cmx5X2luaXRfZHRfc2NhbiBzaW5jZSAKaXQncyBzb21ldGhpbmcKdGhhdCBJTUhPIHNob3VsZCBi
ZSBjaGVja2VkIGJlZm9yZSB0aGF0IGZ1bmN0aW9uIHJldHVybnMuCgpSZWdhcmRzLApOaWNrCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
