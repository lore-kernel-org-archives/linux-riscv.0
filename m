Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352EAC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GVmZ63Qp0jNGfBvN/xJ50kjokggSP4xvf4dvLvfPPlk=; b=oqQIQbWlCS8k80
	mrHUFzOPiaRxMNZ+NFLd5o8GHf1kgV+rG0Fi5/+hpr7Fm0YHFRCnS+xTPLBJ07iFCd9lYnpdIW1bw
	aQYab9CuMyJTn9viKshvRhkUQSksPqLHfGW+H9cxTGuylrymNW/avgQjATHhKfXRYGYMrHGwhebTV
	fLtDapBPCr9MaJ/zz7s6gD0Us3MtTSwkEiQjSzmsI7qk4EteTYZwH4eeYD39e6RucYr3Hg50nZ38f
	PlnekOFnYqz2oaGRqKGiD3FJXOY2ZCi8YnEEPitDh2iOGFlzETiJWkdZY9Oy2rEUbwUGMfPvgjZvn
	Awc1mWU1pbZJx5j2tYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT6J-0000000G8Py-0Cho;
	Tue, 30 Jun 2026 07:41:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT6G-0000000G8P9-0MAR
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:41:45 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782805301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sCS5Ad3BtzXDOl+E/lWdBnjM3T+fHz/6gG2B4g5FazU=;
	b=uU0RtDENm3X+f5sceqPzjW02bI7XLCiXeZcjPtw/kCzc9tVEptR1FTX/JxRBbUA+gkxD67
	GaBygsLc1f1wZDDt2jjdblXpIi2v9L1FWlv969VA06mfAGMcUK9tFcX+AYKHAwmaxymyW1
	cLWzHobfgm9M+Bh45SjU5CQfwgnLFGK/YGh79DEcpeSnpqlLYOy+HQNPm2zTxSof65hlbd
	O3M7OKruxuYDwmMjd3BoQ9aolV3P6Rclc6ClDUL5Om1TdWrDAURoaOR+/JCm7n+/k7cZ5d
	pdHFXZ6fwYt0UVUu/wVKLw2ASu222Ay7Z4Xd4sMhc1QZfxWySRsazoJPGoG+gA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782805301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sCS5Ad3BtzXDOl+E/lWdBnjM3T+fHz/6gG2B4g5FazU=;
	b=WeFioL4U/+NJsl037Iu2Sxt71EJ327sxfMGtFPcLNj4JwlryJuN0fZIBBRzx7xv0BoywfI
	OKhnB2iCUrfgw1Cw==
Subject: [PATCH 0/3] riscv: alternative: Statically compute alternative
 section boundaries and patch compat vDSO
Date: Tue, 30 Jun 2026 09:41:39 +0200
Message-Id: <20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnBeocSvWVxk7lDabAamSSBmI7
 27x+B3+/wBjFTaYugOUq5ispaF/dJDmWH6MkpuBHHnnyaOKpYo12zoQxmVnLXGXyhjyEOjlUhi
 fEVq+KX/lf6/fn/O8AK/SUwBqAAAA
X-Change-ID: 20260626-riscv-vdso32-alternative-9d39250c984a
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805300; l=1165;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=iqjPkvSsG69+RR7yf7vIFXdCTkoG5SGMJ3ObnPPY2WA=;
 b=OsoBozJtfvu5vPX1l8a1Y0fYVM3dkAvC2X+bft+cU09NKMWfuWA1K7xI6HuQl4Mqiad5Oz6Xd
 0gjByanag3XBy+bgvH2njTQjQqfAN4Cl1ylkDOplOfTrexs7NpG5DqR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004144_260135_86351FE1 
X-CRM114-Status: UNSURE (   4.60  )
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

Q3VycmVudGx5IHRoZSBhbHRlcm5hdGl2ZSBzZWN0aW9ucyBhcmUgZXh0cmFjdGVkIGZyb20gdGhl
IHZEU08KYmluYXJpZXMgYXQgcnVudGltZS4gVGhpcyBoYXMgcnVudGltZSBvdmVyaGVhZCBhbmQg
YWxzbyBkb2Vzbid0CndvcmsgZm9yIHRoZSBjb21wYXQgdkRTTy4KCkV4dHJhY3QgdGhlIG9mZnNl
dHMgb2YgdGhlIGFsdGVybmF0aXZlIHNlY3Rpb24gZHVyaW5nIHRoZSBidWlsZCB3aXRoIHRoZQpl
eGlzdGluZyBzeW1ib2wgZXh0cmFjdGlvbiBtYWNoaW5lcnkgYW5kIHVzZSB0aG9zZS4KCkFsc28g
YWRkIHN1cHBvcnQgZm9yIHRoZSBjb21wYXQgdkRTTy4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvY292ZXIuMTc4MTg3NjUwMS5naXQubmFtY2FvQGxpbnV0cm9uaXguZGUvClNp
Z25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIChTY2huZWlkZXIgRWxlY3RyaWMpIDx0aG9t
YXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KVGhvbWFzIFdlacOfc2NodWggKDMpOgog
ICAgICByaXNjdjogdmRzbzogQWRkIHN5bWJvbHMgZm9yIHRoZSBhbHRlcm5hdGl2ZSBzZWN0aW9u
IGJvdW5kYXJpZXMKICAgICAgcmlzY3Y6IGFsdGVybmF0aXZlOiBVc2UgdGhlIHN0YXRpY2FsbHkg
ZXh0cmFjdGVkIHZEU08gc2VjdGlvbiBvZmZzZXRzCiAgICAgIHJpc2N2OiBhbHRlcm5hdGl2ZTog
QWxzbyBwYXRjaCB0aGUgY29tcGF0IHZEU08KCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28u
aCAgICAgfCAgNiArKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMgICB8IDMz
ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdmRz
by92ZHNvLmxkcy5TIHwgIDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwg
MTcgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogMTBjZDRjZjIwZDNkOTI1MzI0ODVlM2Yw
Mzg0ZTYxYWJjOTBkNmM1NApjaGFuZ2UtaWQ6IDIwMjYwNjI2LXJpc2N2LXZkc28zMi1hbHRlcm5h
dGl2ZS05ZDM5MjUwYzk4NGEKCkJlc3QgcmVnYXJkcywKLS0gIApUaG9tYXMgV2Vpw59zY2h1aCAo
U2NobmVpZGVyIEVsZWN0cmljKSA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
