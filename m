Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F66C5B543
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwgMch9YNh+OPJqja8qhGQCjCYVLy60im1SxW7qpNXs=; b=bCbGg3I12tmQBG
	yyajR9Yal6Iy1PJZp5UHmqMmU3QQ2yNLklVDpNDBr9AQa3zu7z/PEawEVdK5USjCkFk6Hpdb/5RRW
	3SxsRIzwgzzrMmQN7uEbLgCwacXGJ33HC5cta587SP6iR9fxEFntbCCku3wtGNRxxbWyojaRbSToP
	qTZGP2/VMguvVtlp3HqKJguZOmTfH2ZOmr43nnT8nSM/zGBDh+T+S9qLGUww6Pg4DDnxQxZi0qYNS
	z631B61ouWOA89xSca/3LJCM44WJqMu+axAyLV+E7y9M9PmjuNXnFlM12jkX8q2bSIiAPk1DzGprL
	yJk1D2Vs2W5Yu3WOXg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpkf-0000000DeyY-2MiQ;
	Wed, 04 Jun 2025 15:10:01 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpkc-0000000Dexb-37f3
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 15:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1749049795;
	bh=q8h9kR1SVvQAsWuLnRY9YRkZHJsMjxdtRkk78Wgjdw4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KifjrDExQCQTOpSkL0e//z15yMT5tQHomdzwY0IsE/kFg+gnlj8Sh7M/magBS4m3B
	 kO71Sukk0TpN+u0jKY1BRwYlsZp5UU7Yvq/WQ39ZSLDlKOnFkh+0Df0iTRovWI5DEs
	 XRtr7n5YcP+oQ8J3OLqCdkH7wf51FrunXFWVNRy0=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 80F9465F62;
	Wed,  4 Jun 2025 11:09:53 -0400 (EDT)
Message-ID: <5065dcf8fe1995859874196aa9ea5c0bff056ae3.camel@xry111.site>
Subject: [PATCH] RISC-V: vDSO: Correct inline assembly constraints in the
 getrandom syscall wrapper
From: Xi Ruoyao <xry111@xry111.site>
To: Alexandre Ghiti <alex@ghiti.fr>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
	 <thomas.weissschuh@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley
	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren
	 <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 04 Jun 2025 23:09:52 +0800
In-Reply-To: <57a1ced6-406b-4197-96ca-6b83d99ca1a0@ghiti.fr>
References: <20250411024600.16045-1-xry111@xry111.site>
	 <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
	 <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
	 <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
	 <71f093d5-4823-4bc6-b9ee-23433bd8c60c@ghiti.fr>
	 <0f0eb024d7ed062141a8aa048017e6f7ef7c1fd4.camel@xry111.site>
	 <57a1ced6-406b-4197-96ca-6b83d99ca1a0@ghiti.fr>
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_080958_791305_795E16B0 
X-CRM114-Status: GOOD (  12.40  )
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
c2FtZSByZWdpc3RlciBhcyB0aGUgb3V0cHV0LiAgSSdtIG5vdCBzdXJlIGlmIHVzaW5nIGEgc2lt
cGxlCiJyIiBmb3IgdGhlIGlucHV0IGlzIHNhZmUgb3Igbm90IGhlcmUsIHNvIGp1c3QgZm9sbG93
IHRoZSBkb2N1bWVudGF0aW9uLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjUwNjAzLWxvb25nYXJjaC12ZHNvLXN5c2NhbGwtdjEtMS02ZDEyZDZkZmJkZDBAbGludXRyb25p
eC5kZS8KTGluazogaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2djYy0xNS4xLjAvZ2Nj
L0xvY2FsLVJlZ2lzdGVyLVZhcmlhYmxlcy5odG1sCkNjOiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhv
bWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KQ2M6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNp
dGU+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaAppbmRleCA4ZGM5MjQ0MTcwMmEuLjBkODRh
MzhlNzlkYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRv
bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaApAQCAtMTgs
OCArMTgsOCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHNzaXplX3QgZ2V0cmFuZG9tX3N5c2Nh
bGwodm9pZCAqX2J1ZmZlciwgc2l6ZV90IF9sZW4sIHVucwogCXJlZ2lzdGVyIHVuc2lnbmVkIGlu
dCBmbGFncyBhc20oImEyIikgPSBfZmxhZ3M7CiAKIAlhc20gdm9sYXRpbGUgKCJlY2FsbFxuIgot
CQkgICAgICA6ICIrciIgKHJldCkKLQkJICAgICAgOiAiciIgKG5yKSwgInIiIChidWZmZXIpLCAi
ciIgKGxlbiksICJyIiAoZmxhZ3MpCisJCSAgICAgIDogIj1yIiAocmV0KQorCQkgICAgICA6ICJy
IiAobnIpLCAiMCIgKGJ1ZmZlciksICJyIiAobGVuKSwgInIiIChmbGFncykKIAkJICAgICAgOiAi
bWVtb3J5Iik7CiAKIAlyZXR1cm4gcmV0OwoKYmFzZS1jb21taXQ6IGRjNTI0MGYwOWJjYTdiNWZj
NzJhZDg4OTRkNmI5MzIxYmNlNTExMzkKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
