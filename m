Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1D3C77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 16:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElXTOkt2TTq4thqTZ5o0J6f7XeYMj/PDUhQ7RwA52Ug=; b=L587Bec+NsIZbY
	FIIy8Xv8g7blZ3gPqm27jcMWk04zMLH1EXmdwgvPQ3CjnCrdXR4usuOxxP0n4KETx7EDZKcahFzSs
	5wqkv03sb1pEt56w1/Y4xdVTDUumqPb2j2E3oXAZFqWNsU6T9OR8DvadkjbAZz6dM/AgLHKEKl8Qn
	wDF+s5f22liTc+BXXcBUsNabTbHhx+tNPBWCYEdm6O4U0P4udXfy6G9Nm2VmvTrojt5ohg1jkUzCo
	8X6Z/OUKUreBfaM/hCHd02G7+MzMo30OM3m+IG8mXMTzeToVL5+jFuISJir1FnVY8+g4A7JLJASQa
	IfDHfYC2YunU0bQwnHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIf-00Gz8g-2s;
	Mon, 17 Apr 2023 16:01:53 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIa-00Gz4z-3B
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 16:01:51 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1681747301;
	bh=zekhJ4z4Fnh6i2mXqzVImhLPZlMmwOwIMhaSEAjmj+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WZbPbKyk+rj+hBkRR5sTSTkN0rQT/zZf+GHgkgo/bmZ7lIPBo11nhYswBsXhJGW9B
	 /yZzLi7J046wb1qbtaFFmYd2eKUhqH711skdOqCMcDHvs2u9mo2LQXLevJZ4a0yAoj
	 K4SVMyc+EQXAStROIqJkxS1gbzVPFzrKq+puN06E=
Date: Mon, 17 Apr 2023 18:01:33 +0200
Subject: [PATCH 3/6] tools/nolibc: aarch64: add stackprotector support
MIME-Version: 1.0
Message-Id: <20230408-nolibc-stackprotector-archs-v1-3-271f5c859c71@weissschuh.net>
References: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
In-Reply-To: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681747300; l=1861;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zekhJ4z4Fnh6i2mXqzVImhLPZlMmwOwIMhaSEAjmj+Q=;
 b=CbAIungh96eUcyDkNCJ3jKLI0AkYfxTl/MiL8raeBi+oIAFJ69Jem8xlgVdBGDgQD0j+0UXiF
 5uGK0wWz+qgDiXIfrmZXdg+p8/8onx3kP1oW++a65k3fQzfhySFeoWE
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_090149_642240_A5C13183 
X-CRM114-Status: UNSURE (   7.64  )
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

U2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0Pgot
LS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtYWFyY2g2NC5oICAgICB8IDcgKysrKysrLQog
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlIHwgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L2luY2x1ZGUvbm9saWJjL2FyY2gtYWFyY2g2NC5oIGIvdG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJj
aC1hYXJjaDY0LmgKaW5kZXggNzZlZjI2NTIwYzg1Li42YTg1OTEzMWM1MzAgMTAwNjQ0Ci0tLSBh
L3Rvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtYWFyY2g2NC5oCisrKyBiL3Rvb2xzL2luY2x1ZGUv
bm9saWJjL2FyY2gtYWFyY2g2NC5oCkBAIC0xNzIsMTAgKzE3MiwxNSBAQCBzdHJ1Y3Qgc3lzX3N0
YXRfc3RydWN0IHsKIGNoYXIgKiplbnZpcm9uIF9fYXR0cmlidXRlX18oKHdlYWspKTsKIGNvbnN0
IHVuc2lnbmVkIGxvbmcgKl9hdXh2IF9fYXR0cmlidXRlX18oKHdlYWspKTsKIAorI2RlZmluZSBf
X0FSQ0hfU1VQUE9SVFNfU1RBQ0tfUFJPVEVDVE9SCisKIC8qIHN0YXJ0dXAgY29kZSAqLwotdm9p
ZCBfX2F0dHJpYnV0ZV9fKCh3ZWFrLG5vcmV0dXJuLG9wdGltaXplKCJvbWl0LWZyYW1lLXBvaW50
ZXIiKSkpIF9zdGFydCh2b2lkKQordm9pZCBfX2F0dHJpYnV0ZV9fKCh3ZWFrLG5vcmV0dXJuLG9w
dGltaXplKCJvbWl0LWZyYW1lLXBvaW50ZXIiKSxub19zdGFja19wcm90ZWN0b3IpKSBfc3RhcnQo
dm9pZCkKIHsKIAlfX2FzbV9fIHZvbGF0aWxlICgKKyNpZmRlZiBOT0xJQkNfU1RBQ0tQUk9URUNU
T1IKKwkJImJsIF9fc3RhY2tfY2hrX2luaXRcbiIgICAvKiBpbml0aWFsaXplIHN0YWNrIHByb3Rl
Y3RvciAgICAgICAgICAgICAgICAgICAgICovCisjZW5kaWYKIAkJImxkciB4MCwgW3NwXVxuIiAg
ICAgLyogYXJnYyAoeDApIHdhcyBpbiB0aGUgc3RhY2sgICAgICAgICAgICAgICAgICAgICAgICAg
ICovCiAJCSJhZGQgeDEsIHNwLCA4XG4iICAgIC8qIGFyZ3YgKHgxKSA9IHNwICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAqLwogCQkibHNsIHgyLCB4MCwgM1xuIiAgICAvKiBl
bnZwICh4MikgPSA4KmFyZ2MgLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZSBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQppbmRleCAwYTgzYWQzODhhMTYuLmQ2
OGU5NmFmZWE4MCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01h
a2VmaWxlCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQpAQCAt
ODIsNiArODIsNyBAQCBDRkxBR1NfU1RBQ0tQUk9URUNUT1IgPSAtRE5PTElCQ19TVEFDS1BST1RF
Q1RPUiBcCiBDRkxBR1NfU1RLUF9pMzg2ID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCiBDRkxB
R1NfU1RLUF94ODZfNjQgPSAkKENGTEFHU19TVEFDS1BST1RFQ1RPUikKIENGTEFHU19TVEtQX3g4
NiA9ICQoQ0ZMQUdTX1NUQUNLUFJPVEVDVE9SKQorQ0ZMQUdTX1NUS1BfYXJtNjQgPSAkKENGTEFH
U19TVEFDS1BST1RFQ1RPUikKIENGTEFHU19TVEtQX3Jpc2N2ID0gJChDRkxBR1NfU1RBQ0tQUk9U
RUNUT1IpCiBDRkxBR1NfczM5MCA9IC1tNjQKIENGTEFHUyAgPz0gLU9zIC1mbm8taWRlbnQgLWZu
by1hc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcyAtc3RkPWM4OSBcCgotLSAKMi40MC4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
