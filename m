Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCBBC07E97
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=av6W0hbHSj1JNUYQOiHWZ9E6f+HB9ZebreK5JFhqoBM=; b=0j6I61PLl+i3gM
	qzQKn2j2pyFd4fnQtJEEX5btlYxm1Y1L0Fub4S+HNdnoNZNm6/7nPKqmcA6vsAVzPBgIIcZgi+FTo
	zAgaFnB9SxFlt59R1v6pstsnpf/t7+2e6YNZ7PlmGASTenBUzlYRGCpKIqb01e9wxl66FAJiEj0iC
	AukfL77N5SD4khjOglfHEbXQmEUzpxBqp+GbsxhRb6Yg8UpGXEhSMuok8ZdEs+ACV2rMu/VpJPfYI
	3W9Nfzo8KQCwTqL1LZLF8S8jV3Iqt21TnesJ4etldj36L7jIMw3wrJ63jpHCvfmFSgOuHXoMWGVNx
	F5o2hhUHU+q7iU5T+3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r90HM-00D9Wo-1i;
	Fri, 01 Dec 2023 09:57:48 +0000
Received: from mail-yb1-f174.google.com ([209.85.219.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r90HJ-00D9Ty-10
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 09:57:47 +0000
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db632fef2dcso202370276.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 01:57:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701424662; x=1702029462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDOIqFg4pESUQz8ST7BsU3RSPktSqE3GKIxBJ7SXCTM=;
        b=sIWWWFshWeV2pf/cPFI97ZIoQe+sy58XW+xrIhDRF+X9FX7MlIF4N58QNuQR+cZdZL
         IS81bz5rX0quh4fWZHcocFScqtNn1XxpzD/lrFTzh+tuG0ZoJV+9XFG5CEpKQSn9N/KE
         Ilvv9jldIYJyfSa7OMSbGced+08hpH2/GLHet6xg3uXb8b+IkyxiZwJ88EBnkZn6/MmR
         aooUcyQpAJ6QdY6M9xah0huuxYnvox2CJy/X3+DkA8r81+KWoTiIAUMZAqtxq8fMLCWp
         SWzO0WtvZVtXBFtolgx2nw8faarRRLW2q9boL0MrnZaTMb+Go0grqOBGga4wEColJ0AJ
         MUVA==
X-Gm-Message-State: AOJu0YyfV++ZQJMcm0KOdv5HDc+AOOHa55oT+6xG76Fnr8Q4W1x36QiI
	7RPKWZC5kRJtSpPUwsmMniCN7/PIyK8now==
X-Google-Smtp-Source: AGHT+IECUWsV1I882maUVJAcW17BL5JqLPgkhltXZ4/1nYIgvx1UoPS0fCgWIPVB6x6zfUsEhyFMgw==
X-Received: by 2002:a25:f44d:0:b0:d9a:e397:3b4 with SMTP id p13-20020a25f44d000000b00d9ae39703b4mr23155020ybe.46.1701424662126;
        Fri, 01 Dec 2023 01:57:42 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id a5-20020a259805000000b00d0b0bbe574asm265998ybo.44.2023.12.01.01.57.40
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 01:57:40 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5d33574f64eso18843267b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 01:57:40 -0800 (PST)
X-Received: by 2002:a0d:c607:0:b0:5c8:708f:1ea with SMTP id
 i7-20020a0dc607000000b005c8708f01eamr26098779ywd.32.1701424660131; Fri, 01
 Dec 2023 01:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20231130212647.108746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231130212647.108746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 10:57:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXf=xDeM7qz=n-YNPpkZD25R04RQZMG0C+BP5O6VvMDiA@mail.gmail.com>
Message-ID: <CAMuHMdXf=xDeM7qz=n-YNPpkZD25R04RQZMG0C+BP5O6VvMDiA@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: errata: andes: Probe for IOCP only once in boot stage
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Yu Chien Peter Lin <peterlin@andestech.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_015745_348745_3A91FFC2 
X-CRM114-Status: GOOD (  20.44  )
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

T24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgMTA6MjfigK9QTSBQcmFiaGFrYXIgPHByYWJoYWthci5j
c2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4KPiBXZSBuZWVkIHRvIHByb2JlIGZvciBJ
T0NQIG9ubHkgb25jZSBkdXJpbmcgYm9vdCBzdGFnZSwgYXMgd2Ugd2VyZSBwcm9iaW5nCj4gZm9y
IElPQ1AgZm9yIGFsbCB0aGUgc3RhZ2VzIHRoaXMgY2F1c2VkIHRoZSBiZWxvdyBpc3N1ZSBkdXJp
bmcgbW9kdWxlLWluaXQKPiBzdGFnZSwKPgo+IFs5LjAxOTEwNF0gVW5hYmxlIHRvIGhhbmRsZSBr
ZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzIGZmZmZmZmZmODEwMGQzYTAK
PiBbOS4wMjcxNTNdIE9vcHMgWyMxXQo+IFs5LjAyOTQyMV0gTW9kdWxlcyBsaW5rZWQgaW46IHJj
YXJfY2FuZmQgcmVuZXNhc191c2JocyBpMmNfcmlpYyBjYW5fZGV2IHNwaV9yc3BpIGkyY19jb3Jl
Cj4gWzkuMDM3Njg2XSBDUFU6IDAgUElEOiA5MCBDb21tOiB1ZGV2ZCBOb3QgdGFpbnRlZCA2Ljcu
MC1yYzErICM1Nwo+IFs5LjA0Mzc1Nl0gSGFyZHdhcmUgbmFtZTogUmVuZXNhcyBTTUFSQyBFVksg
YmFzZWQgb24gcjlhMDdnMDQzZjAxIChEVCkKPiBbOS4wNTAzMzldIGVwYyA6IHJpc2N2X25vbmNv
aGVyZW50X3N1cHBvcnRlZCsweDEwLzB4M2UKPiBbOS4wNTU1NThdICByYSA6IGFuZGVzX2VycmF0
YV9wYXRjaF9mdW5jKzB4NGEvMHg1Mgo+IFs5LjA2MDQxOF0gZXBjIDogZmZmZmZmZmY4MDAwZDhj
MiByYSA6IGZmZmZmZmZmODAwMGQ5NWMgc3AgOiBmZmZmZmZjODAwM2FiYjAwCj4gWzkuMDY3NjA3
XSAgZ3AgOiBmZmZmZmZmZjgxNGUyNWEwIHRwIDogZmZmZmZmZDgwMzYxZTU0MCB0MCA6IDAwMDAw
MDAwMDAwMDAwMDAKPiBbOS4wNzQ3OTVdICB0MSA6IDAwMDAwMDAwMDkwMDAzMWUgdDIgOiAwMDAw
MDAwMDAwMDAwMDAxIHMwIDogZmZmZmZmYzgwMDNhYmIyMAo+IFs5LjA4MTk4NF0gIHMxIDogZmZm
ZmZmZmYwMTViNTdjNyBhMCA6IDAwMDAwMDAwMDAwMDAwMDAgYTEgOiAwMDAwMDAwMDAwMDAwMDAx
Cj4gWzkuMDg5MTcyXSAgYTIgOiAwMDAwMDAwMDAwMDAwMDAwIGEzIDogMDAwMDAwMDAwMDAwMDAw
MCBhNCA6IGZmZmZmZmZmODEwMGQ4YmUKPiBbOS4wOTYzNjBdICBhNSA6IDAwMDAwMDAwMDAwMDAw
MDEgYTYgOiAwMDAwMDAwMDAwMDAwMDAxIGE3IDogMDAwMDAwMDAwOTAwMDMxZQo+IFs5LjEwMzU0
OF0gIHMyIDogZmZmZmZmZmYwMTViNTdkNyBzMyA6IDAwMDAwMDAwMDAwMDAwMDEgczQgOiAwMDAw
MDAwMDAwMDAwMzFlCj4gWzkuMTEwNzM2XSAgczUgOiA4MDAwMDAwMDAwMDA4YTQ1IHM2IDogMDAw
MDAwMDAwMDAwMDUwMCBzNyA6IDAwMDAwMDAwMDAwMDAwM2YKPiBbOS4xMTc5MjRdICBzOCA6IGZm
ZmZmZmM4MDAzYWJkNDggczkgOiBmZmZmZmZmZjAxNWIxMTQwIHMxMDogZmZmZmZmZmY4MTUxYTFi
MAo+IFs5LjEyNTExM10gIHMxMTogZmZmZmZmZmYwMTViMTAwMCB0MyA6IDAwMDAwMDAwMDAwMDAw
MDEgdDQgOiBmZWZlZmVmZWZlZmVmZWZmCj4gWzkuMTMyMzAxXSAgdDUgOiBmZmZmZmZmZjAxNWI1
N2M3IHQ2IDogZmZmZmZmZDhiNjNhNjAwMAo+IFs5LjEzNzU4N10gc3RhdHVzOiAwMDAwMDAwMjAw
MDAwMTIwIGJhZGFkZHI6IGZmZmZmZmZmODEwMGQzYTAgY2F1c2U6IDAwMDAwMDAwMDAwMDAwMGYK
PiBbOS4xNDU0NjhdIFs8ZmZmZmZmZmY4MDAwZDhjMj5dIHJpc2N2X25vbmNvaGVyZW50X3N1cHBv
cnRlZCsweDEwLzB4M2UKPiBbOS4xNTE5NzJdIFs8ZmZmZmZmZmY4MDAwMjdlOD5dIF9hcHBseV9h
bHRlcm5hdGl2ZXMrMHg4NC8weDg2Cj4gWzkuMTU3Nzg0XSBbPGZmZmZmZmZmODAwMDI5YmU+XSBh
cHBseV9tb2R1bGVfYWx0ZXJuYXRpdmVzKzB4MTAvMHgxYQo+IFs5LjE2NDExM10gWzxmZmZmZmZm
ZjgwMDA4ZmNjPl0gbW9kdWxlX2ZpbmFsaXplKzB4NWUvMHg3YQo+IFs5LjE2OTU4M10gWzxmZmZm
ZmZmZjgwMDg1Y2Q2Pl0gbG9hZF9tb2R1bGUrMHhmZDgvMHgxNzljCj4gWzkuMTc0OTY1XSBbPGZm
ZmZmZmZmODAwODY2MzA+XSBpbml0X21vZHVsZV9mcm9tX2ZpbGUrMHg3Ni8weGFhCj4gWzkuMTgw
OTQ4XSBbPGZmZmZmZmZmODAwODY3ZjY+XSBfX3Jpc2N2X3N5c19maW5pdF9tb2R1bGUrMHgxNzYv
MHgyYTgKPiBbOS4xODczNjVdIFs8ZmZmZmZmZmY4MDg4OTg2Mj5dIGRvX3RyYXBfZWNhbGxfdSsw
eGJlLzB4MTMwCj4gWzkuMTkyOTIyXSBbPGZmZmZmZmZmODA4OTIwYmM+XSByZXRfZnJvbV9leGNl
cHRpb24rMHgwLzB4NjQKPiBbOS4xOTg1NzNdIENvZGU6IDAwMDkgYjdlOSA2Nzk3IDAxNGQgYTc4
MyA4NWE3IGM3OTkgNDc4NSAwNzE3IDAxMDAgKDAxMjMpIGFlZjcKPiBbOS4yMDU5OTRdIC0tLVsg
ZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQo+Cj4gVGhpcyBpcyBiZWNhdXNlIHdlIGNh
bGxlZCByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQoKSBmb3IgYWxsIHRoZSBzdGFnZXMKPiBk
dXJpbmcgSU9DUCBwcm9iZS4gcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKCkgZnVuY3Rpb24g
c2V0cwo+IG5vbmNvaGVyZW50X3N1cHBvcnRlZCB2YXJpYWJsZSB0byB0cnVlIHdoaWNoIGhhcyBh
biBhbm5vdGF0aW9uIHNldCB0bwo+ICJfX3JvX2FmdGVyX2luaXQiIGR1ZSB0byB3aGljaCB3ZSB3
ZXJlIHNlZWluZyB0aGUgYWJvdmUgc3BsYXQuIEZpeCB0aGlzIGJ5Cj4gcHJvYmluZyBmb3IgSU9D
UCBvbmx5IG9uY2UgaW4gYm9vdCBzdGFnZSBieSBoYXZpbmcgYSBib29sZWFuIHZhcmlhYmxlCj4g
ImRvbmUiIHdoaWNoIHdpbGwgYmUgc2V0IHRvIHRydWUgdXBvbiBJT0NQIHByb2JlIGluIGVycmF0
YV9wcm9iZV9pb2NwKCkKPiBhbmQgd2UgYmFpbCBvdXQgZWFybHkgaWYgImRvbmUiIGlzIHNldCB0
byB0cnVlLgo+Cj4gV2hpbGUgYXQgaXQgbWFrZSByZXR1cm4gdHlwZSBvZiBlcnJhdGFfcHJvYmVf
aW9jcCgpIHRvIHZvaWQgYXMgd2Ugd2VyZQo+IG5vdCBjaGVja2luZyB0aGUgcmV0dXJuIHZhbHVl
IGluIGFuZGVzX2VycmF0YV9wYXRjaF9mdW5jKCkuCj4KPiBGaXhlczogZTAyMWFlN2Y1MTQ1ICgi
cmlzY3Y6IGVycmF0YTogQWRkIEFuZGVzIGFsdGVybmF0aXZlIHBvcnRzIikKPiBTaWduZWQtb2Zm
LWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
Ci0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
