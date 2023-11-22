Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56CFC072A2
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 08:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46cQgGuxnbrW2ulT0BFIAgFlUEDj3BwpqUOg9QoADUE=; b=vpRhmCNQmuWCK7
	qPSQBkvF+yeT6ITwcMR92vALY0pb0yJcypOaPBd8Bwq9Rb7foxH3CWfTa+nAuqOaDqWwd3B4J7jsg
	WpQUkUYUk4okc//SSqyvdakquh/I0qO9kHscPHIM1TP+TiOeAWHUFkOoOzia3hpUFlKq185CcCZmV
	eS6Zt1/NPgV1vW3HvQZ39yAcfOZQvfP6tAs86eXTKHi7Rdf9YPzNPgNWJXcBz6usE1o7YkPHCL5n0
	o2r1dUpLwa6tg0wcXnNE1lOEHQ4lwWPi4YCNlfj/IgzKkpDyrP33+rXLyAQ9utMQ0bwLwLUh+szIq
	aV4WS/Wsx/dRsd4L+yow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iWk-0012wi-0a;
	Wed, 22 Nov 2023 08:24:06 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iWg-0012vW-1E
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 08:24:03 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5c8c26cf056so50622317b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 00:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700641439; x=1701246239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vy1My54yzyi9AiFrv2nlq4bEUpW9uWwjs7YqVEJrmzU=;
        b=L+nA/FL5Reiq+55VK/ssGNJIMvUaLv+enWOXAz576gi70pIMLnUtzst50HoSHbZ+Gn
         2yJ825Gf5qKywvTOOCCK+jlsIAbJsQWACSnfX3mGCgumosYhC4UcSr3PUNQswenwEU45
         8jOlmPaFOMcQEbn+MdJprIvWEziXUg1pp1jZn66J6AjquiryK4UR07YFYFlppLC+2YHY
         EzDamlkTepdQmtmYmYeNJ1nZudEDn2b/1Itt1QoPytangrqiJGK+4sMjb7gofslTfZm8
         PcEcIGDuaRnewyitWJe94tP3p/gV6Cuh722h/byhUnKszMHLHKCL4PGO1dRMsHiX6Myp
         0GdQ==
X-Gm-Message-State: AOJu0YzJB/7AaBqU8dPcBqmfW9nMwuxF9ndCDUQUQBlOgjFG3lP5w5Fy
	w64gf8MdmqE2qDD/BytfvCrps7R9R02UyQ==
X-Google-Smtp-Source: AGHT+IGII4/VFJqh3xQmdbYPtEMPOFl708YPswJrOb10weMYfM/Wft2BxXnfUlA/ur9yp6nD6CbufA==
X-Received: by 2002:a0d:d181:0:b0:5c9:7da2:9670 with SMTP id t123-20020a0dd181000000b005c97da29670mr1328289ywd.33.1700641438866;
        Wed, 22 Nov 2023 00:23:58 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id a190-20020a0dd8c7000000b005a8d713a91esm3557771ywe.15.2023.11.22.00.23.58
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 00:23:58 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-db3a09e96daso2799018276.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 00:23:58 -0800 (PST)
X-Received: by 2002:a25:d742:0:b0:d9a:d16f:dddf with SMTP id
 o63-20020a25d742000000b00d9ad16fdddfmr1200974ybg.24.1700641437861; Wed, 22
 Nov 2023 00:23:57 -0800 (PST)
MIME-Version: 1.0
References: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 09:23:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXozB7PVOZM+SQa9D6Zca3x_+LE63RhmBGPDvmOma1fUA@mail.gmail.com>
Message-ID: <CAMuHMdXozB7PVOZM+SQa9D6Zca3x_+LE63RhmBGPDvmOma1fUA@mail.gmail.com>
Subject: Re: [PATCH] riscv: errata: andes: Probe IOCP during boot stage
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_002402_440159_3F9DE242 
X-CRM114-Status: GOOD (  23.60  )
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

