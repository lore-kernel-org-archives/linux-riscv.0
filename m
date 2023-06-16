Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658CAEB64D8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 12:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTV5bwMd1SYAsPlQ2wlOqqfPQiGpfHCJwmxdXwQXOgY=; b=eFBCJPHExyTmow
	+w7Gkv4UbiUDWJpZPdh/NWiPLgEWRofPRrmtUPGntcFhFxXCUvTYqYN6fu1PispbzJPTb1NGEif/2
	WwsE/0mlxyC6PXIERhDrTxZ7zOup9RWsrnr7Vs7ymZWIrUGflMWaWW5Kiuzjk/+nStEGsVe6msE7t
	oI0v8GarMbEBp0SdXhb9cLD52CAqi4RrQeJqFD+Nf9+sfk+bsmLlkK7YrRjpGVnGLeXR9/k1qXxqZ
	qlU+F6Ai8RfPd1zMRFief7WqRMNhUIu9d5pYdCioiKH/t5gmg5C1wjBMEOpcMIe533cbjIR/53Vk1
	uPlcIrH5HHLcV3cfwC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA8UD-000YfW-33;
	Fri, 16 Jun 2023 12:23:29 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA8UB-000Yek-2A
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 12:23:29 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-77ac59135ebso21014139f.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 05:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686918206; x=1689510206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZhz7YgM6JWkeN2t67VeqyPX8iJ9vmsDBYbVnAPaL3g=;
        b=QY+V/f+bBr4PSt/2Ht9ot0Pj7xPZSgS9tVHbR9hM9bW2P7gxbWhIsdYOsAA5bhxT4g
         FRnIoATqDvRWV/doaQxv7UlK8n0Is/d4y+zaT09Q04M+rHhvyRmWVbuXAdEUTq1wmnX5
         k7O6cViMk3YnaX8lf0Q+iDibpkrRFIGBxGHhEcO/J8pFGMPxp4xDqLkG9JlWoOmvw/mS
         3T3qPmNOdQOQKQCYkHxAB+xtUQxgIdz2t6wLlooEurHATTY7Zpa1YC2RMSRXSLFmZ+tb
         4qfM42pqXK2ezqhsOZZJg213skJido04lgsvo0PNwfZI7EvjHDnv85UQT5zeCTSXYu7A
         p5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686918206; x=1689510206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZhz7YgM6JWkeN2t67VeqyPX8iJ9vmsDBYbVnAPaL3g=;
        b=Bxomn8JgIKmoKloO44lRZG7VI7+oRh+1IYCtNa5NtBSHJZLaQYakh+xHcZos7GJyyh
         8IvNtg+UcRr1RgntS+uKyfTLUENlOYEKKTx3N3yG+wCj5HtYjKg+u1QYu2of/Ju287nZ
         /jXZVtad8HFIpJ/c+Z7nDlY28D5UpcbGevrKJYIj5Eehug5Js9vOzajw2LsyCVIl5lhb
         bs09qTTUDWti0Vzy2h9wJyiwSBI5uv0aDjrFVDGq8FzltS1hrA80OKCemeWrZ+br4ACV
         Ex6Fzq4BQluFtWNCLlKXNMlX2kFSX+lJosB2B/s1nl8I47T8QP3Wpy80Ge5m0JvCNlKE
         hZgw==
X-Gm-Message-State: AC+VfDweG/gh42A8qSWg86QlDJMq0aFIpyuuUGi4AxLE6Q/agXlVBIAv
	FMNDcYxQyO+0wOwbEuTOeGBlryH/AANSSBhUSQA=
X-Google-Smtp-Source: ACHHUZ6UP2QhxkudXsSJQadW+DwhGcn3wuF7ALSz5Z8Exzm26iTW42trlXQmqDsa51Wcscjd25D4r1uRN9wS/MYetew=
X-Received: by 2002:a6b:6d0d:0:b0:77a:c494:b4b9 with SMTP id
 a13-20020a6b6d0d000000b0077ac494b4b9mr1932815iod.20.1686918206451; Fri, 16
 Jun 2023 05:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230614104759.228372-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWApGKsS8DU7-=6j6WaRBDZ8Amig2NtA8f8=PbGKoFQjQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWApGKsS8DU7-=6j6WaRBDZ8Amig2NtA8f8=PbGKoFQjQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 16 Jun 2023 13:23:00 +0100
Message-ID: <CA+V-a8sLmqy0h5vKq5u-f1rsBo7HGhYg-m3vMO+UxSk1EiynDQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/6] riscv: mm: dma-noncoherent: nonstandard cache
 operations support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, 
	linux-riscv@lists.infradead.org, Christoph Hellwig <hch@infradead.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_052327_731800_F67CFD86 
