Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90123E9B377
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aKWsoM9BK8fUe+X2AnRHPn7grB6bEFv3IdpBQMDiYM=; b=XY9Ri1fTvxbnqw
	iglN0lymQHdQzK98Ock/VY6SDnYUQjviVEJYW31qS90cXCCbANOWq8xrwxZqqjHgRl9OhlrPs6IN4
	jY+woxKKj5B8iTS8ILKppEWNdavVKY81EVursa9dXIQWSeJPd4kXWarsSGE3/CprTy3HGxUwHlHwk
	yVk6vLBxO9SoA1dk/QC1FGCjnlYBze8REfjb/2BmkSkzj3okot1gTIrZLXsWed4VTF6AarYdjIxlb
	VbOVjAAd0oRl5OGyliflnZYi0frehim8eDtUS+aeu3qYr7ezSvcYsppvoNmcLs6Yr2h1LE3fAGZCq
	vEwN166VKpOaPN0+qonw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LV-0000000Cw16-1LpA;
	Mon, 02 Mar 2026 12:25:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LM-0000000CvpE-44Rr;
	Mon, 02 Mar 2026 12:25:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgXUWuBQc37HPqUBgBljEt4K1lGTSpiCtiKFdFvnpEo=;
	b=ZRJF2/RIYlZzXdvvP4EyC5ziS1eYTGNaiCpGWGAlhlhh6WP8XJtMwKY10FScMfkRk07Kpn
	WAm0HrLrPe3V8GufiCyKFmoR+hIoDakEwVJRmOfrOG1vTfDvZthRNy9j1FqSQDBSumosRb
	lSJyQo7Ek9W6Irxwps/fZr6+32MXQ1g940bY7aUn2wgzoOpTYYGfSmYo1TtUi2eNGBzDXQ
	HoOKG9XkKlO6Lsynm5IwDc/mDANODBHa3D+7XWmQ4jr8Z4GRPHRxNIFyYedKVrZJWzUsgn
	Xi/TXpXkeaoOKoyyrYw2RkYIhmbqg4P5rd78zu1pTPRTbMW07FzruR62fY8Dzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgXUWuBQc37HPqUBgBljEt4K1lGTSpiCtiKFdFvnpEo=;
	b=0RhC5Fte5zjulHI4Ol2L/ovJ2Kd9lvvPGCNYvwBDoFq6AG8nEkIzJV8ldugwY4YHFGhnle
	Y1e4YJBTshKAKTBQ==
Date: Mon, 02 Mar 2026 13:25:26 +0100
Subject: [PATCH 02/15] auxvec.h: Move AT_VECTOR_SIZE definitions to
 linux/auxvec.h
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-2-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1267;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=R6dPuK9hTEu2wzxXNEaPtc8TE7i9ikP4nTJiTP9bZT8=;
 b=ZulijLjkAtvEzMGw3cQEKThTnvyrB3XWkn02AB0dxIROztyb5g4HrOCwXizPScG4JZMtRLaOM
 3hiDIzMjiB4ARdfLbg+OTnHYu6B/6h5UxzpDiSphCOmDSpy2QygkNcG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042549_144397_B8FB559A 
X-CRM114-Status: UNSURE (   8.27  )
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

VGhlIGF1eHZlYy5oIGhlYWRlciBpcyBhIG1vcmUgZml0dGluZyBwbGFjZSBmb3IgdGhlc2UgZGVm
aW5pdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNz
c2NodWhAbGludXRyb25peC5kZT4KLS0tCiBpbmNsdWRlL2xpbnV4L2F1eHZlYy5oICAgfCA3ICsr
KysrKysKIGluY2x1ZGUvbGludXgvbW1fdHlwZXMuaCB8IDYgLS0tLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2F1eHZlYy5oIGIvaW5jbHVkZS9saW51eC9hdXh2ZWMuaAppbmRleCA0MDdmNzAwNWU2
ZDYuLjk0M2U4YjgwYjQxZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9hdXh2ZWMuaAorKysg
Yi9pbmNsdWRlL2xpbnV4L2F1eHZlYy5oCkBAIC02LDQgKzYsMTEgQEAKIAogI2RlZmluZSBBVF9W
RUNUT1JfU0laRV9CQVNFIDIyIC8qIE5FV19BVVhfRU5UIGVudHJpZXMgaW4gYXV4aWxpYXJ5IHRh
YmxlICovCiAgIC8qIG51bWJlciBvZiAiI2RlZmluZSBBVF8uKiIgYWJvdmUsIG1pbnVzIHtBVF9O
VUxMLCBBVF9JR05PUkUsIEFUX05PVEVMRn0gKi8KKworI2lmbmRlZiBBVF9WRUNUT1JfU0laRV9B
UkNICisjZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggMAorI2VuZGlmCisKKyNkZWZpbmUgQVRf
VkVDVE9SX1NJWkUgKDIqKEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggKyBBVF9WRUNUT1JfU0laRV9CQVNF
ICsgMSkpCisKICNlbmRpZiAvKiBfTElOVVhfQVVYVkVDX0ggKi8KZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvbW1fdHlwZXMuaCBiL2luY2x1ZGUvbGludXgvbW1fdHlwZXMuaAppbmRleCAzY2M4
YWU3MjI4ODYuLjY0MDE5ZGMyOWY0YyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tbV90eXBl
cy5oCisrKyBiL2luY2x1ZGUvbGludXgvbW1fdHlwZXMuaApAQCAtMjUsMTIgKzI1LDYgQEAKIAog
I2luY2x1ZGUgPGFzbS9tbXUuaD4KIAotI2lmbmRlZiBBVF9WRUNUT1JfU0laRV9BUkNICi0jZGVm
aW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggMAotI2VuZGlmCi0jZGVmaW5lIEFUX1ZFQ1RPUl9TSVpF
ICgyKihBVF9WRUNUT1JfU0laRV9BUkNIICsgQVRfVkVDVE9SX1NJWkVfQkFTRSArIDEpKQotCi0K
IHN0cnVjdCBhZGRyZXNzX3NwYWNlOwogc3RydWN0IGZ1dGV4X3ByaXZhdGVfaGFzaDsKIHN0cnVj
dCBtZW1fY2dyb3VwOwoKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
