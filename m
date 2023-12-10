Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D32C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Dec 2023 12:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YS0XjceLg2N00/sy/ufuQO9Dh1tIMNf3eO9Llc3kCa0=; b=J5fy22EaoEt6j7
	P0aY0f2apBHg08i8aEv3NZ8cWk1LRJj5t7aQw3k1r/oV08kF2r9TRdOoKvG4hFcXjZ4ad/sbm4pC2
	IUi/9J3YE+nVlvr4fZzHWV7jVYNe2IepnVzwzfZNAvvLI2oO4JtzytCG4jexxi89aXEqSK8+s5yyF
	IUWDaZ+eO/8TT0uit0ZRmELDc0ttM+8Akfgv6H9oOQ9dL3o1DyJfrtMRyktFO8DRP1pC+jIDF0r0P
	eBH9e9TM3OBZDLMMjIotbNpOYvuxNYtbaNQ6W3rNO3xSYuDR5yR4/oSHP9nRmh2E/ufVPaEx2SoSv
	yvdSfx9tNQrcDJdoa/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCJEW-002197-2k;
	Sun, 10 Dec 2023 12:48:33 +0000
Received: from smtp.outgoing.loopia.se ([93.188.3.37])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCJEQ-002113-1M
	for linux-riscv@lists.infradead.org;
	Sun, 10 Dec 2023 12:48:29 +0000
Received: from s807.loopia.se (localhost [127.0.0.1])
	by s807.loopia.se (Postfix) with ESMTP id 8F6B32FC96FE
	for <linux-riscv@lists.infradead.org>; Sun, 10 Dec 2023 13:48:17 +0100 (CET)
Received: from s979.loopia.se (unknown [172.22.191.5])
	by s807.loopia.se (Postfix) with ESMTP id 7FB4F2E274E8;
	Sun, 10 Dec 2023 13:48:17 +0100 (CET)
Received: from s473.loopia.se (unknown [172.22.191.6])
	by s979.loopia.se (Postfix) with ESMTP id 7C14710BC4C7;
	Sun, 10 Dec 2023 13:48:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s981.loopia.se ([172.22.191.5])
	by s473.loopia.se (s473.loopia.se [172.22.190.13]) (amavisd-new, port 10024)
	with LMTP id JvZZ6xxqkSUo; Sun, 10 Dec 2023 13:48:17 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: fredrik@frelon.se
X-Loopia-Originating-IP: 81.233.40.252
Received: from localhost.localdomain (81-233-40-252-no600.tbcn.telia.com [81.233.40.252])
	(Authenticated sender: fredrik@frelon.se)
	by s981.loopia.se (Postfix) with ESMTPSA id 0BA2122B17C2;
	Sun, 10 Dec 2023 13:48:17 +0100 (CET)
From: =?UTF-8?q?Fredrik=20L=C3=B6nnegren?= <fredrik@frelon.se>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	fredrik.lonnegren@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fredrik=20L=C3=B6nnegren?= <fredrik@frelon.se>
Subject: [PATCH 1/2] RISC-V: fix include warning in smpboot.c
Date: Sun, 10 Dec 2023 13:42:24 +0100
Message-ID: <20231210124811.26204-1-fredrik@frelon.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_044826_631577_D6191BE7 
X-CRM114-Status: UNSURE (   8.45  )
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

VGhpcyBjb21taXQgZml4ZXMgYSB3YXJuaW5nIGFib3V0IGR1cGxpY2F0ZSBpbmNsdWRlcyBvZgoi
YXNtL2NwdWZlYXR1cmVzLmgiIGZvdW5kIHVzaW5nIHNjcmlwdHMvY2hlY2tpbmNsdWRlcy5wbAoK
U2lnbmVkLW9mZi1ieTogRnJlZHJpayBMw7ZubmVncmVuIDxmcmVkcmlrQGZyZWxvbi5zZT4KLS0t
CiBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCmluZGV4IGQxNjJiZjMzOWJlYi4uMWI0NjE1NzBkNDU2
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvc21wYm9vdC5jCkBAIC0yNiw3ICsyNiw2IEBACiAjaW5jbHVkZSA8bGludXgvc2No
ZWQvdGFza19zdGFjay5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+CiAKLSNpbmNsdWRl
IDxhc20vY3B1ZmVhdHVyZS5oPgogI2luY2x1ZGUgPGFzbS9jcHVfb3BzLmg+CiAjaW5jbHVkZSA8
YXNtL2NwdWZlYXR1cmUuaD4KICNpbmNsdWRlIDxhc20vaXJxLmg+Ci0tIAoyLjQzLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
