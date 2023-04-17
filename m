Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F663C77B7C
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UO5puVmL1d3Y0j655IhDNhySTo6L6IVpU3uZLSgodko=; b=YUix9t6W27cKfF
	vfR+mIMQODJ4ba+mep0KixaOpr5kqyMaX+i2df1eOtFFpQzDBzL8sCPjPwIQu7bzFa0XaNOfwy8BB
	yzFre+6uFnVlpJ83pE1/nm3MTzlZE4bmLv2eDIEjcZRtQDk9QThWQMOQCUQQ8FEjvamH5m6Aj4iI0
	dsqkXzulLGXSt6xaJ6HinyIMcNSe5is+tSCggOJNJalOZ8+b3+HTl6/9BOMuws1iFlv7brFq3UfEi
	eULg22K06DBbIw+ufpxhB4t7P6l5NR+AAukCI4ho8jS4MK4YCd4KMuLy9qQznQU9iXZ3awUMmAG+/
	A2OeGVoOICoyPzBQtVtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIj-00Gz9g-21;
	Mon, 17 Apr 2023 16:01:57 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIb-00Gz4w-32
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 16:01:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1681747301;
	bh=XQlx2gfhYVYTVTKE2b7b3AkIPTy7p0etRMsaAd4EBhM=;
	h=From:Subject:Date:To:Cc:From;
	b=Cb0GIsGN0XJa5vKhJMhBxir7d1dKu2zsQPf6QrSBCGDI4aLn186iwcl/Sf8uj7WBX
	 fDHEgpOCRzXd2cf/234vZjJFzdBdjWcyhBJC9vOyNa4zLJS7IcnKCEwsJ27SF5y8K6
	 P9jgckvnSIu+CXtUEvAqhzLbecdKebbmQDdnIkO0=
Subject: [PATCH 0/6] tools/nolibc: add stackprotector support for more
 architectures
Date: Mon, 17 Apr 2023 18:01:30 +0200
Message-Id: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFptPWQC/x2NQQoCMQwAv7LkbKBbSxW/Ih7aGG2wtEuyirDs3
 y0eZw4zGxirsMFl2kD5Iya9DZgPE1BJ7cko98HgnT+64M7YepVMaGui16J9ZVq7YlIqhsH7EOI
 pxDkyjEJOxpg1NSqj0d61DrkoP+T7X15v+/4DzKE0OIIAAAA=
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681747300; l=1475;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=XQlx2gfhYVYTVTKE2b7b3AkIPTy7p0etRMsaAd4EBhM=;
 b=qK6Yh6oq3WNWYvM3oZZoIsRVkSBvRo/oCtXhrNZBjBIHVbnEv1fFIukoadOuBKL1w+ghsru+S
 07bK6zvGgJjD9Jj5LTB2BU3yF9h4RBjWCTtzz804+1JZ2354S8F+FgP
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_090150_132244_DEF49666 
X-CRM114-Status: UNSURE (   5.86  )
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

QWRkIHN0YWNrcHJvdGVjdG9yIHN1cHBvcnQgZm9yIGFsbCByZW1haW5pbmcgYXJjaGl0ZWN0dXJl
cywgZXhjZXB0IHMzOTAuCgpPbiBzMzkwIHRoZSBzdGFja3Byb3RlY3RvcnMgYXJlIG5vdCBzdXBw
b3J0ZWQgaW4gImdsb2JhbCIgbW9kZTsgb25seQoic3lzcmVnIiBtb2RlIHdoaWNoIGlzIG5vdCBz
dXBwb3JlZCBpbiBub2xpYmMuCgpUaGUgc2VyaWVzIGFsc28gY29udGFpbnMgYSBzbWFsbCBvcHRp
bWl6YXRpb24gdG8gc3RyYWNlIG91dHB1dCBkdXJpbmcKZXhlY3V0aW9uIG9mIG5vbGliYy10ZXN0
LgoKVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gdGhlIDIwMjMwNDE1LW5vbGliYy11cGRhdGVzLTRh
IGJyYW5jaCBvZiB0aGUKbm9saWJjIHRyZWUuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59z
Y2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+Ci0tLQpUaG9tYXMgV2Vpw59zY2h1aCAoNik6CiAg
ICAgIHNlbGZ0ZXN0cy9ub2xpYmM6IHJlZHVjZSBzeXNjYWxscyBkdXJpbmcgc3BhY2UgcGFkZGlu
ZwogICAgICB0b29scy9ub2xpYmM6IHJpc2N2OiBhZGQgc3RhY2twcm90ZWN0b3Igc3VwcG9ydAog
ICAgICB0b29scy9ub2xpYmM6IGFhcmNoNjQ6IGFkZCBzdGFja3Byb3RlY3RvciBzdXBwb3J0CiAg
ICAgIHRvb2xzL25vbGliYzogYXJtOiBhZGQgc3RhY2twcm90ZWN0b3Igc3VwcG9ydAogICAgICB0
b29scy9ub2xpYmM6IGxvb25nYXJjaDogYWRkIHN0YWNrcHJvdGVjdG9yIHN1cHBvcnQKICAgICAg
dG9vbHMvbm9saWJjOiBtaXBzOiBhZGQgc3RhY2twcm90ZWN0b3Igc3VwcG9ydAoKIHRvb2xzL2lu
Y2x1ZGUvbm9saWJjL2FyY2gtYWFyY2g2NC5oICAgICAgICAgIHwgIDcgKysrKysrLQogdG9vbHMv
aW5jbHVkZS9ub2xpYmMvYXJjaC1hcm0uaCAgICAgICAgICAgICAgfCAgNyArKysrKystCiB0b29s
cy9pbmNsdWRlL25vbGliYy9hcmNoLWxvb25nYXJjaC5oICAgICAgICB8ICA3ICsrKysrKy0KIHRv
b2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtbWlwcy5oICAgICAgICAgICAgIHwgIDggKysrKysrKy0K
IHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtcmlzY3YuaCAgICAgICAgICAgIHwgIDcgKysrKysr
LQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlICAgICAgfCAgNSArKysr
KwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMgfCAxNSArKysr
KysrKysrKy0tLS0KIDcgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKLS0tCmJhc2UtY29tbWl0OiBlMzUyMTRlYTlkYjc0NzdhMDJlNjdhOGI0MTJlODA0NjUz
NGJiOTdjCmNoYW5nZS1pZDogMjAyMzA0MDgtbm9saWJjLXN0YWNrcHJvdGVjdG9yLWFyY2hzLTQy
MjQ0Njc0NjE2ZQoKQmVzdCByZWdhcmRzLAotLSAKVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdl
aXNzc2NodWgubmV0PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
