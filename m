Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2F0E9B378
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F94hcqSX59P5TZ4wXI9MIjkLMuqQ9pZcKEJYY16rKVk=; b=MxpDWbEfaID68Y
	v0JGmUOkJFLwk1FENGuGMXV1HYbvK5rKwUKKQGOXgL0mRi3gFL3Mo5BGoo+biKlVvYO+3DxJEZ1ZS
	9WFXB/uHsll6v0DTabYjQXkeBOETioivwEiYgjEoNEfz1YXlZt4IY6BxbI7bxgisiJNkT09C91cFj
	1dSY1p0uH5tiiwl4FAlsupcRuYBZ4OKzL1Rllhqnqjkbp5gBEw4dpKO/tf4GSn9MxSKwI6+allO2n
	5oToih7oifz093+LiWkw52jycxgkLZ6hqwiVM1YvDmX6ByYKrpM8m2ZSSkxAQj8So+G+Xr8PCeZRv
	q9sZTT9n5imdx1EjUu9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LW-0000000Cw2x-2SgV;
	Mon, 02 Mar 2026 12:25:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LM-0000000CvpH-3W8T;
	Mon, 02 Mar 2026 12:25:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glnHOe4x1n8QotwxnJCfVYRyCZYHnBdaRGVCFc6KFbk=;
	b=rxZQv7hKeFYWJyFKJsUWMqNlbl2vjnSpyMUWvtbM+KVkUK8WaqYOWnhTleOFkje/NFvInP
	Qt/vVXUdfFnn1iq74C1RCTqwoqvw522r7PU2TEuWmhtnt/N+13u0BFDqvSJ9+N50ZjfS4U
	BSarBmo8rYOEJLTRt0ek/3O3vhTop7sJQum0OPLLRalA9vrZx9iZHrKfjYg84JldDBDnZA
	t0WwlWRm4tnjSIcfZAdKa6/AeBM96TDCbJDRytzgPtYIaNnWXkYcPaqvUu9PXVyIRi67Kg
	DLHn9Iv+m+Ef7KGJDn9Agiynrv+ZuTEFjtwN8a9glkN8hM57G/egFrrJPWtgeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glnHOe4x1n8QotwxnJCfVYRyCZYHnBdaRGVCFc6KFbk=;
	b=4UlDmyzzjetdRsu/XceNY6w9k+iZB9u+rg7F/k0y7+4PQofKHMuBzzowktpEfzJO2FIgmM
	N2iAdlv556mYd5Bg==
Date: Mon, 02 Mar 2026 13:25:28 +0100
Subject: [PATCH 04/15] ARM: drop custom asm/auxvec.h
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-4-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=481;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=x3siZYFPocmk1PJ7pJ2spSV3FxjnTs1Nv3DHpd4VwUE=;
 b=rDZhb8bdTw53LKoUbzecX+TybS3+vD/iuZGnWTOdu4kbPRoekZDJcE/myi94bDcvoXoVfIa/j
 i0gchlTXUzRD5/MoKkZ/K9H2k8m5yzGUuEJql+dJlXH03noNQrp6bhu
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042549_078686_6BA04601 
X-CRM114-Status: UNSURE (   6.17  )
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

V2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIGFzbS1nZW5lcmljL2F1eHZlYy5oLCB0aGlzIGhlYWRl
ciB1bm5lY2Vzc2FyeS4KCkRyb3AgaXQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1
aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL2FybS9pbmNsdWRl
L2FzbS9hdXh2ZWMuaCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9hdXh2ZWMuaCBiL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2F1eHZlYy5oCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmYmQzODhjNDYyOTku
LjAwMDAwMDAwMDAwMAotLS0gYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9hdXh2ZWMuaAorKysgL2Rl
di9udWxsCkBAIC0xICswLDAgQEAKLSNpbmNsdWRlIDx1YXBpL2FzbS9hdXh2ZWMuaD4KCi0tIAoy
LjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
