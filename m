Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7398ECD4F3E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCa8DoZyXgU7hJH6Vzq+cAtf07eqg0k2SKRAEAmjRTw=; b=PGlwS21iCKer4J
	kz7NvDIVLPTtVK25UnefwcBUYeVIpOgXHbf0NYsGWoYd+D+kLxJqqig0jREMCRfJh0GRy5Cbb3mFr
	5mmR6934ViCz2UsNnm8+IKbPp32/4w0q5/BhivXjSZsjzbo9L+HSiphU/vIgv1rLPKYY2ic/IQ6LR
	5xVKiRJaDVNg9HoW3n//6uPnfsNn2NDdt5XnHtwQ5lkjGABtMPt+y2xHbMdRdojGxJPvCgKFnYnSv
	WKm9xFoEiqjhxrVqZqZq3EGzNjACZFiaOEbNV6wB+5Yi9dQC9vh0GoXg16h7YP8RB8bYAMGengwG1
	i9I2J/tQ9DaI5Y7OcIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd7M-0000000EhOY-2lXO;
	Sun, 16 Nov 2025 13:48:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd7K-0000000EhNw-3vDG;
	Sun, 16 Nov 2025 13:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AnluJ6Mta9yYcmtq3aOb9bOnNMSPyiKv709+YjBCRsY=; b=OFvZOyOKDusFJSIWZNAudkFddq
	y/N/VB24sCO39CkIX/3Kv5QlEXldmhN88HPkJJHSMpOAonxs2TcxhcXSQntY+Yzi1hRVhkCZ0ab7W
	JdrlA3L0EnvA83hAwREWaC1gFlCa540nGRNsvGBUWcu1Nqn+lAlPUufkFGSCJOsU8KBl3BNIG+HVD
	yYwwBgpLnMWcne0PAZhrap34a1lzAkufaGkY8mrxQ2dhURQ8WsjBNZiTs1nW4ruvfSB87ImXpDlls
	XNvh1snQhCejB8CQ39ctx+5zW6aG6+0ZmDTE11B4JohlnGxeAcgoqHEBmiH3y5P322yAnTsktiWIx
	4WjDR3JQ==;
Received: from s2.avantea.pl ([46.242.128.95])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcFd-00000005M4q-3T8u;
	Sun, 16 Nov 2025 12:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AnluJ6Mta9yYcmtq3aOb9bOnNMSPyiKv709+YjBCRsY=; b=vmNalNjfG+z3PNdpOoQ5ip9Eas
	7XMmR+waCSwCZOHwa6EECAbFYPGNTicbyAkCAAasLQTeNDRmPkUxO1vJ/lNQbSQ3YAc2fdIUAAjDa
	k5lMuc3LuK1ioLmUz1xM490yb0CnRKcgwkqF1kKVU8fsRZrRLR4jxKDh+A0HxrCvu2bJwk6M/ok9q
	DxVa934oFRRjsas1CDniLrbmQakKsb6VxRcHfrhkIGNiosZ/uVQEMySntgDuAjTPpKJmuk3HZ/6yo
	sC60wT6EOb1PdXaoJeJ+RWj4nsekYAaGab09cKt7IVu5cB1x+pcI+h6oSeU5Q53FSksx9tNx7KFSR
	wN1Gc8hg==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKd7C-0000000FXPA-2jbh;
	Sun, 16 Nov 2025 14:48:26 +0100
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
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v3 2/6] drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
Date: Sun, 16 Nov 2025 14:48:21 +0100
Message-Id: <20251116134821.447272-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_125305_987259_A01322FC 
X-CRM114-Status: GOOD (  17.56  )
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

