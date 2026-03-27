Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D601910ED67C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBflfKMshXE1NxDyEOYkhFtjmE8GcXAifFI1MdfeRJQ=; b=WPWTaObwSbfx6n
	ctDHuVTuuSIS5X3WVnCLLTVJbp3rkcRUG5igjl2ldQwH6Lt8DLAMAVsGGuDY0fElmYbi6HZoU7NMc
	fg7ONW0wOe9HC9Ff/EpqxohCPiOIDXK/sVQiSmh/oE0SIAPIDIeBXzMHPS5Gm1DiC+M8VGEYRnKE4
	cV8f1wVattL7E+hP/KqwMXKx+QFxIi6bnxt38bjDEECvLd5PoMaKB+VehOMiXTLnAmMcPtItGLwAh
	uPtur4u/Iv53aCPYuZOvVNlrVSzDYfDgg12JxIAb2/Mv4ZAsASzloeWM4XxTUBV9+l+4hjNTeBD0M
	FJFPhwnriEFKpfUTcS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67nv-00000007YU9-3ISR;
	Fri, 27 Mar 2026 14:04:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67nu-00000007YSS-0oMF
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Mar 2026 14:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TnwOxiQgTrY2GQTcPVQdPC36P8UQNWjAuceWpM/pOE8=; b=o747e1jU02T13LHV/l2k6B5ogx
	XbxpBxFbNkWm3f1fMtpp/lO2lpUZkFjSjE3SN3CrtKZm65kzxw61hZhS1UhvGFX7Fh9SGoBzoc/yz
	7FcSrbPUbgk2jjnmTavlP6PfB4pnWUvCccsuvJ8AKT3QXSdJ1V163hvHlnLyTXI/rBgw8KIL6aKph
	ARonPoNSGqjpKiM5htJxTEYN85GT1Tpv1H07/xe7a/mzpt2dlK2IQxThldrKx09HTVQyRgOtMbC3e
	HBmPQcBFGmgon98iupl5eegK/NynFXwvvG4CXcjLmOafxtWIsYqNABn31KxdAFrZMrcnKOoUMQgTA
	QYqjdDjA==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67nq-0000000AZ3I-0bVM
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 14:04:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so24776165e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 07:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774620283; x=1775225083; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TnwOxiQgTrY2GQTcPVQdPC36P8UQNWjAuceWpM/pOE8=;
        b=SnddVSAthzKBcRP4sfbiS8NjWtyZeZ+sdZpkjBj4Y+9tcaFnZiNlcONmGu0l70WzNp
         MIkRcJE3QIcSs25VveyCJT9SMmthsmpWcWfJvQXY3PpujEwp6pH6F1F0VFCD5DNR3o5q
         CdRLPT2sSiYAUZjjCEZzu0EeP8q3UHeTh0f2pYXavIvYNDlxbwytoVded/5HrwqkVv7z
         gRJM8rWvmXgIlKwrbj6+kyrcoIHBI9kcwyXs0X1r9dq40eWvo/1USafycEcrM3goi6Su
         A12hczV1GfFzySAJ19aSyvI9vJ30NYYj8b/e0Z2f58S6dBKDwd8x0brvHrVtDQ0AiOyk
         bNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620283; x=1775225083;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnwOxiQgTrY2GQTcPVQdPC36P8UQNWjAuceWpM/pOE8=;
        b=ePjy+nMQQGPdNdnQY0PWikkN0jyfIZhDR9OpQ2M+yvl+miNgenox+LfyVgqb6bSUWi
         IAeLVbNE9cUnTMEs3DNDrri3dUthOqBgoL9Yd0/YnHX6120FTX5Fx3ap5ciuEef3hDA4
         MQUEmWJtffzEPImYvyrCQgVW+b33g3GpSeGGAhco3SFYV/ERi2mO9/DXt5T1FNHlmN9V
         KbgTbdyuH5BGKfpYvmr4E3FO/QDzuJjDKFmZ1K9LBWAk7U36VSFVEK7AmloFajSpq9zX
         kcReao6CM68T/tXn3W2NLgDxOKtAJisX2/JCFVE9ioZYcq6tdo3LeIS1Pj5YEAxe818a
         wUXA==
