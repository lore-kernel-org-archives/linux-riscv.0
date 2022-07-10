Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED09CCA479
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWxDCEcfBsTSQAksBJi4nDNqb/2X6tGgfDb4nyar4hs=; b=bCxdd3Ay+YOkkx
	PeCU8QVius1dA5d+pBTlZXIHDGRM1fA1hUMt8ynqrRxbhRKt44V272twi1Rxdp8xLhH16hJxx0HcB
	elvutTQ1sYATCHrvKhB/iYH0+1ZK70wNsmus8ScmU/JANaL4ewaipfwzqvqvUpofhavxDg4XtHiOh
	RyEwFRIP6dVRLVHIn+wUg4vh9DNghQySnS8nXSBRbujSRRVSwKTspEw68u6oOZLqFJB9E0UUkmrbf
	f+mpDFSzO9tMWd6OWFQfbJX0c7WvxqggZGE4Bo7FZGAdfjC5EzvXjk8xQ8T8MiANTEvxl3h5WSh0I
	tRkLS1va3cqOG1cLmJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oARoN-00B3yN-Jx; Sun, 10 Jul 2022 07:57:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oARoL-00B3t4-5H
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 07:57:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7569A61147;
	Sun, 10 Jul 2022 07:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB07C341CA;
	Sun, 10 Jul 2022 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657439818;
	bh=ERlRQJe95a6urK9nivFv22oXlGKUPv4TRBBlVhNKljA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fzkocnHruRU2ZIP+aw1h65j+1/HZiziY/bVyP5gS69zzQEZKt/QHcv1lhEHRUWaYk
	 XB06K805rwDis22GMjhgrOgAnwFjCD+HZ4e6BQL6hhp9uUZUrPZOjVE53d/LMoJzo0
	 s1az9AKq+H6B7GByTGk0piXBYfyFNoUHIicIy0ho7+osKG7Z4jMkOaoA9nh0txs+n7
	 qK8eor0cFDU1yDIkR0AJ10aCOWARJZZdXYUbhbXUNUn7VCOOUgJGTd1MEIK9x0llsX
	 +Vqk4G/7tfeelXcwJPFrkF5aXoklFxJoEH1KATrtVKI2Tix1qUDyGBM/z7+EPDxjMH
	 W6+dALKpEIxyQ==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [RFC PATCH V2 2/4] riscv: Cleanup ERRATA_THEAD_PBMT for rv32 svpbmt compile
