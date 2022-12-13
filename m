Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E48C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 17:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JG1u77GKaMtDTHAb7pIvFqxgtCKlY68NH9XYYURSs2c=; b=wYbeF/xAQIQt33
	ycnyXGSBe2y/xsFPTUqmhRequkzObqbcYr3QZPxFBq+PABU6T+qXGRGUhZA5g5cMZAvDS2wwytNOa
	EGu2NHg3Qm8z2gmqkuXdnGvb5cw2MKsFJYsFZCKPbw3WZOpt8/5maId4LqBnpER7MNsLSyrivFt75
	2+AWfDfuzD5BMsQLytNDbn4n4h56ppFLQkEGstW8hHVvUM6AEMB9s4gReX9f5NsTN4bPXNeLsTPQ0
	X6+l3i3Ux0Es4ih0VvsuBFIxMrqhS+qjregWPdae7IK5STuUiQlbJZ0F6P+KFvEL1V23twzRs9MFC
	V15HHVWrifYQIE6eOOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59Pr-003xgB-HZ; Tue, 13 Dec 2022 17:50:07 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59Po-003xcn-FC
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 17:50:06 +0000
Received: by mail-ej1-x634.google.com with SMTP id n20so38450498ejh.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 09:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8Te+90Me7/DNYLPITblwKP6ief4DtrmuQhpnuDMS7U=;
        b=Q/ccRBM54iGaMR0IPvniv4srFLJhIy4+mj2F/jaqSwhIAU1D15nqC+B6n+80uwSGEb
         b/rzjFeTMIwuy8Dh0olaztxosTG8WXMoPpYrAguxYQroEyTe7kCnmiQeYl4LraWXtk/d
         UuILSPSfLNxntm2DoE+TWxjQ39otbf1t8Ei/dOcQSmSJJT2njZFAZslU9i5rIH/exG8q
         1vCN1s/20src/cIITU9innMymBL5VDIAUPiR49sbNmgmv32OhQ920GgppUdqsnE0xkC2
         WLFfs0OM6v24OUZ8m0Hf9bJDrvQUn6FmjoSlGbTVlJS+mLPbUA+xwbweBB7QKID1BK0e
         5YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8Te+90Me7/DNYLPITblwKP6ief4DtrmuQhpnuDMS7U=;
        b=QXygUnGkbHgq/5xeouNe5j0lc28mScocV23UGNaBmqb7EmjuaU/0aR2LJs/oYNwHO2
         TNmbgZeNVeIJhK/wuy8W5jNFbODC85pHJ4RbZYpG3nhn2AW+vz9a5eqnNwBkkJHcKVSA
         AkWJcSRh+LKp6+EOPxvr/P1QM/ONgj2EUmLJXpU5VVhOAwYvvTGbO2oMEV+Z5/UNRk9J
         4RPqcu1+in8ZV/5+UePWKyuzsQ9xgcFBj5jB3qisIqzlonGavsGTbqDlN1+GU6B2AFvq
         lfiLDpJNxTlGBT6wqmcGdF5SbhuVIUDAqpdCbjhGJzNptN1dwqWDbyMGbKNehfciwJei
         OSrw==
X-Gm-Message-State: ANoB5pnWnkSlOBl2oFF0skAcATKeWR4N9OcW33JHzzReDzhvKb36LYKg
	YX6/GhKFe7+M7K2+Gx+S4PV7utzp4/omWY6KI4ybMbZKMMs=
X-Google-Smtp-Source: AA0mqf6yr4V5eqVv903blKuzHqJwxMbngwRZQLWei/lpeJdIbxZ/byCj1cPbuB7C5GwaJ79ieqB+ow5quffMIpms0NI=
X-Received: by 2002:a17:906:5156:b0:7c0:efb6:8744 with SMTP id
 jr22-20020a170906515600b007c0efb68744mr16980605ejc.267.1670953798879; Tue, 13
 Dec 2022 09:49:58 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXXXN9g8o1j7k-TC=F-kuyf-KngFSKi7z9z0SY9BLxmHA@mail.gmail.com>
