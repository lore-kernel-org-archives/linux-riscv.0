Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9039EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 05:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/I34rTa8ghU9Wu7CGpwj3cPB4l2x7MEYaPXRFwXYbMY=; b=Rb0Xw39X1YFKqZ
	Cd94RR0WaeNVeNlN51WSgBcnRfPO8sznXogvBgW4+qf/GNm8pEarpg3Xz2AgXkkUFaWcBpZxOLGHs
	HH8el2mik0tPyfThzJNtfJjcSp82a5JIG5nIlwuK0LINHTFtDkoql/+4SYsWkrvH2z4fez+bl6u4i
	+nnX4zWDzK1YPifdZTHBjBYBoUuNGxn3t7vugphG6IVczHEHH3W+p4JtSf2f2O6l5t3TgaeZeutrl
	jQEj0b9HI9CkdgPOA5HLEcfyHnA5tvfN0gpCW024vjY4OottZbKw4o8wyVhq0r/+pJibRlS4kBWpM
	AF8J/sAG3EuYM6fn5naw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njww8-004lYv-9A; Thu, 28 Apr 2022 05:43:32 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njww5-004lXH-2U; Thu, 28 Apr 2022 05:43:30 +0000
Received: by mail-ej1-x62b.google.com with SMTP id kq17so7354869ejb.4;
 Wed, 27 Apr 2022 22:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s07a0DsY9s52QkJmiJ36LrahFkWV2t9AjkvfZr/kSYU=;
 b=AoSWjN4/5ia3sJysWSlpJKDFdG/NXjaAcfPIzWtpSV7VXYWAH+TaL+n47Sj1nuCQPi
 J56q+vUiECCLwu3kys9q/Jv1pOUc4MpmGNGfLPbRGLnRnQlsR6GqQZzTdDvhd/Qawh92
 /7oYX4g5gnXixje6OV1O6PG2hG6BTfY8TDrf+zL6dHFRjBtRiDNo5fmZgSzurmzXkvWU
 6bV3KbvuIPI5CN1bqS2frjrHr0uwIWKYxkXFhDlOkezxthjM5PGtwoolbM86cIje0lKr
 vTVdQTiCDjE8/E/f1AI0sSkqNPpeBQsbiI2JxkXRLOf+TlWZzylSoDuwScGjfY10IK+2
 M4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s07a0DsY9s52QkJmiJ36LrahFkWV2t9AjkvfZr/kSYU=;
 b=bnk0mPuIZTMWXvHTlA0I34LCbUJwqMCNdFBKfNUbN9iew4OHCV1BYzgp/40dWrvcx+
 RSNN0meEpeqlWlZvF1H4qaRQbigjJJTLxHOGkzqtUrKKPtSzaVVyG2UIGud9IxEh30mY
 X+w9sX0slWkU5SWhJbrFtu2JTV8ILi6HOfT+In57bXC05P+o3XWabB6MjAgqXOjNJFAz
 GvWCUOYMy6ubR0F0FTb+poZT7oBl/IlwPh8QeE10KAT5lYo54qg9YCIHXaJkI+D7ouY5
 +RlrfDTwrlpm8WPEcZmbvnO8hx6hfDRpRkSXa54MuXta4tVNDD9XiLR3Z/Rtw8k6xs5l
 +pBg==
X-Gm-Message-State: AOAM530Ur8EhVEbM/90djzwoqHXw5vaPwFGb4OBUI5fSyiKxcRDmSdZY
 tN60BkQjstNL7kuqD3JsLB4=
X-Google-Smtp-Source: ABdhPJzWJjNdXgo+WbHDrSQuq/2nYg4TWpvGFaOwbQshU+cXykP4HIK3zWEPoWCTdp5k14/cBAAWdw==
X-Received: by 2002:a17:906:1841:b0:6e8:872d:8999 with SMTP id
 w1-20020a170906184100b006e8872d8999mr29426739eje.492.1651124607032; 
 Wed, 27 Apr 2022 22:43:27 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 s25-20020a170906285900b006f3c813f51fsm2227173ejc.128.2022.04.27.22.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 22:43:26 -0700 (PDT)
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
Subject: Re: [PATCH 3/5] iommu/sun50i: Ensure bypass is disabled
Date: Thu, 28 Apr 2022 07:43:25 +0200
Message-ID: <1922960.8hb0ThOEGa@jernej-laptop>
In-Reply-To: <20220428010401.11323-4-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
 <20220428010401.11323-4-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_224329_161292_5EFC1A60 
