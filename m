Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0A1EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcAFI3gIdEA03OK3cBpou9it0UvoS6sqvU1VgmcsqRs=; b=Mk0WV0pVGTvh7+
	GJpguzSueDTce/mFTVseTcBE/o1CIS3pCRcAgWD6OsPLA7OcF9N2E2CRJXm5Te/KPcGIBm7yj0nBA
	5D6iVk4KtC4FbPWU/HA9gMAigLnA452UI8HM9S76a/IiyAS7P9oKICEM/Vi+moFNwQdlx8J8RkPMf
	j08C+Ui7d7gC9BsqCqPxVIt+B1ckPXPQbsYgCdA7lV7HdHsnB2NvSwfxEqByQPxkooJZybe6k7/BQ
	y1K77wIGMS2Espu0YnyzSpNnJkFdgJFGnW7q93dkU17u5Lz9Nj7p4BqnBx6TNmf2ROyC8xC9neyvZ
	ejoKGzjxn1g+H8ovB7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA8LI-000XZi-1J;
	Fri, 16 Jun 2023 12:14:16 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA8LF-000XYO-1Q
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 12:14:14 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-77ad3bba2a9so23916439f.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 05:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686917651; x=1689509651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVXfmE9xuqvJBkC+/tsNkqbXmSmcyqz9tBTp7H4fW+s=;
        b=Dm5UP0cq9vx0CoXvsXIryqw8idxJ2dtcwVacxjTrmAU9AR6CvAa9+/4i+scxeoC8Vo
         dfPkhHBacDXFYB/BCowsuEN6nyqZVA+z/TddxswHEMZ1IOjShH6gieq+VxwvGetmMKp4
         0l989bM/DyQJcCFMTOK+kEqHG8i8vt1Y1A903YL/Sp78hSXrciNgy0uHsDarFMKetsa3
         LqYiJCuW6gWs17nAg7Aak2DCjJPImSKAz45kewQUwE95OZLVDRMTmZCW1fgPgIa1qr2w
         ieuXTW2ROTAwUgwIQ06NV2F0Tvm98mk8CA32KhZkLm20BLGv7YQz0r/qHWK8ftVn0ViL
         mjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686917651; x=1689509651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVXfmE9xuqvJBkC+/tsNkqbXmSmcyqz9tBTp7H4fW+s=;
        b=G90r7BlDBIs8bL2KtnsH1sm7O2zv/JS5i3e2TJ0cGWlaZn1VVZ/hLffqIOgCYbcNOV
         BVFRlhm/tglalSuk/bLLKvoPFWrhFMf+hJQ4nlcKyFX6V0JXKqCDo4D23XSBCuzN1BZy
         Tz5hMCSJq89rIy7g50+M/uTjYRBX8oOyiWKIn8vauS/IwDEp9gtVRwYQvoe5xi9SioZo
         N8SC5y3EsX8DyOL7TAy4mCIAIcV8Cznv1KWWngkQZrHcLv0bYuLusKB8x6DMQpMpQbfi
         unJrkmtsoynSQXmUGZgaZrAE0+mdG6gqQSPaK4FahR9IEoa/k5uvH6dMDis5oyiSt42E
         j+bA==
X-Gm-Message-State: AC+VfDxnkqjOS+Ldd6HOkUtq55TAayFVug8JIDXlCC21MO46OcfBEJHx
	5xiWZZTv0Va0yzatYqJccsam2by5i1Ux7XiPJMI=
X-Google-Smtp-Source: ACHHUZ5+cE31rc8cUVpUMXCOk4ewlhmB9UuvLujSALdXjEdrUSwm63nNo3tivuZ1BqaABQ7eapNgTyAZw+ETZDWWmGA=
X-Received: by 2002:a5e:c103:0:b0:753:42d:25ec with SMTP id
 v3-20020a5ec103000000b00753042d25ecmr2481529iol.20.1686917651264; Fri, 16 Jun
 2023 05:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230614104759.228372-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <4f69fcfe-debb-4979-9070-1d58ba35032c@app.fastmail.com>
