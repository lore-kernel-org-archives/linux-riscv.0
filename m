Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CF8C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 16:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oHN7TMrB/p4iKWUVPp6xAcH4R1g17G9l7m4J2WvPlk=; b=BlUMf7buD0E1/C
	DJidUoXleUytc1Qg38u8gS2ydiDYbi6097egbBUBrgKetV/xR0JFrypiZOqdxdxtl/9NSgzDO4RiV
	ek4qXXexV42do8xkw/wPukIlN+187j/vYc0N5PsiTh24FoOI6R516pKj0a4Bcluz0/NxoGoRTsG8t
	gkqZfS4PbtWUU+MAiL4hYDmSffeeFuMyzCESP0Z+RySIS/QrzqL3kO27Q3ljzx0UN4rNlwydC3TLQ
	DM0pOwuBBoacbWKtRTz+Tt4AoWWfyUxXnx5Q9rcav7B1POCBc785xRWuJkJe1MwDvGx1BK22Ufmv0
	LnFkHVb5+QpNp82tQMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVmK-000000069RS-2Z6w;
	Fri, 21 Feb 2025 16:21:28 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVj2-000000068Iy-3EeK;
	Fri, 21 Feb 2025 16:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OnPJY1YmRTCsjsI68pp1t+5Ummz4CbGGB5KW9cC+vdo=; b=jzbgJ3N3bGi56lsr6UvckXM0yt
	yZOXDH4GRVzsBSgeNrr3aBGqiQwQpnU+4IOO/q1NKQxN6McMD2th6RTZnA7fUQVEU7Rxrld3qW7vX
	ejKqNS26vNC8GtFfck9M2CYKWAsz2UOfunS4M2CANjzsXU70trqtOsAVu6un+D38bSdy82YXFAVQ3
	CkCGDCpkLZrkQJCaiVqGu77keQZ+QWdamB/o8fAurdj+gSQTNHqyQbNr1JBSAjXjdL1ievKPNltPF
	vee2wFsY616tA0+8+f9+zbWVlSvCCkOZsDqYjM3u1vBdB2yS0njabCEcgYeR1r8sfhX5vVManuZKd
	TW3xjTWQ==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96-58-g4e9ed49f8)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1tlViw-00AOLX-2K;
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
Subject: [PATCH 4/5] riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
Date: Fri, 21 Feb 2025 17:17:50 +0100
Message-Id: <20250221161751.1278049-5-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_081804_975699_45315CA0 
X-CRM114-Status: UNSURE (   8.48  )
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

VGhlIHN1bjRpIFRDT04gbmVlZHMgYSByZWZlcmVuY2UgdG8gdGhlIEQtUEhZIGluIG9yZGVyIHRv
IHN1cHBvcnQgTFZEUwpvbiBBbGx3aW5uZXIgRDFzL1QxMTMuCgpTaWduZWQtb2ZmLWJ5OiBLdWJh
IFN6Y3pvZHJ6ecWEc2tpIDxrdWJhQHN6Y3pvZHJ6eW5za2kucGw+Ci0tLQogYXJjaC9yaXNjdi9i
b290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSB8IDIgKysKIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2Fs
bHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5u
ZXIvc3VueGktZDFzLXQxMTMuZHRzaQppbmRleCBlNDE3NWFkYjAuLmQyNDFiYTMwNiAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQor
KysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCkBA
IC04MjgsNiArODI4LDggQEAgdGNvbl9sY2QwOiBsY2QtY29udHJvbGxlckA1NDYxMDAwIHsKIAkJ
CXJlc2V0cyA9IDwmY2N1IFJTVF9CVVNfVENPTl9MQ0QwPiwKIAkJCQkgPCZjY3UgUlNUX0JVU19M
VkRTMD47CiAJCQlyZXNldC1uYW1lcyA9ICJsY2QiLCAibHZkcyI7CisJCQlwaHlzID0gPCZkcGh5
PjsKKwkJCXBoeS1uYW1lcyA9ICJkcGh5IjsKIAkJCSNjbG9jay1jZWxscyA9IDwwPjsKIAogCQkJ
cG9ydHMgewotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