X-CRM114-Status: GOOD (  13.96  )
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

RG5lIMSNZXRydGVrLCAyOC4gYXByaWwgMjAyMiBvYiAwMzowMzo1OCBDRVNUIGplIFNhbXVlbCBI
b2xsYW5kIG5hcGlzYWwoYSk6Cj4gVGhlIEg2IHZhcmlhbnQgb2YgdGhlIGhhcmR3YXJlIGRpc2Fi
bGVzIGJ5cGFzcyBieSBkZWZhdWx0LiBUaGUgRDEKPiB2YXJpYW50IG9mIHRoZSBoYXJkd2FyZSBl
bmFibGVzIGJ5cGFzcyBmb3IgYWxsIG1hc3RlcnMgYnkgZGVmYXVsdC4KPiAKPiBTaW5jZSB0aGUg
ZHJpdmVyIGV4cGVjdHMgYnlwYXNzIHRvIGJlIGRpc2FibGVkLCBlbnN1cmUgdGhhdCBpcyB0aGUg
Y2FzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5k
Lm9yZz4KCkFjdHVhbGx5LCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gc2V0IGJ5cGFzcyB0byAweGZm
IGFuZCBpbiAKc3VuNTBpX2lvbW11X2F0dGFjaF9kZXZpY2UoKSBjbGVhciBieXBhc3MgYml0IGZv
ciB0aGF0IHBhcnRpY3VsYXIgZGV2aWNlLiBBcyAKeW91IG1pZ2h0IG5vdGljZSwgaW5kZXggaW4g
cGhhbmRsZSBpcyBjdXJyZW50bHkgbm90IHVzZWQuIFRoaXMgd291bGQgYWxzbyBoZWxwIApleHBv
c2UgYnVncywgbGlrZSBtaXNzaW5nIHNlY29uZCBpb21tdSBjaGFubmVsIGZvciBDZWRydXMgb24g
SDYsIGJ1dCB0aGF0J3MgCmVhc3kgdG8gZml4LgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCj4gLS0t
Cj4gCj4gIGRyaXZlcnMvaW9tbXUvc3VuNTBpLWlvbW11LmMgfCAyICsrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9zdW41
MGktaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvc3VuNTBpLWlvbW11LmMKPiBpbmRleCBlYzA3YjYw
MDE2ZDMuLmI5ZTY0NGI5MzYzNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L3N1bjUwaS1p
b21tdS5jCj4gKysrIGIvZHJpdmVycy9pb21tdS9zdW41MGktaW9tbXUuYwo+IEBAIC0zNzQsNiAr
Mzc0LDggQEAgc3RhdGljIGludCBzdW41MGlfaW9tbXVfZW5hYmxlKHN0cnVjdCBzdW41MGlfaW9t
bXUKPiAqaW9tbXUpCj4gCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmaW9tbXUtPmlvbW11X2xvY2ss
IGZsYWdzKTsKPiAKPiArCWlvbW11X3dyaXRlKGlvbW11LCBJT01NVV9CWVBBU1NfUkVHLCAwKTsK
PiArCj4gIAlpb21tdV93cml0ZShpb21tdSwgSU9NTVVfVFRCX1JFRywgc3VuNTBpX2RvbWFpbi0+
ZHRfZG1hKTsKPiAgCWlvbW11X3dyaXRlKGlvbW11LCBJT01NVV9UTEJfUFJFRkVUQ0hfUkVHLAo+
ICAJCSAgICBJT01NVV9UTEJfUFJFRkVUQ0hfTUFTVEVSX0VOQUJMRSgwKSB8CgoKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