X-Forwarded-Encrypted: i=1; AJvYcCUqL7Bn1kyli4JPP9fsfVb+js/IZFbglgkdSSXA5q3BcQ4LX0hMpbsvHw2eBjaVG0jfojVriajaq/qRsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdzM4dAnB2D6YbdZ7fEDkhh4/VaExE32UB3TTFn08NLH3f1sFm
	iY8MbFJSk0B0Umm5v2pX4LP/FgW64pukJJhKHfZmkDr7mSI2QNZE/OkmNGRG2bPjIW0=
X-Gm-Gg: ATEYQzxBJJlc4uiQAJBxPQB/b8Cjsb3uT7ZCbS7Aa3rodHLiPW8fZPt5qVvzMfH0vDn
	NV1vlrWcPKuaouapuBZ3BrsoMyzvsxqP9nPKXd/HwJi4uPsICvTDXqACJVxjJ5gZl3Y12EbsLDt
	Psvn4Vc/5pGiTix8+GwtSQwWC5VjlrErhtb4EEvMCe4KrW1mp7x9Oc1qbjvk3ntPuFkgYlj4Q6C
	vVbtPr3iJ1OXEqn7yLSFzQvPlBnzhDVpuLHlCIt6ZLQ2g0YoazUGD1lsJk3ek0aNV9WQbEoZIX3
	XJAgDdSpvgxGccz2RXxxpP8YuirisHg5ZPYs1lygM8hb8XPdK5n+ZTDe/sZN7RF804QI4/LgiRR
	J+ZDi3mImabLsLUA7czdaXQUmG29tIm2h+LbqduZzrFSTfp7ixc4mNU0zNLqsDH5l4f11KqHePt
	/a/RCgWQdutb26TrqKxTTePDM0sLSQ9DnRVf4IWpUdq3lxZgJCKwuC18NFz8CBDUJxTlC8i4eLK
	B0qkwJgSeFo0KbsQYSj7Fw=
X-Received: by 2002:a05:600c:3f16:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-48727c86862mr44979375e9.0.1774620283136;
        Fri, 27 Mar 2026 07:04:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725eb5417sm27114795e9.3.2026.03.27.07.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 07:04:42 -0700 (PDT)
