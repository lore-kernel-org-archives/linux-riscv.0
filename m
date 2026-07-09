Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2F3C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 06:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zmafBtW9Iua4lZo1U65L9N3GUSMZNUxhEr0wO/7AlaI=; b=O7x8ZTLi08H1cY
	EJZJfoQWbIUndC8qkj6knw5eZLiP4j0D4bL6iRCxjfo0ZN6g7oD7IROx/4DwN5p6U4SNmpThps6s+
	HIz0CThz7lvbKplJ+bTlszcZqsSlpTtNIa7KyfdzcbHEkTRB5Ren9PgAaBkkS2zoSQqiicZbgBus/
	5buvNROQXJLEc12k0ypHuyiZq9oz+nf/m4ho9xUc2z7+I1hXmCN4SAkLUmS9mlwO4SjPbichnXOIO
	ap+XtXiKtJC77rLskRbWiHImMxkl5nRq3KHpfVNROWc5uJUsmaD45pHEsj6d8o2JtgGh200uWF00f
	flxL5YfIHxU5QrZ58S6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiZu-00000001DPN-1NOA;
	Thu, 09 Jul 2026 06:49:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiZr-00000001DOk-0vH4
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 06:49:45 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783579769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A0l3583rl9md/CilFQrriDQ4Jlwl+5Uor/FklIZsiZA=;
	b=sUEflbAUi0LnKXw4PySNV+AWon8jsdgOXWuYC+Y7b5mhIg9xd9b6z85JU3dDVK99gp2a/v
	EQWTKi4Gf+42hlFxEComABwKqHxHk43OhVzKMnWzrdGKSKdMyEnBb82EJ/pLimaqWVKoGV
	wbj+v6LiZF7ZoVu2C7lFFNvaN/sqyRzj+IAfhebbEVckfOCowRDrJKCM2OjBYxIw5EOlgn
	mAgunHlJdB/mDyQNSDIowIFIPwZPV/QIZqRJJ7+6GFjT34bic8e75fqwhokEtcWlFv0wF8
	aPNmpwBAlC1NyBO1j/WvL03eG8p7O6LcpGoLjoeK0HHe5FVwYqBx52Or3BI2SA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783579769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A0l3583rl9md/CilFQrriDQ4Jlwl+5Uor/FklIZsiZA=;
	b=vd7jE0LyZMILqIUJPHLEgSbsM8tZBlTUeOTYzlh3MoPNKVBTXU8VdSsVNUkfgXY6+TxSqN
	AV/0NFiRZsyMorCw==
Date: Thu, 09 Jul 2026 08:49:00 +0200
Subject: [PATCH] riscv: vdso: Only try to install vDSO when present
MIME-Version: 1.0
Message-Id: <20260709-riscv-install-vdso-v1-1-0ba4345419ca@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gbiH72KuCgmakCqNFIE8e4Wl
 28x84BJUDEYsgeCRDU9fEKRZzBvzq+CyslQUtlSRz0GtTmiervcvmNkO7Bmakm4aVzFkMIzyKL
 3Px2n9/0ANRqWXmQAAAA=
X-Change-ID: 20260709-riscv-install-vdso-4d060ed55a3d
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783579767; l=1175;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HQ7OkXTjb9RRF6ML2O8+PUM6ifh0eiN3K/6D6xzpR2Y=;
 b=vYaLeFXaq2xpufn7L9D3qhjQOdJ3pDld/FtTsYgHTgSfyr1E0y00EbH2IwiVEAo1r0NrKpxnK
 wb1KYX5Ya97DrDHU9q6w5mqFaQsEIOQPQIcYBwduJlsnWv17R0KYPGO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_234944_201750_747BCDD3 
X-CRM114-Status: UNSURE (   6.93  )
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

dmRzby5zby5kYmcgaXMgb25seSBidWlsdCB3aXRoIENPTkZJR19NTVUuCgpSZXBvcnRlZC1ieTog
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CkNsb3NlczogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDcwOTAyNTguaVNBVVlsTzEtbGtwQGludGVsLmNv
bS8KRml4ZXM6IGYxNTdkNDExYTllYiAoInJpc2N2OiBhZGQgbWlzc2luZyB2ZHNvX2luc3RhbGwg
dGFyZ2V0IikKRml4ZXM6IDNlZGYzOTkxNjk3NyAoInZEU08sIGtidWlsZDogUHJvdmlkZSB2RFNP
IGRlYnVnIHZhcmlhbnRzIGF0IHJ1bnRpbWUiKQpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59z
Y2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL3Jpc2N2L01h
a2VmaWxlIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvTWFrZWZp
bGUKaW5kZXggY2UwY2M3MzdmODcwLi4xMzYzZTViZWYzNWMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvTWFrZWZpbGUKKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQpAQCAtMTY4LDcgKzE2OCw3IEBA
IHZkc29fcHJlcGFyZTogcHJlcGFyZTAKIGVuZGlmCiBlbmRpZgogCi12ZHNvLWluc3RhbGwteQkJ
CSs9IGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmRzby5zby5kYmcKK3Zkc28taW5zdGFsbC0kKENP
TkZJR19NTVUpCQkrPSBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28uc28uZGJnCiB2ZHNvLWlu
c3RhbGwtJChDT05GSUdfUklTQ1ZfVVNFUl9DRkkpCSs9IGFyY2gvcmlzY3Yva2VybmVsL3Zkc29f
Y2ZpL3Zkc28tY2ZpLnNvLmRiZwogdmRzby1pbnN0YWxsLSQoQ09ORklHX0NPTVBBVCkJKz0gYXJj
aC9yaXNjdi9rZXJuZWwvY29tcGF0X3Zkc28vY29tcGF0X3Zkc28uc28uZGJnCiAKCi0tLQpiYXNl
LWNvbW1pdDogZGM1OWU0ZmVhOWQ4M2YwM2JhZDZiZGRmM2ZhMmU1MjQ5MTc3NzQ4MgpjaGFuZ2Ut
aWQ6IDIwMjYwNzA5LXJpc2N2LWluc3RhbGwtdmRzby00ZDA2MGVkNTVhM2QKCkJlc3QgcmVnYXJk
cywKLS0gIApUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5k
ZT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
