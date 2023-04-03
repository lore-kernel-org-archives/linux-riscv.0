Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F285AC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 18:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dk14KoPS/Iqr8M9JcHgUyMuUFpZJYhRY/IDTOHsrIXI=; b=JxqpFAZXr6ckKP
	9Aoo1Jq2ulNhG9MeYaKNYx0to3APY6f1RbkfxLIcllXb75v4Eevf2smvvlv/vS0iGMKD5IJxqCxS4
	ffgPMHMXWXGaSMyiMssGjT2/y0vYozxzCixOCkBWL2yufvg3RSVb/1/rVzEt/MYuK5tgreYJ/WP0v
	tnEvAlJ5pK16BoKoq4jcaI7+63CZCUJHZiye/Mvh+Idyk4gvh8BKsmePqmmeBqaEQ8uL5MIxTr0q1
	sOsWN2iTDN5SZELW4Z0Se7yMbXv0suyNIM2xgPyjdQJ2ZrvUR8AfLxSYJhNYbSAIgzqew0ST4BNiG
	inOVw/4Tf/5Yl4ldVEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOqe-00GBhu-2h;
	Mon, 03 Apr 2023 18:24:08 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOqc-00GBhG-26
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 18:24:08 +0000
Received: by mail-il1-x131.google.com with SMTP id j6so15762919ilr.7
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680546244; x=1683138244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLcYkBQ6zlbiLXorhcUGXvnBxQ6eez111cDSr+vpQ3I=;
        b=S7qbEl+v2sdnA3rkEm1vOAgL+NUKHBQIEk9qzKAGVoQa+3K7EuSN9AHp+srdKkmEWY
         VfPDndddKuQTO3cVQx6pZ9aFR6zglYxPNy2r9V267lAm1SASscLaSwVz+mIsExlLFOhh
         dSk4vdL/xGaaUOtJBTyj9S0aYGSsqRz2wdN86xJf0pbv5ZrJoARtDR6qbSA43TMG9OXc
         yZVBJL72UEx14eJ1/bMOiglImMp1IlsbjddqH6lvvYLS20/ZRH0Hufc0yCE9Ev/eJf0A
         qVWaxc1liDA2FN2tC06bC8Q4rQFezWqFNBlTiWRdAcK+yUGxOGMDQOWpaIT+WDdSzNMo
         Q2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680546244; x=1683138244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLcYkBQ6zlbiLXorhcUGXvnBxQ6eez111cDSr+vpQ3I=;
        b=50MBf45NWXAS89GvGMxa2AgY+/N9q/JCP9sVJNz47/eLpXS4fulZ5ECZyHacKeTOds
         GDxz3ulEgbfOXob33FP/gYDCM50IId9xgnXdwgNuKQMml6AsiyCtvXHm3oXkpoEFGQ80
         a6jjKgadYBnzLk7HS/uqBLwnr+IqFSQ8eANxg/U8UsswUL/RIh7o1ejhFBpZqRGPBo/C
         FVD6POM2Ob+HwCf8g9yt1z8fkSTyCJDccQIX2NEn+64nmdqXCTIckHoPmUDB22iXRUpr
         XF8ldF2lPP6bk5jmuxZmfOviyUY1uVpPtlzeLQsc8pAFCpwwwNPwikaOxsZMcOFHlbvA
         h0Ww==
X-Gm-Message-State: AAQBX9dBUE0/97PJIQ/gqcN5foX0waR+EwPJw9Xr/OiNKL3Gvx5YFmS6
	hSQvKJLU3Vq00OdpY/0ZDXKg6nmaFSIJETu5dgg=
X-Google-Smtp-Source: AKy350b3ENLXo3KDjAtD/3eyk+24aIZQL1Zpoc6eQj6JAT14NdrcAFxaQCuw6vmBHfaUgEQ/Ocn/t7Yp80NS7aFVttw=
X-Received: by 2002:a92:ac03:0:b0:316:fa49:3705 with SMTP id
 r3-20020a92ac03000000b00316fa493705mr14897ilh.1.1680546244503; Mon, 03 Apr
 2023 11:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <f12f9773-77b5-4ba6-9e9e-adbc67ca0110@spud>
