Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7919C61DC6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 11:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SUD5vX9j1UzmExHkvDarvY6otcU0Zl1JrxA8bwREtU=; b=0Y0DWP6PJcmTiS
	QXASYwaidWNS5U2fR+I4ohXFIEKKVN9HG1M2bSddTZ2axw5UTmQ3iRXu2uvb0W/yJsuPCvl5Jx/UL
	6pFv2rLUUEDX/QgB5nHkRuI+hffgC1dS9MVgVssDbVOKJ3vgUNc8y7+KoOhKeZnT3xGWwTennqQW9
	FMSfJwbKJ2uhCv1qfWlVc16onnlGmqwVZAieh5by87PwiJNU/rTCl59jGj5J6bzmL0JCx/22Mgdj4
	i4jye9SKEVkeul8YjCpBesz9Cy/xGoLIPNpMg4kHakmzD5Y1AQ91yQoTwys3iSZ3k5pOSWc/zRmtr
	lUT3nWP8EdUq7j1VRgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzY6i-00000003sUd-2l4H;
	Thu, 27 Aug 2026 11:17:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzY6g-00000003sU5-0ahY
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 11:17:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso15020135e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2026 04:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787829436; x=1788434236; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7OBFqNTBANSPaxVAd2poemMPOcLMraetZWIq+y0CHI=;
        b=jn/hVAI/Es1///1xYGijL0fwaKloAjLhaBBSWygKhN7r0vabpZ3zmUi+H8/XoMoyCA
         fPDOU3dIDYTH5fMTa2oiwJEFNFFdoyKgx5D2qnjucCSIFTTsohnMy5on6qDlIkY4GHx/
         mckkYJC/3myjsm5aJCdKlu+KSz2trHFABB+SdyXxt5pfrVHjAGpIwOfF+KkqpJZ4Mcll
         plkGxoDHK0O+8s6ujzK94y6iR9j3XK+efX12QW8kf34VmaK1vzb/ESOYRkey4qcg4GjI
         NakhZJuI6bPVnmNOOyeqVG418droT4A9rK5zAYzprnkAXjTG967FeOCEBhCkf03HMYNS
         ddfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787829436; x=1788434236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7OBFqNTBANSPaxVAd2poemMPOcLMraetZWIq+y0CHI=;
        b=GZ/0sSuN++lHd8puh1uq4paOxMeU++fgBUEBB5d+irZqMNCtqybHRaz0QcMAzsbznm
         r+fpq5ZnwIBwNPz698AECzSsoupWnT8dNUzWFzdX5rX9qNf6r/TlKHQfO6ukaXrZl9t7
         ra69PncEXrub5Q+LGwEeJs1vndkPrcLC0erIxrowIKMJqWGxbsM0cwnmHDS9i/fVSVzC
         BRQNvvN/CjC0ycf4Zl58AFz9ONc9MsSwiASJGE0s6InoRn5vfulEnPEuSr5FMwSQEgdT
         +LwONuE2TNZGs7wys7kiWa+6Ug4ZCaOwPy5hhwPk9ByQXI/HJJga5a5u5ZJB1IOUl6+K
         hGuA==
X-Forwarded-Encrypted: i=1; AHgh+RpNFf3R5UuYnlZoWKXfuUfW2tztR7CHElCN2shFlJik+okdACb4CdSFlW0P2Nj0L3OFroLTFGQ7aGbz0Q==@lists.infradead.org
X-Gm-Message-State: AFuF++n1LGWzB96chSiGt5teCf0bTpYktdBgqcTnf7fcdAt5812DPUe4
	WPugkC8tKPimOpDp/ofVWbsvRo0kCAyxlZ6qGGsO1S8XEYnIX/72ROLF
X-Gm-Gg: AR+sD10FS8ERtymTom9riQKTeG6U+R8+oQF5U4+V3eJW0CBCqUnKYGMVWsZX9yv8VB4
	jqlPdUmUZWOmrQ1BRjrepv8b1JY2RBw6o8QTUWH72ypyb64tEIk4rYyMJeNkUedfPuztlwtV1HQ
	I4UeqEhINKoolCVUq2Shomrn2q4usK+RmdB7BfSeCYyeGE3NPsrelugN/wiyozB8Kq/rphffzon
	Zp3umAiN/+wEpNxQfbgFehuEj4V1lxQj/dW9mVnzANP5GMptV6P9ddZVz+aEIRYP+5PnbNiFMku
	/2dBEPW3GA2VqEyog2qZdCMfmIw+mT4V9jwhJ78xYkj9MiKhy2z0zkv2cbLs8LHzRd9XRva8eWT
	HyAnbiKYNxcP4f1Vy1GBpEpBswOisWYeNLZSqZVzZa9TxVle+qpMqditqFK1eX4JaCFij/8FaEz
	xGl/BozC25Xm9h+y/Xu+uuP1YCEJ51LUf4IWJ/nDJPbsVyclg1qczg1Bk4bzwskD+FNK8Kanw3C
	G77N1q4lM9uzJFEwqWbh/6sTahl9/ImzoRNbZ1JUm/fLfVQ4NQcBUwZa4xK8t8TxlR9FViZz6v2
	r0rFIWU4EL3MnQ==
