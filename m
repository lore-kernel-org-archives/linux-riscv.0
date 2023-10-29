Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1597C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 08:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KGsLBvJq50cSw2e9V3kM2mk6nknQVOueF8kKdTRyOw=; b=1FGSv6c1wLaRWH
	2Kise/yZcZBhTMLO22N7wCi7KzfuwdG+ZXZaGpbJs0JzhU+tH16HjI/thp+bcCSah8COGjVNlhPYL
	65qcCL72ruytt2gpPBkskORYc0Luf8tO77HWzULyR2AsvSNIi62GkBwdVJI1RomJdfS5Cv0hmrKkW
	XbA6SblrbHfbD/sX5trjYKNHNsqh3Vk9stOS/KIWrZFiDj0b7YC9E6FuGFlLk6ZuMobZHPOuZlYAa
	iUKpgEZs/61ZSGG1QcJngDFjVfwojSskR13yg/0GpIzHPajZliqo0zgqPAr/Q5acvNIqETdDDNH16
	tpSmqL+dEDKluOj4twjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx0j4-001MLM-1V;
	Sun, 29 Oct 2023 08:00:50 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx0j1-001MKw-1Z
	for linux-riscv@lists.infradead.org;
	Sun, 29 Oct 2023 08:00:49 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a8ee23f043so29010257b3.3
        for <linux-riscv@lists.infradead.org>; Sun, 29 Oct 2023 01:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698566444; x=1699171244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wq3KaWnfOKn15xc4xsqIdV2aDnDlx/ragRVM8DwqFD4=;
        b=BTA2/GJTha1Reznao47EVSKNvnrpGGUh6weHAVwc3ltZeniefgFxHHLy5x4qJHNB2o
         +EIuoGwzwYu9mN57To1tUW/OGQUCLapUbzPFQJV4tEkKY7AJxpUqzNUDxEA4DtaTlUeU
         h/oMMifyla7AlPzACCvAWnvoPatMy/wtELlFvXhJ16rtK69B7n4CBc0vkCTBMzQFlC0v
         diBHOfes4VpsVK1DutEl+htERYMRMDCBac2G38BMCf8TdfRKyQSCeXEax+p56rHdITRj
         U1eZcowFTvABUtTwbk1caj8x+1htz6ib9MA5ORYs6p8qNIAG9qm6Rz/YIDp1ohNspGjV
         2pFQ==
X-Gm-Message-State: AOJu0YzZvpksFCNtx5AJjtd/cFMvr858SJinMOvrP6Z6482iDbJf8YWx
	vVg1O6WifW0KpywhbMWvheNBfmccLqA36Q==
X-Google-Smtp-Source: AGHT+IFUei2e73Xri16XnbyojxsCGSFJAcGGotD2GyRhpTS+3TGS4QqyjwnyNx67DdfPGwmqZ7MEjA==
X-Received: by 2002:a81:c54a:0:b0:5a8:5ce9:d740 with SMTP id o10-20020a81c54a000000b005a85ce9d740mr6269433ywj.33.1698566444636;
        Sun, 29 Oct 2023 01:00:44 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id n197-20020a0dcbce000000b0059bdac3fd08sm2784665ywd.48.2023.10.29.01.00.43
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 01:00:43 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9ac9573274so2807751276.0
        for <linux-riscv@lists.infradead.org>; Sun, 29 Oct 2023 01:00:43 -0700 (PDT)
X-Received: by 2002:a25:d489:0:b0:da1:b041:70ac with SMTP id
 m131-20020a25d489000000b00da1b04170acmr5190692ybf.10.1698566443639; Sun, 29
 Oct 2023 01:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-ac92041d-85e9-4725-b61c-bc0fef5549ec@palmer-ri-x1c9a> <133b60f7-a71c-4fa2-ae19-4cad05596a23@sifive.com>
