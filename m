Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B894ACEACEF
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SB6Bz+mzAQpAZdBZubXiLhSU4I8DwSS8ur1dVNOihtQ=; b=xMxJ9N+q/ZdCBP
	JaVv4DvBusPuQgFmFwhqFc3WOsbqQGot7XZ3O4pf9/Xt8wP5KlTk0yIK15f2f7gOpCFq97ejXtjzq
	b8PYns68XpziIksp60OhwMfgBMO2izJ0ZpiXoTF2abSMf51W10HC7y7sanV/kblMv6dGvaGy0e3q5
	eKyDqgHoqTte7P4ivHD6xiTZMY4/X0EO6BWOIRfwgWRweMNDQCDN4vCXHciicRXIFgKyuAD6Y1Efw
	MS9TMTa/eOOmIGZxLLKhe70zuPhND+UGRUQq0/5Qk9gGGUJ9RS2LO9mD9qJU8U/DDbduNpVPCnk0L
	X9eODdhaaxOHYyZ/MSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcg5-0000000Eez3-3VBF;
	Sun, 16 Nov 2025 13:20:25 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcg2-0000000EeyY-2tPO;
	Sun, 16 Nov 2025 13:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ALqrvYx16IgQIglbpOnwhVRORNfwDsxM2tJC2QOGjhQ=; b=bMtB0Qg/1+SsHyMo3tyeEyYGtI
	nf4o+cbragiw/zKK0FphHMOpRJLSRcqI8fBYHJrhQIx8uUQpO9ygpW0MiJgNsapUrni94RTM2friZ
	eKZPqZTyySpbVNSdH4crYAkVFEpggWtlSfyH8hFwb7TAEldSnP0qGWNgG8IkROR7yyvmG7AzJdVUU
	xnOafJHM++YT5PkOVfrAKnOHqJqooeuXUNpEH2wMxliQy/KiaAqHdjz7JkAyZAdx0dKawY/b2/Q79
	To9wceIfxw19SgOKhIAKB8UXnGeo6HI4uDxpOUwCSPN+c6C3uSRKzgxHOvLQNE3VQecsGzGZPqhvA
	hp9vdaCQ==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKcfw-0000000FW4E-1LDX;
	Sun, 16 Nov 2025 14:20:16 +0100
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
Subject: [PATCH v2 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
Date: Sun, 16 Nov 2025 14:18:47 +0100
Message-Id: <20251116131853.440863-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_052022_921367_181DBCBB 
X-CRM114-Status: GOOD (  10.92  )
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
bmVsLgoKQ2hhbmdlcyBpbiB2MjoKLSBBcHBsaWVkIGNvZGUgZm9ybWF0dGluZyBjaGFuZ2VzIGZy
b20gcmV2aWV3IGNvbW1lbnRzCi0gQ2hhbmdlZCAiZHBoeSIgdG8gImNvbWJvLXBoeSIKLSBNYWRl
IHRoZSBMVkRTIHNldHVwL3RlYXJkb3duIGZ1bmN0aW9ucyBhYm9ydCBlYXJseSBpbiBjYXNlIG9m
IGVycm9yCiAgKGFkZGluZyBhIHByb3BlciByZXR1cm4gdmFsdWUgd291bGQgcmVxdWlyZSBjaGFu
Z2VzIGluIHNldmVyYWwgbGV2ZWxzCiAgIG9mIGNhbGxlciBmdW5jdGlvbnM7IHBlcmhhcHMgY291
bGQgYmUgZG9uZSBpbiBhIHNlcGFyYXRlIHBhdGNoKQotIEFkZGVkIHRoZSBQSFkgcHJvcGVydGll
cyB0byBEVCBiaW5kaW5ncwotIFJlbmFtZWQgbHZkczBfcGlucyB0byBsY2RfbHZkczBfcGlucwot
IFJlYmFzZWQgb24gdG9wIG9mIGRybS9taXNjL2tlcm5lbC9mb3ItbGludXgtbmV4dAoKS3ViYSBT
emN6b2RyennFhHNraSAoNik6CiAgcGh5OiBhbGx3aW5uZXI6IHBoeS1zdW42aS1taXBpLWRwaHk6
IFN1cHBvcnQgTFZEUyBpbiBjb21ibyBELVBIWQogIGRybS9zdW40aTogU3VwcG9ydCBMVkRTIHVz
aW5nIE1JUEkgRFNJIGNvbWJvIEQtUEhZCiAgZHJtL3N1bjRpOiBFbmFibGUgTFZEUyBvdXRwdXQg
b24gc3VuMjBpIEQxcy9UMTEzCiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHN1bjRpOiBBZGQgRDFz
L1QxMTMgY29tYm8gRC1QSFkgYmluZGluZ3MKICByaXNjdjogZHRzOiBhbGx3aW5uZXI6IGQxcy10
MTEzOiBBZGQgRC1QSFkgdG8gVENPTiBMQ0QwCiAgcmlzY3Y6IGR0czogYWxsd2lubmVyOiBkMXMt
dDExMzogQWRkIExWRFMwIHBpbnMKCiAuLi4vZGlzcGxheS9hbGx3aW5uZXIsc3VuNGktYTEwLXRj
b24ueWFtbCAgICAgfCAgNiArKwogLi4uL2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDEx
My5kdHNpICAgIHwgMTEgKysrCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jICAg
ICAgICAgICAgfCA1MCArKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlf
dGNvbi5oICAgICAgICAgICAgfCAgNiArKwogZHJpdmVycy9waHkvYWxsd2lubmVyL3BoeS1zdW42
aS1taXBpLWRwaHkuYyAgIHwgNzAgKysrKysrKysrKysrKysrKysrLQogNSBmaWxlcyBjaGFuZ2Vk
LCAxNDEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
