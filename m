Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725B8C6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 03:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjqARK7rcwu//V+vzeKQXrL2CKLvnvh9ILaNgVncpjk=; b=I2qSSK139df+ky
	EpYP8SQMmcBraJigFfLUr/B7ZFYaFsxgS9SqGQaoOlMY/s6is5pKZM+X5CK/a5gWMjINeYUyJkqGm
	qbLk2IGPiGZNHTaxovE8epGdkI0iYE3BXrRAwYkmvb1b/ToKz5LfHleHm8Ju6rzD5kv/W6vmxRdGt
	NiqkS4yauUaDA9udxr4e76J3xn/3SFYgx+8P4F1BvFTH151+oS7ans2/hHAr4/yyFvNaUEjZSNZFC
	+W/y0EiqA14EHENM6E2dwT51FdXQpVPG9yxQqAVZd/C2BydQ5xCZngS3ISKy3GqIV2/5GP4vmSxXn
	ApYvvRuPpCe1DpbDVNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pepNa-00ETAg-2y;
	Wed, 22 Mar 2023 03:43:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pepNX-00ET9l-08
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 03:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679456589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lrf/XdNOsvLMGRhBjqf6cL2fHtpUXGfZ7Je7JgZAOhA=;
	b=ZPcP5mv6TERa8lQpSWpQGnl5HAvV382mqiw0M6YXIVdU74P7J0r6YF5YHnY5U9pSTQnv6T
	oTfUZF7qgLjLg2IbTksQBFSb8PiO6tAjr/fql6lamSHfYxEE0UW4EJBGG91n8dYvewtdxk
	JYvksk/feMMrmF90YuNtaT3x/tELo/g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-gSZN5eRuO_uQj8VFmVu7Cw-1; Tue, 21 Mar 2023 23:43:08 -0400
X-MC-Unique: gSZN5eRuO_uQj8VFmVu7Cw-1
Received: by mail-qk1-f199.google.com with SMTP id 203-20020a370ad4000000b00746981f8f4bso2810629qkk.13
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 20:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679456587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lrf/XdNOsvLMGRhBjqf6cL2fHtpUXGfZ7Je7JgZAOhA=;
        b=4hdzYGQdmpkZun3qrK3tKZIEycqBQafjpalAwkgVYdbw5QCxungPDy3ttonn2USPDl
         RHfhNvB8hG1eatmheN95+RJT/cJiRORqZjsmzniFu5uPxcb621QnT5xzYLrXQkd86hOT
         +rqxx9p6Rdt+lxxN5Zrl2bV8WCjlWO8O0HZwNlksuVGFj1pGIwjBlLrwg7R0v9CYqtTu
         p46WtdoM39rCkNCeqEN8O8KhxsSZ2qRSOIScN1ttGmZ3MyRkftcWIRqULJuc9cagl/ZJ
         laXUugqt4ubCPu04/8R7tDX/lTRzOwJYCe8sRzYB0uPSoBmN0yQRPS/JHYEvkJOOZ8jz
         uJ4g==
X-Gm-Message-State: AO0yUKWDDcPhVRKv6M5HFqOkk5R4KHfGaq8gDQ7kYypaJqIfPdI4v/yB
	+r0/EiSdDAx8coqQKJKIZQNpCgh8IItF9TO+TyXkQt+cKY0NLQ4jlr/u0vzSPphBRD2bONb/oXN
	ORf6rxieps7ebi1c+4vwrPiPdqgZfhlv4XewJsjBwDZq4
X-Received: by 2002:a05:6214:8c7:b0:537:7476:41f7 with SMTP id da7-20020a05621408c700b00537747641f7mr495422qvb.3.1679456587585;
        Tue, 21 Mar 2023 20:43:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set8k6gBfjyU341I6MjXPfux6c1GDT0SwUyfeQ7CTHdY7SEbJ+BMisEVgrchSL00Hu3VqCV/zeZYFl4LygEDRQtA=
