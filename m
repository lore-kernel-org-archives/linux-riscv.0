Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FC2D59F6C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 19:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nUxYOTeRM6p3p+HMgVfqt6TKWTPISL/EbBF5c+YSSCs=; b=wXs1jgHboYUw3I
	XnUvWN0H2KPuJWGLcPfqG3i2sN24n3PqIT8UKoliIwwvxldg1yqxOrI2Y+IueTlyB7oCPksC2JSVI
	KOP1CPWt9hcAOUC3MWC+gp65JZaScMZQElt/Euvnzw0nY0cPERPcsdJjeN5gZ1rC2ExOj8gUPSh2f
	Dx2xplbx5e3kyRPjjZBOCpfqLKmUVTLNpv1gnuNO4z8SwbkTV80nHGTtRfmKJFDkuW6qZUJJD4gVj
	3O9+ASbxe7n0wVPefotES/yfRh4dEoMI8ofi1ABqsTgNC+sNIBy6Y7iD2xiIbeiy4RG+bnMdZMKjR
	9RgrZXPM6i9IPugQ2o8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lo1-00000004WuD-1Tei;
	Wed, 06 Nov 2024 19:35:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8llS-00000004WS0-2JXU
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 19:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B145B5C3A71;
	Wed,  6 Nov 2024 19:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C13FC4CEC6;
	Wed,  6 Nov 2024 19:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730921545;
	bh=IRiCpI1LAj8gdXyqpxxNEdvHCy3pSba0EOUnJCNVx8M=;
	h=From:To:Cc:Subject:Date:From;
	b=IueV2hAxOOeLGHIfDB/awnPMqygPKif/0VdbjeCVzO7UyD91GK/Yn+CWjK0Y9H2wH
	 w99i2ktG2SbfFIgILZiDp6McxmHIS4d0QJeV/zNfr+AGcJhAlrFdNYbvCh1URk23lf
	 nY9UCQcnpa0xVUK9HNxgl4/fOyu92L3m6cIsLf2DVVmt2bY/3yXMr7V7FELJqPP1ym
	 eEsmQUIQOQW4uuY1HBSieTnr64F3MAZIJ+/lGxdZdSnxoYXd6QGC9LnZuXDtmqEKJN
	 Tn7UR1D4Eg63nUO4MJqO1a4dIsmGP0CopeTL8WZ+qyb6MwE0j+Nhdtnu31C11oBRZO
	 BTxU3j+H3Ig+Q==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Quentin Monnet <qmo@kernel.org>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Abdurachmanov <davidlt@rivosinc.com>
Subject: [PATCH] tools: Override makefile ARCH variable if defined, but empty
Date: Wed,  6 Nov 2024 20:32:06 +0100
Message-ID: <20241106193208.290067-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_113226_663475_295A64A9 
X-CRM114-Status: GOOD (  12.37  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlcmUgYXJlIGEgbnVt
YmVyIG9mIHRvb2xzIChicGZ0b29sLCBzZWxmdGVzdHMpLCB0aGF0IHJlcXVpcmUgYQoiYm9vdHN0
cmFwIiBidWlsZC4gSGVyZSwgYSBib290c3RyYXAgYnVpbGQgaXMgYSBidWlsZCBob3N0IHZhcmlh
bnQgb2YKYSB0YXJnZXQuIEUuZy4sIGFzc3VtZSB0aGF0IHlvdSdyZSBwZXJmb3JtaW5nIGEgYnBm
dG9vbCBjcm9zcy1idWlsZCBvbgp4ODYgdG8gcmlzY3YsIGEgYm9vdHN0cmFwIGJ1aWxkIHdvdWxk
IHRoZW4gYmUgYW4geDg2IHZhcmlhbnQgb2YKYnBmdG9vbC4gVGhlIHR5cGljYWwgd2F5IHRvIHBl
cmZvcm0gdGhlIGhvc3QgYnVpbGQgdmFyaWFudCwgaXMgdG8gcGFzcwoiQVJDSD0iIGluIGEgc3Vi
LW1ha2UuIEhvd2V2ZXIsIGlmIGEgdmFyaWFibGUgaGFzIGJlZW4gc2V0IHdpdGggYQpjb21tYW5k
IGFyZ3VtZW50LCB0aGVuIG9yZGluYXJ5IGFzc2lnbm1lbnRzIGluIHRoZSBtYWtlZmlsZSBhcmUK
aWdub3JlZC4KClRoaXMgc2lkZS1lZmZlY3QgcmVzdWx0cyBpbiB0aGF0IEFSQ0gsIGFuZCB2YXJp
YWJsZXMgZGVwZW5kaW5nIG9uIEFSQ0gKYXJlIG5vdCBzZXQuCgpXb3JrYXJvdW5kIGJ5IG92ZXJy
aWRpbmcgQVJDSCB0byB0aGUgaG9zdCBhcmNoLCBpZiBBUkNIIGlzIGVtcHR5LgoKRml4ZXM6IDg4
NTliMGRhNWFhYyAoInRvb2xzL2JwZnRvb2w6IEZpeCBjcm9zcy1idWlsZCIpClNpZ25lZC1vZmYt
Ynk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiB0b29scy9zY3JpcHRz
L01ha2VmaWxlLmFyY2ggfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvc2NyaXB0cy9NYWtlZmlsZS5hcmNo
IGIvdG9vbHMvc2NyaXB0cy9NYWtlZmlsZS5hcmNoCmluZGV4IGY2YTUwZjA2ZGZjNC4uZWFiZmU5
ZjQxMWQ5IDEwMDY0NAotLS0gYS90b29scy9zY3JpcHRzL01ha2VmaWxlLmFyY2gKKysrIGIvdG9v
bHMvc2NyaXB0cy9NYWtlZmlsZS5hcmNoCkBAIC03LDggKzcsOCBAQCBIT1NUQVJDSCA6PSAkKHNo
ZWxsIHVuYW1lIC1tIHwgc2VkIC1lIHMvaS44Ni94ODYvIC1lIHMveDg2XzY0L3g4Ni8gXAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1lIHMvc2hbMjM0XS4qL3NoLyAtZSBzL2Fh
cmNoNjQuKi9hcm02NC8gXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1lIHMv
cmlzY3YuKi9yaXNjdi8gLWUgcy9sb29uZ2FyY2guKi9sb29uZ2FyY2gvKQogCi1pZm5kZWYgQVJD
SAotQVJDSCA6PSAkKEhPU1RBUkNIKQoraWZlcSAoJChzdHJpcCAkKEFSQ0gpKSwpCitvdmVycmlk
ZSBBUkNIIDo9ICQoSE9TVEFSQ0gpCiBlbmRpZgogCiBTUkNBUkNIIDo9ICQoQVJDSCkKCmJhc2Ut
Y29tbWl0OiA3NzU4YjIwNjExN2RhYjk4OTRmMGJjYjgzMzNmOGU0NzMxYzUwNjVhCi0tIAoyLjQ1
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
