Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A421C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 16:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=llB1pTxgAA2rAvi1gBaGP4ybZCOnIsTeLEHcOSBkV4I=; b=Ih6VgImX+OTH0s
	0C/2+fiROuSQ/xNXbS8ySCPAUCv0hNuyzps4tR5U5dS/SO+qTtcBe0GqDVguL/eWyPwbBxBOAaXuF
	Oen2xh6VirFd4OglaUWnIbbTmqZURs+RhbAw7Ul3QT+mvIUwQxObDExM7wlhy/Jx5uJaiFWkQMmvt
	yJIdkigaJ2Ks+X8P+F2kBq437xAMioFc/wvxqqxjv72CicZL08wJiap5pFd1s6qNtBZBX9i6S8MuX
	x5LlXmLhSw+WIz2rJ3YQ2Y9LyoXV09V0Rln2Qr2zLaUyEWCU0m9z2U+AHtGfyLPo2BNmVSRLM1ofl
	BD3inxm8EObwBIBVG5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kJZ-00BQ9G-1V;
	Thu, 30 Nov 2023 16:55:01 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kJV-00BQ71-2b
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 16:54:59 +0000
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-58d18c224c7so633530eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 08:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701363295; x=1701968095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExIG6L5bm/zoN5KK5bT+DV3TV+i14K4ySOYvxYXP+d8=;
        b=LvxOBGLwLEPZ2GKjsJcX1nbDN/4Rcozhm2VZdV0qVCKysEZZjFhzBEFV1iv8BaYoPM
         tNN8epKU+gTUAQXwiVq+vyyF2vg/cw55iXS0YrUNUrzyzfw10KVSeFCjwBb+9hwYZfm5
         kXVBNDqhgi4Ri0EmXnFkM/gRES49IBpqe+SWeXv9nhQ57JS1BaifI4kDKMrzp22KwWD/
         Zb+lTX5+OkFnZbbFsZM7BYA0jPhXXbL1+RDyhMmj8tLqHjhGomdVl7SmbEwCOlzdzGiw
         PCD1RZdRgNXiKGV9GfDGfwfovYhPLvP+7C240fWVHfPOJepwIp80ahu5rGHyxw4rbiqi
         h6aQ==
X-Gm-Message-State: AOJu0Yzmk1EnTEh1TxspbnjaPfnabl7/zy91NZhRVoqmuSxfaIqEpi5p
	jao3fBuTlxCM+9wOO2RdSTtJ/phcmOPfxA==
X-Google-Smtp-Source: AGHT+IHCPO4oNmY/lgunzOeEAHge+LpQ/QQKZ3j3384mEpLpM+arc+CyCRuvttKFBjmzJQmA3aIjPA==
X-Received: by 2002:a05:6820:1ca2:b0:58d:a213:4447 with SMTP id ct34-20020a0568201ca200b0058da2134447mr134882oob.5.1701363295448;
        Thu, 30 Nov 2023 08:54:55 -0800 (PST)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id bb33-20020a056820162100b00581debbeeb4sm232128oob.1.2023.11.30.08.54.54
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 08:54:55 -0800 (PST)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-58d18c224c7so633506eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 08:54:54 -0800 (PST)
X-Received: by 2002:a05:6358:3102:b0:16d:fb6c:e65e with SMTP id
 c2-20020a056358310200b0016dfb6ce65emr22949188rwe.7.1701363293982; Thu, 30 Nov
 2023 08:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20231130125606.64931-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWd3XY8r-Db_JgazCin_xgSmTGttKzAaHGRKAXsM5xJOQ@mail.gmail.com>
 <CA+V-a8uKCfdOXVQ6cEPQfXFdrJQT_NDztt=++o95AQEAeM9GGg@mail.gmail.com>
 <CAMuHMdVXDBP=rXiaQPFNPzCEY1QrzS5W2wm9=NtkWSwO4_8y2g@mail.gmail.com> <CA+V-a8shubctjQrg4DP-4RVAPg-TOn-twWeg5bL+M2JDsMGBbw@mail.gmail.com>
In-Reply-To: <CA+V-a8shubctjQrg4DP-4RVAPg-TOn-twWeg5bL+M2JDsMGBbw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 17:54:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaybxXhPu0Od=A8YLR4JpgN4fV=Win==Etg1N8c+r4jA@mail.gmail.com>
Message-ID: <CAMuHMdVaybxXhPu0Od=A8YLR4JpgN4fV=Win==Etg1N8c+r4jA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: errata: andes: Probe for IOCP only once in boot stage
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_085457_847871_C840C155 
X-CRM114-Status: GOOD (  38.18  )
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