X-Received: by 2002:a05:600c:c87:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-499dc93411fmr130733645e9.15.1787829435320;
        Thu, 27 Aug 2026 04:17:15 -0700 (PDT)
Received: from [172.24.138.145] (ipservice-092-208-247-184.092.208.pools.vodafone-ip.de. [92.208.247.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49236515sm68507065e9.1.2026.08.27.04.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 04:17:14 -0700 (PDT)
Message-ID: <aed972ef-3776-4055-81aa-63255d072b8d@gmail.com>
Date: Thu, 27 Aug 2026 13:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marius Cristea <marius.cristea@microchip.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>,
 linux-riscv@lists.infradead.org
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
 <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
 <ao_z9QTJC_q8gH0v@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <ao_z9QTJC_q8gH0v@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_041718_195194_78B8A597 
X-CRM114-Status: GOOD (  13.56  )
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

Ck9uIDgvMjcvMjYgMTA6MjMsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiBNb3JlIG9yIGxlc3Mg
aW4gYSBnb29kIHNoYXBlLCBhIGZldyBuaXQtcGlja3MgYW5kIG1pbm9yIGlzc3VlcyBoZXJlIGFu
ZCB0aGVyZQo+IGFuZCBJIGJlbGlldmUgdGhlIG5leHQgdmVyc2lvbiB3aWxsIGJlIGZpbmUgdG8g
Z28uIE5vdGUsIHNvbWUgb2YgdGhlIG1lbnRpb25lZAo+IGlzc3VlcyBjYW4gYmUgYWRkcmVzc2Vk
IGxhdGVyLCBidXQgaWYgbm8gZG91YnRzLCBhZGRyZXNzIG5vdy4KPgo+IE9uIFRodSwgQXVnIDI3
LCAyMDI2IGF0IDA5OjM0OjQ4QU0gKzAyMDAsIEphbmFuaSBTdW5pbCB3cm90ZToKPj4gQWRkIHN1
cHBvcnQgZm9yIEFENTUyOVIgMTYtY2hhbm5lbCwgMTIvMTYgYml0IERpZ2l0YWwgdG8gQW5hbG9n
IENvbnZlcnRlcgo+PiBmcm9tIEFuYWxvZyBEZXZpY2VzLgo+Pgo+PiBUaGUgZGV2aWNlIGNvbW11
bmljYXRlcyBvdmVyIFNQSSBhbmQgc3VwcG9ydHMgcGVyLWNoYW5uZWwgb3V0cHV0IHJhbmdlCj4+
IGNvbmZpZ3VyYXRpb24uIEFuIG9wdGlvbmFsIGV4dGVybmFsIDQuMDk2ViByZWZlcmVuY2UgY2Fu
IGJlIHVzZWQgaW4KPj4gcGxhY2Ugb2YgdGhlIGludGVybmFsIHJlZmVyZW5jZS4KPj4gKwlmb3Ig
KHVuc2lnbmVkIGludCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoYWQ1NTI5cl92c3Nfc3VwcGx5X25h
bWVzKTsgaSsrKSB7Cj4+ICsJCXJldCA9IGRldm1fcmVndWxhdG9yX2dldF9lbmFibGVfb3B0aW9u
YWwoZGV2LAo+PiArCQkJCQkJCSBhZDU1MjlyX3Zzc19zdXBwbHlfbmFtZXNbaV0pOwo+PiArCQlp
ZiAocmV0ICYmIHJldCAhPSAtRU5PREVWKQo+PiArCQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCByZXQsCj4+ICsJCQkJCSAgICAgIkZhaWxlZCB0byBnZXQgYW5kIGVuYWJsZSAlcyByZWd1bGF0
b3JcbiIsCj4+ICsJCQkJCSAgICAgYWQ1NTI5cl92c3Nfc3VwcGx5X25hbWVzW2ldKTsKPj4gKwl9
Cj4gSG1tLi4uIENhbiB3ZSB1c2UgYnVsayByZWd1bGF0b3IgYXBwcm9hY2ggaGVyZT8KCkkgZG9u
wrR0IHRoaW5rIHRoZSBidWxrIGhlbHBlciBmaXRzIGhlcmUuIEVhY2ggVlNTIHN1cHBseSBpcyBp
bmRlcGVuZGVudGx5IG9wdGlvbmFsLCBhbmQgdGhlcmUgaXMgY3VycmVudGx5IG5vIG9wdGlvbmFs
IGJ1bGsgZ2V0LWVuYWJsZSByZWd1bGF0b3IgaGVscGVyLgoKUmVnYXJkcywKSmFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