T24gQWxsd2lubmVyIGNoaXBzIHdpdGggYSBjb21ibyBELVBIWSwgdGhlIFRDT04gTENEMCBzaG91
bGQgZmV0Y2ggaXQKZnJvbSBkZXZpY2UgdHJlZSBpbiBvcmRlciB0byBlbmFibGUgTFZEUy4gU2lu
Y2UgdGhlIFBIWSBhbHNvIG5lZWRzIHRvCmJlIHBvd2VyZWQgb2ZmIHRvIGRpc2FibGUgTFZEUywg
YWRkIGEgZnVuY3Rpb24gdG8gdGhlIHF1aXJrcy4KClNpZ25lZC1vZmYtYnk6IEt1YmEgU3pjem9k
cnp5xYRza2kgPGt1YmFAc3pjem9kcnp5bnNraS5wbD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuNGlfdGNvbi5jIHwgMTIgKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfdGNvbi5oIHwgIDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jIGIvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwppbmRleCA5NjBlODNjODIuLjI0NzQwMDc4
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCkBAIC0xMiw2ICsxMiw3IEBACiAjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvb2YuaD4KICNpbmNsdWRlIDxs
aW51eC9vZl9wbGF0Zm9ybS5oPgorI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KICNp
bmNsdWRlIDxsaW51eC9yZXNldC5oPgpAQCAtMTgzLDYgKzE4NCw4IEBAIHN0YXRpYyB2b2lkIHN1
bjRpX3Rjb25fbHZkc19zZXRfc3RhdHVzKHN0cnVjdCBzdW40aV90Y29uICp0Y29uLAogCX0gZWxz
ZSB7CiAJCXJlZ21hcF91cGRhdGVfYml0cyh0Y29uLT5yZWdzLCBTVU40SV9UQ09OMF9MVkRTX0lG
X1JFRywKIAkJCQkgICBTVU40SV9UQ09OMF9MVkRTX0lGX0VOLCAwKTsKKwkJaWYgKHRjb24tPnF1
aXJrcy0+dGVhcmRvd25fbHZkc19waHkpCisJCQl0Y29uLT5xdWlya3MtPnRlYXJkb3duX2x2ZHNf
cGh5KHRjb24sIGVuY29kZXIpOwogCX0KIH0KIApAQCAtMTI0NSw2ICsxMjQ4LDE1IEBAIHN0YXRp
YyBpbnQgc3VuNGlfdGNvbl9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAq
bWFzdGVyLAogCQlnb3RvIGVycl9mcmVlX2RjbGs7CiAJfQogCisJaWYgKHRjb24tPnF1aXJrcy0+
aGFzX2NvbWJvX2RwaHkpIHsKKwkJdGNvbi0+ZHBoeSA9IGRldm1fcGh5X2dldChkZXYsICJjb21i
by1waHkiKTsKKwkJaWYgKElTX0VSUih0Y29uLT5kcGh5KSkgeworCQkJZGV2X2VycihkZXYsICJD
b3VsZG4ndCBnZXQgdGhlIGNvbWJvIEQtUEhZXG4iKTsKKwkJCXJldCA9IFBUUl9FUlIodGNvbi0+
ZHBoeSk7CisJCQlnb3RvIGVycl9mcmVlX2RjbGs7CisJCX0KKwl9CisKIAlpZiAodGNvbi0+cXVp
cmtzLT5oYXNfY2hhbm5lbF8wKSB7CiAJCS8qCiAJCSAqIElmIHdlIGhhdmUgYW4gTFZEUyBwYW5l
bCBjb25uZWN0ZWQgdG8gdGhlIFRDT04sIHdlIHNob3VsZApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90
Y29uLmgKaW5kZXggZmEyM2FhMjNmLi44MmI2NWEyZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW40aV90Y29uLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRp
X3Rjb24uaApAQCAtMjM5LDYgKzIzOSw3IEBAIHN0cnVjdCBzdW40aV90Y29uX3F1aXJrcyB7CiAJ
Ym9vbAloYXNfY2hhbm5lbF8wOwkvKiBhODN0IGRvZXMgbm90IGhhdmUgY2hhbm5lbCAwIG9uIHNl
Y29uZCBUQ09OICovCiAJYm9vbAloYXNfY2hhbm5lbF8xOwkvKiBhMzMgZG9lcyBub3QgaGF2ZSBj
aGFubmVsIDEgKi8KIAlib29sCWhhc19sdmRzX2FsdDsJLyogRG9lcyB0aGUgTFZEUyBjbG9jayBo
YXZlIGEgcGFyZW50IG90aGVyIHRoYW4gdGhlIFRDT04gY2xvY2s/ICovCisJYm9vbAloYXNfY29t
Ym9fZHBoeTsgLyogSXMgdGhlIEQtUEhZIHVzZWQgZm9yIExWRFMgb3V0cHV0PyAqLwogCWJvb2wJ
bmVlZHNfZGVfYmVfbXV4OyAvKiBzdW42aSBuZWVkcyBtdXggdG8gc2VsZWN0IGJhY2tlbmQgKi8K
IAlib29sICAgIG5lZWRzX2VkcF9yZXNldDsgLyogYTgwIGVkcCByZXNldCBuZWVkZWQgZm9yIHRj
b24wIGFjY2VzcyAqLwogCWJvb2wJc3VwcG9ydHNfbHZkczsgICAvKiBEb2VzIHRoZSBUQ09OIHN1
cHBvcnQgYW4gTFZEUyBvdXRwdXQ/ICovCkBAIC0yNTAsNiArMjUxLDggQEAgc3RydWN0IHN1bjRp
X3Rjb25fcXVpcmtzIHsKIAkvKiBoYW5kbGVyIGZvciBMVkRTIHNldHVwIHJvdXRpbmUgKi8KIAl2
b2lkCSgqc2V0dXBfbHZkc19waHkpKHN0cnVjdCBzdW40aV90Y29uICp0Y29uLAogCQkJCSAgY29u
c3Qgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKTsKKwl2b2lkCSgqdGVhcmRvd25fbHZkc19w
aHkpKHN0cnVjdCBzdW40aV90Y29uICp0Y29uLAorCQkJCSAgICAgY29uc3Qgc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyKTsKIH07CiAKIHN0cnVjdCBzdW40aV90Y29uIHsKQEAgLTI4Miw2ICsy
ODUsOSBAQCBzdHJ1Y3Qgc3VuNGlfdGNvbiB7CiAJLyogQXNzb2NpYXRlZCBjcnRjICovCiAJc3Ry
dWN0IHN1bjRpX2NydGMJCSpjcnRjOwogCisJLyogQXNzb2NpYXRlZCBELVBIWSAqLworCXN0cnVj
dCBwaHkJCQkqZHBoeTsKKwogCWludAkJCQlpZDsKIAogCS8qIFRDT04gbGlzdCBtYW5hZ2VtZW50
ICovCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
