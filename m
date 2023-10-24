Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1245BC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rMnggeM+6BdNBZob761hS5l+nWkCXVZiaKs2FqBi0UU=; b=nayyTkYTwSo70p
	2icyBRVydgGYDUvYNEgFZCaTF0eygJYX3Ufft8O81Rx91NCq5nNiPTbIJkaY6Ud/tb4mtCZDhOMjD
	7GOhdbOlmrgcHeSyFoC13OP8KicOSnR1J4R/SPQV3RImCkc+zdbYy3ONnXp+Lff2i3bQnXVjS4glT
	hbfvx1HceeyIJVJ3KaGMhYmxiCpkazeo7rsYrerYP+MEXqO5ZI4xqdvQO1Caidbj9OOHVHBRtY/Pi
	Gx04cwdATCc1im/UTHkSyZ3KNjsp/bCpjo1Xtpww5/pivQsuhVHYp7Lmkn1yoCq2PyIKK7ibyWXTc
	wcDsnKGC/s5VDnr0dEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvImm-00AApW-1s;
	Tue, 24 Oct 2023 14:53:36 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvImi-00AAoJ-21
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 14:53:34 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7faa:e55:54a:cff])
	by albert.telenet-ops.be with bizsmtp
	id 1qtK2B00X5Uc89d06qtKeQ; Tue, 24 Oct 2023 16:53:20 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qvImO-007Q3C-T2;
	Tue, 24 Oct 2023 16:53:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qvImV-00BkS1-Nd;
	Tue, 24 Oct 2023 16:53:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] riscv: boot: Fix creation of loader.bin
Date: Tue, 24 Oct 2023 16:53:18 +0200
Message-Id: <1086025809583809538dfecaa899892218f44e7e.1698159066.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_075332_825140_ECDC028B 
X-CRM114-Status: UNSURE (   8.56  )
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

V2hlbiBmbGFzaGluZyBsb2FkZXIuYmluIGZvciBLMjEwIHVzaW5nIGtmbGFzaDoKCsKgIMKgIFtF
UlJPUl0gVGhpcyBpcyBhbiBFTEYgZmlsZSBhbmQgY2Fubm90IGJlIHByb2dyYW1tZWQgdG8gZmxh
c2ggZGlyZWN0bHk6IGFyY2gvcmlzY3YvYm9vdC9sb2FkZXIuYmluCgpCZWZvcmUsIGxvYWRlci5i
aW4gcmVsaWVkIG9uICJPQkpDT1BZRkxBR1MgOj0gLU8gYmluYXJ5IiBpbiB0aGUgbWFpbgpSSVND
LVYgTWFrZWZpbGUgdG8gY3JlYXRlIGEgYm9vdCBpbWFnZSB3aXRoIHRoZSByaWdodCBmb3JtYXQu
ICBXaXRoIHRoaXMKcmVtb3ZlZCwgdGhlIGltYWdlIGlzIG5vdyBjcmVhdGVkIGluIHRoZSB3cm9u
ZyAoRUxGKSBmb3JtYXQuCgpGaXggdGhpcyBieSBhZGRpbmcgYW4gZXhwbGljaXQgcnVsZS4KCkZp
eGVzOiA1MDViMDI5NTdlNzRmMGM1ICgicmlzY3Y6IFJlbW92ZSBkdXBsaWNhdGUgb2JqY29weSBm
bGFnIikKU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT4KLS0tCiBhcmNoL3Jpc2N2L2Jvb3QvTWFrZWZpbGUgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9NYWtlZmls
ZSBiL2FyY2gvcmlzY3YvYm9vdC9NYWtlZmlsZQppbmRleCAyMmIxMzk0N2JkMTMxZTg0Li44ZTdm
YzBlZGYyMWQzZWNlIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvTWFrZWZpbGUKKysrIGIv
YXJjaC9yaXNjdi9ib290L01ha2VmaWxlCkBAIC0xNyw2ICsxNyw3IEBACiBLQ09WX0lOU1RSVU1F
TlQgOj0gbgogCiBPQkpDT1BZRkxBR1NfSW1hZ2UgOj0tTyBiaW5hcnkgLVIgLm5vdGUgLVIgLm5v
dGUuZ251LmJ1aWxkLWlkIC1SIC5jb21tZW50IC1TCitPQkpDT1BZRkxBR1NfbG9hZGVyLmJpbiA6
PS1PIGJpbmFyeQogT0JKQ09QWUZMQUdTX3hpcEltYWdlIDo9LU8gYmluYXJ5IC1SIC5ub3RlIC1S
IC5ub3RlLmdudS5idWlsZC1pZCAtUiAuY29tbWVudCAtUwogCiB0YXJnZXRzIDo9IEltYWdlIElt
YWdlLiogbG9hZGVyIGxvYWRlci5vIGxvYWRlci5sZHMgbG9hZGVyLmJpbgotLSAKMi4zNC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
