Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD01C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPiEi/5IzCIBvF9AoC6J290pI6oP3tq03DdTehdcTIQ=; b=kqANrzabmzxXYO
	7MG5rc4fCuDlwhje2Bzwn0g05HItH8fo/EQlc+5IXSTn6ZOUHYpRwEuAr488ye6QjeX5A69mFjCCw
	5dzYwSTMpc26hQ3SvBPvkzjphsN4bL9XSnDOjwCiBpV3pa5jkhNPobcRKxSg4zr7vZdeIh2kRSw9Q
	GLPX8FQMz5eDDxhSxUTk5vd1hA438sNTI7yQCnGpCXdaBEsGK1lUaHd8g8q2rCOWsftHSqbF1ud7n
	TxeyaxZ/j7cupesoyE2yeVSjrj7U13JAK5lk9d0el+HckpggzNj2fz2GOhbc6n62sTmecUiJYBKct
	p1FrzGpeinjqNAd/UEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIk-00Gz9y-0j;
	Mon, 17 Apr 2023 16:01:58 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIb-00Gz53-32
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 16:01:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1681747301;
	bh=9096Axbwkb5RULpEWmhmqDxDTfhtR94gJcnvpcVYljc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hzQwJo69/eMSqc5dq85JLzKI3yUdHw/NvcRfp8mtuU+HYH1DFKD6Xdxi6JDWeqi8M
	 AUGR54oBJ7UV7UKIiwWHjFfYlHq0d7lmJgl8YZYVyuQP3CBBu0UU5tWsY8KbX+m9pj
	 QlwCFb9z0YOB/U7zSNrt6kTyXZKtCVG4sL9bQI0c=
Date: Mon, 17 Apr 2023 18:01:32 +0200
Subject: [PATCH 2/6] tools/nolibc: riscv: add stackprotector support
MIME-Version: 1.0
Message-Id: <20230408-nolibc-stackprotector-archs-v1-2-271f5c859c71@weissschuh.net>
References: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
In-Reply-To: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681747300; l=1984;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=9096Axbwkb5RULpEWmhmqDxDTfhtR94gJcnvpcVYljc=;
 b=G2kyIfSoKVPBz/GbvVu4K6RodfnUF9UYUpy4/vKKzawGKD6LgcM4U5ANPLBC+L0xsG5FO0iA0
 a4UzdbTWSHsBeIc6cRypowKluMPEQ5m7M6apMZsDwFnowwAP53abYcF
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_090150_132241_CDC964D5 
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

U2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0Pgot
LS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtcmlzY3YuaCAgICAgICB8IDcgKysrKysrLQog
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlIHwgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L2luY2x1ZGUvbm9saWJjL2FyY2gtcmlzY3YuaCBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gt
cmlzY3YuaAppbmRleCAwZDVmMTVmZGVkYzQuLmIyY2NmZmNjMDc5ZiAxMDA2NDQKLS0tIGEvdG9v
bHMvaW5jbHVkZS9ub2xpYmMvYXJjaC1yaXNjdi5oCisrKyBiL3Rvb2xzL2luY2x1ZGUvbm9saWJj
L2FyY2gtcmlzY3YuaApAQCAtMTczLDE0ICsxNzMsMTkgQEAgc3RydWN0IHN5c19zdGF0X3N0cnVj
dCB7CiBjaGFyICoqZW52aXJvbiBfX2F0dHJpYnV0ZV9fKCh3ZWFrKSk7CiBjb25zdCB1bnNpZ25l
ZCBsb25nICpfYXV4diBfX2F0dHJpYnV0ZV9fKCh3ZWFrKSk7CiAKKyNkZWZpbmUgX19BUkNIX1NV
UFBPUlRTX1NUQUNLX1BST1RFQ1RPUgorCiAvKiBzdGFydHVwIGNvZGUgKi8KLXZvaWQgX19hdHRy
aWJ1dGVfXygod2Vhayxub3JldHVybixvcHRpbWl6ZSgib21pdC1mcmFtZS1wb2ludGVyIikpKSBf
c3RhcnQodm9pZCkKK3ZvaWQgX19hdHRyaWJ1dGVfXygod2Vhayxub3JldHVybixvcHRpbWl6ZSgi
b21pdC1mcmFtZS1wb2ludGVyIiksbm9fc3RhY2tfcHJvdGVjdG9yKSkgX3N0YXJ0KHZvaWQpCiB7
CiAJX19hc21fXyB2b2xhdGlsZSAoCiAJCSIub3B0aW9uIHB1c2hcbiIKIAkJIi5vcHRpb24gbm9y
ZWxheFxuIgogCQkibGxhICAgZ3AsIF9fZ2xvYmFsX3BvaW50ZXIkXG4iCiAJCSIub3B0aW9uIHBv
cFxuIgorI2lmZGVmIE5PTElCQ19TVEFDS1BST1RFQ1RPUgorCQkiY2FsbCBfX3N0YWNrX2Noa19p
bml0XG4iICAgIC8qIGluaXRpYWxpemUgc3RhY2sgcHJvdGVjdG9yICAgICAgICAgICAgICAgICAg
ICAgICAgICAqLworI2VuZGlmCiAJCSJsdyAgICBhMCwgMChzcClcbiIgICAgICAgICAgLyogYXJn
YyAoYTApIHdhcyBpbiB0aGUgc3RhY2sgICAgICAgICAgICAgICAgICAgICAgICAgICovCiAJCSJh
ZGQgICBhMSwgc3AsICJTWlJFRyJcbiIgICAgLyogYXJndiAoYTEpID0gc3AgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICovCiAJCSJzbGxpICBhMiwgYTAsICJQVFJMT0ciXG4i
ICAgLyogZW52cCAoYTIpID0gU1pSRUcqYXJnYyAuLi4gICAgICAgICAgICAgICAgICAgICAgICAg
ICovCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUKaW5kZXggM2M4ZTNhNmY4
OTg1Li4wYTgzYWQzODhhMTYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25v
bGliYy9NYWtlZmlsZQorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZp
bGUKQEAgLTgyLDYgKzgyLDcgQEAgQ0ZMQUdTX1NUQUNLUFJPVEVDVE9SID0gLUROT0xJQkNfU1RB
Q0tQUk9URUNUT1IgXAogQ0ZMQUdTX1NUS1BfaTM4NiA9ICQoQ0ZMQUdTX1NUQUNLUFJPVEVDVE9S
KQogQ0ZMQUdTX1NUS1BfeDg2XzY0ID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCiBDRkxBR1Nf
U1RLUF94ODYgPSAkKENGTEFHU19TVEFDS1BST1RFQ1RPUikKK0NGTEFHU19TVEtQX3Jpc2N2ID0g
JChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCiBDRkxBR1NfczM5MCA9IC1tNjQKIENGTEFHUyAgPz0g
LU9zIC1mbm8taWRlbnQgLWZuby1hc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcyAtc3RkPWM4OSBc
CiAJCSQoY2FsbCBjYy1vcHRpb24sLWZuby1zdGFjay1wcm90ZWN0b3IpIFwKCi0tIAoyLjQwLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
