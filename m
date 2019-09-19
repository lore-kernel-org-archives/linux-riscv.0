Return-Path: <SRS0=fbrL=XO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A794BC49ED7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2019 10:30:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AC0521907
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2019 10:30:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QtNCi0Vt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hardenedlinux.org header.i=@hardenedlinux.org header.b="h9Meoilm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AC0521907
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hardenedlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:From:To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UDuGPfH4oJLvi2j9zSuw6dY2SV6bt6G17XjXheqDDs=; b=QtNCi0Vt8nKRLP
	aQKCynHvNgW8Qi06oObXImdA2L/vUV2jHcymftn/+aeggLAKefYuTL6OhH1WOGiAhChF3QDFXydM7
	6Mps5jXEaux6r09A0lHtSUHznr/HLx97LUUbf6cfcwhdBJ/mxgRktnZF7tQuOUASoTL7fM6YsRTZN
	HUdmCGKP03GSOHbA0RJ+osyj36Hlhb6l59qzywy1MRQ+p6Wcm14iSxRSnZuBLwNRN6nwTjhoQCuWT
	SOO8YJxzFg4CX3icl88uiZ0sv+8irXIMM/bfmgQickxL0KcfdOP+rghnfN4goEnIa8ggXdPp/QhKX
	qVN/yvVXXbkcwRM5zvkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAthk-0005xI-1b; Thu, 19 Sep 2019 10:30:28 +0000
