Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDFFC77B7C
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4aCyd9xeXEKumj8yJGfMsLoW6/i+uIr+hDmN0DjG5qs=; b=VQk+jJYdX5RJ6w
	mRXI2jILNyaQYNeZnUpl0SdyKc995L5EC836A9CWbS4deaQZga1nJN0kNzSqAeWMkUBf55a9pp/mB
	2BQdieMR6XNcIzseFW1XbIg8PrCXkf96zOogcYEVeO7wDFb6rAVp/XqSVAKsqC8RMTQYJI2AvR6Mu
	fT9dW7dsVph5P4rtYHmYMRxHvopH7hqrkobr+0BO8cPyfGza8UCNCi7Dwu0KoU4s1Dg/uiElMury6
	NZRNYXCskklQE4rfHJbgfFHUiu/ebaJGz0mAzzpfsP68aM9M0acI5AuBuHvfKB+n4lChUiNxKWK7J
	U13cQWqYRJTT/ogwSkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIm-00GzBw-0E;
	Mon, 17 Apr 2023 16:02:00 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRIe-00Gz7Y-34
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 16:01:54 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1681747302;
	bh=7JAtwI3C3P/xbRS3GHZabYuHj1wyiMQ9ppPE8nh6168=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WpoZErt0EHw1mQ1j5YnoJf8dhOeV5qO12+XK00Uapv+8i9fhb5pawhHWE+TWthp6O
	 k0CkzLh0HaGJOLMPBHbEFeRb7UE5x1MK32yPEUP/P5q4P1lW/5Mmqa1lGNc27sSwkj
	 Lg+HfGjj8OQxX+f1hvW0HXBCunDIQl5/Gih+7kYQ=
Date: Mon, 17 Apr 2023 18:01:36 +0200
Subject: [PATCH 6/6] tools/nolibc: mips: add stackprotector support
MIME-Version: 1.0
Message-Id: <20230408-nolibc-stackprotector-archs-v1-6-271f5c859c71@weissschuh.net>
References: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
In-Reply-To: <20230408-nolibc-stackprotector-archs-v1-0-271f5c859c71@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681747300; l=1927;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=7JAtwI3C3P/xbRS3GHZabYuHj1wyiMQ9ppPE8nh6168=;
 b=iozURWBM7REeKZo0rYtfFd1FC9qFdufDUvWCJFMpYA9cdyZYwkyNhkDY4aycsW5EaJEgHllPA
 ZiuL3/UUboiAOCtF1+SCsTQsmkj3cUg4PycI16wiDTxXNluKC8ZobuC
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_090153_164944_CE3D46D6 
X-CRM114-Status: UNSURE (   8.43  )
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
LS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtbWlwcy5oICAgICAgICB8IDggKysrKysrKy0K
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZSB8IDEgKwogMiBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29s
cy9pbmNsdWRlL25vbGliYy9hcmNoLW1pcHMuaCBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gt
bWlwcy5oCmluZGV4IDg4MjJmMTUwZTcyZi4uNjVjMTljY2M3ZjlkIDEwMDY0NAotLS0gYS90b29s
cy9pbmNsdWRlL25vbGliYy9hcmNoLW1pcHMuaAorKysgYi90b29scy9pbmNsdWRlL25vbGliYy9h
cmNoLW1pcHMuaApAQCAtMTc5LDE0ICsxNzksMjAgQEAgc3RydWN0IHN5c19zdGF0X3N0cnVjdCB7
CiBjaGFyICoqZW52aXJvbiBfX2F0dHJpYnV0ZV9fKCh3ZWFrKSk7CiBjb25zdCB1bnNpZ25lZCBs
b25nICpfYXV4diBfX2F0dHJpYnV0ZV9fKCh3ZWFrKSk7CiAKKyNkZWZpbmUgX19BUkNIX1NVUFBP
UlRTX1NUQUNLX1BST1RFQ1RPUgorCiAvKiBzdGFydHVwIGNvZGUsIG5vdGUgdGhhdCBpdCdzIGNh
bGxlZCBfX3N0YXJ0IG9uIE1JUFMgKi8KLXZvaWQgX19hdHRyaWJ1dGVfXygod2Vhayxub3JldHVy
bixvcHRpbWl6ZSgib21pdC1mcmFtZS1wb2ludGVyIikpKSBfX3N0YXJ0KHZvaWQpCit2b2lkIF9f
YXR0cmlidXRlX18oKHdlYWssbm9yZXR1cm4sb3B0aW1pemUoIm9taXQtZnJhbWUtcG9pbnRlciIp
LG5vX3N0YWNrX3Byb3RlY3RvcikpIF9fc3RhcnQodm9pZCkKIHsKIAlfX2FzbV9fIHZvbGF0aWxl
ICgKIAkJLyoiLnNldCBub21pcHMxNlxuIiovCiAJCSIuc2V0IHB1c2hcbiIKIAkJIi5zZXQgICAg
bm9yZW9yZGVyXG4iCiAJCSIub3B0aW9uIHBpYzBcbiIKKyNpZmRlZiBOT0xJQkNfU1RBQ0tQUk9U
RUNUT1IKKwkJImphbCBfX3N0YWNrX2Noa19pbml0XG4iIC8qIGluaXRpYWxpemUgc3RhY2sgcHJv
dGVjdG9yICAgICAgICAgICAgICAgICAgICAgICAgICovCisJCSJub3BcbiIgICAgICAgICAgICAg
ICAgICAvKiBkZWxheWVkIHNsb3QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAqLworI2VuZGlmCiAJCS8qIi5lbnQgX19zdGFydFxuIiovCiAJCS8qIl9fc3RhcnQ6XG4iKi8K
IAkJImx3ICRhMCwoJHNwKVxuIiAgICAgICAgLyogYXJnYyB3YXMgaW4gdGhlIHN0YWNrICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICovCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMv
TWFrZWZpbGUKaW5kZXggZWZhN2E1MWUwZmNkLi5hNzUyNDQ0NWYzM2MgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQorKysgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUKQEAgLTg0LDYgKzg0LDcgQEAgQ0ZMQUdTX1NUS1Bf
eDg2XzY0ID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCiBDRkxBR1NfU1RLUF94ODYgPSAkKENG
TEFHU19TVEFDS1BST1RFQ1RPUikKIENGTEFHU19TVEtQX2FybTY0ID0gJChDRkxBR1NfU1RBQ0tQ
Uk9URUNUT1IpCiBDRkxBR1NfU1RLUF9hcm0gPSAkKENGTEFHU19TVEFDS1BST1RFQ1RPUikKK0NG
TEFHU19TVEtQX21pcHMgPSAkKENGTEFHU19TVEFDS1BST1RFQ1RPUikKIENGTEFHU19TVEtQX3Jp
c2N2ID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCiBDRkxBR1NfU1RLUF9sb29uZ2FyY2ggPSAk
KENGTEFHU19TVEFDS1BST1RFQ1RPUikKIENGTEFHU19zMzkwID0gLW02NAoKLS0gCjIuNDAuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
