Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2698AC10DC2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxLFt8qPVb/79v0oWyoL0TZrWRW7Fr8ReUrinOxkwJo=; b=jEiBZBpLOU9MpU
	fXqsFJSlvUIbP7HJbnScUjx6QiL3F2dMUEwxm6km1H9PyayP70lTS8iMjQM37LfLbnd7G4Zy9QPMV
	dInkvQAw3JXxRYvUf7iiq5ljwyzw/Z/sEWSb0wpilX3m3eY9nKtMll36BakD30+PCQAUTZdPeDQHk
	J0ebiAz7ZNXGYl9/RSM1tpUvcBnFpNNZb2t8pyXvrbzVGBQlahWZOUFU2oixAlYTG8bbGL79taOaL
	4NkOfca6blzZq12Ufc7prflJ4QJ2p/ui5W6XdXVGzOKHz3VysUOlv/h2Qxn7rWmEEdT+n9L1I3b5b
	0anEncAAyLiK6q0elc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8jp1-00BKib-1n;
	Thu, 30 Nov 2023 16:23:27 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8joz-00BKhb-0L
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 16:23:26 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-4644b935a0aso344014137.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 08:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701361403; x=1701966203; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Rz1SfkoBLt1wzKfSCUoXy9avUjy1X29wSOetvydD2A=;
        b=ZzYyLVw6CWl3BBA2afG0RapPFsH1C8q5fDvg+fT6mpmulU5RCFTa0eOtMIQv+QB2qy
         vpQu/jWW0HY6VGxZpTc6BvsbryySjckr9BF8kbpkUyYaiASfSC0N5il8UR0wftu1FUft
         GsiRBtr1/ljje4AjTy0VECp2soR+R2bZLuz5ZRamfq5FYFZZNvMseFmfq4hBEFkqHkr1
         z5n8QrRjpCqy4rj3gJIrPGXjpCV1nmNBCesHHjd4ptIoKPkNbJclU8HDEE3nEYH/pTuG
         o1igAgJ1aheb3da0tOfxAwoGiURipi3GFNpop+C7mVBjD1MAsTMUkMKDgMYwJ1u7VwRp
         aRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701361403; x=1701966203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Rz1SfkoBLt1wzKfSCUoXy9avUjy1X29wSOetvydD2A=;
        b=QOqlANLB7NXlv6USAkTB81i2teANmQNfjEsuHATvSOIKo0auMzuoVStt936ox9OZs/
         3nGnKzW1V5eQG+4MQ1yonnbJV/lNwfpZjRV/oxnpp8KpqLgdzdW00tfjjPkjAI+Bm6ol
         GoK4cl73kmUI2q8VTMtJ8ZV42Mj8QzNMtayaHQ2vR3CUJxAggBxIKqsTmc5lRtXK5PgB
         n5XfhrZFJGqVTXrrKchhcqJa/uUWYRUm/OB408w1RlSuHlLI2yzOXLvTdZynBWzaIT+i
         TKlwqhxFCZzcE7F4VGdTan6xDc/+MfJIyEa+U6IEzQQDDPERGZbg/NaR1+rUv/6SSn7s
         mQZA==
X-Gm-Message-State: AOJu0YzGaYmMA+ulkXtsYzOXDB+SdAaTILOrv0gE7NnNGwAdGwjxj9HU
	NN7DVsNrl2lbyWA1J5nHwGbe4/okD3Ch0Gq/pQw=
X-Google-Smtp-Source: AGHT+IEeLnCxqQ7A3j/755SDmM5BlKzV7pAi/QkjP/SQBY+0Bp1bz64n5BIgfrQ4BicLBjnC7HYNorOLEhX1IY8dU4M=
X-Received: by 2002:a05:6122:2528:b0:49b:289a:cc44 with SMTP id
 cl40-20020a056122252800b0049b289acc44mr20528331vkb.6.1701361403215; Thu, 30
 Nov 2023 08:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20231130125606.64931-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWd3XY8r-Db_JgazCin_xgSmTGttKzAaHGRKAXsM5xJOQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWd3XY8r-Db_JgazCin_xgSmTGttKzAaHGRKAXsM5xJOQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 Nov 2023 16:22:56 +0000
