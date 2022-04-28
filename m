Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1252C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 05:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqeIqh3mrE9HdTGSIgAvYlOUtwd2PidwLL048qvds2s=; b=jYy3d6e6nmmAXv
	ao4qSFBoJRLfdxZntq0j197WtT+w4z8NK7Pw1CvEXuriRyEiK6mQk8pz75IAqKv91a+fTAgNK6XIp
	gbsNjYO8KyL0nEcE8Sjsd94e6PtVEsUQygsoChEcxGmH5/jI+P8ZJiIs/BYZSqgO9twfc2XcZQbDU
	yb/Yyo/5h6ffKbf1IRwoIqDfeUZctG6wLOm78FDnl+jMuTeMrFciuJTXLJ3SktkVQSib39aNxu6gm
	eGMD2dfgB0xgm/WNlVbcUhE32h7reUVg4DOCFXKZc1sneYOsZHPBmdr7k2laDxTZPpDSQUIPLO3gj
	wNdWj0P4qRXlkS97wnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njwnN-004jS1-Ts; Thu, 28 Apr 2022 05:34:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njwnL-004jRQ-3c; Thu, 28 Apr 2022 05:34:28 +0000
Received: by mail-ed1-x533.google.com with SMTP id y21so4244846edo.2;
 Wed, 27 Apr 2022 22:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XBSM19WHQrA/ZYWGbJg75BNh3CcfAodaxAUNqq255NU=;
 b=plM7dwWhPQ3jZth62O5SXqLdvRYEn6LJLnS3SMhG1knXt6I4K6PCNUPn/2U4RXzJEK
 /SaMHSqP+YKIfABjIGivVyyZqTVUJ0c+qgHonmvt6ey8B8Hvj+bvxKjmMtfLkykMPVI4
 QJabxuuaZskVSwthx9T7QEIarzSu46DwLY+0vv1lX1vjswWCp1yXwdkOx4uolexbFo1e
 9O5L4mZsrRsUgiqouHlw41R0nlcJAzcMcnW6G2vz52BWuKlLhZziycMXmWIWYFpH27QB
 59cU6+Oaz2XenKYd3FdRR4kzqchxMpCk/8r7eqvEGZx6OYWPnQxXX7oxHXmI6K8uWSFs
 o3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XBSM19WHQrA/ZYWGbJg75BNh3CcfAodaxAUNqq255NU=;
 b=4eOkRo6nmKEQ2n8xu+roe2K3vIgLESA14BP1pd///RwkprhW9Qi7DhEjdevXiYjhI6
 EwczvwXVibhmaKxL69IQAbR+WIK1fIg5t0fiEfZXnKNDe09qAcqRPcItym9jsaZeZlWy
 Vb9krQEEr0Bsl4NDCSaY76v9n5Lza9YT/MR92QAGbqjhvIYcCLPoxP6fRWvdMgemeCGW
 lvDINoHAjVWAlDasGwsOl7mZ8eZydLHGhuT7VAjWznG8cXLvmLNR7a3T0SKq4DR8tuXV
 864Mi+dDh33WI5eEGsKBnwlQI4eaUqpPYdhOagZGvBXQAKTznQBpqKH/sFylqN/eUTek
 Owtg==
X-Gm-Message-State: AOAM530rVLTn4cyTkPw0zEuiFTVaPGBVZC2ZFrim+lz2PPtUgkwdwjp7
 lzYy4N0n9Hc06yTIsKa6ocU=
X-Google-Smtp-Source: ABdhPJxuFhdJ38I6OmBPpApX2mQq7HJRP4HXdI9BJ7CWtg4F08MfhnU+6wRqgvj5ZOzfkTlg3smYQw==
X-Received: by 2002:a50:e696:0:b0:419:998d:5feb with SMTP id
 z22-20020a50e696000000b00419998d5febmr34607475edm.122.1651124064815; 
 Wed, 27 Apr 2022 22:34:24 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 j27-20020a170906255b00b006f379c4323bsm6303285ejb.60.2022.04.27.22.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 22:34:24 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org, Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/5] iommu/sun50i: Support variants without an external
 reset
Date: Thu, 28 Apr 2022 07:34:22 +0200
Message-ID: <2857429.VdNmn5OnKV@jernej-laptop>
In-Reply-To: <20220428010401.11323-3-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
 <20220428010401.11323-3-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_223427_191840_BC5FEDD2 
X-CRM114-Status: GOOD (  20.02  )
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

