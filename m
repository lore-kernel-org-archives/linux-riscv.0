Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E743C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 17:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3XiwNcHc5A3nsTAWHjAk59kKM4/9FJR8aJPDWrdDDA=; b=emlyr7TA8w1G4j
	Kwfnb+cZ/ca5Ug+YNVQbShHompL2peNBPVug4LO627pqdATtem8dRPYuZ4aGYGegBwI17K1e0le2L
	X/RY9ViHliz2Jy2ShdSbBertgseml270LE6tP5tJXzK91yuU75vgpxqZ2D9h488G+yEEklBLwiLnp
	1CnzWfR/XcMHjuIadFBN17GCAdnJhbknUGlsFPeNxwl0xDJneDFGJJZrZLz/6UDzuZSFyTk7XNyui
	GRZUap6pc1navCEjlGuUhIZaL14Ehz3alP6zJRrqWf25JbPtUhCicDMISdwaaspxqa2dGv+tluWZb
	24wHy6xMO2nB/N5vYPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0mOs-004Plw-0E;
	Wed, 08 Nov 2023 17:31:34 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0mOo-004PkS-2g
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 17:31:32 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c6b30aca06so94498931fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 09:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699464688; x=1700069488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2y+UIxR7t0y8KyRRopsN2Qm2b1Bu/DmgpnCpFpmBbc=;
        b=aW9b7/MwvpxQrNw9GBh3cF/O+sqgab8WwSze8LUjh13y7oYq080CorCwJGIJH3sSxV
         BUM25tmk6nIG65mCMqdlrYNhF8l7DtUJDfl6p64rOd0QKHzaEJXGCbR5wLdcMpUTsfpL
         VirgSMJr0oei6KWALcAMP5xp62kumBIs/+2GbfNTn7YDDhBwVrZPoeaA5baM0MeGXtwa
         D0cTW7vRTO5HDdWL3FE1ShJ83mUamaK2fN5mGkrEnw+rNjDbfx/ylq4J+y0QQW5KUYg4
         3z63w8BjhbypZi7mewwex63aAwpnb1zEF1/i3ftkHhJnQtgpwEJO/OixcHoALt4rwJZQ
         TVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699464688; x=1700069488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2y+UIxR7t0y8KyRRopsN2Qm2b1Bu/DmgpnCpFpmBbc=;
        b=MQTHlJQ2VnBhgzK+XHwtocJ7MrJeLBZ5DjQoJ+CcQGVFNsopV6wD1W83aSoQPe6Bsk
         iRk21wWnVy3/r7DgW0pwAVC3DB/m6Ag6zueZe5uc1OT9oyeJrQyuKcePvcDNp22EKhlx
         N+32DYDXOODZwzT+yYLZDTcUQ3gQ22Rey0Z53EOInamVKMAL1kJz5Dy/ITI+PIIeQPUW
         U1zCkBvbXCT8lDPbHVuNk40iMOnGnZU7Efp1sM8TPjX8TO4MmCL1jXFVDOtASNQquGKe
         IDtOC2z/StPoasH1aNQ6nY4hLClIES6Ffru9lH/YTLj/EICLiFDudG879KFFqWgAFwkf
         HDDA==
X-Gm-Message-State: AOJu0YzpVs1lTP0mVRXXtFN4GeOn3Q3cWU4ygyA/g2O98U+Ndcb2SL1b
	IlQDQITbyuwHfukvPc72ekG1HQ+Tmji6t8jil8sKJw==
X-Google-Smtp-Source: AGHT+IFxwqRCM017IGRoE/j1galivZMI9ibJrcoLcNp7ZxDZWPie8AVUUtT7psUw58yv+O6zl0BLG009pUTZ+uXiXs4=
X-Received: by 2002:a05:651c:2dd:b0:2c0:318a:6ee1 with SMTP id
 f29-20020a05651c02dd00b002c0318a6ee1mr1957557ljo.49.1699464687676; Wed, 08
 Nov 2023 09:31:27 -0800 (PST)
