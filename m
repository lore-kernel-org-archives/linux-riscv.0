Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344CECD6E5D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 11:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ie+cvsNkPrpwDIqEHrkRFiVvrTximB6skcojMxk3cY=; b=NNnZfLZP3P92d2
	wFiqD5QIA9xk5ffiFMb6cU+BP7deCS9VM4Au7a35mGkOqlrmiLvzOklsrJEtJxeGt0dTazCUhaJG5
	zwgkuLfmJIQHdEUe0TONm+qyKKIvyrelRsINgdLCw3OomvJNJ6NUOlCYdusNSVXjh+VQY/0eqCM72
	aw5a5K7v3OmtPHJ26joYxeprNgns+5Jeymo4QVhx5ojytT9X6oZYAC31ASb1NC+FoGDHmIweNMzp0
	a/MffHS7aJJ8ejs00bd3OYn8+Y0iI+d1jaDeZg+NdGNmESC3Ef0HFW+1BaozpgX34qlnUN0A/I16L
	uNipYtpnU93tx1u9rBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXga-00FmIg-16;
	Wed, 11 Oct 2023 11:47:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXgX-00FmI5-2M
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:47:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0BC861BD5;
	Wed, 11 Oct 2023 11:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073EAC433C9;
	Wed, 11 Oct 2023 11:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697024848;
	bh=5eol+w9isDPPTceO0nec+Q5JC7nAOskqOPXHsIAf75Q=;
	h=From:To:Cc:Subject:Date:From;
	b=rn63VAU0/bWUAp3lCxWWpkSw9gd9a42ATMVADGPkaClKeM6rE5K2L3RtE0+uAMYeS
	 8tu7jbJSDzs+gLhP+5LZK8j8Gg4F8Zr4jd2pf1PuhaPXprA9XeS6lu5f/Kd20pxWTg
	 qc5D1dnzOnztti8h0IlLDHg52+bahm8Edro1oexxTO5TnwfqWAbL8wMybH7HVghNXB
	 2v/XkKWu1P9WLthhCx5fxuV55ZKZZUflHJypPLIg/WT/62a/6c2Tume2Yc8hcl00S6
	 ptFuxGkq6EEdNl3n7SW7ygbHETur+TiHQXsOpzFXjkkqLpfLjKJmHDms62y6rfV3ts
	 7BAeo8HCGH/5A==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Gabriel Somlo <somlo@cmu.edu>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv, qemu_fw_cfg: Add support for RISC-V architecture
Date: Wed, 11 Oct 2023 13:47:21 +0200
Message-Id: <20231011114721.193732-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_044729_835060_A762321F 
X-CRM114-Status: GOOD (  12.17  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKUWVtdSBmd19jZmcgc3Vw
cG9ydCB3YXMgbWlzc2luZyBmb3IgUklTQy1WLCB3aGljaCBtYWRlIGl0IGhhcmQgdG8gZG8KcHJv
cGVyIHZtY29yZSBkdW1wcyBmcm9tIHFlbXUuCgpBZGQgdGhlIG1pc3NpbmcgUklTQy1WIGFyY2gt
ZGVmaW5lcy4KCllvdSBjYW4gbm93IGRvIHZtY29yZSBkdW1wcyBmcm9tIHFlbXUuIEFkZCAiLWRl
dmljZSB2bWNvcmVpbmZvIiB0byB0aGUKcWVtdSBjb21tYW5kLWxpbmUuIEZyb20gdGhlIHFlbXUg
bW9udGlvcjoKICAocWVtdSkgZHVtcC1ndWVzdC1tZW1vcnkgdm1jb3JlCgpUaGUgdm1jb3JlIGNh
biBub3cgYmUgdXNlZCwgZS5nLiwgd2l0aCB0aGUgImNyYXNoIiB1dGlsaXR5LgoKU2lnbmVkLW9m
Zi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0KIGRyaXZlcnMvZmly
bXdhcmUvS2NvbmZpZyAgICAgICB8IDIgKy0KIGRyaXZlcnMvZmlybXdhcmUvcWVtdV9md19jZmcu
YyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvS2NvbmZpZyBiL2RyaXZlcnMvZmlybXdh
cmUvS2NvbmZpZwppbmRleCBiNTllMzA0MWZkNjIuLmYwNWZmNTY2MjliMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9maXJtd2FyZS9LY29uZmlnCisrKyBiL2RyaXZlcnMvZmlybXdhcmUvS2NvbmZpZwpA
QCAtMTU1LDcgKzE1NSw3IEBAIGNvbmZpZyBSQVNQQkVSUllQSV9GSVJNV0FSRQogCiBjb25maWcg
RldfQ0ZHX1NZU0ZTCiAJdHJpc3RhdGUgIlFFTVUgZndfY2ZnIGRldmljZSBzdXBwb3J0IGluIHN5
c2ZzIgotCWRlcGVuZHMgb24gU1lTRlMgJiYgKEFSTSB8fCBBUk02NCB8fCBQQVJJU0MgfHwgUFBD
X1BNQUMgfHwgU1BBUkMgfHwgWDg2KQorCWRlcGVuZHMgb24gU1lTRlMgJiYgKEFSTSB8fCBBUk02
NCB8fCBQQVJJU0MgfHwgUFBDX1BNQUMgfHwgUklTQ1YgfHwgU1BBUkMgfHwgWDg2KQogCWRlcGVu
ZHMgb24gSEFTX0lPUE9SVF9NQVAKIAlkZWZhdWx0IG4KIAloZWxwCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2Zpcm13YXJlL3FlbXVfZndfY2ZnLmMgYi9kcml2ZXJzL2Zpcm13YXJlL3FlbXVfZndfY2Zn
LmMKaW5kZXggYTY5Mzk5YTZiN2MwLi4xNDQ4ZjYxMTczYjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
ZmlybXdhcmUvcWVtdV9md19jZmcuYworKysgYi9kcml2ZXJzL2Zpcm13YXJlL3FlbXVfZndfY2Zn
LmMKQEAgLTIxMSw3ICsyMTEsNyBAQCBzdGF0aWMgdm9pZCBmd19jZmdfaW9fY2xlYW51cCh2b2lk
KQogCiAvKiBhcmNoLXNwZWNpZmljIGN0cmwgJiBkYXRhIHJlZ2lzdGVyIG9mZnNldHMgYXJlIG5v
dCBhdmFpbGFibGUgaW4gQUNQSSwgRFQgKi8KICNpZiAhKGRlZmluZWQoRldfQ0ZHX0NUUkxfT0ZG
KSAmJiBkZWZpbmVkKEZXX0NGR19EQVRBX09GRikpCi0jIGlmIChkZWZpbmVkKENPTkZJR19BUk0p
IHx8IGRlZmluZWQoQ09ORklHX0FSTTY0KSkKKyMgaWYgKGRlZmluZWQoQ09ORklHX0FSTSkgfHwg
ZGVmaW5lZChDT05GSUdfQVJNNjQpIHx8IGRlZmluZWQoQ09ORklHX1JJU0NWKSkKICMgIGRlZmlu
ZSBGV19DRkdfQ1RSTF9PRkYgMHgwOAogIyAgZGVmaW5lIEZXX0NGR19EQVRBX09GRiAweDAwCiAj
ICBkZWZpbmUgRldfQ0ZHX0RNQV9PRkYgMHgxMAoKYmFzZS1jb21taXQ6IDFjOGI4NmEzNzk5Zjdl
NWJlOTAzYzNmNDlmY2RhZWUyOWZkMzg1YjUKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
