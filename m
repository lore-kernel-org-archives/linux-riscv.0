Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81536C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTcHAPy120pZRlhisLY+gIsFp6CX+kh50El/Hp4JVF0=; b=XTTslhpNcvlATd
	T57EQHD/+nGWrV8T1C5DQz1DdicrqnkBmiLZ7Mq9shx14sxvXmcLQGKQ18l6PBbtjOzePiR6s2oK/
	4A+y/0rX2Hqao6TCFp6obchN+eJ8OHttvdjuuER36PJ/A7jpzrVJR3Y5UPWhQaee9yxr0MUZvUtz0
	QnDMCmqjP02rSQNFr/Qkba7IVfnZgI+lD8HqaTZ7mew/VC4EDiXiMnGMJPJeoob8y5V/lkh8ZiG/c
	ik2K9Ykc97l/FhzYwV70zGKkAztYzxHP5ItmElTLrZZpar2vOK8KdgvnyejrxChhgIYtCduuwh+Ft
	PTEH7AJwISypHG/aOE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8js5-00BLKV-05;
	Thu, 30 Nov 2023 16:26:37 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8js2-00BLJl-1j
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 16:26:36 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5c8c8f731aaso12799717b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 08:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701361593; x=1701966393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dzm/OK6dWfwxFy4S7+eG/Ses5Wb27zKAUsAAq7TyMMo=;
        b=doeIqOjBhsUoA0s4H2inVbWKG02qJ/g+b1/CBrACjbbGWfCcSMFxbS7t3d42FZgq6V
         tn+Pd19fyLL32pdxBVjGvmBVP8vZ7Xb4bBdyAdCl8PMIeWst5dR6iSbMGyvg5NrUTYha
         R2xGopBYsm6b52znWSUoZZCWoMoUBJ6e7i/2GkRFQPdwiJTXZUBT0AvowSUFL25iqN1k
         eJZvzNysamRjAhToZkBDzv5wMKrT+3Bcb0oFB+3yq1Dfio3wdyrAGLDTuXSy6L273Bs1
         q9NVnrhbW01Jx7mavPb0ikL8AbmqKHJDAUeTdyeV4IvzpZYTEhPZtCHL/5xzs2W7/f8T
         EgNA==
X-Gm-Message-State: AOJu0YxqbGgP/gkeP4/0+yDQh3XtjKSz0RnBQSmK4XnBALN5nZha35vd
	K2RPjgh0DocGFNcm9VP9AS4PkdmCAUMx+A==
X-Google-Smtp-Source: AGHT+IEZTisQ0SEC1B1WCWcG6N50W6hUeexDF65P2J2TNRMoIA9pwaIameCJgC+HzGcfLmjot71ExQ==
X-Received: by 2002:a81:5fc2:0:b0:5ca:6f39:91d1 with SMTP id t185-20020a815fc2000000b005ca6f3991d1mr26451743ywb.47.1701361592663;
        Thu, 30 Nov 2023 08:26:32 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id p68-20020a0dff47000000b005c5a08c5c15sm447143ywf.136.2023.11.30.08.26.30
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 08:26:31 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-db35caa1749so1033599276.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 08:26:30 -0800 (PST)
X-Received: by 2002:a25:ac5:0:b0:dae:4b98:16f9 with SMTP id
 188-20020a250ac5000000b00dae4b9816f9mr22852909ybk.0.1701361590415; Thu, 30
 Nov 2023 08:26:30 -0800 (PST)
MIME-Version: 1.0
References: <20231130125606.64931-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWd3XY8r-Db_JgazCin_xgSmTGttKzAaHGRKAXsM5xJOQ@mail.gmail.com> <CA+V-a8uKCfdOXVQ6cEPQfXFdrJQT_NDztt=++o95AQEAeM9GGg@mail.gmail.com>
In-Reply-To: <CA+V-a8uKCfdOXVQ6cEPQfXFdrJQT_NDztt=++o95AQEAeM9GGg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 17:26:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVXDBP=rXiaQPFNPzCEY1QrzS5W2wm9=NtkWSwO4_8y2g@mail.gmail.com>
Message-ID: <CAMuHMdVXDBP=rXiaQPFNPzCEY1QrzS5W2wm9=NtkWSwO4_8y2g@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: errata: andes: Probe for IOCP only once in boot stage
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Yu Chien Peter Lin <peterlin@andestech.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_082634_579457_454A639D 
X-CRM114-Status: GOOD (  37.88  )
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

