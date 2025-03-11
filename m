Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D20C28B2E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCx1MO9UqPLR7g019KfR1k+V2iKX3LXqV4pjzyDMvGY=; b=dnqzc9dhVJ9pbs
	LzOMzsLWZzUq887sN5Wm25BKRkLID4CXcm+1EhmGLsnNmBV2z46r9O3Xpd8Q5MRmcdwuNVPViixX8
	EB3ol7PJ2/ATIiyvuHY36Nkmzh80aocUFg1x2j6OP4tqLt6NV0/rtkiKFHzhNI+ZPZakX4HIWtu7q
	9kyk//cJeZuFjNW4JURS7gAW5mwqZBUMgD9xb+Lda9JcMr/hD/BVi/+c39+6IVS3ct44Wp4KI6hjP
	tI4UXX2fqnGlvqkbrTRiRYaXKZdv50IrAt2lIBTcu8IuShyiHqvE8FDtdFakQ+8JLkf4c6ErbTPW9
	6d0kDHM4YR5WhQveTaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzYk-00000005omt-0exr;
	Tue, 11 Mar 2025 13:22:14 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trzX5-00000005oOg-0IyH;
	Tue, 11 Mar 2025 13:20:32 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-523fa0df55dso2493008e0c.1;
        Tue, 11 Mar 2025 06:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741699229; x=1742304029; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG32Oauz2hDV9q2BpFy552F2Ma60RDkGby0ei11tRlQ=;
        b=M1O+kmD45LjpV5IZqCeP38ExO8w8HrhapuFakMsWJw9XUDpJRpI7jRoztdvjWX3hMt
         OHP66llp8YH4mm9ldFDlR77nfegNazoIjHydhSxwY4kpIiN8MTnfV3MOtlAaUG3rQCh/
         EjF0yYYSx4gM0lkBiqj07UjoAJBI23yXmQIUAJTZtQ/CWNYP5drlu0h4RZV9YY5894YN
         buRuULiIk79mUDlUk6edqF6/x4L87dMkScT2XzngYOSBHwgtSn2F8DSygw4rQv4tTV4i
         YDVr3FSQvzD0ut0Jb+rNPbRVRF6cXmy06hciLD7GvKlgzjI4ClYrUAP8decXHsG2Q7Y5
         Op/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741699229; x=1742304029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jG32Oauz2hDV9q2BpFy552F2Ma60RDkGby0ei11tRlQ=;
        b=DfdHDCYacsRrjf4NO4TDVBr/1IuKiOPvvqhUSaHYNHK5MXgPdG+4MOJILAW8Cy2rjo
         9ss51ftfd3RiOvkKLFNEmh+fqMVAqG6Hqre68PoSrpPeN/pnkkihtsKp+Jmpuiwzbcb8
         VbmBBUsrcZsVBpzWK//0ngsgqQh49NGVnzUdmDk88Ksv4QBoueFD5aCVqUnf4za3AEA3
         +AeqOfYzbLEK/dK3yJKf71keXgd7udaVh7e6X+Bmb8XbHjMoF6HlqSQU+9MUMNgUc1fW
         p40WVBLeo90hKOiE6BX5LL76qhvQdT6sF8jJY74xNN9fFMZxqAqbWzr28eK1yQada+Hi
         GLjA==
X-Forwarded-Encrypted: i=1; AJvYcCVNal3p5DcqKCIsCnMrRCkq95ScvObMW4wX3mR4R+aYLs3emsAqC/7o8KPwUOcZsvf79c7QAopHT9XFKIk=@lists.infradead.org, AJvYcCXsdBJE4FnjvA+p+I9ubavX513c2nr6ktDc7zgBHlvZE/orW8Ow4x/TM5iQUFIjN1qqEHCgda5vffMRjZp2msrb@lists.infradead.org
X-Gm-Message-State: AOJu0YzZZvwsU0pmr8Nb9guZp5UXvE1z50ouoF5COcuWR2XIk1wNF56+
	PdjPXKVqeu/2lOMsjp9aKAwvVi0EMdIthFRuQ72q951hoHS7kC1LVveOf3zjrJSTQm5v2Ok0EiL
	MqI0d10TJIxNNWsUFW1bYN649ejA=