In-Reply-To: <4f69fcfe-debb-4979-9070-1d58ba35032c@app.fastmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 16 Jun 2023 13:13:44 +0100
Message-ID: <CA+V-a8utPvBdwR78NVxpnuUWgniVvopnK4PvmWGEfkfSv5AQHQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/6] riscv: mm: dma-noncoherent: nonstandard cache
 operations support
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, guoren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_051413_485655_7973C346 
X-CRM114-Status: GOOD (  18.41  )
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

SGkgQXJuZCwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCk9uIFdlZCwgSnVuIDE0LCAyMDIz
IGF0IDE6MzbigK9QTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPgo+IE9u
IFdlZCwgSnVuIDE0LCAyMDIzLCBhdCAxMjo0NywgUHJhYmhha2FyIHdyb3RlOgo+ID4gRnJvbTog
TGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+
ID4KPiA+IEludHJvZHVjZSBzdXBwb3J0IGZvciBub25zdGFuZGFyZCBub25jb2hlcmVudCBzeXN0
ZW1zIGluIHRoZSBSSVNDLVYKPiA+IGFyY2hpdGVjdHVyZS4gSXQgZW5hYmxlcyBmdW5jdGlvbiBw
b2ludGVyIHN1cHBvcnQgdG8gaGFuZGxlIGNhY2hlCj4gPiBtYW5hZ2VtZW50IGluIHN1Y2ggc3lz
dGVtcy4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgY29uZmlndXJhdGlvbiBvcHRpb24g
Y2FsbGVkCj4gPiAiUklTQ1ZfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTLiIgVGhpcyBvcHRpb24gaXMg
YSBib29sZWFuIGZsYWcgdGhhdAo+ID4gZGVwZW5kcyBvbiAiUklTQ1ZfRE1BX05PTkNPSEVSRU5U
IiBhbmQgZW5hYmxlcyB0aGUgZnVuY3Rpb24gcG9pbnRlcgo+ID4gc3VwcG9ydCBmb3IgY2FjaGUg
bWFuYWdlbWVudCBpbiBub25zdGFuZGFyZCBub25jb2hlcmVudCBzeXN0ZW1zLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4KPgo+IEkgdW5kZXJzdGFuZCB0aGF0IENocmlzdG9waCB3aWxsIHN0aWxsIG5v
dCBsaWtlIHRoaXMsIGJ1dCBJIHRoaW5rIHRoaXMKPiBpcyBhcyBnb29kIGFzIGl0IGdldHMsIG1h
a2luZyB0aGUgc3RhbmRhcmQgdmFyaWFudCB0aGUgZmFzdCBwYXRoLAo+IGFuZCB1c2luZyB0aGUg
ZnVuY3Rpb24gcG9pbnRlcnMgb25seSBmb3IgdGhlIG5vbnN0YW5kYXJkIGNhc2VzLgo+Cj4KPiA+
ICAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2RtYS1ub25j
b2hlcmVudC5oPgo+ID4KPiA+ICBzdGF0aWMgYm9vbCBub25jb2hlcmVudF9zdXBwb3J0ZWQ7Cj4g
Pgo+ID4gK3N0cnVjdCByaXNjdl9jYWNoZV9vcHMgbm9uY29oZXJlbnRfY2FjaGVfb3BzID0gewo+
ID4gKyAgICAgLmNsZWFuID0gTlVMTCwKPiA+ICsgICAgIC5pbnZhbCA9IE5VTEwsCj4gPiArICAg
ICAuZmx1c2ggPSBOVUxMLAo+ID4gK307Cj4KPiBUaGlzIGNvdWxkIGJlIG1hcmtlZCBfX3JlYWRf
bW9zdGx5IG9yIF9fcm9fYWZ0ZXJfaW5pdCBhcwo+IGEgbWljcm8tb3B0aW1pemF0aW9uLCBpZiBh
bnlvbmUgY2FyZXMuCj4KT2ssIEkgd2lsbCBkbyB0aGF0IGluIHRoZSBuZXh0IHZlcnNpb24uCgpD
aGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
