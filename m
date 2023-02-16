Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1A9C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpCxAU4rFf4oTQPru1kieQR6pB3Qgj8XD/0K7ZerCHQ=; b=T6ZkzU/5k78d62
	9G+ZDDNvjJw9/GCqrKEL+VjGwk6Cqjlflj+tMjptNwjKLq3S/fSzvArRIuq0KaIdspRIVg8rXKZ9J
	Ekx/pXQLcrFUog9j/Uul4Yg1HPDx6nS0QRCL2EDMZyYVKKcvvOCfy2fOaFQAOHCdyeOjbmQIlHN+z
	k7vZveXEdxhQncH5GWowC456FVyerW/f3wcTcOweDk/qzyTmqo63hDbB8pF1r38nUUezargeXLDkk
	28Nm6Y4pb3hXoiydx0B29OLGrCSMkXgR/VHzDQxs78lUliu9BTfTJY3yRou3dqvxWHN1U6XQYLfKa
	Lnp9+BU+zDEED0ub3QNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbYn-009ZzL-NK; Thu, 16 Feb 2023 10:32:17 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbYk-009ZxF-QA
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 10:32:16 +0000
Received: by mail-ej1-x629.google.com with SMTP id mc25so3927604ejb.13
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 02:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWFSUdCVRyVw6x7wcHcTM6IEabG8cCTacN0P9Cw7hss=;
        b=DMVup6OQE69edQyn0ggk5ICi+662UFL0/JfpbZ1h8e+u4l5Oh2B34koVVN9Qc4yX5j
         82JMa3fgus74jDHnOE9BaoHTn9ePGcRv7Ty1bwSf083Q51CQ5VaYILa/ndl4Jsko2xL5
         afpHBT1CUVQQRKDb3biN/mAlsG4yKM0gRtzoZutL4nX6oZAD9IUuWSeeqXso66mnSBCc
         f5nMcP8DKEEtolK5H8fM4y5rr+PqN89HVv9UeilaFAXPExCHYy2vaO2lxMZDMqPemx91
         t0iDcsvGZcbj0aWJxg4kaOC7DjGJObegwF+7x4NAg9Iz1EQt6uvTsFbZbZIY1jf3QcMI
         OHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWFSUdCVRyVw6x7wcHcTM6IEabG8cCTacN0P9Cw7hss=;
        b=icv8lFUXOtrwlan0oAw46aC5qoO9mnUxLl8lYyKJcUJ84KltUAaPK1Pvci42FGg90T
         HrCwOLKIQT0KKfvfWt5CywlkWXWwRSmBBqpKVRwaNahJ/nsBEzFLk5mibzgv0op3Ps7R
         F8FHKuEUiPiyTkXBChyVPJbzeO9QC6eQ+z5DJkmjGmZXTSoYPz7mnGkSqYj8fycghRo+
         19ck4WrkHbLLxG0mwNfn1j4Dm4jvxitIwcgFEuFh8n2nn8vS+imiahzUeD1knC7WS8ce
         XS+dN/1DIyyiCMA1hXTInZ6JpEQQtvoTix7ddkTw34JLSy5J8hJhIt/ecy5Tc2V57B8I
         +aXA==
X-Gm-Message-State: AO0yUKUTm7gKDi0j5mVGEOMZdsK5UpBjfnSs9uIugsfGWkE91VJ94Q+M
	lPejLadMX2Y9tptNyXm+koCZ7A==
X-Google-Smtp-Source: AK7set/sKPk5xv7sgFMMvWdIVPPdD/XK4wPmGnvEGYQZMLg0YJX52U9MQnYr5e9CYPFb4GHTbmdmSg==
X-Received: by 2002:a17:906:ca4e:b0:89c:d072:e33e with SMTP id jx14-20020a170906ca4e00b0089cd072e33emr6792084ejb.49.1676543531221;
        Thu, 16 Feb 2023 02:32:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id my10-20020a1709065a4a00b0084d35ffbc20sm635832ejc.68.2023.02.16.02.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:32:10 -0800 (PST)
Message-ID: <07ce0eaa-d468-2425-be2a-f1868cd45419@linaro.org>
Date: Thu, 16 Feb 2023 11:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com>
 <41bcc545-6eda-6c30-c600-d97ef009abf2@linaro.org>
 <4b9edac8-20bf-be1c-6b32-69b7f7616ad5@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4b9edac8-20bf-be1c-6b32-69b7f7616ad5@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_023214_872329_69F13CD7 
X-CRM114-Status: GOOD (  10.27  )
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

T24gMTYvMDIvMjAyMyAxMTozMCwgV2lsbGlhbSBRaXUgd3JvdGU6Cj4gCj4gCj4gT24gMjAyMy8y
LzE2IDE4OjIzLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBPbiAxNS8wMi8yMDIzIDEy
OjMyLCBXaWxsaWFtIFFpdSB3cm90ZToKPj4+IEFkZCBkb2N1bWVudGF0aW9uIHRvIGRlc2NyaWJl
IFN0YXJGaXZlIFN5c3RlbSBDb250cm9sbGVyIFJlZ2lzdGVycy4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBXaWxsaWFtIFFpdSA8d2lsbGlhbS5xaXVAc3RhcmZpdmV0ZWNoLmNvbT4KPj4+IC0tLQo+
Pgo+PiBUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guIFRoZXJlIGlzIHNvbWV0aGluZyB0byBkaXNj
dXNzL2ltcHJvdmUuCj4+Cj4+PiArcHJvcGVydGllczoKPj4+ICsgIGNvbXBhdGlibGU6Cj4+PiAr
ICAgIGl0ZW1zOgo+Pj4gKyAgICAgIC0gZW51bToKPj4+ICsgICAgICAgICAgLSBzdGFyZml2ZSxq
aDcxMTAtc3RnLXN5c2Nvbgo+Pj4gKyAgICAgICAgICAtIHN0YXJmaXZlLGpoNzExMC1zeXMtc3lz
Y29uCj4+PiArICAgICAgICAgIC0gc3RhcmZpdmUsamg3MTEwLWFvbi1zeXNjb24KPj4KPj4gTWF5
YmUga2VlcCB0aGVtIG9yZGVyZWQgYWxwaGFiZXRpY2FsbHk/Cj4+Cj4gCj4gSSdtIHNvcnRpbmcg
YnkgcmVnaXN0ZXIgYWRkcmVzcywgb3IgSSBjYW4ga2VlcCB0aGVtIG9yZGVyZWQKPiBhbHBoYWJl
dGljYWxsee+8jHdoaWNoIGlzIGJldHRlcj8KCldlIGRvbid0IGtub3cgcmVnaXN0ZXIgYWRkcmVz
cyBoZXJlLCBzbyBJIHByb3Bvc2UgYWxwaGFiZXRpY2FsbHkuCgoKQmVzdCByZWdhcmRzLApLcnp5
c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
