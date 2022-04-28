Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B83C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 05:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ld0D6ZL4xaEUqZP1aWxm0yW+XnYAUnZXNcApAdpKjg8=; b=kZR16A1otmU24M
	m5j4Vez+Jr7SbaROlRMHGYXCUnmtt/NE03S5U7qjs7AbkzXlmZeVZlRSh3csK+wJH2hpk0i/86Qey
	c0G364gCi9dm4HgS5FGAx0TWLQo+5ySusDXRu/vULMYdzSXJRo2HTkExog4704d5ehIjHSbN2xEmJ
	/Z7RdoFLpi9AusEVaB9OXaDZdl4sqS7ARAd5vFYXHn37wFrVVeCoGfFoJBdQcqi2C0/MKf/d3Egrk
	FeIWYkOvGSOdo78UGunYLFYRZEDSnniwROgzPH7ed9LtbzHGGtQx+u30b8N2l2syuSoSjtzuy3buK
	o59i2JhdcnTDvHUrttYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njwyJ-004lwh-NP; Thu, 28 Apr 2022 05:45:47 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njwy9-004ltH-2j; Thu, 28 Apr 2022 05:45:38 +0000
Received: by mail-ed1-x52a.google.com with SMTP id g23so4223076edy.13;
 Wed, 27 Apr 2022 22:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bu1Am+mfc3RBLLJSWrxdM96hFXnw6XnAcu5xdCKTnQI=;
 b=U8hjzI4Jj09EF12s/5KD7XD/HAE5Z7zNZb7gWS9RHKNUrA2CWF+gTT/vZIv/5/mhc8
 4CJxJzlpSuKkDLHXEFMJRhg5iJCgsDrfAdB73ODHYREydYyubRYogza60y9tDwkqlHBy
 SAktsXiJBe+UBiaDkVc07s13Q/ReWDb0YAepyD0q6JPZc/mM+DuZhxVMk6wAXXFpXeIU
 GHGAyDXMSXzV/NlvvE/4Lk43zpBEXxm/LGkQVW16movp2IxXsMjwLSHD5rRbgP640tbP
 f0jsF/V5y+V4YOhKhPSv2HTyEacDMCqakP2v9tx9Obee8bSz44ZVXJf/94aed8paCPST
 5pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bu1Am+mfc3RBLLJSWrxdM96hFXnw6XnAcu5xdCKTnQI=;
 b=gFh5rPpPGKcd3PGwM2KvVsoxmnZZ0HBv8VWvyVCpFcZ7LN4EU0k6ulqi9DaslOPfKq
 SKEkHiYVNsi0DLGGPQdlPWgoZIIv84+Ba9l7sdl8owoumo0GgO3VDVxoxM4YhpyF6k/D
 94jXHFiIjbzYteEPFPGxtpc5T7XjNKDBhFZ795/G3i14HqFWkA2XjKNIeh+W+swsxQVa
 sWlAzETRXl5AiWGOhvtp2aDoZsCWuiaDc2cYwqkUu5H6kUz2LseuIL9zMPeTJHevDM9m
 2iyklHtnv/6JYk7rqhbKY9Q5xoCf0/uK+BEYIichuMHZy+expO+jWzT5piilJ0RKm7bn
 LqdQ==
X-Gm-Message-State: AOAM531fuKDLGznqwdBlrUkcDmOVe3GlW4jEftEcAxeRNo0DK6BPwn5y
 6UQVvdtFUBt+M+VngQdiUD0=
X-Google-Smtp-Source: ABdhPJxIesueP7mEJQ7cfZ1GF83jwnUH9gcTViGICL1YvhcSy1woJt6erlqveaurraCCU9ukUVTVCw==
X-Received: by 2002:a50:d79a:0:b0:425:e577:c71a with SMTP id
 w26-20020a50d79a000000b00425e577c71amr20815339edi.188.1651124734847; 
 Wed, 27 Apr 2022 22:45:34 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 z14-20020a170906944e00b006f38c33b6e3sm5970246ejx.68.2022.04.27.22.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 22:45:34 -0700 (PDT)
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
Subject: Re: [PATCH 0/5] iommu/sun50i: Allwinner D1 support
Date: Thu, 28 Apr 2022 07:45:33 +0200
Message-ID: <1849776.IobQ9Gjlxr@jernej-laptop>
In-Reply-To: <20220428010401.11323-1-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_224537_157675_AD714E54 
X-CRM114-Status: GOOD (  22.61  )
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