SGkgUHJhYmhha2FyLAoKT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgNTo1MOKAr1BNIExhZCwgUHJh
Ymhha2FyCjxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gVGh1LCBOb3Yg
MzAsIDIwMjMgYXQgNDoyNuKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+IHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgNToyM+KAr1BNIExhZCwg
UHJhYmhha2FyCj4gPiA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBP
biBUaHUsIE5vdiAzMCwgMjAyMyBhdCAyOjM04oCvUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQg
MTo1NuKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+
ID4gPiA+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJw
LnJlbmVzYXMuY29tPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdlIG5lZWQgdG8gcHJvYmUgZm9yIElP
Q1Agb25seSBvbmNlIGR1cmluZyBib290IHN0YWdlLCBhcyB3ZSB3ZXJlIHByb2JpbmcKPiA+ID4g
PiA+IGZvciBJT0NQIGZvciBhbGwgdGhlIHN0YWdlcyB0aGlzIGNhdXNlZCB0aGUgYmVsb3cgaXNz
dWUgZHVyaW5nIG1vZHVsZS1pbml0Cj4gPiA+ID4gPiBzdGFnZSwKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBbOS4wMTkxMDRdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZp
cnR1YWwgYWRkcmVzcyBmZmZmZmZmZjgxMDBkM2EwCj4gPiA+ID4gPiBbOS4wMjcxNTNdIE9vcHMg
WyMxXQo+ID4gPiA+ID4gWzkuMDI5NDIxXSBNb2R1bGVzIGxpbmtlZCBpbjogcmNhcl9jYW5mZCBy
ZW5lc2FzX3VzYmhzIGkyY19yaWljIGNhbl9kZXYgc3BpX3JzcGkgaTJjX2NvcmUKPiA+ID4gPiA+
IFs5LjAzNzY4Nl0gQ1BVOiAwIFBJRDogOTAgQ29tbTogdWRldmQgTm90IHRhaW50ZWQgNi43LjAt
cmMxKyAjNTcKPiA+ID4gPiA+IFs5LjA0Mzc1Nl0gSGFyZHdhcmUgbmFtZTogUmVuZXNhcyBTTUFS
QyBFVksgYmFzZWQgb24gcjlhMDdnMDQzZjAxIChEVCkKPiA+ID4gPiA+IFs5LjA1MDMzOV0gZXBj
IDogcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKzB4MTAvMHgzZQo+ID4gPiA+ID4gWzkuMDU1
NTU4XSAgcmEgOiBhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYysweDRhLzB4NTIKPiA+ID4gPiA+IFs5
LjA2MDQxOF0gZXBjIDogZmZmZmZmZmY4MDAwZDhjMiByYSA6IGZmZmZmZmZmODAwMGQ5NWMgc3Ag
OiBmZmZmZmZjODAwM2FiYjAwCj4gPiA+ID4gPiBbOS4wNjc2MDddICBncCA6IGZmZmZmZmZmODE0
ZTI1YTAgdHAgOiBmZmZmZmZkODAzNjFlNTQwIHQwIDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gPiA+
ID4gWzkuMDc0Nzk1XSAgdDEgOiAwMDAwMDAwMDA5MDAwMzFlIHQyIDogMDAwMDAwMDAwMDAwMDAw
MSBzMCA6IGZmZmZmZmM4MDAzYWJiMjAKPiA+ID4gPiA+IFs5LjA4MTk4NF0gIHMxIDogZmZmZmZm
ZmYwMTViNTdjNyBhMCA6IDAwMDAwMDAwMDAwMDAwMDAgYTEgOiAwMDAwMDAwMDAwMDAwMDAxCj4g
PiA+ID4gPiBbOS4wODkxNzJdICBhMiA6IDAwMDAwMDAwMDAwMDAwMDAgYTMgOiAwMDAwMDAwMDAw
MDAwMDAwIGE0IDogZmZmZmZmZmY4MTAwZDhiZQo+ID4gPiA+ID4gWzkuMDk2MzYwXSAgYTUgOiAw
MDAwMDAwMDAwMDAwMDAxIGE2IDogMDAwMDAwMDAwMDAwMDAwMSBhNyA6IDAwMDAwMDAwMDkwMDAz
MWUKPiA+ID4gPiA+IFs5LjEwMzU0OF0gIHMyIDogZmZmZmZmZmYwMTViNTdkNyBzMyA6IDAwMDAw
MDAwMDAwMDAwMDEgczQgOiAwMDAwMDAwMDAwMDAwMzFlCj4gPiA+ID4gPiBbOS4xMTA3MzZdICBz
NSA6IDgwMDAwMDAwMDAwMDhhNDUgczYgOiAwMDAwMDAwMDAwMDAwNTAwIHM3IDogMDAwMDAwMDAw
MDAwMDAzZgo+ID4gPiA+ID4gWzkuMTE3OTI0XSAgczggOiBmZmZmZmZjODAwM2FiZDQ4IHM5IDog
ZmZmZmZmZmYwMTViMTE0MCBzMTA6IGZmZmZmZmZmODE1MWExYjAKPiA+ID4gPiA+IFs5LjEyNTEx
M10gIHMxMTogZmZmZmZmZmYwMTViMTAwMCB0MyA6IDAwMDAwMDAwMDAwMDAwMDEgdDQgOiBmZWZl
ZmVmZWZlZmVmZWZmCj4gPiA+ID4gPiBbOS4xMzIzMDFdICB0NSA6IGZmZmZmZmZmMDE1YjU3Yzcg
dDYgOiBmZmZmZmZkOGI2M2E2MDAwCj4gPiA+ID4gPiBbOS4xMzc1ODddIHN0YXR1czogMDAwMDAw
MDIwMDAwMDEyMCBiYWRhZGRyOiBmZmZmZmZmZjgxMDBkM2EwIGNhdXNlOiAwMDAwMDAwMDAwMDAw
MDBmCj4gPiA+ID4gPiBbOS4xNDU0NjhdIFs8ZmZmZmZmZmY4MDAwZDhjMj5dIHJpc2N2X25vbmNv
aGVyZW50X3N1cHBvcnRlZCsweDEwLzB4M2UKPiA+ID4gPiA+IFs5LjE1MTk3Ml0gWzxmZmZmZmZm
ZjgwMDAyN2U4Pl0gX2FwcGx5X2FsdGVybmF0aXZlcysweDg0LzB4ODYKPiA+ID4gPiA+IFs5LjE1
Nzc4NF0gWzxmZmZmZmZmZjgwMDAyOWJlPl0gYXBwbHlfbW9kdWxlX2FsdGVybmF0aXZlcysweDEw
LzB4MWEKPiA+ID4gPiA+IFs5LjE2NDExM10gWzxmZmZmZmZmZjgwMDA4ZmNjPl0gbW9kdWxlX2Zp
bmFsaXplKzB4NWUvMHg3YQo+ID4gPiA+ID4gWzkuMTY5NTgzXSBbPGZmZmZmZmZmODAwODVjZDY+
XSBsb2FkX21vZHVsZSsweGZkOC8weDE3OWMKPiA+ID4gPiA+IFs5LjE3NDk2NV0gWzxmZmZmZmZm
ZjgwMDg2NjMwPl0gaW5pdF9tb2R1bGVfZnJvbV9maWxlKzB4NzYvMHhhYQo+ID4gPiA+ID4gWzku
MTgwOTQ4XSBbPGZmZmZmZmZmODAwODY3ZjY+XSBfX3Jpc2N2X3N5c19maW5pdF9tb2R1bGUrMHgx
NzYvMHgyYTgKPiA+ID4gPiA+IFs5LjE4NzM2NV0gWzxmZmZmZmZmZjgwODg5ODYyPl0gZG9fdHJh
cF9lY2FsbF91KzB4YmUvMHgxMzAKPiA+ID4gPiA+IFs5LjE5MjkyMl0gWzxmZmZmZmZmZjgwODky
MGJjPl0gcmV0X2Zyb21fZXhjZXB0aW9uKzB4MC8weDY0Cj4gPiA+ID4gPiBbOS4xOTg1NzNdIENv
ZGU6IDAwMDkgYjdlOSA2Nzk3IDAxNGQgYTc4MyA4NWE3IGM3OTkgNDc4NSAwNzE3IDAxMDAgKDAx
MjMpIGFlZjcKPiA+ID4gPiA+IFs5LjIwNTk5NF0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAw
MDAwMCBdLS0tCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhpcyBpcyBiZWNhdXNlIHdlIGNhbGxlZCBy
aXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQoKSBmb3IgYWxsIHRoZSBzdGFnZXMKPiA+ID4gPiA+
IGR1cmluZyBJT0NQIHByb2JlLiByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQoKSBmdW5jdGlv
biBzZXRzCj4gPiA+ID4gPiBub25jb2hlcmVudF9zdXBwb3J0ZWQgdmFyaWFibGUgdG8gdHJ1ZSB3
aGljaCBoYXMgYW4gYW5ub3RhdGlvbiBzZXQgdG8KPiA+ID4gPiA+ICJfX3JvX2FmdGVyX2luaXQi
IGR1ZSB0byB3aGljaCB3ZSB3ZXJlIHNlZWluZyB0aGUgYWJvdmUgc3BsYXQuIEZpeCB0aGlzIGJ5
Cj4gPiA+ID4gPiBwcm9iaW5nIGZvciBJT0NQIG9ubHkgb25jZSBpbiBib290IHN0YWdlIGJ5IGhh
dmluZyBhIGJvb2xlYW4gdmFyaWFibGUKPiA+ID4gPiA+IGlzX2lvY3BfcHJvYmVfZG9uZSB3aGlj
aCB3aWxsIGJlIHNldCB0byB0cnVlIHVwb24gSU9DUCBwcm9iZSBpbgo+ID4gPiA+ID4gZXJyYXRh
X3Byb2JlX2lvY3AoKSBhbmQgd2UgYmFpbCBvdXQgZWFybHkgaWYgaXNfaW9jcF9wcm9iZV9kb25l
IGlzIHNldC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBXaGlsZSBhdCBpdCBtYWtlIHJldHVybiB0eXBl
IG9mIGVycmF0YV9wcm9iZV9pb2NwKCkgdG8gdm9pZCBhcyB3ZSB3ZXJlCj4gPiA+ID4gPiBub3Qg
Y2hlY2tpbmcgdGhlIHJldHVybiB2YWx1ZSBpbiBhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYygpLgo+
ID4gPiA+ID4KPiA+ID4gPiA+IEZpeGVzOiBlMDIxYWU3ZjUxNDUgKCJyaXNjdjogZXJyYXRhOiBB
ZGQgQW5kZXMgYWx0ZXJuYXRpdmUgcG9ydHMiKQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFk
IFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4g
PiA+ID4gLS0tCj4gPiA+ID4gPiB2MS0+djIKPiA+ID4gPiA+ICogQXMgUklTQ1ZfQUxURVJOQVRJ
VkVTX0JPT1Qgc3RhZ2UgY2FuIGhhcHBlbiB0d2ljZSBhZGQgYSBpc19pb2NwX3Byb2JlX2RvbmUK
PiA+ID4gPiA+ICAgdmFyaWFibGUgdG8gcHJvYmUgZm9yIElPQ1Agb25seSBvbmNlLgo+ID4gPiA+
ID4gKiBVcGRhdGVkIGNvbW1pdCBtZXNzYWdlCj4gPiA+ID4gPiAqIE1ha2UgcmV0dXJuIHZhbHVl
IG9mIGVycmF0YV9wcm9iZV9pb2NwKCkgdG8gdm9pZAo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzIGZv
ciB0aGUgdXBkYXRlIQo+ID4gPiA+Cj4gPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2VycmF0YS9h
bmRlcy9lcnJhdGEuYwo+ID4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJy
YXRhLmMKPiA+ID4gPiA+IEBAIC0zOCwyOSArMzgsMzYgQEAgc3RhdGljIGxvbmcgYXg0NW1wX2lv
Y3Bfc3dfd29ya2Fyb3VuZCh2b2lkKQo+ID4gPiA+ID4gICAgICAgICByZXR1cm4gcmV0LmVycm9y
ID8gMCA6IHJldC52YWx1ZTsKPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLXN0YXRp
YyBib29sIGVycmF0YV9wcm9iZV9pb2NwKHVuc2lnbmVkIGludCBzdGFnZSwgdW5zaWduZWQgbG9u
ZyBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcGlkKQo+ID4gPiA+ID4gK3N0YXRpYyB2b2lkIGVy
cmF0YV9wcm9iZV9pb2NwKHVuc2lnbmVkIGludCBzdGFnZSwgdW5zaWduZWQgbG9uZyBhcmNoX2lk
LCB1bnNpZ25lZCBsb25nIGltcGlkKQo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ICsgICAgICAgc3Rh
dGljIGJvb2wgaXNfaW9jcF9wcm9iZV9kb25lOwo+ID4gPiA+Cj4gPiA+ID4gZG9uZT8KPiA+ID4g
Pgo+ID4gPiBPSyBJJ2xsIHJlbmFtZSBpdCB0byAiZG9uZSIuCj4gPiA+Cj4gPiA+ID4gPiArCj4g
PiA+ID4gPiAgICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfRVJSQVRBX0FOREVTX0NNTykp
Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybjsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgaWYgKGlzX2lv
Y3BfcHJvYmVfZG9uZSkKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gPiA+ID4g
Pgo+ID4gPiA+Cj4gPiA+ID4gV2h5IG5vdCBrZWVwIGl0IHNpbXBsZSwgYW5kIGp1c3QgZG8KPiA+
ID4gPgo+ID4gPiA+ICAgICBkb25lID0gdHJ1ZTsKPiA+ID4gPgo+ID4gPiBPSy4KPiA+ID4KPiA+
ID4gPiBoZXJlPwo+ID4gPiA+IENhbiBhcmNoX2lkIG9yIGltcGlkIHN1ZGRlbmx5IGNoYW5nZSwg
c28geW91IGhhdmUgdG8gcmVjaGVjaz8KPiA+ID4gSSBvbmx5IGNoZWNrIGFyY2hfaWQgYW5kIGlt
cGlkIGhlcmUuIEFyZSB5b3Ugc3VnZ2VzdGluZyBJIGRyb3AgaXQ/Cj4gPgo+ID4gTm8sIEkgZG8g
bm90IHN1Z2dlc3QgdG8gZHJvcCBpdC4KPiA+IEkgc3VnZ2VzdGVkIG1vdmluZyB0aGUgImRvbmUg
PSB0cnVlIiB1cCwgc28gdGhlIGNoZWNrIGlzIGRvbmUgb25seSBvbmNlLgo+ID4KPiBPSywgSSds
bCBoYXZlIHNvbWV0aGluZyBsaWtlIGJlbG93Ogo+Cj4gc3RhdGljIHZvaWQgZXJyYXRhX3Byb2Jl
X2lvY3AodW5zaWduZWQgaW50IHN0YWdlLCB1bnNpZ25lZCBsb25nCj4gYXJjaF9pZCwgdW5zaWdu
ZWQgbG9uZyBpbXBpZCkKPiB7Cj4gICAgIHN0YXRpYyBib29sIGRvbmU7Cj4KPiAgICAgaWYgKCFJ
U19FTkFCTEVEKENPTkZJR19FUlJBVEFfQU5ERVNfQ01PKSkKPiAgICAgICAgIHJldHVybjsKPgo+
ICAgICBpZiAoZG9uZSkKPiAgICAgICAgIHJldHVybjsKPgo+ICAgICBpZiAoYXJjaF9pZCAhPSBB
TkRFU19BWDQ1TVBfTUFSQ0hJRCB8fCBpbXBpZCAhPSBBTkRFU19BWDQ1TVBfTUlNUElEKQo+ICAg
ICAgICAgcmV0dXJuOwoKUGxlYXNlIG1vdmUgdGhpcyBjaGVjayBiZWxvdyAiZG9uZSA9IHRydWUi
LCBhcyB0aGVyZSBpcyBubyBuZWVkIHRvCmV4ZWN1dGUgdGhpcyBjaGVjayBtdWx0aXBsZSB0aW1l
cy4KCj4gICAgIGRvbmUgPSB0cnVlOwo+Cj4gICAgIGlmICghYXg0NW1wX2lvY3Bfc3dfd29ya2Fy
b3VuZCgpKQo+ICAgICAgICAgcmV0dXJuOwo+Cj4gICAgIC8qIFNldCB0aGlzIGp1c3QgdG8gbWFr
ZSBjb3JlIGNibyBjb2RlIGhhcHB5ICovCj4gICAgIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSA9IDE7
Cj4gICAgIHJpc2N2X25vbmNvaGVyZW50X3N1cHBvcnRlZCgpOwo+IH0KCkdye29ldGplLGVldGlu
Z31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
