Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12423C021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 06:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4lgc/MR0J/Jfg2dsG6dK8ZcxnNhO1Wdl/tesTiRmss=; b=TFyTuO7EYl641t
	HfsulPUvLqPi/MjENL92jlXn0T+NQmcIjE5FOKkIJosZH0nRddJTHjymjuGJ5dc98nrL3SjjmiTSP
	Y3roVY49XsLMfcfvCgSoOjBl3FUoXNG+WxIReotXV8iPfH3oy2hoSLlMcfmh6vLJS5P0hUrSs/NDg
	WiF5DRL9VpKC4LMk/e1RtLmgBcYBtV51GhcY4P4AqDIPEvRrOXv7dmkEuZxHRl1LNqDMk6LdevFSX
	Hewx3fXf04Kkr61K6GEqwcKbfpitY/fXeuWNWY3+UGxfpMWDya0gdzQSL5lNwMn3oSPh4bMCgrpzn
	9R7gJV9nZN9O060wwryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM2t-00000003KsF-0FYu;
	Tue, 04 Mar 2025 06:46:27 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLt2-00000003IhD-10PS
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 06:36:17 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso9067312a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 22:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741070175; x=1741674975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QIIT7csmVM8dlZqywgBobuFZmmi6UocIrnDWBO9ciw=;
        b=OVNGMZnub8V0t19Rv3gHq/la+vX7SkKgbgxZRahKzY1Eh7cWb8K7KxLUnm1uDV+HLj
         36hZ3eASw8An3P/jHFFyyMREFF8URZG/tBDXB51Uke7m53+2cbbUTvh/wdjpxWh0Hsln
         SMNm6TEmmdpuO/qB6s/zUBZqN99OlR91O0Mnwne1i9cxR4T+0AE4HaMsFvxwYTowZf00
         aMgzFMyJTrkXlLIPKNBbMwffP96jDA9gNseJfCX75HwR+SJAwFtzgx0cWQyyi1IxhWCC
         2BCEQwyXB+GmXsgGgZFXtW8iYIydXgHLjj04T3AgJtbiDERJbMr3AivkPapOR/3t+LpL
         Z9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741070175; x=1741674975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QIIT7csmVM8dlZqywgBobuFZmmi6UocIrnDWBO9ciw=;
        b=TtV+BTCrkRL+oouSQIh0MdvRXRGB18cOdBwoRweZXjIQfcRcCeq9+oNrbMnje3dkbV
         WVX/+1orjMv1d4ITqoosfCuSyp2DZqlWiZkYphxT7VpzEeQnsva8/A6eGBR/i/zVeLSt
         Zg3SK2hTUAdSXm0gteIbLbQSPB8IcibLz+fB6d2s0ccitNWUfzNiCtaYFAcwyNT2Ax8/
         KVYJU7EuJ81KAjCoLIlyxbQU3sByc2v4nlgFlhBLXu8l8c7dgTixk7g4eVT0ZSQ/toD3
         wi3vD+DxZEeBv+QlqCu16Xb04FZz9i93sY/XUko0bShr7gkl0P3ggZZda8MjJp3jOUun
         VXpg==
X-Forwarded-Encrypted: i=1; AJvYcCXFOBYxsOEIrCaBgxRRur7krNFbxNmlFX7eqAQF6zuNMebYrthFCz3sQVl3Azt9jkmrAEgRoHn4l8N/Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7pXbfPlUomvdz6M9bohmFJbrQG1RYhkG4l0XgV1Ff4f0PVcoj
	+ADSCDiE1mvLRZ5NSufmfMQWh6nHq/MdEIw8bnu2eYdq5vx4GT+Zssck/HZGtRgKiw45egLiaD0
	JjcMXFvDgxgrsks3MG5GqD2TH5bc=
X-Gm-Gg: ASbGncsi6V65tzzb+Qe15FlOIgoWr8ygHiAZv0a81Ex5QRQK2rw5E8WNDk78wWu+ujt
	mFKarDMESXlq0JB36gab0QoRXfq/tIVMpIpIBlHm7OBgV+iJzxw5U+4e0Gy0yLtmFsbQhATXMot
	1RaDkaWhtklsES9MK4hlAaGA1vLmh3WuEBVMcy+zmlyryZ40x3PZKe7Bc=
