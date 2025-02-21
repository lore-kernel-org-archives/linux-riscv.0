Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108A8C021B5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 16:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upRsjH/ufT98OoHjG5iOWZ/x+taX0eNJkzCdKkI/+0o=; b=rjYfjMUv1QVTiN
	t4b5OcnRMP5GwxpOcFxd4FnORWiB3aoE/H2PcrpCgHtHJHdDtDYl9FYlxyzXAEvX40RUKfkaUDotL
	ewBQzlw/tq9G+GzRRfJvVPRZZtzapgt3bxf4cr4wLF4BUNQGgJmGxYPwP7lDJ0EncwaT6Gh4fY/pq
	jJJLh0kRTlgSAxiTNn/8JNNhpyz/QvYGNw5uJPGQRqlbPhrC26Tz/PrWuGDZjUeVDdqc2REmh6omJ
	JMmaiH2dItPCwPzRm0sqMsv7xXScaND8t2yUrY3VFlzPQvYkOXoY5mqAl/qM62uq/VpEH0v1u2svM
	ZkLjr/5LTYemrmjc53lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVks-000000068vA-04ra;
	Fri, 21 Feb 2025 16:19:58 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVj2-000000068Iz-3F38;
	Fri, 21 Feb 2025 16:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w2E197Qc+tMzoaRduX1xKII3x7kGR5ATZ73uNFSwZtQ=; b=CMNzlDdkHQ6mojLXa6tNiP/3VC
	RkIZGgKGLCLwEE4kPiGTssFxkaN0xfA7iu5WpmszAXMImsPodll8V0+9AC8TDn4YfEsc7Wp+sVXyP
	bw5eGzs6xhuk9T8yiqzR2bKgTIf9mcr2aydxbSSuy9e5FQlKv/eQgku1xjrcD+KHsyrXwB0RX8aOF
	+yPQyPm+M+bXvN+Ih7QHFFDOLh1/NMvVhCBjuWb8/Mr9AHv7Icatpoe8wI8gVs18Vru9xNko2ePe8
	ezPts3Z/Y0LIeJ7RWEUIpJ9F4dU8HijLXrwRyvvCShp5JHvXij14iwDn5G9u79LBlPQChA6Vp66ID
	+GldAbUw==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96-58-g4e9ed49f8)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1tlVix-00AOLX-1V;
	Fri, 21 Feb 2025 17:17:59 +0100
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
Subject: [PATCH 5/5] riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
Date: Fri, 21 Feb 2025 17:17:51 +0100
Message-Id: <20250221161751.1278049-6-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_081804_975960_9A478F83 
X-CRM114-Status: UNSURE (   8.65  )
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
My5kdHNpIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0
c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCmlu
ZGV4IGQyNDFiYTMwNi4uMTc0YjZkOGY5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCisrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMv
YWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKQEAgLTc4LDYgKzc4LDE1IEBAIGRzaV80bGFu
ZV9waW5zOiBkc2ktNGxhbmUtcGlucyB7CiAJCQkJZnVuY3Rpb24gPSAiZHNpIjsKIAkJCX07CiAK
KwkJCS9vbWl0LWlmLW5vLXJlZi8KKwkJCWx2ZHMwX3BpbnM6IGx2ZHMwLXBpbnMgeworCQkJCXBp
bnMgPSAiUEQwIiwgIlBEMSIsICJQRDIiLCAiUEQzIiwgIlBENCIsICJQRDUiLAorCQkJCSAgICAg
ICAiUEQ2IiwgIlBENyIsICJQRDgiLCAiUEQ5IjsKKwkJCQlmdW5jdGlvbiA9ICJsdmRzMCI7CisJ
CQkJZHJpdmUtc3RyZW5ndGggPSA8MzA+OworCQkJCWJpYXMtZGlzYWJsZTsKKwkJCX07CisKIAkJ
CS9vbWl0LWlmLW5vLXJlZi8KIAkJCWxjZF9yZ2I2NjZfcGluczogbGNkLXJnYjY2Ni1waW5zIHsK
IAkJCQlwaW5zID0gIlBEMCIsICJQRDEiLCAiUEQyIiwgIlBEMyIsICJQRDQiLCAiUEQ1IiwKLS0g
CjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
