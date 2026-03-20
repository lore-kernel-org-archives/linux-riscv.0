Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFE21093199
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 09:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlCEgNFbgNyX2tukiZnR6PW1iUnZL0tezU2cGqd3D28=; b=Vk7DG8Na6Wfe6N
	Ch1SRTHBKcrSHLVR24XNbLuWkNLd2VMSfxj5J9L/m628qyiox2Dlo1dmKjOQ7bTDmXV4fiu6u34j0
	xE1rMBwGcRA5MkjVp6lXnXQZxE2hT3ZRl2YXGMTU0lH2Zt3VScqfKfT31M8ipHzvYX4it6R5FopwZ
	xFVIVhqJapmDnyEJW1Cjm+PfpKe/RiQizjINAHLQSsQKRVcCAxSiznCj7sw4tCVEdwjjeAgS/EMMK
	f8+YhW2mwX7E1RwN4JtAtdhAvnbCyfpnHocMfWRX1Mg0JZCei7nTF1kVqHNkvTR0Fo3bi00YgkYbw
	VGN7lbHmTpPURE74Y7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VzB-0000000CSA5-2uSk;
	Fri, 20 Mar 2026 09:17:41 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Vz9-0000000CS9S-3cVa
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 09:17:41 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-79801df3e42so24380617b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 02:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773998258; cv=none;
        d=google.com; s=arc-20240605;
        b=Nah1h2MFI0a/PE3sUZO68ky/fS9skQqDYpcl/UNib6aEfRTuauGEhvq+CVWMzhiKdC
         90rIo7vvyCAh8rSDPfDWrd4eayfY3BLRlxHhIpx+G5LSt3eSxlF7Z9VJ15IUw8eqvNkY
         jXOhJcGe/Yd78dJw+xDy3CynXeD/IkrNc9P+vwdfC5jLz3Gt4XhiZ2kml5e/NnIrpWjD
         9gvAc6eMcASNPty25jI8sM7XEuWCnHL3ElNwEOT1i4YbZz6LrserJwF6i+bWPo2VxS8C
         b8eOqFwoV1hV1cPN8kHRXoGVNeKUHgkY25JiRfYDQi5TPB6HkZ9tk+hVNiXya7ZBA8YQ
         U1Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dn1DESYfs8Y8xmtlvHAYp+0AU2JDUbwmb+m5abbzaxM=;
        fh=o6XENODRpGS/L8Z2/sGt3TK8DURsxPgLBMc+/VnS7NY=;
        b=ZPATMh2ApHmCe7C8MpMBLyu6OPj7kUXk0SJfCdf6kfd8oEr/wO/r+X84IZ97xPoaDn
         HpmnVWnPcsroUSV7TMbA4YN//RByrYuH1/kmEIKZLWOyNbKjjTmr2U5+vNEn0gwCbIjI
         RYcczs0zT00TZNtPPB/WXNIcehFJHXHRx6JDy6e4A69jnsV0ycI8QHxFLFLbXT/CdbTz
         jdxemR54CM0Wq1ESvg5oXjPP/hyuWcjoNPkVly0PRNg43ty7WGVYo73BvvPkGoB/kr2+
         A5sIj3CdC1N3hu4NyMj8QsxP7hz2mDFKrkfqan//yviUlHlfX/2CtzHKryx/ntPTb1DX
         FaqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773998258; x=1774603058; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn1DESYfs8Y8xmtlvHAYp+0AU2JDUbwmb+m5abbzaxM=;
        b=Y0asaLTRzqQxwB/N3IXvjB4UIj0syZYYsAv00sg7ysgINDF/LsI6IRPjM5tR8hbZsl
         7iefX9uAHOiV0dAeJgRaP3/Lzb5uhRlV6mXaTpRt0qHGwbv+coOY/vJUF54+I7CYLTnN
         FEpenx2e7Pr1I7fQuRuFlEWz/jsmC2OWtQv61AA7BEuKMEFsFbkwZHsS75Y2ls7B1xe1
         WZPro/Yil2TEMX0tQ8AkvhwE4I8KNmQMzmi4+2lDYJBIaOAOGUDNIjDQcJy9d2QtnOA0
         CG440IhsUz+ySCTTTIYBh8UCy5h1d/ZMHf2hcQs4tWdbsVFMMTcSl6YQq0EZIpPWfrMd
         XGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773998258; x=1774603058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dn1DESYfs8Y8xmtlvHAYp+0AU2JDUbwmb+m5abbzaxM=;
        b=WrEJhbF4kIOIY/tvpMQVcGsum2KCRmF9xr3Q/tSLCFHi/uxfZg3vAKYmL0xodyNJg3
         Jb9gvYufyxNzp5tC5kpi9C/iT9uS2zTVMi3BBl9J8f2ubL4AkCDzky41a2xexNIV5iwQ
         p6TzMtfX/nG31Fc/m+FJEhp15s70LjzlkWMI3VjuFoAMUvtfwshV03wrK673/ULO51VG
         vyTTOgrVXwjxCVetqgUm5KyGgVbWdB4LDvN9a2tidSm3WfsiLo4XKHdHIdRG6r8/xvql
         iacqZ8AdEL1n9mrp7TaI7dbj6GoY5BmZM5od+OiqVozrOBfo4WpX+sIPJgGy+eFx1xKs
         md7A==
