Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E20BC61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LaRXDk3CJhGh4FESV2XPZ1/hwamSlhnnZ5soPCNtRAA=; b=swXdGISeC/WVvd
	fW1hVBdZUTRjezCUa65PP6NITTz6ExiDBLWmIyWx6rxJj7cdb5B2HaawV6EHtni7JG2OYJUSJR3qb
	pK5P3JnZnUDWy564lbkU35vTPTBrVjLG3+0m3wQmK3fjypG3VQO+3X0qpE4FcjqIggkDkRCQry5cM
	bd3cz4IIh6Ra4xWSL0oNNO7DXVnYacs5hYSzrXMab6vJJXPv2StPXI7yGhKKBmKZhyqvowbfqzssb
	sAVUCSsgjTkhO45vm2uokNmDhvteasJGIIy6oCLUDkN74Itp360zSkurg1/zTbadoyoUPfDb1umhX
	4VFAhpmTtRvxvV7VaWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jr0-001LMR-39;
	Wed, 22 Nov 2023 09:49:06 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jqD-001KRt-2s
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 09:48:22 +0000
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-db4050e68f3so401513276.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 01:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646495; x=1701251295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHbDG7xmjaDmF5SrcycK4m6QkPhjKBtcpVNj6/N9Z2c=;
        b=sZAyTZtikiz571NevpCzWn5+/0sqDRmutavu9LiicKvVplrXSnRvXzBSj5Cd6grTko
         kuNQw5lSq3GYVJ7mFqrlSqQHn7MHbyo3w89OdAemTACLM11aJNrWid6VVIrcwrrqpkxb
         UwLqIIF8cIhVRMIX+n0P2HiLDN88N+faehVCGN07Lx1n9edvo5brHqwvyOmq323e3gNt
         +ylGWKFRrARcfnFJOA/DTdg+/7CWhU4A+HRuNbQ9fvPy5Ex7WecirXwC8wgzjZFb1uUf
         2vOHTsR6/AgGRXba/pZFpdfSnm92r7oUEEGjmuteS2iel4NWbaGYK8YnRhwjlLRLyTpw
         RR8g==
X-Gm-Message-State: AOJu0YyMKF4vT9gCbxzhKHG7G9hi4XR1CFF9ddlcbN9wrBqPVayYNJoF
	eXLbzCUkUrwqnYwcM9LznVZ4R367QUeopQ==
X-Google-Smtp-Source: AGHT+IGloHibPY5RSrt1igF47bpAL7YMe/My2taXO0+oYy6sPNtNP8bRkimA5qnbfSzMsmhVz9hCkw==
X-Received: by 2002:a25:244d:0:b0:d9a:4fe7:d374 with SMTP id k74-20020a25244d000000b00d9a4fe7d374mr1478524ybk.6.1700646495111;
        Wed, 22 Nov 2023 01:48:15 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id v127-20020a254885000000b00da041da21e7sm1277976yba.65.2023.11.22.01.48.14
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 01:48:14 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-daead9cde1eso5736224276.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 01:48:14 -0800 (PST)
X-Received: by 2002:a5b:8ca:0:b0:d0f:846c:ef7b with SMTP id
 w10-20020a5b08ca000000b00d0f846cef7bmr1608826ybq.17.1700646493868; Wed, 22
 Nov 2023 01:48:13 -0800 (PST)
MIME-Version: 1.0
References: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXozB7PVOZM+SQa9D6Zca3x_+LE63RhmBGPDvmOma1fUA@mail.gmail.com> <CA+V-a8tfN8goMf=sc2t6dovBsGmFbioWt7cdbOca8QHJF=EP_w@mail.gmail.com>
In-Reply-To: <CA+V-a8tfN8goMf=sc2t6dovBsGmFbioWt7cdbOca8QHJF=EP_w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 10:48:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXZyata02WfphsROjY5fJE0r0AkXyHMoxVK8cAFvnEP1A@mail.gmail.com>
Message-ID: <CAMuHMdXZyata02WfphsROjY5fJE0r0AkXyHMoxVK8cAFvnEP1A@mail.gmail.com>
Subject: Re: [PATCH] riscv: errata: andes: Probe IOCP during boot stage
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014818_027034_F92FAEE6 
X-CRM114-Status: GOOD (  32.52  )
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

