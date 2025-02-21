Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCB9C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 16:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qtx7JrLHayQiDBPfJk2OjZPhbdiLz1cs1arAp2Rl/js=; b=M5jDZ9zchcu7FI
	nO7/IZXrlKpoze0TMeabT7hnrJheyDkleBsPZn3PwskmPIQTSyRoYQnjod8UT5A5M4HkczxxtYtBd
	ypRMBlpiOA3EJJPJ8FftRWg0W8SfcvZt5jWPwPyOkLq8t57BOzs7lM1RIr6fe5CqP3qYg6sagFeAv
	x+R6/Jkq0YJffdyIXvXd9yZ4L7P5pDTUWKePHgTqBDhtUddVcJ6qGhb86Ie+89AvjSChm9JkBepPF
	BipsS4FjK5FhdRJ5O0qTrRIF+g8FsjYP4KsfFkQgGAPZFItdyhpdpfvOGK4IJcBslpJSTMfsFUo++
	B6pkrhmX2DFCrnRggP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVnl-000000069uY-1Vms;
	Fri, 21 Feb 2025 16:22:57 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVj3-000000068Ji-2Ji0;
	Fri, 21 Feb 2025 16:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7RHCIXkAEB3Q6gvisTKmVhU8q9lDZL30dJeI5tINmhs=; b=2hls+aUoDtpBz0zvI2ZI+E++3Y
	2siSdOmW4PBTuCYqdXDVDUjQQzkZolBRiM/lcNIyuEBi3qoke0fXe8kGHUj0EXivc5mMo90iPZlOj
	UugrMUSaZD6WPVVUXYBxfZ8qRsQpzkHGvN6lGAQVlprOSt+fsD+ZFLtNob53O7VRou3OqBDqpToaD
	O3Lmfdm+LI+F2GigjHqX68zctIEpDRVm+PgNmysmtiegJsoUH25nBghgwpD2+0aKgU5q7WPMf0xpv
	OLkrjOlqMvbx5EFFJlFxp5sAIQKRbDi1NJXVyvPkA9JrUsf4gM3A21nFS/uNLty+KLTvVlBrRC7mA
	SXhLlq+g==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96-58-g4e9ed49f8)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1tlVit-00AOLX-29;
	Fri, 21 Feb 2025 17:17:55 +0100
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
Subject: [PATCH 0/5] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
Date: Fri, 21 Feb 2025 17:17:46 +0100
Message-Id: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_081805_743892_C6F7D6AA 
X-CRM114-Status: UNSURE (   7.98  )
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

U29tZSBBbGx3aW5uZXIgY2hpcHMgKG5vdGFibHkgdGhlIEQxcy9UMTEzIGFuZCB0aGUgQTEwMCkg
aGF2ZSBhICJjb21ibwpNSVBJIERTSSBELVBIWSIgd2hpY2ggaXMgcmVxdWlyZWQgd2hlbiB1c2lu
ZyBzaW5nbGUtbGluayBMVkRTMC4gVGhlIHNhbWUKUEQwLi5QRDkgcGlucyBhcmUgdXNlZCBmb3Ig
ZWl0aGVyIERTSSBvciBMVkRTLgoKT3RoZXIgdGhhbiBoYXZpbmcgdG8gdXNlIHRoZSBjb21ibyBE
LVBIWSwgTFZEUyBvdXRwdXQgaXMgY29uZmlndXJlZCBpbgp0aGUgc2FtZSB3YXkgYXMgb24gb2xk
ZXIgY2hpcHMuCgpUaGlzIHNlcmllcyBlbmFibGVzIHRoZSBzdW42aSBNSVBJIEQtUEhZIHRvIGFs
c28gd29yayBpbiBMVkRTIG1vZGUuIEl0CmlzIHRoZW4gY29uZmlndXJlZCBieSB0aGUgTENEIFRD
T04sIHdoaWNoIGFsbG93cyBjb25uZWN0aW5nIGEKc2luZ2xlLWxpbmsgTFZEUyBkaXNwbGF5IHBh
bmVsLgoKS3ViYSBTemN6b2RyennFhHNraSAoNSk6CiAgcGh5OiBhbGx3aW5uZXI6IHBoeS1zdW42
aS1taXBpLWRwaHk6IFN1cHBvcnQgTFZEUyBpbiBjb21ibyBELVBIWQogIGRybS9zdW40aTogU3Vw
cG9ydCBMVkRTIHVzaW5nIE1JUEkgRFNJIGNvbWJvIEQtUEhZCiAgZHJtL3N1bjRpOiBFbmFibGUg
TFZEUyBvdXRwdXQgb24gc3VuMjBpIEQxcy9UMTEzCiAgcmlzY3Y6IGR0czogYWxsd2lubmVyOiBk
MXMtdDExMzogQWRkIEQtUEhZIHRvIFRDT04gTENEMAogIHJpc2N2OiBkdHM6IGFsbHdpbm5lcjog
ZDFzLXQxMTM6IEFkZCBMVkRTMCBwaW5zCgogLi4uL2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1k
MXMtdDExMy5kdHNpICAgIHwgMTAgKysrCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNv
bi5jICAgICAgICAgICAgfCA0MCArKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW40aV90Y29uLmggICAgICAgICAgICB8ICA2ICsrCiBkcml2ZXJzL3BoeS9hbGx3aW5uZXIvcGh5
LXN1bjZpLW1pcGktZHBoeS5jICAgfCA2NSArKysrKysrKysrKysrKysrKystCiA0IGZpbGVzIGNo
YW5nZWQsIDExOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0gCjIuMjUuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