In-Reply-To: <133b60f7-a71c-4fa2-ae19-4cad05596a23@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 29 Oct 2023 09:00:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdzrVX9PzZw4_KMg+-17GPAEaV9ZmfzuUWpjC4moUX5w@mail.gmail.com>
Message-ID: <CAMuHMdUdzrVX9PzZw4_KMg+-17GPAEaV9ZmfzuUWpjC4moUX5w@mail.gmail.com>
Subject: Re: [PATCH 5/5] riscv: configs: defconfig: Enable configs required
 for RZ/Five SoC
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, prabhakar.csengg@gmail.com, magnus.damm@gmail.com, 
	conor+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_010047_544919_B3658CF9 
X-CRM114-Status: GOOD (  28.32  )
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

SGkgU2FtdWVsLAoKT24gU2F0LCBPY3QgMjgsIDIwMjMgYXQgMTE6MjfigK9QTSBTYW11ZWwgSG9s
bGFuZAo8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gT24gMjAyMy0xMC0yNyA1
OjExIFBNLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiA+IE9uIFR1ZSwgMDMgT2N0IDIwMjMgMDU6
MzQ6MTMgUERUICgtMDcwMCksIGdlZXJ0QGxpbnV4LW02OGsub3JnIHdyb3RlOgo+ID4+IE9uIEZy
aSwgU2VwIDI5LCAyMDIzIGF0IDI6MDfigK9BTSBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dA
Z21haWwuY29tPiB3cm90ZToKPiA+Pj4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1h
aGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4+Pgo+ID4+PiBFbmFibGUgdGhlIGNvbmZp
Z3MgcmVxdWlyZWQgYnkgdGhlIGJlbG93IElQIGJsb2NrcyB3aGljaCBhcmUKPiA+Pj4gcHJlc2Vu
dCBvbiBSWi9GaXZlIFNvQzoKPiA+Pj4gKiBBREMKPiA+Pj4gKiBDQU5GRAo+ID4+PiAqIERNQUMK
PiA+Pj4gKiBlTU1DL1NESEkKPiA+Pj4gKiBPU1RNCj4gPj4+ICogUkFWQiAoKyBNaWNyZWwgUEhZ
KQo+ID4+PiAqIFJJSUMKPiA+Pj4gKiBSU1BJCj4gPj4+ICogU1NJIChTb3VuZCtXTTg5NzggY29k
ZWMpCj4gPj4+ICogVGhlcm1hbAo+ID4+PiAqIFVTQiAoUEhZL1JFU0VUL09URykKPiA+Pj4KPiA+
Pj4gQWxvbmcgd2l0aCB0aGUgYWJvdmUgc29tZSBjb3JlIGNvbmZpZ3MgYXJlIGVuYWJsZWQgdG9v
LAo+ID4+PiAtPiBDUFUgZnJlcXVlbmN5IHNjYWxpbmcgYXMgUlovRml2ZSBkb2VzIHN1cHBvcnQg
dGhpcy4KPiA+Pj4gLT4gTVREIGlzIGVuYWJsZWQgYXMgUlNQSSBjYW4gYmUgY29ubmVjdGVkIHRv
IGZsYXNoIGNoaXBzCj4gPj4+IC0+IEVuYWJsZWQgSTJDIGNoYXJkZXYgc28gdGhhdCBpdCBlbmFi
bGVzIHVzZXJzcGFjZSB0byByZWFkL3dyaXRlCj4gPj4+ICAgIGkyYyBkZXZpY2VzIChzaW1pbGFy
IHRvIGFybTY0KQo+ID4+PiAtPiBUaGVybWFsIGNvbmZpZ3MgYXMgUlovRml2ZSBTb0MgZG9lcyBo
YXZlIHRoZXJtYWwgdW5pdAo+ID4+PiAtPiBHUElPIHJlZ3VsYXRvciBhcyB3ZSBtaWdodCBoYXZl
IElQIGJsb2NrcyBmb3Igd2hpY2ggdm9sdGFnZQo+ID4+PiAgICBsZXZlbHMgYXJlIGNvbnRyb2xs
ZWQgYnkgR1BJT3MKPiA+Pj4gLT4gT1RHIGNvbmZpZ3MgYXMgUlovRml2ZSBVU0IgY2FuIHN1cHBv
cnQgaG9zdC9mdW5jdGlvbgo+ID4+PiAtPiBHYWRnZXQgY29uZmlncyBzbyB0aGF0IHdlIGNhbiB0
ZXN0IFVTQiBmdW5jdGlvbiAoYXMgZG9uZSBpbiBhcm02NAo+ID4+PiAgICBhbGwgdGhlIGdhZGdl
dCBjb25maWdzIGFyZSBlbmFibGVkKQo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJh
Ymhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPj4KPiA+
PiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT4KPiA+Pgo+ID4+IEFzIEkgZXhwZWN0IHRoaXMgdG8gZ28gaW4gdGhyb3VnaCB0aGUgUklTQy1W
IHRyZWUsIEkgd2lsbCBsZXQgdGhlCj4gPj4gUklTQy1WIHBlb3BsZSBoYW5kbGUgYW55IGRpc2N1
c3Npb24gYWJvdXQgbW9yZSBvcHRpb25zIHRoYXQgc2hvdWxkIGJlCj4gPj4gbWFkZSBtb2R1bGFy
IGluc3RlYWQgb2YgYnVpbHRpbi4KPiA+Cj4gPiBJJ20gcHJldHR5IG11Y2ggYWdub3N0aWMgb24g
dGhhdCBmcm9udCwgc28gSSdtIGNvb2wganVzdCBwaWNraW5nIHVwIHRoaXMuICBJJ3ZlCj4gPiBn
b3QganVzdCBwYXRjaCA1IGluIG15IHF1ZXVlIGZvciB0ZXN0aW5nLCB0aGVyZSdzIGEgZmV3IG90
aGVyIHRoaW5ncyBpbiBmcm9udCBvZgo+ID4gaXQgYnV0IGl0IHNob3VsZCBzaG93IHVwIG9uIGZv
ci1uZXh0IHNvb24uCj4KPiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gbWVyZ2UgdGhpcywgY29uc2lk
ZXJpbmcgUlovRml2ZSBzdXBwb3J0IGRlcGVuZHMgb24KPiBOT05QT1JUQUJMRSwgYW5kIHRoZXJl
Zm9yZSBjYW5ub3QgYmUgZW5hYmxlZCBpbiBkZWZjb25maWcgYW55d2F5PwoKSW5kZWVkLCB0aGF0
J3MgYSBnb29kIHBvaW50LgoKTm90ZSB0aGF0IHRoaXMgcGF0Y2ggKGFuZCBpdHMgcmV2aWV3KSBw
cmVkYXRlcyB0aGUgTk9OUE9SVEFCTEUKZGVwZW5kZW5jeS4KClBhbG1lcjogYXJlIHlvdSBvcGVu
IHRvIGFkZGluZyBhIG5ldyByemZpdmVfZGVmY29uZmlnWypdIGluc3RlYWQ/Ckkgc2VlIHRoZXJl
IGFyZSBhbHJlYWR5IG90aGVyIGNvbmZpZ3MsIHNvIHJpc2N2IHNlZW1zIHRvIGZvbGxvdyB0aGUK
YXJtIHJhdGhlciB0aGFuIHRoZSBhcm02NCAodGhlcmUgY2FuIGJlIG9ubHkgb25lIHJpbmdeV2Rl
ZmNvbmZpZykgbW9kZWwuCgpUaGFua3MhCgpbKl0gSSBkbyBob3BlIHRvIHJlc2VydmUgKHBvc3Np
Ymx5IG5vbi11cHN0cmVhbSkgcmVuZXNhc19kZWZjb25maWcKICAgIGZvciB0aGUgYXJteSBvZiBm
dXR1cmUgUmVuZXNhcyBSSVNDLVYgU29DcyB0aGF0IGRvIG5vdCBuZWVkIGEKICAgIGRlcGVuZGVu
Y3kgb24gTk9OUE9SVEFCTEUgOy0pCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dy
YW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