In-Reply-To: <CAMuHMdXXXN9g8o1j7k-TC=F-kuyf-KngFSKi7z9z0SY9BLxmHA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 Dec 2022 17:49:32 +0000
Message-ID: <CA+V-a8s9iAtFVzdA4R_tSMuBTkoY3JmZ12MJw__Pgfyetsz34g@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] riscv: asm: alternative-macros: Introduce
 ALTERNATIVE_3() macro
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Samuel Holland <samuel@sholland.org>, Guo Ren <guoren@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_095004_569283_7BD3D785 
X-CRM114-Status: GOOD (  27.79  )
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBUdWUsIERlYyAxMywgMjAy
MiBhdCA1OjIxIFBNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdy
b3RlOgo+Cj4gSGkgUHJhYmhha2FyLAo+Cj4gT24gTW9uLCBEZWMgMTIsIDIwMjIgYXQgMTI6NTgg
UE0gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBGcm9t
OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
Cj4gPgo+ID4gSW50cm9kdWNlIEFMVEVSTkFUSVZFXzMoKSBtYWNyby4KPiA+Cj4gPiBBIHZlbmRv
ciB3YW50cyB0byByZXBsYWNlIGFuIG9sZF9jb250ZW50LCBidXQgYW5vdGhlciB2ZW5kb3IgaGFz
IHVzZWQKPiA+IEFMVEVSTkFUSVZFXzIoKSB0byBwYXRjaCBpdHMgY3VzdG9taXplZCBjb250ZW50
IGF0IHRoZSBzYW1lIGxvY2F0aW9uLgo+ID4gSW4gdGhpcyBjYXNlLCB0aGlzIHZlbmRvciBjYW4g
dXNlIG1hY3JvIEFMVEVSTkFUSVZFXzMoKSBhbmQgdGhlbiByZXBsYWNlCj4gPiBBTFRFUk5BVElW
RV8yKCkgd2l0aCBBTFRFUk5BVElWRV8zKCkgdG8gYXBwZW5kIGl0cyBjdXN0b21pemVkIGNvbnRl
bnQuCj4gPgo+ID4gV2hpbGUgYXQgaXQgdXBkYXRlIGNvbW1lbnQgYWJvdmUgQUxURVJOQVRJVkVf
MigpIG1hY3JvIGFuZCBtYWtlIGl0IGdlbmVyaWMKPiA+IHNvIHRoYXQgdGhlIGNvbW1lbnQgaG9s
ZHMgZ29vZCBmb3IgYW55IG5ldyBhZGRpdGlvbiBvZiBBTFRFUk5BVElWRV9YKCkKPiA+IG1hY3Jv
cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiAtLS0KPiA+IHY0LT52NQo+ID4gKiBSZWJhc2Vk
IHRoZSBwYXRjaCBvbiB0b3Agb2YgQW5kcmV3J3Mgc2VyaWVzIChub3cgaW4gUGFsbWVycyBmb3Ig
bmV4dC1icmFuY2gpCj4gPiAqIFVwZGF0ZWQgY29tbWVudCBmb3IgQUxURVJOQVRJVkVfeCgpIGFz
IHN1Z2dlc3RlZCBieSBIZWlrbwo+Cj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQo+Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLW1hY3Jvcy5oCj4gPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLW1hY3Jvcy5oCj4gPiBAQCAtNTAsOCAr
NTAsMTcgQEAKPiA+ICAgICAgICAgQUxUX05FV19DT05URU5UIFx2ZW5kb3JfaWRfMiwgXGVycmF0
YV9pZF8yLCBcZW5hYmxlXzIsIFxuZXdfY18yCj4gPiAgLmVuZG0KPiA+Cj4gPiArLm1hY3JvIEFM
VEVSTkFUSVZFX0NGR18zIG9sZF9jLCBuZXdfY18xLCB2ZW5kb3JfaWRfMSwgZXJyYXRhX2lkXzEs
IGVuYWJsZV8xLCAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV3X2Nf
MiwgdmVuZG9yX2lkXzIsIGVycmF0YV9pZF8yLCBlbmFibGVfMiwgICAgXAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBuZXdfY18zLCB2ZW5kb3JfaWRfMywgZXJyYXRhX2lkXzMs
IGVuYWJsZV8zCj4gPiArICAgICAgIEFMVEVSTkFUSVZFX0NGR18yIFxvbGRfYywgXG5ld19jXzEs
IFx2ZW5kb3JfaWRfMSwgXGVycmF0YV9pZF8xLCBcZW5hYmxlXzEsICAgICAgXAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxuZXdfY18yLCBcdmVuZG9yX2lkXzIsIFxlcnJh
dGFfaWRfMiwgXGVuYWJsZV8yCj4gPiArICAgICAgIEFMVF9ORVdfQ09OVEVOVCBcdmVuZG9yX2lk
XzMsIFxlcnJhdGFfaWRfMywgXGVuYWJsZV8zLCBcbmV3X2NfMwo+ID4gKy5lbmRtCj4gPiArCj4g
PiAgI2RlZmluZSBfX0FMVEVSTkFUSVZFX0NGRyguLi4pICAgICAgICAgQUxURVJOQVRJVkVfQ0ZH
IF9fVkFfQVJHU19fCj4gPiAgI2RlZmluZSBfX0FMVEVSTkFUSVZFX0NGR18yKC4uLikgICAgICAg
QUxURVJOQVRJVkVfQ0ZHXzIgX19WQV9BUkdTX18KPiA+ICsjZGVmaW5lIF9fQUxURVJOQVRJVkVf
Q0ZHXzMoLi4uKSAgICAgICBBTFRFUk5BVElWRV9DRkdfMyBfX1ZBX0FSR1NfXwo+ID4KPiA+ICAj
ZWxzZSAvKiAhX19BU1NFTUJMWV9fICovCj4gPgo+ID4gQEAgLTk4LDYgKzEwNywxMyBAQAo+ID4g
ICAgICAgICBfX0FMVEVSTkFUSVZFX0NGRyhvbGRfYywgbmV3X2NfMSwgdmVuZG9yX2lkXzEsIGVy
cmF0YV9pZF8xLCBlbmFibGVfMSkgICBcCj4gPiAgICAgICAgIEFMVF9ORVdfQ09OVEVOVCh2ZW5k
b3JfaWRfMiwgZXJyYXRhX2lkXzIsIGVuYWJsZV8yLCBuZXdfY18yKQo+ID4KPiA+ICsjZGVmaW5l
IF9fQUxURVJOQVRJVkVfQ0ZHXzMob2xkX2MsIG5ld19jXzEsIHZlbmRvcl9pZF8xLCBlcnJhdGFf
aWRfMSwgZW5hYmxlXzEsICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG5ld19jXzIsIHZlbmRvcl9pZF8yLCBlcnJhdGFfaWRfMiwgZW5hYmxlXzIsIFwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV3X2NfMywgdmVuZG9yX2lkXzMs
IGVycmF0YV9pZF8zLCBlbmFibGVfMykgXAo+ID4gKyAgICAgICBfX0FMVEVSTkFUSVZFX0NGR18y
KG9sZF9jLCBuZXdfY18xLCB2ZW5kb3JfaWRfMSwgZXJyYXRhX2lkXzEsIGVuYWJsZV8xLCBcCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuZXdfY18yLCB2ZW5kb3JfaWRf
MiwgZXJyYXRhX2lkXzIsIGVuYWJsZV8yKSAgICAgICAgXAo+ID4gKyAgICAgICBBTFRfTkVXX0NP
TlRFTlQodmVuZG9yX2lkXzMsIGVycmF0YV9pZF8zLCBlbmFibGVfMywgbmV3X2NfMykKPiA+ICsK
PiA+ICAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovCj4gPgo+ID4gICNkZWZpbmUgX0FMVEVSTkFU
SVZFX0NGRyhvbGRfYywgbmV3X2MsIHZlbmRvcl9pZCwgZXJyYXRhX2lkLCBDT05GSUdfaykgXAo+
ID4gQEAgLTEwOCw2ICsxMjQsMTMgQEAKPiA+ICAgICAgICAgX19BTFRFUk5BVElWRV9DRkdfMihv
bGRfYywgbmV3X2NfMSwgdmVuZG9yX2lkXzEsIGVycmF0YV9pZF8xLCBJU19FTkFCTEVEKENPTkZJ
R19rXzEpLCAgIFwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV3X2Nf
MiwgdmVuZG9yX2lkXzIsIGVycmF0YV9pZF8yLCBJU19FTkFCTEVEKENPTkZJR19rXzIpKQo+ID4K
PiA+ICsjZGVmaW5lIF9BTFRFUk5BVElWRV9DRkdfMyhvbGRfYywgbmV3X2NfMSwgdmVuZG9yX2lk
XzEsIGVycmF0YV9pZF8xLCBDT05GSUdfa18xLCAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBuZXdfY18yLCB2ZW5kb3JfaWRfMiwgZXJyYXRhX2lk
XzIsIENPTkZJR19rXzIsICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBuZXdfY18zLCB2ZW5kb3JfaWRfMywgZXJyYXRhX2lkXzMsIENPTkZJR19r
XzMpICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgX19BTFRFUk5BVElWRV9DRkdfMyhvbGRf
YywgbmV3X2NfMSwgdmVuZG9yX2lkXzEsIGVycmF0YV9pZF8xLCBJU19FTkFCTEVEKENPTkZJR19r
XzEpLCAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV3X2NfMiwg
dmVuZG9yX2lkXzIsIGVycmF0YV9pZF8yLCBJU19FTkFCTEVEKENPTkZJR19rXzIpLCAgIFwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV3X2NfMywgdmVuZG9yX2lkXzMs
IGVycmF0YV9pZF8zLCBJU19FTkFCTEVEKENPTkZJR19rXzMpKQo+ID4gKwo+ID4gICNlbHNlIC8q
IENPTkZJR19SSVNDVl9BTFRFUk5BVElWRSAqLwo+Cj4gVG8gYXZvaWQgYnJlYWtpbmcgdGhlIGJ1
aWxkIGZvciBLMjEwIChhbmQgVmV4UmlzY3YpLCB5b3UgbmVlZCB0byBwcm92aWRlCj4gX0FMVEVS
TkFUSVZFX0NGR18zKCkgZm9yIHRoZSAhQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFIGNhc2UsIHRv
bzoKPgpUaGFua3MgZm9yIHRlc3RpbmcgdGhpcy4KCj4gQEAgLTE0NCw2ICsxNDQsOSBAQAo+ICAj
ZGVmaW5lIF9BTFRFUk5BVElWRV9DRkdfMihvbGRfYywgLi4uKSBcCj4gICAgICAgICBBTFRFUk5B
VElWRV9DRkcgb2xkX2MKPgo+ICsjZGVmaW5lIF9BTFRFUk5BVElWRV9DRkdfMyhvbGRfYywgLi4u
KSBcCj4gKyAgICAgICBBTFRFUk5BVElWRV9DRkcgb2xkX2MKPiArCj4gICNlbHNlIC8qICFfX0FT
U0VNQkxZX18gKi8KPgo+ICAjZGVmaW5lIF9fQUxURVJOQVRJVkVfQ0ZHKG9sZF9jKSAgICAgICBc
Cj4gQEAgLTE1NSw2ICsxNTgsOSBAQAo+ICAjZGVmaW5lIF9BTFRFUk5BVElWRV9DRkdfMihvbGRf
YywgLi4uKSBcCj4gICAgICAgICBfX0FMVEVSTkFUSVZFX0NGRyhvbGRfYykKPgo+ICsjZGVmaW5l
IF9BTFRFUk5BVElWRV9DRkdfMyhvbGRfYywgLi4uKSBcCj4gKyAgICAgICBfX0FMVEVSTkFUSVZF
X0NGRyhvbGRfYykKPiArCj4gICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPiAgI2VuZGlmIC8q
IENPTkZJR19SSVNDVl9BTFRFUk5BVElWRSAqLwo+Cj4gRWxzZSBpdCBmYWlscyAob24gcmlzY3Yv
Zm9yLW5leHQpIHdpdGg6Cj4KSSdsbCBpbmNsdWRlIHRoZSBhYm92ZSBodW5rIGluIG5leHQgdmVy
c2lvbi4KCj4gYXJjaC9yaXNjdi9tbS9wbWVtLmM6IEluIGZ1bmN0aW9uIOKAmGFyY2hfd2JfY2Fj
aGVfcG1lbeKAmToKPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLW1hY3Jvcy5o
OjE5ODo4OiBlcnJvcjogZXhwZWN0ZWQKPiBzdHJpbmcgbGl0ZXJhbCBiZWZvcmUg4oCYX0FMVEVS
TkFUSVZFX0NGR18z4oCZCj4gICAxOTggfCAgICAgICAgX0FMVEVSTkFUSVZFX0NGR18zKG9sZF9j
b250ZW50LCBuZXdfY29udGVudF8xLAo+IHZlbmRvcl9pZF8xLCBlcnJhdGFfaWRfMSwgQ09ORklH
X2tfMSwgXAo+ICAgICAgIHwgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgo+IGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaDoxMjg6MTQ6IG5vdGU6IGluIGV4cGFuc2lvbiBvZgo+
IG1hY3JvIOKAmEFMVEVSTkFUSVZFXzPigJkKPiAgIDEyOCB8IGFzbSB2b2xhdGlsZShBTFRFUk5B
VElWRV8zKCAgICAgIFwKPiAgICAgICB8ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+Cj4gYXJj
aC9yaXNjdi9tbS9wbWVtLmM6MTM6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEFM
VF9DTU9fT1DigJkKPiAgICAxMyB8ICBBTFRfQ01PX09QKGNsZWFuLCBhZGRyLCBzaXplLCByaXNj
dl9jYm9tX2Jsb2NrX3NpemUsIDAsIDApOwo+ICAgICAgIHwgIF5+fn5+fn5+fn4KPgo+IEdye29l
dGplLGVldGluZ31zLAo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPgo+IC0tCj4g
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZwo+Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAo+IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
