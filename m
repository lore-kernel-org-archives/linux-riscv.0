Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB42C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HT+3u5FFgToyOPvbkfpsQc2VKGDHv5T3FCt3GBPd+II=; b=BNdPokWuQPyimB
	5EmgLccK4O5uVH1q96JmXlOUGB27HWRGZlO+kHtFRhygsHEiMJCFQCVVwRfAWmJE9ISyD8JMc5khm
	V6ilR4IU/89sb9+K1PMt5NCLfRFsLxOqIzDKWCnDQ/woxhG3VZiuxOOjttD3F4KhsPUDzQ7s1+/8J
	h9Ry/LdfIKqo5etdVZrtJSeFahKu3UHszB1S5XAAzs1opj9DXQYwNudeWr1FuK3dG+MLC2eMi+qiX
	68o9Y6xa8cRwrLMx9NQfFgwltx1Q/rHotPfXZYz+hM1UtMbsLHjOgvdQSQYFUV7g8L+B7E++4Sch3
	pmgwBSZ99LmwvV2OTCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MST-009522-0Y;
	Sat, 03 Jun 2023 08:17:57 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MSQ-00950v-0c
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:17:55 +0000
X-QQ-mid: bizesmtp77t1685780261tx6oj29b
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 16:17:40 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: E5K4RXiq5f16O7Lg/ibaIwDGJ/dBM+SgASgVWJNrZJ0DycLMa61F85p3zn/s0
	pmVP+uUxVO+uRq/qEVaGBrw6dy5nIj47egVC3sA8D6LyXOmfE2qgnjJAplThr2LHojLED11
	dN48gvX6BDj+6ZskNGLKC05GNgBi/1WsGLb1E+3d17NhlPgK0/LzJRM0pb94DuYlP0Nmb59
	w/YBaNODEaG8SfvzKEIj3lR1qDDwBvXpe5afs1A1FBfiTrIN0OgVeJJbKuaREYCdlovpmwR
	TbYhxWH70C7N9rrtU2bVFSPPjUczDufHPnteLBOjhwo549unG3iUV5HoN68eGMNqiD9QnOE
	Mbf4IaVts3z35QJQ2XUbnjfxanJ+JTJpIGiU/3+zwyVM15wQhyWDL98jOVCeDUWXeWyrFpD
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11015261677064545706
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 12/12] selftests/nolibc: test_fork: fix up duplicated print
Date: Sat,  3 Jun 2023 16:17:25 +0800
Message-Id: <4e090aff64abeca598d1bb6ee54b40ee4ce52858.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_011754_528845_F39437D1 
X-CRM114-Status: GOOD (  10.55  )
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

cnVubmluZyBub2xpYmMtdGVzdCB3aXRoIGdsaWJjIG9uIHg4Nl82NCBnb3Qgc3VjaCBwcmludCBp
c3N1ZToKCiAgICAyOSBleGVjdmVfcm9vdCA9IC0xIEVBQ0NFUyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFtPS10KICAgIDMwIGZvcmszMCBmb3JrID0gMCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtPS10KICAgIDMxIGdl
dGRlbnRzNjRfcm9vdCA9IDcxMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgW09LXQoKVGhlIGZvcmsgdGVzdCBjYXNlIGhhcyB0aHJlZSBwcmludGYgY2FsbHM6CgogICAg
KDEpIGxsZW4gKz0gcHJpbnRmKCIlZCAlcyIsIHRlc3QsICNuYW1lKTsKICAgICgyKSBsbGVuICs9
IHByaW50ZigiID0gJWQgJXMgIiwgZXhwciwgZXJyb3JuYW1lKGVycm5vKSk7CiAgICAoMykgbGxl
biArPSBwYWRfc3BjKGxsZW4sIDY0LCAiW0ZBSUxdXG4iKTsgLS0+IHZmcHJpbnRmKCkKCkluIHRo
ZSBmb2xsb3dpbmcgc2NlbmUsIHRoZSBhYm92ZSBpc3N1ZSBoYXBwZW5zOgoKICAgIChhKSBUaGUg
cGFyZW50IGNhbGxzICgxKQogICAgKGIpIFRoZSBwYXJlbnQgY2FsbHMgZm9yaygpCiAgICAoYykg
VGhlIGNoaWxkIHJ1bnMgYW5kIHNoYXJlcyB0aGUgcHJpbnQgYnVmZmVyIG9mICgxKQogICAgKGQp
IFRoZSBjaGlsZCBleGl0cywgZmx1c2hzIHRoZSBwcmludCBidWZmZXIgYW5kIGNsb3NlcyBpdHMg
b3duIHN0ZG91dC9zdGRlcnIKICAgICAgICAqICIzMCBmb3JrIiBpcyBwcmludGVkIGF0IHRoZSBm
aXJzdCB0aW1lLgogICAgKGUpIFRoZSBwYXJlbnQgY2FsbHMgKDIpIGFuZCAoMyksIHdpdGggIlxu
IiBpbiAoMyksIGl0IGZsdXNocyB0aGUgd2hvbGUgYnVmZmVyCiAgICAgICAgKiAiMzAgZm9yayA9
IDAgLi4uIiBpcyBwcmludGVkCgpUaGVyZWZvcmUsIHRoZXJlIGFyZSB0d28gIjMwIGZvcmsiIGlu
IHRoZSBzdGRvdXQuCgpCZXR3ZWVuIChhKSBhbmQgKGIpLCBpZiBmbHVzaCB0aGUgc3Rkb3V0IChh
bmQgdGhlIHN0ZXJyKSwgdGhlIGNoaWxkIGluCnN0YWdlIChjKSB3aWxsIG5vdCBiZSBhYmxlIHRv
ICdzZWUnIHRoZSBwcmludCBidWZmZXIuCgpSZXZpZXdlZC1ieTogVGhvbWFzIFdlacOfc2NodWgg
PGxpbnV4QHdlaXNzc2NodWgubmV0PgpTaWduZWQtb2ZmLWJ5OiBaaGFuZ2ppbiBXdSA8ZmFsY29u
QHRpbnlsYWIub3JnPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMt
dGVzdC5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9u
b2xpYmMtdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0
LmMKaW5kZXggZTY4YzU2OTJlYzU0Li43ZGQ5NTA4NzkxNjEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCkBAIC00OTAsNyArNDkwLDEzIEBAIHN0YXRp
YyBpbnQgdGVzdF9nZXRwYWdlc2l6ZSh2b2lkKQogc3RhdGljIGludCB0ZXN0X2Zvcmsodm9pZCkK
IHsKIAlpbnQgc3RhdHVzOwotCXBpZF90IHBpZCA9IGZvcmsoKTsKKwlwaWRfdCBwaWQ7CisKKwkv
KiBmbHVzaCB0aGUgcHJpbnRmIGJ1ZmZlciB0byBhdm9pZCBjaGlsZCBmbHVzaCBpdCAqLworCWZm
bHVzaChzdGRvdXQpOworCWZmbHVzaChzdGRlcnIpOworCisJcGlkID0gZm9yaygpOwogCiAJc3dp
dGNoIChwaWQpIHsKIAljYXNlIC0xOgotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
