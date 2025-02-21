Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F39AC021B5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cw3E0xKFrBFpS7N0Z0CivtmbTud7mZ7f/zEionloN7U=; b=skuS4bRLjEuSyA
	yeH7HIpTAy8DNONDxn9IsjKaamx6fsGV1O/G7btdpf3yF5lhfB86hzTAw/lX9UFiGRzkA6vnJxeLs
	FZQVy1EXa0dafYwi4uDwfrGTeqpGWT9GwBROdTfH2NqptIxwwjV1qFyuSAHW2oQs0VuXQQzEcXv7Y
	ieLj0h5G08xKdkHDoCMMGYg9n8DNPJpPZYDUz/fqETrb3uE+1BtzpsAujKyLvO/CfrqkWYh5WzsMj
	golVlNK6e0w63Z2HfLhJcFWQY0oY+AoVhBEOh0OVwDTsqdq52b6bvS00OtOXitfn0wbKwvL5An3Hx
	f0wLkDVuUa74ijqDCc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVpC-00000006AJY-4C1q;
	Fri, 21 Feb 2025 16:24:27 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVj3-000000068Jk-2Xkz;
	Fri, 21 Feb 2025 16:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U2i+tFSML7sT+8AM5vIWnSdSP/UjJ3mmCMahXU8/Uc0=; b=p1pGOIC5KroF7U+KU+hMlEUo2p
	gChyrkqBaGtW4djBrZcHJhS7RQ5U87eV3gBR0dq7UttRIsAgWjI6xO3/nqnC4b+SKV8QeQEBlaB3C
	swS5I8XmqwD65u1uZ9rcwEblo7RAuCroiAnfp0t7tPZKL+1upBfmtIkjLuwF8ZS3GvYJaQ9jwfoN5
	CCLk37otP528jmLS1hF5EZyU/apPvK46QKaH91zhQGFWYWoJi+yJyZaNvqPB6CudOEUmG2EMT+YR0
	ErHfYDXNJIrtLZWcnMSLIQ7bghLo3J6Ot8WpQ1lEID/GBdBcllqj5ifmla+CDnOoy0piCwj3LFNtu
	7/aU6zCQ==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96-58-g4e9ed49f8)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1tlViv-00AOLX-34;
	Fri, 21 Feb 2025 17:17:58 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/sun4i: Enable LVDS output on sun20i D1s/T113
Date: Fri, 21 Feb 2025 17:17:49 +0100
Message-Id: <20250221161751.1278049-4-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_081805_802983_7E7CD6E7 
X-CRM114-Status: GOOD (  11.17  )
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

VGhlIEFsbHdpbm5lciBEMXMvVDExMyBuZWVkcyB0byB1c2UgdGhlIGNvbWJvIEQtUEhZIHRvIGVu
YWJsZSBMVkRTCm91dHB1dC4KCkVuYWJsZSBMVkRTIHN1cHBvcnQgaW4gdGhlIFRDT04gYW5kIGNv
bmZpZ3VyZSBpdCB1c2luZyB0aGUgUEhZLgoKU2lnbmVkLW9mZi1ieTogS3ViYSBTemN6b2RyennF
hHNraSA8a3ViYUBzemN6b2Ryenluc2tpLnBsPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW40aV90Y29uLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMjggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW40aV90Y29uLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCmluZGV4
IGNjZjMzNWE2MS4uNTgyMzBhNTUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfdGNvbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKQEAg
LTE3MSw2ICsxNzEsMzAgQEAgc3RhdGljIHZvaWQgc3VuNmlfdGNvbl9zZXR1cF9sdmRzX3BoeShz
dHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwKIAkJCSAgU1VONklfVENPTjBfTFZEU19BTkEwX0VOX0RS
VkQodmFsKSk7CiB9CiAKK3N0YXRpYyB2b2lkIHN1bjIwaV90Y29uX3NldHVwX2x2ZHNfZHBoeShz
dHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwKKwkJCQkJY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyICpl
bmNvZGVyKQoreworCXVuaW9uIHBoeV9jb25maWd1cmVfb3B0cyBvcHRzID0geyB9OworCisJaWYg
KCF0Y29uLT5xdWlya3MtPmhhc19jb21ib19kcGh5IHx8ICF0Y29uLT5kcGh5KQorCQlyZXR1cm47
CisKKwlwaHlfaW5pdCh0Y29uLT5kcGh5KTsKKwlwaHlfc2V0X21vZGUodGNvbi0+ZHBoeSwgUEhZ
X01PREVfTFZEUyk7CisJcGh5X2NvbmZpZ3VyZSh0Y29uLT5kcGh5LCAmb3B0cyk7CisJcGh5X3Bv
d2VyX29uKHRjb24tPmRwaHkpOworfQorCitzdGF0aWMgdm9pZCBzdW4yMGlfdGNvbl9kaXNhYmxl
X2x2ZHNfZHBoeShzdHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwKKwkJCQkJICBjb25zdCBzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIpCit7CisJaWYgKCF0Y29uLT5xdWlya3MtPmhhc19jb21ib19k
cGh5IHx8ICF0Y29uLT5kcGh5KQorCQlyZXR1cm47CisKKwlwaHlfcG93ZXJfb2ZmKHRjb24tPmRw
aHkpOworCXBoeV9leGl0KHRjb24tPmRwaHkpOworfQorCiBzdGF0aWMgdm9pZCBzdW40aV90Y29u
X2x2ZHNfc2V0X3N0YXR1cyhzdHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwKIAkJCQkgICAgICAgY29u
c3Qgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAogCQkJCSAgICAgICBib29sIGVuYWJsZWQp
CkBAIC0xNTUwLDggKzE1NzQsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdW40aV90Y29uX3F1
aXJrcyBzdW45aV9hODBfdGNvbl90dl9xdWlya3MgPSB7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c3VuNGlfdGNvbl9xdWlya3Mgc3VuMjBpX2QxX2xjZF9xdWlya3MgPSB7CiAJLmhhc19jaGFubmVs
XzAJCT0gdHJ1ZSwKKwkuaGFzX2NvbWJvX2RwaHkJCT0gdHJ1ZSwKKwkuc3VwcG9ydHNfbHZkcwkJ
PSB0cnVlLAogCS5kY2xrX21pbl9kaXYJCT0gMSwKIAkuc2V0X211eAkJPSBzdW44aV9yNDBfdGNv
bl90dl9zZXRfbXV4LAorCS5zZXR1cF9sdmRzX3BoeQkJPSBzdW4yMGlfdGNvbl9zZXR1cF9sdmRz
X2RwaHksCisJLmRpc2FibGVfbHZkc19waHkJPSBzdW4yMGlfdGNvbl9kaXNhYmxlX2x2ZHNfZHBo
eSwKIH07CiAKIC8qIHN1bjRpX2RydiB1c2VzIHRoaXMgbGlzdCB0byBjaGVjayBpZiBhIGRldmlj
ZSBub2RlIGlzIGEgVENPTiAqLwotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
