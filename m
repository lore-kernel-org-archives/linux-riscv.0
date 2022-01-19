Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB283C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WJkqXrEfXmC83ygs4aE28/dQF7fslLrm0ZTr/9FVW0=; b=4dqvi9E3HXS7eV
	cIwptUm8NVY1pJ0W9QF6qXv2NL/4j2KpvreN5cL2oc7rgZ25Sva3ZJ3nt+IoXIfqldVqNPa1ZoTBo
	Y8v6jtbuZac0PedrVZrSnD2EFrD7wPSJTQBX86JuUcr6rK+UGeOM5DwwWfwE8CEIEUtlkfOGJAPaX
	qtIUlCSvA7ktFHfqmh1yDTKRi5ZO/LgEvuaXvkn1I6DqBSAqTID8h8RzUAJC7LP2iymQ8Lh9AGfnn
	XS0VruZqgSKyE6xiKS42MubOzTOrTJgcDhmW9F4XhiTfBKIRX8hwacz6ta6aQ/seQyHNpy0gzbDmh
	qlT8AG4+VQ3g6UQaFifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA8jy-0054Oa-4S; Wed, 19 Jan 2022 11:02:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA8jv-0054Mz-53
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 11:02:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id c2so4654793wml.1
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 03:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=y3GaD+SwN8APMQh031bGmSeVhkIovJ6kmTWH0X4e1qs=;
 b=a6dQ+O363irHUe/2uR6WdKPelWnbsGOe88aYXZJWYu3+R/9z0BBECAZLkfcQyAIb7K
 BuOGMmgyUuAsXMLD7g/PBRldy0iYCslevoNDB9GKInXvWMHAp9ZpbtfoWkVgiRq8np+a
 ES/7nyOiJGW1FiUwq2GKq3n87Nw1OyOCNaLqzWUa6al8gXCelS4Stk4LNgzahgmTLHCP
 tYsEFbjLqH5RqCAkUCl37Y/xgoU7XN4N1rgBXThWeRkntCS8B+51Fjil534FR2DQbH7Y
 3Oukbh2d5EilpYtLc4uiRsX7txttv8BHU5O4v9HhcdNmd5bP4hg5nDZ8sBD5ykU9e1Vz
 dUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=y3GaD+SwN8APMQh031bGmSeVhkIovJ6kmTWH0X4e1qs=;
 b=ZNnXl79A0DZ4JDbrd+kpUArX2YUynlMTm+7tep67VrwES2so6doEx2Fy/9Lu9n1HRy
 GepqhEhZ5jKe646tCTulhCbPncDSIBpfyGcwPUlRZf4jovq4mUJIlmdZVje8LuCn/8SC
 u1So1GZVJxZlrba78CkGSn5DurmhqWaA30KGrYUeVKhbZrGv7CzHkI+y5+RsGmCKin4r
 xxJYXFPNbvPsnrD8VH+olI8yHTuvzQ9Hkg5ZujDmXcgRKcsjA3myVnPamxw+rtvmjsMA
 UfbUJce+yLpEzLGqCR37Z2rRllmzxFL1yLj4cqd6vyVbCy7o3rolTfcTQEnNNOt1bq6Y
 c1aw==
X-Gm-Message-State: AOAM532BfQnRou0AiAV5JDekR5PQEYlXgeOdKb+INNykxLGJhZLsfaEd
 RBcsszWmlgio6H3TWkJPA8qEUg==
X-Google-Smtp-Source: ABdhPJxX7fgAprwygcmLbv/bWso8tv6+jbaJ2Y6smRT4U6jn90jPf3xZUhJtuZxCXWHTGChun0sZpw==
X-Received: by 2002:a1c:a102:: with SMTP id k2mr2688174wme.78.1642590173201;
 Wed, 19 Jan 2022 03:02:53 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net.
 [86.15.223.86])
 by smtp.gmail.com with ESMTPSA id bj6sm313517wrb.48.2022.01.19.03.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 03:02:52 -0800 (PST)
Date: Wed, 19 Jan 2022 11:02:50 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Zong Li <zong.li@sifive.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: sifive: Move all stuff into SoCs header files
 from C files
Message-ID: <Yefv2uFYme4+GDdL@google.com>
References: <cover.1642582832.git.zong.li@sifive.com>
 <70c9317814b06c7ce37688b158178b188d3fd604.1642582832.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70c9317814b06c7ce37688b158178b188d3fd604.1642582832.git.zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_030255_227247_B96B0FDD 
X-CRM114-Status: GOOD (  13.46  )
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

T24gV2VkLCAxOSBKYW4gMjAyMiwgWm9uZyBMaSB3cm90ZToKCj4gSW1wcm92ZSBQUkNJIGRyaXZl
ciB0byByZWR1Y2UgdGhlIGNvbXBsZXhpdHksIHdlIHJlbW92ZSB0aGUgU29DcyBDIGZpbGVzCj4g
YnkgcHV0dGluZyBhbGwgc3R1ZmYgaW4gZWFjaCBTb0NzIGhlYWRlciBmaWxlcywgYW5kIGluY2x1
ZGUgdGhlc2UKPiBTb0NzLXNwZWNpZmljIGhlYWRlciBmaWxlcyBpbiBjb3JlIG9mIFBSQ0kuIEl0
IGNhbiBhbHNvIGF2b2lkIHRoZSBXPTEKPiBrZXJuZWwgYnVpbGQgd2FybmluZ3MgYWJvdXQgdmFy
aWFibGUgZGVmaW5lZCBidXQgbm90IHVzZWQKPiBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XSwg
bGlrZSBjb21taXQgNDg3ZGM3YmI2YTBjICgiY2xrOiBzaWZpdmU6Cj4gZnU1NDAtcHJjaTogRGVj
bGFyZSBzdGF0aWMgY29uc3QgdmFyaWFibGUgJ3ByY2lfY2xrX2Z1NTQwJyB3aGVyZSBpdCdzCj4g
dXNlZCIpIGRvZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUu
Y29tPgo+IFN1Z2dlc3RlZC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiAt
LS0KPiAgZHJpdmVycy9jbGsvc2lmaXZlL01ha2VmaWxlICAgICAgfCAgIDIgKy0KPiAgZHJpdmVy
cy9jbGsvc2lmaXZlL2Z1NTQwLXByY2kuYyAgfCAgODkgLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAg
ZHJpdmVycy9jbGsvc2lmaXZlL2Z1NTQwLXByY2kuaCAgfCAgOTEgKysrKysrKysrKysrKysrKysr
KystCj4gIGRyaXZlcnMvY2xrL3NpZml2ZS9mdTc0MC1wcmNpLmMgIHwgMTM0IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9jbGsvc2lmaXZlL2Z1NzQwLXByY2kuaCAg
fCAxMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIGRyaXZlcnMvY2xrL3NpZml2
ZS9zaWZpdmUtcHJjaS5jIHwgICA1IC0tCj4gIDYgZmlsZXMgY2hhbmdlZCwgMjE0IGluc2VydGlv
bnMoKyksIDIzNyBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xr
L3NpZml2ZS9mdTU0MC1wcmNpLmMKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3Np
Zml2ZS9mdTc0MC1wcmNpLmMKClRoaXMgaXMgdGhlIHNvcnQgb2YgdGhpbmcgSSB3YXMgYWZ0ZXIu
CgpUaGlzIHBhdGNoIGF0IGxlYXN0IExHVE0uCgpSZXZpZXdlZC1ieTogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KUHJpbmNpcGFsIFRl
Y2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
