Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04586CD13CF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/TDne16LbOL20SbPj3269DqVhAfHF3rlDTLqFvNCtKI=; b=UX91ElGJvWvAwt
	h9JEYOUE6KjJslI5jUohYj+DZszk8zJ3Jbg4pdAlNqx4pGtFk8KvXqx3Dn8NV0WVbPHDZxPBHp0mz
	msJrlr4c1RnwlouIc/DkvlGcjLqWLj5d/lfFK9Bg+KhCD1VuRo8ssnNghcv+ukWGtcmk0GAKTEBeF
	4iPEdG9Cfobq7NVNR2kYhWLAOUZa46hdo5Lgf4PNsP3qUluxsxqVvq10QgrMrnvyjVjliZrv8ygna
	ai4/naFwbEwx7LTvbHzFK5SXgYWianq38Op7c/XX+m1ZapADzR5T6l0ZFd6698g6EKF4d7sDZ2lLk
	zUvHIFiAjE8Efd8nicqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtov-00DmTw-2L;
	Sun, 17 Sep 2023 15:36:25 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtor-00DmSv-1l
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 15:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1694964978;
	bh=QYp1kQc8N8Jo6r2r7V5ChIUb67vWKSQCfxIebMcHTzM=;
	h=From:Subject:Date:To:Cc:From;
	b=Nv/p2LKt6eDABN8iI6EHm8oFLoLEjaicYtUJxMBopAuLPe01M845NIlCVq+LgZJme
	 1pnyH1nQl5TtZbasgO80ZOSqoH6MHxzk7u0Mr5RlJe0QztyVTptEm5RxubNNvojcLn
	 1jykhwy6Mq3tC86lXk2Qdrunhw/0n9bCqKYQ/KEw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/4] tools/nolibc: cleanups for syscall fallbacks
Date: Sun, 17 Sep 2023 17:36:15 +0200
Message-Id: <20230917-nolibc-syscall-nr-v2-0-03863d509b9a@weissschuh.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPAcB2UC/32NQQrCMBBFr1Jm7UgSU7CuvId0EdOpGSiJZGq0l
 N7d2AO4fA/++ysIZSaBS7NCpsLCKVYwhwZ8cPFByENlMMqcVKctxjTx3aMs4t00YczYuXZsrfV
 n21mou2emkT9789ZXDixzyst+UfTP/qsVjQqpVcNotRqc1tc3sYj48ArHSDP027Z9AdDA1U+3A
 AAA
To: Willy Tarreau <w@1wt.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694964977; l=1049;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=QYp1kQc8N8Jo6r2r7V5ChIUb67vWKSQCfxIebMcHTzM=;
 b=KtgHX5jQwe8n9MP2CPv9wq5NxMPUMisGTWElmuZY5m6r7CHIKyWQqL/+xc+B9VHnBleufJJnt
 ZjZm4+aGSYICgZCu+glc2zlAWqjK1RYtt4XubmN1DLKS/uTfnaEvGYd
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_083621_739570_F572049F 
X-CRM114-Status: UNSURE (   5.31  )
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
LS0KQ2hhbmdlcyBpbiB2MjoKLSBSZXBsYWNlIG1hbnVhbCBjYXN0cyB0byAodm9pZCkgd2l0aCBf
X25vbGliY19lbm9zeXMgaGVscGVycwotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyMzA5MTQtbm9saWJjLXN5c2NhbGwtbnItdjEtMC1lNTBkZjQxMGRhMTFAd2Vpc3Nz
Y2h1aC5uZXQKCi0tLQpUaG9tYXMgV2Vpw59zY2h1aCAoNCk6CiAgICAgIHNlbGZ0ZXN0cy9ub2xp
YmM6IGFsbG93IGJ1aWxkaW5nIGkzODYgd2l0aCBtdWx0aWFyY2ggY29tcGlsZXIKICAgICAgdG9v
bHMvbm9saWJjOiBhdm9pZCB1bnVzZWQgcGFyYW1ldGVyIHdhcm5pbmdzIGZvciBFTk9TWVMgZmFs
bGJhY2tzCiAgICAgIHRvb2xzL25vbGliYzogZG9uJ3QgZGVmaW5lIG5ldyBzeXNjYWxsIG51bWJl
cgogICAgICB0b29scy9ub2xpYmM6IGF1dG9tYXRpY2FsbHkgZGV0ZWN0IG5lY2Vzc2l0eSB0byB1
c2UgcHNlbGVjdDYKCiB0b29scy9pbmNsdWRlL25vbGliYy9hcmNoLWFhcmNoNjQuaCAgICAgfCAg
MyAtLQogdG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJjaC1sb29uZ2FyY2guaCAgIHwgIDQgKy0tCiB0
b29scy9pbmNsdWRlL25vbGliYy9hcmNoLXJpc2N2LmggICAgICAgfCAgMyAtLQogdG9vbHMvaW5j
bHVkZS9ub2xpYmMvc3lzLmggICAgICAgICAgICAgIHwgNTUgKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUgfCAg
MSArCiA1IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQot
LS0KYmFzZS1jb21taXQ6IDNmNzlhNTc4NjViMzNmNDlmZGFlNjY1NTUxMGJkMjdjOGU2NjEwZTAK
Y2hhbmdlLWlkOiAyMDIzMDkxNC1ub2xpYmMtc3lzY2FsbC1uci05YTVmNTQ0Yzg0OTQKCkJlc3Qg
cmVnYXJkcywKLS0gClRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