X-Google-Smtp-Source: AGHT+IHZm0fkINHMh/RJm6iSWcBaUzASH1B4ShN21HBXQ4x/u3WqSAUs5vR9z8gHam8OvAnYpRbhVOA/A6CSdmFfsw8=
X-Received: by 2002:a17:907:3d89:b0:ac1:e5b1:86fb with SMTP id
 a640c23a62f3a-ac1e5b191c5mr390382766b.10.1741070174300; Mon, 03 Mar 2025
 22:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com> <fllmh65x7ke4sfolxbdod73fx3fm45w7gy7x4pgamxnbhztjvk@wqd56dzxaa37>
In-Reply-To: <fllmh65x7ke4sfolxbdod73fx3fm45w7gy7x4pgamxnbhztjvk@wqd56dzxaa37>
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 4 Mar 2025 14:36:03 +0800
X-Gm-Features: AQ5f1JpUBt6QMLvOzLEGb8fYUdsyP3P3_7A1zhBvghXd3CBU5ioBvlsqG2gFerg
Message-ID: <CAKyUbwXqg13Ho7QHw8vV2W6OcObphwhQ8HUrZMDNBxrVxLmdug@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: sophgo: dts: Add spi controller for SG2042
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_223616_282058_0B94E22B 
X-CRM114-Status: GOOD (  28.29  )
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

