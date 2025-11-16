Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4634CEACEF
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 13:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OG4RZNeWIEbCDc8+XzDw2Jhz0WJYKs4aGdzVylrxTLw=; b=tT03/80TLgvaCX
	65HiQpiYuMuv7e8VmGzERaseXA3cPHTgKXIasnWDDBZEmI61ryUHFRvSwnyzPa1B6wiBQYP0AMSz8
	KXEvWp68Rcj8TeuqIv4ilwKpzqZvshPcK5Q6Qp+Ca9BSx2mpet/rEkbAJSsH0ue8svYWfwL8IYZOF
	W6y10ruZkbZhe38LV4OfgPU/zzUosTYmoEPanucOR1OczrX+b6zc8OppN/1SMGJBGjLQ7afDim+Yt
	D9bq/Fy3iXppRVFriw+R20J+CLqXPQYgCckyp+Z0pM5y3wb4+iJH50ux1b6Kdtet1y5Ik2JneFjyc
	8AwBeAi0xRSFkseCkhZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcku-0000000Eg7g-3RRZ;
	Sun, 16 Nov 2025 13:25:24 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKckq-0000000Eg5g-3TSw;
	Sun, 16 Nov 2025 13:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a0Kp4ncgXY6sTHdsDfmoXcWbE0QEKFtuM3FlNwmz7Co=; b=mCCupmGR4VACIb7XFnHo7lDTli
	7a1k/F0U567Jgitn/50ki7a1O+tAXg/ZMeViwhaCBOf7GUtu9dgE+3saKm+Da4IeVkM21p8CWkbsC
	HW+AWw9Vt6+FxE82sqx+1LyrGdGBL4qYTg5vr6cS1YPIP/Gtt3DQVAalOcnAYHrgl9wXwWqtRwkPk
	GssLovcKS8EDnS6fUAZttOUhaTi+dZfEQQ4SNc23eTmNImuoX+7SJAgJsUS3H3AMP/PK3QpnVvrbc
	4zgyPVvZKvX5pFH2CZzgGER4ZBF4wLCu4s2aGieKTjLiMldRqZbkDNptd1Hwejg2VhXsgiel7OnzM
	cyrbON+Q==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKckl-0000000FWTF-31Nh;
	Sun, 16 Nov 2025 14:25:15 +0100
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
Subject: [PATCH v2 6/6] riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
Date: Sun, 16 Nov 2025 14:25:03 +0100
Message-Id: <20251116132503.441015-2-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116132503.441015-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116132503.441015-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_052521_013580_2B1E4A86 
X-CRM114-Status: UNSURE (   8.16  )
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

QWRkIExWRFMgcGlucyB0byB0aGUgUElPIHNpbmNlIGl0J3Mgbm93IHN1cHBvcnRlZCBvbiBEMXMv
VDExMy4KClNpZ25lZC1vZmYtYnk6IEt1YmEgU3pjem9kcnp5xYRza2kgPGt1YmFAc3pjem9kcnp5
bnNraS5wbD4KLS0tCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDEx
My5kdHNpIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5k
dHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQpp
bmRleCA3OGFhNjE2MDcuLmM0Y2U4MDliZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0
cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQorKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCkBAIC0xMDgsNiArMTA4LDE1IEBAIGkyczFf
ZG91dDBfcGluOiBpMnMxLWRvdXQwLXBpbiB7CiAJCQkJZnVuY3Rpb24gPSAiaTJzMV9kb3V0IjsK
IAkJCX07CiAKKwkJCS9vbWl0LWlmLW5vLXJlZi8KKwkJCWxjZF9sdmRzMF9waW5zOiBsY2QtbHZk
czAtcGlucyB7CisJCQkJcGlucyA9ICJQRDAiLCAiUEQxIiwgIlBEMiIsICJQRDMiLCAiUEQ0Iiwg
IlBENSIsCisJCQkJICAgICAgICJQRDYiLCAiUEQ3IiwgIlBEOCIsICJQRDkiOworCQkJCWZ1bmN0
aW9uID0gImx2ZHMwIjsKKwkJCQlkcml2ZS1zdHJlbmd0aCA9IDwzMD47CisJCQkJYmlhcy1kaXNh
YmxlOworCQkJfTsKKwogCQkJL29taXQtaWYtbm8tcmVmLwogCQkJbGNkX3JnYjY2Nl9waW5zOiBs
Y2QtcmdiNjY2LXBpbnMgewogCQkJCXBpbnMgPSAiUEQwIiwgIlBEMSIsICJQRDIiLCAiUEQzIiwg
IlBENCIsICJQRDUiLAotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