MIME-Version: 1.0
References: <CGME20231108112923eucas1p27474e921565e3f175e27e6598f0b71c3@eucas1p2.samsung.com>
 <20231108112909.591987-1-m.szyprowski@samsung.com> <CALs-Hst6fmesQy6g=ZxfKFs5W85quWQRcwP_=okBWKqMA3CQsw@mail.gmail.com>
 <4a49e782-465d-434d-b101-8ca478914b72@samsung.com>
In-Reply-To: <4a49e782-465d-434d-b101-8ca478914b72@samsung.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 8 Nov 2023 09:30:51 -0800
Message-ID: <CALs-HsvE3u7OGTm84KRr-LfVVmhs4xspHL1GqEuRo--C6TVu8A@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix potential panic during CPU hot-plug
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko@sntech.de>, 
	Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_093130_877879_26C65173 
X-CRM114-Status: GOOD (  30.63  )
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

T24gV2VkLCBOb3YgOCwgMjAyMyBhdCA5OjE44oCvQU0gTWFyZWsgU3p5cHJvd3NraQo8bS5zenlw
cm93c2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IERlYXIgRXZhbiwKPgo+IE9uIDA4LjExLjIw
MjMgMTc6NDcsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiBPbiBXZWQsIE5vdiA4LCAyMDIzIGF0IDM6
MjnigK9BTSBNYXJlayBTenlwcm93c2tpCj4gPiA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPiAg
d3JvdGU6Cj4gPj4gQ29tbWl0IDU4NGVhNjU2NGJjYSAoIlJJU0MtVjogUHJvYmUgZm9yIHVuYWxp
Z25lZCBhY2Nlc3Mgc3BlZWQiKSBhZGRlZCBhCj4gPj4gdGVzdCBmb3IgdW5hbGlnbmVkIGFjY2Vz
cyBzcGVlZC4gSXQgaXMgYmVpbmcgcGVyZm9ybWVkIHdoZW4gZ2l2ZW4gQ1BVIGlzCj4gPj4gb25s
aW5lZC4gVGhlbiwgYW5vdGhlciB0ZXN0IGZvciBtaXNhbGlnbmVkIGFjY2VzcyBlbXVsYXRpb24g
aGFzIGJlZW4KPiA+PiBhZGRlZCBpbiBjb21taXQgNzFjNTRiM2QxNjlkICgicmlzY3Y6IHJlcG9y
dCBtaXNhbGlnbmVkIGFjY2Vzc2VzCj4gPj4gZW11bGF0aW9uIHRvIGh3cHJvYmUiKS4gVGhpcyB1
bmFsaWduZWQgYWNjZXNzIHNwZWVkIGRvZXNuJ3QgcmVhbGx5IGNoYW5nZQo+ID4+IGFmdGVyIHRo
ZSBib290LCBzbyBpdCBpcyBzdWZmaWNpZW50IHRvIGRvIHRoaXMgdGVzdCBvbmx5IG9uY2UuIFRo
aXMgaGFzCj4gPj4gYmVlbiBwYXJ0aWFsbHkgYWRkZWQgYnkgY29tbWl0IGMyMGQzNmNjMmEyMCAo
InJpc2N2OiBkb24ndCBwcm9iZQo+ID4+IHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgaWYgYWxyZWFk
eSBkb25lIiksIGJ1dCB0aGlzIG9wdGltaXNhdGlvbiB3b3Jrcwo+ID4+IG9ubHkgaWYgUklTQ1Zf
SFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEIGlzIHJldHVybmVkIGJ5IHRoZSBsYXR0ZXIKPiA+
PiBjaGVjay4gT3RoZXJ3aXNlIHRoZSAnbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQnIHBjcHUgdmFy
bGlhYmxlIGlzCj4gPj4gb3ZlcndyaXR0ZW4gd2l0aCBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
VU5LTk9XTiB2YWx1ZSwgd2hhdCBtYWtlcyB0aGUKPiA+PiBmaXJzdCBjaGVjayB0byBiZSBhbHdh
eXMgcGVyZm9ybWVkLgo+ID4+Cj4gPj4gUmVjZW50bHkgSSd2ZSBub3RpY2VkIHRoYXQgdGhlIGZp
cnN0IGNoZWNrIGludHJvZHVjZWQgYSByZWdyZXNzaW9uIGluIHRoZQo+ID4+IENQVSBob3QtcGx1
ZyBtZWNoYW5pc20uIFRoaXMgY2FuIGJlIG9ic2VydmVkIGFzIGEgZm9sbG93aW5nIHBhbmljIG9u
Cj4gPj4gUUVtdToKPiA+Pgo+ID4+IENQVTE6IG9mZgo+ID4+IGNwdTE6IFJhdGlvIG9mIGJ5dGUg
YWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzIDcuMDAsIHVuYWxpZ25lZCBh
Y2Nlc3NlcyBhcmUgZmFzdAo+ID4+IENQVTE6IG9mZgo+ID4+IENQVTE6IGZhaWxlZCB0byBjb21l
IG9ubGluZQo+ID4+IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+ID4+IFdB
Uk5JTkc6IENQVTogMCBQSUQ6IDIxNSBhdCBrZXJuZWwvc21wLmM6NDM3IF9fZmx1c2hfc21wX2Nh
bGxfZnVuY3Rpb25fcXVldWUrMHg5MC8weDI5Mgo+ID4+IE1vZHVsZXMgbGlua2VkIGluOgo+ID4+
IENQVTogMCBQSUQ6IDIxNSBDb21tOiBiYXNoIE5vdCB0YWludGVkIDYuNS4wLXJjMSsgIzc1MjQK
PiA+PiBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4gPj4gZXBjIDogX19m
bHVzaF9zbXBfY2FsbF9mdW5jdGlvbl9xdWV1ZSsweDkwLzB4MjkyCj4gPj4gICByYSA6IHNtcGNm
ZF9keWluZ19jcHUrMHhlLzB4MWMKPiA+PiAuLi4KPiA+PiBbPGZmZmZmZmZmODAwYzkwNGE+XSBf
X2ZsdXNoX3NtcF9jYWxsX2Z1bmN0aW9uX3F1ZXVlKzB4OTAvMHgyOTIKPiA+PiBbPGZmZmZmZmZm
ODAwYzlhZTg+XSBzbXBjZmRfZHlpbmdfY3B1KzB4ZS8weDFjCj4gPj4gWzxmZmZmZmZmZjgwMDEy
YjJlPl0gY3B1aHBfaW52b2tlX2NhbGxiYWNrKzB4MTI0LzB4MzIyCj4gPj4gWzxmZmZmZmZmZjgw
MDE0MmY4Pl0gX2NwdV91cCsweDIxOC8weDMyMgo+ID4+IFs8ZmZmZmZmZmY4MDAxNDQ1ZT5dIGNw
dV91cCsweDVjLzB4OTgKPiA+PiBbPGZmZmZmZmZmODAwMTRiYjg+XSBjcHVfZGV2aWNlX3VwKzB4
MTQvMHgxYwo+ID4+IFs8ZmZmZmZmZmY4MDY2ZDY4ZT5dIGNwdV9zdWJzeXNfb25saW5lKzB4MTAv
MHgxOAo+ID4+IFs8ZmZmZmZmZmY4MDY2ODBlOD5dIGRldmljZV9vbmxpbmUrMHg1Ni8weDcyCj4g
Pj4gWzxmZmZmZmZmZjgwNjY4MTkwPl0gb25saW5lX3N0b3JlKzB4OGMvMHhhZQo+ID4+IFs8ZmZm
ZmZmZmY4MDY2MmRkZT5dIGRldl9hdHRyX3N0b3JlKzB4ZS8weDFhCj4gPj4gWzxmZmZmZmZmZjgw
MmI1M2JjPl0gc3lzZnNfa2Zfd3JpdGUrMHgyZS8weDRjCj4gPj4gWzxmZmZmZmZmZjgwMmI0NzUw
Pl0ga2VybmZzX2ZvcF93cml0ZV9pdGVyKzB4ZTgvMHgxNGUKPiA+PiBbPGZmZmZmZmZmODAyMzAx
NzA+XSB2ZnNfd3JpdGUrMHgyYTQvMHgzZTAKPiA+PiBbPGZmZmZmZmZmODAyMzAzZTg+XSBrc3lz
X3dyaXRlKzB4NWUvMHhjOAo+ID4+IFs8ZmZmZmZmZmY4MDIzMDQ2MD5dIHN5c193cml0ZSsweGUv
MHgxNgo+ID4+IFs8ZmZmZmZmZmY4MGE0YThkZT5dIGRvX3RyYXBfZWNhbGxfdSsweGUwLzB4ZjQK
PiA+PiBbPGZmZmZmZmZmODAwMDNlOGM+XSByZXRfZnJvbV9leGNlcHRpb24rMHgwLzB4NjQKPiA+
PiBpcnEgZXZlbnQgc3RhbXA6IDEyMzM1Cj4gPj4gaGFyZGlycXMgbGFzdCAgZW5hYmxlZCBhdCAo
MTIzMzUpOiBbPGZmZmZmZmZmODAwN2U1NDI+XSBjb25zb2xlX3VubG9jaysweDE1Ni8weDE4Ngo+
ID4+IGhhcmRpcnFzIGxhc3QgZGlzYWJsZWQgYXQgKDEyMzM0KTogWzxmZmZmZmZmZjgwMDdlNTJj
Pl0gY29uc29sZV91bmxvY2srMHgxNDAvMHgxODYKPiA+PiBzb2Z0aXJxcyBsYXN0ICBlbmFibGVk
IGF0ICgxMjE1NCk6IFs8ZmZmZmZmZmY4MGE1NjBkMD5dIF9fZG9fc29mdGlycSsweDNiMC8weDQ3
MAo+ID4+IHNvZnRpcnFzIGxhc3QgZGlzYWJsZWQgYXQgKDEyMTQ3KTogWzxmZmZmZmZmZjgwMDE5
MzQwPl0gX19pcnFfZXhpdF9yY3UrMHhhNi8weGQwCj4gPj4gLS0tWyBlbmQgdHJhY2UgMDAwMDAw
MDAwMDAwMDAwMCBdLS0tCj4gPj4gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0t
Cj4gPj4ga2VybmVsIEJVRyBhdCBrZXJuZWwvaXJxX3dvcmsuYzoyNDUhCj4gPj4gS2VybmVsIEJV
RyBbIzFdCj4gPj4gTW9kdWxlcyBsaW5rZWQgaW46Cj4gPj4gQ1BVOiAwIFBJRDogMjE1IENvbW06
IGJhc2ggVGFpbnRlZDogRyAgICAgICAgVyAgICAgICAgICA2LjUuMC1yYzErICM3NTI0Cj4gPj4g
SGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+ID4+IGVwYyA6IGlycV93b3Jr
X3J1bl9saXN0KzB4MzAvMHgzMgo+ID4+ICAgcmEgOiBpcnFfd29ya19ydW4rMHgyYS8weDRjCj4g
Pj4gLi4uCj4gPj4gWzxmZmZmZmZmZjgwMTFhMzQ2Pl0gaXJxX3dvcmtfcnVuX2xpc3QrMHgzMC8w
eDMyCj4gPj4gWzxmZmZmZmZmZjgwMTFhMzcyPl0gaXJxX3dvcmtfcnVuKzB4MmEvMHg0Ywo+ID4+
IFs8ZmZmZmZmZmY4MDBjOWFlYz5dIHNtcGNmZF9keWluZ19jcHUrMHgxMi8weDFjCj4gPj4gWzxm
ZmZmZmZmZjgwMDEyYjJlPl0gY3B1aHBfaW52b2tlX2NhbGxiYWNrKzB4MTI0LzB4MzIyCj4gPj4g
WzxmZmZmZmZmZjgwMDE0MmY4Pl0gX2NwdV91cCsweDIxOC8weDMyMgo+ID4+IFs8ZmZmZmZmZmY4
MDAxNDQ1ZT5dIGNwdV91cCsweDVjLzB4OTgKPiA+PiBbPGZmZmZmZmZmODAwMTRiYjg+XSBjcHVf
ZGV2aWNlX3VwKzB4MTQvMHgxYwo+ID4+IFs8ZmZmZmZmZmY4MDY2ZDY4ZT5dIGNwdV9zdWJzeXNf
b25saW5lKzB4MTAvMHgxOAo+ID4+IFs8ZmZmZmZmZmY4MDY2ODBlOD5dIGRldmljZV9vbmxpbmUr
MHg1Ni8weDcyCj4gPj4gWzxmZmZmZmZmZjgwNjY4MTkwPl0gb25saW5lX3N0b3JlKzB4OGMvMHhh
ZQo+ID4+IFs8ZmZmZmZmZmY4MDY2MmRkZT5dIGRldl9hdHRyX3N0b3JlKzB4ZS8weDFhCj4gPj4g
WzxmZmZmZmZmZjgwMmI1M2JjPl0gc3lzZnNfa2Zfd3JpdGUrMHgyZS8weDRjCj4gPj4gWzxmZmZm
ZmZmZjgwMmI0NzUwPl0ga2VybmZzX2ZvcF93cml0ZV9pdGVyKzB4ZTgvMHgxNGUKPiA+PiBbPGZm
ZmZmZmZmODAyMzAxNzA+XSB2ZnNfd3JpdGUrMHgyYTQvMHgzZTAKPiA+PiBbPGZmZmZmZmZmODAy
MzAzZTg+XSBrc3lzX3dyaXRlKzB4NWUvMHhjOAo+ID4+IFs8ZmZmZmZmZmY4MDIzMDQ2MD5dIHN5
c193cml0ZSsweGUvMHgxNgo+ID4+IFs8ZmZmZmZmZmY4MGE0YThkZT5dIGRvX3RyYXBfZWNhbGxf
dSsweGUwLzB4ZjQKPiA+PiBbPGZmZmZmZmZmODAwMDNlOGM+XSByZXRfZnJvbV9leGNlcHRpb24r
MHgwLzB4NjQKPiA+PiBDb2RlOiA4NTI2IDYwODQgZjBlZiBmNzFmIGZjZTUgNjBlMiA2NDQyIDY0
YTIgNjEwNSA4MDgyICg5MDAyKSAxMTAxCj4gPj4gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAw
MDAwMCBdLS0tCj4gPj4gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEZhdGFsIGV4Y2VwdGlv
biBpbiBpbnRlcnJ1cHQKPiA+PiBTTVA6IHN0b3BwaW5nIHNlY29uZGFyeSBDUFVzCj4gPj4gU01Q
OiBmYWlsZWQgdG8gc3RvcCBzZWNvbmRhcnkgQ1BVcyAwLTEKPiA+PiAtLS1bIGVuZCBLZXJuZWwg
cGFuaWMgLSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uIGluIGludGVycnVwdCBdLS0tCj4g
Pj4KPiA+PiBUbyBhdm9pZCBjYWxsaW5nIHRob3NlIGNoZWNrcyBpbiB0aGUgQ1BVIGhvdC1wbHVn
IHBhdGhzIGFnYWluIGFuZCBhZ2FpbiwKPiA+PiBzaW1wbHkgbW92ZSB0aGUgY2hlY2sgYXQgdGhl
IGJlZ2lubmluZyBvZiB0aGUgY2hlY2tfdW5hbGlnbmVkX2FjY2VzcygpCj4gPj4gZnVuY3Rpb24g
YW5kIHJlbHkgb24gdGhlIHZhbHVlIGRldGVybWluZWQgZHVyaW5nIHRoZSBzeXN0ZW0gYm9vdC4K
PiA+Pgo+ID4+IEZpeGVzOiA1ODRlYTY1NjRiY2EgKCJSSVNDLVY6IFByb2JlIGZvciB1bmFsaWdu
ZWQgYWNjZXNzIHNwZWVkIikKPiA+PiBGaXhlczogYzIwZDM2Y2MyYTIwICgicmlzY3Y6IGRvbid0
IHByb2JlIHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgaWYgYWxyZWFkeSBkb25lIikKPiA+PiBGaXhl
czogNzFjNTRiM2QxNjlkICgicmlzY3Y6IHJlcG9ydCBtaXNhbGlnbmVkIGFjY2Vzc2VzIGVtdWxh
dGlvbiB0byBod3Byb2JlIikKPiA+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpPG0u
c3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiA+IEhpIE1hcmVrLAo+ID4gVGhhbmtzIGZvciB0aGUg
cGF0Y2guIEkgaGFwcGVuZWQgdG8gc3BvdCB0aGF0IGJ1ZyB0b28KPiA+IChjaGVja191bmFsaWdu
ZWRfYWNjZXNzX2VtdWxhdGVkKCkgY2xvYmJlcmluZyB0aGUgcGVyLWNwdSB2YXJpYWJsZQo+ID4g
YmFjayB0byB1bmtub3duKS4gU2luY2UgSSB3YXMgcmVhcnJhbmdpbmcgdGhhdCBjb2RlIHRvIHRy
eSB0byBydW4gdGhlCj4gPiBzcGVlZCBtZWFzdXJlbWVudHMgaW4gcGFyYWxsZWwsIEkgbW92ZWQg
dGhhdCBjaGVjayBhcm91bmQgdG8gaG9wZWZ1bGx5Cj4gPiBzb2x2ZSB0aGUgc2FtZSBpc3N1ZSB5
b3UncmUgcmVwb3J0aW5nLiBDYW4geW91IHNlZSBpZiB0aGlzIHBhdGNoIGFsc28KPiA+IGZpeGVz
IHlvdXIgaXNzdWU6Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMxMTA2MjI1
ODU1LjMxMjE3MjQtMS1ldmFuQHJpdm9zaW5jLmNvbS8KPiA+IC4gSXQncyBhbHNvIGluIFBhbG1l
cidzIGZvci1uZXh0IHRyZWUgYXMgNTVlMGJmNDlhMGQwICgiUklTQy1WOiBQcm9iZQo+ID4gbWlz
YWxpZ25lZCBhY2Nlc3Mgc3BlZWQgaW4gcGFyYWxsZWwiKS4KPgo+IFRoYW5rcyBmb3IgZm9yIHRo
ZSBpbmZvcm1hdGlvbi4gWWVzLCBZb3VyIHBhdGNoIGFsc28gZml4ZXMgdGhpcyBpc3N1ZSwKPiBi
dXQgaXQgaXMgYSBiaXQgaW52YXNpdmUgKGl0IHBlcmZlY3RseSBmaXRzIGZvciB0aGUgLW5leHQg
bWF0ZXJpYWwKPiB0aG91Z2gpLiBNYXliZSBteSBsaXR0bGUgY2xlYW51cCBjb3VsZCBiZSBhcHBs
aWVkIGFzIGEgZml4IGR1cmluZyAtcmMKPiBjeWNsZT8gSXQgaGFzIGFuIGFkdmFudGFnZSB0aGF0
IGl0IGNhbiBiZSBlYXNpbHkgYmFja3BvcnRlZCB0byB2Ni42LXN0YWJsZS4KClRoYXQncyBmaW5l
IHdpdGggbWUuCgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
