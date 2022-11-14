Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FDCC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 12:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqQtruFB+WNLBuXjhNIDiq5p26BO1QssslIf/UzMS0Q=; b=xRBwv0eBI7Aoe7
	wAGbig50WCLv8bNAw5QKZsrARhaWQvMYxVsjGSFu3gyFIsSmvDF+Gwjk5sRY2L0HkOg4kOMBZhTfr
	uO8Q25pJtJIUj4nfPuma8iNiNS2tGL/182LfzePXg4uMM1+50bZzgCxgSuvBiOwYI/0lBo56vTyMn
	I9VwFrTHjJAs6Cy96jRxm9W69AeGsidZBPMpBCDnvZ+m9Gx/571e2J30y8QtqzF3a6NS1PniGJfDY
	9s49LUZgBJYuhjbM2rftXD6aev4hh9dXRGdaXck51RYihiMOXoG95/qLQxGn8qtIIQy4WWQhm2yPn
	mnmEDzeeZr64nslhPffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYam-000oUf-HC; Mon, 14 Nov 2022 12:29:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYaj-000oTB-Cf
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 12:29:35 +0000
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DA292423C3
	for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 12:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668428962;
	bh=ZjYjLXCHxCVOYpmvr6/HR55meSdpQL0pXQhoi2NzHxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=c/A9poBT6sg7NRll1Q3I74+tMQQPiD6wprxnjXBcN4qm8hOn45lnqsGuG99PKO3eP
	 sgZpKvCSzvvogTdjUCTy2wuZJF5o62Jiy9t+Vb/xgNdXl0Otq7ncny0oazGGmcrDfD
	 Z+NjkxgMKOhS0mm+ISF0XQphXOjxNSW7E5Qz9/fkhC2asq8mHxelYymKRTNh4AXec+
	 BjNLXit9Fc4h8Ek94bJ1p3MT04YPMtWkKuC4p0K4NM47FeXm0hpIxYiwRr8JcX2sjl
	 Kz/q7gRypuymfxd4gq4LsA91BFQ2brZ0xPg7pPr+MFn4Cb1j4ysnbRJnadJmdJ5Ui8
	 NbcJHrGw1Lgow==
Received: by mail-yb1-f198.google.com with SMTP id e189-20020a25e7c6000000b006e37f21e689so94249ybh.10
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 04:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjYjLXCHxCVOYpmvr6/HR55meSdpQL0pXQhoi2NzHxE=;
        b=TLZzrh5i7D4t5RUdoJdi8kTtuT3+LBdLC2J+EM0bF14RV2JKtVQTyFzJB8i5+3t5Ti
         SsY+lUjxdKubLIwF+p3B3J3lm5rTZOtd59jvo+Mm2ZDKS0p4W3JvIlYo6H0fIwLGsIdx
         uVF1Z0NbqLaykRJUuB2VSz02weSBnXNPNZU3g8i9TRjWmjqQxevNnV40dl1YbE3WRCLc
         l8PkscuoUu41u09YRndkeSxQPJ0KXqHr9NflEn6Wvjq8MuFnnduYUi6nGPOt3ujl0dFK
         Y4pQVx94UZzbOBg5WpmEXnSWQTfOyXaNGDnEPSuSCgTYoaTx/ogTfjcBuqBperWKTb4W
         TgAA==
X-Gm-Message-State: ANoB5plhA6s6qKJjIR1y9N2v15arki3eP/eIaVlaGttzZkTDatthAmdh
	acBMBQiGFucCOOFOaZ+ATz7sHZmIflVMEn2uIY1GKHkymEM8A0jrgez6dpf/OpLizPHTijPhp3f
	SgpSVhxX0wmSNiZGaZ1h9gmb+dOF3EkUQ1c7GQbQoUZQbYl3NjqzUddmCnS4Kyw==
