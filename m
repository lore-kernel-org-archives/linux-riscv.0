Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD6EC001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 19:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6l+94v6ktTOfqNpns3Ri0Rva6Omq/cJxB1BGFK1J6Q=; b=3PNVfpnS+y18pL
	RBqtSMETBJwXDKg3DcPOE5U85utVns7ub0PHQ+dTrZb89CLdUVQK2fJZqJBsBR8BX00dp5yBVdZu2
	J0/dYBMuGLliSSv2hQKH3Os9GBMMqV+dP4FtK6x/9MLZN1d+LQMcu7LIqux53tcOcfnIVHPqNrrfP
	6EotH9JvKPBZhBsKxe7dpELs5BsIUncXbuWUDHLnx3lWCC9x7fQyoHJt6nnANz20Ju6T2b4xhtxNa
	6UDcoNzN2yw5ifzCI0DKCm4r2+rRl03hS8wiv8VkTbiWABXZ1Fw9FvQALEF4pxxqdjGaq/SlVYLJ4
	hkAz0+g4t4cth0fI9Arw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRHrv-005mAS-2U;
	Wed, 02 Aug 2023 19:50:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRHrt-005m9k-0V;
	Wed, 02 Aug 2023 19:50:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe1fc8768aso2402555e9.1;
        Wed, 02 Aug 2023 12:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691005845; x=1691610645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIsEdvHTkRHt69kFNg/UK9NrCtXb0lJcor4CbmeS9Hk=;
        b=R5wZp/xcsv35BlfRKilsYrHF1dhaqJAiOM88mITtX2ac33Ys3k+SZ6hzpyoP/EncS0
         PlQlnh1B7WsiB34wEYWeyPFGel3GTMWqUs22JBAS+xCX34/eQc8oHTV20pe079jQhUco
         AldAYBl/7BQOilco0TIDkaCBEW0kNsLo3iTG/2CPGR1jfreq+IHr2a+e3MGq5JIKK8dg
         SW7X+kfIrvWwvm0b7kU7zwCGGHiZ97UmhrFkkEnCt2Uyb9Ui9eqGZrbQPt1HyrL+vrBA
         67CIrGTNbdPKee5Va56I3zOhucFhXGpEIe34NknlPMpPBl9onEfZdJ0qge0LONsurRXX
         uSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691005845; x=1691610645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIsEdvHTkRHt69kFNg/UK9NrCtXb0lJcor4CbmeS9Hk=;
        b=LKGoZsmCbf59t6SvDO94ET7enYltwojPwr+Sq3gwNCjMrxyU6Zy/NojV1BY8nhEcBc
         4IC/sp995fbo90ubrcYYDfAfgWgWND7G24lXDBUbwx7chiLrrQqrzoHCa7DNsiuxHYqN
         TJSoQE4nlYzUz8DyYTuh5iJ9q6oO3TCmar3RL4ehtxdGAm/G1esu7RI1E4PO8Usu3ptN
         4CCW4n/oWYkG2C3cqZWawcKGL/acPrd1e3rGP8gh/DTp0sXJgqutdkaofmyoACdkLKMh
         qeVhqHx5kwTJTOGX3ExNRRAQ+cKqw7Zlbud0cCqbNymdmEdkG/WAJrvVl5V5Mu3XHWXW
         8huw==
X-Gm-Message-State: ABy/qLbAW1U0hjQTySUI+Td7A9vXjIKSxgDYpL2DIqkHOqs13Ih8XGAA
	Ky5jsxIDpHfUyq5uIM7y51s=
X-Google-Smtp-Source: APBJJlHHgd2WIdq0IccJQZ2AKkE0gkK04uGb9tNRmFHgVwOqmlDWdtUcLWuRXjitS2H+CPmD7MrvSg==
X-Received: by 2002:a1c:7511:0:b0:3fe:2f31:8bf7 with SMTP id o17-20020a1c7511000000b003fe2f318bf7mr2864638wmc.26.1691005844631;
        Wed, 02 Aug 2023 12:50:44 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id a23-20020a05600c225700b003fc01495383sm2418619wmm.6.2023.08.02.12.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 12:50:44 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Subject: Re: [PATCH v1 3/3] riscv: dts: allwinner: d1: Add QSPI pins node for pinmux
 PC port
Date: Wed, 02 Aug 2023 21:50:39 +0200
Message-ID: <5956489.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <CALHCpMgXy0pLiVR8V48Roi82EJ7Zrx-Xyc-6etjgkmN0B7pb8A@mail.gmail.com>
References: <20230624131632.2972546-1-bigunclemax@gmail.com>
 <10311404.nUPlyArG6x@jernej-laptop>
 <CALHCpMgXy0pLiVR8V48Roi82EJ7Zrx-Xyc-6etjgkmN0B7pb8A@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_125049_198733_F9966248 