SGkgUHJhYmhha2FyLAoKT24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMTA6NDXigK9BTSBMYWQsIFBy
YWJoYWthcgo8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFdlZCwgTm92
IDIyLCAyMDIzIGF0IDg6MjPigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPiB3cm90ZToKPiA+IE9uIFR1ZSwgTm92IDIxLCAyMDIzIGF0IDk6MjXigK9QTSBQcmFi
aGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gRnJvbTogTGFk
IFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4g
Pgo+ID4gPiBXZSBzaG91bGQgYmUgcHJvYmluZyBmb3IgSU9DUCBkdXJpbmcgYm9vdCBzdGFnZSBv
bmx5LiBBcyB3ZSB3ZXJlIHByb2JpbmcKPiA+ID4gZm9yIElPQ1AgZm9yIGFsbCB0aGUgc3RhZ2Vz
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
cm9iaW5nIElPQ1AgZHVyaW5nIGJvb3Qgc3RhZ2Ugb25seS4KPiA+ID4KPiA+ID4gRml4ZXM6IGUw
MjFhZTdmNTE0NSAoInJpc2N2OiBlcnJhdGE6IEFkZCBBbmRlcyBhbHRlcm5hdGl2ZSBwb3J0cyIp
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gPgo+
ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYwo+ID4gPiArKysgYi9h
cmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYwo+ID4gPiBAQCAtNjAsNyArNjAsOCBAQCB2
b2lkIF9faW5pdF9vcl9tb2R1bGUgYW5kZXNfZXJyYXRhX3BhdGNoX2Z1bmMoc3RydWN0IGFsdF9l
bnRyeSAqYmVnaW4sIHN0cnVjdCBhbAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmNoaWQsIHVuc2lnbmVkIGxvbmcgaW1w
aWQsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgc3RhZ2UpCj4gPiA+ICB7Cj4gPiA+IC0gICAgICAgZXJyYXRhX3Byb2JlX2lv
Y3Aoc3RhZ2UsIGFyY2hpZCwgaW1waWQpOwo+ID4gPiArICAgICAgIGlmIChzdGFnZSA9PSBSSVND
Vl9BTFRFUk5BVElWRVNfQk9PVCkKPiA+ID4gKyAgICAgICAgICAgICAgIGVycmF0YV9wcm9iZV9p
b2NwKHN0YWdlLCBhcmNoaWQsIGltcGlkKTsKPiA+ID4KPiA+ID4gICAgICAgICAvKiB3ZSBoYXZl
IG5vdGhpbmcgdG8gcGF0Y2ggaGVyZSBBVE0gc28ganVzdCByZXR1cm4gYmFjayAqLwo+ID4gPiAg
fQo+ID4KPiA+IEkgYmVsaWV2ZSB0aGlzIHN0aWxsIGNhdXNlcyBlcnJhdGFfcHJvYmVfaW9jcCgp
IHRvIGJlIGNhbGxlZCB0d2ljZToKPiA+IG9uY2UgZnJvbSBhcHBseV9ib290X2FsdGVybmF0aXZl
cygpLCBhbmQgYSBzZWNvbmQgdGltZSAoaWYgQ09ORklHX01NVT15KQo+ID4gZnJvbSBhcHBseV92
ZHNvX2FsdGVybmF0aXZlcygpLiAgSXMgdGhhdCBPSz8KPiA+Cj4gSG1tIGR1cmluZyBteSB0ZXN0
aW5nIEkgZGlkbnQgc2VlIHRoaXMgYmVpbmcgY2FsbGVkIHR3aWNlIChtYXliZQo+IGJlY2F1c2Ug
YWx0ZXJuYXRpdmUgc2VjdGlvbiB3YXMgbm90IGZvdW5kKSBpbgo+IGFwcGx5X3Zkc29fYWx0ZXJu
YXRpdmVzKCkuCj4KPiA+IFBlcmhhcHMgaW5zdGVhZCB5b3Ugd2FudCB0byBhZGQgYSBjaGVjayB0
byBlcnJhdGFfcHJvYmVfaW9jcCgpIChhZnRlcgo+ID4gdGhlIGNoZWNrIGZvciBDT05GSUdfRVJS
QVRBX0FOREVTX0NNTyksIHRvIGJhaWwgb3V0IGlmIHRoZSBmdW5jdGlvbgo+ID4gd2FzIGNhbGxl
ZCBiZWZvcmU/Cj4gPgo+IE9LIHNvIEknbGwgaGF2ZSBhIHN0YXRpYyB2YXJpYWJsZSAoInJpc2N2
X25vbmNvaGVyZW50X3NldCIpIGluCj4gZXJyYXRhX3Byb2JlX2lvY3AoKSBhbmQgaWYgaXQncyBi
ZWluZyBzZXQgSSdsbCBiYWlsIG91dCBlYXJseS4KCkp1c3QgY2FsbCBpdCAiZG9uZSIgb3IgImNh
bGxlZCIsIGl0IGNhbiBiZSBhIGxvY2FsIHN0YXRpYyB2YXJpYWJsZSA7LSkKCkdye29ldGplLGVl
dGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
