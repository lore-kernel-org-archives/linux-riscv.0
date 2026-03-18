Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14815103E160
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OAbC00i2/TKdStOklOZpMDM/CZMvgiNSIbywZhCfDm4=; b=yhVUgAJZMukJ4W
	9mCYUWuZLuqxiw54ERWDt75D+TulsCEnehEQkShjh2K0mRsApIkI6d+FzCGVhc1m1uCgEIJX1HRKW
	BZyyfH/cemePKsy5tyac9osxYiPgA/EfcD7XVIaLinar8kmE+1SpR3Etf5nYoiVz6L468JteWCnlO
	T7WzQ8bQPbOOZVuagDLzpKuxYVPQL4ZUarvQ0YwGB4U/7Wx3BVaCTEcFdRkJpVbcyAqJbFgvSm2R+
	4ftzF4y2QMdAlHOv2GAodjG12oogGmjZFQDKsAqJU5iXMyN20nQF9QxLsmcpS/ILnoPLQBhNDa6cL
	ZTLA2JDRLIZxCn3KdJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ohi-00000008GYB-0mLC;
	Wed, 18 Mar 2026 11:04:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ohh-00000008GY0-12pH
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 11:04:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A39860103;
	Wed, 18 Mar 2026 11:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5F2C19424;
	Wed, 18 Mar 2026 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831884;
	bh=BNq/aLjGiRsU/woSk9KXvzCzt9H8uG+UKL6Hc0amgqE=;
	h=From:To:Cc:Subject:Date:From;
	b=fi54/hpmBZjRTodk9ob7bkwP4VJX3bjuKqnaUMdcL1kbSj8bhDCgLdL0SzZxXvoMg
	 aXNaBNRFXr2A7WmmrtioF0KlnobKG5ohyzuhhb/WFj8qhI0TJjqpqN0RFtBzgt2uwG
	 qCUQK8Qg9mzM9g62Bo6B5L1ai5Arm4lby1DPq4XHcWFk1tJ0R5VqlySzJCVEAazewR
	 irXMbgEZZ7CnZ77smLdx+NwcXjOgRmz3x8uBHn21zPc13o7LUDU6BI9ODTUj06F4tF
	 3Vn18Zlu05cV36lJRRdjkft2dEMLlGBhHduK00ZXhlvxnUtkEQr8TmwZloi/maIRME
	 9wALt3QWZvTQg==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
