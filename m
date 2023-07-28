Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E985C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 20:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twe5EXPNkd83n+HVR31C4mhnLl3kDjabI07BXO8XDeM=; b=SxtVlq2Son22kc
	mXNYDiFwMWWlzKQtRfzCQtq/3ixSV8pEci2eo6kU7+f+tSWvM2LfTvskJefXmYQLT6bMuVVVD7Ape
	fy6NavC+LeAWJARE61ZG8jgDi6K0D8fVxRcSqhxwthTENN+wqKNSPg0XrkhstNdpBLaj6nutgLS8j
	0ZhHrlCScAXeKk0OBpJT0naBz0YBwlfh0Y2ltgIEJoLhPQA88dt/SEkqW/PliQugAn6uDq8jybqld
	TO+5aybc41TTRsf2XSWXVsIBzCAeBeyq1uO9HoSmIUgSvy9NDbc+2KeEXgZ8Ma/50WU0ljh5l/xM8
	Hsz82Paa3TKcd/Xtz9NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPTqP-004wVM-1n;
	Fri, 28 Jul 2023 20:13:49 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPTqM-004wTi-09
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 20:13:47 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7835c92c373so87607639f.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 13:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690575224; x=1691180024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yi4y6ZcKjQCRx6lPzKR1GjQXQiW3JC1NO2YhCreRSs=;
        b=LFoJRO7rVUWGOrOiA5M1sHs/IwoPZG3ma2hhFF7SSOq3xBr3XTEzXqxYyO7Y4BOu3B
         iK6eaNdkX3vdz99+bvsNp0b7gaEktppGU6fjO5kD9iT27fuwxsponurjqdWWgYDqTN79
         aNaq31h0n1+X9o2HbwuDCrhi/V4kn/6VlAv75LY6vCPqFr49wGm5/Pm3czgYpsmiCC8w
         ZQjH0FNyBiThZw659toxayb45B2sDVUIdDWYoKhLZrNIQRn9svy0rF+/6KafFX5+p2+4
         VPTmVmzHzXTYe/xz49we6xqlmyJKwyfgKORgUU3/uFT5t7wmiEJgm9RE5L6DD2hUn2bp
         g4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690575224; x=1691180024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yi4y6ZcKjQCRx6lPzKR1GjQXQiW3JC1NO2YhCreRSs=;
        b=gEgicZGXqntYtJweAwOxcupEQyD9ypALLwwv01tVO4DPKzSr/R8J8SVdsHsFVedQZL
         BCsfA/z467Vj/+Kssm41w+KL7j/Q7XDjDdKTRt/DUpCWCSiREzdG3+8ZlMiz6mJlBdkG
         iNkhx8nfikzBcKEIHs05f6XhvL+FhoWG5103mIE3nnY7ghyHGZZpGUppK2byyezIEcXR
         WobD6IA3shcwiBN+Vp7Iu2LN8kMD9Heq6Czmja/+YmRyGIw34crBAh6Ya+LksVYO5aEb
         6SedOvBKHUS86/lWl+yvshcQTHNALNJ9BK6jW3CMJrwYoLhitMs+hLvak/M0VKg2M+fp
         Z/Lg==
X-Gm-Message-State: ABy/qLYjhos1xKmhdOxUBgvTiT3JWf2WwuD3PpoVN+T92wQhkMSmL3OP
	34cQXicisCoPf2oVQVo6qJpFFEMzo/Z48jJqKhQ=
X-Google-Smtp-Source: APBJJlFWTZEQ6ng+2uju8cCmZwsRwrxZX3okqbaSKeW6MRb/Zg2+oTPl9jAlRLfiuzAvOTYAWMvkDLuIU2LV6NMaCI0=
X-Received: by 2002:a05:6602:381:b0:783:4135:5b96 with SMTP id
 f1-20020a056602038100b0078341355b96mr421356iov.5.1690575223536; Fri, 28 Jul
 2023 13:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230702203429.237615-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAJM55Z_udpELaTdszqwGbOUyOQ3D4ROqmmQ1=_i6Qb8E8pJd1w@mail.gmail.com>
