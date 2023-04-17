Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D958C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 16:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3161DB7f0vHB4Q6vO2u0D7LyoacSm3zzkmq/9XSy3Y=; b=FAjFMXDjaLJZGt
	FdZElND1uwgZeuj1IGiTvuDul6eUklRzv+sljq3Fp7GlcUKLCAeRZSl7yLMp5naN/4WvLIEPh/Ctp
	DrVyJTZbERTbLaG6KpDpwoTwrtnczXY0XGILvT9FQLJcM6VrSrrvard1QYxPUpKfYWAQ4xt4xoyBY
	zrd00XwhPxTjg0rbhuYgBxXVB5gz9i05ZnIwjHCg3u7NwL0FxIA2W6Ygu1fn2uZYUlwZCjeGnGbUg
	Q1ay0ejq/ELT8kj4MuUA23Ew19nvH+3UShy4qpBtSQ3DTi4djftgC2Ec3eV0xgyotktzCkCHFn1xq
	1dnxOpTFVdWag2GRV21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIf-00Gz7y-0d;
	Mon, 17 Apr 2023 16:01:53 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIa-00Gz57-36
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 16:01:51 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1681747301;
	bh=SV0Pfjea32iU3JBvNhAyFOVe6JmW/5ny34KehlAaMpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lWv1JXoYtakTyiNDYa/TeNwAU31PURgcwCqVsGD4/q5qFlBxCY0h1y5ejdkSCnJ20
	 Z47/xWEwPa+FMm80bhxbU9c0OFjQ4UrcO43l81++9ogfrn57E4iYrX1B5yAu6GAIir
	 FaaxpWRVks96uRnB9CIAWnH6AEOpZM/37KEuCDDA=
Date: Mon, 17 Apr 2023 18:01:34 +0200
Subject: [PATCH 4/6] tools/nolibc: arm: add stackprotector support
MIME-Version: 1.0
Message-Id: <20230408-nolibc-stackprotector-archs-v1-4-271f5c859c71@weissschuh.net>
References: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
In-Reply-To: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681747300; l=1785;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=SV0Pfjea32iU3JBvNhAyFOVe6JmW/5ny34KehlAaMpA=;
 b=EB+dNZdkDJrv6azXMGBN10cFMiivbrmQOw2HL0nVG2U9hWxrpdzMeQwV5Sy22HibCOaIooGPb
 JxG5x4qjtw+Dv3Db1ADLT9rS6NSajpzDvv2Uwu+cMIcxCwn+uhuvHGN
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_090149_640867_7139BB6E 
X-CRM114-Status: UNSURE (   7.90  )
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
LS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtYXJtLmggICAgICAgICB8IDcgKysrKysrLQog
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlIHwgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L2luY2x1ZGUvbm9saWJjL2FyY2gtYXJtLmggYi90b29scy9pbmNsdWRlL25vbGliYy9hcmNoLWFy
bS5oCmluZGV4IDJlYWIxYWVmMzIxYi4uMjAyZTY0ZjUzN2RjIDEwMDY0NAotLS0gYS90b29scy9p
bmNsdWRlL25vbGliYy9hcmNoLWFybS5oCisrKyBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gt
YXJtLmgKQEAgLTE5OSwxMCArMTk5LDE1IEBAIHN0cnVjdCBzeXNfc3RhdF9zdHJ1Y3QgewogY2hh
ciAqKmVudmlyb24gX19hdHRyaWJ1dGVfXygod2VhaykpOwogY29uc3QgdW5zaWduZWQgbG9uZyAq
X2F1eHYgX19hdHRyaWJ1dGVfXygod2VhaykpOwogCisjZGVmaW5lIF9fQVJDSF9TVVBQT1JUU19T
VEFDS19QUk9URUNUT1IKKwogLyogc3RhcnR1cCBjb2RlICovCi12b2lkIF9fYXR0cmlidXRlX18o
KHdlYWssbm9yZXR1cm4sb3B0aW1pemUoIm9taXQtZnJhbWUtcG9pbnRlciIpKSkgX3N0YXJ0KHZv
aWQpCit2b2lkIF9fYXR0cmlidXRlX18oKHdlYWssbm9yZXR1cm4sb3B0aW1pemUoIm9taXQtZnJh
bWUtcG9pbnRlciIpLG5vX3N0YWNrX3Byb3RlY3RvcikpIF9zdGFydCh2b2lkKQogewogCV9fYXNt
X18gdm9sYXRpbGUgKAorI2lmZGVmIE5PTElCQ19TVEFDS1BST1RFQ1RPUgorCQkiYmwgX19zdGFj
a19jaGtfaW5pdFxuIiAgICAgICAvKiBpbml0aWFsaXplIHN0YWNrIHByb3RlY3RvciAgICAgICAg
ICAgICAgICAgICAgICAgICAgKi8KKyNlbmRpZgogCQkicG9wIHslcjB9XG4iICAgICAgICAgICAg
ICAgICAvKiBhcmdjIHdhcyBpbiB0aGUgc3RhY2sgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKi8KIAkJIm1vdiAlcjEsICVzcFxuIiAgICAgICAgICAgICAgLyogYXJndiA9IHNwICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCiAKZGlmZiAtLWdpdCBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL25vbGliYy9NYWtlZmlsZQppbmRleCBkNjhlOTZhZmVhODAuLjhmZWZmYzc5MGEzMSAx
MDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlCisrKyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQpAQCAtODMsNiArODMsNyBA
QCBDRkxBR1NfU1RLUF9pMzg2ID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCiBDRkxBR1NfU1RL
UF94ODZfNjQgPSAkKENGTEFHU19TVEFDS1BST1RFQ1RPUikKIENGTEFHU19TVEtQX3g4NiA9ICQo
Q0ZMQUdTX1NUQUNLUFJPVEVDVE9SKQogQ0ZMQUdTX1NUS1BfYXJtNjQgPSAkKENGTEFHU19TVEFD
S1BST1RFQ1RPUikKK0NGTEFHU19TVEtQX2FybSA9ICQoQ0ZMQUdTX1NUQUNLUFJPVEVDVE9SKQog
Q0ZMQUdTX1NUS1BfcmlzY3YgPSAkKENGTEFHU19TVEFDS1BST1RFQ1RPUikKIENGTEFHU19zMzkw
ID0gLW02NAogQ0ZMQUdTICA/PSAtT3MgLWZuby1pZGVudCAtZm5vLWFzeW5jaHJvbm91cy11bndp
bmQtdGFibGVzIC1zdGQ9Yzg5IFwKCi0tIAoyLjQwLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