SGkgUHJhYmhha2FyLAoKT24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgOToyNeKAr1BNIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IFdlIHNob3Vs
ZCBiZSBwcm9iaW5nIGZvciBJT0NQIGR1cmluZyBib290IHN0YWdlIG9ubHkuIEFzIHdlIHdlcmUg
cHJvYmluZwo+IGZvciBJT0NQIGZvciBhbGwgdGhlIHN0YWdlcyB0aGlzIGNhdXNlZCB0aGUgYmVs
b3cgaXNzdWUgZHVyaW5nIG1vZHVsZS1pbml0Cj4gc3RhZ2UsCj4KPiBbOS4wMTkxMDRdIFVuYWJs
ZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyBmZmZm
ZmZmZjgxMDBkM2EwCj4gWzkuMDI3MTUzXSBPb3BzIFsjMV0KPiBbOS4wMjk0MjFdIE1vZHVsZXMg
bGlua2VkIGluOiByY2FyX2NhbmZkIHJlbmVzYXNfdXNiaHMgaTJjX3JpaWMgY2FuX2RldiBzcGlf
cnNwaSBpMmNfY29yZQo+IFs5LjAzNzY4Nl0gQ1BVOiAwIFBJRDogOTAgQ29tbTogdWRldmQgTm90
IHRhaW50ZWQgNi43LjAtcmMxKyAjNTcKPiBbOS4wNDM3NTZdIEhhcmR3YXJlIG5hbWU6IFJlbmVz
YXMgU01BUkMgRVZLIGJhc2VkIG9uIHI5YTA3ZzA0M2YwMSAoRFQpCj4gWzkuMDUwMzM5XSBlcGMg
OiByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQrMHgxMC8weDNlCj4gWzkuMDU1NTU4XSAgcmEg
OiBhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYysweDRhLzB4NTIKPiBbOS4wNjA0MThdIGVwYyA6IGZm
ZmZmZmZmODAwMGQ4YzIgcmEgOiBmZmZmZmZmZjgwMDBkOTVjIHNwIDogZmZmZmZmYzgwMDNhYmIw
MAo+IFs5LjA2NzYwN10gIGdwIDogZmZmZmZmZmY4MTRlMjVhMCB0cCA6IGZmZmZmZmQ4MDM2MWU1
NDAgdDAgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWzkuMDc0Nzk1XSAgdDEgOiAwMDAwMDAwMDA5MDAw
MzFlIHQyIDogMDAwMDAwMDAwMDAwMDAwMSBzMCA6IGZmZmZmZmM4MDAzYWJiMjAKPiBbOS4wODE5
ODRdICBzMSA6IGZmZmZmZmZmMDE1YjU3YzcgYTAgOiAwMDAwMDAwMDAwMDAwMDAwIGExIDogMDAw
MDAwMDAwMDAwMDAwMQo+IFs5LjA4OTE3Ml0gIGEyIDogMDAwMDAwMDAwMDAwMDAwMCBhMyA6IDAw
MDAwMDAwMDAwMDAwMDAgYTQgOiBmZmZmZmZmZjgxMDBkOGJlCj4gWzkuMDk2MzYwXSAgYTUgOiAw
MDAwMDAwMDAwMDAwMDAxIGE2IDogMDAwMDAwMDAwMDAwMDAwMSBhNyA6IDAwMDAwMDAwMDkwMDAz
MWUKPiBbOS4xMDM1NDhdICBzMiA6IGZmZmZmZmZmMDE1YjU3ZDcgczMgOiAwMDAwMDAwMDAwMDAw
MDAxIHM0IDogMDAwMDAwMDAwMDAwMDMxZQo+IFs5LjExMDczNl0gIHM1IDogODAwMDAwMDAwMDAw
OGE0NSBzNiA6IDAwMDAwMDAwMDAwMDA1MDAgczcgOiAwMDAwMDAwMDAwMDAwMDNmCj4gWzkuMTE3
OTI0XSAgczggOiBmZmZmZmZjODAwM2FiZDQ4IHM5IDogZmZmZmZmZmYwMTViMTE0MCBzMTA6IGZm
ZmZmZmZmODE1MWExYjAKPiBbOS4xMjUxMTNdICBzMTE6IGZmZmZmZmZmMDE1YjEwMDAgdDMgOiAw
MDAwMDAwMDAwMDAwMDAxIHQ0IDogZmVmZWZlZmVmZWZlZmVmZgo+IFs5LjEzMjMwMV0gIHQ1IDog
ZmZmZmZmZmYwMTViNTdjNyB0NiA6IGZmZmZmZmQ4YjYzYTYwMDAKPiBbOS4xMzc1ODddIHN0YXR1
czogMDAwMDAwMDIwMDAwMDEyMCBiYWRhZGRyOiBmZmZmZmZmZjgxMDBkM2EwIGNhdXNlOiAwMDAw
MDAwMDAwMDAwMDBmCj4gWzkuMTQ1NDY4XSBbPGZmZmZmZmZmODAwMGQ4YzI+XSByaXNjdl9ub25j
b2hlcmVudF9zdXBwb3J0ZWQrMHgxMC8weDNlCj4gWzkuMTUxOTcyXSBbPGZmZmZmZmZmODAwMDI3
ZTg+XSBfYXBwbHlfYWx0ZXJuYXRpdmVzKzB4ODQvMHg4Ngo+IFs5LjE1Nzc4NF0gWzxmZmZmZmZm
ZjgwMDAyOWJlPl0gYXBwbHlfbW9kdWxlX2FsdGVybmF0aXZlcysweDEwLzB4MWEKPiBbOS4xNjQx
MTNdIFs8ZmZmZmZmZmY4MDAwOGZjYz5dIG1vZHVsZV9maW5hbGl6ZSsweDVlLzB4N2EKPiBbOS4x
Njk1ODNdIFs8ZmZmZmZmZmY4MDA4NWNkNj5dIGxvYWRfbW9kdWxlKzB4ZmQ4LzB4MTc5Ywo+IFs5
LjE3NDk2NV0gWzxmZmZmZmZmZjgwMDg2NjMwPl0gaW5pdF9tb2R1bGVfZnJvbV9maWxlKzB4NzYv
MHhhYQo+IFs5LjE4MDk0OF0gWzxmZmZmZmZmZjgwMDg2N2Y2Pl0gX19yaXNjdl9zeXNfZmluaXRf
bW9kdWxlKzB4MTc2LzB4MmE4Cj4gWzkuMTg3MzY1XSBbPGZmZmZmZmZmODA4ODk4NjI+XSBkb190
cmFwX2VjYWxsX3UrMHhiZS8weDEzMAo+IFs5LjE5MjkyMl0gWzxmZmZmZmZmZjgwODkyMGJjPl0g
cmV0X2Zyb21fZXhjZXB0aW9uKzB4MC8weDY0Cj4gWzkuMTk4NTczXSBDb2RlOiAwMDA5IGI3ZTkg
Njc5NyAwMTRkIGE3ODMgODVhNyBjNzk5IDQ3ODUgMDcxNyAwMTAwICgwMTIzKSBhZWY3Cj4gWzku
MjA1OTk0XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPgo+IFRoaXMgaXMg
YmVjYXVzZSB3ZSBjYWxsZWQgcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKCkgZm9yIGFsbCB0
aGUgc3RhZ2VzCj4gZHVyaW5nIElPQ1AgcHJvYmUuIHJpc2N2X25vbmNvaGVyZW50X3N1cHBvcnRl
ZCgpIGZ1bmN0aW9uIHNldHMKPiBub25jb2hlcmVudF9zdXBwb3J0ZWQgdmFyaWFibGUgdG8gdHJ1
ZSB3aGljaCBoYXMgYW4gYW5ub3RhdGlvbiBzZXQgdG8KPiAiX19yb19hZnRlcl9pbml0IiBkdWUg
dG8gd2hpY2ggd2Ugd2VyZSBzZWVpbmcgdGhlIGFib3ZlIHNwbGF0LiBGaXggdGhpcyBieQo+IHBy
b2JpbmcgSU9DUCBkdXJpbmcgYm9vdCBzdGFnZSBvbmx5Lgo+Cj4gRml4ZXM6IGUwMjFhZTdmNTE0
NSAoInJpc2N2OiBlcnJhdGE6IEFkZCBBbmRlcyBhbHRlcm5hdGl2ZSBwb3J0cyIpCj4gU2lnbmVk
LW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVz
YXMuY29tPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKPiAtLS0gYS9hcmNoL3Jpc2N2L2VycmF0
YS9hbmRlcy9lcnJhdGEuYwo+ICsrKyBiL2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5j
Cj4gQEAgLTYwLDcgKzYwLDggQEAgdm9pZCBfX2luaXRfb3JfbW9kdWxlIGFuZGVzX2VycmF0YV9w
YXRjaF9mdW5jKHN0cnVjdCBhbHRfZW50cnkgKmJlZ2luLCBzdHJ1Y3QgYWwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmNoaWQs
IHVuc2lnbmVkIGxvbmcgaW1waWQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzdGFnZSkKPiAgewo+IC0gICAgICAgZXJyYXRhX3By
b2JlX2lvY3Aoc3RhZ2UsIGFyY2hpZCwgaW1waWQpOwo+ICsgICAgICAgaWYgKHN0YWdlID09IFJJ
U0NWX0FMVEVSTkFUSVZFU19CT09UKQo+ICsgICAgICAgICAgICAgICBlcnJhdGFfcHJvYmVfaW9j
cChzdGFnZSwgYXJjaGlkLCBpbXBpZCk7Cj4KPiAgICAgICAgIC8qIHdlIGhhdmUgbm90aGluZyB0
byBwYXRjaCBoZXJlIEFUTSBzbyBqdXN0IHJldHVybiBiYWNrICovCj4gIH0KCkkgYmVsaWV2ZSB0
aGlzIHN0aWxsIGNhdXNlcyBlcnJhdGFfcHJvYmVfaW9jcCgpIHRvIGJlIGNhbGxlZCB0d2ljZToK
b25jZSBmcm9tIGFwcGx5X2Jvb3RfYWx0ZXJuYXRpdmVzKCksIGFuZCBhIHNlY29uZCB0aW1lIChp
ZiBDT05GSUdfTU1VPXkpCmZyb20gYXBwbHlfdmRzb19hbHRlcm5hdGl2ZXMoKS4gIElzIHRoYXQg
T0s/CgpQZXJoYXBzIGluc3RlYWQgeW91IHdhbnQgdG8gYWRkIGEgY2hlY2sgdG8gZXJyYXRhX3By
b2JlX2lvY3AoKSAoYWZ0ZXIKdGhlIGNoZWNrIGZvciBDT05GSUdfRVJSQVRBX0FOREVTX0NNTyks
IHRvIGJhaWwgb3V0IGlmIHRoZSBmdW5jdGlvbgp3YXMgY2FsbGVkIGJlZm9yZT8KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