X-Received: by 2002:a81:556:0:b0:378:5e3a:8fad with SMTP id 83-20020a810556000000b003785e3a8fadmr12615035ywf.78.1668428961016;
        Mon, 14 Nov 2022 04:29:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7wS1ePe3ADA7/g4WT3zzR1qbkmIrUih6+wsO760+XFCcX6DiRWiaMR32+bxdGimx0RljMHDJivnWKxZbnzmG4=
X-Received: by 2002:a81:556:0:b0:378:5e3a:8fad with SMTP id
 83-20020a810556000000b003785e3a8fadmr12615015ywf.78.1668428960726; Mon, 14
 Nov 2022 04:29:20 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <CAJM55Z8PBGWr6ej1GSfks8nCvK0q=sF8qDK6f8w=+Nh1mr4sSg@mail.gmail.com>
 <20221114113553.3dxrumhk72jouzek@kamzik> <2234530.yKVeVyVuyW@diego> <20221114121506.odv2vgc4whjrfwf4@kamzik>
In-Reply-To: <20221114121506.odv2vgc4whjrfwf4@kamzik>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 14 Nov 2022 13:29:04 +0100
Message-ID: <CAJM55Z85MdF5sKSXnzXuj5kk_RDZeRa4e1+J8c5oCXK7cat8KA@mail.gmail.com>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org, 
	philipp.tomsich@vrull.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_042934_128753_DB29EFD9 
X-CRM114-Status: GOOD (  25.25  )
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