X-CRM114-Status: GOOD (  23.88  )
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBXZWQsIEp1biAxNCwgMjAy
MyBhdCAxOjUz4oCvUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4g
d3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4KPiBPbiBXZWQsIEp1biAxNCwgMjAyMyBhdCAxMjo0
OOKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4g
RnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPgo+ID4KPiA+IEludHJvZHVjZSBzdXBwb3J0IGZvciBub25zdGFuZGFyZCBub25jb2hlcmVu
dCBzeXN0ZW1zIGluIHRoZSBSSVNDLVYKPiA+IGFyY2hpdGVjdHVyZS4gSXQgZW5hYmxlcyBmdW5j
dGlvbiBwb2ludGVyIHN1cHBvcnQgdG8gaGFuZGxlIGNhY2hlCj4gPiBtYW5hZ2VtZW50IGluIHN1
Y2ggc3lzdGVtcy4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgY29uZmlndXJhdGlvbiBv
cHRpb24gY2FsbGVkCj4gPiAiUklTQ1ZfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTLiIgVGhpcyBvcHRp
b24gaXMgYSBib29sZWFuIGZsYWcgdGhhdAo+ID4gZGVwZW5kcyBvbiAiUklTQ1ZfRE1BX05PTkNP
SEVSRU5UIiBhbmQgZW5hYmxlcyB0aGUgZnVuY3Rpb24gcG9pbnRlcgo+ID4gc3VwcG9ydCBmb3Ig
Y2FjaGUgbWFuYWdlbWVudCBpbiBub25zdGFuZGFyZCBub25jb2hlcmVudCBzeXN0ZW1zLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4KPiA+IC0tLQo+ID4gdjggLT4gdjkKPiA+ICogTmV3IHBhdGNoCj4K
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4KPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vZG1hLW5vbmNvaGVyZW50LmgKPiA+IEBAIC0wLDAgKzEsMjgg
QEAKPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCj4gPiAr
LyoKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLgo+
ID4gKyAqLwo+ID4gKwo+ID4gKyNpZm5kZWYgX19BU01fRE1BX05PTkNPSEVSRU5UX0gKPiA+ICsj
ZGVmaW5lIF9fQVNNX0RNQV9OT05DT0hFUkVOVF9ICj4gPiArCj4gPiArI2luY2x1ZGUgPGxpbnV4
L2RtYS1kaXJlY3QuaD4KPiA+ICsKPiA+ICsvKgo+ID4gKyAqIHN0cnVjdCByaXNjdl9jYWNoZV9v
cHMgLSBTdHJ1Y3R1cmUgZm9yIENNTyBmdW5jdGlvbiBwb2ludGVycwo+ID4gKyAqCj4gPiArICog
QGNsZWFuOiBGdW5jdGlvbiBwb2ludGVyIGZvciBjbGVhbiBjYWNoZQo+ID4gKyAqIEBpbnZhbDog
RnVuY3Rpb24gcG9pbnRlciBmb3IgaW52YWxpZGF0ZSBjYWNoZQo+ID4gKyAqIEBmbHVzaDogRnVu
Y3Rpb24gcG9pbnRlciBmb3IgZmx1c2hpbmcgdGhlIGNhY2hlCj4gPiArICovCj4gPiArc3RydWN0
IHJpc2N2X2NhY2hlX29wcyB7Cj4gPiArICAgICAgIHZvaWQgKCpjbGVhbikocGh5c19hZGRyX3Qg
cGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiArICAgICAgIHZvaWQgKCppbnZhbCkocGh5
c19hZGRyX3QgcGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiArICAgICAgIHZvaWQgKCpm
bHVzaCkocGh5c19hZGRyX3QgcGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiArfTsKPgo+
IEkgZ3Vlc3MgdGhlIG5hbWluZyBjYW4gYmUgaW1wcm92ZWQ/Cj4KPiAuY2xlYW4oKSBpcyB1c2Vk
IGJ5IGFyY2hfZG1hX2NhY2hlX3diYWNrKCkgLyBhcmNoX3diX2NhY2hlX3BtZW0oKSwKPiAuaW52
YWwoKSBpcyB1c2VkIGJ5IGFyY2hfZG1hX2NhY2hlX2ludigpIC8gYXJjaF9pbnZhbGlkYXRlX3Bt
ZW0oKSwKPiAuZmx1c2goKSBpcyB1c2VkIGJ5IGFyY2hfZG1hX2NhY2hlX3diYWNrX2ludigpIC8g
YXJjaF9kbWFfcHJlcF9jb2hlcmVudCgpLgo+Cj4gUGVyaGFwcyAud2JhY2soKSwgLmludigpLCAu
d2JhY2tfaW52KCkgYXJlIG1vcmUgY2xlYXI/Cj4KT2sgSSB3aWxsIHVwZGF0ZSBwb2ludGVyIG5h
bWVzIGluIHRoZSBuZXh0IHZlcnNpb24uCgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
