Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A32AC5AD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NvMxrilADizng7tc4gXAKdUsQQZhKsmVWHxfI0BPsE=; b=RI2EmhkLly8Q2J
	ytnZ4IF/jKzbx60SmVeyBElma4vw1vd4KuxnO5KYe/a/2ysZNGLvk+ILa8XID3QEu8tz5vsEGe39D
	qwh4L08K9NmNuOiswfZyB2jOYC8gwgwLE5vi4z88fV1Wh8VZJr0fUnwidjDTqntF5rPCURbSXDD6v
	t29Sr09/w5c+Fzqp206aDELyST7APVeF1h7WvplhExCL+Zb7Qle43V/vapyUejbB8uqJr/MtUjD3s
	ApZ1prMGYw6qpB/HgnQpy3VLryfEZMs9Zbvj5s2xZyTQxI2jX7Y9OjrBQIkmjCVFYhC1Yv5Bki8Sk
	WzxbY66ornDkQpQQdvfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTYg-0000000HYJO-2uCj;
	Fri, 06 Jun 2025 09:40:18 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTKC-0000000HWeR-35D6
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 09:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1749201916;
	bh=7KRt2HEAfw/QBgPweBInY7JAo1KxrGLTcf3nOhyjppw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j78M4blQyuDMZi/77ULjiVFRXBNYmihmFbvvGrUR/B76MB7mrcwxkWfW9kqmQO1BH
	 2MfZ5X/TiSQsmiG33p1FFcYDNKXaQKOv4TLD5dsG1s6tGrWl6pTwzOjZAjtUCseJ9w
	 QzGV0D0poPJXgwN3JDEI7zAo78IJLROfuUkRtv7w=
Received: from stargazer.. (unknown [113.200.174.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id BF41E65992;
	Fri,  6 Jun 2025 05:25:14 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in the getrandom syscall wrapper
Date: Fri,  6 Jun 2025 17:24:44 +0800
Message-ID: <20250606092443.73650-2-xry111@xry111.site>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
References: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_022520_800028_06A550A9 
X-CRM114-Status: GOOD (  12.52  )
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

QXMgcmVjZW50bHkgcG9pbnRlZCBvdXQgYnkgVGhvbWFzLCBpZiBhIHJlZ2lzdGVyIGlzIGZvcmNl
ZCBmb3IgdHdvCmRpZmZlcmVudCByZWdpc3RlciB2YXJpYWJsZXMsIGFtb25nIHRoZW0gb25lIGlz
IHVzZWQgYXMgIisiIChib3RoIGlucHV0CmFuZCBvdXRwdXQpIGFuZCBhbm90aGVyIGlzIG9ubHkg
dXNlZCBhcyBpbnB1dCwgQ2xhbmcgd291bGQgdHJlYXQgdGhlCmNvbmZsaWN0aW5nIGlucHV0IHBh
cmFtZXRlcnMgYXMgdW5kZWZpbmVkIGJlaGF2aW91ciBhbmQgb3B0aW1pemUgYXdheQp0aGUgYXJn
dW1lbnQgYXNzaWdubWVudC4KClBlciBhbiBleGFtcGxlIGluIHRoZSBHQ0MgZG9jdW1lbnRhdGlv
biwgZm9yIHRoaXMgcHVycG9zZSB3ZSBjYW4gdXNlICI9Igoob25seSBvdXRwdXQpIGZvciB0aGUg
b3V0cHV0LCBhbmQgIjAiIGZvciB0aGUgaW5wdXQgZm9yIHRoYXQgd2UgbXVzdApyZXVzZSB0aGUg
c2FtZSByZWdpc3RlciBhcyB0aGUgb3V0cHV0LiAgQW5kIEdDQyBkZXZlbG9wZXJzIGhhdmUKY29u
ZmlybWVkIHVzaW5nIGEgc2ltcGxlICJyIiAodGhhdCB3ZSB1c2UgZm9yIG1vc3QgdkRTTyBpbXBs
ZW1lbnRhdGlvbnMpCmluc3RlYWQgb2YgIjAiIGlzIGFsc28gZmluZS4KCkxpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDYwMy1sb29uZ2FyY2gtdmRzby1zeXNjYWxsLXYxLTEt
NmQxMmQ2ZGZiZGQwQGxpbnV0cm9uaXguZGUvCkxpbms6IGh0dHBzOi8vZ2NjLmdudS5vcmcvb25s
aW5lZG9jcy9nY2MtMTUuMS4wL2djYy9Mb2NhbC1SZWdpc3Rlci1WYXJpYWJsZXMuaHRtbApMaW5r
OiBodHRwczovL2djYy5nbnUub3JnL3BpcGVybWFpbC9nY2MtaGVscC8yMDI1LUp1bmUvMTQ0MjY2
Lmh0bWwKQ2M6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4
LmRlPgpDYzogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgpTaWduZWQtb2Zm
LWJ5OiBYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KLS0tCgp2MSAtPiB2MjogS2VlcCB1
c2luZyAiciIgZm9yIGJ1ZmZlciB0byBmb2xsb3cgdGhlIGV4aXN0aW5nIGNvbnZlbnRpb24KKHRo
YXQgdGhlIEdDQyBkZXZlbG9wZXJzIGhhdmUgY29uZmlybWVkIGZpbmUpLgoKIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdmRzby9nZXRyYW5kb20uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXRy
YW5kb20uaAppbmRleCA4ZGM5MjQ0MTcwMmEuLmM2ZDY2ODk1YzFmNSAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdmRzby9nZXRyYW5kb20uaApAQCAtMTgsNyArMTgsNyBAQCBzdGF0aWMgX19hbHdh
eXNfaW5saW5lIHNzaXplX3QgZ2V0cmFuZG9tX3N5c2NhbGwodm9pZCAqX2J1ZmZlciwgc2l6ZV90
IF9sZW4sIHVucwogCXJlZ2lzdGVyIHVuc2lnbmVkIGludCBmbGFncyBhc20oImEyIikgPSBfZmxh
Z3M7CiAKIAlhc20gdm9sYXRpbGUgKCJlY2FsbFxuIgotCQkgICAgICA6ICIrciIgKHJldCkKKwkJ
ICAgICAgOiAiPXIiIChyZXQpCiAJCSAgICAgIDogInIiIChuciksICJyIiAoYnVmZmVyKSwgInIi
IChsZW4pLCAiciIgKGZsYWdzKQogCQkgICAgICA6ICJtZW1vcnkiKTsKIAoKYmFzZS1jb21taXQ6
IGRjNTI0MGYwOWJjYTdiNWZjNzJhZDg4OTRkNmI5MzIxYmNlNTExMzkKLS0gCjIuNDkuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
