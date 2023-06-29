Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F9BC001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 17:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m57nbAurPvnCi3llGi/OgmVPgRCEDiwi5EMPIPyGw2E=; b=S2k8vK+MHOpPfI
	dZ+yRMnpK814F24mUxOlOwhcIXhJLDQtmOq05E1k8fhhruCKA6A2u7qHK/6gGSOxXHBAZGSWKavi6
	2c58QkaOvuI2MEIerW39NTjIc1cFVxL/FbaS3IxtGuABX6/DTBk8Xe7/HFVXnCERdv5IaGqicptRv
	v5G9/SzH/er/RHc3ee+xg5+7N4etd4YjzMqJR0aeVGMa4grOgD5vrQHH1XT4w+9lO0D6WYz+N5O8s
	u9yrS88mgjOpHnqaBxNAZAFPi/jC/v1KWGNxSLxkR7s8wzaTkpC3h1Z0cz7otRuulp+KomhQHnMXU
	mR85zGY/lU/ttW7Ejqhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEv0Q-001atw-1T;
	Thu, 29 Jun 2023 17:00:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEv03-001ak8-1E;
	Thu, 29 Jun 2023 17:00:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3DE8615BC;
	Thu, 29 Jun 2023 17:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094FAC433C0;
	Thu, 29 Jun 2023 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688058006;
	bh=ekZJhfEVqtyX3t+uLKmzRW38MPCUXcmlO89VvVdAQak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X5AbPL2HVz3TeQmXq1zjjfnu71OYU8djIbs5/c9qxDEwhZz5jhwcajuZCLWcAf1YG
	 6UjtkyusIMkEn35B9ID+o4wyUfD8Syj+nTCcdyoT9PQH/x1xQozB7BY/9ggREkIa5m
	 +vNMH+Blw10Ll3L+bBoLHUYfDeYOU98PCKzQpa6bfVEzt/EjOBjHHgC8AhqBbezmw2
	 vAywnOuyOp1lKkttmawODM3OHQ5RDeMx89L7jc2xW12syxhI21c7HiqbxdSsS5t0nc
	 cFRf2sMLMCraOSx/SFj5Kv2mSMq66XzgB4jZUanmp4mfQ2KMcF9CpX4PvfGzmz9voT
	 Vgm+m5Gfg9BLg==
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: "Bjorn Helgaas" <bhelgaas@google.com>
Cc: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
	"Rob Herring" <robh@kernel.org>,
	"Yue Wang" <yue.wang@Amlogic.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Kevin Hilman" <khilman@baylibre.com>,
	"Jerome Brunet" <jbrunet@baylibre.com>,
	"Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
	"Srikanth Thokala" <srikanth.thokala@intel.com>,
	"Daire McNamara" <daire.mcnamara@microchip.com>,
	"Conor Dooley" <conor.dooley@microchip.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] PCI: microchip: Remove cast between incompatible function type
Date: Thu, 29 Jun 2023 16:59:56 +0000
Message-ID: <20230629165956.237832-3-kwilczynski@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629165956.237832-1-kwilczynski@kernel.org>
References: <20230629165956.237832-1-kwilczynski@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_100007_507276_BEA30292 
X-CRM114-Status: GOOD (  12.95  )
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