Message-ID: <7d9675e6-3f02-49e8-b65a-9785d5b6a7c7@linaro.org>
Date: Fri, 27 Mar 2026 15:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Chuanhua Lei <lchuanhua@maxlinear.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_140446_403601_CAD71FE7 
X-CRM114-Status: GOOD (  16.47  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TGUgMDUvMDMvMjAyNiDDoCAwNzoyMCwgU3VtaXQgS3VtYXIgYSDDqWNyaXTCoDoKPiBUaGlzIHNl
cmllcyBhZGRzIHN1cHBvcnQgZm9yIG11bHRpLXBvcnQgUENJZSBjb250cm9sbGVycyBpbiB0aGUg
RGVzaWduV2FyZQo+IGRyaXZlci4gQ3VycmVudGx5LCB0aGUgZHJpdmVyIG9ubHkgc3VwcG9ydHMg
YSBzaW5nbGUgUm9vdCBQb3J0IHdpdGgKPiBjb250cm9sbGVyLWxldmVsIHByb3BlcnRpZXMsIHdo
aWNoIGRvZXNuJ3Qgd29yayBmb3IgbXVsdGktcG9ydCBjb250cm9sbGVycwo+IHdoZXJlIGVhY2gg
cG9ydCBtYXkgaGF2ZSBkaWZmZXJlbnQgY29uZmlndXJhdGlvbnMuCj4gCj4gVGhpcyBzZXJpZXMg
aW50cm9kdWNlcyBhIHBlci1wb3J0IHN0cnVjdHVyZSBhbmQgcGFyc2luZyBBUEkgdGhhdCBhbGxv
d3MKPiBlYWNoIFJvb3QgUG9ydCB0byBiZSBjb25maWd1cmVkIGluZGVwZW5kZW50bHkgdmlhIHBj
aWVATiBjaGlsZCBub2RlcyBpbgo+IGRldmljZSB0cmVlLCB3aGlsZSBtYWludGFpbmluZyBiYWNr
d2FyZCBjb21wYXRpYmlsaXR5IHdpdGggZXhpc3RpbmcKPiBzaW5nbGUtcG9ydCBiaW5kaW5ncy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBTdW1pdCBLdW1hciA8c3VtaXQua3VtYXJAb3NzLnF1YWxjb21t
LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gRml4IGVycm9yIGNvZGUgcHJlc2VydmF0
aW9uIGluIGR3X3BjaWVfcmVzdW1lX25vaXJxKCkgdG8gcmV0dXJuIGFjdHVhbAo+ICAgIGVycm9y
IGZyb20gZHdfcGNpZV93YWl0X2Zvcl9saW5rKCkgaW5zdGVhZCBvZiBoYXJkY29kZWQgLUVUSU1F
RE9VVCAoTWFuaSkuCj4gLSBJbml0aWFsaXplIHJldCB2YXJpYWJsZSB0byAtRU5PRU5UIGluIGR3
X3BjaWVfcGFyc2Vfcm9vdF9wb3J0cygpIChNYW5pKS4KPiAtIGR3X3BjaWVfaG9zdF9pbml0KCk6
IFJlbW92ZSAtRU5PRU5UIGVycm9yIHNraXBwaW5nIHRvIG1ha2UgcGFyc2luZwo+ICAgIGZhaWx1
cmVzIGZhdGFsIGZvciBub3csIGFkZCBUT0RPIGNvbW1lbnQgYWJvdXQgbWFraW5nIHByb3BlcnRp
ZXMKPiAgICBvcHRpb25hbCBsYXRlciAoTWFuaSkuCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjYwMTA1LWR0LXBhcnNlci12MS0wLWIxMWM2M2NiNWUyY0Bvc3Mu
cXVhbGNvbW0uY29tCj4gCj4gLS0tCj4gU3VtaXQgS3VtYXIgKDIpOgo+ICAgICAgICBQQ0k6IEFQ
SSBjaGFuZ2VzIGZvciBtdWx0aS1wb3J0IGNvbnRyb2xsZXIgc3VwcG9ydAo+ICAgICAgICBQQ0k6
IGR3YzogQWRkIG11bHRpLXBvcnQgY29udHJvbGxlciBzdXBwb3J0Cj4gCj4gICBkcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2ktZXh5bm9zLmMgICAgICAgICAgIHwgICA0ICstCj4gICBkcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktaW14Ni5jICAgICAgICAgICAgIHwgIDE1ICstCj4g
ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYyAgICAgICAgICAgIHwgICAx
IC0KPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1ob3N0LmMg
fCAxNzUgKysrKysrKysrKysrKysrKysrLS0tLQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS1kZXNpZ253YXJlLmMgICAgICB8ICAzMiArKy0tCj4gICBkcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaCAgICAgIHwgIDE3ICsrLQo+ICAgZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jICAgICAgICAgICB8ICAgNiArLQo+ICAgZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1pbnRlbC1ndy5jICAgICAgICB8ICAxMyArLQo+
ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLWNvbW1vbi5jICAgICB8ICAg
NSArLQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLWVwLmMgICAgICAg
ICB8ICAgNCArLQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLmMgICAg
ICAgICAgICB8ICAgNCArLQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1yY2Fy
LWdlbjQuYyAgICAgICB8ICAxMyArLQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1zcGVhcjEzeHguYyAgICAgICB8ICAgNSArLQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS10ZWdyYTE5NC5jICAgICAgICB8ICAgNCArLQo+ICAgZHJpdmVycy9wY2kvb2YuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQo+ICAgZHJpdmVycy9wY2kv
cGNpLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gICAxNiBmaWxl
cyBjaGFuZ2VkLCAyMzIgaW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25zKC0pCj4gLS0tCj4gYmFz
ZS1jb21taXQ6IDA5N2E2YzMzNmQwMDgwNzI1YzYyNmZkYTExOGVjZmVjNDQ4YWNkMGYKPiBjaGFu
Z2UtaWQ6IDIwMjUxMDEwLWR0LXBhcnNlci05OGI1MGNlMThmYzEKPiAKPiBCZXN0IHJlZ2FyZHMs
CgpUZXN0ZWQgb24gbWVzb24tcGNpIChib290IGxvZyBodHRwczovL2dpdGxhYi5jb20vYW1sb2dp
Yy1mb3NzL2FiY2QtbGludXgtdGVzdC8tL2pvYnMvMTM2NzcwNjEwMzYpCgpUZXN0ZWQtYnk6IE5l
aWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiAjIE9uIEJhbmFuYXBpIE0y
UwoKVGhhbmtzLApOZWlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
