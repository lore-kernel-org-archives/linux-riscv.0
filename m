Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2807C7EE29
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ftDI6uDkHR7mX1O0kuDJIx8OrXrburveViQ6Qicb6os=; b=BFY83OUTveKtP3
	Q2d3HLTVMJnHS87t1gkz01PnVfiXjr+RkXTrKw+urHB1cJU8ZTLwfphXqHJkXOlzrC3Vu7fGIrksn
	+7+1ZpgLfIJELBldS74ltucm0NMED1KW/4pJ/44f5po8OXRc+IdxDWGT6mz40H+lfZWatJLntw0K/
	m/a6tcgIP4WzW1gMw4XV9+PgvM2wagENdhyu/+1gakObfyQVx0TIqgy0wD/t+YKdIFEJt/afYm6T3
	+l8O+iV96jBsV9AJXpsOAFNaEib3EcWRuI9dqRjK8qm/P2xI+l29Zpk/poBUHITEQmD/xjkCg5ym4
	1shR1gW9vDMDJ57mohDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUv-003VeE-3A;
	Sun, 21 May 2023 09:37:05 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUn-003VZw-0k
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:37:01 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684661803;
	bh=IRUupTWokl6bSvN/Qk4Ov6+kUGTwoo0KFMWwChixIDM=;
	h=From:Subject:Date:To:Cc:From;
	b=cqxlSIQDXcaATq4ZkEomg3mY2IIrtqss61smptg9yb0lL1E7hdITHmKOiQkYwWMPr
	 dSUmlXT3YXWXIAj6wIKV373n/HOdFYkU8neAUuRNG4U2Y55s6Mf3AQV4YgSKua8BCn
	 gEy2ZeaIjLoDyfdEpiNxt0KJb6Awa7KExEknuKus=
Subject: [PATCH 0/7] tools/nolibc: autodetect stackprotector availability
 from compiler
Date: Sun, 21 May 2023 11:36:28 +0200
Message-Id: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABzmaWQC/x2NQQrCMBAAv1L27EIbraJfkR4268YuxqRsUhFK/
 27wOHOY2aCIqRS4dRuYfLRoTg2GQwc8U3oK6qMxuN4d+9ENmHJUz0hrzW+qylgq8QsXy1W4ZkN
 /CpdA/ipnN0LLeCqC3ijx3EJpjbHJxSTo9/+9T/v+A6RUit+HAAAA
To: Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684661802; l=1743;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=IRUupTWokl6bSvN/Qk4Ov6+kUGTwoo0KFMWwChixIDM=;
 b=+KCHXIX7ZFxeWvKYgiPiXSHck8c9OJAqiZ1m8d98eL9+rckJEWvb6uDCavW+0/kuvJ7Fdte+g
 m1VE13Y0y6WDZ5dPNcWR/VP/9J98CEzoH+Wt4RH1E7OYcJxR3RLRXIu
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_023657_774014_1C451AF2 
X-CRM114-Status: UNSURE (   5.71  )
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

QXMgc3VnZ2VzdGVkIGJ5IFdpbGx5IGl0IGlzIHBvc3NpYmxlIHRvIGRldGVjdCB0aGUgYXZhaWxh
YmlsaXR5IG9mCnN0YWNrcHJvdGVjdG9yIHZpYSBwcmVwcm9jZXNzb3IgZGVmaW5lcy4KTWFrZSB1
c2Ugb2YgdGhhdCB0byBzaW1wbGlmeSB0aGUgY29kZSBhbmQgaW50ZXJmYWNlIG9mIG5vbGliYy4K
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4K
LS0tClRob21hcyBXZWnDn3NjaHVoICg3KToKICAgICAgdG9vbHMvbm9saWJjOiBmaXggdHlwbyBw
aW50IC0+IHBvaW50CiAgICAgIHRvb2xzL25vbGliYzogeDg2XzY0OiBkaXNhYmxlIHN0YWNrIHBy
b3RlY3RvciBmb3IgX3N0YXJ0CiAgICAgIHRvb2xzL25vbGliYzogZW5zdXJlIHN0YWNrIHByb3Rl
Y3RvciBndWFyZCBpcyBuZXZlciB6ZXJvCiAgICAgIHRvb2xzL25vbGliYzogYWRkIHRlc3QgZm9y
IF9fc3RhY2tfY2hrX2d1YXJkIGluaXRpYWxpemF0aW9uCiAgICAgIHRvb2xzL25vbGliYzogcmVm
b3JtYXQgbGlzdCBvZiBoZWFkZXJzIHRvIGJlIGluc3RhbGxlZAogICAgICB0b29scy9ub2xpYmM6
IGFkZCBhdXRvZGV0ZWN0aW9uIGZvciBzdGFja3Byb3RlY3RvciBzdXBwb3J0CiAgICAgIHRvb2xz
L25vbGliYzogc2ltcGxpZnkgc3RhY2twcm90ZWN0b3IgY29tcGlsZXIgZmxhZ3MKCiB0b29scy9p
bmNsdWRlL25vbGliYy9NYWtlZmlsZSAgICAgICAgICAgICAgICB8IDE5ICsrKysrKysrKysrKysr
KysrLS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtYWFyY2g2NC5oICAgICAgICAgIHwgIDYg
KysrLS0tCiB0b29scy9pbmNsdWRlL25vbGliYy9hcmNoLWFybS5oICAgICAgICAgICAgICB8ICA2
ICsrKy0tLQogdG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJjaC1pMzg2LmggICAgICAgICAgICAgfCAg
NiArKystLS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gtbG9vbmdhcmNoLmggICAgICAgIHwg
IDYgKysrLS0tCiB0b29scy9pbmNsdWRlL25vbGliYy9hcmNoLW1pcHMuaCAgICAgICAgICAgICB8
ICA2ICsrKy0tLQogdG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJjaC1yaXNjdi5oICAgICAgICAgICAg
fCAgNiArKystLS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2gteDg2XzY0LmggICAgICAgICAg
IHwgIDggKysrKy0tLS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2FyY2guaCAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL2NvbXBpbGVyLmggICAgICAgICAgICAg
IHwgMTUgKysrKysrKysrKysrKysrCiB0b29scy9pbmNsdWRlL25vbGliYy9zdGFja3Byb3RlY3Rv
ci5oICAgICAgICB8IDE1ICsrKysrKy0tLS0tLS0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bm9saWJjL01ha2VmaWxlICAgICAgfCAxMyArKy0tLS0tLS0tLS0tCiB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYyB8IDEwICsrKysrKysrKy0KIDEzIGZpbGVzIGNo
YW5nZWQsIDcyIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6
IDYwNjM0M2I3NDc4YzMxOWNiMzAyOTFhMzllY2JjZWRkYjQyMjI5ZDYKY2hhbmdlLWlkOiAyMDIz
MDUyMS1ub2xpYmMtYXV0b21hdGljLXN0YWNrLXByb3RlY3Rvci1iNGY3ZmFiOWU2MjUKCkJlc3Qg
cmVnYXJkcywKLS0gClRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
