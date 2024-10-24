Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B32CE8E6E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRCMcyuclhvWMD6NCqJEvqGwCa/qlwRqb5eMLwX5opU=; b=eZxmWZhgA8OzMW
	uzCzrjnCDMtCrGnoJvHIN/pv7M8VpcGKEJdU+Pmf3eW566xgnAsU3y2y0E3Pn1E/H1lBFQavLUEfA
	UGjfqslMiBR/JL2F/uVWh8s5lTM+KbLKF2h0npAVVU8akera2PvhndUL5HgLTLyxBw5IzQHSi+L2g
	3Vn8Z+u2Xj6PRp1JdhJZFv0c6YcPDIfcEFP4PdGzKqAyQL/4BtAuNdsH9FkxuGDh9WZVXwrOEkTQw
	GSod6HUPeEpCqOeO1qvg6DT5e2xWvltNnZNs9coD6c/ijer0yVHMY6n/KE1+Cf3BIYT+RRRYHpLiE
	Xfma16RfC3Oe8ZJMXj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x7m-00000000MyC-0n7q;
	Thu, 24 Oct 2024 12:39:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x3A-00000000M2u-1cI3
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 12:34:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 448BA5C5F0D;
	Thu, 24 Oct 2024 12:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31664C4CECC;
	Thu, 24 Oct 2024 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729773287;
	bh=hcHQ85R98EralwanuOTJcKXBev45BYhijHl4CsbVU8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fwlgVcWohf/PXX/NXbuf6IhjVQcE6oIeCiieIkydcuP/6t2WN6L8/5hjL3cV9j4Kn
	 pdisnl936vFNrkfznY3+tiFTMJ1+SibbZeAanZB28AyRHxBZgbkWitgdsSgF/32k6N
	 +a+mukmFxGSjMqij0th5tobFLDzMCiew3jTPGkHduQ3fV1AbhvjvLZNX1iYIFlImVB
	 OYzw5QroUsCKCLrV9p+S7UXFK9ndLg+vgfFw6YrN+UJOt2+QMiz+CRxN7sAR35Em17
	 d+HkphUY1goR++ttyX4JEb3vL7Rqeb0FmTQwwGRobco9wwJSpDcM+Pmy3M3LaLcV1/
	 9mF+no4iqgnXg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/5] dt-bindings: riscv: add vector sub-extension dependencies
