Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F693C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIJ44Vz8wnd8SwQnXWe+hnUwtTRFsH/hN7ihY6J2lvQ=; b=WLfhLJtDWfrMO2
	z9cOS6P/3vV/m55Ac1cTEg4D6xRX0HXtEYWO8jfV0E0jXzkNyvzOsz/d3HfIG2T9bHiTT6wCrLEv4
	OGRmQTkBClygXxMbOlHBwGnyLTBceZ5Hcp/XoOlhPeB6FWkd2g4s0ccfpyUoHdqKS8d2QxbD0Pw01
	effiSm/GryiBIW5+7uiaALtB9pXctEBbgVk9QM/gHIk/LfiqGifobj6SpqjgrDY755a6bsjyhNsCO
	KqYP3MYQcXW+z5Ek92MhsLr2sGTFgk1M1gMA23mt2CPLbxdXGBpd06LO5EHrvJoZ5D1QOBXUvdDx5
	x9iC8Dt0liSL//gpHYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5TxQ-000Iqr-Ta; Wed, 14 Dec 2022 15:46:08 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5SqD-00HJwC-Vy
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 14:34:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id qk9so45009112ejc.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Dec 2022 06:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NpdIC9yfEfML+JTsasPerHswhdeXgtUUncwQhuMnyqE=;
        b=XLKf1zw+Pg5X/5RU+NqTJXZbD6289aN9/me5ZGVd8EVaQRYyJ2A1JlBdG/Z3vsSDhk
         Qmz9aiiZNObRESdS/CH7NwQdJvzHJFIDjkC0casil4G4a0N9QFE5mfSjYWXd8ZJ15YF4
         rGJgGKsHjpVfDDZj6p5BrCfquqIHmoSjSxlcAftAz1JUO8wSbof7/g91hgr1+XKPPePu
         kfMlDQb3+qMJ6DUrRCH6VLm3UIt74/cQiWtTtE3ylBHYgQVQ6Aor3fbMntGxp9AmnQtV
         ejTOcc664SpZgkLUI0eTSEsPKw0r8GbVeA1KvrhoplnpFLRnnWk+D6rtNKmjsnXEgo5H
         Iehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NpdIC9yfEfML+JTsasPerHswhdeXgtUUncwQhuMnyqE=;
        b=kzvVtmF/qDYhdJZaFDanjqIfkemoMw2E70hu5+cPaUjPvv1AMZGy8mYrN24x48f25A
         +L1cG7WC19aYWFlK00n826/lVakwOp2Vkm8mElzfgPX4v3XaTbB0O9yPEMtZDk2gwi2+
         EtbbMscCvoITyfaAdLEg36972Mo2uLwTgMvFGPedq5quhxHz3LjMqHsqTf686aslb+ou
         2CMVBBe1rUYkMPXggRgbGUpdldeaYdBfA1Bv9nTPaKk7BZHMit279fjie4KmIlgxPZW7
         IyiZxj4AQ5QpLs8ONGufU6PeqpKJCOpzMGGkG1VmSHYMZvzK2jiAanpWaSE2Wko0uIO1
         Y01A==
X-Gm-Message-State: ANoB5pmmWq0Why+l7EHGv47rTFKZaqGL7tuLmYtAmzDTn9RcSuMViDES
	aLPCpTJJ7Iv2gWiAMURcE7Zi4w==
X-Google-Smtp-Source: AA0mqf6CmxqK+9dd28/XPm5VnoWGfEXLHPyKVsjaVNohL2FH1YAqanoPm55ZEQuTbm9gGFjhahizfg==
X-Received: by 2002:a17:906:1d01:b0:7c1:36:9002 with SMTP id n1-20020a1709061d0100b007c100369002mr20212671ejh.67.1671028474394;
        Wed, 14 Dec 2022 06:34:34 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm5896464ejc.48.2022.12.14.06.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 06:34:33 -0800 (PST)
Date: Wed, 14 Dec 2022 15:34:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>, Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 1/6] riscv: asm: alternative-macros: Introduce
 ALTERNATIVE_3() macro
