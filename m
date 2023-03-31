Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5B9C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 07:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6exWj0FXD0siyXDmAZQ4lIEQRc9VZco+SKWgb2T8QI=; b=Xin9YK5QKBBdIg
	AuJOP8uUf1sF2cxljz8Wus5s5ZrlobXY4+BwcXPQfPIhI3t7u8UMKWCCi+zZAjx9PzESS5pFZFySh
	6Raz+m3MxKt/GMUXvkXIpIFCpy7sdBhF/s95ervpdhQFfW9XSf4p7r4dgAUXBDhOVI8Yv0F5dXdLg
	Obdt1jSiJgh2QAI/FJ3bmGDUZNQ213ZegUqG6G6/fPFmDqn0+OVri2rwjURWpTgUr2KCsSxVwqadK
	bMvsuuA3/Vry9Twy/yciILH3WVVowZk/pL236F0tkXzA0kCNKURHf4Wk3JY7/pvxrkuU3PRsBKNOk
	I7SixYJ4gn1MT42linnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9ET-006Afi-07;
	Fri, 31 Mar 2023 07:31:33 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9EP-006AeO-2e
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 07:31:31 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-545cb3c9898so324941407b3.7
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 00:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680247887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUd21DqN56tUJJauxzkykeUBegNuegGhlGwWCjC09Bs=;
        b=XzXePmYe5Q8F87fJWK7l7fhIxBQax5JWNGbmEQrxChtAi1iNfcuVsd4qJ0W4X1opNi
         jBNKns2nN8dfC1vF9P8Vdb6CeKdhLsFuABUybMbme0iclOqwLhO+rlTGe2nZ6yGssQEW
         Y8MtBIPWcMj5VKrix7GkH1F8dV8JZxkKEBqn1zAgcRLagTEuY5duxagN0OL5udTOJPtz
         rLaTv806PdjL8QTWu5h1yKwnAF9PGpY0S72cdkPp8oCh0pnNXURYF0FfWhDUN5OIIdU6
         siBxeIuHnW7NUImQrNVHOXA/x8WgYQLPVDdVfh/wQCsFZFfMg5Tg3T+POMM1WiGUfNbm
         bOmw==
X-Gm-Message-State: AAQBX9eglmc90bZCP+oZiXmMqIcnDk4agRnZiMNBvbmTA6NZAuwv4igq
	WXWuCUx5TH9H9niJF8JMlCpSBInEf1Syrirz
X-Google-Smtp-Source: AKy350bE33ecfeJ6GuByVANHckCdFmiL6Bf2OafLPgxbSuTHMHD/V2fi3Tn+6TMsNxsQw/MnWaC3jg==
X-Received: by 2002:a0d:d98f:0:b0:540:62ba:c2a3 with SMTP id b137-20020a0dd98f000000b0054062bac2a3mr27235388ywe.1.1680247886822;
        Fri, 31 Mar 2023 00:31:26 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id p7-20020a81b107000000b00545a782b485sm364672ywh.113.2023.03.31.00.31.25
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 00:31:25 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-536af432ee5so400838607b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 00:31:25 -0700 (PDT)
X-Received: by 2002:a81:b65f:0:b0:545:611c:8d19 with SMTP id
 h31-20020a81b65f000000b00545611c8d19mr13248405ywk.4.1680247884888; Fri, 31
 Mar 2023 00:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Mar 2023 09:31:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVseMfkQw5OnTM4CxW9BUCZ0pVZP6px67h8VPah0x3QAA@mail.gmail.com>
Message-ID: <CAMuHMdVseMfkQw5OnTM4CxW9BUCZ0pVZP6px67h8VPah0x3QAA@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_003129_860072_CCF59BAC 
X-CRM114-Status: GOOD (  24.39  )
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