SGkgU2FtdWVsIQoKRG5lIMSNZXRydGVrLCAyOC4gYXByaWwgMjAyMiBvYiAwMzowMzo1NSBDRVNU
IGplIFNhbXVlbCBIb2xsYW5kIG5hcGlzYWwoYSk6Cj4gRDEgaXMgYSBSSVNDLVYgU29DIGZyb20g
QWxsd2lubmVyJ3Mgc3VueGkgZmFtaWx5LiBUaGlzIHNlcmllcyBhZGRzIElPTU1VCj4gYmluZGlu
ZyBhbmQgZHJpdmVyIHN1cHBvcnQuCj4gCj4gT25lIHBpZWNlIGlzIHN0aWxsIG1pc3NpbmcgdG8g
dXNlIHRoZSBJT01NVSBmb3IgRE1BIGFsbG9jYXRpb25zOiBhIGNhbGwKPiB0byBpb21tdV9zZXR1
cF9kbWFfb3BzKCkuIE9uIEFSTTY0IHRoaXMgaXMgaGFuZGxlZCBieSB0aGUgYXJjaGl0ZWN0dXJl
J3MKPiBjb2RlLiBSSVNDLVYgZG9lcyBub3QgY3VycmVudGx5IHNlbGVjdCBBUkNIX0hBU19TRVRV
UF9ETUFfT1BTLCBidXQgaXQKPiB3aWxsIG9uY2UgWmljYm9tIHN1cHBvcnRbMV0gaXMgbWVyZ2Vk
Lgo+IAo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIyMDMwNzIyNDYyMC4x
OTMzMDYxLTItaGVpa29Ac250ZWNoLmRlLwo+IAo+IFNvIEkgY2Fubm90IGZvbGxvdyB2aXJ0aW8t
aW9tbXUuYyBhbmQgY2FsbCBpb21tdV9zZXR1cF9kbWFfb3BzKCkgd2hlbgo+IEFSQ0hfSEFTX1NF
VFVQX0RNQV9PUFM9bi4gSG93ZXZlciwgaWYgSSBhcHBseSB0aGUgZm9sbG93aW5nIHBhdGNoIG9u
IHRvcAo+IG9mIEhlaWtvJ3Mgbm9uLWNvaGVyZW50IERNQSBzZXJpZXMsIHRoZSBkaXNwbGF5IGVu
Z2luZSBzdWNjZXNzZnVsbHkgdXNlcwo+IHRoZSBJT01NVSB0byBhbGxvY2F0ZSBpdHMgZnJhbWVi
dWZmZXI6CgpEaWQgeW91IHRlc3QgdGhpcyBvbiBhbnkgb3RoZXIgZGV2aWNlIHRoYW4gZGlzcGxh
eSBwaXBlbGluZT8gSXQgc2hvdWxkIGJlIApzdXBwb3J0ZWQgYnkgQ2VkcnVzIHRvbywgcmlnaHQ/
IEkgdGhpbmsgdGhlcmUgYXJlIHN0aWxsIHNvbWUgY29ybmVyIGNhc2VzIHRvIApmaXggb24gQ2Vk
cnVzIGJlZm9yZSBJT01NVSBmdWxseSB3b3Jrcy4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgo+IAo+
IC0tLSBhL2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKPiArKysgYi9hcmNoL3Jpc2N2
L21tL2RtYS1ub25jb2hlcmVudC5jCj4gQEAgLTYsNiArNiw3IEBACj4gICAqLwo+IAo+ICAjaW5j
bHVkZSA8bGludXgvZG1hLWRpcmVjdC5oPgo+ICsjaW5jbHVkZSA8bGludXgvZG1hLWlvbW11Lmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwLW9wcy5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW0u
aD4KPiAKPiBAQCAtNTMsNCArNTQsNyBAQAo+ICB7Cj4gIAkvKiBJZiBhIHNwZWNpZmljIGRldmlj
ZSBpcyBkbWEtY29oZXJlbnQsIHNldCBpdCBoZXJlICovCj4gIAlkZXYtPmRtYV9jb2hlcmVudCA9
IGNvaGVyZW50Owo+ICsKPiArCWlmIChpb21tdSkKPiArCQlpb21tdV9zZXR1cF9kbWFfb3BzKGRl
diwgZG1hX2Jhc2UsIGRtYV9iYXNlICsgc2l6ZSAtIDEpOwo+ICB9Cj4gCj4gCj4gU2FtdWVsIEhv
bGxhbmQgKDUpOgo+ICAgZHQtYmluZGluZ3M6IGlvbW11OiBzdW41MGk6IEFkZCBjb21wYXRpYmxl
IGZvciBBbGx3aW5uZXIgRDEKPiAgIGlvbW11L3N1bjUwaTogU3VwcG9ydCB2YXJpYW50cyB3aXRo
b3V0IGFuIGV4dGVybmFsIHJlc2V0Cj4gICBpb21tdS9zdW41MGk6IEVuc3VyZSBieXBhc3MgaXMg
ZGlzYWJsZWQKPiAgIGlvbW11L3N1bjUwaTogQWRkIHN1cHBvcnQgZm9yIHRoZSBEMSB2YXJpYW50
Cj4gICBpb21tdS9zdW41MGk6IEVuc3VyZSB0aGUgSU9NTVUgY2FuIGJlIHVzZWQgZm9yIERNQQo+
IAo+ICAuLi4vaW9tbXUvYWxsd2lubmVyLHN1bjUwaS1oNi1pb21tdS55YW1sICAgICAgfCAxNiAr
KysrKysrKysrKy0tCj4gIGRyaXZlcnMvaW9tbXUvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAxICsKPiAgZHJpdmVycy9pb21tdS9zdW41MGktaW9tbXUuYyAgICAgICAgICAgICAg
ICAgIHwgMjQgKysrKysrKysrKysrKysrKystLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDM3IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
