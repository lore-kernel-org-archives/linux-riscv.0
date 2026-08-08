Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574F9C55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6Xt7OTFlHfpZ8/pBFaSBYt2onbZvVPuOUkjc5SMU2g=; b=xHpJF3YoyPIX+5
	2a6r97KqjPeL28ZvJT8RJ1vlBQPBK/ULtT0hZ7vg6k5XMFzJK5fgj1Zkx3uqYrwQfi3evlIneNdKZ
	/gNU+mvl7pV4CRzeQKeW6S7EeLdXp97lSFx5ZzGWSkH/zNwuqY8UjoLFg/DeLMirQemCR7gyUJuUl
	pJKmg9OA1YZS6jTomObeh/esu4tJ4CRsfHkrK6FuA/dNS+QqRYk54LEr2McamhSzN4TIg9Zx6f9nN
	3eL9Z0WKSEGgfhLzcFxrM2lLpwR1XQFkJztEC4RAmkXTI8G0UbRKZ3in+F4PJuSUdMz6K1+ZW4QEz
	ixJ6L11U+zEbQ/1AZtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshom-00000009RQQ-1i9j;
	Sat, 08 Aug 2026 14:14:32 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshoj-00000009RPh-3hM0
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 14:14:31 +0000
Received: by mail-pj2-x0a.google.com with SMTP id d9443c01a7336-2cf49dc298bso4932935ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Aug 2026 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786198469; x=1786803269; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cRCYRkrqsjrsSzRNFotYZZ98meWVRPcoRMuLiucayfo=;
        b=GPdeNM9+2mvsqviu7qFz3LsNv7LjUsnTJtMFGeBc7IcZAZBLkdrIwgVfIrp0kK2QYB
         XSDBB1+WqtEOkPMDmXP5gRusWF2lUfks659X3n0UTKoyC1VI8Ccu7AQ5aLfkx0eYQIfj
         fsOg9BaGMCXDOg3bnmvFaaRoK3U1/mT4o0wzKOF/rUKXuKpzTT6/1L9HKnqdMv8Ut+yI
         WzaBKyKQRxArmxZx+lfAqBGouE0jUzDJVRa1YqPm0YrD9cv/Q+ll6qtZmTbP9M7n/Oi7
         setgE6eu4gVMCmlXyfSn9JEU1FI2fUF7QJS87CCRg+VpL3dwCzWmnaQ15AdiG6lMche0
         1u1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786198469; x=1786803269;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRCYRkrqsjrsSzRNFotYZZ98meWVRPcoRMuLiucayfo=;
        b=s8rYsD+UI3d+Fhcze1TrzaP4s8tPpjmDg1ivJJyuL2wI1dGS44nRWu7fcxV0j/AkMv
         d1iAubPxqz/v/t5257ryl+fwuW6OJHGtQAReuAwRSpM62Y8V4X01LKrViHqg4QeZWR9T
         mwbEerf5QLRK1+koxr3ZpCK1rbtOtcH/VD5jDhabq2pP6mzxfodyxK4Ja1RCA17JOxca
         eeLQlABqe9G7wQBvhYVpMelqf968BIT9Xw6bG4bqmjdLKtagmfyIUw4rwXFHqkggVztN
         xQ5QglymowHmaX7evaXy1YFXkERn0+qH399J5HNIRtDL3+UjGZKPl1WKHbuF9MZneB+Q
         l1oA==
X-Forwarded-Encrypted: i=1; AHgh+Rr78aEevIF4dGQlBY2MAH60iNePs4fuIjtc3O8F0fZiZi8ffBGfwJ+JUXb8GS1dFsDyAByw3qQrg8LpFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt4mj0s9g9Dqw0im4PZF3R/JoKQfM9dijOtNVoEHHBc+6gu7sq
	ZAUYF3bqXCKHLCDbXT/i3rACsuen+Rn882hizyjSSVkweLOytvYTXJzm
X-Gm-Gg: AR+sD12plOOYd4oSxMtghvnjkrQRwTI+EDAKnPC4/J8+lYzdSXlX2nzIcJd5fULEvlm
	uoVRtUc1B8v9SgL0oZQUSjmSAaGjxNRQ9PPHzzB7zJw1qt4mRKE/wLR4DMLFk5O8yF5eofgA1u6
	rvCXK3FyABC+jso0Rjiv3dzWoq1Epxcg09PQG8CqnKHL25+GXR0eaXZ9DpZdqNK0ZZWzksmQlG/
	c/Lww5wJkGaKGb8jp8nwaN3ehcY1Cmfa7knpLqYQtk2EvAvjIq+rVKG4Q6xBzDxlyuwn6rSYQzb
	PDNBb0FWNdQ3oa7m//LHGyxDre10nk4FY0qwoSRa6/+UdWztr5Llg6LPYwBOF/nirbmGD4Aee3v
	7n2Mjwu0OooxOduFntFGRMRESXe3dLoKTvRRLlYx2UzC4eV1WGzLzrr2Tlz5Xs1xRfMNOCCz/Hk
	3GsuFqZ7B+Cj7NxNy5HwTHBc12UCjcx+OjfEx4Nvo=
X-Received: by 2002:a17:903:f90:b0:2c9:b2c1:13ec with SMTP id d9443c01a7336-2d294c225a1mr141926765ad.11.1786198469018;
        Sat, 08 Aug 2026 07:14:29 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbeaa7bsm19180265ad.41.2026.08.08.07.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:14:28 -0700 (PDT)
Date: Sat, 08 Aug 2026 22:14:25 +0800
Message-ID: <16421007bf6b2a251ccf51cbb5bf3694.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
In-Reply-To: <amnzTxDYtSBojHdY@monoceros>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-5-6de34d80e86c@gmail.com>
 <amnzTxDYtSBojHdY@monoceros>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_071429_920318_2044AA14 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

SGkgVXdlLAoKT24gV2VkLCAyOSBKdWwgMjAyNiAxNDozNjozMSArMDIwMCwgVXdlIEtsZWluZS1L
w7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4KPiBPbiBTYXQsIEp1bCAyNSwgMjAyNiBhdCAxMjo1MTox
NEFNIC0wNDAwLCBDb2R5IEthbmcgdmlhIEI0IFJlbGF5IHdyb3RlOgo+ID4gKyNpbmNsdWRlIDxs
aW51eC9tb2RfZGV2aWNldGFibGUuaD4KPiA+IFsuLi5dCj4gPiArI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RldmljZS5oPgo+Cj4gPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPiBhbHJlYWR5IG1h
a2VzIHN1cmUgdGhhdCBvZl9kZXZpY2VfaWQKPiBpcyBhdmFpbGFibGUgYW5kIDxsaW51eC9tb2Rf
ZGV2aWNldGFibGUuaD4gd2lsbCBnbyBhd2F5IHNvb24uCj4KPiBTbyBwbGVhc2UgZHJvcCB0aGUg
bGF0dGVyICNpbmNsdWRlLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBXaWxsIGRvIGluIHYyLgoK
Q29keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