SGkgUHJhYmhha2FyLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gVGh1LCBNYXIgMzAsIDIw
MjMgYXQgMTA6NDLigK9QTSBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3
cm90ZToKPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAu
cmVuZXNhcy5jb20+Cj4KPiBDdXJyZW50bHksIHNlbGVjdGluZyB3aGljaCBDTU9zIHRvIHVzZSBv
biBhIGdpdmVuIHBsYXRmb3JtIGlzIGRvbmUgdXNpbmcKPiBhbmQgQUxURVJOQVRJVkVfWCgpIG1h
Y3JvLiBUaGlzIHdhcyBtYW5hZ2VhYmxlIHdoZW4gdGhlcmUgd2VyZSBqdXN0IHR3bwoKdGhlIEFM
VEVSTkFUSVZFX1goKQoKPiBDTU8gaW1wbGVtZW50YXRpb25zLCBidXQgbm93IHRoYXQgdGhlcmUg
YXJlIG1vcmUgYW5kIG1vcmUgcGxhdGZvcm1zIGNvbWluZwo+IG5lZWRpbmcgY3VzdG9tIENNT3Ms
IHRoZSB1c2Ugb2YgdGhlIEFMVEVSTkFUSVZFX1goKSBtYWNybyBpcyB1bm1hbmFnZWFibGUuCj4K
PiBUbyBhdm9pZCBzdWNoIGlzc3VlcyB0aGlzIHBhdGNoIHN3aXRjaGVzIHRvIHVzZSBvZiBmdW5j
dGlvbiBwb2ludGVycwoKInRoZSB1c2UiIG9yICJ1c2luZyIKCj4gaW5zdGVhZCBvZiBBTFRFUk5B
VElWRV9YKCkgbWFjcm8gZm9yIGNhY2hlIG1hbmFnZW1lbnQgKHRoZSBvbmx5IGRyYXdiYWNrCgp0
aGUgQUxURVJOQVRJVkVfWCgpCgo+IGJlaW5nIHBlcmZvcm1hbmNlIG92ZXIgdGhlIHByZXZpb3Vz
IGFwcHJvYWNoKS4KPgo+IHZvaWQgKCpjbGVhbl9yYW5nZSkodW5zaWduZWQgbG9uZyBhZGRyLCB1
bnNpZ25lZCBsb25nIHNpemUpOwo+IHZvaWQgKCppbnZfcmFuZ2UpKHVuc2lnbmVkIGxvbmcgYWRk
ciwgdW5zaWduZWQgbG9uZyBzaXplKTsKPiB2b2lkICgqZmx1c2hfcmFuZ2UpKHVuc2lnbmVkIGxv
bmcgYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKTsKPgo+IFRoZSBhYm92ZSBmdW5jdGlvbiBwb2lu
dGVycyBhcmUgcHJvdmlkZWQgdG8gYmUgb3ZlcnJpZGRlbiBmb3IgcGxhdGZvcm1zCj4gbmVlZGlu
ZyBDTU8uCj4KPiBDb252ZXJ0IFpJQ0JPTSBhbmQgVC1IRUFEIENNTyB0byB1c2UgZnVuY3Rpb24g
cG9pbnRlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cgo+IC0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL3Ro
ZWFkL2VycmF0YS5jCj4gKysrIGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKCj4g
KyNpZmRlZiBDT05GSUdfRVJSQVRBX1RIRUFEX0NNTwoKPiArc3RhdGljIHZvaWQgdGhlYWRfcmVn
aXN0ZXJfY21vX29wcyh2b2lkKQo+ICt7Cj4gKyAgICAgICByaXNjdl9ub25jb2hlcmVudF9yZWdp
c3Rlcl9jYWNoZV9vcHMoJnRoZWFkX2Ntb19vcHMpOwo+ICt9Cj4gKyNlbHNlCj4gK3N0YXRpYyB2
b2lkIHRoZWFkX3JlZ2lzdGVyX2Ntb19vcHModm9pZCkge30KPiArI2VuZGlmCgo+IC0tLSBhL2Fy
Y2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL2RtYS1u
b25jb2hlcmVudC5jCgo+IEBAIC03NSwzICs4MywxMiBAQCB2b2lkIHJpc2N2X25vbmNvaGVyZW50
X3N1cHBvcnRlZCh2b2lkKQo+ICAgICAgICAgICAgICAiTm9uLWNvaGVyZW50IERNQSBzdXBwb3J0
IGVuYWJsZWQgd2l0aG91dCBhIGJsb2NrIHNpemVcbiIpOwo+ICAgICAgICAgbm9uY29oZXJlbnRf
c3VwcG9ydGVkID0gdHJ1ZTsKPiAgfQo+ICsKPiArdm9pZCByaXNjdl9ub25jb2hlcmVudF9yZWdp
c3Rlcl9jYWNoZV9vcHMoY29uc3Qgc3RydWN0IHJpc2N2X2NhY2hlX29wcyAqb3BzKQo+ICt7Cj4g
KyAgICAgICBpZiAoIW9wcykKPiArICAgICAgICAgICAgICAgcmV0dXJuOwoKVGhpcyBpcyBuZXZl
ciB0cnVlLgpJIGd1ZXNzIG9yaWdpbmFsbHkgeW91IHdhbnRlZCB0byBjYWxsIHJpc2N2X25vbmNv
aGVyZW50X3JlZ2lzdGVyX2NhY2hlX29wcygpCnVuY29uZGl0aW9uYWxseSBmcm9tIGNvbW1vbiBj
b2RlLCBpbnN0ZWFkIG9mIHRoZSB2YXJpb3VzICpyZWdpc3Rlcl9jbW9fb3BzKCk/CkJ1dCB0aGF0
IHdvdWxkIGhhdmUgcmVxdWlyZWQgc29tZXRoaW5nIGxpa2UKCiNpZmRlZiBDT05GSUdfRVJSQVRB
X1RIRUFEX0NNTwojZGVmaW5lIFRIRUFEX0NNT19PUFNfUFRSICAgKCZ0aGVhZF9jbW9fb3BzKQoj
ZWxzZQojZGVmaW5lIFRIRUFEX0NNT19PUFNfUFRSICAgTlVMTAojZW5kaWYKCk9yIGNhbiB3ZSBj
b21lIHVwIHdpdGggc29tZSBtYWNybyBsaWtlIHBtX3B0cigpLCBidXQgdGhhdCBhbHNvIHRha2Vz
CmNhcmUgb2YgdGhlICImIiwgc28gd2UgY2FuIGRvICIjZGVmaW5lIHRoZWFkX2Ntb19vcHMgTlVM
TCI/Cgo+ICsKPiArICAgICAgIG5vbmNvaGVyZW50X2NhY2hlX29wcyA9ICpvcHM7Cj4gK30KPiAr
RVhQT1JUX1NZTUJPTF9HUEwocmlzY3Zfbm9uY29oZXJlbnRfcmVnaXN0ZXJfY2FjaGVfb3BzKTsK
Ckdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
