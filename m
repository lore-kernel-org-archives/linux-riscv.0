Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E6FC77B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 10:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZnZV6mRnhs15sWEPt9xB4uiSoQmYCUa2bvnPTJXR2Y=; b=u34zKAflMPZ86d
	6U9ieB214GM42SlOB/LDtQji3Q4R/pC5FHBOVWT15RVBh0WZWzojfdjHQGSSa4xsczMJbmocvs2lD
	ZXu8W4Do3OxC1V8+ZGvz6yfNwC7Fc3J1u6y8M0SySylxuZqbn7I9PZ2o10m3CLI4tllqVDpps9LAm
	sQ9T0Bx8J467OznWKBid6H2NpX43eJeB1bc8gCZCqlYs9bqEisMdh9pJhiqtj5LRFNnqIUsXOjk0/
	gSvWxU/Qjis6v3VxPKZEtYn5y2/EjeUEPn6VHDn89SDsJIfXZwLxX2Xhdgr6vGyJqyQt2Ph6NQuOC
	9jD++Pg97S6jYr9o2NtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXYD-002cpj-0x;
	Wed, 12 Apr 2023 10:18:05 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXYA-002ckx-0R
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 10:18:03 +0000
Received: by mail-ej1-x62e.google.com with SMTP id q23so17986509ejz.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Apr 2023 03:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681294678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcDUlmxRY10X0YHmhy/Fi+Rk8z1h3TiNmSt5ErLw9W4=;
        b=DGfPyUoDRTIQzp1lmPfZIF7Ok/pIl6tEBRG4Fz9fac09VFqNNEQFoztcxaUPunqdA0
         iujWFxf9VBvUzff6T33wh6G7mrq3dZK54zcmaUMm5Oegj2OzfQSQpEinN2TLVu/3mOwY
         TFQzRTk5YZ7kGXA6lYAG3D19pmHk/AabQrtra3tb5zlEDq0X8LeQV1u3x27KzokkTwra
         XM0le3PAkgp7p8vbVMQmK/WhMDNCCAyd6rCQ20dso1NT0TPtmAucC43ilWNXMfyz+4I8
         k6C48JpiFfJN9SG57JzH2O5iRRvx/HqqCcNFUnN2qjxgIuVjMZaOWYxbURmrBRjTQ8lw
         vczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681294678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcDUlmxRY10X0YHmhy/Fi+Rk8z1h3TiNmSt5ErLw9W4=;
        b=MH1CRzOxBkw7GCJTOsqaUS8AwkWSgiTEtrhtQvF5eI0eyG6nrQPe68lWNVem7F/wG+
         ZJZHexI18Hovtteafgs0Rl9LulPwLvIunBf6lJppX75QN/qiXVlN97MqkY8SwPm5zH9e
         CqnPDSKk8j7LfDr7FikT82yDIDgTyjViZp/wlq2M/bPAuNzmVpBAJQ4eLLaBPJE4G5DI
         FX6+Y3L4YCzW6m29YGT7B+V6SjE6FbT+utiLWLKx4HOF5kLAsJeG7+EGHs5OpH2I/DST
         bkY3iojkoR77VWqrcQXGdiPeteDxZ6lXofX3o5WTN/r7eSYCKIRZg7hjlLNP4Gq6mPEb
         yaRA==
X-Gm-Message-State: AAQBX9e4HVuYb6NzO8nzw1UxLOEiIUbgsquLhO+Na9AC/T2TN9SAYvAD
	Z2GsWqvVsr9ijculwDLSF6qJHKs4WjP1DJkUg9c=
X-Google-Smtp-Source: AKy350a/P8S0sd/XT625mO06xi/NHGq3G+kmgZqDIKpER/L+xgfhmjOBoRRCob3Y7jllm2lR+6dyFPfl1+c481gx7Hw=
X-Received: by 2002:a17:906:9f0c:b0:949:87e1:5b32 with SMTP id
 fy12-20020a1709069f0c00b0094987e15b32mr2986699ejc.9.1681294677803; Wed, 12
 Apr 2023 03:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230406111142.74410-1-minda.chen@starfivetech.com> <20230406111142.74410-2-minda.chen@starfivetech.com>
In-Reply-To: <20230406111142.74410-2-minda.chen@starfivetech.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 12 Apr 2023 18:17:46 +0800
Message-ID: <CAEUhbmVC6cx78G=-3FON8=B2rFOn4aU5z58gxeVY4t_U6k7eOA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-binding: pci: add JH7110 PCIe dt-binding documents.
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_031802_174564_97EB823C 
X-CRM114-Status: GOOD (  17.89  )
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