T24gTW9uLCAxNCBOb3YgMjAyMiBhdCAxMzoxNSwgQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFu
YW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE5vdiAxNCwgMjAyMiBhdCAxMjozODozOVBN
ICswMTAwLCBIZWlrbyBTdMO8Ym5lciB3cm90ZToKPiA+IEFtIE1vbnRhZywgMTQuIE5vdmVtYmVy
IDIwMjIsIDEyOjM1OjUzIENFVCBzY2hyaWViIEFuZHJldyBKb25lczoKPiA+ID4gT24gTW9uLCBO
b3YgMTQsIDIwMjIgYXQgMTE6NTc6MjlBTSArMDEwMCwgRW1pbCBSZW5uZXIgQmVydGhpbmcgd3Jv
dGU6Cj4gPiA+ID4gT24gVGh1LCAxMCBOb3YgMjAyMiBhdCAxNzo1MCwgSGVpa28gU3R1ZWJuZXIg
PGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPiA+IC4uLgo+ID4gPiA+ID4gQEAgLTMxNiw4ICsz
ODQsMTUgQEAgdm9pZCBfX2luaXRfb3JfbW9kdWxlIHJpc2N2X2NwdWZlYXR1cmVfcGF0Y2hfZnVu
YyhzdHJ1Y3QgYWx0X2VudHJ5ICpiZWdpbiwKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICB9Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHRtcCA9ICgxVSA8PCBhbHQtPmVycmF0
YV9pZCk7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgaWYgKGNwdV9yZXFfZmVhdHVyZSAmIHRt
cCkKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHBhdGNoX3RleHRfbm9zeW5jKGFs
dC0+b2xkX3B0ciwgYWx0LT5hbHRfcHRyLCBhbHQtPmFsdF9sZW4pOwo+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgIGlmIChjcHVfcmVxX2ZlYXR1cmUgJiB0bXApIHsKPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIC8qIGRvIHRoZSBiYXNpYyBwYXRjaGluZyAqLwo+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcGF0Y2hfdGV4dF9ub3N5bmMoYWx0LT5vbGRfcHRyLCBhbHQt
PmFsdF9wdHIsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBhbHQtPmFsdF9sZW4pOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmlzY3ZfYWx0ZXJuYXRpdmVfZml4X2F1aXBjX2phbHIoYWx0LT5vbGRfcHRyLAo+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYWx0LT5hbHRfbGVuLAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWx0LT5vbGRfcHRyIC0gYWx0LT5hbHRf
cHRyKTsKPiA+ID4gPgo+ID4gPiA+IEhlcmUgeW91J3JlIGNhc3RpbmcgYSB2b2lkIHBvaW50ZXIg
dG8gYW4gaW5zdHJ1Y3Rpb24gdG8gYW4gdW5zaWduZWQKPiA+ID4gPiBpbnQgcG9pbnRlciwgYnV0
IHNpbmNlIHdlIGVuYWJsZSBjb21wcmVzc2VkIGluc3RydWN0aW9ucyB0aGlzIG1heQo+ID4gPiA+
IHJlc3VsdCBpbiBhbiB1bmFsaWduZWQgcG9pbnRlci4gVXNpbmcgdGhpcyBwb2ludGVyIHdpbGwg
d29yaywgYnV0IG1heQo+ID4gPiA+IGJlIHNsb3cuIEVnLiBmYXVsdCB0byBtLW1vZGUgdG8gYmUg
cGF0Y2hlZCB1cC4gV2UgYWxyZWFkeSBkbyB0aGF0IGluCj4gPiA+ID4gb3RoZXIgcGxhY2VzIGlu
IHRoZSBhcmNoL3Jpc2N2LCBidXQgSSdkIHByZWZlciBub3QgdG8gYWRkIG5ldwo+ID4gPiA+IGlu
c3RhbmNlcyBvZiB0aGlzLgo+ID4gPgo+ID4gPiBBbHRlcm5hdGl2ZSBpbnN0cnVjdGlvbiBzZXF1
ZW5jZXMgKG9sZCBhbmQgbmV3KSBoYXZlIGNvbXByZXNzaW9uIGRpc2FibGVkLgo+ID4KPiA+IFRo
YXQgd2FzIG15IGZpcnN0IHRob3VnaHQgYXMgd2VsbCwgYnV0IEkgdGhpbmsgRW1pbCB3YXMgdGFs
a2luZyBtb3JlIGFib3V0IHRoZQo+ID4gcGxhY2VtZW50IG9mIHRoZSBhbHRlcm5hdGl2ZSBibG9j
ayBpbnNpZGUgdGhlIHJ1bm5pbmcga2VybmVsLgo+ID4KPiA+IGkuZS4gSSBndWVzcyB0aGUgc3Rh
cnRpbmcgcG9pbnQgb2YgYW4gYWx0ZXJuYXRpdmUgc2VxdWVuY2UgY291bGQgYWxzbyBiZSB1bmFs
aWduZWQuCj4KPiBPaCwgSSBzZWUuCj4KPiA+Cj4gPiBUaG91Z2ggSSBkb24ndCBfeWV0XyBzZWUg
aG93IGFuIGltcHJvdmVtZW50IGNvdWxkIGxvb2sgbGlrZS4KPgo+IEkgdGhpbmsgd2UgY2FuIHBh
dGNoIHRoZSBhbHRlcm5hdGl2ZSBtYWNyb3MgdG8gYWRkIGFsaWdubWVudC4gU29tZXRoaW5nCj4g
bGlrZQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWx0ZXJuYXRpdmUt
bWFjcm9zLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLW1hY3Jvcy5oCj4g
aW5kZXggZWMyZjNmMWI4MzZmLi4zYzMzMGE5MDY2ZjcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9hbHRlcm5hdGl2ZS1tYWNyb3MuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vYWx0ZXJuYXRpdmUtbWFjcm9zLmgKPiBAQCAtMjAsNiArMjAsNyBAQAo+ICAgICAg
ICAgQUxUX0VOVFJZIDg4NmIsIDg4OGYsIFx2ZW5kb3JfaWQsIFxlcnJhdGFfaWQsIDg4OWYgLSA4
ODhmCj4gICAgICAgICAucG9wc2VjdGlvbgo+ICAgICAgICAgLnN1YnNlY3Rpb24gMQo+ICsgICAg
ICAgLmJhbGlnbiA0Cj4gIDg4OCA6Cj4gICAgICAgICAub3B0aW9uIHB1c2gKPiAgICAgICAgIC5v
cHRpb24gbm9ydmMKPiBAQCAtMzQsNiArMzUsNyBAQAo+ICAuZW5kbQo+Cj4gIC5tYWNybyBfX0FM
VEVSTkFUSVZFX0NGRyBvbGRfYywgbmV3X2MsIHZlbmRvcl9pZCwgZXJyYXRhX2lkLCBlbmFibGUK
PiArICAgICAgIC5iYWxpZ24gNAo+ICA4ODYgOgo+ICAgICAgICAgLm9wdGlvbiBwdXNoCj4gICAg
ICAgICAub3B0aW9uIG5vcnZjCj4gQEAgLTQ5LDYgKzUxLDcgQEAKPgo+ICAubWFjcm8gX19BTFRF
Uk5BVElWRV9DRkdfMiBvbGRfYywgbmV3X2NfMSwgdmVuZG9yX2lkXzEsIGVycmF0YV9pZF8xLCBl
bmFibGVfMSwgXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuZXdfY18yLCB2
ZW5kb3JfaWRfMiwgZXJyYXRhX2lkXzIsIGVuYWJsZV8yCj4gKyAgICAgICAuYmFsaWduIDQKPiAg
ODg2IDoKPiAgICAgICAgIC5vcHRpb24gcHVzaAo+ICAgICAgICAgLm9wdGlvbiBub3J2Ywo+IEBA
IC04Nyw2ICs5MCw3IEBACj4gICAgICAgICBBTFRfRU5UUlkoIjg4NmIiLCAiODg4ZiIsIF9fc3Ry
aW5naWZ5KHZlbmRvcl9pZCksIF9fc3RyaW5naWZ5KGVycmF0YV9pZCksICI4ODlmIC0gODg4ZiIp
IFwKPiAgICAgICAgICIucG9wc2VjdGlvblxuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAiLnN1YnNlY3Rpb24gMVxuIiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgIi5iYWxp
Z24gNFxuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiAgICAgICAgICI4ODggOlxuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAiLm9wdGlvbiBwdXNoXG4iICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgIi5vcHRp
b24gbm9ydmNcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiBAQCAtMTAwLDYgKzEwNCw3IEBACj4gICAgICAgICAiLmVuZGlmXG4iCj4KPiAgI2RlZmlu
ZSBfX0FMVEVSTkFUSVZFX0NGRyhvbGRfYywgbmV3X2MsIHZlbmRvcl9pZCwgZXJyYXRhX2lkLCBl
bmFibGUpICBcCj4gKyAgICAgICAiLmJhbGlnbiA0XG4iICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgIjg4NiA6XG4iICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAg
ICIub3B0aW9uIHB1c2hcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gICAgICAgICAiLm9wdGlvbiBub3J2Y1xuIiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IEBAIC0xMTYsNiArMTIxLDcgQEAKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5hYmxlXzEsICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuZXdfY18y
LCB2ZW5kb3JfaWRfMiwgZXJyYXRhX2lkXzIsICAgXAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBlbmFibGVfMikgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAg
ICAgICIuYmFsaWduIDRcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gICAgICAgICAiODg2IDpcbiIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgIi5vcHRpb24gcHVzaFxu
IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAg
ICAgICIub3B0aW9uIG5vcnZjXG4iICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCgpXaHkgbm90IGp1c3QgdXNlIGFjY2Vzc29ycz8gRWcuCgp1bnNpZ25lZCBp
bnQgcmlzY3ZfaW5zdHJ1Y3Rpb25fYXQodm9pZCAqcCkKewogIHUxNiAqcGFyY2VsID0gcDsKICBy
ZXR1cm4gKHVuc2lnbmVkIGludClwYXJjZWxbMF0gfCAodW5zaWduZWQgaW50KXBhcmNlbFsxXSA8
PCAxNjsKfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
