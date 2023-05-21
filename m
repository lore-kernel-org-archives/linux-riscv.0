Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1541DC7EE30
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37FtLPqo7QL0Se+pO1h8S+RG+Ue3aYa4pgCJJ7tivcA=; b=xCSQXD8SRM5QvR
	L1B7WffSqC1nMm/CmYrnMJ4SdYnvcboMXWNss1FFnDBvMiEItqx26cmEEyxjyBqzvILX41bkry1iF
	cxFdT488AjUZYSuoiBIrlY/VzTH/XnjZShq4eNdTNIc3kAQx0VUDeGGNSfG0fZqA8E5qnkIokjSiI
	Gpat+CkST2UTft8Gn9tcQuUPttzkIhvJl22r4RynwtASdxyBwbvG94cqT/ag8i6PTmB1C6Wwot9Im
	41YekAxjNyH56z0vKPbbcI5SS4U813jCfzD8clHYchvYID6klNEP0c9zcvlpKQ8x6NnDYLxivsRor
	4Q7XaGU23+1PknYhm6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUw-003Vem-1b;
	Sun, 21 May 2023 09:37:06 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUn-003Va4-0k
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:37:01 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684661803;
	bh=YXp2m9tgYYm3XozTrNcpFRPq3F1yaY8YO1GDQgtWycY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cuTkVRdFSD8aU1GXz396vgHtB3VNSch92C6kqZT4CsY7NU9Dkk8yeLI5r9BpMlSwv
	 c+NT8Q2JxQVi67MNAXm4LGgjGmx8+AZdHWztwK8/SCQYuliuCBiNK6uC77RLVJdkRd
	 ECbbHpnAJs0mPpYnRhfWoy61Ori7ZZzSJ+nrQjuM=
Date: Sun, 21 May 2023 11:36:29 +0200
Subject: [PATCH 1/7] tools/nolibc: fix typo pint -> point
MIME-Version: 1.0
Message-Id: <20230521-nolibc-automatic-stack-protector-v1-1-dad6c80c51c1@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684661802; l=911;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=YXp2m9tgYYm3XozTrNcpFRPq3F1yaY8YO1GDQgtWycY=;
 b=hXQEK2yzyvKcrsxqvCHHnlybPxqEKT+8f4pT6eqA/4X/1MZFG78E12gDhxYaloJHAY4BeGZ3w
 c4uyKXfeu17Cd4cftB+6y8+NA+RVvZ+myHSirZZyBr1tDhkGJOxFJj3
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_023657_810925_DCD4C049 
X-CRM114-Status: UNSURE (   8.96  )
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
LS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2guaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUv
bm9saWJjL2FyY2guaCBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2guaAppbmRleCAyZDUzODZh
OGQ2YWEuLjgyYjQzOTM1NjUwZiAxMDA2NDQKLS0tIGEvdG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJj
aC5oCisrKyBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2guaApAQCAtNyw3ICs3LDcgQEAKICAq
IHRoZSBzeXNjYWxsIGRlY2xhcmF0aW9ucyBhbmQgdGhlIF9zdGFydCBjb2RlIGRlZmluaXRpb24u
IFRoaXMgaXMgdGhlIG9ubHkKICAqIGdsb2JhbCBwYXJ0LiBPbiBhbGwgYXJjaGl0ZWN0dXJlcyB0
aGUga2VybmVsIHB1dHMgZXZlcnl0aGluZyBpbiB0aGUgc3RhY2sKICAqIGJlZm9yZSBqdW1waW5n
IHRvIF9zdGFydCBqdXN0IGFib3ZlIHVzLCB3aXRob3V0IGFueSByZXR1cm4gYWRkcmVzcyAoX3N0
YXJ0Ci0gKiBpcyBub3QgYSBmdW5jdGlvbiBidXQgYW4gZW50cnkgcGludCkuIFNvIGF0IHRoZSBz
dGFjayBwb2ludGVyIHdlIGZpbmQgYXJnYy4KKyAqIGlzIG5vdCBhIGZ1bmN0aW9uIGJ1dCBhbiBl
bnRyeSBwb2ludCkuIFNvIGF0IHRoZSBzdGFjayBwb2ludGVyIHdlIGZpbmQgYXJnYy4KICAqIFRo
ZW4gYXJndltdIGJlZ2lucywgYW5kIGVuZHMgYXQgdGhlIGZpcnN0IE5VTEwuIFRoZW4gd2UgaGF2
ZSBlbnZwIHdoaWNoCiAgKiBzdGFydHMgYW5kIGVuZHMgd2l0aCBhIE5VTEwgYXMgd2VsbC4gU28g
ZW52cD1hcmd2K2FyZ2MrMS4KICAqLwoKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