In-Reply-To: <f12f9773-77b5-4ba6-9e9e-adbc67ca0110@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Apr 2023 19:23:37 +0100
Message-ID: <CA+V-a8s0UViJ0tBSyiL0ZG8iVT3QSW77=VujJJOfiuM8T=9ntg@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
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
X-CRM114-CacheID: sfid-20230403_112406_728156_B34213CA 
X-CRM114-Status: GOOD (  31.03  )
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

SGkgQ29ub3IsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBGcmksIE1hciAzMSwgMjAy
MyBhdCAxOjI04oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4g
d3JvdGU6Cj4KPiBIZXksCj4KPiBJIHRoaW5rIG1vc3Qgb2Ygd2hhdCBJIHdhbnRlZCB0byB0YWxr
IGFib3V0IGhhcyBiZWVuIHJhaXNlZCBieSBBcm5kIG9yCj4gR2VlcnQsIHNvIEkga2luZGEgb25s
eSBoYXZlIGEgY291cGxlIG9mIHNtYWxsIGNvbW1lbnRzIGZvciB5b3UgaGVyZS4KPgo+IE9uIFRo
dSwgTWFyIDMwLCAyMDIzIGF0IDA5OjQyOjEyUE0gKzAxMDAsIFByYWJoYWthciB3cm90ZToKPiA+
IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2Fz
LmNvbT4KPiA+Cj4gPiBDdXJyZW50bHksIHNlbGVjdGluZyB3aGljaCBDTU9zIHRvIHVzZSBvbiBh
IGdpdmVuIHBsYXRmb3JtIGlzIGRvbmUgdXNpbmcKPiA+IGFuZCBBTFRFUk5BVElWRV9YKCkgbWFj
cm8uIFRoaXMgd2FzIG1hbmFnZWFibGUgd2hlbiB0aGVyZSB3ZXJlIGp1c3QgdHdvCj4gPiBDTU8g
aW1wbGVtZW50YXRpb25zLCBidXQgbm93IHRoYXQgdGhlcmUgYXJlIG1vcmUgYW5kIG1vcmUgcGxh
dGZvcm1zIGNvbWluZwo+ID4gbmVlZGluZyBjdXN0b20gQ01PcywgdGhlIHVzZSBvZiB0aGUgQUxU
RVJOQVRJVkVfWCgpIG1hY3JvIGlzIHVubWFuYWdlYWJsZS4KPiA+Cj4gPiBUbyBhdm9pZCBzdWNo
IGlzc3VlcyB0aGlzIHBhdGNoIHN3aXRjaGVzIHRvIHVzZSBvZiBmdW5jdGlvbiBwb2ludGVycwo+
ID4gaW5zdGVhZCBvZiBBTFRFUk5BVElWRV9YKCkgbWFjcm8gZm9yIGNhY2hlIG1hbmFnZW1lbnQg
KHRoZSBvbmx5IGRyYXdiYWNrCj4gPiBiZWluZyBwZXJmb3JtYW5jZSBvdmVyIHRoZSBwcmV2aW91
cyBhcHByb2FjaCkuCj4gPgo+ID4gdm9pZCAoKmNsZWFuX3JhbmdlKSh1bnNpZ25lZCBsb25nIGFk
ZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiB2b2lkICgqaW52X3JhbmdlKSh1bnNpZ25lZCBs
b25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiB2b2lkICgqZmx1c2hfcmFuZ2UpKHVu
c2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKTsKPgo+IFNvLCBnaXZlbiBBcm5k
IGhhcyByZW5hbWVkIHRoZSBnZW5lcmljIGhlbHBlcnMsIHNob3VsZCB3ZSB1c2UgdGhlCj4gd3Jp
dGViYWNrL2ludmFsaWRhdGUvd3JpdGViYWNrICYgaW52YWxpZGF0ZSB0ZXJtaW5vbG9neSBoZXJl
IHRvbz8KPiBJIHRoaW5rIGl0J2QgYmUgbmljZSB0byBtYWtlIHRoZSAiZHJpdmVyIiBmdW5jdGlv
bnMgbWF0Y2ggdGhlIGdlbmVyaWMKPiBpbXBsZW1lbnRhdGlvbnMncyBuYW1lcyAoZXZlbiB0aG91
Z2ggdGhhdCBtZWFucyBub3QgbWFraW5nIHRoZQo+IGluc3RydWN0aW9uIG5hbWluZykuCj4KPiA+
IFRoZSBhYm92ZSBmdW5jdGlvbiBwb2ludGVycyBhcmUgcHJvdmlkZWQgdG8gYmUgb3ZlcnJpZGRl
biBmb3IgcGxhdGZvcm1zCj4gPiBuZWVkaW5nIENNTy4KPiA+Cj4gPiBDb252ZXJ0IFpJQ0JPTSBh
bmQgVC1IRUFEIENNTyB0byB1c2UgZnVuY3Rpb24gcG9pbnRlcnMuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPgo+ID4gLS0tCj4gPiB2Ni0+djcKPiA+ICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24K
PiA+ICogRml4ZWQgYnVpbGQgaXNzdWVzIHdoZW4gQ09ORklHX0VSUkFUQV9USEVBRF9DTU89bgo+
ID4gKiBVc2VkIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHRyIHRvIHJlZ2lzdGVyIENNTyBvcHMKPiA+
ICogRHJvcHBlZCByaXNjdl9kbWFfbm9uY29oZXJlbnRfY21vX29wcwo+Cj4gPiAqIE1vdmVkIFpJ
Q0JPTSBDTU8gc2V0dXAgdG8gc2V0dXAuYwo+Cj4gV2h5J2QgeW91IGRvIHRoYXQ/Cj4gV2hhdCBp
cyB0aGUgcmVhc29uIHRoYXQgdGhlIFppY2JvbSBzdHVmZiBjYW5ub3QgbGl2ZSBpbgo+IGRtYS1u
b25jb2hlcmVudC5bY2hdIGFuZCBvbmx5IGV4cG9zZSwgc2F5Ogo+IHZvaWQgcmlzY3ZfY2JvbV9y
ZWdpc3Rlcl9jbW9fb3BzKHZvaWQpCj4gewo+ICAgICAgICAgcmlzY3Zfbm9uY29oZXJlbnRfcmVn
aXN0ZXJfY2FjaGVfb3BzKCZ6aWNib21fY21vX29wcyk7Cj4gfQo+IHdoaWNoIHlvdSB0aGVuIGNh
bGwgZnJvbSBzZXR1cC5jPwo+CkNvbW1pdCBhYmNjNDQ1YWNkICgicmlzY3Y6IG1vdmUgcmlzY3Zf
bm9uY29oZXJlbnRfc3VwcG9ydGVkKCkgb3V0IG9mClpJQ0JPTSBwcm9iZSkgbW92ZWQgdGhlIHpp
Y2JvbSB0aGUgc2V0dXAgdG8gc2V0dXAuYyBoZW5jZSBJIG1vdmVkIHRoZQpDTU8gc3R1ZmYgaGVy
ZS4gU2FpZCB0aGF0LCBub3cgSSBhbSBkZWZhdWx0aW5nIHRvIHppY2JvbSBvcHMgc28gSSBoYXZl
Cm1vZGUgdGhlIGZ1bmN0aW9ucyB0byBkbWEtbm9uY29oZXJlbnQuYyAgLgoKPiA+IHY1LT52Ngo+
ID4gKiBOZXcgcGF0Y2gKPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0
YS5jICAgICAgICAgfCA3NiArKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2RtYS1ub25jb2hlcmVudC5oIHwgNzMgKysrKysrKysrKysrKysrKysrKysr
KysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmggICAgIHwgNTMgLS0t
LS0tLS0tLS0tLS0tLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAg
ICAgIHwgNDkgKysrKysrKysrKysrKystCj4gPiAgYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJl
bnQuYyAgICAgICAgICB8IDI1ICsrKysrKy0tCj4gPiAgYXJjaC9yaXNjdi9tbS9wbWVtLmMgICAg
ICAgICAgICAgICAgICAgICB8ICA2ICstCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAyMjEgaW5zZXJ0
aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZG1hLW5vbmNvaGVyZW50LmgKPgo+ID4gKyNpZmRlZiBDT05GSUdfUklT
Q1ZfSVNBX1pJQ0JPTQo+ID4gKwo+ID4gKyNkZWZpbmUgWklDQk9NX0NNT19PUChfb3AsIF9zdGFy
dCwgX3NpemUsIF9jYWNoZXNpemUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
PiArICAgICBhc20gdm9sYXRpbGUoIm12IGEwLCAlMVxuXHQiICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgImogMmZcblx0
IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAr
ICAgICAgICAgICAgICAgICAgIjM6XG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgQ0JPXyMjX29wKGEw
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAg
ICAgICAgICAgICAgICAgImFkZCBhMCwgYTAsICUwXG5cdCIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgIjI6XG5cdCIgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAg
ICAgICAgICAgICAgImJsdHUgYTAsICUyLCAzYlxuXHQiICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgOiA6ICJyIihfY2FjaGVzaXpl
KSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICJyIigodW5zaWduZWQgbG9uZykoX3N0YXJ0KSAmIH4oKF9jYWNoZXNpemUp
IC0gMVVMKSksICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICJyIigodW5zaWduZWQgbG9u
ZykoX3N0YXJ0KSArIChfc2l6ZSkpICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAg
ICAgICAgOiAiYTAiKQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIHppY2JvbV9jbW9fY2xlYW5fcmFu
Z2UodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCj4gPiArewo+ID4gKyAg
ICAgWklDQk9NX0NNT19PUChjbGVhbiwgYWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXpl
KTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgemljYm9tX2Ntb19mbHVzaF9yYW5nZSh1
bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+ICt7Cj4gPiArICAgICBa
SUNCT01fQ01PX09QKGZsdXNoLCBhZGRyLCBzaXplLCByaXNjdl9jYm9tX2Jsb2NrX3NpemUpOwo+
ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCB6aWNib21fY21vX2ludmFsX3JhbmdlKHVuc2ln
bmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQo+ID4gK3sKPiA+ICsgICAgIFpJQ0JP
TV9DTU9fT1AoaW52YWwsIGFkZHIsIHNpemUsIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gPiAr
fQo+ID4gKwo+ID4gK2NvbnN0IHN0cnVjdCByaXNjdl9jYWNoZV9vcHMgemljYm9tX2Ntb19vcHMg
PSB7Cj4gPiArICAgICAuY2xlYW5fcmFuZ2UgPSAmemljYm9tX2Ntb19jbGVhbl9yYW5nZSwKPiA+
ICsgICAgIC5pbnZfcmFuZ2UgPSAmemljYm9tX2Ntb19pbnZhbF9yYW5nZSwKPiA+ICsgICAgIC5m
bHVzaF9yYW5nZSA9ICZ6aWNib21fY21vX2ZsdXNoX3JhbmdlLAo+ID4gK307Cj4gPiArCj4gPiAr
c3RhdGljIHZvaWQgemljYm9tX3JlZ2lzdGVyX2Ntb19vcHModm9pZCkKPiA+ICt7Cj4gPiArICAg
ICByaXNjdl9ub25jb2hlcmVudF9yZWdpc3Rlcl9jYWNoZV9vcHMoJnppY2JvbV9jbW9fb3BzKTsK
PiA+ICt9Cj4gPiArI2Vsc2UKPiA+ICtzdGF0aWMgdm9pZCB6aWNib21fcmVnaXN0ZXJfY21vX29w
cyh2b2lkKSB7fQo+ID4gKyNlbmRpZgo+Cj4gSSB0aGluayBhbGwgb2YgdGhlIGFib3ZlIHNob3Vs
ZCBiZSBwcmVmaXhlZCB3aXRoIHJpc2N2X2Nib20gdG8gbWF0Y2ggdGhlCj4gb3RoZXIgcmlzY3Zf
Y2JvbSBzdHVmZiB3ZSBhbHJlYWR5IGhhdmUuCkp1c3QgdG8gY2xhcmlmeSwgdGhlIHJpc2N2X2Ni
b20gcHJlZml4IHNob3VsZCBqdXN0IGJlIGFwcGxpZWQgdG8gdGhlClpJQ09NIGZ1bmN0aW9ucyBh
bmQgbm90IHRvIFQtSEVBRD8KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