X-Received: by 2002:a05:6214:8c7:b0:537:7476:41f7 with SMTP id
 da7-20020a05621408c700b00537747641f7mr495413qvb.3.1679456587241; Tue, 21 Mar
 2023 20:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230318080059.1109286-1-leobras@redhat.com> <8f698f49-135a-4263-8471-96f406919cb1@spud>
 <4f35f41c143b02b6b815e7eb527ca3acd8b4aabe.camel@redhat.com>
 <18e07d0a-7e21-46d0-9166-6ee07817352a@spud> <CAJ6HWG5zHMB1-vVsuQ+nG3EC12JAi2MP5o8GbSQ9QJfgLEQNnw@mail.gmail.com>
 <4d9770c7-3cb6-42d6-891f-1247a02742e9@spud>
In-Reply-To: <4d9770c7-3cb6-42d6-891f-1247a02742e9@spud>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 22 Mar 2023 00:42:56 -0300
Message-ID: <CAJ6HWG5+5f_z7HaVb70w4wxtTbyMMxwTAwpk5gv4C4JiSve5iA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Deduplicating RISCV cmpxchg.h macros
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_204311_163204_1D15A957 
X-CRM114-Status: GOOD (  63.23  )
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

T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgNDo0OOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAyMSwgMjAyMyBhdCAwMjowMTo1OVBNIC0w
MzAwLCBMZW9uYXJkbyBCcmFzIFNvYXJlcyBQYXNzb3Mgd3JvdGU6Cj4gPiBPbiBUdWUsIE1hciAy
MSwgMjAyMyBhdCA0OjQ54oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgTWFyIDIxLCAyMDIzIGF0IDAzOjMwOjM1QU0gLTAz
MDAsIExlb25hcmRvIEJyw6FzIHdyb3RlOgo+ID4gPiA+IE9uIFN1biwgMjAyMy0wMy0xOSBhdCAy
MDozNSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiA+ID4gT24gU2F0LCBNYXIgMTgs
IDIwMjMgYXQgMDU6MDA6NTRBTSAtMDMwMCwgTGVvbmFyZG8gQnJhcyB3cm90ZToKPiA+ID4gPiA+
ID4gV2hpbGUgc3R1ZHlpbmcgcmlzY3YncyBjbXB4Y2hnLmggZmlsZSwgSSBnb3QgcmVhbGx5IGlu
dGVyZXN0ZWQgaW4KPiA+ID4gPiA+ID4gdW5kZXJzdGFuZGluZyBob3cgUklTQ1YgYXNtIGltcGxl
bWVudGVkIHRoZSBkaWZmZXJlbnQgdmVyc2lvbnMgb2YKPiA+ID4gPiA+ID4ge2NtcCx9eGNoZy4K
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gV2hlbiBJIHVuZGVyc3Rvb2QgdGhlIHBhdHRlcm4sIGl0
IG1hZGUgc2Vuc2UgZm9yIG1lIHRvIHJlbW92ZSB0aGUKPiA+ID4gPiA+ID4gZHVwbGljYXRpb25z
IGFuZCBjcmVhdGUgbWFjcm9zIHRvIG1ha2UgaXQgZWFzaWVyIHRvIHVuZGVyc3RhbmQgd2hhdCBl
eGFjdGx5Cj4gPiA+ID4gPiA+IGNoYW5nZXMgYmV0d2VlbiB0aGUgdmVyc2lvbnM6IEluc3RydWN0
aW9uIHN1Zml4ZXMgJiBiYXJyaWVycy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSBzcGxpdCB0
aG9zZSBjaGFuZ2VzIGluIDMgbGV2ZWxzIGZvciBlYWNoIGNtcHhjaGcgYW5kIHhjaGcsIHJlc3Vs
dGluZyBhCj4gPiA+ID4gPiA+IHRvdGFsIG9mIDYgcGF0Y2hlcy4gSSBkaWQgdGhpcyBzbyBpdCBi
ZWNvbWVzIGVhc2llciB0byByZXZpZXcgYW5kIHJlbW92ZQo+ID4gPiA+ID4gPiB0aGUgbGFzdCBs
ZXZlbHMgaWYgZGVzaXJlZCwgYnV0IEkgaGF2ZSBubyBpc3N1ZSBzcXVhc2hpbmcgdGhlbSBpZiBp
dCdzCj4gPiA+ID4gPiA+IGJldHRlci4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gUGxlYXNlIHBy
b3ZpZGUgY29tbWVudHMuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYW5rcyEKPiA+ID4gPiA+
ID4gTGVvCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IExlb25hcmRvIEJyYXMgKDYpOgo+ID4gPiA+
ID4gPiAgIHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIGNtcHhjaGcoKSBhc20gZnVuY3Rpb25z
Cj4gPiA+ID4gPiA+ICAgcmlzY3YvY21weGNoZzogRGVkdXBsaWNhdGUgY21weGNoZygpIG1hY3Jv
cwo+ID4gPiA+ID4gPiAgIHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIGFyY2hfY21weGNoZygp
IG1hY3Jvcwo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gICByaXNjdi9jbXB4Y2hnOiBEZWR1cGxpY2F0
ZSB4Y2hnKCkgYXNtIGZ1bmN0aW9ucwo+ID4gPiA+ID4KPiA+ID4gPiA+IEZXSVcsIHRoaXMgcGF0
Y2ggc2VlbXMgdG8gYnJlYWsgdGhlIGJ1aWxkIHByZXR0eSBiYWRseToKPiA+ID4gPiA+IGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMDMx
ODA4MDA1OS4xMTA5Mjg2LTUtbGVvYnJhc0ByZWRoYXQuY29tLwo+ID4gPiA+Cj4gPiA+ID4gVGhh
bmtzIGZvciBwb2ludGluZyBvdXQhCj4gPiA+ID4KPiA+ID4gPiBJdCB3YXMgYW4gaW50ZXJtZWRp
YXJ5IGVycm9yOgo+ID4gPiA+IFN1Zml4IGZvciBhbW9zd2FwIG9uIGFjcXVpcmUgdmVyc2lvbiB3
YXMgImQuYXFybCIgaW5zdGVhZCBvZiB0aGUKPiA+ID4gPiBjb3JyZWN0Ii5kLmFxcmwiLCBhbmQg
dGhhdCBjYXVzZWQgdGhlIGZhaWwuCj4gPiA+ID4KPiA+ID4gPiBJIGRpZCBub3Qgbm90aWNlIGFu
eXRoaW5nIGJlY2F1c2UgdGhlIG5leHQgY29tbWl0IG1hZGUgaXQgbW9yZSBnZW5lcmFsLCBhbmQg
dGh1cwo+ID4gPiA+IHJlbW92ZWQgdGhpcyBsaW5lIG9mIGNvZGUuIEkgd2lsbCBzZW5kIGEgdjIt
UkZDIHNob3J0bHkuCj4gPiA+ID4KPiA+ID4gPiBJIHNlZSB0aGF0IHBhdGNoIDQvNiBoYXMgNSBm
YWlscywgYnV0IG9uIGVhY2ggb25lIG9mIHRoZW0gSSBjYW4gc2VlOgo+ID4gPiA+ICJJOiBidWls
ZCBvdXRwdXQgaW4gL2NpL3dvcmtzcGFjZS9bLi4uXSIsIG9yCj4gPiA+ID4gIiJJOiBidWlsZCBv
dXRwdXQgaW4gL3RtcC9bLi4uXSIuCj4gPiA+Cj4gPiA+IEkgZG9uJ3QgcHVzaCB0aGUgYnVpbHQg
YXJ0aWZhY3RzIGFueXdoZXJlLCBqdXN0IHRoZSBicmllZiBsb2dzIC0KPiA+ID4gYWx0aG91Z2gg
dGhlICJmYWlsZWQgdG8gYnVpbGQiIGxvZyBpc24ndCB2ZXJ5IGhlbHBmdWwgb3RoZXIgdGhhbiB0
ZWxsaW5nCj4gPiA+IHlvdSB0aGUgYnVpbGQgYnJva2UuCj4gPiA+IFRoYXQgc2VlbXMgbGlrZSBh
IGJ1ZyB3LnIudC4gd2hlcmUgdHV4bWFrZSBwcmludHMgaXRzIG91dHB1dC4gSSdsbCB0cnkKPiA+
ID4gdG8gZml4IHRoYXQuCj4gPgo+ID4gVGhhbmtzIGZvciB0aGF0IDopCj4KPiBJJ3ZlIHB1c2hl
ZCB3aGF0IEkgdGhpbmsgaXMgYSBmaXgsIHRoZSB3cm9uZyBsb2cgZmlsZSB3YXMgYmVpbmcgZ3Jl
cHBlZAo+IGZvciBlcnJvcnMgaW4gdGhlIGNhc2Ugb2YgYSBmYWlsZWQgYnVpbGQuCgpUaGFua3Mh
Cgo+Cj4gPiA+ID4gSSBjb3VsZCBub3QgZmluZCBhbnkgcmVmZXJlbmNlIHRvIHdoZXJlIHRoaXMg
aXMgc2F2ZWQsIHRob3VnaC4KPiA+ID4gPiBDb3VsZCB5b3UgcG9pbnQgd2hlcmUgY2FuIEkgZmlu
ZCB0aGUgZXJyb3Igb3V0cHV0LCBqdXN0IGZvciB0aGUgc2FrZSBvZiBmdXJ0aGVyCj4gPiA+ID4g
ZGVidWdnaW5nPwo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gUGF0Y2hlcyAxICYgNSBhbHNv
IGFkZCBxdWl0ZSBhIGxvdCBvZiBzcGFyc2UgaXNzdWVzIChsaWtlIDEwMDApLCBidXQgSQo+ID4g
PiA+ID4gdGhpbmsgdGhhdCBtYXkgYmUgbW9yZSBvZiBhbiBhcnRpZmFjdCBvZiB0aGUgdGVzdGlu
ZyBwcm9jZXNzIGFzIG9wcG9zZWQKPiA+ID4gPiA+IHRvIHNvbWV0aGluZyBjYXVzZWQgYnkgdGhp
cyBwYXRjaHNldC4KPiA+ID4gPgo+ID4gPiA+IEZvciB0aG9zZSBJIGNhbiBzZWUgdGhlIGJ1aWxk
IG91dHB1dCBkaWZmcy4gQm90aCBhZGRlZCBlcnJvciBsaW5lcyB0bwo+ID4gPiA+IGNvbmNodW9k
L2J1aWxkX3J2NjRfZ2NjX2FsbG1vZGNvbmZpZy4KPiA+ID4gPiBJIHRyaWVkIHRvIG1pbWljIHRo
aXMgd2l0aCBbbWFrZSBhbGxtb2Rjb25maWcgKyBnY2MgYnVpbGQgd2l0aAo+ID4gPiA+IENST1NT
X0NPTVBJTEU9cmlzY3Y2NC1saW51eC1nbnUtIF0gYnV0IEkgY291bGQgbm90IGdldCBhbnkgZXJy
b3IgaW4gYW55IHBhdGNoLgo+ID4gPgo+ID4gPiBJZiB5b3UgY2FuJ3QgcmVwbGljYXRlIHRoZW0s
IGl0J3MgcHJvYmFibHkgYmVjYXVzZSB0aGV5IGNvbWUgZnJvbQo+ID4gPiBzcGFyc2UuIEkgb25s
eSByZWFsbHkgbWVudGlvbmVkIGl0IGhlcmUgaW4gY2FzZSB5b3Ugd2VudCBsb29raW5nIGF0IHRo
ZQo+ID4gPiBvdGhlciBwYXRjaGVzIGluIHRoZSBzZXJpZXMgYW5kIHdlcmUgd29uZGVyaW5nIHdo
eSB0aGluZ3Mgd2VyZSBzbyBhbWlzcy4KPiA+Cj4gPiBPaCwgaXQgbWFrZXMgc2Vuc2UuCj4gPgo+
ID4gPgo+ID4gPiA+IEZvciBwYXRjaCAxLzYgaXQgcmVtb3ZlcyBhcyBtdWNoIGVycm9yIGxpbmVz
ICgtKSBhcyBpdCBhZGRzICgrKSwgYW5kIHRoZSBlcnJvcgo+ID4gPiA+IG1lc3NhZ2VzIGFyZSBt
b3N0bHkgdGhlIHNhbWUsIGFwYXJ0IGZvciBhbiBsaW5lIG51bWJlci4KPiA+ID4KPiA+ID4gSSBk
b24ndCBzZWUgYSBsaW5lIG51bWJlciBkaWZmZXJlbmNlLCBidXQgcmF0aGVyIGFuIGluY3JlYXNl
IGluIHRoZQo+ID4gPiBudW1iZXIgb2YgdGltZXMgdGhlIHNhbWUgZXJyb3IgbGluZXMgaGF2ZSBh
cHBlYXJlZCBpbiB0aGUgb3V0cHV0Lgo+ID4gPiBJIGRvbid0IGZpbmQgdGhlIHNpbmdsZS1saW5l
IG91dHB1dCBmcm9tIHNwYXJzZSB0byByZWFsbHkgYmUgdmVyeQo+ID4gPiBoZWxwZnVsLCBJIHNo
b3VsZCBwcm9iYWJseSBoYXZlIGEgYml0IG9mIGEgdGhpbmsgaG93IHRvIHByZXNlbnQgdGhhdAo+
ID4gPiBpbmZvcm1hdGlvbiBiZXR0ZXIuCj4gPgo+ID4gT2gsIEkgc2VlLgo+ID4gVGhlIG51bWJl
ciBhdCB0aGUgYmVnaW5uaW5nIHJlbGF0ZXMgdG8gdGhlIG51bWJlciBvZiB0aW1lcyB0aGUgZXJy
b3IgaGFwcGVucy4KPiA+IE9rIGl0IG1ha2VzIHNlbnNlIHRvIG1lIG5vdyA6KQo+ID4KPiA+ID4K
PiA+ID4gPiBGb3IgcGF0Y2ggNS82IGl0IGFjdHVhbGx5IGFkZHMgbWFueSBtb3JlIGxpbmVzLCBi
dXQgdHJhY2tpbmcgKHNvbWUgb2YpIHRoZQo+ID4gPiA+IGVycm9ycyBnYXZlIG1lIG5vIGlkZWEg
d2h5Lgo+ID4gPgo+ID4gPiBQcm9iYWJseSBqdXN0IHNwYXJzZSBiZWluZyB1bmhhcHB5IHdpdGgg
c29tZSB3YXkgdGhlIG1hY3JvcyB3ZXJlCj4gPiA+IGNoYW5nZWQgLSBidXQgc29tZSBvZiBpdCAo
IlNob3VsZCBpdCBiZSBzdGF0aWM/IiBiaXRzKSBsb29rIHZlcnkgbXVjaAo+ID4gPiBsaWtlIHRo
ZSBwYXRjaCBjYXVzaW5nIHRoaW5ncyB0byBiZSByZWJ1aWx0IG9ubHkgZm9yIHRoZSAiYWZ0ZXIg
dGhlCj4gPiA+IHBhdGNoIiBidWlsZCwgYnV0IHNvbWVob3cgbm90IGZvciB0aGUgImJlZm9yZSIg
YnVpbGQuCj4gPgo+ID4gSHVtbSwgbm90IHN1cmUgSSBjb3VsZCB1bmRlcnN0YW5kIHRoYXQgbGFz
dCBwYXJ0Ogo+ID4gV2hhdCBJIGdldCBpcyB0aGF0IHRoZSBwYXRjaCA1LzYgaXMgY2F1c2luZyB0
aGluZ3MgdG8gYmUgcmVidWlsdCwgYW5kCj4gPiBpdCB3YXMgbm90IGxpa2UgdGhhdCBvbiAxLTQv
Ni4KPiA+IElzIHRoYXQgd2hhdCB5b3Ugc2FpZD8KPiA+IElmIHNvLCBhbmQgeW91IGFyZSBkb2lu
ZyBpdCBhcyBhbiBpbmNyZW1lbnRhbCBidWlsZCwgY2hhbmdpbmcgdGhlCj4gPiBtYWNyb3MgaW4g
NS82IHNob3VsZCBiZSB0cmlnZ2VyaW5nIHJlYnVpbGRzLCBidXQgaXQgZG9lcyBub3QgbWFrZQo+
ID4gc2Vuc2UgdG8gbm90IGJlIHJlYnVpbHQgaW4gMS00LzYgYXMgdGhleSBjaGFuZ2UgdGhlIHNh
bWUgbWFjcm9zLgo+Cj4gUmlnaHQsIGl0IGlzIGFuIGluY3JlbWVudGFsIGJ1aWxkLgo+IEZpcnN0
IGl0IGJ1aWxkcyB0aGUgdHJlZSB3aXRoIGEgcGF0Y2ggYXBwbGllZCwgdGhlbiBpdCBjaGVja3Mg
b3V0IEhFQUR+MQo+IGFuZCBidWlsZHMgdGhhdCB0cmVlLiBUaGVuIGl0IGdvZXMgYmFjayB0byB0
aGUgdHJlZSB3aXRoIHRoZSBwYXRjaAo+IGFwcGxpZWQgYW5kIGJ1aWxkcyBpdCBhZ2Fpbi4gVGhl
IG91dHB1dCBmcm9tIGJ1aWxkcyAyICYgMyBhcmUgY29tcGFyZWQKPiB0byBzZWUgaWYgYW55IGVy
cm9ycyBzbnVjayBpbi4KPiBJbiB0aGVvcnksIHRoYXQgc2hvdWxkIGVuc3VyZSB0aGF0LCBhcyBi
dWlsZHMgMiAmIDMgaGF2ZSBoYWQgdGhlIHNhbWUKPiBkaWZmIHRvIHRoZSBwcmV2aW91cyBvbmUg
anVzdCBpbiBvcHBvc2l0ZSBkaXJlY3Rpb25zLCB0aGUgc2FtZSBmaWxlcyBnZXQKPiByZWJ1aWx0
IC0gYnV0IEkgYW0gYSBsaXR0bGUgd29ycmllZCB0aGF0IGNjYWNoZSBnZXRzIGludm9sdmVkIHNv
bWV0aW1lcwo+IGFuZCBsZWFkcyB0byB0aGUgYmVmb3JlL2FmdGVyIGJ1aWxkcyBub3QgYmVpbmcg
ZXhhY3RseSB0aGUgc2FtZS4KCk1ha2VzIHNlbnNlIHRvIG1lLgoKPgo+IFRoZXkgbWF5IHZlcnkg
d2VsbCBiZSByZWFsIGlzc3VlcyBhcyB5b3VyIHJlZmFjdG9yIGhhcyBjYXVzZWQgdGhlCj4gY2Fz
dGluZyBpbiB0aGUgbWFjcm9zIHRvIGNoYW5nZSBvciB3L2UuIE5vdCBteSBhcmVhIG9mIGV4cGVy
dGlzZSBieSBhbnkKPiBzdHJldGNoIG9mIHRoZSBpbWFnaW5hdGlvbiwgYnV0IHRoZSBsa3Agc3Bh
cnNlIGlzIG91dCBvZiBkYXRlICYgZG9lc24ndAo+IHJ1biBhbnkgbW9yZSBzbyBJIGZpZ3VyZSBp
dCdzIGJldHRlciB0byBiZSBydW5uaW5nIHRoZSBzdHVmZiwgZXZlbiBpZiBpdAo+IGRvZXMgc29t
ZXRpbWVzIHJlc3VsdCBpbiBhIHNwbHVyZ2Ugb2YgZXJyb3JzIGxpa2UgdGhpcyB0aGFuIGZvcmdl
dCBhYm91dAo+IHBvb3IgYXVsIHNwYXJzZS4KCkkgYWdyZWUgd2l0aCB5b3UuCkJldHRlciBkZWFs
IHdpdGggc3BvcmFkaWMgc3B1cmlvdXMgZXJyb3JzIHRoYW4gbm90IHRlc3RpbmcgYXQgYWxsLgoK
Pgo+IENoZWVycywKPiBDb25vci4KCkJlc3QgcmVnYXJkcywKTGVvCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