UmF0aGVyIHRoYW4gY2FzdGluZyB2b2lkKCopKHN0cnVjdCBjbGsgKikgdG8gdm9pZCAoKikodm9p
ZCAqKSwgdGhhdApmb3JjZXMgY29udmVyc2lvbiB0byBhbiBpbmNvbXBhdGlibGUgZnVuY3Rpb24g
dHlwZSwgcmVwbGFjZSB0aGUgY2FzdAp3aXRoIGEgc21hbGwgbG9jYWwgc3R1YiBmdW5jdGlvbiB3
aXRoIGEgc2lnbmF0dXJlIHRoYXQgbWF0Y2hlcyB3aGF0CnRoZSBkZXZtX2FkZF9hY3Rpb25fb3Jf
cmVzZXQoKSBmdW5jdGlvbiBleHBlY3RzLgoKVGhlIHN1YiBmdW5jdGlvbiB0YWtlcyBhIHZvaWQg
KiwgdGhlbiBwYXNzZXMgaXQgZGlyZWN0bHkgdG8KY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCksIHdo
aWNoIGhhbmRsZXMgdGhlIG1vcmUgc3BlY2lmaWMgdHlwZS4KClJlcG9ydGVkIGJ5IGNsYW5nIHdo
ZW4gYnVpbGRpbmcgd2l0aCB3YXJuaW5ncyBlbmFibGVkOgoKICBkcml2ZXJzL3BjaS9jb250cm9s
bGVyL3BjaWUtbWljcm9jaGlwLWhvc3QuYzo4NjY6MzI6IHdhcm5pbmc6IGNhc3QgZnJvbSAndm9p
ZCAoKikoc3RydWN0IGNsayAqKScgdG8gJ3ZvaWQgKCopKHZvaWQgKiknIGNvbnZlcnRzIHRvIGlu
Y29tcGF0aWJsZSBmdW5jdGlvbiB0eXBlIFstV2Nhc3QtZnVuY3Rpb24tdHlwZS1zdHJpY3RdCiAg
ICAgICAgICBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCAodm9pZCAoKikgKHZvaWQgKikp
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpObyBmdW5jdGlv
bmFsIGNoYW5nZXMgYXJlIGludGVuZGVkLgoKRml4ZXM6IDZmMTVhOWM5Zjk0MSAoIlBDSTogbWlj
cm9jaGlwOiBBZGQgTWljcm9jaGlwIFBvbGFyRmlyZSBQQ0llIGNvbnRyb2xsZXIgZHJpdmVyIikK
Q28tZGV2ZWxvcGVkLWJ5OiBEYWlyZSBNY05hbWFyYSA8ZGFpcmUubWNuYW1hcmFAbWljcm9jaGlw
LmNvbT4KU2lnbmVkLW9mZi1ieTogRGFpcmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3Jv
Y2hpcC5jb20+CkNvLWRldmVsb3BlZC1ieTogU2ltb24gSG9ybWFuIDxob3Jtc0BrZXJuZWwub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBIb3JtYW4gPGhvcm1zQGtlcm5lbC5vcmc+ClNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBXaWxjennFhHNraSA8a3dpbGN6eW5za2lAa2VybmVsLm9yZz4KLS0t
CiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWljcm9jaGlwLWhvc3QuYyB8IDEwICsrKysr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1pY3JvY2hpcC1ob3N0LmMg
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWljcm9jaGlwLWhvc3QuYwppbmRleCA1ZTcx
MGU0ODU0NjQuLmQzMDI4NmY4MTVlNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9wY2llLW1pY3JvY2hpcC1ob3N0LmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ll
LW1pY3JvY2hpcC1ob3N0LmMKQEAgLTg0OCw2ICs4NDgsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBpcnFfZG9tYWluX29wcyBldmVudF9kb21haW5fb3BzID0gewogCS5tYXAgPSBtY19wY2llX2V2
ZW50X21hcCwKIH07CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBtY19wY2llX2RlaW5pdF9jbGsodm9p
ZCAqZGF0YSkKK3sKKwlzdHJ1Y3QgY2xrICpjbGsgPSBkYXRhOworCisJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGNsayk7Cit9CisKIHN0YXRpYyBpbmxpbmUgc3RydWN0IGNsayAqbWNfcGNpZV9pbml0
X2NsayhzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmlkKQogewogCXN0cnVjdCBjbGsg
KmNsazsKQEAgLTg2Myw4ICs4NzAsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBjbGsgKm1jX3Bj
aWVfaW5pdF9jbGsoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICppZCkKIAlpZiAocmV0
KQogCQlyZXR1cm4gRVJSX1BUUihyZXQpOwogCi0JZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRl
diwgKHZvaWQgKCopICh2b2lkICopKWNsa19kaXNhYmxlX3VucHJlcGFyZSwKLQkJCQkgY2xrKTsK
KwlkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBtY19wY2llX2RlaW5pdF9jbGssIGNsayk7
CiAKIAlyZXR1cm4gY2xrOwogfQotLSAKMi40MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