Date: Sun, 10 Jul 2022 03:56:42 -0400
Message-Id: <20220710075644.738455-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220710075644.738455-1-guoren@kernel.org>
References: <20220710075644.738455-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_005701_283050_04466DF3 
X-CRM114-Status: GOOD (  11.60  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKTWFrZSBjb21waWxlIGNs
ZWFuZXIgYW5kIGRvbid0IHJlZmVyZW5jZSB0aGUgVEhFQURfUEJNVCBkYXRhIHN0cnVjdCB3aGVu
CkNPTkZJR19FUlJBVEFfVEhFQURfUEJNVD15LiBOZXh0LCB3ZSBjb3VsZCBjbGVhbmx5IG1ha2Ug
c3ZwYm10IHRvCnN1cHBvcnQgcnYzMi4KCldoZW4gY3VycmVudCBDT05GSUdfRVJSQVRBX1RIRUFE
X1BCTVQgaXMgYWN0aXZlIGluIHRoZSBhbHRlcm5hdGl2ZSBzZWN0aW9uCmFkZGVkIHRvIHRoZSBi
dWlsZC4KSS5lLiB0aGF0IHRyYW5zbGF0ZXMgdG86CgogICAgICAgICAuaWYgSVNfRU5BQkxFRChD
T05GSUdfRVJSQVRBX1RIRUFEX1BCTVQpCiAgICAgICAgIC5wdXNoc2VjdGlvbiAuYWx0ZXJuYXRp
dmUsICJhIgogICAgICAgICAuLi4KCkJ1dCwgYWJvdmUgY2FuJ3QgYWZmZWN0IHRoZSBiZWxvdzoK
CS4uLgoJIkkiKHByb3QjI19USEVBRCA+PiBBTFRfVEhFQURfUEJNVF9TSElGVCksCgkuLi4KCSJJ
IihBTFRfVEhFQURfUEJNVF9TSElGVCkpCgpDT05GSUdfRVJSQVRBX1RIRUFEX1BCTVQgaXMgbm90
IGNsZWFuIGVub3VnaCwgY29tcGlsZXIgc3RpbGwKcHJvY2VzcyB0aGUgICJJIihwcm90IyNfVEhF
QUQgPj4gQUxUX1RIRUFEX1BCTVRfU0hJRlQpIiAmCiJJIihBTFRfVEhFQURfUEJNVF9TSElGVCku
CgpTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+ClNpZ25l
ZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgpDYzogSGVpa28gU3TDvGJuZXIg
PGhlaWtvQHNudGVjaC5kZT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0
LmggfCAxMSArKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9s
aXN0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmgKaW5kZXggNDE2ZWFk
MGY5YTY1Li40NzE3NWQ5MTc3M2QgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
ZXJyYXRhX2xpc3QuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmgK
QEAgLTQ3LDYgKzQ3LDggQEAgYXNtKEFMVEVSTkFUSVZFKCJzZmVuY2Uudm1hICUwIiwgInNmZW5j
ZS52bWEiLCBTSUZJVkVfVkVORE9SX0lELAlcCiAgKiBpbiB0aGUgZGVmYXVsdCBjYXNlLgogICov
CiAjZGVmaW5lIEFMVF9TVlBCTVRfU0hJRlQgNjEKKworI2lmZGVmIENPTkZJR19FUlJBVEFfVEhF
QURfUEJNVAogI2RlZmluZSBBTFRfVEhFQURfUEJNVF9TSElGVCA1OQogI2RlZmluZSBBTFRfU1ZQ
Qk1UKF92YWwsIHByb3QpCQkJCQkJXAogYXNtKEFMVEVSTkFUSVZFXzIoImxpICUwLCAwXHRcbm5v
cCIsCQkJCQlcCkBAIC02MCw3ICs2Miw2IEBAIGFzbShBTFRFUk5BVElWRV8yKCJsaSAlMCwgMFx0
XG5ub3AiLAkJCQkJXAogCQkgICJJIihBTFRfU1ZQQk1UX1NISUZUKSwJCQkJXAogCQkgICJJIihB
TFRfVEhFQURfUEJNVF9TSElGVCkpCiAKLSNpZmRlZiBDT05GSUdfRVJSQVRBX1RIRUFEX1BCTVQK
IC8qCiAgKiBJTy9OT0NBQ0hFIG1lbW9yeSB0eXBlcyBhcmUgaGFuZGxlZCB0b2dldGhlciB3aXRo
IHN2cGJtdCwKICAqIHNvIG9uIFQtSGVhZCBjaGlwcywgY2hlY2sgaWYgbm8gb3RoZXIgbWVtb3J5
IHR5cGUgaXMgc2V0LApAQCAtOTAsNiArOTEsMTQgQEAgYXNtIHZvbGF0aWxlKEFMVEVSTkFUSVZF
KAkJCQkJCVwKIAkgICJJIihBTFRfVEhFQURfUEJNVF9TSElGVCkJCQkJCVwKIAk6ICJ0MyIpCiAj
ZWxzZQorI2RlZmluZSBBTFRfU1ZQQk1UKF92YWwsIHByb3QpCQkJCQkJXAorYXNtKEFMVEVSTkFU
SVZFKCJsaSAlMCwgMFx0XG5ub3AiLAkJCQkJXAorCQkgImxpICUwLCAlMVx0XG5zbGxpICUwLCUw
LCUyIiwgMCwJCQlcCisJCQlDUFVGRUFUVVJFX1NWUEJNVCwgQ09ORklHX1JJU0NWX0lTQV9TVlBC
TVQpCVwKKwkJOiAiPXIiKF92YWwpCQkJCQkJXAorCQk6ICJJIihwcm90IyNfU1ZQQk1UID4+IEFM
VF9TVlBCTVRfU0hJRlQpLAkJXAorCQkgICJJIihBTFRfU1ZQQk1UX1NISUZUKSkKKwogI2RlZmlu
ZSBBTFRfVEhFQURfUE1BKF92YWwpCiAjZW5kaWYKIAotLSAKMi4zNi4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