Date: Thu, 24 Oct 2024 13:34:32 +0100
Message-ID: <20241024-shrink-eligibly-b5a4325fa286@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024-fanning-enrage-bcc39f8ed47d@spud>
References: <20241024-fanning-enrage-bcc39f8ed47d@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2334; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=DCTAFUzYk9DPluUbp/0vltmkI6PevBaQollD7j8w0BM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlSdtfmT3FZzrp91XWh/0yTOp/lan56v6BUt1Vlys+eZ zM12WdO7ChlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEvsxjZJjrzNR/Y0HK+fdN 17Z4dIib2b0w6ym+zHnQfk1izLEnypUM/x3+rKtfvrr9842re49ELJM7kj5BZOeuvR7+bKn88SJ ywnwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_053448_956221_186FE923 
X-CRM114-Status: UNSURE (   7.46  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClNlY3Rpb24g
MzMuMTguMi4gWnZlKjogVmVjdG9yIEV4dGVuc2lvbnMgZm9yIEVtYmVkZGVkIFByb2Nlc3NvcnMK
aW4gWzFdIHNheXM6CnwgVGhlIFp2ZTMyZiBhbmQgWnZlNjR4IGV4dGVuc2lvbnMgZGVwZW5kIG9u
IHRoZSBadmUzMnggZXh0ZW5zaW9uLiBUaGUgWnZlNjRmIGV4dGVuc2lvbiBkZXBlbmRzCnwgb24g
dGhlIFp2ZTMyZiBhbmQgWnZlNjR4IGV4dGVuc2lvbnMuIFRoZSBadmU2NGQgZXh0ZW5zaW9uIGRl
cGVuZHMgb24gdGhlIFp2ZTY0ZiBleHRlbnNpb24KCnwgVGhlIFp2ZTMyeCBleHRlbnNpb24gZGVw
ZW5kcyBvbiB0aGUgWmljc3IgZXh0ZW5zaW9uLiBUaGUgWnZlMzJmIGFuZCBadmU2NGYgZXh0ZW5z
aW9ucyBkZXBlbmQKfCB1cG9uIHRoZSBGIGV4dGVuc2lvbgoKfCBUaGUgWnZlNjRkIGV4dGVuc2lv
biBkZXBlbmRzIHVwb24gdGhlIEQgZXh0ZW5zaW9uCgpBcHBseSB0aGVzZSBydWxlcyB0byB0aGUg
YmluZGluZ3MgdG8gaGVscCBwcmV2ZW50IGludmFsaWQgY29tYmluYXRpb25zLgoKTGluazogaHR0
cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvcmVsZWFzZXMvdGFnL3Jpc2N2
LWlzYS1yZWxlYXNlLTY5OGU2NGEtMjAyNC0wOS0wOSBbMV0KUmV2aWV3ZWQtYnk6IENsw6ltZW50
IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA0NiArKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCmluZGV4IGM2OTdi
ZTY0ZDNiZmMuLjIwY2VhZDdkOGFmNzEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbApAQCAtNjEyLDYgKzYxMiw1
MiBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgIGNvbnRhaW5zOgogICAgICAgICAgICAgY29uc3Q6
IHpjYQogCisgICAgICAtIGlmOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29u
c3Q6IHp2ZTMyeAorICAgICAgICB0aGVuOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAg
ICAgY29uc3Q6IHppY3NyCisKKyAgICAgIC0gaWY6CisgICAgICAgICAgY29udGFpbnM6CisgICAg
ICAgICAgICBjb25zdDogenZlMzJmCisgICAgICAgIHRoZW46CisgICAgICAgICAgYWxsT2Y6Cisg
ICAgICAgICAgICAtIGNvbnRhaW5zOgorICAgICAgICAgICAgICAgIGNvbnN0OiBmCisgICAgICAg
ICAgICAtIGNvbnRhaW5zOgorICAgICAgICAgICAgICAgIGNvbnN0OiB6dmUzMngKKworICAgICAg
LSBpZjoKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6dmU2NHgKKyAg
ICAgICAgdGhlbjoKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6dmUz
MngKKworICAgICAgLSBpZjoKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0
OiB6dmU2NGYKKyAgICAgICAgdGhlbjoKKyAgICAgICAgICBhbGxPZjoKKyAgICAgICAgICAgIC0g
Y29udGFpbnM6CisgICAgICAgICAgICAgICAgY29uc3Q6IGYKKyAgICAgICAgICAgIC0gY29udGFp
bnM6CisgICAgICAgICAgICAgICAgY29uc3Q6IHp2ZTMyZgorICAgICAgICAgICAgLSBjb250YWlu
czoKKyAgICAgICAgICAgICAgICBjb25zdDogenZlNjR4CisKKyAgICAgIC0gaWY6CisgICAgICAg
ICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogenZlNjRkCisgICAgICAgIHRoZW46Cisg
ICAgICAgICAgYWxsT2Y6CisgICAgICAgICAgICAtIGNvbnRhaW5zOgorICAgICAgICAgICAgICAg
IGNvbnN0OiBkCisgICAgICAgICAgICAtIGNvbnRhaW5zOgorICAgICAgICAgICAgICAgIGNvbnN0
OiB6dmU2NGYKKwogYWxsT2Y6CiAgICMgWmNmIGV4dGVuc2lvbiBkb2VzIG5vdCBleGlzdCBvbiBy
djY0CiAgIC0gaWY6Ci0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