In-Reply-To: <CAJM55Z_udpELaTdszqwGbOUyOQ3D4ROqmmQ1=_i6Qb8E8pJd1w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Jul 2023 21:13:17 +0100
Message-ID: <CA+V-a8tpYHwSNDKh5OKBc-+uP6p55_AOZiwN3cceXjv69Oijmg@mail.gmail.com>
Subject: Re: [PATCH v10 3/6] riscv: mm: dma-noncoherent: nonstandard cache
 operations support
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_131346_083174_46E63AD1 
X-CRM114-Status: GOOD (  29.14  )
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

SGkgRW1pbCwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCk9uIE1vbiwgSnVsIDI0LCAyMDIz
IGF0IDExOjE44oCvQU0gRW1pbCBSZW5uZXIgQmVydGhpbmcKPGVtaWwucmVubmVyLmJlcnRoaW5n
QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCAyIEp1bCAyMDIzIGF0IDIyOjM2LCBQ
cmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9t
OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
Cj4gPgo+ID4gSW50cm9kdWNlIHN1cHBvcnQgZm9yIG5vbnN0YW5kYXJkIG5vbmNvaGVyZW50IHN5
c3RlbXMgaW4gdGhlIFJJU0MtVgo+ID4gYXJjaGl0ZWN0dXJlLiBJdCBlbmFibGVzIGZ1bmN0aW9u
IHBvaW50ZXIgc3VwcG9ydCB0byBoYW5kbGUgY2FjaGUKPiA+IG1hbmFnZW1lbnQgaW4gc3VjaCBz
eXN0ZW1zLgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBjb25maWd1cmF0aW9uIG9wdGlv
biBjYWxsZWQKPiA+ICJSSVNDVl9OT05TVEFOREFSRF9DQUNIRV9PUFMuIiBUaGlzIG9wdGlvbiBp
cyBhIGJvb2xlYW4gZmxhZyB0aGF0Cj4gPiBkZXBlbmRzIG9uICJSSVNDVl9ETUFfTk9OQ09IRVJF
TlQiIGFuZCBlbmFibGVzIHRoZSBmdW5jdGlvbiBwb2ludGVyCj4gPiBzdXBwb3J0IGZvciBjYWNo
ZSBtYW5hZ2VtZW50IGluIG5vbnN0YW5kYXJkIG5vbmNvaGVyZW50IHN5c3RlbXMuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJw
LnJlbmVzYXMuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+Cj4gPiBUZXN0ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+ICMgdHlyZS1raWNraW5nIG9uIGEgZDEKPiA+IC0tLQo+ID4gdjkgLT4g
djEwCj4gPiAqIEFkZGVkIF9fcm9fYWZ0ZXJfaW5pdCBjb21waWxlciBhdHRyaWJ1dGUgZm9yIG5v
bmNvaGVyZW50X2NhY2hlX29wcwo+ID4gKiBSZW5hbWVkIGNsZWFuIC0+IHdiYWNrCj4gPiAqIFJl
bmFtZWQgaW52YWwgLT4gaW52Cj4gPiAqIFJlbmFtZWQgZmx1c2ggLT4gd2JhY2tfaW52Cj4gPgo+
ID4gdjggLT4gdjkKPiA+ICogTmV3IHBhdGNoCj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZG1hLW5vbmNvaGVyZW50LmggfCAyOCArKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jp
c2N2L21tL2RtYS1ub25jb2hlcmVudC5jICAgICAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPiAgYXJjaC9yaXNjdi9tbS9wbWVtLmMgICAgICAgICAgICAgICAgICAgICB8IDEz
ICsrKysrKysKPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKykKPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9kbWEtbm9uY29oZXJlbnQuaAo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25m
aWcKPiA+IGluZGV4IGQ5ZTQ1MWFjODYyYS4uNDJjODZiMTNjNWUxIDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IEBAIC0y
NjUsNiArMjY1LDEzIEBAIGNvbmZpZyBSSVNDVl9ETUFfTk9OQ09IRVJFTlQKPiA+ICAgICAgICAg
c2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0UKPiA+ICAgICAgICAgc2VsZWN0IERN
QV9ESVJFQ1RfUkVNQVAKPiA+Cj4gPiArY29uZmlnIFJJU0NWX05PTlNUQU5EQVJEX0NBQ0hFX09Q
Uwo+ID4gKyAgICAgICBib29sCj4gPiArICAgICAgIGRlcGVuZHMgb24gUklTQ1ZfRE1BX05PTkNP
SEVSRU5UCj4gPiArICAgICAgIGhlbHAKPiA+ICsgICAgICAgICBUaGlzIGVuYWJsZXMgZnVuY3Rp
b24gcG9pbnRlciBzdXBwb3J0IGZvciBub24tc3RhbmRhcmQgbm9uY29oZXJlbnQKPiA+ICsgICAg
ICAgICBzeXN0ZW1zIHRvIGhhbmRsZSBjYWNoZSBtYW5hZ2VtZW50Lgo+ID4gKwo+ID4gIGNvbmZp
ZyBBU19IQVNfSU5TTgo+ID4gICAgICAgICBkZWZfYm9vbCAkKGFzLWluc3RyLC5pbnNuIHIgNTEk
KGNvbW1hKSAwJChjb21tYSkgMCQoY29tbWEpIHQwJChjb21tYSkgdDAkKGNvbW1hKSB6ZXJvKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2RtYS1ub25jb2hlcmVu
dC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9kbWEtbm9uY29oZXJlbnQuaAo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uOTY5Y2YxZjEzNjNhCj4gPiAt
LS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2RtYS1ub25jb2hl
cmVudC5oCj4gPiBAQCAtMCwwICsxLDI4IEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seSAqLwo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIzIFJl
bmVzYXMgRWxlY3Ryb25pY3MgQ29ycC4KPiA+ICsgKi8KPiA+ICsKPiA+ICsjaWZuZGVmIF9fQVNN
X0RNQV9OT05DT0hFUkVOVF9ICj4gPiArI2RlZmluZSBfX0FTTV9ETUFfTk9OQ09IRVJFTlRfSAo+
ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9kbWEtZGlyZWN0Lmg+Cj4gPiArCj4gPiArLyoKPiA+
ICsgKiBzdHJ1Y3QgcmlzY3ZfY2FjaGVfb3BzIC0gU3RydWN0dXJlIGZvciBDTU8gZnVuY3Rpb24g
cG9pbnRlcnMKPiA+ICsgKgo+ID4gKyAqIEB3YmFjazogRnVuY3Rpb24gcG9pbnRlciBmb3IgY2Fj
aGUgd3JpdGViYWNrCj4gPiArICogQGludjogRnVuY3Rpb24gcG9pbnRlciBmb3IgaW52YWxpZGF0
aW5nIGNhY2hlCj4gPiArICogQHdiYWNrX2ludjogRnVuY3Rpb24gcG9pbnRlciBmb3IgZmx1c2hp
bmcgdGhlIGNhY2hlICh3cml0ZWJhY2sgKyBpbnZhbGlkYXRpbmcpCj4gPiArICovCj4gPiArc3Ry
dWN0IHJpc2N2X2NhY2hlX29wcyB7Cj4gPiArICAgICAgIHZvaWQgKCp3YmFjaykocGh5c19hZGRy
X3QgcGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiArICAgICAgIHZvaWQgKCppbnYpKHBo
eXNfYWRkcl90IHBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpOwo+ID4gKyAgICAgICB2b2lkICgq
d2JhY2tfaW52KShwaHlzX2FkZHJfdCBwYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKTsKPgo+IEhp
IFByYWJoYWthcgo+Cj4gSnVzdCBhIHF1aWNrIHF1ZXN0aW9uLiBBZnRlciBBcm5kJ3MgcGF0Y2hz
ZXQgdGhlCj4gYXJjaF9kbWFfY2FjaGV7aW52LHdiYWNrLHdiYWNrX2ludn0gZnVuY3Rpb25zIHRh
a2UgYSBwaHlzX2FkZHJfdCBhbmQKPiBzaXplX3QsIGJ1dCBoZXJlIHlvdSB3YW50IHRoZXNlIGNh
bGxiYWNrcyB0byB0YWtlIGEgcGh5c19hZGRyX3QgYW5kCj4gdW5zaWduZWQgbG9uZyBpbnN0ZWFk
LiBXaHkgbm90IGtlZXAgdGhlbSB1c2luZyBzaXplX3Q/Cj4KQWdyZWVkLCBJIHdpbGwgdXBkYXRl
IGl0IHRvIHVzZSBzaXplX3QgaW5zdGVhZC4KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