T24gMjUvMDMvMDIgMTA6MThBTSwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBPbiBGcmksIEZlYiAy
OCwgMjAyNSBhdCAwODo0MDoyM1BNICswODAwLCBaaXhpYW4gWmVuZyB3cm90ZToKPiA+IEFkZCBz
cGkgY29udHJvbGxlcnMgZm9yIFNHMjA0Mi4KPiA+Cj4gPiBTRzIwNDIgdXNlcyB0aGUgdXBzdHJl
YW1lZCBTeW5vcHN5cyBEVyBTUEkgSVAuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWml4aWFuIFpl
bmcgPHN5Y2Ftb3JlbW9vbjM3NkBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+IEZvciB0aGlzIHNwaSBj
b250cm9sbGVyIHBhdGNoLCBvbmx5IGJpbmRpbmdzIGFyZSBpbmNsdWRlZC4KPiA+IFRoaXMgaXMg
dGVzdGVkIG9uIG1pbGt2LXBpb25lZXIgYm9hcmQuIFVzaW5nIGRyaXZlci9zcGkvc3BpZGV2LmMK
PiA+IGZvciBjcmVhdGluZyAvZGV2L3NwaWRldlguWSBhbmQgdG9vbHMvc3BpL3NwaWRldl90ZXN0
IGZvciB0ZXN0aW5nCj4gPiBmdW5jdGlvbmFsaXR5Lgo+Cj4gSSB3b25kZXIgd2hldGhlciB0aGlz
IHBhdGNoIGlzIHRlc3RlZCAob3IgYXQgbGVhc3QgY2FuIGJlCj4gdGVzdGVkKSwgYXMgSSBhbSBu
b3Qgc3VyZSB0aGVyZSBhcmUgcGlucyBmb3Igc3BpIG9yIGFueQo+IG9uYm9hcmQgZGV2aWNlIG9u
IGV4aXN0aW5nIFNHMjA0MiBib2FyZC4KPgpZZXMsIHRoaXMgaXMgdGVzdGVkIG9uIG1pbGt2LXBp
b25lZXIgYm9hcmQuClNpbmNlIHRoaXMgcGF0Y2ggaXMganVzdCBmb3Igc3VwcG9ydGluZyBTUEkg
Y29udHJvbGxlciBpbiBCVVMgbGV2ZWwKd2hpY2ggbm90IHJlbGF0ZXMgdG8gdGhlIHJlYWwgaGFy
ZHdhcmUgc3VjaCBhcyBzY3JlZW4sIEkgdXNlZApkcml2ZXIvc3BpL3NwaWRldi5jIGZvciBjcmVh
dGluZyB2aXJ0dWFsIGRldmljZSAvZGV2L3NwaWRldlguWSBieQphZGRpbmcgbm9kZXMgaW4gRFRT
IGZpbGUgYXMgZm9sbG93aW5nOgpzcGlkZXZAMCB7CiAgICAgICAgY29tcGF0aWJsZSA9ICJzbnBz
LGR3LWFwYi1zc2kiOwogICAgICAgIHJlZyA9IDwwPjsKICAgICAgICBzdGF0dXMgPSAib2theSI7
Cn07CgpzcGlkZXZAMSB7CiAgICAgICAgY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi1zc2kiOwog
ICAgICAgIHJlZyA9IDwxPjsKICAgICAgICBzdGF0dXMgPSAib2theSI7Cn07CkFuZCB1c2luZyB0
b29scy9zcGkvc3BpZGV2X3t0ZXN0LGZkeH0gcHJvdmlkZWQgYnkga2VybmVsIHRyZWUgZm9yCnRl
c3RpbmcgYnVzIGZ1bmN0aW9uYWxpdHkuCj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAt
IHJlYmFzZSB2MSB0byBzb3BoZ28vbWFzdGVyKGdpdGh1Yi5jb20vc29waGdvL2xpbnV4LmdpdCku
Cj4gPiAtIG9yZGVyIHByb3BlcnRpZXMgaW4gZGV2aWNlIG5vZGUuCj4gPiAtIHJlbW92ZSB1bmV2
YWx1YXRlZCBwcm9wZXJ0aWVzIGBjbG9jay1mcmVxdWVuY3lgLgo+ID4gLSBzZXQgZGVmYXVsdCBz
dGF0dXMgdG8gZGlzYWJsZS4KPiA+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI1MDIyOC1zZmctc3BpLXYxLTEtYjk4OWFlZDk0OTExQGdtYWlsLmNvbQo+ID4gLS0t
Cj4gPiAgLi4uL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdHMg
fCAgOCArKysrKysrCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kg
ICAgICAgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzNiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc29waGdvL3NnMjA0Mi1taWxrdi1waW9uZWVyLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL3NnMjA0Mi1taWxrdi1waW9uZWVyLmR0cwo+ID4gaW5kZXggYmU1OTZkMDFmZjhk
MzNiY2RiZTQzMWQ5NzMxYTU1ZWUxOTBhZDViMy4uYzQzYTgwN2FmMmY4MjdiNTI2N2FmZTVlNGZk
ZjZlOWU4NTdkZmEyMCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdv
L3NnMjA0Mi1taWxrdi1waW9uZWVyLmR0cwo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9z
b3BoZ28vc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRzCj4gPiBAQCAtNzIsNiArNzIsMTQgQEAgJnVh
cnQwIHsKPiA+ICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiAgfTsKPiA+Cj4gPiArJnNwaTAgewo+
ID4gKyAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICt9Owo+ID4gKwo+ID4gKyZzcGkxIHsKPiA+ICsg
ICBzdGF0dXMgPSAib2theSI7Cj4gPiArfTsKPiA+ICsKPiA+ICAvIHsKPiA+ICAgICB0aGVybWFs
LXpvbmVzIHsKPiA+ICAgICAgICAgICAgIHNvYy10aGVybWFsIHsKPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL3NnMjA0Mi5kdHNpCj4gPiBpbmRleCBlNjJhYzUxYWM1NWFiZDkyMmI1ZWY3OTZi
YThjMjE5NjM4Mzg1MGM0Li41MDA2NDUxNDdiMWY4ZWQwYTA4YWQzY2FmYjM4ZWE3OWNmNTdkNzM3
IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kK
PiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpCj4gPiBAQCAt
NTQ1LDUgKzU0NSwzMyBAQCBzZDogbW1jQDcwNDAwMmIwMDAgewo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJ0aW1lciI7Cj4gPiAgICAgICAgICAgICAgICAgICAgIHN0YXR1
cyA9ICJkaXNhYmxlZCI7Cj4gPiAgICAgICAgICAgICB9Owo+ID4gKwo+ID4gKyAgICAgICAgICAg
c3BpMDogc3BpQDcwNDAwMDQwMDAgewo+ID4gKyAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gInNucHMsZHctYXBiLXNzaSI7Cj4gPiArICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDcw
IDB4NDAwMDQwMDAgMHgwMCAweDEwMDA+Owo+Cj4gPiArICAgICAgICAgICAgICAgICAgIGNsb2Nr
cyA9IDwmY2xrZ2VuIEdBVEVfQ0xLX0FQQl9TUEk+LAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgPCZjbGtnZW4gR0FURV9DTEtfU1lTRE1BX0FYST47Cj4KPiBJcyB0aGUg
c3lzZG1hIGF4aSBjbG9jayBmb3IgdGhlIHRoaXMgZGV2aWNlLiBJSVJDIGlzIEFQQiBpbnRlcmZh
Y2UuCj4KVGhhbmtzLCBJIHdpbGwgcmVtb3ZlIHRoZSBHQVRFX0NMS19TWVNETUFfQVhJIGluIG5l
eHQgcmV2aXNpb24uCj4gQWxzbywgQXJlIHRoZXNlIGNsb2NrIGFsaWduZWQ/IElmIG5vdCwgdXNl
IHNwYWNlIHRvIGFsaWduIHRoZSB0d28KPiBjbG9ja3MuIFlvdSBhbHNvIG5lZWQgdG8gYWRkIHRo
ZSBjbG9jay1uYW1lcyBoZXJlLgpJbiB0aGUgY2FzZSBvZiB0aGUgb25seSBjbG9jaywgSSB0aGlu
ayBpdOKAmXMgcHJvYmFibHkgbm8gbmVlZCB0byBhZGQKdGhlIGNsb2NrLW5hbWVzIHByb3BlcnR5
IGhlcmUuCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmaW50
Yz47Cj4gPiArICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MTEwIElSUV9UWVBFX0xF
VkVMX0hJR0g+Owo+Cj4gPiArICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4
MDE+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDAwPjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgbnVtLWNzID0gPDB4MDI+Owo+Cj4gSnVzdCB1c2UgZGVjaW1hbCBu
dW1iZXIsIG5vIGhleCB0aGVyZS4KPgpUaGFua3MsIEkgd2lsbCBmaXggaXQgaW4gbmV4dCByZXZp
c2lvbi4KPiA+ICsgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZyc3RnZW4gUlNUX1NQSTA+
Owo+ID4gKyAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gKyAgICAg
ICAgICAgfTsKPiA+ICsKPiA+ICsgICAgICAgICAgIHNwaTE6IHNwaUA3MDQwMDA1MDAwIHsKPiA+
ICsgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi1zc2kiOwo+ID4g
KyAgICAgICAgICAgICAgICAgICByZWcgPSA8MHg3MCAweDQwMDA1MDAwIDB4MDAgMHgxMDAwPjsK
Pgo+ID4gKyAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsa2dlbiBHQVRFX0NMS19BUEJf
U1BJPiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY2xrZ2VuIEdB
VEVfQ0xLX1NZU0RNQV9BWEk+Owo+Cj4gVGhlIHNhbWUgYXMgYWJvdmUuCj4KVGhhbmtzLgo+ID4g
KyAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZpbnRjPjsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwxMTEgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4K
PiA+ICsgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgwMT47Cj4gPiArICAg
ICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MDA+Owo+ID4gKyAgICAgICAgICAgICAg
ICAgICBudW0tY3MgPSA8MHgwMj47Cj4KPiBUaGUgc2FtZSBhcyBhYm92ZS4KPgpUaGFua3MuCj4g
PiArICAgICAgICAgICAgICAgICAgIHJlc2V0cyA9IDwmcnN0Z2VuIFJTVF9TUEkxPjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPiA+ICsgICAgICAgICAgIH07
Cj4gPiAgICAgfTsKPiA+ICB9Owo+ID4KPiA+IC0tLQo+ID4gYmFzZS1jb21taXQ6IGFhNWVlNzE4
MGVjNDFiYjc3YzNlMzI3ZTk1ZDExOWYyMjk0YmFiZWEKPiA+IGNoYW5nZS1pZDogMjAyNTAyMjgt
c2ZnLXNwaS1lM2YyYWVjYTA5YWIKPiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiAtLQo+ID4gWml4
aWFuIFplbmcgPHN5Y2Ftb3JlbW9vbjM3NkBnbWFpbC5jb20+Cj4gPgpCZXN0IHJlZ2FyZHMsCgpa
aXhpYW4gWmVuZyA8c3ljYW1vcmVtb29uMzc2QGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