X-CRM114-Status: GOOD (  18.59  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RG5lIHBvbmVkZWxqZWssIDMxLiBqdWxpaiAyMDIzIG9iIDE3OjIyOjExIENFU1QgamUgTWF4aW0g
S2lzZWxldiBuYXBpc2FsKGEpOgo+INC/0L0sIDMxINC40Y7Quy4gMjAyM+KAr9CzLiDQsiAwMToz
MCwgSmVybmVqIMWga3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+Ogo+ID4gRG5lIHNv
Ym90YSwgMjQuIGp1bmlqIDIwMjMgb2IgMTU6MTY6MjQgQ0VTVCBqZSBNYWtzaW0gS2lzZWxldiBu
YXBpc2FsKGEpOgo+ID4gPiBBZGQgcGlubXV4IG5vZGUgdGhhdCBkZXNjcmliZXMgcGlucyBvbiBQ
QyBwb3J0IHdoaWNoIHJlcXVpcmVkIGZvcgo+ID4gPiBRU1BJIG1vZGUuCj4gPiA+IAo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBNYWtzaW0gS2lzZWxldiA8YmlndW5jbGVtYXhAZ21haWwuY29tPgo+ID4g
PiAtLS0KPiA+ID4gCj4gPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1k
MXMtdDExMy5kdHNpIHwgNyArKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3
aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+ID4gPiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxs
d2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kgaW5kZXgKPiA+ID4gMWJiMWU1Y2FlNjAyLi45Zjc1
NGRkMDNkODUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVy
L3N1bnhpLWQxcy10MTEzLmR0c2kKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3
aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+ID4gPiBAQCAtMTMxLDYgKzEzMSwxMyBAQCB1YXJ0
M19wYl9waW5zOiB1YXJ0My1wYi1waW5zIHsKPiA+ID4gCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBpbnMgPSAiUEI2IiwgIlBCNyI7Cj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGZ1bmN0aW9uID0gInVhcnQzIjsKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgIAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgfTsKPiA+ID4gCj4gPiA+ICsKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgIC9vbWl0LWlmLW5vLXJlZi8KPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHFzcGkwX3BjX3BpbnM6IHFzcGkwLXBjLXBpbnMgewo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwaW5zID0gIlBDMiIsICJQQzMiLCAiUEM0IiwgIlBDNSIsCj4g
PiAKPiA+ICJQQzYiLAo+ID4gCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiUEM3IjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnVuY3Rpb24g
PSAic3BpMCI7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Owo+ID4gCj4gPiBTb3JyeSBm
b3IgbGF0ZSByZXZpZXcsIGJ1dCBpdCBzZWVtcyBJJ20gbWlzc2luZyBzb21ldGhpbmcuIEQxIG1h
bnVhbCBzYXlzCj4gPiB0aG9zZSBhcmUgcGlucyBmb3Igb3JkaW5hcnkgU1BJLCB3aXRoIEhPTEQg
YW5kIFdQIHNpZ25hbHMuIENhbiB0aGV5IGJlCj4gPiByZXB1cnBvc2VkIGZvciBxdWFkIFNQST8K
PiAKPiBZZXMsIHRoZXkgY2FuLiBIZXJlIGlzIGEgcXVvdGUgZnJvbSBEMSBkYXRhc2hlZXQgKDku
My4zLjggU1BJCj4gUXVhZC1JbnB1dC9RdWFkLU91dHB1dCBNb2RlKToKPiAiVXNpbmcgdGhlIHF1
YWQgbW9kZSBhbGxvd3MgZGF0YSB0byBiZSB0cmFuc2ZlcnJlZCB0byBvciBmcm9tIHRoZQo+IGRl
dmljZSBhdCA0IHRpbWVzIHRoZSByYXRlIG9mIHN0YW5kYXJkIHNpbmdsZSBtb2RlLCB0aGUgZGF0
YSBjYW4gYmUKPiByZWFkCj4gYXQgZmFzdCBzcGVlZCB1c2luZyBmb3VyIGRhdGEgYml0cyAoTU9T
SSwgTUlTTywgSU8yIChXUCMpIGFuZCBJTzMKPiAoSE9MRCMpKSBhdCB0aGUgc2FtZSB0aW1lLiIK
CkFscmlnaHQgdGhlbi4KCkFja2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNA
Z21haWwuY29tPgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
