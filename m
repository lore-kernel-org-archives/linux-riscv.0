Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225BDC10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 08:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RBz9yS+2WJA8IjsWQfJI3E3v64If4mqvK4vWluGJhA=; b=UjmObjreiusM92
	vu4cxyJKFmZPSzb6H0BylNU1Pb5PZldo1HpkZPKqeOq/1rFuVRL9PszsIjxtLaWBrC1kF4gZkXMWY
	Gy40NbzUMnSgUVK8t4J8F8FOH3+LIPJCutqFo7U2mx+uk/HvU9dEz4JSNF7fBWeaY43y65T1wVJUf
	BTawLd6mqFqCCDA7uyV350G7M2Ww7o2+HDRSSLia1SfnfOcroDZNJbD5FkYApVP/KdyANAGCa28px
	OA42s8xndqVbqDN6A/Urph4x9YNYB9KgIojrypPIN17eJJRSp5wMdUkdOYv76JJwOQ7Vi4ctKGemm
	sPhvRpDdnTWdrFUQEgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oDx-0000000FdNG-0bb7;
	Fri, 03 May 2024 08:24:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oDt-0000000FdLW-1kte;
	Fri, 03 May 2024 08:24:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8CE3FCE188F;
	Fri,  3 May 2024 08:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7177C116B1;
	Fri,  3 May 2024 08:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714724690;
	bh=8krA6oPxNixCEtNeNzJAv63F5yfpATT0K9/1XWZCeGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rtg4hZx0dy65+Q3VXMkenm1Z4XbllBwBQU1G2FH2aWOQA/whveWb+LPEE8q9oMiqv
	 GJsAbw8RC2yAbObkT+EzxykcFeEGtq+jOZZSIB62WX51Wwq4xlKgyvvzKWBpQOcCvT
	 fRYkQ+tuOSBUCM6XKm5p96ollDIJE9kIgAJ1136y+91fqsp98csZpqctDViKcQcmX3
	 89JJYyVykEuTmthi6lRYKmiU8i2rPH/LkR54VUZda43brEyTwvyc1ayuTOFE40cDyJ
	 Ba9MVPkLepzSDiWrmAEZWovdIOOwSQdJfS1PjTlETIJpvLYqn/tMO247hOH3+ClBlH
	 Tp+ZV4MWejNhw==
Date: Fri, 3 May 2024 09:24:44 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: mfd: Use full path to other schemas
Message-ID: <20240503082444.GJ1227636@google.com>
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
 <a2886f72-210e-41a1-aae0-c079a4d11396@linaro.org>
 <0af10387-ddfb-47b0-b59e-eeba1644be1c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0af10387-ddfb-47b0-b59e-eeba1644be1c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_012453_659715_A50CCDDD 
X-CRM114-Status: UNSURE (   8.19  )
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

T24gRnJpLCAwMyBNYXkgMjAyNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gT24gMDMv
MDUvMjAyNCAxMDowOCwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiA1LzMv
MjQgMDg6MjEsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPj4gIC4uLi9iaW5kaW5ncy9t
ZmQvc2Ftc3VuZyxzMm1wYTAxLnlhbWwgICAgICAgICB8ICAyICstCj4gPj4gIC4uLi9iaW5kaW5n
cy9tZmQvc2Ftc3VuZyxzMm1wczExLnlhbWwgICAgICAgICB8IDEyICsrLS0tCj4gPj4gIC4uLi9i
aW5kaW5ncy9tZmQvc2Ftc3VuZyxzNW04NzY3LnlhbWwgICAgICAgICB8ICA0ICstCj4gPiAKPiA+
IFJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4g
Cj4gU28gdGhpcyBzaG91bGQgYmUgQWNrLiBZb3UgY2Fubm90IHJldmlldyBwYXJ0IG9mIHRoZSBw
YXRjaCAoIkkgaGF2ZQo+IGNhcnJpZWQgb3V0IGEgdGVjaG5pY2FsIHJldmlldyBvZiB0aGlzIHBh
dGNoLi4uIikuCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuOC1yYzUvc291
cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0CgpSZXZpZXdl
ZC1ieSBpcyB0b3RhbGx5IGFwcHJvcHJpYXRlIGhlcmUuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzm
lq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
