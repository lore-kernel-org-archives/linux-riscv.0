Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CD2EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvJKExsl9tORS5qO+cBtoExWA3xsbWqwnlhGD4hQ0vs=; b=bnQOwwvAW+VFf/
	31fXZ47rMeX6gbTwQw98itvemSST6QHBv777YeE18LQJAV0b1V5+aPFgzWqbm6BC92ntbLbImWh/I
	M1mUhfwXxdlYcN0ZoGbMeXdCEIZPBY8hGgtSiuYStumIV1e11LS7nqjJgsC8qzOSgfdcwUFX94L2d
	u9kIwzKz2CC13ZW9jnyONdBN20gPm/2oFC+kxWrz8mVnTK4wCRzRXYDf3HMLWvrdIoUi+h+/4WiaG
	2lqhG0gzoPYHOnvZ4dMXtu9qKYSlHLMmLGmL82Xdfs0aK7Ar/1DJc7tm3X3bYgZdHC5sWvGbfUZbX
	2Vp3rBuZ4Hj4ZxNcTyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0nR-002R9I-1h;
	Thu, 29 Jun 2023 23:11:29 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0nO-002R8H-1a
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:11:27 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f86e6e4038so1557442e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 16:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688080284; x=1690672284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKu76E7WcQ6JEkoMWbqzICZoGJiCZ/5zG7ZivKkv2PY=;
        b=z/ogiVgMw+ng4EM8Tb5Gmyjq2vlH7AsBq87THvi3aEBY0BVh2jDdrPXv9QwTN9zJ8X
         KeC8mHA0aYGM4LJ5YnLjUjcWunDy6LVIcGCuR1iJCRwAI8xoGI3ND030p/q0AnpEOx3d
         mZkRuTap3Ke6uQ+cBAnsB++1uKreHSAqud+A5qSpD4gLX5KEpYTVYeQY/v4WqW2lYln4
         +cGbJAv/LCelvlGB6luAyu/TT6LBiRWSDSLmDQqWpj+SHgU5YaXj9cQUY6DZY0CjcRNQ
         l6oBWj9B454JRE11rp7YrM3+SgD5GyYzs4FiJPCKN34RpZpoa4ycw8H5YVninP7pKbhk
         beXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688080284; x=1690672284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKu76E7WcQ6JEkoMWbqzICZoGJiCZ/5zG7ZivKkv2PY=;
        b=Pb9xUbcHn12ahisRWGig9aMZZzkcgbPNBSCarCLkdcuOKCoMXALq9TrOc14gp9au83
         JCILupa6Eo4X9Qsv+PL7Q91RhZ71yQ60j4j4x5J9lV/VL3t8j+7p5UBf1dBFPV9G2N2Y
         Rg7UmMAx3PSkxrZtHwK3nZ6q5Nyps6hXAbP2xh1rGnChMMDObtEtPfpnAbAX79x6YvGo
         JawXfsZ2ofP0Gge0szeEsk8+qOuEqo04qDJ2O1vYRF3ZXMpoLxj0TJr7Z2eImH41v9x7
         t0TeFroTkNaIIQRGaYiIdJgrj+Cm4G7CTIM3DvYnU2Olto6DnzIq9aOgjNb37HzPtKso
         EK4Q==
X-Gm-Message-State: AC+VfDzuE83HGULypKsWkOSKEkpP+9n5Dw6++XeFXOn003J4hgMv8O5J
	eohOubTt0R3lJ9JnLHEFRBu66h8OzeX6zSinvxj/gQ==
X-Google-Smtp-Source: ACHHUZ7n+73cSq6w39b5phHcFSgfR/+91iV3RuorlsfjFzts0A+c3W+Wv8vvXQHZoVeynzbbgrKFIdjPJnqy8lyNQ9Y=
X-Received: by 2002:a05:6512:2352:b0:4f4:b10f:d521 with SMTP id
 p18-20020a056512235200b004f4b10fd521mr1890759lfu.13.1688080284039; Thu, 29
 Jun 2023 16:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy> <20230629-fruit-syndrome-74e32af9c8ad@wendy>