T24gVGh1LCBBcHIgNiwgMjAyMyBhdCA3OjU54oCvUE0gTWluZGEgQ2hlbiA8bWluZGEuY2hlbkBz
dGFyZml2ZXRlY2guY29tPiB3cm90ZToKPgo+IEFkZCBQQ0llIGNvbnRyb2xsZXIgZHJpdmVyIGR0
LWJpbmRpbmcgZG9jdW1lbnRzCj4gZm9yIFN0YXJGaXZlIEpINzExMCBTb0MgcGxhdGZvcm0uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNaW5kYSBDaGVuIDxtaW5kYS5jaGVuQHN0YXJmaXZldGVjaC5jb20+
Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9wY2kvc3RhcmZpdmUsamg3MTEwLXBjaWUueWFtbCAgICB8
IDE2MyArKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE2MyBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGNpL3N0YXJmaXZlLGpoNzExMC1wY2llLnlhbWwKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3N0YXJmaXZlLGpoNzExMC1wY2llLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3N0YXJmaXZlLGpoNzExMC1w
Y2llLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZmE0
ODI5NzY2MTk1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wY2kvc3RhcmZpdmUsamg3MTEwLXBjaWUueWFtbAo+IEBAIC0wLDAgKzEsMTYz
IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvcGNpL3N0YXJmaXZlLGpoNzExMC1wY2llLnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IFN0
YXJGaXZlIEpINzExMCBQQ0llIDIuMCBob3N0IGNvbnRyb2xsZXIKPiArCj4gK21haW50YWluZXJz
Ogo+ICsgIC0gTWluZGEgQ2hlbiA8bWluZGEuY2hlbkBzdGFyZml2ZXRlY2guY29tPgo+ICsKPiAr
YWxsT2Y6Cj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9wY2kvcGNpLWJ1cy55YW1sIwo+ICsgIC0gJHJl
ZjogL3NjaGVtYXMvaW50ZXJydXB0LWNvbnRyb2xsZXIvbXNpLWNvbnRyb2xsZXIueWFtbCMKPiAr
Cj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiBzdGFyZml2ZSxq
aDcxMTAtcGNpZQoKU2luY2UgdGhpcyBpcyBhIFBMREEgSVAgdGhhdCBpcyBsaWtlbHkgdG8gYmUg
cmV1c2VkIGJ5IG90aGVyIHZlbmRvcnMsCnNob3VsZCB0aGlzIGluZGljYXRlIHRoZSBQTERBIGlu
IHRoZSBzdHJpbmc/CgpPciB0aGUgZmlsZSBuYW1lIHNob3VsZCBiZSByZW5hbWVkIHRvIHNvbWV0
aGluZyBsaWtlIHRoZSBzeW5vcHNpcyBkdy1wY2llPwoKPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4
SXRlbXM6IDIKPiArCj4gKyAgcmVnLW5hbWVzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gY29u
c3Q6IHJlZwo+ICsgICAgICAtIGNvbnN0OiBjb25maWcKPiArCj4gKyAgbXNpLXBhcmVudDogdHJ1
ZQo+ICsKPiArICBpbnRlcnJ1cHRzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgY2xvY2tz
Ogo+ICsgICAgbWF4SXRlbXM6IDQKPiArCj4gKyAgY2xvY2stbmFtZXM6Cj4gKyAgICBpdGVtczoK
PiArICAgICAgLSBjb25zdDogbm9jCj4gKyAgICAgIC0gY29uc3Q6IHRsCj4gKyAgICAgIC0gY29u
c3Q6IGF4aV9tc3QwCj4gKyAgICAgIC0gY29uc3Q6IGFwYgo+ICsKPiArICByZXNldHM6Cj4gKyAg
ICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlvbjogQVhJIE1TVDAgcmVzZXQKPiArICAgICAg
LSBkZXNjcmlwdGlvbjogQVhJIFNMQVZFIHJlc2V0Cj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEFY
SSBTTEFWRTAgcmVzZXQKPiArICAgICAgLSBkZXNjcmlwdGlvbjogUENJRSBCUklER0UgcmVzZXQK
PiArICAgICAgLSBkZXNjcmlwdGlvbjogUENJRSBDT1JFIHJlc2V0Cj4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IFBDSUUgQVBCIHJlc2V0Cj4gKwo+ICsgIHJlc2V0LW5hbWVzOgo+ICsgICAgaXRlbXM6
Cj4gKyAgICAgIC0gY29uc3Q6IG1zdDAKPiArICAgICAgLSBjb25zdDogc2x2MAo+ICsgICAgICAt
IGNvbnN0OiBzbHYKPiArICAgICAgLSBjb25zdDogYnJnCj4gKyAgICAgIC0gY29uc3Q6IGNvcmUK
PiArICAgICAgLSBjb25zdDogYXBiCj4gKwo+ICsgIHN0YXJmaXZlLHN0Zy1zeXNjb246Cj4gKyAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5Cj4g
KyAgICBpdGVtczoKPiArICAgICAgaXRlbXM6Cj4gKyAgICAgICAgLSBkZXNjcmlwdGlvbjogcGhh
bmRsZSB0byBTeXN0ZW0gUmVnaXN0ZXIgQ29udHJvbGxlciBzdGdfc3lzY29uIG5vZGUuCj4gKyAg
ICAgICAgLSBkZXNjcmlwdGlvbjogcmVnaXN0ZXIwIG9mZnNldCBvZiBTVEdfU1lTQ09OU0FJRl9f
U1lTQ0ZHIHJlZ2lzdGVyIGZvciBQQ0llLgo+ICsgICAgICAgIC0gZGVzY3JpcHRpb246IHJlZ2lz
dGVyMSBvZmZzZXQgb2YgU1RHX1NZU0NPTlNBSUZfX1NZU0NGRyByZWdpc3RlciBmb3IgUENJZS4K
PiArICAgICAgICAtIGRlc2NyaXB0aW9uOiByZWdpc3RlcjIgb2Zmc2V0IG9mIFNUR19TWVNDT05T
QUlGX19TWVNDRkcgcmVnaXN0ZXIgZm9yIFBDSWUuCj4gKyAgICAgICAgLSBkZXNjcmlwdGlvbjog
cmVnaXN0ZXIzIG9mZnNldCBvZiBTVEdfU1lTQ09OU0FJRl9fU1lTQ0ZHIHJlZ2lzdGVyIGZvciBQ
Q0llLgo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgIFRoZSBwaGFuZGxlIHRvIFN5c3RlbSBS
ZWdpc3RlciBDb250cm9sbGVyIHN5c2NvbiBub2RlIGFuZCB0aGUgb2Zmc2V0Cj4gKyAgICAgIG9m
IFNUR19TWVNDT05TQUlGX19TWVNDRkcgcmVnaXN0ZXIgZm9yIFBDSWUuIFRvdGFsIDQgcmVnc2lz
dGVycyBvZmZzZXQKPiArICAgICAgZm9yIFBDSWUuCj4gKwo+ICsgIHB3cmVuLWdwaW9zOgo+ICsg
ICAgZGVzY3JpcHRpb246IFNob3VsZCBzcGVjaWZ5IHRoZSBHUElPIGZvciBjb250cm9sbGluZyB0
aGUgUENJIGJ1cyBkZXZpY2UgcG93ZXIgb24uCj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBy
ZXNldC1ncGlvczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIHBoeXM6Cj4gKyAgICBtYXhJ
dGVtczogMQo+ICsKPiArICBpbnRlcnJ1cHQtY29udHJvbGxlcjoKPiArICAgIHR5cGU6IG9iamVj
dAo+ICsgICAgcHJvcGVydGllczoKPiArICAgICAgJyNhZGRyZXNzLWNlbGxzJzoKPiArICAgICAg
ICBjb25zdDogMAo+ICsKPiArICAgICAgJyNpbnRlcnJ1cHQtY2VsbHMnOgo+ICsgICAgICAgIGNv
bnN0OiAxCj4gKwo+ICsgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjogdHJ1ZQo+ICsKPiArICAg
IHJlcXVpcmVkOgo+ICsgICAgICAtICcjYWRkcmVzcy1jZWxscycKPiArICAgICAgLSAnI2ludGVy
cnVwdC1jZWxscycKPiArICAgICAgLSBpbnRlcnJ1cHQtY29udHJvbGxlcgo+ICsKPiArICAgIGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSByZWcKPiAr
ICAtIHJlZy1uYW1lcwo+ICsgIC0gIiNpbnRlcnJ1cHQtY2VsbHMiCj4gKyAgLSBpbnRlcnJ1cHRz
Cj4gKyAgLSBpbnRlcnJ1cHQtbWFwLW1hc2sKPiArICAtIGludGVycnVwdC1tYXAKPiArICAtIGNs
b2Nrcwo+ICsgIC0gY2xvY2stbmFtZXMKPiArICAtIHJlc2V0cwo+ICsgIC0gbXNpLWNvbnRyb2xs
ZXIKPiArCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+
ICsgIC0gfAo+ICsgICAgYnVzIHsKPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiAr
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPiArCj4gKyAgICAgICAgcGNpZTA6IHBjaWVAMkIw
MDAwMDAgewo+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC1wY2ll
IjsKPiArICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mz47Cj4gKyAgICAgICAgICAgICNz
aXplLWNlbGxzID0gPDI+Owo+ICsgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDE+Owo+
ICsgICAgICAgICAgICByZWcgPSA8MHgwIDB4MkIwMDAwMDAgMHgwIDB4MTAwMDAwMD4sCj4gKyAg
ICAgICAgICAgICAgICAgIDwweDkgMHg0MDAwMDAwMCAweDAgMHgxMDAwMDAwMD47Cj4gKyAgICAg
ICAgICAgIHJlZy1uYW1lcyA9ICJyZWciLCAiY29uZmlnIjsKPiArICAgICAgICAgICAgZGV2aWNl
X3R5cGUgPSAicGNpIjsKPiArICAgICAgICAgICAgc3RhcmZpdmUsc3RnLXN5c2NvbiA9IDwmc3Rn
X3N5c2NvbiAweGMwIDB4YzQgMHgxMzAgMHgxYjg+Owo+ICsgICAgICAgICAgICBidXMtcmFuZ2Ug
PSA8MHgwIDB4ZmY+Owo+ICsgICAgICAgICAgICByYW5nZXMgPSA8MHg4MjAwMDAwMCAgMHgwIDB4
MzAwMDAwMDAgIDB4MCAweDMwMDAwMDAwIDB4MCAweDA4MDAwMDAwPiwKPiArICAgICAgICAgICAg
ICAgICAgICAgPDB4YzMwMDAwMDAgIDB4OSAweDAwMDAwMDAwICAweDkgMHgwMDAwMDAwMCAweDAg
MHg0MDAwMDAwMD47Cj4gKyAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+Owo+
ICsgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDU2PjsKPiArICAgICAgICAgICAgaW50ZXJydXB0
LW1hcC1tYXNrID0gPDB4MCAweDAgMHgwIDB4Nz47Cj4gKyAgICAgICAgICAgIGludGVycnVwdC1t
YXAgPSA8MHgwIDB4MCAweDAgMHgxICZwY2llX2ludGMwIDB4MT4sCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8MHgwIDB4MCAweDAgMHgyICZwY2llX2ludGMwIDB4Mj4sCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8MHgwIDB4MCAweDAgMHgzICZwY2llX2ludGMwIDB4Mz4s
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MHgwIDB4MCAweDAgMHg0ICZwY2llX2lu
dGMwIDB4ND47Cj4gKyAgICAgICAgICAgIG1zaS1wYXJlbnQgPSA8JnBjaWUwPjsKPiArICAgICAg
ICAgICAgbXNpLWNvbnRyb2xsZXI7Cj4gKyAgICAgICAgICAgIGNsb2NrcyA9IDwmc3lzY3JnIDg2
PiwKPiArICAgICAgICAgICAgICAgICAgICAgPCZzdGdjcmcgMTA+LAo+ICsgICAgICAgICAgICAg
ICAgICAgICA8JnN0Z2NyZyA4PiwKPiArICAgICAgICAgICAgICAgICAgICAgPCZzdGdjcmcgOT47
Cj4gKyAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gIm5vYyIsICJ0bCIsICJheGlfbXN0MCIsICJh
cGIiOwo+ICsgICAgICAgICAgICByZXNldHMgPSA8JnN0Z2NyZyAxMT4sCj4gKyAgICAgICAgICAg
ICAgICAgICAgIDwmc3RnY3JnIDEyPiwKPiArICAgICAgICAgICAgICAgICAgICAgPCZzdGdjcmcg
MTM+LAo+ICsgICAgICAgICAgICAgICAgICAgICA8JnN0Z2NyZyAxND4sCj4gKyAgICAgICAgICAg
ICAgICAgICAgIDwmc3RnY3JnIDE1PiwKPiArICAgICAgICAgICAgICAgICAgICAgPCZzdGdjcmcg
MTY+Owo+ICsKPiArICAgICAgICAgICAgcGNpZV9pbnRjMDogaW50ZXJydXB0LWNvbnRyb2xsZXIg
ewo+ICsgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MD47Cj4gKyAgICAgICAgICAg
ICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDE+Owo+ICsgICAgICAgICAgICAgICAgaW50ZXJydXB0
LWNvbnRyb2xsZXI7Cj4gKyAgICAgICAgICAgIH07Cj4gKyAgICAgICAgfTsKPiArICAgIH07Cj4g
LS0KClJlZ2FyZHMsCkJpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