Message-ID: <20221214143432.4micw2gipvhfqwoa@kamzik>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXXXN9g8o1j7k-TC=F-kuyf-KngFSKi7z9z0SY9BLxmHA@mail.gmail.com>
 <CA+V-a8s9iAtFVzdA4R_tSMuBTkoY3JmZ12MJw__Pgfyetsz34g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8s9iAtFVzdA4R_tSMuBTkoY3JmZ12MJw__Pgfyetsz34g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_063438_061651_AB36851A 
X-CRM114-Status: GOOD (  31.92  )
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

T24gVHVlLCBEZWMgMTMsIDIwMjIgYXQgMDU6NDk6MzJQTSArMDAwMCwgTGFkLCBQcmFiaGFrYXIg
d3JvdGU6Cj4gSGkgR2VlcnQsCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lgo+IAo+IE9u
IFR1ZSwgRGVjIDEzLCAyMDIyIGF0IDU6MjEgUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBs
aW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgUHJhYmhha2FyLAo+ID4KPiA+IE9uIE1v
biwgRGVjIDEyLCAyMDIyIGF0IDEyOjU4IFBNIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0Bn
bWFpbC5jb20+IHdyb3RlOgo+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiA+Cj4gPiA+IEludHJvZHVjZSBBTFRFUk5B
VElWRV8zKCkgbWFjcm8uCj4gPiA+Cj4gPiA+IEEgdmVuZG9yIHdhbnRzIHRvIHJlcGxhY2UgYW4g
b2xkX2NvbnRlbnQsIGJ1dCBhbm90aGVyIHZlbmRvciBoYXMgdXNlZAo+ID4gPiBBTFRFUk5BVElW
RV8yKCkgdG8gcGF0Y2ggaXRzIGN1c3RvbWl6ZWQgY29udGVudCBhdCB0aGUgc2FtZSBsb2NhdGlv
bi4KPiA+ID4gSW4gdGhpcyBjYXNlLCB0aGlzIHZlbmRvciBjYW4gdXNlIG1hY3JvIEFMVEVSTkFU
SVZFXzMoKSBhbmQgdGhlbiByZXBsYWNlCj4gPiA+IEFMVEVSTkFUSVZFXzIoKSB3aXRoIEFMVEVS
TkFUSVZFXzMoKSB0byBhcHBlbmQgaXRzIGN1c3RvbWl6ZWQgY29udGVudC4KPiA+ID4KPiA+ID4g
V2hpbGUgYXQgaXQgdXBkYXRlIGNvbW1lbnQgYWJvdmUgQUxURVJOQVRJVkVfMigpIG1hY3JvIGFu
ZCBtYWtlIGl0IGdlbmVyaWMKPiA+ID4gc28gdGhhdCB0aGUgY29tbWVudCBob2xkcyBnb29kIGZv
ciBhbnkgbmV3IGFkZGl0aW9uIG9mIEFMVEVSTkFUSVZFX1goKQo+ID4gPiBtYWNyb3MuCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+ID4gLS0tCj4gPiA+IHY0LT52NQo+ID4gPiAqIFJlYmFz
ZWQgdGhlIHBhdGNoIG9uIHRvcCBvZiBBbmRyZXcncyBzZXJpZXMgKG5vdyBpbiBQYWxtZXJzIGZv
ciBuZXh0LWJyYW5jaCkKPiA+ID4gKiBVcGRhdGVkIGNvbW1lbnQgZm9yIEFMVEVSTkFUSVZFX3go
KSBhcyBzdWdnZXN0ZWQgYnkgSGVpa28KPiA+Cj4gPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhCj4g
Pgo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLW1hY3Jvcy5o
Cj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWx0ZXJuYXRpdmUtbWFjcm9zLmgK
PiA+ID4gQEAgLTUwLDggKzUwLDE3IEBACj4gPiA+ICAgICAgICAgQUxUX05FV19DT05URU5UIFx2
ZW5kb3JfaWRfMiwgXGVycmF0YV9pZF8yLCBcZW5hYmxlXzIsIFxuZXdfY18yCj4gPiA+ICAuZW5k
bQo+ID4gPgo+ID4gPiArLm1hY3JvIEFMVEVSTkFUSVZFX0NGR18zIG9sZF9jLCBuZXdfY18xLCB2
ZW5kb3JfaWRfMSwgZXJyYXRhX2lkXzEsIGVuYWJsZV8xLCAgIFwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBuZXdfY18yLCB2ZW5kb3JfaWRfMiwgZXJyYXRhX2lkXzIsIGVu
YWJsZV8yLCAgICBcCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV3X2Nf
MywgdmVuZG9yX2lkXzMsIGVycmF0YV9pZF8zLCBlbmFibGVfMwo+ID4gPiArICAgICAgIEFMVEVS
TkFUSVZFX0NGR18yIFxvbGRfYywgXG5ld19jXzEsIFx2ZW5kb3JfaWRfMSwgXGVycmF0YV9pZF8x
LCBcZW5hYmxlXzEsICAgICAgXAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXG5ld19jXzIsIFx2ZW5kb3JfaWRfMiwgXGVycmF0YV9pZF8yLCBcZW5hYmxlXzIKPiA+ID4g
KyAgICAgICBBTFRfTkVXX0NPTlRFTlQgXHZlbmRvcl9pZF8zLCBcZXJyYXRhX2lkXzMsIFxlbmFi
bGVfMywgXG5ld19jXzMKPiA+ID4gKy5lbmRtCj4gPiA+ICsKPiA+ID4gICNkZWZpbmUgX19BTFRF
Uk5BVElWRV9DRkcoLi4uKSAgICAgICAgIEFMVEVSTkFUSVZFX0NGRyBfX1ZBX0FSR1NfXwo+ID4g
PiAgI2RlZmluZSBfX0FMVEVSTkFUSVZFX0NGR18yKC4uLikgICAgICAgQUxURVJOQVRJVkVfQ0ZH
XzIgX19WQV9BUkdTX18KPiA+ID4gKyNkZWZpbmUgX19BTFRFUk5BVElWRV9DRkdfMyguLi4pICAg
ICAgIEFMVEVSTkFUSVZFX0NGR18zIF9fVkFfQVJHU19fCj4gPiA+Cj4gPiA+ICAjZWxzZSAvKiAh
X19BU1NFTUJMWV9fICovCj4gPiA+Cj4gPiA+IEBAIC05OCw2ICsxMDcsMTMgQEAKPiA+ID4gICAg
ICAgICBfX0FMVEVSTkFUSVZFX0NGRyhvbGRfYywgbmV3X2NfMSwgdmVuZG9yX2lkXzEsIGVycmF0
YV9pZF8xLCBlbmFibGVfMSkgICBcCj4gPiA+ICAgICAgICAgQUxUX05FV19DT05URU5UKHZlbmRv
cl9pZF8yLCBlcnJhdGFfaWRfMiwgZW5hYmxlXzIsIG5ld19jXzIpCj4gPiA+Cj4gPiA+ICsjZGVm
aW5lIF9fQUxURVJOQVRJVkVfQ0ZHXzMob2xkX2MsIG5ld19jXzEsIHZlbmRvcl9pZF8xLCBlcnJh
dGFfaWRfMSwgZW5hYmxlXzEsICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbmV3X2NfMiwgdmVuZG9yX2lkXzIsIGVycmF0YV9pZF8yLCBlbmFibGVfMiwg
XAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5ld19jXzMsIHZlbmRv
cl9pZF8zLCBlcnJhdGFfaWRfMywgZW5hYmxlXzMpIFwKPiA+ID4gKyAgICAgICBfX0FMVEVSTkFU
SVZFX0NGR18yKG9sZF9jLCBuZXdfY18xLCB2ZW5kb3JfaWRfMSwgZXJyYXRhX2lkXzEsIGVuYWJs
ZV8xLCBcCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5ld19jXzIs
IHZlbmRvcl9pZF8yLCBlcnJhdGFfaWRfMiwgZW5hYmxlXzIpICAgICAgICBcCj4gPiA+ICsgICAg
ICAgQUxUX05FV19DT05URU5UKHZlbmRvcl9pZF8zLCBlcnJhdGFfaWRfMywgZW5hYmxlXzMsIG5l
d19jXzMpCj4gPiA+ICsKPiA+ID4gICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPiA+ID4KPiA+
ID4gICNkZWZpbmUgX0FMVEVSTkFUSVZFX0NGRyhvbGRfYywgbmV3X2MsIHZlbmRvcl9pZCwgZXJy
YXRhX2lkLCBDT05GSUdfaykgXAo+ID4gPiBAQCAtMTA4LDYgKzEyNCwxMyBAQAo+ID4gPiAgICAg
ICAgIF9fQUxURVJOQVRJVkVfQ0ZHXzIob2xkX2MsIG5ld19jXzEsIHZlbmRvcl9pZF8xLCBlcnJh
dGFfaWRfMSwgSVNfRU5BQkxFRChDT05GSUdfa18xKSwgICBcCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbmV3X2NfMiwgdmVuZG9yX2lkXzIsIGVycmF0YV9pZF8yLCBJ
U19FTkFCTEVEKENPTkZJR19rXzIpKQo+ID4gPgo+ID4gPiArI2RlZmluZSBfQUxURVJOQVRJVkVf
Q0ZHXzMob2xkX2MsIG5ld19jXzEsIHZlbmRvcl9pZF8xLCBlcnJhdGFfaWRfMSwgQ09ORklHX2tf
MSwgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBuZXdfY18yLCB2ZW5kb3JfaWRfMiwgZXJyYXRhX2lkXzIsIENPTkZJR19rXzIsICAgICAgICAg
ICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5ld19jXzMs
IHZlbmRvcl9pZF8zLCBlcnJhdGFfaWRfMywgQ09ORklHX2tfMykgICAgICAgICAgICAgICAgXAo+
ID4gPiArICAgICAgIF9fQUxURVJOQVRJVkVfQ0ZHXzMob2xkX2MsIG5ld19jXzEsIHZlbmRvcl9p
ZF8xLCBlcnJhdGFfaWRfMSwgSVNfRU5BQkxFRChDT05GSUdfa18xKSwgICBcCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV3X2NfMiwgdmVuZG9yX2lkXzIsIGVycmF0
YV9pZF8yLCBJU19FTkFCTEVEKENPTkZJR19rXzIpLCAgIFwKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBuZXdfY18zLCB2ZW5kb3JfaWRfMywgZXJyYXRhX2lkXzMsIElT
X0VOQUJMRUQoQ09ORklHX2tfMykpCj4gPiA+ICsKPiA+ID4gICNlbHNlIC8qIENPTkZJR19SSVND
Vl9BTFRFUk5BVElWRSAqLwo+ID4KPiA+IFRvIGF2b2lkIGJyZWFraW5nIHRoZSBidWlsZCBmb3Ig
SzIxMCAoYW5kIFZleFJpc2N2KSwgeW91IG5lZWQgdG8gcHJvdmlkZQo+ID4gX0FMVEVSTkFUSVZF
X0NGR18zKCkgZm9yIHRoZSAhQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFIGNhc2UsIHRvbzoKPiA+
Cj4gVGhhbmtzIGZvciB0ZXN0aW5nIHRoaXMuCj4gCj4gPiBAQCAtMTQ0LDYgKzE0NCw5IEBACj4g
PiAgI2RlZmluZSBfQUxURVJOQVRJVkVfQ0ZHXzIob2xkX2MsIC4uLikgXAo+ID4gICAgICAgICBB
TFRFUk5BVElWRV9DRkcgb2xkX2MKPiA+Cj4gPiArI2RlZmluZSBfQUxURVJOQVRJVkVfQ0ZHXzMo
b2xkX2MsIC4uLikgXAo+ID4gKyAgICAgICBBTFRFUk5BVElWRV9DRkcgb2xkX2MKPiA+ICsKPiA+
ICAjZWxzZSAvKiAhX19BU1NFTUJMWV9fICovCj4gPgo+ID4gICNkZWZpbmUgX19BTFRFUk5BVElW
RV9DRkcob2xkX2MpICAgICAgIFwKPiA+IEBAIC0xNTUsNiArMTU4LDkgQEAKPiA+ICAjZGVmaW5l
IF9BTFRFUk5BVElWRV9DRkdfMihvbGRfYywgLi4uKSBcCj4gPiAgICAgICAgIF9fQUxURVJOQVRJ
VkVfQ0ZHKG9sZF9jKQo+ID4KPiA+ICsjZGVmaW5lIF9BTFRFUk5BVElWRV9DRkdfMyhvbGRfYywg
Li4uKSBcCj4gPiArICAgICAgIF9fQUxURVJOQVRJVkVfQ0ZHKG9sZF9jKQo+ID4gKwo+ID4gICNl
bmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPiA+ICAjZW5kaWYgLyogQ09ORklHX1JJU0NWX0FMVEVS
TkFUSVZFICovCj4gPgo+ID4gRWxzZSBpdCBmYWlscyAob24gcmlzY3YvZm9yLW5leHQpIHdpdGg6
Cj4gPgo+IEknbGwgaW5jbHVkZSB0aGUgYWJvdmUgaHVuayBpbiBuZXh0IHZlcnNpb24uCgpZZXMs
IHRob3NlIHR3byBodW5rcyBhcmUgaW4gbXkgZXhhbXBsZSBpbiBbMV0gYXMgd2VsbC4KClsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjExMjkxNTAwNTMuNTA0NjQtMS1ham9uZXNA
dmVudGFuYW1pY3JvLmNvbS8KClRoYW5rcywKZHJldwoKPiAKPiA+IGFyY2gvcmlzY3YvbW0vcG1l
bS5jOiBJbiBmdW5jdGlvbiDigJhhcmNoX3diX2NhY2hlX3BtZW3igJk6Cj4gPiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLW1hY3Jvcy5oOjE5ODo4OiBlcnJvcjogZXhwZWN0ZWQK
PiA+IHN0cmluZyBsaXRlcmFsIGJlZm9yZSDigJhfQUxURVJOQVRJVkVfQ0ZHXzPigJkKPiA+ICAg
MTk4IHwgICAgICAgIF9BTFRFUk5BVElWRV9DRkdfMyhvbGRfY29udGVudCwgbmV3X2NvbnRlbnRf
MSwKPiA+IHZlbmRvcl9pZF8xLCBlcnJhdGFfaWRfMSwgQ09ORklHX2tfMSwgXAo+ID4gICAgICAg
fCAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Vy
cmF0YV9saXN0Lmg6MTI4OjE0OiBub3RlOiBpbiBleHBhbnNpb24gb2YKPiA+IG1hY3JvIOKAmEFM
VEVSTkFUSVZFXzPigJkKPiA+ICAgMTI4IHwgYXNtIHZvbGF0aWxlKEFMVEVSTkFUSVZFXzMoICAg
ICAgXAo+ID4gICAgICAgfCAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fgo+ID4gYXJjaC9yaXNj
di9tbS9wbWVtLmM6MTM6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEFMVF9DTU9f
T1DigJkKPiA+ICAgIDEzIHwgIEFMVF9DTU9fT1AoY2xlYW4sIGFkZHIsIHNpemUsIHJpc2N2X2Ni
b21fYmxvY2tfc2l6ZSwgMCwgMCk7Cj4gPiAgICAgICB8ICBefn5+fn5+fn5+Cj4gPgo+ID4gR3J7
b2V0amUsZWV0aW5nfXMsCj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPiA+
Cj4gPiAtLQo+ID4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwo+ID4KPiA+IEluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKPiA+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
