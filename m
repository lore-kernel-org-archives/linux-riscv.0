Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0F5C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 02:06:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7181C2070E
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 02:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SZLRWRP7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7181C2070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/WwjI5HeGw4WChjbWxscjOpBkdpV6pZRkkr3g7Vjf+c=; b=SZLRWRP7bSq2uifkpRoIkYiTw
	2UWzd2ohY/WQbIgPqsQWLX7rGs8Un4AJUb7cDpvq4JpPfupuS2XkSjnYkl5lgBP1NwaOMt0M7RQtt
	lxOPkAaVnXlEnu1tfB64/3snGjiPJsItknRd6nocqpqLseT0P+lL+sNjgwxuYBHbD1L3z1X5S9nU8
	bTKikrABJm9m2AYiYQXzCgC9VRX6zLZi5BR8QMf8cdxd165onuZ1QyedR25cgGEohW631uLJ/ThA0
	Gcek3C85VLZOo8l8BuDHrqGAOgN1cp/Yuno+QsGmiDXzvPOAzJ+NKMhY0rIq5A2hQw4gIkaEAH4dd
	PzMhvqnag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtiQC-00033C-S2; Fri, 10 Jul 2020 02:05:52 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtiQ8-00032f-Qp
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 02:05:51 +0000
Received: from av3.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 06A25UB9024578; Fri, 10 Jul 2020 02:05:32 GMT
X-AuditID: 8b5b014d-241ff700000045c5-78-5f07ccea105d
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 DC.64.17861.AECC70F5; Fri, 10 Jul 2020 05:05:30 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 10 Jul 2020 05:05:30 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 1/2] riscv: Register System RAM as iomem resources
Organization: FORTH
In-Reply-To: <mhng-cd7e19bb-859a-45a4-90e8-7851c4fb3083@palmerdabbelt-glaptop1>
References: <mhng-cd7e19bb-859a-45a4-90e8-7851c4fb3083@palmerdabbelt-glaptop1>
Message-ID: <6d5006efde7affcb3307f5dcb85af7aa@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.9
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCLMWRmVeSWpSXmKPExsXSHT1dWffVGfZ4g5U3DSwu75rDZrHtcwub
 xcvLPcwWbbP4LT7cnc3mwOrx5uVLFo/NS+o9LjVfZ/f4vEkugCWKyyYlNSezLLVI3y6BK+PN
 tKeMBReUKnY9vczYwHhbuouRk0NCwETiwPQG5i5GLg4hgaOMEg86V7JCJEwlZu/tZASxeQUE
 JU7OfMICYjMLWEhMvbKfEcKWl2jeOpsZxGYRUJX4OvMImM0moCkx/9JBsHoRAXWJA6/vgC1g
 FuhglDj/FSIhLOAm8erfXjCbX0BY4tPdi2CLOQX8JXpfvARawAF0kZ9E84YSiBtcJG5Oes0M
 cZuKxIffD9hBbFEBZYmbh5+zT2AUnIXk1FlITp2F5NQFjMyrGAUSy4z1MpOL9dLyi0oy9NKL
 NjGCA5rRdwfj7c1v9Q4xMnEwHmKU4GBWEuE1UGSNF+JNSaysSi3Kjy8qzUktPsQozcGiJM6b
 x708VkggPbEkNTs1tSC1CCbLxMEp1cBUUWS2PnpWA1so06GYmJO2r23CN05eFjX7mkFd2OGc
 Y9Gmh4r8+1oC/yetfx6xQp1xaWSBxPfYsxXLT1Zejt8d657keNff+Ia2cQeD3Wn3a6xrdvFx
 6722Vjw9T3DjhYJPdTlCNb8lfj8I13KxL/wjynTqxvOyR0UuBZ2OS2fsLL84uyzuW0lUq9h+
 EZk696iTjNkHTinX9v+YfMK6WW3fKnfrBaHN7xjvyfxnsUvy5pP8VVgievKM9dJKm3Unvth3
 iFS1z+7YvELtrKOQ6DymEGmzgjs2r13jb7bOszHa51g7N7PxxiL7By2LzsmmrVvx4di/jdIv
 7shNMq5MSUhxyrvk9WCxpfHX0H6neUosxRmJhlrMRcWJAAkiNnXXAgAA
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Fri, 10 Jul 2020 02:05:32 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av3.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Fri, 10 Jul 2020 02:05:32 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_220549_186428_A13F5B38 
X-CRM114-Status: GOOD (  21.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMC0wNy0wOSAyMToyNywgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIFR1ZSwgMTYgSnVuIDIwMjAgMDA6NDU6NDYgUERUICgtMDcwMCksIHpvbmcubGlAc2lmaXZl
LmNvbSB3cm90ZToKPj4gQWRkIFN5c3RlbSBSQU0gdG8gL3Byb2MvaW9tZW0sIHZhcmlvdXMgdG9v
bHMgZXhwZWN0IGl0IHN1Y2ggYXMga2R1bXAuCj4+IEl0IGlzIGFsc28gbmVlZGVkIGZvciBwYWdl
X2lzX3JhbSBBUEkgd2hpY2ggY2hlY2tzIHRoZSBzcGVjaWZpZWQgCj4+IGFkZHJlc3MKPj4gd2hl
dGhlciByZWdpc3RlcmVkIGFzIFN5c3RlbSBSQU0gaW4gaW9tZW1fcmVzb3VyY2UgbGlzdC4KPj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPj4gLS0tCj4+
ICBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+PiBpbmRleCBmNGFkYjM2ODRm
M2QuLmJiZTgxNmUwM2IyZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4g
KysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4gQEAgLTUxNyw2ICs1MTcsMjcgQEAgdm9pZCBt
YXJrX3JvZGF0YV9ybyh2b2lkKQo+PiAgfQo+PiAgI2VuZGlmCj4+IAo+PiArdm9pZCBfX2luaXQg
cmVzb3VyY2VfaW5pdCh2b2lkKQo+PiArewo+PiArCXN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJl
Z2lvbjsKPj4gKwo+PiArCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnaW9uKSB7Cj4+ICsJ
CXN0cnVjdCByZXNvdXJjZSAqcmVzOwo+PiArCj4+ICsJCXJlcyA9IG1lbWJsb2NrX2FsbG9jKHNp
emVvZihzdHJ1Y3QgcmVzb3VyY2UpLCBTTVBfQ0FDSEVfQllURVMpOwo+PiArCQlpZiAoIXJlcykK
Pj4gKwkJCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICV6dSBieXRlc1xuIiwgX19mdW5j
X18sCj4+ICsJCQkgICAgICBzaXplb2Yoc3RydWN0IHJlc291cmNlKSk7Cj4+ICsKPj4gKwkJcmVz
LT5uYW1lID0gIlN5c3RlbSBSQU0iOwo+PiArCQlyZXMtPnN0YXJ0ID0gCj4+IF9fcGZuX3RvX3Bo
eXMobWVtYmxvY2tfcmVnaW9uX21lbW9yeV9iYXNlX3BmbihyZWdpb24pKTsKPj4gKwkJcmVzLT5l
bmQgPSBfX3Bmbl90b19waHlzKG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfZW5kX3BmbihyZWdpb24p
KSAtIAo+PiAxOwo+PiArCQlyZXMtPmZsYWdzID0gSU9SRVNPVVJDRV9TWVNURU1fUkFNIHwgSU9S
RVNPVVJDRV9CVVNZOwo+IAo+IExvb2tzIGxpa2UgZXZlcnlvbmUgZWxzZSBpcyBjaGVja2luZyBN
RU1CTE9DS19OT01BUCBiZWZvcmUgcmVnaXN0ZXJpbmcgCj4gbWVtb3J5Cj4gcmVnaW9ucy4gIEkn
dmUgYWRkZWQgdGhhdCBhbmQgcHV0IHRoaXMgb24gZm9yLW5leHQuICBUaGFua3MhCj4gCj4gY29t
bWl0IDExZGM2MzJiZjUxNTg3NGM4NDg4NzcyNzYxNGU4MDQ0NDUyZjFmMjgKPiBncGc6IFNpZ25h
dHVyZSBtYWRlIFRodSAwOSBKdWwgMjAyMCAxMToyNDowOCBBTSBQRFQKPiBncGc6ICAgICAgICAg
ICAgICAgIHVzaW5nIFJTQSBrZXkgCj4gMkIzQzM3NDc0NDY4NDNCMjRBOTQzQTdBMkUxMzE5RjM1
RkJCMTg4OQo+IGdwZzogICAgICAgICAgICAgICAgaXNzdWVyICJwYWxtZXJAZGFiYmVsdC5jb20i
Cj4gZ3BnOiBHb29kIHNpZ25hdHVyZSBmcm9tICJQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJl
bHQuY29tPiIgCj4gW3VsdGltYXRlXQo+IGdwZzogICAgICAgICAgICAgICAgIGFrYSAiUGFsbWVy
IERhYmJlbHQgPHBhbG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4iIAo+IFt1bHRpbWF0ZV0KPiBBdXRo
b3I6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiBEYXRlOiAgIFR1ZSBKdW4gMTYgMTU6
NDU6NDYgMjAyMCArMDgwMAo+IAo+ICAgIHJpc2N2OiBSZWdpc3RlciBTeXN0ZW0gUkFNIGFzIGlv
bWVtIHJlc291cmNlcwo+ICAgICAgIEFkZCBTeXN0ZW0gUkFNIHRvIC9wcm9jL2lvbWVtLCB2YXJp
b3VzIHRvb2xzIGV4cGVjdCBpdCBzdWNoIGFzIAo+IGtkdW1wLgo+ICAgIEl0IGlzIGFsc28gbmVl
ZGVkIGZvciBwYWdlX2lzX3JhbSBBUEkgd2hpY2ggY2hlY2tzIHRoZSBzcGVjaWZpZWQgCj4gYWRk
cmVzcwo+ICAgIHdoZXRoZXIgcmVnaXN0ZXJlZCBhcyBTeXN0ZW0gUkFNIGluIGlvbWVtX3Jlc291
cmNlIGxpc3QuCj4gICAgICAgU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUu
Y29tPgo+ICAgIFtQYWxtZXI6IGNoZWNrIE1FTUJMT0NLX05PTUFQXQo+ICAgIFNpZ25lZC1vZmYt
Ynk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+Cj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRl
eCBmNGFkYjM2ODRmM2QuLjhiNzhmZDIzNzEzZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21t
L2luaXQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTUxNyw2ICs1MTcsMzIg
QEAgdm9pZCBtYXJrX3JvZGF0YV9ybyh2b2lkKQo+IH0KPiAjZW5kaWYKPiAKPiArdm9pZCBfX2lu
aXQgcmVzb3VyY2VfaW5pdCh2b2lkKQo+ICt7Cj4gKwlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpy
ZWdpb247Cj4gKwo+ICsJZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWdpb24pIHsKPiArCQlz
dHJ1Y3QgcmVzb3VyY2UgKnJlczsKPiArCj4gKwkJcmVzID0gbWVtYmxvY2tfYWxsb2Moc2l6ZW9m
KHN0cnVjdCByZXNvdXJjZSksIFNNUF9DQUNIRV9CWVRFUyk7Cj4gKwkJaWYgKCFyZXMpCj4gKwkJ
CXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICV6dSBieXRlc1xuIiwgX19mdW5jX18sCj4g
KwkJCSAgICAgIHNpemVvZihzdHJ1Y3QgcmVzb3VyY2UpKTsKPiArCj4gKwkJaWYgKG1lbWJsb2Nr
X2lzX25vbWFwKHJlZ2lvbikgewo+ICsJCQlyZXMtPm5hbWUgPSAicmVzZXJ2ZWQiOwo+ICsJCQly
ZXMtPmZsYWdzID0gSU9SRVNPVVJDRV9NRU07Cj4gKwkJfSBlbHNlIHsKPiArCQkJcmVzLT5uYW1l
ID0gIlN5c3RlbSBSQU0iOwo+ICsJCQlyZXMtPmZsYWdzID0gSU9SRVNPVVJDRV9TWVNURU1fUkFN
IHwgSU9SRVNPVVJDRV9CVVNZOwo+ICsJCX0KPiArCQlyZXMtPnN0YXJ0ID0gX19wZm5fdG9fcGh5
cyhtZW1ibG9ja19yZWdpb25fbWVtb3J5X2Jhc2VfcGZuKHJlZ2lvbikpOwo+ICsJCXJlcy0+ZW5k
ID0gX19wZm5fdG9fcGh5cyhtZW1ibG9ja19yZWdpb25fbWVtb3J5X2VuZF9wZm4ocmVnaW9uKSkg
LSAKPiAxOwo+ICsKPiArCQlyZXF1ZXN0X3Jlc291cmNlKCZpb21lbV9yZXNvdXJjZSwgcmVzKTsK
PiArCX0KPiArfQo+ICsKPiB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQo+IHsKPiAJc2V0
dXBfdm1fZmluYWwoKTsKPiBAQCAtNTI0LDYgKzU1MCw3IEBAIHZvaWQgX19pbml0IHBhZ2luZ19p
bml0KHZvaWQpCj4gCXNwYXJzZV9pbml0KCk7Cj4gCXNldHVwX3plcm9fcGFnZSgpOwo+IAl6b25l
X3NpemVzX2luaXQoKTsKPiArCXJlc291cmNlX2luaXQoKTsKPiB9Cj4gCj4gI2lmZGVmIENPTkZJ
R19TUEFSU0VNRU1fVk1FTU1BUAo+IAo+IAo+PiArCj4+ICsJCXJlcXVlc3RfcmVzb3VyY2UoJmlv
bWVtX3Jlc291cmNlLCByZXMpOwo+PiArCX0KPj4gK30KPj4gKwo+PiAgdm9pZCBfX2luaXQgcGFn
aW5nX2luaXQodm9pZCkKPj4gIHsKPj4gIAlzZXR1cF92bV9maW5hbCgpOwo+PiBAQCAtNTI0LDYg
KzU0NSw3IEBAIHZvaWQgX19pbml0IHBhZ2luZ19pbml0KHZvaWQpCj4+ICAJc3BhcnNlX2luaXQo
KTsKPj4gIAlzZXR1cF96ZXJvX3BhZ2UoKTsKPj4gIAl6b25lX3NpemVzX2luaXQoKTsKPj4gKwly
ZXNvdXJjZV9pbml0KCk7Cj4+ICB9Cj4+IAo+PiAgI2lmZGVmIENPTkZJR19TUEFSU0VNRU1fVk1F
TU1BUAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKClpvbmcgTGkgc2VudCBhIG5ld2VyIHZlcnNpb24gb2YgdGhpcyBzZXJpZXMgd2l0aG91
dCB0aGlzIHBhdGNoLCBzaW5jZSAKSSdtIGhhbmRsaW5nIHRoaXMgb24gdGhlIGtleGVjL2tkdW1w
IHNlcmllcyBhcyB3ZWxsIHdoZXJlIG90aGVyIHNlY3Rpb25zIApuZWVkZWQgZm9yIGtkdW1wIGFy
ZSBhbHNvIHJlZ2lzdGVyZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