Message-ID: <CA+V-a8uKCfdOXVQ6cEPQfXFdrJQT_NDztt=++o95AQEAeM9GGg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: errata: andes: Probe for IOCP only once in boot stage
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Yu Chien Peter Lin <peterlin@andestech.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_082325_165297_B7BE22AA 
X-CRM114-Status: GOOD (  37.34  )
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBUaHUsIE5vdiAzMCwgMjAy
MyBhdCAyOjM04oCvUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4g
d3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4KPiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCAxOjU2
4oCvUE0gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBG
cm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+Cj4gPgo+ID4gV2UgbmVlZCB0byBwcm9iZSBmb3IgSU9DUCBvbmx5IG9uY2UgZHVyaW5nIGJv
b3Qgc3RhZ2UsIGFzIHdlIHdlcmUgcHJvYmluZwo+ID4gZm9yIElPQ1AgZm9yIGFsbCB0aGUgc3Rh
Z2VzIHRoaXMgY2F1c2VkIHRoZSBiZWxvdyBpc3N1ZSBkdXJpbmcgbW9kdWxlLWluaXQKPiA+IHN0
YWdlLAo+ID4KPiA+IFs5LjAxOTEwNF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJl
cXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzIGZmZmZmZmZmODEwMGQzYTAKPiA+IFs5LjAyNzE1M10g
T29wcyBbIzFdCj4gPiBbOS4wMjk0MjFdIE1vZHVsZXMgbGlua2VkIGluOiByY2FyX2NhbmZkIHJl
bmVzYXNfdXNiaHMgaTJjX3JpaWMgY2FuX2RldiBzcGlfcnNwaSBpMmNfY29yZQo+ID4gWzkuMDM3
Njg2XSBDUFU6IDAgUElEOiA5MCBDb21tOiB1ZGV2ZCBOb3QgdGFpbnRlZCA2LjcuMC1yYzErICM1
Nwo+ID4gWzkuMDQzNzU2XSBIYXJkd2FyZSBuYW1lOiBSZW5lc2FzIFNNQVJDIEVWSyBiYXNlZCBv
biByOWEwN2cwNDNmMDEgKERUKQo+ID4gWzkuMDUwMzM5XSBlcGMgOiByaXNjdl9ub25jb2hlcmVu
dF9zdXBwb3J0ZWQrMHgxMC8weDNlCj4gPiBbOS4wNTU1NThdICByYSA6IGFuZGVzX2VycmF0YV9w
YXRjaF9mdW5jKzB4NGEvMHg1Mgo+ID4gWzkuMDYwNDE4XSBlcGMgOiBmZmZmZmZmZjgwMDBkOGMy
IHJhIDogZmZmZmZmZmY4MDAwZDk1YyBzcCA6IGZmZmZmZmM4MDAzYWJiMDAKPiA+IFs5LjA2NzYw
N10gIGdwIDogZmZmZmZmZmY4MTRlMjVhMCB0cCA6IGZmZmZmZmQ4MDM2MWU1NDAgdDAgOiAwMDAw
MDAwMDAwMDAwMDAwCj4gPiBbOS4wNzQ3OTVdICB0MSA6IDAwMDAwMDAwMDkwMDAzMWUgdDIgOiAw
MDAwMDAwMDAwMDAwMDAxIHMwIDogZmZmZmZmYzgwMDNhYmIyMAo+ID4gWzkuMDgxOTg0XSAgczEg
OiBmZmZmZmZmZjAxNWI1N2M3IGEwIDogMDAwMDAwMDAwMDAwMDAwMCBhMSA6IDAwMDAwMDAwMDAw
MDAwMDEKPiA+IFs5LjA4OTE3Ml0gIGEyIDogMDAwMDAwMDAwMDAwMDAwMCBhMyA6IDAwMDAwMDAw
MDAwMDAwMDAgYTQgOiBmZmZmZmZmZjgxMDBkOGJlCj4gPiBbOS4wOTYzNjBdICBhNSA6IDAwMDAw
MDAwMDAwMDAwMDEgYTYgOiAwMDAwMDAwMDAwMDAwMDAxIGE3IDogMDAwMDAwMDAwOTAwMDMxZQo+
ID4gWzkuMTAzNTQ4XSAgczIgOiBmZmZmZmZmZjAxNWI1N2Q3IHMzIDogMDAwMDAwMDAwMDAwMDAw
MSBzNCA6IDAwMDAwMDAwMDAwMDAzMWUKPiA+IFs5LjExMDczNl0gIHM1IDogODAwMDAwMDAwMDAw
OGE0NSBzNiA6IDAwMDAwMDAwMDAwMDA1MDAgczcgOiAwMDAwMDAwMDAwMDAwMDNmCj4gPiBbOS4x
MTc5MjRdICBzOCA6IGZmZmZmZmM4MDAzYWJkNDggczkgOiBmZmZmZmZmZjAxNWIxMTQwIHMxMDog
ZmZmZmZmZmY4MTUxYTFiMAo+ID4gWzkuMTI1MTEzXSAgczExOiBmZmZmZmZmZjAxNWIxMDAwIHQz
IDogMDAwMDAwMDAwMDAwMDAwMSB0NCA6IGZlZmVmZWZlZmVmZWZlZmYKPiA+IFs5LjEzMjMwMV0g
IHQ1IDogZmZmZmZmZmYwMTViNTdjNyB0NiA6IGZmZmZmZmQ4YjYzYTYwMDAKPiA+IFs5LjEzNzU4
N10gc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTIwIGJhZGFkZHI6IGZmZmZmZmZmODEwMGQzYTAgY2F1
c2U6IDAwMDAwMDAwMDAwMDAwMGYKPiA+IFs5LjE0NTQ2OF0gWzxmZmZmZmZmZjgwMDBkOGMyPl0g
cmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKzB4MTAvMHgzZQo+ID4gWzkuMTUxOTcyXSBbPGZm
ZmZmZmZmODAwMDI3ZTg+XSBfYXBwbHlfYWx0ZXJuYXRpdmVzKzB4ODQvMHg4Ngo+ID4gWzkuMTU3
Nzg0XSBbPGZmZmZmZmZmODAwMDI5YmU+XSBhcHBseV9tb2R1bGVfYWx0ZXJuYXRpdmVzKzB4MTAv
MHgxYQo+ID4gWzkuMTY0MTEzXSBbPGZmZmZmZmZmODAwMDhmY2M+XSBtb2R1bGVfZmluYWxpemUr
MHg1ZS8weDdhCj4gPiBbOS4xNjk1ODNdIFs8ZmZmZmZmZmY4MDA4NWNkNj5dIGxvYWRfbW9kdWxl
KzB4ZmQ4LzB4MTc5Ywo+ID4gWzkuMTc0OTY1XSBbPGZmZmZmZmZmODAwODY2MzA+XSBpbml0X21v
ZHVsZV9mcm9tX2ZpbGUrMHg3Ni8weGFhCj4gPiBbOS4xODA5NDhdIFs8ZmZmZmZmZmY4MDA4Njdm
Nj5dIF9fcmlzY3Zfc3lzX2Zpbml0X21vZHVsZSsweDE3Ni8weDJhOAo+ID4gWzkuMTg3MzY1XSBb
PGZmZmZmZmZmODA4ODk4NjI+XSBkb190cmFwX2VjYWxsX3UrMHhiZS8weDEzMAo+ID4gWzkuMTky
OTIyXSBbPGZmZmZmZmZmODA4OTIwYmM+XSByZXRfZnJvbV9leGNlcHRpb24rMHgwLzB4NjQKPiA+
IFs5LjE5ODU3M10gQ29kZTogMDAwOSBiN2U5IDY3OTcgMDE0ZCBhNzgzIDg1YTcgYzc5OSA0Nzg1
IDA3MTcgMDEwMCAoMDEyMykgYWVmNwo+ID4gWzkuMjA1OTk0XSAtLS1bIGVuZCB0cmFjZSAwMDAw
MDAwMDAwMDAwMDAwIF0tLS0KPiA+Cj4gPiBUaGlzIGlzIGJlY2F1c2Ugd2UgY2FsbGVkIHJpc2N2
X25vbmNvaGVyZW50X3N1cHBvcnRlZCgpIGZvciBhbGwgdGhlIHN0YWdlcwo+ID4gZHVyaW5nIElP
Q1AgcHJvYmUuIHJpc2N2X25vbmNvaGVyZW50X3N1cHBvcnRlZCgpIGZ1bmN0aW9uIHNldHMKPiA+
IG5vbmNvaGVyZW50X3N1cHBvcnRlZCB2YXJpYWJsZSB0byB0cnVlIHdoaWNoIGhhcyBhbiBhbm5v
dGF0aW9uIHNldCB0bwo+ID4gIl9fcm9fYWZ0ZXJfaW5pdCIgZHVlIHRvIHdoaWNoIHdlIHdlcmUg
c2VlaW5nIHRoZSBhYm92ZSBzcGxhdC4gRml4IHRoaXMgYnkKPiA+IHByb2JpbmcgZm9yIElPQ1Ag
b25seSBvbmNlIGluIGJvb3Qgc3RhZ2UgYnkgaGF2aW5nIGEgYm9vbGVhbiB2YXJpYWJsZQo+ID4g
aXNfaW9jcF9wcm9iZV9kb25lIHdoaWNoIHdpbGwgYmUgc2V0IHRvIHRydWUgdXBvbiBJT0NQIHBy
b2JlIGluCj4gPiBlcnJhdGFfcHJvYmVfaW9jcCgpIGFuZCB3ZSBiYWlsIG91dCBlYXJseSBpZiBp
c19pb2NwX3Byb2JlX2RvbmUgaXMgc2V0Lgo+ID4KPiA+IFdoaWxlIGF0IGl0IG1ha2UgcmV0dXJu
IHR5cGUgb2YgZXJyYXRhX3Byb2JlX2lvY3AoKSB0byB2b2lkIGFzIHdlIHdlcmUKPiA+IG5vdCBj
aGVja2luZyB0aGUgcmV0dXJuIHZhbHVlIGluIGFuZGVzX2VycmF0YV9wYXRjaF9mdW5jKCkuCj4g
Pgo+ID4gRml4ZXM6IGUwMjFhZTdmNTE0NSAoInJpc2N2OiBlcnJhdGE6IEFkZCBBbmRlcyBhbHRl
cm5hdGl2ZSBwb3J0cyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFr
YXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiAtLS0KPiA+IHYxLT52Mgo+ID4g
KiBBcyBSSVNDVl9BTFRFUk5BVElWRVNfQk9PVCBzdGFnZSBjYW4gaGFwcGVuIHR3aWNlIGFkZCBh
IGlzX2lvY3BfcHJvYmVfZG9uZQo+ID4gICB2YXJpYWJsZSB0byBwcm9iZSBmb3IgSU9DUCBvbmx5
IG9uY2UuCj4gPiAqIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UKPiA+ICogTWFrZSByZXR1cm4gdmFs
dWUgb2YgZXJyYXRhX3Byb2JlX2lvY3AoKSB0byB2b2lkCj4KPiBUaGFua3MgZm9yIHRoZSB1cGRh
dGUhCj4KPiA+IC0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYwo+ID4gQEAgLTM4LDI5ICszOCwzNiBA
QCBzdGF0aWMgbG9uZyBheDQ1bXBfaW9jcF9zd193b3JrYXJvdW5kKHZvaWQpCj4gPiAgICAgICAg
IHJldHVybiByZXQuZXJyb3IgPyAwIDogcmV0LnZhbHVlOwo+ID4gIH0KPiA+Cj4gPiAtc3RhdGlj
IGJvb2wgZXJyYXRhX3Byb2JlX2lvY3AodW5zaWduZWQgaW50IHN0YWdlLCB1bnNpZ25lZCBsb25n
IGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQpCj4gPiArc3RhdGljIHZvaWQgZXJyYXRhX3By
b2JlX2lvY3AodW5zaWduZWQgaW50IHN0YWdlLCB1bnNpZ25lZCBsb25nIGFyY2hfaWQsIHVuc2ln
bmVkIGxvbmcgaW1waWQpCj4gPiAgewo+ID4gKyAgICAgICBzdGF0aWMgYm9vbCBpc19pb2NwX3By
b2JlX2RvbmU7Cj4KPiBkb25lPwo+Ck9LIEknbGwgcmVuYW1lIGl0IHRvICJkb25lIi4KCj4gPiAr
Cj4gPiAgICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfRVJSQVRBX0FOREVTX0NNTykpCj4g
PiAtICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVy
bjsKPiA+ICsKPiA+ICsgICAgICAgaWYgKGlzX2lvY3BfcHJvYmVfZG9uZSkKPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm47Cj4gPgo+Cj4gV2h5IG5vdCBrZWVwIGl0IHNpbXBsZSwgYW5kIGp1c3Qg
ZG8KPgo+ICAgICBkb25lID0gdHJ1ZTsKPgpPSy4KCj4gaGVyZT8KPiBDYW4gYXJjaF9pZCBvciBp
bXBpZCBzdWRkZW5seSBjaGFuZ2UsIHNvIHlvdSBoYXZlIHRvIHJlY2hlY2s/Ckkgb25seSBjaGVj
ayBhcmNoX2lkIGFuZCBpbXBpZCBoZXJlLiBBcmUgeW91IHN1Z2dlc3RpbmcgSSBkcm9wIGl0PwoK
PiBJZiB0aGUgU0JJIGNhbGwgaW4gYXg0NW1wX2lvY3Bfc3dfd29ya2Fyb3VuZCgpIGZhaWxzLCBp
cyB0aGVyZSByZWFsbHkKPiBhIG5lZWQgdG8gdHJ5IGl0IGFnYWluIGxhdGVyPwo+Ck5vIGlmIGl0
IGZhaWxzIHdlIGp1c3QgY29udGludWUgd2l0aCBhIGJyb2tlbiBzeXN0ZW0uCgpDaGVlcnMsClBy
YWJoYWthcgo+ID4gICAgICAgICBpZiAoYXJjaF9pZCAhPSBBTkRFU1RFQ0hfQVg0NU1QX01BUkNI
SUQgfHwgaW1waWQgIT0gQU5ERVNURUNIX0FYNDVNUF9NSU1QSUQpCj4gPiAtICAgICAgICAgICAg
ICAgcmV0dXJuIGZhbHNlOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiA+Cj4gPiAtICAg
ICAgIGlmICghYXg0NW1wX2lvY3Bfc3dfd29ya2Fyb3VuZCgpKQo+ID4gLSAgICAgICAgICAgICAg
IHJldHVybiBmYWxzZTsKPiA+ICsgICAgICAgaWYgKCFheDQ1bXBfaW9jcF9zd193b3JrYXJvdW5k
KCkpIHsKPiA+ICsgICAgICAgICAgICAgICBpc19pb2NwX3Byb2JlX2RvbmUgPSB0cnVlOwo+ID4g
KyAgICAgICAgICAgICAgIHJldHVybjsKPiA+ICsgICAgICAgfQo+ID4KPiA+ICAgICAgICAgLyog
U2V0IHRoaXMganVzdCB0byBtYWtlIGNvcmUgY2JvIGNvZGUgaGFwcHkgKi8KPiA+ICAgICAgICAg
cmlzY3ZfY2JvbV9ibG9ja19zaXplID0gMTsKPiA+ICAgICAgICAgcmlzY3Zfbm9uY29oZXJlbnRf
c3VwcG9ydGVkKCk7Cj4gPiAtCj4gPiAtICAgICAgIHJldHVybiB0cnVlOwo+ID4gKyAgICAgICBp
c19pb2NwX3Byb2JlX2RvbmUgPSB0cnVlOwo+ID4gIH0KPgo+IEdye29ldGplLGVldGluZ31zLAo+
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPgo+IC0tCj4gR2VlcnQgVXl0dGVyaG9l
dmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1t
NjhrLm9yZwo+Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