X-Forwarded-Encrypted: i=1; AJvYcCX2Sj5MxMP+dStDSYxUF2wZeD5guV77eODw+PPyUy+rdDMtzfaPh46kTTv5opLFnCKQLkOxNrDgySyNoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7bi/dVJWgQjmTVPrTlejxQseYR6/NXbpSsyqY5g/QbbQfcuMZ
	b9RtzS1KGp1hTr5f2jMU8n1sJIql9unQQ0tWxx4hLV4jsHyL7ixkcJKlHk3Y5U1LGms6SBdfrEO
	CHXR9RUiPHPmAIU4KPnfn991TE4byybw=
X-Gm-Gg: ATEYQzyARnRCrK9/Ah4arlJj1GwphOT05AL+CneiF1vrnm12f3SgisTD9k46QojrfLE
	ZyKywhmaOv+2N4wLcFRHUnPuS1uV5mRVElebYnaPTvgurQI/XE70/ckZBSkO8alUgHfKKnfkBZa
	cWpEmryIWFBq+OCymTFHXFjpdews+JQOLOZoE6+nYnBHnq2sRqzbAcAtNT3x752HWMEMmz43Vst
	+N4iDxmXNJLMP/46+y+Kau2u1EIOY30EO4iYMLtIIwZUH/UVfNwc8OF9iDYb8wxcS17lVswJnXB
	YelkpWI=
X-Received: by 2002:a05:690c:498f:b0:79a:43b1:1170 with SMTP id
 00721157ae682-79a81ad7827mr68711887b3.15.1773998258113; Fri, 20 Mar 2026
 02:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
 <20260316-orangepi-sd-card-uhs-v3-2-aefd3b7832df@gmail.com> <182321ef-f01e-4bc8-8f23-aa85b4c70860@intel.com>
In-Reply-To: <182321ef-f01e-4bc8-8f23-aa85b4c70860@intel.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 20 Mar 2026 10:17:27 +0100
X-Gm-Features: AaiRm53XBGo7zx5aFlI-GEzkiEKn7jV5Xqx3ftctiokZuyCP--kGRAQhny3pbvQ
Message-ID: <CABdCQ=ODJyeC4Lb_XFxHaxQpem0F3v=tw+5CipCHFU8T5zr8Ww@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] mmc: sdhci-of-k1: add regulator and pinctrl
 voltage switching support
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_021739_919135_9E1534D1 
X-CRM114-Status: GOOD (  26.64  )
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

