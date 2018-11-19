Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5960BC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 22:51:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2598820851
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 22:51:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZYFVymvi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rh1uBRcK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2598820851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Y8aal2qV49bictcCBOgAoouI89lifUcgraPsxAUwjk=; b=ZYFVymvisQMXnkWE6cgdcJQCK
	CRzKg2JBwBI8WBl7sJlWhIfYuvI73w35yTQDb9amia8fbxsQfLi1nZE9H6lYP22YHTJPX6YVx4dN7
	kBex+yPjtKnuD3W/2PB+qxyy+Yr9j+7ytOLburpxRaV4mmmqfgNsc0nU4xnDMrxEuUTyE2GUXMMJR
	YK0jEkQYOCPJzFh0hSY7EiHeEwA5VNid49mrhF2pJXQJ16TgXQbIC/g51DDjpRkl1XyKn2IB+TWtr
	CE+uszjvx5DeYmaN4bwWgWk0lglaUGE8X1Bn8hgU1VR791aryBu9CZbbf3AAV47Sn3qA0moExDAwd
	S7Iay/y9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOsOW-0003CQ-PI; Mon, 19 Nov 2018 22:51:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOsOV-0003CK-Nv
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 22:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DZcGcz3/FWsiwYbs8rJvoJxuy9WdSt9JxxDV17woAnE=; b=rh1uBRcKCPojBzj/bCUzMuMwf2
 tqpCoWWAHwqovh0nbsEfNRoDZnI/baQW3CAbaMgXuAoZ6AgZeLueLXvTlFNuhQfZFCZDFHLks5QRQ
 Ew6fy7zksAHniJkfRprYSDAMdLWjd7Etp+YL4Rnn3lP8WG6e6q0OKPXZVPQM/cZMaOsUUuhrsI7Tu
 QjoHn1gysXDfygsM1OFWkho8Dhyq34tMcknfNrXm6CHpEF/apanvHUVPB5pkRU2r+891McnQ8J18y
 uQKab7RdT6ApwRR3oFWEg2CXRPW0OwiJ9sgfFM8yblInwDQUv2lpb2o3jf1BaA4mQnmOPu7WbpaYA
 8Jojb8NA==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOsOS-0002yJ-N5
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 22:51:50 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAJMoKJn072539; Tue, 20 Nov 2018 00:50:22 +0200 (EET)
X-AuditID: 8b5b9d4d-903ff70000000e62-d6-5bf33e2bf18d
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 78.76.03682.B2E33FB5; Tue, 20 Nov 2018 00:50:19 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wAJMoIki018676; Tue, 20 Nov 2018 00:50:19 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 20 Nov 2018 00:50:18 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v3] RISC-V: Update Kconfig to better handle CMDLINE
Organization: FORTH
In-Reply-To: <mhng-236f884c-259b-4653-8aa0-5af7ffc205f7@palmer-si-x1c4>
References: <mhng-236f884c-259b-4653-8aa0-5af7ffc205f7@palmer-si-x1c4>
Message-ID: <0a4077db535beddb2fcb251cad9380ac@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsXSHc2orKtt9zna4PsJBYutv2exW6w/+YnF
 YtvnFjaL5nfn2C02T1jA6sDqcbjjC7vHzll32T0ebrrE5LF5Sb3Hpebr7AGsUVw2Kak5mWWp
 Rfp2CVwZfbMTC/bKVzw98YW1gfGqRBcjJ4eEgInEtE8nmbsYuTiEBI4wSvzq/ckE4RxilFix
 bjsTRJWpxOy9nYwgNq+AoMTJmU9YQGxmAQuJqVf2M0LY8hLNW2czg9gsAqoSzac/g/WyCWhK
 zL90EKxeREBN4lDTEaj6HIk7PyaD1QsLuEvs+v4GrIZfQFji092LrCA2J1C871k72BwhATeJ
 R4fvM0Pc4CKx9dEDdojbVCQ+/IawRQWUJV6cmM46gVFoFpJTZyE5dRaSUxcwMq9iFEgsM9bL
 TC7WS8svKsnQSy/axAgO+7m+OxjPLbA/xCjAwajEwytg/jlaiDWxrLgyFxgwHMxKIrwByz5F
 C/GmJFZWpRblxxeV5qQWH2KU5mBREuc9/CI8SEggPbEkNTs1tSC1CCbLxMEp1cDow/jv3qWE
 yLt1D/yOb//ofGT2vYozT3rKfjY9On3B4PJiyZ2vTwdsZZeO+Db3vYlUnJvEO55K/Uz9pOeJ
 VbHnZBuUZE6wvubrk934SqRk7pX2Ey+uPTrByLjzW/Mka/l56YdeG7ldnjLdQicwJ6LNymzX
 6sIus88xLOaB0r+yW8p0lp8ILritxFKckWioxVxUnAgA8ZIb5HcCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_225148_958089_9BE5ADBC 