RG5lIMSNZXRydGVrLCAyOC4gYXByaWwgMjAyMiBvYiAwMzowMzo1NyBDRVNUIGplIFNhbXVlbCBI
b2xsYW5kIG5hcGlzYWwoYSk6Cj4gVGhlIElPTU1VIGluIHRoZSBBbGx3aW5uZXIgRDEgU29DIGRv
ZXMgbm90IGhhdmUgYW4gZXh0ZXJuYWwgcmVzZXQgbGluZS4KPiAKPiBPbmx5IGF0dGVtcHQgdG8g
Z2V0IHRoZSByZXNldCBvbiBoYXJkd2FyZSB2YXJpYW50cyB3aGljaCBzaG91bGQgaGF2ZSBvbmUK
PiBhY2NvcmRpbmcgdG8gdGhlIGJpbmRpbmcuIEFuZCBzd2l0Y2ggZnJvbSB0aGUgZGVwcmVjYXRl
ZCBmdW5jdGlvbiB0byB0aGUKPiBleHBsaWNpdCAiZXhjbHVzaXZlIiB2YXJpYW50Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPgoKUmV2aWV3
ZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+CgpCZXN0IHJl
Z2FyZHMsCkplcm5lagoKPiAtLS0KPiAKPiAgZHJpdmVycy9pb21tdS9zdW41MGktaW9tbXUuYyB8
IDE4ICsrKysrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9zdW41MGkt
aW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvc3VuNTBpLWlvbW11LmMKPiBpbmRleCBjNTRhYjQ3N2I4
ZmQuLmVjMDdiNjAwMTZkMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L3N1bjUwaS1pb21t
dS5jCj4gKysrIGIvZHJpdmVycy9pb21tdS9zdW41MGktaW9tbXUuYwo+IEBAIC05Miw2ICs5Miwx
MCBAQAo+ICAjZGVmaW5lIE5VTV9QVF9FTlRSSUVTCQkJMjU2Cj4gICNkZWZpbmUgUFRfU0laRQkJ
CQkoTlVNX1BUX0VOVFJJRVMgKiAKUFRfRU5UUllfU0laRSkKPiAKPiArc3RydWN0IHN1bjUwaV9p
b21tdV92YXJpYW50IHsKPiArCWJvb2wgaGFzX3Jlc2V0Owo+ICt9Owo+ICsKPiAgc3RydWN0IHN1
bjUwaV9pb21tdSB7Cj4gIAlzdHJ1Y3QgaW9tbXVfZGV2aWNlIGlvbW11Owo+IAo+IEBAIC05MDUs
OSArOTA5LDE0IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdW41MGlfaW9tbXVfaXJxKGludCBpcnEs
IHZvaWQKPiAqZGV2X2lkKQo+IAo+ICBzdGF0aWMgaW50IHN1bjUwaV9pb21tdV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gKwljb25zdCBzdHJ1Y3Qgc3VuNTBpX2lv
bW11X3ZhcmlhbnQgKnZhcmlhbnQ7Cj4gIAlzdHJ1Y3Qgc3VuNTBpX2lvbW11ICppb21tdTsKPiAg
CWludCByZXQsIGlycTsKPiAKPiArCXZhcmlhbnQgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEo
JnBkZXYtPmRldik7Cj4gKwlpZiAoIXZhcmlhbnQpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+
ICAJaW9tbXUgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCppb21tdSksIEdGUF9L
RVJORUwpOwo+ICAJaWYgKCFpb21tdSkKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiBAQCAtOTQ3LDcg
Kzk1Niw4IEBAIHN0YXRpYyBpbnQgc3VuNTBpX2lvbW11X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UKPiAqcGRldikgZ290byBlcnJfZnJlZV9ncm91cDsKPiAgCX0KPiAKPiAtCWlvbW11LT5y
ZXNldCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXQoJnBkZXYtPmRldiwgTlVMTCk7Cj4gKwlpZiAo
dmFyaWFudC0+aGFzX3Jlc2V0KQo+ICsJCWlvbW11LT5yZXNldCA9IGRldm1fcmVzZXRfY29udHJv
bF9nZXRfZXhjbHVzaXZlKCZwZGV2LQo+ZGV2LCBOVUxMKTsKPiAgCWlmIChJU19FUlIoaW9tbXUt
PnJlc2V0KSkgewo+ICAJCWRldl9lcnIoJnBkZXYtPmRldiwgIkNvdWxkbid0IGdldCBvdXIgcmVz
ZXQgbGluZS5cbiIpOwo+ICAJCXJldCA9IFBUUl9FUlIoaW9tbXUtPnJlc2V0KTsKPiBAQCAtOTg3
LDggKzk5NywxMiBAQCBzdGF0aWMgaW50IHN1bjUwaV9pb21tdV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlCj4gKnBkZXYpIHJldHVybiByZXQ7Cj4gIH0KPiAKPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBzdW41MGlfaW9tbXVfdmFyaWFudCBzdW41MGlfaDZfaW9tbXUgPSB7Cj4gKwkuaGFzX3Jl
c2V0ID0gdHJ1ZSwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IHN1bjUwaV9pb21tdV9kdFtdID0gewo+IC0JeyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3Vu
NTBpLWg2LWlvbW11IiwgfSwKPiArCXsgLmNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjUwaS1o
Ni1pb21tdSIsIC5kYXRhID0gCiZzdW41MGlfaDZfaW9tbXUgfSwKPiAgCXsgLyogc2VudGluZWwg
Ki8gfSwKPiAgfTsKPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3VuNTBpX2lvbW11X2R0KTsK
CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