Received: from mail-40132.protonmail.ch ([185.70.40.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAthh-0005wp-5L
 for linux-riscv@lists.infradead.org; Thu, 19 Sep 2019 10:30:27 +0000
Date: Thu, 19 Sep 2019 10:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardenedlinux.org;
 s=protonmail; t=1568889022;
 bh=hiwcVYVyjA8rIAfDxqCw5jAP15PD6IpvcY7gJcQeLRw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=h9MeoilmyiThRpXXIznQvZEu05WaaRsTkYkmbaIdTzRfg6CPLp0LSSTgss8sfSrBa
 5JWkj7nP9SSQ/glRfXBu05XhnIf2bXK0RZSLFwPw6FlAHdKEOzuroZqhsZ6RzeQGnB
 Scy381WsKNTdZ18VxQT57InOO0JU2PdCrt5wOq3M=
To: Paul Walmsley <paul.walmsley@sifive.com>
From: Xiang Wang <merle@hardenedlinux.org>
Subject: Re: [PATCH] arch/riscv: disable too many harts before pick main boot
 hart
Message-ID: <oZnw_aigjzhp0LNTjqSVEPWA6nBsFhV4z0KJXsCw9oPg3pGRju1n3kzDin_GH06vl8Jn5MU5keS2LE1FLrPfR3V66b9hkoqKQJ7CZ_tMqUk=@hardenedlinux.org>
In-Reply-To: <alpine.DEB.2.21.9999.1909190324250.10826@viisi.sifive.com>
References: <AMJe39pHTcb4gsI-_Dv-wmR8_x9EbCCN9LKI47j34_8vBKRqzFxPrjmZvBtwV5OU_HcOiRkKUG66xVaNQ8VAXw7Ws0CCK74gpA8pKaYN5wM=@hardenedlinux.org>
 <alpine.DEB.2.21.9999.1909190324250.10826@viisi.sifive.com>
Feedback-ID: BRRa7Rf7LqOlikZR00e5gSr_IsihWq0drDTak4NnawY-ONQTW87vpTHz90bkJTl_rn8r4L6gc-nP1pm37CQtxw==:Ext:ProtonMail
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_033025_659151_DBA6EE6C 
X-CRM114-Status: GOOD (  14.73  )
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
Reply-To: Xiang Wang <merle@hardenedlinux.org>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "citypw@hardenedlinux.org" <citypw@hardenedlinux.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CgoKCgrigJDigJDigJDigJDigJDigJDigJAgT3JpZ2luYWwgTWVzc2FnZSDigJDigJDigJDigJDi
gJDigJDigJAKT24gMjAxOeW5tDnmnIgxOeaXpVRodXJzZGF5UE0254K5MjXliIYsIFBhdWwgV2Fs
bXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4gd3JvdGU6Cgo+IE9uIEZyaSwgNiBTZXAg
MjAxOSwgWGlhbmcgV2FuZyB3cm90ZToKPgo+ID4gRnJvbSAxMjMwMDg2NWQxMTAzNjE4YzlkNGMz
NzVmN2Q3ZmJlNjAxYjY2MThjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gRnJvbTogWGlh
bmcgV2FuZyBtZXJsZUBoYXJkZW5lZGxpbnV4Lm9yZwo+ID4gRGF0ZTogRnJpLCA2IFNlcCAyMDE5
IDExOjU2OjA5ICswODAwCj4gPiBTdWJqZWN0OiBbUEFUQ0hdIGFyY2gvcmlzY3Y6IGRpc2FibGUg
dG9vIG1hbnkgaGFydHMgYmVmb3JlIHBpY2sgbWFpbiBib290IGhhcnQKPiA+IFRoZXNlIGhhcnRz
IHdpdGggaWQgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvIENPTkZJR19OUl9DUFVTIG5lZWQgdG8g
YmUgZGlzYWJsZWQuCj4gPiBCdXQgcGljayB0aGUgbWFpbiBIYXJ0IGNhbiBjaG9vc2UgYW55IG9u
ZS4gU28sIGJlZm9yZSBwaWNrIHRoZSBtYWluIGhhcnQsIHlvdQo+ID4gbmVlZCB0byBkaXNhYmxl
IHRoZSBoYXJ0IHdpdGggaWQgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvIENPTkZJR19OUl9DUFVT
Lgo+ID4gU2lnbmVkLW9mZi1ieTogWGlhbmcgV2FuZyBtZXJsZUBoYXJkZW5lZGxpbnV4Lm9yZwo+
Cj4gVGhhbmtzLCBoZXJlJ3Mgd2hhdCBJJ20gcGxhbm5pbmcgdG8gcXVldWUgZm9yIHY1LjQtcmMx
LiBQbGVhc2UgbGV0IG1lCj4ga25vdyBBU0FQIGlmIHlvdSB3YW50IHRvIGNoYW5nZSB0aGUgcGF0
Y2ggZGVzY3JpcHRpb24uCj4KPiAtICAgUGF1bAoKTm90IG5lZWQgdG8gY2hhbmdlCgo+Cj4gICAg
IEZyb206IFhpYW5nIFdhbmcgbWVybGVAaGFyZGVuZWRsaW51eC5vcmcKPgo+Cj4gRGF0ZTogRnJp
LCA2IFNlcCAyMDE5IDExOjU2OjA5ICswODAwCj4gU3ViamVjdDogW1BBVENIXSBhcmNoL3Jpc2N2
OiBkaXNhYmxlIGV4Y2VzcyBoYXJ0cyBiZWZvcmUgcGlja2luZyBtYWluIGJvb3QgaGFydAo+Cj4g
SGFydHMgd2l0aCBpZCBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gQ09ORklHX05SX0NQVVMgbmVl
ZCB0byBiZQo+IGRpc2FibGVkLiBCdXQgdGhlIGtlcm5lbCBjYW4gcGljayBhbnkgaGFydCBhcyB0
aGUgbWFpbiBoYXJ0LiBTbywKPiBiZWZvcmUgcGlja2luZyB0aGUgbWFpbiBoYXJ0LCB0aGUga2Vy
bmVsIG11c3QgZGlzYWJsZSBoYXJ0cyB3aXRoIGlkcwo+IGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0
byBDT05GSUdfTlJfQ1BVUy4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW5nIFdhbmcgbWVybGVAaGFy
ZGVuZWRsaW51eC5vcmcKPiBSZXZpZXdlZC1ieTogUGFsbWVyIERhYmJlbHQgcGFsbWVyQHNpZml2
ZS5jb20KPiBbcGF1bC53YWxtc2xleUBzaWZpdmUuY29tOiB1cGRhdGVkIHRvIGFwcGx5OyBjbGVh
bmVkIHVwIHBhdGNoCj4gZGVzY3JpcHRpb25dCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBXYWxtc2xl
eSBwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20KPgo+IGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyB8
IDggKysrKystLS0KPiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2hlYWQuUwo+IGluZGV4IDE1YTkxODlmOTFhZC4uNzJmODliNzU5MGRkIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2hlYWQuUwo+IEBAIC02Myw2ICs2MywxMSBAQCBfc3RhcnRfa2VybmVsOgo+IGxpIHQwLCBT
Ul9GUwo+IGNzcmMgQ1NSX1NTVEFUVVMsIHQwCj4KPiArI2lmZGVmIENPTkZJR19TTVAKPgo+IC0g
ICBsaSB0MCwgQ09ORklHX05SX0NQVVMKPiAtICAgYmdldSBhMCwgdDAsIC5Mc2Vjb25kYXJ5X3Bh
cmsKPiAgICAgKyNlbmRpZgo+Cj4gLSAgIC8qIFBpY2sgb25lIGhhcnQgdG8gcnVuIHRoZSBtYWlu
IGJvb3Qgc2VxdWVuY2UgKi8KPiAgICAgbGEgYTMsIGhhcnRfbG90dGVyeQo+ICAgICBsaSBhMiwg
MQo+ICAgICBAQCAtMTU0LDkgKzE1OSw2IEBAIHJlbG9jYXRlOgo+Cj4gICAgIC5Mc2Vjb25kYXJ5
X3N0YXJ0Ogo+ICAgICAjaWZkZWYgQ09ORklHX1NNUAo+Cj4KPiAtICAgbGkgYTEsIENPTkZJR19O
Ul9DUFVTCj4gLSAgIGJnZXUgYTAsIGExLCAuTHNlY29uZGFyeV9wYXJrCj4gLSAgIC8qIFNldCB0
cmFwIHZlY3RvciB0byBzcGluIGZvcmV2ZXIgdG8gaGVscCBkZWJ1ZyAqLwo+ICAgICBsYSBhMywg
LkxzZWNvbmRhcnlfcGFyawo+ICAgICBjc3J3IENTUl9TVFZFQywgYTMKPiAgICAgLS0KPiAgICAg
Mi4yMy4wCj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