Date: Wed, 18 Mar 2026 11:04:31 +0000
Message-ID: <20260318-gift-nearest-fd3ef3e4819b@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2938; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+szdxvWDurJ/Utg3qh2x6m2C3UpR9hPCewe/zECfwsc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm72o5UTjx1t3mm8QWfjM6Llw32cOf9Opu/LfxZO08xd 5Gx8NSFHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiI3FJGhmev9hYv2vHq7KWQ kgn7jl/WtrfR7L0Rev8in+y0nqkX9YMY/qc/e9eUbrncTaDr5uHPDXwSetWq8hGWTxcz7OlYkZO UwwgA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCllvLAoKSGVy
ZSdzIGEgdjMgd2l0aCBhbiBleHRyYSBwYXRjaCB1cGRhdGluZyB0aGUgZ3BpbyBiaW5kaW5nIGZy
b20gZmlzaGVkCm91dCBmcm9tIG15IG9sZCBicmFuY2gsIGZpeGluZyB0aGUgZXhhbXBsZXMgYW5k
IHNldHRpbmcgdGhlIHBlcm1pdHRlZAp2YWx1ZXMgb2YgZ3Bpb3MgZm9yIHRoZSBjb250cm9sbGVy
cyBvbiBwb2xhcmZpcmUgc29jIGFuZCB0aGUgZXhpc3RpbmcKYmluZGluZyBwYXRjaCdzIGV4YW1w
bGUgZml4ZWQuCgpCYXJ0b3N6LCB5b3UgYWNrZWQgdGhlIGdwaW8gZHJpdmVyIHBhdGNoLCBhcmUg
eW91IGV4cGVjdGluZyB0aGUgd2hvbGUKbG90IHRvIGdvIHRvZ2V0aGVyIHZpYSB0aGUgc29jIHRy
ZWUgb3Igc29tZXRoaW5nPwoKQ2hlZXJzLApDb25vci4KCnYxMzoKLSBmaXggdGhlIGJpbmRpbmcg
ZXhhbXBsZQotIGFkZCBhIG5ldyBiaW5kaW5nIHBhdGNoCgp2MTI6Ci0gSW1wbGVtZW50ZWQgbXV4
IGRyaXZlciBmZWVkYmFjayBmcm9tIEhlcnbDqS4KLSBSZXdvcmtlZCB0aGUgZ3BpbyBpbnRlcnJ1
cHQgc3R1ZmYgcGVyIExpbnVzJyBmZWVkYmFjaywgc28gZGlkbid0IHBpY2sKICB1cCBIZXJ2w6lz
IHRhZy4KLSBNb2RpZmllZCB0aGUgYmluZGluZyBkZXNjcmlwdGlvbiB0byBjb3ZlciB0aGUgNiBh
bHdheXMgImRpcmVjdCBtb2RlIgogIGludGVycnVwdHMgb24gZ3BpbyBjb250cm9sbGVyIDEuCgpD
QzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNDOiBIZXJ2ZSBDb2RpbmEg
PGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KQ0M6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+CkNDOiBEYWlyZSBNY05hbWFyYSA8ZGFpcmUubWNuYW1hcmFAbWljcm9j
aGlwLmNvbT4KQ0M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNDOiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+CkNDOiBQYXVsIFdhbG1zbGV5IDxwandAa2Vy
bmVsLm9yZz4KQ0M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+CkNDOiBBbGJl
cnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KQ0M6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4KQ0M6IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPgpDQzogQmFydG9z
eiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwub3JnPgpDQzogbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpDQzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKQ0M6IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcKQ0M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnCgpDb25vciBE
b29sZXkgKDUpOgogIGR0LWJpbmRpbmdzOiBncGlvOiBmaXggbWljcm9jaGlwLG1wZnMtZ3BpbyBp
bnRlcnJ1cHQgZG9jdW1lbnRhdGlvbgogIGdwaW86IG1wZnM6IEFkZCBpbnRlcnJ1cHQgc3VwcG9y
dAogIGR0LWJpbmRpbmdzOiBzb2M6IG1pY3JvY2hpcDogZG9jdW1lbnQgUG9sYXJGaXJlIFNvQydz
IGdwaW8gaW50ZXJydXB0CiAgICBtdXgKICBzb2M6IG1pY3JvY2hpcDogYWRkIG1wZnMgZ3BpbyBp
bnRlcnJ1cHQgbXV4IGRyaXZlcgogIHJpc2N2OiBkdHM6IG1pY3JvY2hpcDogdXBkYXRlIG1wZnMg
Z3BpbyBpbnRlcnJ1cHRzIHRvIGJldHRlciBtYXRjaCB0aGUKICAgIFNvQwoKIC4uLi9iaW5kaW5n
cy9ncGlvL21pY3JvY2hpcCxtcGZzLWdwaW8ueWFtbCAgICB8ICAyNCArKy0KIC4uLi9zb2MvbWlj
cm9jaGlwL21pY3JvY2hpcCxtcGZzLWlycW11eC55YW1sICB8IDEwMyArKysrKysrKysrCiAuLi4v
bWljcm9jaGlwLG1wZnMtbXNzLXRvcC1zeXNyZWcueWFtbCAgICAgICAgfCAgIDQgKwogTUFJTlRB
SU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiAuLi4vYm9v
dC9kdHMvbWljcm9jaGlwL21wZnMtYmVhZ2xldi1maXJlLmR0cyAgfCAgMjkgKysrCiAuLi4vYm9v
dC9kdHMvbWljcm9jaGlwL21wZnMtZGlzY28ta2l0LmR0cyAgICAgfCAgNDMgKysrLS0KIC4uLi9k
dHMvbWljcm9jaGlwL21wZnMtaWNpY2xlLWtpdC1jb21tb24uZHRzaSB8ICAzNyArKystCiAuLi4v
Ym9vdC9kdHMvbWljcm9jaGlwL21wZnMtbTEwMHBmc2V2cC5kdHMgICAgfCAgNDEgKystLQogLi4u
L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLXBvbGFyYmVycnkuZHRzICAgIHwgIDI5ICsrKwogLi4u
L3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLXNldi1raXQuZHRzIHwgIDM3ICsrKy0KIC4u
Li9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbXBmcy10eXNvbS1tLmR0cyB8ICAzNSArKystCiBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLmR0c2kgICAgICAgfCAgMzcgKysrLQog
ZHJpdmVycy9ncGlvL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRy
aXZlcnMvZ3Bpby9ncGlvLW1wZnMuYyAgICAgICAgICAgICAgICAgICAgICB8IDEyMiArKysrKysr
KysrKy0KIGRyaXZlcnMvc29jL21pY3JvY2hpcC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAx
MSArKwogZHJpdmVycy9zb2MvbWljcm9jaGlwL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAx
ICsKIGRyaXZlcnMvc29jL21pY3JvY2hpcC9tcGZzLWlycW11eC5jICAgICAgICAgICB8IDE4MSAr
KysrKysrKysrKysrKysrKysKIDE3IGZpbGVzIGNoYW5nZWQsIDY3MyBpbnNlcnRpb25zKCspLCA2
NCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc29jL21pY3JvY2hpcC9taWNyb2NoaXAsbXBmcy1pcnFtdXgueWFtbAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21pY3JvY2hpcC9tcGZzLWlycW11eC5jCgotLSAK
Mi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
