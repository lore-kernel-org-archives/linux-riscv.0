Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6EECEACEF
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 13:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ms+uObNJxf6kAUWFoOq01pnKKYB/4T10lJoDcQR//KM=; b=cyh8DcyioqxcBy
	OeJf92D/Cw5XwCdL7t+klo1NuDZgpQUoyyUfEk2T+Wi5LC501CLS9BtkFFC75BPDOu0BmzWWMIzBG
	aH3imqUK5sbSZvx/icG4Dnt4xUrHnRhgOb2JXfuyeT+/9+cdruQY+VhLJh3iU0SlbT0eXw8SjkUHa
	rLtNbFvFl+o4Y5TcBi4ainfx0trMScuPlJ1mkZ6mada+JjcaUXt4VVFHs5BoyfpdBYghDLw/0zX56
	5qxljX2LzcFJwWXVibW2m2PS7hgBFByXlzGDPuHdb86QCcePI/HhLzVgfqzOY1Vn0YPeGGvaDGNBR
	Ai6Wj/7BewDuZyYeu6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd5G-0000000Egwy-0e2d;
	Sun, 16 Nov 2025 13:46:26 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd5D-0000000EgwR-21Lz;
	Sun, 16 Nov 2025 13:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=neBdv8iX1GzhYleqbei0j00LB5MeX/K7/xRXvuHSj3k=; b=QRQq1tC3/5JgMlgc5qc18Ew0JI
	8OQ3hwhiepGLSerb1Y8B6mSQxViwxUu8Syr4gNh6f77cyqLL/KEUYU2n9T28BSefEAi+eAKZH4fLp
	7/ArIdSrAMH64Nj1wYW1urBFW4iARlJjn7gbxzyki9veXfxd/t6J1lVcSIc6v7uVlUe0JmaQ9WCei
	LTHnf7DHcmOHYBTPdvt1HHlYaaiHhU5BttI3qwXNL0fOyR9ox6eCzp/kY1sC5e+PlhT8YB33N6aen
	FgCypC9NaJJm0DF3yiDvAobIxsNTafMRLN1xGRZRpsrubFf3q5AAtcSTTNsZ7iuVQ2jUlWflURI6w
	8eDVaoCA==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKd57-0000000FXJG-0ubo;
	Sun, 16 Nov 2025 14:46:17 +0100
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
Subject: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
Date: Sun, 16 Nov 2025 14:46:09 +0100
Message-Id: <20251116134609.447043-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_054623_702194_3C3A6622 
X-CRM114-Status: GOOD (  11.71  )
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

W3JlcGx5aW5nIHRvIHYxIHRvIGtlZXAgdGhlIHNhbWUgc2VyaWVzIG9uIFBhdGNod29ya10KClNv
bWUgQWxsd2lubmVyIGNoaXBzIChub3RhYmx5IHRoZSBEMXMvVDExMyBhbmQgdGhlIEExMDApIGhh
dmUgYSAiY29tYm8KTUlQSSBEU0kgRC1QSFkiIHdoaWNoIGlzIHJlcXVpcmVkIHdoZW4gdXNpbmcg
c2luZ2xlLWxpbmsgTFZEUzAuIFRoZSBzYW1lClBEMC4uUEQ5IHBpbnMgYXJlIHVzZWQgZm9yIGVp
dGhlciBEU0kgb3IgTFZEUy4KCk90aGVyIHRoYW4gaGF2aW5nIHRvIHVzZSB0aGUgY29tYm8gRC1Q
SFksIExWRFMgb3V0cHV0IGlzIGNvbmZpZ3VyZWQgaW4KdGhlIHNhbWUgd2F5IGFzIG9uIG9sZGVy
IGNoaXBzLgoKVGhpcyBzZXJpZXMgZW5hYmxlcyB0aGUgc3VuNmkgTUlQSSBELVBIWSB0byBhbHNv
IHdvcmsgaW4gTFZEUyBtb2RlLiBJdAppcyB0aGVuIGNvbmZpZ3VyZWQgYnkgdGhlIExDRCBUQ09O
LCB3aGljaCBhbGxvd3MgY29ubmVjdGluZyBhCnNpbmdsZS1saW5rIExWRFMgZGlzcGxheSBwYW5l
bC4KCkNoYW5nZXMgaW4gdjIvdjM6Ci0gQXBwbGllZCBjb2RlIGZvcm1hdHRpbmcgY2hhbmdlcyBm
cm9tIHJldmlldyBjb21tZW50cwotIENoYW5nZWQgImRwaHkiIHRvICJjb21iby1waHkiCi0gTWFk
ZSB0aGUgTFZEUyBzZXR1cC90ZWFyZG93biBmdW5jdGlvbnMgYWJvcnQgZWFybHkgaW4gY2FzZSBv
ZiBlcnJvcgogIChhZGRpbmcgYSBwcm9wZXIgcmV0dXJuIHZhbHVlIHdvdWxkIHJlcXVpcmUgY2hh
bmdlcyBpbiBzZXZlcmFsIGxldmVscwogICBvZiBjYWxsZXIgZnVuY3Rpb25zOyBwZXJoYXBzIGNv
dWxkIGJlIGRvbmUgaW4gYSBzZXBhcmF0ZSBwYXRjaCkKLSBBZGRlZCB0aGUgUEhZIHByb3BlcnRp
ZXMgdG8gRFQgYmluZGluZ3MKLSBSZW5hbWVkIGx2ZHMwX3BpbnMgdG8gbGNkX2x2ZHMwX3BpbnMK
LSBSZWJhc2VkIG9uIHRvcCBvZiBkcm0vbWlzYy9rZXJuZWwvZm9yLWxpbnV4LW5leHQKLSBIb3Bl
ZnVsbHkgY29ycmVjdGVkIHRoZSBpbmNvbXBsZXRlIHBhdGNoIGxpc3Qgb2YgdjIsIHdoaWNoIGhh
cHBlbmVkCiAgZHVlIHRvIGFuIFNNVFAgZXJyb3IKCkt1YmEgU3pjem9kcnp5xYRza2kgKDYpOgog
IHBoeTogYWxsd2lubmVyOiBwaHktc3VuNmktbWlwaS1kcGh5OiBTdXBwb3J0IExWRFMgaW4gY29t
Ym8gRC1QSFkKICBkcm0vc3VuNGk6IFN1cHBvcnQgTFZEUyB1c2luZyBNSVBJIERTSSBjb21ibyBE
LVBIWQogIGRybS9zdW40aTogRW5hYmxlIExWRFMgb3V0cHV0IG9uIHN1bjIwaSBEMXMvVDExMwog
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBzdW40aTogQWRkIEQxcy9UMTEzIGNvbWJvIEQtUEhZIGJp
bmRpbmdzCiAgcmlzY3Y6IGR0czogYWxsd2lubmVyOiBkMXMtdDExMzogQWRkIEQtUEhZIHRvIFRD
T04gTENEMAogIHJpc2N2OiBkdHM6IGFsbHdpbm5lcjogZDFzLXQxMTM6IEFkZCBMVkRTMCBwaW5z
CgogLi4uL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjRpLWExMC10Y29uLnlhbWwgICAgIHwgIDYgKysK
IC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSAgICB8IDExICsrKwog
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYyAgICAgICAgICAgIHwgNTAgKysrKysr
KysrKysrKwogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uaCAgICAgICAgICAgIHwg
IDYgKysKIGRyaXZlcnMvcGh5L2FsbHdpbm5lci9waHktc3VuNmktbWlwaS1kcGh5LmMgICB8IDcw
ICsrKysrKysrKysrKysrKysrKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTQxIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