X-Gm-Gg: ASbGncvffplKSXAVVKF2/hWvQogh0t7yODK6IyzjvloDM+tZ99xwVVzQBv0c3dXe+6D
	j+Esy6NdzTY4a9DwljzgytZ+OrXKxXWPAfZxsglgqtKr+7dI7vD2M1JXDDsdZooZdamBv8XvOhI
	ERsWcHX0HdUsy/1IwOqeU3fx4G+A==
X-Google-Smtp-Source: AGHT+IH5Ot4qDEn+dcG95GX7rHERBDIZE9g/5SbpzTjYL9a5kZXtGTj07DwxdqUsxTS40Unad1vxI6B/ZQaIH1FxayY=
X-Received: by 2002:a05:6122:3d47:b0:523:dbd5:4e7f with SMTP id
 71dfb90a1353d-52419754983mr2351687e0c.3.1741699228735; Tue, 11 Mar 2025
 06:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <Z82tWYZulV12Pjir@shell.armlinux.org.uk> <E1trIA0-005ntK-FS@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1trIA0-005ntK-FS@rmk-PC.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Mar 2025 13:20:02 +0000
X-Gm-Features: AQ5f1JrO_7vudADXigeeN9yXWooM4iHlgYUlKMy4_xyai_AoXvej3y5kzsc7Vh0
Message-ID: <CA+V-a8sCxs4MFZgo0q=0HmpyWXk7hYSGq0awm2YuAFZk+x6BEA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/7] net: stmmac: allow platforms to use PHY tx
 clock stop capability
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, 
	netdev@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_062031_111127_EA75380B 
X-CRM114-Status: GOOD (  19.56  )
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