In-Reply-To: <20230629-fruit-syndrome-74e32af9c8ad@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 29 Jun 2023 16:10:48 -0700
Message-ID: <CALs-HstMTxJFHEoSCaAUtYzT+a-2RSYAhWMQmkVw2+WE=y0agQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] RISC-V: don't parse dt/acpi isa string to get rv32/rv64
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_161126_529349_A3B5DF46 
X-CRM114-Status: GOOD (  22.58  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMToyOeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtv
LnN0dWVibmVyQHZydWxsLmV1Pgo+Cj4gV2hlbiBmaWxsaW5nIGh3Y2FwIHRoZSBrZXJuZWwgYWxy
ZWFkeSBleHBlY3RzIHRoZSBpc2Egc3RyaW5nIHRvIHN0YXJ0IHdpdGgKPiBydjMyIGlmIENPTkZJ
R18zMkJJVCBhbmQgcnY2NCBpZiBDT05GSUdfNjRCSVQuCj4KPiBTbyB3aGVuIHJlY3JlYXRpbmcg
dGhlIHJ1bnRpbWUgaXNhLXN0cmluZyB3ZSBjYW4gYWxzbyBqdXN0IGdvIHRoZSBvdGhlciB3YXkK
PiB0byBnZXQgdGhlIGNvcnJlY3Qgc3RhcnRpbmcgcG9pbnQgZm9yIGl0Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxsLmV1Pgo+IFJldmlld2Vk
LWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IENvLWRldmVsb3Bl
ZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+
IENoYW5nZXMgaW4gdjI6Cj4gLSBEZWxldGUgdGhlIHdob2xlIGVsc2UgJiBwdWxsIHByaW50X21t
dSgpIGFib3ZlIGl0LCBzaW5jZSB0aGF0J3MgY29tbW9uCj4gICBjb2RlIG5vdwo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyB8IDIxICsrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4g
aW5kZXggYTJmYzk1MjMxOGU5Li4yZmI1ZThlMWRmNTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvY3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+IEBAIC0yNTMs
MTMgKzI1MywxNiBAQCBzdGF0aWMgdm9pZCBwcmludF9pc2FfZXh0KHN0cnVjdCBzZXFfZmlsZSAq
ZikKPiAgICovCj4gIHN0YXRpYyBjb25zdCBjaGFyIGJhc2VfcmlzY3ZfZXh0c1sxM10gPSAiaW1h
ZmRxY2JranB2aCI7Cj4KPiAtc3RhdGljIHZvaWQgcHJpbnRfaXNhKHN0cnVjdCBzZXFfZmlsZSAq
ZiwgY29uc3QgY2hhciAqaXNhKQo+ICtzdGF0aWMgdm9pZCBwcmludF9pc2Eoc3RydWN0IHNlcV9m
aWxlICpmKQo+ICB7Cj4gICAgICAgICBpbnQgaTsKPgo+ICAgICAgICAgc2VxX3B1dHMoZiwgImlz
YVx0XHQ6ICIpOwo+IC0gICAgICAgLyogUHJpbnQgdGhlIHJ2WzY0LzMyXSBwYXJ0ICovCj4gLSAg
ICAgICBzZXFfd3JpdGUoZiwgaXNhLCA0KTsKPiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJ
R18zMkJJVCkpCj4gKyAgICAgICAgICAgICAgIHNlcV93cml0ZShmLCAicnYzMiIsIDQpOwo+ICsg
ICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBzZXFfd3JpdGUoZiwgInJ2NjQiLCA0KTsKPiAr
Cj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgc2l6ZW9mKGJhc2VfcmlzY3ZfZXh0cyk7IGkrKykg
ewo+ICAgICAgICAgICAgICAgICBpZiAoX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShO
VUxMLCBiYXNlX3Jpc2N2X2V4dHNbaV0gLSAnYScpKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IC8qIFByaW50IG9ubHkgZW5hYmxlZCB0aGUgYmFzZSBJU0EgZXh0ZW5zaW9ucyAqLwo+IEBAIC0z
MTYsMjcgKzMxOSwyMSBAQCBzdGF0aWMgaW50IGNfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZv
aWQgKnYpCj4gICAgICAgICB1bnNpZ25lZCBsb25nIGNwdV9pZCA9ICh1bnNpZ25lZCBsb25nKXYg
LSAxOwo+ICAgICAgICAgc3RydWN0IHJpc2N2X2NwdWluZm8gKmNpID0gcGVyX2NwdV9wdHIoJnJp
c2N2X2NwdWluZm8sIGNwdV9pZCk7Cj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7
Cj4gLSAgICAgICBjb25zdCBjaGFyICpjb21wYXQsICppc2E7Cj4gKyAgICAgICBjb25zdCBjaGFy
ICpjb21wYXQ7Cj4KPiAgICAgICAgIHNlcV9wcmludGYobSwgInByb2Nlc3Nvclx0OiAlbHVcbiIs
IGNwdV9pZCk7Cj4gICAgICAgICBzZXFfcHJpbnRmKG0sICJoYXJ0XHRcdDogJWx1XG4iLCBjcHVp
ZF90b19oYXJ0aWRfbWFwKGNwdV9pZCkpOwo+ICsgICAgICAgcHJpbnRfaXNhKG0pOwo+ICsgICAg
ICAgICAgICAgICBwcmludF9tbXUobSk7CgpEaWQgdGhlIGluZGVudCBnZXQgd29ua3kgaGVyZSBv
ciBhbSBJIGp1c3Qgc2VlaW5nIGl0IHdyb25nIGJlY2F1c2UgZ21haWw/Ck90aGVyd2lzZToKClJl
dmlld2VkLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KCj4KPiAgICAgICAgIGlm
IChhY3BpX2Rpc2FibGVkKSB7Cj4gICAgICAgICAgICAgICAgIG5vZGUgPSBvZl9nZXRfY3B1X25v
ZGUoY3B1X2lkLCBOVUxMKTsKPiAtICAgICAgICAgICAgICAgaWYgKCFvZl9wcm9wZXJ0eV9yZWFk
X3N0cmluZyhub2RlLCAicmlzY3YsaXNhIiwgJmlzYSkpCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcHJpbnRfaXNhKG0sIGlzYSk7Cj4KPiAtICAgICAgICAgICAgICAgcHJpbnRfbW11KG0pOwo+
ICAgICAgICAgICAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKG5vZGUsICJjb21w
YXRpYmxlIiwgJmNvbXBhdCkgJiYKPiAgICAgICAgICAgICAgICAgICAgIHN0cmNtcChjb21wYXQs
ICJyaXNjdiIpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNlcV9wcmludGYobSwgInVhcmNo
XHRcdDogJXNcbiIsIGNvbXBhdCk7Cj4KPiAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQobm9k
ZSk7Cj4gLSAgICAgICB9IGVsc2Ugewo+IC0gICAgICAgICAgICAgICBpZiAoIWFjcGlfZ2V0X3Jp
c2N2X2lzYShOVUxMLCBjcHVfaWQsICZpc2EpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBy
aW50X2lzYShtLCBpc2EpOwo+IC0KPiAtICAgICAgICAgICAgICAgcHJpbnRfbW11KG0pOwo+ICAg
ICAgICAgfQo+Cj4gICAgICAgICBzZXFfcHJpbnRmKG0sICJtdmVuZG9yaWRcdDogMHglbHhcbiIs
IGNpLT5tdmVuZG9yaWQpOwo+IC0tCj4gMi40MC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
