Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C5DC4167D
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CoNETZ8Kn2JYLlCLEBYZHyq20A2SON6z2qC28XV6Ps=; b=Em0lHsws86zfJJ
	hzJfwu6YvKuPsx5g5AoLZVYbfBIMcH0yY+T4qyXRgO8ZZko/aGPS3pwLuacnk3DolCMfnWOCLaa56
	Gsx/pJos5TeSk3cHFGkizgy3vCr0+xgOc4ndlOGnuy5A7uK+z6hCZswjRtcodMO16qCP6IznR6Otm
	4qaZMidWo688bTQcuLJrh1A+MCfmpm2j0LXYIkILJEOE/cGCxVFcIQzTFU3Ju5D+Zl3/WhkCxBwu9
	AscRp0tokWL0JiiD3DWFjeNOR24I+hx58jIxYtKTOPLMQbJv8wPhrA+m7zN1Ytb3AwEqlbNaJQlrE
	2ttA8dLwtMKT/FCgIzBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23nC-00BkW5-1e;
	Sun, 12 Nov 2023 06:17:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23n9-00BkSs-18
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:17:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91CAE60B80;
	Sun, 12 Nov 2023 06:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5733CC433CD;
	Sun, 12 Nov 2023 06:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769874;
	bh=i54fNqJU7sp4UXlnwp+YcKfJLY+fhfGViunXjtd8s+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dYK86b7k9E9ZF7LvDQjIBzOpnNCn2Tujmh+DY478+1v491siLxIcYO0XXQgtr9EVD
	 YkEwCIQ4bhW7o/fcNbcZb/CyIbKvZVeIM0ZLvKgqSNz4mE/hbpOofOpaq6KIteEm2E
	 NDE1JUNUwoUxAErCY+HvrykIdHI4hC1y1H7uBvjC/mftXKkKthQD4PY0PVlpMSh0Fm
	 cBcLqp+5nzEVrOpEydk2FAcQcTNNnk1nFA7kKzCu1WTF+KacRCT6G0Lar9mOQr9EnD
	 l8PhPryyGvgqTaJ/BJl4gFTdKbC3Ci7jYtE4dnIr6q2i9ZItvDNaYcZH7K7ew3DzqS
	 7DQjQWfnd13tQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 24/38] riscv: s64ilp32: Add TImode (128 int) support
Date: Sun, 12 Nov 2023 01:15:00 -0500
Message-Id: <20231112061514.2306187-25-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221755_429938_469CACA8 
X-CRM114-Status: UNSURE (   7.75  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVGhlIHM2NGlscDMyIHVz
ZXMgNjRiaXQgY29tcGlsZXIsIHNvIGl0IGNvdWxkIHN1cHBvcnQg4oCcVGV0cmEKSW50ZWdlcuKA
nSBtb2RlLCB3aGljaCByZXByZXNlbnRzIGEgc2l4dGVlbi1ieXRlICgxMjgpIGludGVnZXIuCgpJ
dCdzIHRoZSBmaXJzdCAzMkJJVCBsaW51eCBzdXBwb3J0IFRJbW9kZSA6KQoKU2lnbmVkLW9mZi1i
eTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KLS0tCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICB8IDEg
KwogYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9L
Y29uZmlnCmluZGV4IDBmYzAzYWEwNzZlNi4uYTQ1ZTMxZWYzYjJjIDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L0tjb25maWcKKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCkBAIC0zMzksNiArMzM5LDcg
QEAgY29uZmlnIEFSQ0hfUlY2NEkKIGNvbmZpZyBBUkNIX1JWNjRJTFAzMgogCWJvb2wgIlJWNjRJ
TFAzMiIKIAlkZXBlbmRzIG9uIE5PTlBPUlRBQkxFCisJc2VsZWN0IEFSQ0hfU1VQUE9SVFNfSU5U
MTI4IGlmICEkKGNjLW9wdGlvbiwkKG02NC1mbGFnKSAtRF9fU0laRU9GX0lOVDEyOF9fPTApCiAJ
c2VsZWN0IDMyQklUCiAJc2VsZWN0IE1NVQogCXNlbGVjdCBWRFNPNjRJTFAzMgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2xpYi9NYWtlZmlsZQppbmRl
eCAyNmNiMjUwMmVjZjguLjY4YWY0NjM3OTVlMSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9saWIv
TWFrZWZpbGUKKysrIGIvYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUKQEAgLTksNSArOSw2IEBAIGxp
Yi15CQkJKz0gc3RybmNtcC5vCiBsaWItJChDT05GSUdfTU1VKQkrPSB1YWNjZXNzLm8KIGxpYi0k
KENPTkZJR182NEJJVCkJKz0gdGlzaGlmdC5vCiBsaWItJChDT05GSUdfUklTQ1ZfSVNBX1pJQ0JP
WikJKz0gY2xlYXJfcGFnZS5vCitsaWItJChDT05GSUdfQVJDSF9SVjY0SUxQMzIpICs9IHRpc2hp
ZnQubwogCiBvYmotJChDT05GSUdfRlVOQ1RJT05fRVJST1JfSU5KRUNUSU9OKSArPSBlcnJvci1p
bmplY3QubwotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
