Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F18C7EE2E
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q00yv/T/k6e8N80ktRWpNhSXTHDfN9rBPiZWjdJU5bI=; b=gn4lTwasfx74a+
	MZwmHl/LH9GocNGVv8eNP+byNLibFcHQ3h/xw+W7xUaby8KBbAW9sl3TXY5W9NkrYlBODQuY4kZf7
	2Fe2MitAiAfrIW3BY4yZ868Fp3OI8WzVGzUIRdEU3e9N7am1hxy5prviyJGqfieQJiU02Nj8Jt1+N
	7BvM7T8yggQ4Qb+j6h0cRd/d1Uh9f5/fRmsi+SGqqQBAwSnQWmkjm3shsVrYx6bfd0zk9dZHgWscw
	GVjTpuE4jOxAbhQixqVa7SbAw6St/gCGxVQzhJKjz8M+1i2JUvJ7Yn6Jugvg5I98pjYYk2Pwpm5GY
	vy4yWYdOONVAOvK2Do2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUw-003Vf1-39;
	Sun, 21 May 2023 09:37:06 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUn-003VaB-0k
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:37:01 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684661803;
	bh=lj2geLr/EdywhNVRdZihjVutdtlzdrTLYrnqWuCaRHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cFDVWF4VRJK30uYLVDvSQLOKcqHfOapaHKy+uCiYEHV8joFGCP1VNLTw5YTPsrZdu
	 tKcAKkoYbj7IucjFJRilU2Xdy+lRiSR3cTBsitu86G2g61qPlvLRSWYVEYyWSjooCV
	 85iXyDnx1wO3gM4uzxU1VGrjVCV4siMhkPC8TJwY=
Date: Sun, 21 May 2023 11:36:30 +0200
Subject: [PATCH 2/7] tools/nolibc: x86_64: disable stack protector for
 _start
MIME-Version: 1.0
Message-Id: <20230521-nolibc-automatic-stack-protector-v1-2-dad6c80c51c1@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684661802; l=1079;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lj2geLr/EdywhNVRdZihjVutdtlzdrTLYrnqWuCaRHI=;
 b=JVbhHarzeBvvcx5vDuAxt69sG68MA2ijZHbow7ctpQ1HKfKs70ByaOsPMJGeyj+rVqnfqQVyk
 1O4/8Fg7pOIBbY4WpL5JP7Mj+mvvpxTiEIflujBujsb3if9KDfDQVZN
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_023657_799572_5D12F3D2 
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

VGhpcyB3YXMgZm9yZ290dGVuIGluIHRoZSBvcmlnaW5hbCBzdWJtaXNzaW9uLgoKSXQgaXMgdW5r
bm93biB3aHkgaXQgd29ya2VkIGZvciB4ODZfNjQgb24gc29tZSBjb21waWxlciB3aXRob3V0IHRo
aXMKYXR0cmlidXRlLgoKUmVwb3J0ZWQtYnk6IFdpbGx5IFRhcnJlYXUgPHdAMXd0LmV1PgpDbG9z
ZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzA1MjAxMzMyMzcuR0EyNzUwMUAx
d3QuZXUvCkZpeGVzOiAwZDhjNDYxYWRiYzQgKCJ0b29scy9ub2xpYmM6IHg4Nl82NDogYWRkIHN0
YWNrcHJvdGVjdG9yIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
bGludXhAd2Vpc3NzY2h1aC5uZXQ+Ci0tLQogdG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJjaC14ODZf
NjQuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gteDg2XzY0LmggYi90b29s
cy9pbmNsdWRlL25vbGliYy9hcmNoLXg4Nl82NC5oCmluZGV4IGQ5OGY2Yzg5ZDE0My4uZTIwMWFm
MTVlMTQyIDEwMDY0NAotLS0gYS90b29scy9pbmNsdWRlL25vbGliYy9hcmNoLXg4Nl82NC5oCisr
KyBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gteDg2XzY0LmgKQEAgLTE5MCw3ICsxOTAsNyBA
QCBjb25zdCB1bnNpZ25lZCBsb25nICpfYXV4diBfX2F0dHJpYnV0ZV9fKCh3ZWFrKSk7CiAgKiAy
KSBUaGUgZGVlcGVzdCBzdGFjayBmcmFtZSBzaG91bGQgYmUgemVybyAodGhlICVyYnApLgogICoK
ICAqLwotdm9pZCBfX2F0dHJpYnV0ZV9fKCh3ZWFrLG5vcmV0dXJuLG9wdGltaXplKCJvbWl0LWZy
YW1lLXBvaW50ZXIiKSkpIF9zdGFydCh2b2lkKQordm9pZCBfX2F0dHJpYnV0ZV9fKCh3ZWFrLG5v
cmV0dXJuLG9wdGltaXplKCJvbWl0LWZyYW1lLXBvaW50ZXIiKSxub19zdGFja19wcm90ZWN0b3Ip
KSBfc3RhcnQodm9pZCkKIHsKIAlfX2FzbV9fIHZvbGF0aWxlICgKICNpZmRlZiBOT0xJQkNfU1RB
Q0tQUk9URUNUT1IKCi0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