SGkgUHJhYmhha2FyLAoKT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgNToyM+KAr1BNIExhZCwgUHJh
Ymhha2FyCjxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gVGh1LCBOb3Yg
MzAsIDIwMjMgYXQgMjozNOKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+IHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgMTo1NuKAr1BNIFByYWJo
YWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBGcm9tOiBMYWQg
UHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiA+
Cj4gPiA+IFdlIG5lZWQgdG8gcHJvYmUgZm9yIElPQ1Agb25seSBvbmNlIGR1cmluZyBib290IHN0
YWdlLCBhcyB3ZSB3ZXJlIHByb2JpbmcKPiA+ID4gZm9yIElPQ1AgZm9yIGFsbCB0aGUgc3RhZ2Vz
IHRoaXMgY2F1c2VkIHRoZSBiZWxvdyBpc3N1ZSBkdXJpbmcgbW9kdWxlLWluaXQKPiA+ID4gc3Rh
Z2UsCj4gPiA+Cj4gPiA+IFs5LjAxOTEwNF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5n
IHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzIGZmZmZmZmZmODEwMGQzYTAKPiA+ID4gWzkuMDI3
MTUzXSBPb3BzIFsjMV0KPiA+ID4gWzkuMDI5NDIxXSBNb2R1bGVzIGxpbmtlZCBpbjogcmNhcl9j
YW5mZCByZW5lc2FzX3VzYmhzIGkyY19yaWljIGNhbl9kZXYgc3BpX3JzcGkgaTJjX2NvcmUKPiA+
ID4gWzkuMDM3Njg2XSBDUFU6IDAgUElEOiA5MCBDb21tOiB1ZGV2ZCBOb3QgdGFpbnRlZCA2Ljcu
MC1yYzErICM1Nwo+ID4gPiBbOS4wNDM3NTZdIEhhcmR3YXJlIG5hbWU6IFJlbmVzYXMgU01BUkMg
RVZLIGJhc2VkIG9uIHI5YTA3ZzA0M2YwMSAoRFQpCj4gPiA+IFs5LjA1MDMzOV0gZXBjIDogcmlz
Y3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKzB4MTAvMHgzZQo+ID4gPiBbOS4wNTU1NThdICByYSA6
IGFuZGVzX2VycmF0YV9wYXRjaF9mdW5jKzB4NGEvMHg1Mgo+ID4gPiBbOS4wNjA0MThdIGVwYyA6
IGZmZmZmZmZmODAwMGQ4YzIgcmEgOiBmZmZmZmZmZjgwMDBkOTVjIHNwIDogZmZmZmZmYzgwMDNh
YmIwMAo+ID4gPiBbOS4wNjc2MDddICBncCA6IGZmZmZmZmZmODE0ZTI1YTAgdHAgOiBmZmZmZmZk
ODAzNjFlNTQwIHQwIDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gPiBbOS4wNzQ3OTVdICB0MSA6IDAw
MDAwMDAwMDkwMDAzMWUgdDIgOiAwMDAwMDAwMDAwMDAwMDAxIHMwIDogZmZmZmZmYzgwMDNhYmIy
MAo+ID4gPiBbOS4wODE5ODRdICBzMSA6IGZmZmZmZmZmMDE1YjU3YzcgYTAgOiAwMDAwMDAwMDAw
MDAwMDAwIGExIDogMDAwMDAwMDAwMDAwMDAwMQo+ID4gPiBbOS4wODkxNzJdICBhMiA6IDAwMDAw
MDAwMDAwMDAwMDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAwIGE0IDogZmZmZmZmZmY4MTAwZDhiZQo+
ID4gPiBbOS4wOTYzNjBdICBhNSA6IDAwMDAwMDAwMDAwMDAwMDEgYTYgOiAwMDAwMDAwMDAwMDAw
MDAxIGE3IDogMDAwMDAwMDAwOTAwMDMxZQo+ID4gPiBbOS4xMDM1NDhdICBzMiA6IGZmZmZmZmZm
MDE1YjU3ZDcgczMgOiAwMDAwMDAwMDAwMDAwMDAxIHM0IDogMDAwMDAwMDAwMDAwMDMxZQo+ID4g
PiBbOS4xMTA3MzZdICBzNSA6IDgwMDAwMDAwMDAwMDhhNDUgczYgOiAwMDAwMDAwMDAwMDAwNTAw
IHM3IDogMDAwMDAwMDAwMDAwMDAzZgo+ID4gPiBbOS4xMTc5MjRdICBzOCA6IGZmZmZmZmM4MDAz
YWJkNDggczkgOiBmZmZmZmZmZjAxNWIxMTQwIHMxMDogZmZmZmZmZmY4MTUxYTFiMAo+ID4gPiBb
OS4xMjUxMTNdICBzMTE6IGZmZmZmZmZmMDE1YjEwMDAgdDMgOiAwMDAwMDAwMDAwMDAwMDAxIHQ0
IDogZmVmZWZlZmVmZWZlZmVmZgo+ID4gPiBbOS4xMzIzMDFdICB0NSA6IGZmZmZmZmZmMDE1YjU3
YzcgdDYgOiBmZmZmZmZkOGI2M2E2MDAwCj4gPiA+IFs5LjEzNzU4N10gc3RhdHVzOiAwMDAwMDAw
MjAwMDAwMTIwIGJhZGFkZHI6IGZmZmZmZmZmODEwMGQzYTAgY2F1c2U6IDAwMDAwMDAwMDAwMDAw
MGYKPiA+ID4gWzkuMTQ1NDY4XSBbPGZmZmZmZmZmODAwMGQ4YzI+XSByaXNjdl9ub25jb2hlcmVu
dF9zdXBwb3J0ZWQrMHgxMC8weDNlCj4gPiA+IFs5LjE1MTk3Ml0gWzxmZmZmZmZmZjgwMDAyN2U4
Pl0gX2FwcGx5X2FsdGVybmF0aXZlcysweDg0LzB4ODYKPiA+ID4gWzkuMTU3Nzg0XSBbPGZmZmZm
ZmZmODAwMDI5YmU+XSBhcHBseV9tb2R1bGVfYWx0ZXJuYXRpdmVzKzB4MTAvMHgxYQo+ID4gPiBb
OS4xNjQxMTNdIFs8ZmZmZmZmZmY4MDAwOGZjYz5dIG1vZHVsZV9maW5hbGl6ZSsweDVlLzB4N2EK
PiA+ID4gWzkuMTY5NTgzXSBbPGZmZmZmZmZmODAwODVjZDY+XSBsb2FkX21vZHVsZSsweGZkOC8w
eDE3OWMKPiA+ID4gWzkuMTc0OTY1XSBbPGZmZmZmZmZmODAwODY2MzA+XSBpbml0X21vZHVsZV9m
cm9tX2ZpbGUrMHg3Ni8weGFhCj4gPiA+IFs5LjE4MDk0OF0gWzxmZmZmZmZmZjgwMDg2N2Y2Pl0g
X19yaXNjdl9zeXNfZmluaXRfbW9kdWxlKzB4MTc2LzB4MmE4Cj4gPiA+IFs5LjE4NzM2NV0gWzxm
ZmZmZmZmZjgwODg5ODYyPl0gZG9fdHJhcF9lY2FsbF91KzB4YmUvMHgxMzAKPiA+ID4gWzkuMTky
OTIyXSBbPGZmZmZmZmZmODA4OTIwYmM+XSByZXRfZnJvbV9leGNlcHRpb24rMHgwLzB4NjQKPiA+
ID4gWzkuMTk4NTczXSBDb2RlOiAwMDA5IGI3ZTkgNjc5NyAwMTRkIGE3ODMgODVhNyBjNzk5IDQ3
ODUgMDcxNyAwMTAwICgwMTIzKSBhZWY3Cj4gPiA+IFs5LjIwNTk5NF0gLS0tWyBlbmQgdHJhY2Ug
MDAwMDAwMDAwMDAwMDAwMCBdLS0tCj4gPiA+Cj4gPiA+IFRoaXMgaXMgYmVjYXVzZSB3ZSBjYWxs
ZWQgcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKCkgZm9yIGFsbCB0aGUgc3RhZ2VzCj4gPiA+
IGR1cmluZyBJT0NQIHByb2JlLiByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQoKSBmdW5jdGlv
biBzZXRzCj4gPiA+IG5vbmNvaGVyZW50X3N1cHBvcnRlZCB2YXJpYWJsZSB0byB0cnVlIHdoaWNo
IGhhcyBhbiBhbm5vdGF0aW9uIHNldCB0bwo+ID4gPiAiX19yb19hZnRlcl9pbml0IiBkdWUgdG8g
d2hpY2ggd2Ugd2VyZSBzZWVpbmcgdGhlIGFib3ZlIHNwbGF0LiBGaXggdGhpcyBieQo+ID4gPiBw
cm9iaW5nIGZvciBJT0NQIG9ubHkgb25jZSBpbiBib290IHN0YWdlIGJ5IGhhdmluZyBhIGJvb2xl
YW4gdmFyaWFibGUKPiA+ID4gaXNfaW9jcF9wcm9iZV9kb25lIHdoaWNoIHdpbGwgYmUgc2V0IHRv
IHRydWUgdXBvbiBJT0NQIHByb2JlIGluCj4gPiA+IGVycmF0YV9wcm9iZV9pb2NwKCkgYW5kIHdl
IGJhaWwgb3V0IGVhcmx5IGlmIGlzX2lvY3BfcHJvYmVfZG9uZSBpcyBzZXQuCj4gPiA+Cj4gPiA+
IFdoaWxlIGF0IGl0IG1ha2UgcmV0dXJuIHR5cGUgb2YgZXJyYXRhX3Byb2JlX2lvY3AoKSB0byB2
b2lkIGFzIHdlIHdlcmUKPiA+ID4gbm90IGNoZWNraW5nIHRoZSByZXR1cm4gdmFsdWUgaW4gYW5k
ZXNfZXJyYXRhX3BhdGNoX2Z1bmMoKS4KPiA+ID4KPiA+ID4gRml4ZXM6IGUwMjFhZTdmNTE0NSAo
InJpc2N2OiBlcnJhdGE6IEFkZCBBbmRlcyBhbHRlcm5hdGl2ZSBwb3J0cyIpCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4KPiA+ID4gLS0tCj4gPiA+IHYxLT52Mgo+ID4gPiAqIEFzIFJJU0NWX0FMVEVSTkFU
SVZFU19CT09UIHN0YWdlIGNhbiBoYXBwZW4gdHdpY2UgYWRkIGEgaXNfaW9jcF9wcm9iZV9kb25l
Cj4gPiA+ICAgdmFyaWFibGUgdG8gcHJvYmUgZm9yIElPQ1Agb25seSBvbmNlLgo+ID4gPiAqIFVw
ZGF0ZWQgY29tbWl0IG1lc3NhZ2UKPiA+ID4gKiBNYWtlIHJldHVybiB2YWx1ZSBvZiBlcnJhdGFf
cHJvYmVfaW9jcCgpIHRvIHZvaWQKPiA+Cj4gPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhCj4gPgo+
ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYwo+ID4gPiArKysgYi9h
cmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYwo+ID4gPiBAQCAtMzgsMjkgKzM4LDM2IEBA
IHN0YXRpYyBsb25nIGF4NDVtcF9pb2NwX3N3X3dvcmthcm91bmQodm9pZCkKPiA+ID4gICAgICAg
ICByZXR1cm4gcmV0LmVycm9yID8gMCA6IHJldC52YWx1ZTsKPiA+ID4gIH0KPiA+ID4KPiA+ID4g
LXN0YXRpYyBib29sIGVycmF0YV9wcm9iZV9pb2NwKHVuc2lnbmVkIGludCBzdGFnZSwgdW5zaWdu
ZWQgbG9uZyBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcGlkKQo+ID4gPiArc3RhdGljIHZvaWQg
ZXJyYXRhX3Byb2JlX2lvY3AodW5zaWduZWQgaW50IHN0YWdlLCB1bnNpZ25lZCBsb25nIGFyY2hf
aWQsIHVuc2lnbmVkIGxvbmcgaW1waWQpCj4gPiA+ICB7Cj4gPiA+ICsgICAgICAgc3RhdGljIGJv
b2wgaXNfaW9jcF9wcm9iZV9kb25lOwo+ID4KPiA+IGRvbmU/Cj4gPgo+IE9LIEknbGwgcmVuYW1l
IGl0IHRvICJkb25lIi4KPgo+ID4gPiArCj4gPiA+ICAgICAgICAgaWYgKCFJU19FTkFCTEVEKENP
TkZJR19FUlJBVEFfQU5ERVNfQ01PKSkKPiA+ID4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxz
ZTsKPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gKwo+ID4gPiArICAgICAgIGlm
IChpc19pb2NwX3Byb2JlX2RvbmUpCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gPiA+
Cj4gPgo+ID4gV2h5IG5vdCBrZWVwIGl0IHNpbXBsZSwgYW5kIGp1c3QgZG8KPiA+Cj4gPiAgICAg
ZG9uZSA9IHRydWU7Cj4gPgo+IE9LLgo+Cj4gPiBoZXJlPwo+ID4gQ2FuIGFyY2hfaWQgb3IgaW1w
aWQgc3VkZGVubHkgY2hhbmdlLCBzbyB5b3UgaGF2ZSB0byByZWNoZWNrPwo+IEkgb25seSBjaGVj
ayBhcmNoX2lkIGFuZCBpbXBpZCBoZXJlLiBBcmUgeW91IHN1Z2dlc3RpbmcgSSBkcm9wIGl0PwoK
Tm8sIEkgZG8gbm90IHN1Z2dlc3QgdG8gZHJvcCBpdC4KSSBzdWdnZXN0ZWQgbW92aW5nIHRoZSAi
ZG9uZSA9IHRydWUiIHVwLCBzbyB0aGUgY2hlY2sgaXMgZG9uZSBvbmx5IG9uY2UuCgo+ID4gSWYg
dGhlIFNCSSBjYWxsIGluIGF4NDVtcF9pb2NwX3N3X3dvcmthcm91bmQoKSBmYWlscywgaXMgdGhl
cmUgcmVhbGx5Cj4gPiBhIG5lZWQgdG8gdHJ5IGl0IGFnYWluIGxhdGVyPwo+ID4KPiBObyBpZiBp
dCBmYWlscyB3ZSBqdXN0IGNvbnRpbnVlIHdpdGggYSBicm9rZW4gc3lzdGVtLgo+Cj4gQ2hlZXJz
LAo+IFByYWJoYWthcgo+ID4gPiAgICAgICAgIGlmIChhcmNoX2lkICE9IEFOREVTVEVDSF9BWDQ1
TVBfTUFSQ0hJRCB8fCBpbXBpZCAhPSBBTkRFU1RFQ0hfQVg0NU1QX01JTVBJRCkKPiA+ID4gLSAg
ICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsK
PiA+ID4KPiA+ID4gLSAgICAgICBpZiAoIWF4NDVtcF9pb2NwX3N3X3dvcmthcm91bmQoKSkKPiA+
ID4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gKyAgICAgICBpZiAoIWF4NDVt
cF9pb2NwX3N3X3dvcmthcm91bmQoKSkgewo+ID4gPiArICAgICAgICAgICAgICAgaXNfaW9jcF9w
cm9iZV9kb25lID0gdHJ1ZTsKPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gKyAg
ICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAgICAgLyogU2V0IHRoaXMganVzdCB0byBtYWtlIGNvcmUg
Y2JvIGNvZGUgaGFwcHkgKi8KPiA+ID4gICAgICAgICByaXNjdl9jYm9tX2Jsb2NrX3NpemUgPSAx
Owo+ID4gPiAgICAgICAgIHJpc2N2X25vbmNvaGVyZW50X3N1cHBvcnRlZCgpOwo+ID4gPiAtCj4g
PiA+IC0gICAgICAgcmV0dXJuIHRydWU7Cj4gPiA+ICsgICAgICAgaXNfaW9jcF9wcm9iZV9kb25l
ID0gdHJ1ZTsKPiA+ID4gIH0KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
