Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49D2606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 17:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KZAdtVnH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=oYDVBy24
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SXXYh1RG9KnO6g0EePlrShzezasnUoxA//6JOY46RY4=; b=KZAdtVnHQ0otayq8JPwl/b8BaS
	1G0qYmL6551JkB3CH2S66Kvk9Ek7oD7f3N4Zs7CMPrKlCPcAC1MPj2L7xGUo8UZgZDNB4/Mfa3z5n
	eh9FARL4YW4H+1yko3bz60GJ8tbzbQRMZlP+Oa3qLAMWZrynKLaEKlix5TybUFTRAAzX1mAHDq5qm
	oDq4d8u0FDTRqYcEqojXcQd3QI8e8pV9Q0AzINoTXT+84NaBjQJQTmp0vmwEbQsABLiLSE7YfqpmQ
	+cXjnkJz0YgdX/o489bPYmSBpcptwybqteO68FcpPE/NfIJYSerabXrWy6u9MHyhvxWlUJgGa50Hr
	9bzflgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTbP-00000001Q63-0Mzl;
	Mon, 09 Nov 2026 17:56:19 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTbK-00000001Q5P-3bgE
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 17:56:18 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id E539B20D174F;
	Mon,  9 Nov 2026 18:56:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id CA90220D1763;
	Mon,  9 Nov 2026 18:56:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr CA90220D1763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794246971;
	bh=if0cEUuJl6s7o+37uuaoQnPEf1nh2eR1DDff4vzhVvw=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=oYDVBy24embrLcOhPvc9Soom3Wb65A7jOH7HnOfsg25PrEG3kA9kjALksaYLGTVFN
	 tXhemg5Ep+rY8ADfNrM5Af6yYCG6kO0qgQ1t0CdApljhd2Zfsb4ghSQERIis1mTttn
	 dqkBnOIqcruJvOnGG4VsTKUSOd0o59qwY1phmkGT9YAwdDSGe99EGCf/LIS/sqeMpQ
	 9HJIRj2n/2l8txgZBH9PxyNgn17Aebx83JMa2cY9xmCqh5STI47qlb/NhQwwzzHBH0
	 L8j66/G2oFEG/YmQ6l/Xx5tupok6+anikzA/UGQzmLM7C5DZKjhNab8PQhJRNASYYn
	 O2HozvcdvJwwA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id Gr6o4wC3rV3i; Mon,  9 Nov 2026 18:56:11 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 5236220D174F;
	Mon,  9 Nov 2026 18:56:11 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: defconfig: enable onboard USB hub support
Date: Mon,  9 Nov 2026 18:55:49 +0100
Message-ID: <20261109175555.323067-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095616_737942_5DC10361 
X-CRM114-Status: GOOD (  10.29  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIEJhbmFuYSBQaSBCUEktRjMgKFNwYWNlbWlUIEsxKSBoYXMgYSBWTDgxNyBVU0IgMy4wIGh1
YiBiZWhpbmQgaXRzCkRXQzMgY29udHJvbGxlci4gVGhlIGh1YidzIHBvd2VyIGFuZCByZXNldCBj
b21lIGZyb20gdGhlCiJ1c2IyMTA5LDI4MTciIGFuZCAidXNiMjEwOSw4MTciIG5vZGVzIGluIHRo
ZSBkZXZpY2UgdHJlZSwgd2hpY2ggbmVlZAp0aGUgb25ib2FyZF91c2JfZGV2IGRyaXZlci4gV2l0
aG91dCBpdCwgdGhlIGh1YiByZWd1bGF0b3IgKFVTQjMwX0hVQikKc3RheXMgb2ZmIGFuZCB0aGUg
Ym9hcmQncyBmb3VyIFVTQi1BIHBvcnRzIGFyZSBkZWFkLgoKRW5hYmxlIFVTQl9PTkJPQVJEX0RF
ViBhcyBhIG1vZHVsZSwgYXMgYXJtNjQgZGVmY29uZmlnIGRvZXMuCgpUZXN0ZWQgb24gYSBCYW5h
bmEgUGkgQlBJLUYzIHdpdGggdjcuNC1yYzEgKGR3YzMgZW5hYmxlZCBhcyBhIG1vZHVsZSk6CnRo
ZSBtb2R1bGUgYXV0b2xvYWRzLCB0aGUgaHViIGNvbWVzIHVwIG9uIGJvdGggYnVzZXMgYW5kIGEg
VVNCIG1vdXNlCm9uIGEgVVNCLUEgcG9ydCB3b3Jrcy4gV2l0aG91dCBpdCwgb25seSB0aGUgcm9v
dCBodWJzIGFyZSBzZWVuLgoKVGhpcyBwYXRjaCB3YXMgcHJlcGFyZWQgd2l0aCB0aGUgaGVscCBv
ZiBhbiBBSSBhc3Npc3RhbnQgKENsYXVkZSksCndoaWNoIGFsc28gcmFuIHRoZSBidWlsZCBhbmQg
Ym9vdCB0ZXN0cy4KClNpZ25lZC1vZmYtYnk6IEZyw6lkw6lyaWMgTWFow6kgPGZyZWRlcmljLm1h
aGVAY2lyYWQuZnI+Ci0tLQogYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25m
aWdzL2RlZmNvbmZpZyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKaW5kZXggMDRhZTMw
NS4uOGZiNmQ3ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZworKysg
Yi9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnCkBAIC0yMjIsNiArMjIyLDcgQEAgQ09ORklH
X1VTQl9DRE5TM19IT1NUPXkKIENPTkZJR19VU0JfQ0ROUzNfU1RBUkZJVkU9bQogQ09ORklHX1VT
Ql9NVVNCX0hEUkM9bQogQ09ORklHX1VTQl9NVVNCX1NVTlhJPW0KK0NPTkZJR19VU0JfT05CT0FS
RF9ERVY9bQogQ09ORklHX05PUF9VU0JfWENFSVY9bQogQ09ORklHX1VTQl9HQURHRVQ9eQogQ09O
RklHX1VTQl9DT05GSUdGUz1tCgpiYXNlLWNvbW1pdDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEzNDVl
M2EyMGQyMTgyOWFhZTdlNAotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