RWwgbWFyLCAxNyBtYXIgMjAyNiBhIGxhcyAxMjoyOCwgQWRyaWFuIEh1bnRlcgooPGFkcmlhbi5o
dW50ZXJAaW50ZWwuY29tPikgZXNjcmliacOzOgo+Cj4gT24gMTYvMDMvMjAyNiAxNjowMywgSWtl
ciBQZWRyb3NhIHdyb3RlOgo+ID4gQWRkIHZvbHRhZ2Ugc3dpdGNoaW5nIGluZnJhc3RydWN0dXJl
IGZvciBVSFMtSSBtb2RlcyBieSBpbnRlZ3JhdGluZyBib3RoCj4gPiByZWd1bGF0b3IgZnJhbWV3
b3JrIChmb3Igc3VwcGx5IHZvbHRhZ2UgY29udHJvbCkgYW5kIHBpbmN0cmwgc3RhdGUKPiA+IHN3
aXRjaGluZyAoZm9yIHBpbiBkcml2ZSBzdHJlbmd0aCBvcHRpbWl6YXRpb24pLgo+ID4KPiA+IC0g
QWRkIHJlZ3VsYXRvciBzdXBwbHkgcGFyc2luZyBhbmQgdm9sdGFnZSBzd2l0Y2hpbmcgY2FsbGJh
Y2sKPiA+IC0gQWRkIG9wdGlvbmFsIHBpbmN0cmwgc3RhdGUgc3dpdGNoaW5nIGJldHdlZW4gImRl
ZmF1bHQiICgzLjNWKSBhbmQKPiA+ICAgInN0YXRlX3VocyIgKDEuOFYpIGNvbmZpZ3VyYXRpb25z
Cj4gPiAtIEVuYWJsZSBjb29yZGluYXRlZCB2b2x0YWdlIGFuZCBwaW4gY29uZmlndXJhdGlvbiBj
aGFuZ2VzIGZvciBVSFMgbW9kZXMKPiA+Cj4gPiBUaGlzIHByb3ZpZGVzIGNvbXBsZXRlIHZvbHRh
Z2Ugc3dpdGNoaW5nIHN1cHBvcnQgd2hpbGUgbWFpbnRhaW5pbmcKPiA+IGJhY2t3YXJkIGNvbXBh
dGliaWxpdHkgd2hlbiBwaW5jdHJsIHN0YXRlcyBhcmUgbm90IGRlZmluZWQuCj4gPgo+ID4gVGVz
dGVkLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBJa2VyIFBlZHJvc2EgPGlrZXJwZWRyb3NhbUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMgfCA1OCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygr
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMgYi9k
cml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMKPiA+IGluZGV4IDBkZDA2ZmMxOWI4NTc0YWUx
YjAwZjdlNWQwOWI3ZDRjODdkMDY3NzAuLjAxYWZkYWRjZjcwNzk2NzA0YjI3MmVlNWEzMTU0M2Fm
ZDVlMDExODggMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMK
PiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYwo+ID4gQEAgLTE2LDYgKzE2
LDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvb2Zf
ZGV2aWNlLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+Cj4gPiArI2luY2x1ZGUgPGxp
bnV4L3BpbmN0cmwvY29uc3VtZXIuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+Cj4gPgo+ID4gICNpbmNsdWRlICJzZGhjaS5oIgo+ID4gQEAgLTcxLDYgKzcyLDkgQEAK
PiA+ICBzdHJ1Y3Qgc3BhY2VtaXRfc2RoY2lfaG9zdCB7Cj4gPiAgICAgICBzdHJ1Y3QgY2xrICpj
bGtfY29yZTsKPiA+ICAgICAgIHN0cnVjdCBjbGsgKmNsa19pbzsKPiA+ICsgICAgIHN0cnVjdCBw
aW5jdHJsICpwaW5jdHJsOwo+ID4gKyAgICAgc3RydWN0IHBpbmN0cmxfc3RhdGUgKnBpbmN0cmxf
ZGVmYXVsdDsKPiA+ICsgICAgIHN0cnVjdCBwaW5jdHJsX3N0YXRlICpwaW5jdHJsX3VoczsKPiA+
ICB9Owo+ID4KPiA+ICAvKiBBbGwgaGVscGVyIGZ1bmN0aW9ucyB3aWxsIHVwZGF0ZSBjbHIvc2V0
IHdoaWxlIHByZXNlcnZlIHJlc3QgYml0cyAqLwo+ID4gQEAgLTIxOSw2ICsyMjMsMzMgQEAgc3Rh
dGljIHZvaWQgc3BhY2VtaXRfc2RoY2lfcHJlX2hzNDAwX3RvX2hzMjAwKHN0cnVjdCBtbWNfaG9z
dCAqbW1jKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTUEFDRU1JVF9TREhDX1BI
WV9DVFJMX1JFRyk7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgdm9pZCBzcGFjZW1pdF9zZGhjaV92
b2x0YWdlX3N3aXRjaChzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCkKPiA+ICt7Cj4gPiArICAgICBz
dHJ1Y3Qgc2RoY2lfcGx0Zm1faG9zdCAqcGx0Zm1faG9zdCA9IHNkaGNpX3ByaXYoaG9zdCk7Cj4g
PiArICAgICBzdHJ1Y3Qgc3BhY2VtaXRfc2RoY2lfaG9zdCAqc2Roc3QgPSBzZGhjaV9wbHRmbV9w
cml2KHBsdGZtX2hvc3QpOwo+ID4gKyAgICAgc3RydWN0IG1tY19pb3MgKmlvcyA9ICZob3N0LT5t
bWMtPmlvczsKPiA+ICsgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICBpZiAoIXNkaHN0LT5w
aW5jdHJsKQo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiArCj4gPiArICAgICBpZiAoaW9z
LT5zaWduYWxfdm9sdGFnZSAhPSBNTUNfU0lHTkFMX1ZPTFRBR0VfMTgwKSB7Cj4gPiArICAgICAg
ICAgICAgIGRldl93YXJuKG1tY19kZXYoaG9zdC0+bW1jKSwgInVuc3VwcG9ydGVkIHZvbHRhZ2Ug
JWRcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgIGlvcy0+c2lnbmFsX3ZvbHRhZ2UpOwo+
ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiArICAgICB9Cj4KPiBJbiBWMiwgSSBwdXQgIi0+
dm9sdGFnZV9zd2l0Y2goKSBpcyBjYWxsZWQgb25seSBmb3IKPiBpb3MtPnNpZ25hbF92b2x0YWdl
ID09IE1NQ19TSUdOQUxfVk9MVEFHRV8xODAiIGJ5Cj4gd2hpY2ggSSBtZWFudCB0aGF0IGl0IGRv
ZXMgbm90IGFsbG93IHRoZSBkcml2ZXIgdG8KPiBzd2l0Y2ggcGluIHN0YXRlIGJhY2sgZm9yIDMu
M1YuCj4KPiBTbyB5b3UgcHJvYmFibHkgbmVlZCBhbiBhcHByb2FjaCBzaW1pbGFyIHRvIHRoZSBv
cmlnaW5hbAo+IHNwYWNlbWl0X3NkaGNpX3N0YXJ0X3NpZ25hbF92b2x0YWdlX3N3aXRjaCgpIGlu
Ogo+Cj4gICAgICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbWMvMjAyNjAzMDIt
b3JhbmdlcGktc2QtY2FyZC11aHMtdjEtNC04OWMyMTk5NzNjMGNAZ21haWwuY29tLwoKVGhhbmsg
eW91IGZvciB0aGUgZmVlZGJhY2suIEkgd2FudCB0byBtYWtlIHN1cmUgSSB1bmRlcnN0YW5kIHRo
aXMKcG9pbnQgY29ycmVjdGx5IHRvIGF2b2lkIGdvaW5nIGluIGNpcmNsZXMuCgpJbiB0aGUgdjIg
ZmVlZGJhY2sgLCB5b3UgbWVudGlvbmVkIHRoYXQgIi0+dm9sdGFnZV9zd2l0Y2goKSBpcyBjYWxs
ZWQKb25seSBmb3IgaW9zLT5zaWduYWxfdm9sdGFnZSA9PSBNTUNfU0lHTkFMX1ZPTFRBR0VfMTgw
Iiwgd2hpY2ggSQp1bmRlcnN0b29kIHRvIG1lYW4gdGhhdCB0aGlzIGNhbGxiYWNrIG9ubHkgbmVl
ZHMgdG8gaGFuZGxlIHN3aXRjaGluZwp0byAxLjhWLiBUaGlzIG1lYW50IHRoYXQgdGhlIGNoYW5n
ZXMgSSBpbnRyb2R1Y2VkIGZvciB2MyBkb24ndCBtYW5hZ2UKdGhlIHN3aXRjaGluZyB0byAzLjNW
LgoKQ2FuIHlvdSBjbGFyaWZ5IGlmIEkgc2hvdWxkIEkgcmV2ZXJ0IHRvIGltcGxlbWVudGluZwoi
LT5zdGFydF9zaWduYWxfdm9sdGFnZV9zd2l0Y2goKSIgaW5zdGVhZCwgd2hpY2ggd291bGQgaGFu
ZGxlIGJvdGgKMS44ViBhbmQgMy4zViBjYXNlcz8gT3IgaXMgdGhlcmUgYSB3YXkgdG8gbWFrZSB0
aGUKIi0+dm9sdGFnZV9zd2l0Y2goKSIgYXBwcm9hY2ggd29yayBwcm9wZXJseSBmb3IgYm90aCBk
aXJlY3Rpb25zPwoKPgo+ID4gKwo+ID4gKyAgICAgaWYgKHNkaHN0LT5waW5jdHJsX3Vocykgewo+
ID4gKyAgICAgICAgICAgICByZXQgPSBwaW5jdHJsX3NlbGVjdF9zdGF0ZShzZGhzdC0+cGluY3Ry
bCwgc2Roc3QtPnBpbmN0cmxfdWhzKTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGRldl93YXJuKG1tY19kZXYoaG9zdC0+bW1jKSwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIHNlbGVjdCBVSFMgcGluY3Ry
bCBzdGF0ZTogJWRcbiIsIHJldCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+
ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgIGRldl9kYmcobW1jX2Rldihob3N0
LT5tbWMpLCAic3dpdGNoZWQgdG8gVUhTIHBpbmN0cmwgc3RhdGVcbiIpOwo+ID4gKyAgICAgfQo+
ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgaW5saW5lIGludCBzcGFjZW1pdF9zZGhjaV9nZXRfY2xv
Y2tzKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBzZGhjaV9wbHRmbV9ob3N0ICpwbHRmbV9ob3N0KQo+ID4gIHsK
PiA+IEBAIC0yNTIsMTIgKzI4MywzNyBAQCBzdGF0aWMgaW5saW5lIGludCBzcGFjZW1pdF9zZGhj
aV9nZXRfcmVzZXRzKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICAgICAgIHJldHVybiAwOwo+ID4g
IH0KPiA+Cj4gPiArc3RhdGljIGlubGluZSB2b2lkIHNwYWNlbWl0X3NkaGNpX2dldF9waW5zKHN0
cnVjdCBkZXZpY2UgKmRldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBzZGhjaV9wbHRmbV9ob3N0ICpwbHRmbV9ob3N0KQo+ID4gK3sKPiA+ICsg
ICAgIHN0cnVjdCBzcGFjZW1pdF9zZGhjaV9ob3N0ICpzZGhzdCA9IHNkaGNpX3BsdGZtX3ByaXYo
cGx0Zm1faG9zdCk7Cj4gPiArCj4gPiArICAgICBzZGhzdC0+cGluY3RybCA9IGRldm1fcGluY3Ry
bF9nZXQoZGV2KTsKPiA+ICsgICAgIGlmIChJU19FUlIoc2Roc3QtPnBpbmN0cmwpKSB7Cj4gPiAr
ICAgICAgICAgICAgIHNkaHN0LT5waW5jdHJsID0gTlVMTDsKPiA+ICsgICAgICAgICAgICAgZGV2
X2RiZyhkZXYsICJwaW5jdHJsIG5vdCBhdmFpbGFibGUsIHZvbHRhZ2Ugc3dpdGNoaW5nIHdpbGwg
d29yayB3aXRob3V0IGl0XG4iKTsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAg
fQo+ID4gKwo+ID4gKyAgICAgc2Roc3QtPnBpbmN0cmxfZGVmYXVsdCA9IHBpbmN0cmxfbG9va3Vw
X3N0YXRlKHNkaHN0LT5waW5jdHJsLCAiZGVmYXVsdCIpOwo+ID4gKyAgICAgaWYgKElTX0VSUihz
ZGhzdC0+cGluY3RybF9kZWZhdWx0KSkKPiA+ICsgICAgICAgICAgICAgc2Roc3QtPnBpbmN0cmxf
ZGVmYXVsdCA9IE5VTEw7Cj4gPiArCj4gPiArICAgICBzZGhzdC0+cGluY3RybF91aHMgPSBwaW5j
dHJsX2xvb2t1cF9zdGF0ZShzZGhzdC0+cGluY3RybCwgInN0YXRlX3VocyIpOwo+ID4gKyAgICAg
aWYgKElTX0VSUihzZGhzdC0+cGluY3RybF91aHMpKQo+ID4gKyAgICAgICAgICAgICBzZGhzdC0+
cGluY3RybF91aHMgPSBOVUxMOwo+ID4gKwo+ID4gKyAgICAgZGV2X2RiZyhkZXYsICJwaW5jdHJs
IHNldHVwOiBkZWZhdWx0PSVwLCB1aHM9JXBcbiIsCj4gPiArICAgICAgICAgICAgIHNkaHN0LT5w
aW5jdHJsX2RlZmF1bHQsIHNkaHN0LT5waW5jdHJsX3Vocyk7Cj4gPiArfQo+ID4gKwo+ID4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgc2RoY2lfb3BzIHNwYWNlbWl0X3NkaGNpX29wcyA9IHsKPiA+ICAg
ICAgIC5nZXRfbWF4X2Nsb2NrICAgICAgICAgID0gc3BhY2VtaXRfc2RoY2lfY2xrX2dldF9tYXhf
Y2xvY2ssCj4gPiAgICAgICAucmVzZXQgICAgICAgICAgICAgICAgICA9IHNwYWNlbWl0X3NkaGNp
X3Jlc2V0LAo+ID4gICAgICAgLnNldF9idXNfd2lkdGggICAgICAgICAgPSBzZGhjaV9zZXRfYnVz
X3dpZHRoLAo+ID4gICAgICAgLnNldF9jbG9jayAgICAgICAgICAgICAgPSBzcGFjZW1pdF9zZGhj
aV9zZXRfY2xvY2ssCj4gPiAgICAgICAuc2V0X3Voc19zaWduYWxpbmcgICAgICA9IHNwYWNlbWl0
X3NkaGNpX3NldF91aHNfc2lnbmFsaW5nLAo+ID4gKyAgICAgLnZvbHRhZ2Vfc3dpdGNoICAgICAg
ICAgPSBzcGFjZW1pdF9zZGhjaV92b2x0YWdlX3N3aXRjaCwKPiA+ICB9Owo+ID4KPiA+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IHNkaGNpX3BsdGZtX2RhdGEgc3BhY2VtaXRfc2RoY2lfazFfcGRhdGEg
PSB7Cj4gPiBAQCAtMzI0LDYgKzM4MCw4IEBAIHN0YXRpYyBpbnQgc3BhY2VtaXRfc2RoY2lfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+Cj4gPiAgICAgICBob3N0LT5tbWMt
PmNhcHMgfD0gTU1DX0NBUF9ORUVEX1JTUF9CVVNZOwo+ID4KPiA+ICsgICAgIHNwYWNlbWl0X3Nk
aGNpX2dldF9waW5zKGRldiwgcGx0Zm1faG9zdCk7Cj4gPiArCj4gPiAgICAgICByZXQgPSBzcGFj
ZW1pdF9zZGhjaV9nZXRfY2xvY2tzKGRldiwgcGx0Zm1faG9zdCk7Cj4gPiAgICAgICBpZiAocmV0
KQo+ID4gICAgICAgICAgICAgICBnb3RvIGVycl9wbHRmbTsKPiA+Cj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
