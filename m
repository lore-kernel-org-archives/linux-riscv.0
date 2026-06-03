Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753ECCD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 20:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jC4wpXYCxQFwFcuKa7OTNgscyl4BCK49LhLsLqaAXhs=; b=N55bltxU7RVPLN
	fJ4ff4bsIYKYAn3wetQCprclL2d3ttO6LYlgF60ddssFAmWj9NKo/fisI/uzLharArA+bYrZAhwp3
	SRl3H51jyT7tuy5umMaxwd1uIs/CMSB0bJNqVoMTqwA4QV9cUB02zrXV4yrOlQBRu9p4VCIWX/T0s
	X/EYZvyRBrdPdTxtUSn4yEfGR22w6ApdoOdLoZctwj+M3RccDBaZyrd6XmL5ellZjwgkT7eJZbZyE
	z6dkBzchZfyfk/5eX1y9qrgLb3XsRqh4VnTetZfN2SRrOUA1AN0Fv/AimxTvdoc246ZMlTmus06LH
	mceGMjo7eUVOt+PoL03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsUV-0000000FoWN-0zN4;
	Wed, 03 Jun 2026 20:47:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsUS-0000000FoVh-3kTd;
	Wed, 03 Jun 2026 20:47:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 961B743B3E;
	Wed,  3 Jun 2026 20:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470E71F00893;
	Wed,  3 Jun 2026 20:47:02 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id BDB17180C6E; Wed, 03 Jun 2026 22:46:59 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hans de Goede <hansg@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Yixun Lan <dlan@kernel.org>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Amit Sunil Dhamne <amitsd@google.com>, Samuel Kayode <samkay014@gmail.com>, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 asahi@lists.linux.dev, imx@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>
In-Reply-To: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
Subject: Re: (subset) [PATCH v1 0/6] power: Use named initializers for
 platform_device_id arrays
Message-Id: <178051961974.2666348.7125017575893735399.b4-ty@collabora.com>
Date: Wed, 03 Jun 2026 22:46:59 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_134704_951263_A70ABBDB 
X-CRM114-Status: GOOD (  12.45  )
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

Ck9uIEZyaSwgMjkgTWF5IDIwMjYgMTI6MTg6MTUgKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIChU
aGUgQ2FwYWJsZSBIdWIpIHdyb3RlOgo+IHRoaXMgc2VyaWVzIHRhcmdldHMgdG8gdXNlIG5hbWVk
IGluaXRpYWxpemVycyBmb3IgcGxhdGZvcm1fZGV2aWNlX2lkCj4gYXJyYXlzLiBJbiBnZW5lcmFs
IHRoZXNlIGFyZSBiZXR0ZXIgcmVhZGFibGUgZm9yIGh1bWFucyBhbmQgbW9yZSByb2J1c3QKPiB0
byBjaGFuZ2VzIGluIHRoZSByZXNwZWN0aXZlIHN0cnVjdCBkZWZpbml0aW9uLgo+IAo+IFRoaXMg
cm9idXN0bmVzcyBpcyBuZWVkZWQgYXMgSSB3YW50IHRvIGRvCj4gCj4gCWRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9tb2RfZGV2aWNl
dGFibGUuaAo+IAktLS0gYS9pbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oCj4gCSsrKyBi
L2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmgKPiAJQEAgLTYxMCw0ICs2MTAsNyBAQCBz
dHJ1Y3QgZG1pX3N5c3RlbV9pZCB7Cj4gCSBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2lkIHsKPiAJ
CWNoYXIgbmFtZVtQTEFURk9STV9OQU1FX1NJWkVdOwo+IAktCWtlcm5lbF91bG9uZ190IGRyaXZl
cl9kYXRhOwo+IAkrCXVuaW9uIHsKPiAJKwkJa2VybmVsX3Vsb25nX3QgZHJpdmVyX2RhdGE7Cj4g
CSsJCWNvbnN0IHZvaWQgKmRyaXZlcl9kYXRhX3B0cjsKPiAJKwl9Owo+IAkgfTsKPiAKPiBbLi4u
XQoKQXBwbGllZCwgdGhhbmtzIQoKWzEvNl0gcG93ZXI6IERyb3AgdW51c2VkIGFzc2lnbm1lbnQg
b2YgcGxhdGZvcm1fZGV2aWNlX2lkIGRyaXZlciBkYXRhCiAgICAgIGNvbW1pdDogNzVhMGUxZTBi
ODYwNzg2ODdjM2M2YTA1MTA3YTk4YzdlNTlhNjVhOApbMi82XSBwb3dlcjogc3VwcGx5OiBtYXgx
NDU3NzogRHJvcCBkcml2ZXIgZGF0YSBpbiBvZiBhbmQgcGxhdGZvcm0gZGV2aWNlIGlkIGFycmF5
cwogICAgICBjb21taXQ6IDM3MjU4YWQxZjNhNTJlYTQ0MmMzMmIzYzkyYWQ3MTQ2ZTc0MDUwYzcK
WzQvNl0gcG93ZXI6IFVzZSBuYW1lZCBpbml0aWFsaXplcnMgZm9yIHBsYXRmb3JtX2RldmljZV9p
ZCBhcnJheXMKICAgICAgY29tbWl0OiBlMjhmNzQ5OGRkODE5ODc4YjhhY2FjYjg5YzRjMDczYTY0
NmZlZWEwCls1LzZdIHBvd2VyOiBzdXBwbHk6IG10NjM2MF9jaGFyZ2VyOiBVc2Ugb2YgbWF0Y2gg
dGFibGUgdW5jb25kaXRpb25hbGx5CiAgICAgIGNvbW1pdDogZWI3ZWQ2NTBlNTk2MGZjMzAzMTMw
NzA0ZDFlMjlkMThhN2QwZTFkZgpbNi82XSBwb3dlcjogVW5pZnkgY29kZSBzdHlsZSBmb3IgcGxh
dGZvcm1fZGV2aWNlX2lkIGFycmF5cwogICAgICBjb21taXQ6IGUzZjY2OWJlZDMyMjg3YWU3MmMw
NWE0ZGRhYjRhNjY4N2IwZTYyY2EKCkJlc3QgcmVnYXJkcywKLS0gClNlYmFzdGlhbiBSZWljaGVs
IDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