T24gU3VuLCBNYXIgOSwgMjAyNSBhdCAzOjAy4oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBBbGxvdyBwbGF0Zm9ybSBnbHVl
IHRvIGluc3RydWN0IHN0bW1hYyB0byBtYWtlIHVzZSBvZiB0aGUgUEhZIHRyYW5zbWl0Cj4gY2xv
Y2sgc3RvcCBjYXBhYmlsaXR5IHdoZW4gZGVjaWRpbmcgd2hldGhlciB0byBhbGxvdyB0aGUgdHJh
bnNtaXQgY2xvY2sKPiBmcm9tIHRoZSBEV01BQyBjb3JlIHRvIGJlIHN0b3BwZWQuCj4KPiBDYzog
IkxhZCwgUHJhYmhha2FyIiA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4K
PiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmggICAg
IHwgIDEgKwo+ICAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMg
ICAgfCAxNiArKysrKysrKysrKystLS0tCj4gIGluY2x1ZGUvbGludXgvc3RtbWFjLmggICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAzICsrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHBy
YWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KCkNoZWVycywKUHJhYmhha2Fy
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWMuaCBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hYy5oCj4gaW5k
ZXggZDg3Mjc1YzFjZjIzLi5iZGRmYTBmNGFhMjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmgKPiArKysgYi9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWMuaAo+IEBAIC0zMDYsNiArMzA2LDcgQEAgc3RydWN0
IHN0bW1hY19wcml2IHsKPiAgICAgICAgIHN0cnVjdCB0aW1lcl9saXN0IGVlZV9jdHJsX3RpbWVy
Owo+ICAgICAgICAgaW50IGxwaV9pcnE7Cj4gICAgICAgICB1MzIgdHhfbHBpX3RpbWVyOwo+ICsg
ICAgICAgYm9vbCB0eF9scGlfY2xrX3N0b3A7Cj4gICAgICAgICBib29sIGVlZV9lbmFibGVkOwo+
ICAgICAgICAgYm9vbCBlZWVfYWN0aXZlOwo+ICAgICAgICAgYm9vbCBlZWVfc3dfdGltZXJfZW47
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFp
bi5jCj4gaW5kZXggZmExZDdkM2EyZjQzLi42ZjI5ODA0MTQ4YjYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ICsrKyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiBAQCAtNDU3
LDggKzQ1Nyw3IEBAIHN0YXRpYyB2b2lkIHN0bW1hY190cnlfdG9fc3RhcnRfc3dfbHBpKHN0cnVj
dCBzdG1tYWNfcHJpdiAqcHJpdikKPiAgICAgICAgIC8qIENoZWNrIGFuZCBlbnRlciBpbiBMUEkg
bW9kZSAqLwo+ICAgICAgICAgaWYgKCFwcml2LT50eF9wYXRoX2luX2xwaV9tb2RlKQo+ICAgICAg
ICAgICAgICAgICBzdG1tYWNfc2V0X2xwaV9tb2RlKHByaXYsIHByaXYtPmh3LCBTVE1NQUNfTFBJ
X0ZPUkNFRCwKPiAtICAgICAgICAgICAgICAgICAgICAgICBwcml2LT5wbGF0LT5mbGFncyAmIFNU
TU1BQ19GTEFHX0VOX1RYX0xQSV9DTE9DS0dBVElORywKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAwKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcml2LT50eF9scGlf
Y2xrX3N0b3AsIDApOwo+ICB9Cj4KPiAgLyoqCj4gQEAgLTExMDQsMTMgKzExMDMsMTggQEAgc3Rh
dGljIGludCBzdG1tYWNfbWFjX2VuYWJsZV90eF9scGkoc3RydWN0IHBoeWxpbmtfY29uZmlnICpj
b25maWcsIHUzMiB0aW1lciwKPgo+ICAgICAgICAgcHJpdi0+ZWVlX2VuYWJsZWQgPSB0cnVlOwo+
Cj4gKyAgICAgICAvKiBVcGRhdGUgdGhlIHRyYW5zbWl0IGNsb2NrIHN0b3AgYWNjb3JkaW5nIHRv
IFBIWSBjYXBhYmlsaXR5IGlmCj4gKyAgICAgICAgKiB0aGUgcGxhdGZvcm0gYWxsb3dzCj4gKyAg
ICAgICAgKi8KPiArICAgICAgIGlmIChwcml2LT5wbGF0LT5mbGFncyAmIFNUTU1BQ19GTEFHX0VO
X1RYX0xQSV9DTEtfUEhZX0NBUCkKPiArICAgICAgICAgICAgICAgcHJpdi0+dHhfbHBpX2Nsa19z
dG9wID0gdHhfY2xrX3N0b3A7Cj4gKwo+ICAgICAgICAgc3RtbWFjX3NldF9lZWVfdGltZXIocHJp
diwgcHJpdi0+aHcsIFNUTU1BQ19ERUZBVUxUX0xJVF9MUywKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFNUTU1BQ19ERUZBVUxUX1RXVF9MUyk7Cj4KPiAgICAgICAgIC8qIFRyeSB0byBj
bmZpZ3VyZSB0aGUgaGFyZHdhcmUgdGltZXIuICovCj4gICAgICAgICByZXQgPSBzdG1tYWNfc2V0
X2xwaV9tb2RlKHByaXYsIHByaXYtPmh3LCBTVE1NQUNfTFBJX1RJTUVSLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwcml2LT5wbGF0LT5mbGFncyAmIFNUTU1BQ19GTEFHX0VO
X1RYX0xQSV9DTE9DS0dBVElORywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cHJpdi0+dHhfbHBpX3RpbWVyKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cHJpdi0+dHhfbHBpX2Nsa19zdG9wLCBwcml2LT50eF9scGlfdGltZXIpOwo+Cj4gICAgICAgICBp
ZiAocmV0KSB7Cj4gICAgICAgICAgICAgICAgIC8qIEhhcmR3YXJlIHRpbWVyIG1vZGUgbm90IHN1
cHBvcnRlZCwgb3IgdmFsdWUgb3V0IG9mIHJhbmdlLgo+IEBAIC0xMjY5LDYgKzEyNzMsMTAgQEAg
c3RhdGljIGludCBzdG1tYWNfcGh5X3NldHVwKHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdikKPiAg
ICAgICAgIGlmICghKHByaXYtPnBsYXQtPmZsYWdzICYgU1RNTUFDX0ZMQUdfUlhfQ0xLX1JVTlNf
SU5fTFBJKSkKPiAgICAgICAgICAgICAgICAgcHJpdi0+cGh5bGlua19jb25maWcuZWVlX3J4X2Ns
a19zdG9wX2VuYWJsZSA9IHRydWU7Cj4KPiArICAgICAgIC8qIFNldCB0aGUgZGVmYXVsdCB0cmFu
c21pdCBjbG9jayBzdG9wIGJpdCBiYXNlZCBvbiB0aGUgcGxhdGZvcm0gZ2x1ZSAqLwo+ICsgICAg
ICAgcHJpdi0+dHhfbHBpX2Nsa19zdG9wID0gcHJpdi0+cGxhdC0+ZmxhZ3MgJgo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgU1RNTUFDX0ZMQUdfRU5fVFhfTFBJX0NMT0NLR0FUSU5H
Owo+ICsKPiAgICAgICAgIG1kaW9fYnVzX2RhdGEgPSBwcml2LT5wbGF0LT5tZGlvX2J1c19kYXRh
Owo+ICAgICAgICAgaWYgKG1kaW9fYnVzX2RhdGEpCj4gICAgICAgICAgICAgICAgIHByaXYtPnBo
eWxpbmtfY29uZmlnLmRlZmF1bHRfYW5faW5iYW5kID0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9zdG1tYWMuaCBiL2luY2x1ZGUvbGludXgvc3RtbWFjLmgKPiBpbmRleCBiNmYwM2FiMTI1
OTUuLmM0ZWM4YmI4MTQ0ZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3N0bW1hYy5oCj4g
KysrIGIvaW5jbHVkZS9saW51eC9zdG1tYWMuaAo+IEBAIC0xODMsNyArMTgzLDggQEAgc3RydWN0
IGR3bWFjNF9hZGRycyB7Cj4gICNkZWZpbmUgU1RNTUFDX0ZMQUdfSU5UX1NOQVBTSE9UX0VOICAg
ICAgICAgICAgQklUKDkpCj4gICNkZWZpbmUgU1RNTUFDX0ZMQUdfUlhfQ0xLX1JVTlNfSU5fTFBJ
ICAgICAgICAgQklUKDEwKQo+ICAjZGVmaW5lIFNUTU1BQ19GTEFHX0VOX1RYX0xQSV9DTE9DS0dB
VElORyAgICAgIEJJVCgxMSkKPiAtI2RlZmluZSBTVE1NQUNfRkxBR19IV1RTVEFNUF9DT1JSRUNU
X0xBVEVOQ1kgICBCSVQoMTIpCj4gKyNkZWZpbmUgU1RNTUFDX0ZMQUdfRU5fVFhfTFBJX0NMS19Q
SFlfQ0FQICAgICAgQklUKDEyKQo+ICsjZGVmaW5lIFNUTU1BQ19GTEFHX0hXVFNUQU1QX0NPUlJF
Q1RfTEFURU5DWSAgIEJJVCgxMykKPgo+ICBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgewo+
ICAgICAgICAgaW50IGJ1c19pZDsKPiAtLQo+IDIuMzAuMgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
