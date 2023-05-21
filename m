Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C12C77B73
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcAPLpP7dAbDfrQEHuryjaa6FKAry+t8Rnmn9Rj+VoA=; b=kdvTqBCeQ6y9XP
	BFCQSnE6GMD2L1812jeVamygBHEU6pvLWXYsZQyR6+tDOW9hL+a6YTQprOhh6Ou3ZiWDg+LUgQsAS
	/fosuKZf/hBZa9iOpFdMY6a9Vj1hDthQwJfyoxsfyVIdAQXkTXW3mXaxQLTL2vqTa3favFTaUBQsG
	WXg7nyQK1YL51GOnoqCQmA5mHHQi6a9zaIo5oO3bvbub2CvcqVUKkyxvsF8mNG1xnYzgoxUo8uBG3
	kyWE9IUibLjLxlruOEUNCNSl0txMHBalYV93/xfWIesz4b6Vo76R9VTVN0nE6xDCzHKbIum4kKZs8
	1VyPh30vzCvJpAfc0k9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUr-003Vcy-2b;
	Sun, 21 May 2023 09:37:01 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUn-003Va7-0k
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:36:59 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684661803;
	bh=oLTaTevv3k80SApzPl3sC5k69tzfv/sUdDz9hEu9AXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EVIsm97U6hspOISLz9ZkoZ//yLstU5Paxq2AbGwXTOMqrQbGKyFY0AH9JSYJPwldQ
	 4RGacL4K8+kn2z5fmBIN0ip99iQ/Kz5Pturk+/Of9nX1yVmMXX91Xv1Zz15tgi9oY6
	 3qo9uvtT7IdogZqQbFO5ZQrxu4Quvu8oCON6CzjE=
Date: Sun, 21 May 2023 11:36:32 +0200
Subject: [PATCH 4/7] tools/nolibc: add test for __stack_chk_guard
 initialization
MIME-Version: 1.0
Message-Id: <20230521-nolibc-automatic-stack-protector-v1-4-dad6c80c51c1@weissschuh.net>
References: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
In-Reply-To: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684661802; l=737;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=oLTaTevv3k80SApzPl3sC5k69tzfv/sUdDz9hEu9AXU=;
 b=8XeDn2bNa5olwhqFKmuOVv/Y2l1qpUlcqMMKVlNWL29/GDmokGkH5PtrMdPY2qmVkaOW+rQMG
 ukmwfsiBBjjBGSgBiSPqAT5uQqfU3LNeeObcPPkOlh4tTWg/TZJiFcq
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_023657_787253_2968987A 
X-CRM114-Status: UNSURE (   6.72  )
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
LS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMKaW5kZXggZDhiNTljOGY2YzAzLi45OTVkYzM5
YTE3N2UgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMt
dGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5j
CkBAIC04MDgsNiArODA4LDE0IEBAIHN0YXRpYyBpbnQgcnVuX3Byb3RlY3Rpb24oaW50IG1pbiwg
aW50IG1heCkKIAlyZXR1cm4gMDsKICNlbmRpZgogCisjaWYgZGVmaW5lZChOT0xJQkNfU1RBQ0tQ
Uk9URUNUT1IpCisJaWYgKCFfX3N0YWNrX2Noa19ndWFyZCkgeworCQlsbGVuICs9IHByaW50Zigi
X19zdGFja19jaGtfZ3VhcmQgbm90IGluaXRpYWxpemVkIik7CisJCXBhZF9zcGMobGxlbiwgNjQs
ICJbRkFJTF1cbiIpOworCQlyZXR1cm4gMTsKKwl9CisjZW5kaWYKKwogCXBpZCA9IC0xOwogCXBp
ZCA9IGZvcmsoKTsKIAoKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