X-CRM114-Status: GOOD (  24.39  )
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
Cc: mick@ics.forth.gr, dmaliotaki@gmail.com, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119225018.yAkCSg8bVGlOGS6Lp66DMZrzA-3lYv8cS8Rtpo8ICzk@z>

zqPPhM65z4IgMjAxOC0xMS0xOSAyMzowNSwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIFNhdCwgMTcgTm92IDIwMTggMTY6MDY6NTYgUFNUICgtMDgwMCksIG1pY2tAaWNzLmZvcnRo
LmdyIHdyb3RlOgo+PiBBZGRlZCBhIG1lbnUgdG8gY2hvb3NlIGhvdyB0aGUgYnVpbHQtaW4gY29t
bWFuZCBsaW5lIHdpbGwgYmUKPj4gdXNlZCBhbmQgQ01ETElORV9FWFRFTkQgZm9yIGNvbXBhdGli
aWxpdHkgd2l0aCBGRFQgY29kZS4KPj4gCj4+IHYyOiBJbXByb3ZlZCBoZWxwIG1lc3NhZ2VzLCBy
ZW1vdmVkIHJlZmVyZW5jZXMgdG8gYm9vdGxvYWRlcgo+PiBhbmQgbWFkZSB0aGVtIG1vcmUgZGVz
Y3JpcHRpdmUuIEkgYWxzbyBhc2tlZCBoZWxwIGZyb20gYQo+PiBmcmllbmQgd2hvJ3MgYSBsYW5n
dWFnZSBleHBlcnQganVzdCBpbiBjYXNlLgo+PiAKPj4gdjM6IFRoaXMgdGltZSB1c2VkIHRoZSBj
b3JyZWN0ZWQgdGV4dAo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTmljayBLb3NzaWZpZGlzIDxtaWNr
QGljcy5mb3J0aC5ncj4KPj4gU2lnbmVkLW9mZi1ieTogRGViYmllIE1hbGlvdGFraSA8ZG1hbGlv
dGFraUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9LY29uZmlnIHwgNTcgCj4+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAg
MSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+PiAKPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBp
bmRleCA1NWRhOTNmNGUuLjgwODYyNGY2YiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9LY29u
ZmlnCj4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBAQCAtMjI3LDM5ICsyMjcsNDggQEAg
ZW5kbWVudQo+PiAKPj4gIG1lbnUgIkJvb3Qgb3B0aW9ucyIKPj4gCj4+IC1jb25maWcgQ01ETElO
RV9CT09MCj4+IC0JYm9vbCAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgbGluZSIKPj4gK2NvbmZp
ZyBDTURMSU5FCj4+ICsJc3RyaW5nICJCdWlsdC1pbiBrZXJuZWwgY29tbWFuZCBsaW5lIgo+PiAg
CWhlbHAKPj4gLQkgIEZvciBtb3N0IHBsYXRmb3JtcywgaXQgaXMgZmlybXdhcmUgb3Igc2Vjb25k
IHN0YWdlIGJvb3Rsb2FkZXIKPj4gLQkgIHRoYXQgYnkgZGVmYXVsdCBzcGVjaWZpZXMgdGhlIGtl
cm5lbCBjb21tYW5kIGxpbmUgb3B0aW9ucy4KPj4gLQkgIEhvd2V2ZXIsIGl0IG1pZ2h0IGJlIG5l
Y2Vzc2FyeSBvciBhZHZhbnRhZ2VvdXMgdG8gZWl0aGVyIG92ZXJyaWRlCj4+IC0JICB0aGUgZGVm
YXVsdCBrZXJuZWwgY29tbWFuZCBsaW5lIG9yIGFkZCBhIGZldyBleHRyYSBvcHRpb25zIHRvIGl0
Lgo+PiAtCSAgRm9yIHN1Y2ggY2FzZXMsIHRoaXMgb3B0aW9uIGFsbG93cyBoYXJkY29kaW5nIGNv
bW1hbmQgbGluZSBvcHRpb25zCj4+IC0JICBkaXJlY3RseSBpbnRvIHRoZSBrZXJuZWwuCj4+ICsJ
ICBGb3IgbW9zdCBwbGF0Zm9ybXMsIHRoZSBhcmd1bWVudHMgZm9yIHRoZSBrZXJuZWwncyBjb21t
YW5kIGxpbmUKPj4gKwkgIGFyZSBwcm92aWRlZCBhdCBydW4tdGltZSwgZHVyaW5nIGJvb3QuIEhv
d2V2ZXIsIHRoZXJlIGFyZSBjYXNlcwo+PiArCSAgd2hlcmUgZWl0aGVyIG5vIGFyZ3VtZW50cyBh
cmUgYmVpbmcgcHJvdmlkZWQgb3IgdGhlIHByb3ZpZGVkCj4+ICsJICBhcmd1bWVudHMgYXJlIGlu
c3VmZmljaWVudCBvciBldmVuIGludmFsaWQuCj4+IAo+PiAtCSAgRm9yIHRoYXQsIGNob29zZSAn
WScgaGVyZSBhbmQgZmlsbCBpbiB0aGUgZXh0cmEgYm9vdCBwYXJhbWV0ZXJzCj4+IC0JICBpbiBD
T05GSUdfQ01ETElORS4KPj4gKwkgIFdoZW4gdGhhdCBvY2N1cnMsIGl0IGlzIHBvc3NpYmxlIHRv
IGRlZmluZSBhIGJ1aWx0LWluIGNvbW1hbmQKPj4gKwkgIGxpbmUgaGVyZSBhbmQgY2hvb3NlIGhv
dyB0aGUga2VybmVsIHNob3VsZCB1c2UgaXQgbGF0ZXIgb24uCj4+IAo+PiAtCSAgVGhlIGJ1aWx0
LWluIG9wdGlvbnMgd2lsbCBiZSBjb25jYXRlbmF0ZWQgdG8gdGhlIGRlZmF1bHQgY29tbWFuZAo+
PiAtCSAgbGluZSBpZiBDTURMSU5FX0ZPUkNFIGlzIHNldCB0byAnTicuIE90aGVyd2lzZSwgdGhl
IGRlZmF1bHQKPj4gLQkgIGNvbW1hbmQgbGluZSB3aWxsIGJlIGlnbm9yZWQgYW5kIHJlcGxhY2Vk
IGJ5IHRoZSBidWlsdC1pbiBzdHJpbmcuCj4+ICtjaG9pY2UKPj4gKwlwcm9tcHQgIkJ1aWx0LWlu
IGNvbW1hbmQgbGluZSB1c2FnZSIgaWYgQ01ETElORSAhPSAiIgo+PiArCWRlZmF1bHQgQ01ETElO
RV9GQUxMQkFDSwo+PiArCWhlbHAKPj4gKwkgIENob29zZSBob3cgdGhlIGtlcm5lbCB3aWxsIGhh
bmRsZSB0aGUgcHJvdmlkZWQgYnVpbHQtaW4gY29tbWFuZAo+PiArCSAgbGluZS4KPj4gCj4+IC1j
b25maWcgQ01ETElORQo+PiAtCXN0cmluZyAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgc3RyaW5n
Igo+PiAtCWRlcGVuZHMgb24gQ01ETElORV9CT09MCj4+IC0JZGVmYXVsdCAiIgo+PiArY29uZmln
IENNRExJTkVfRkFMTEJBQ0sKPj4gKwlib29sICJGYWxsYmFjayIKPj4gIAloZWxwCj4+IC0JICBT
dXBwbHkgY29tbWFuZC1saW5lIG9wdGlvbnMgYXQgYnVpbGQgdGltZSBieSBlbnRlcmluZyB0aGVt
IGhlcmUuCj4+ICsJICBVc2UgdGhlIGJ1aWx0LWluIGNvbW1hbmQgbGluZSBhcyBmYWxsYmFjayBp
biBjYXNlIHdlIGdldCBub3RoaW5nCj4+ICsJICBkdXJpbmcgYm9vdC4gVGhpcyBpcyB0aGUgZGVm
YXVsdCBiZWhhdmlvdXIuCj4+ICsKPj4gK2NvbmZpZyBDTURMSU5FX0VYVEVORAo+PiArCWJvb2wg
IkV4dGVuc2lvbiIKPj4gKwloZWxwCj4+ICsJICBUaGUgY29tbWFuZC1saW5lIGFyZ3VtZW50cyBw
cm92aWRlZCBkdXJpbmcgYm9vdCB3aWxsIGJlCj4+ICsJICBhcHBlbmRlZCB0byB0aGUgYnVpbHQt
aW4gY29tbWFuZCBsaW5lLiBUaGlzIGlzIHVzZWZ1bCBpbgo+PiArCSAgY2FzZXMgd2hlcmUgdGhl
IHByb3ZpZGVkIGFyZ3VtZW50cyBhcmUgaW5zdWZmaWNpZW50IGFuZAo+PiArCSAgeW91IGRvbid0
IHdhbnQgdG8gb3IgY2Fubm90IG1vZGlmeSB0aGVtLgo+PiArCj4+IAo+PiAgY29uZmlnIENNRExJ
TkVfRk9SQ0UKPj4gLQlib29sICJCdWlsdC1pbiBjb21tYW5kIGxpbmUgb3ZlcnJpZGVzIGJvb3Rs
b2FkZXIgYXJndW1lbnRzIgo+PiAtCWRlcGVuZHMgb24gQ01ETElORV9CT09MCj4+ICsJYm9vbCAi
Rm9yY2VkIgo+PiAgCWhlbHAKPj4gLQkgIFNldCB0aGlzIG9wdGlvbiB0byAnWScgdG8gaGF2ZSB0
aGUga2VybmVsIGlnbm9yZSB0aGUgYm9vdGxvYWRlcgo+PiAtCSAgb3IgZmlybXdhcmUgY29tbWFu
ZCBsaW5lLiAgSW5zdGVhZCwgdGhlIGJ1aWx0LWluIGNvbW1hbmQgbGluZQo+PiAtCSAgd2lsbCBi
ZSB1c2VkIGV4Y2x1c2l2ZWx5Lgo+PiArCSAgQWx3YXlzIHVzZSB0aGUgYnVpbHQtaW4gY29tbWFu
ZCBsaW5lLCBldmVuIGlmIHdlIGdldCBvbmUgZHVyaW5nCj4+ICsJICBib290LiBUaGlzIGlzIHVz
ZWZ1bCBpbiBjYXNlIHlvdSBuZWVkIHRvIG92ZXJyaWRlIHRoZSBwcm92aWRlZAo+PiArCSAgY29t
bWFuZCBsaW5lIG9uIHN5c3RlbXMgd2hlcmUgeW91IGRvbid0IGhhdmUgb3Igd2FudCBjb250cm9s
Cj4+ICsJICBvdmVyIGl0Lgo+PiAKPj4gLQkgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8g
aGVyZSwgc2F5IE4uCj4+ICtlbmRjaG9pY2UKPj4gCj4+ICBlbmRtZW51Cj4gCj4gVGhhbmtzLCBi
dXQgSSBzdGlsbCBkb24ndCBsaWtlIHRoZSBuYW1lcyBvZiB0aGUgb3B0aW9ucy4gIEkndmUganVz
dAo+IGdvbmUgYWhlYWQgYW5kIHNlbnQgYSB2NCwgbGV0IG1lIGtub3cgaWYgdGhhdCBsb29rcyBP
SyB0byB5b3UgLS0KPiB0aGF0J3Mgd2hhdCBJIHdhcyB0cnlpbmcgdG8gc2F5IHRoZSBmaXJzdCB0
aW1lLgoKQUNLLCBtdWNoIGJldHRlciBpbmRlZWQsIHNvcnJ5IGZvciB0aGUgbWVzcy4uLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
