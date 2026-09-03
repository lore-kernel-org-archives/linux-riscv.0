Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E71C624D4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHaIdBLMIPzafxqQCgTSMk6Tt6zFlo0kZ7RhNQmjZJM=; b=q1vnU0ZrKQ3lmK
	gOVMHCPXCOGu1XFIG3TK6WO8SvmNL4SWNW9PsmUUlhyY6JkJdu5wfwUtFgMMJTk2Gfoz8R4mV/MRj
	EjsM63q0gRfas1Wre5dJBjcA2oA7X40ARFff3Ut5RoB0QE69+NXXjC6AFF3fhHlanDLx4yP+MAnu9
	C70kfMw4z2lSwIhZB3umr2jZ8d3gkCobUHkWRFe8Fbjl7PeNr75H8uDQnCoD/XIIPq80CxUJW33BY
	8sa4t4L1EWmcK/Da8OQ+WxeKeGwFSXKUXPbai5YvMy/0+NzZI1BAlah3DShh1yrrdzHu1Vq5w7ahO
	iG0lk17eFEPFY2Uxyg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224s-0000000GcvR-0ylA;
	Thu, 03 Sep 2026 07:41:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224i-0000000GciD-3jT5;
	Thu, 03 Sep 2026 07:41:36 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ViTmWloD5J2eKVReHF1z7HtFirOwWOw1jQ1azvN/uQ=;
	b=qygBbDf/i/ChTAwdDHX/OMkpJmg3bx6WNehWxnz/a/QG/CS7FCGINzvET8JahA42fqomF9
	0tA/fgeQbgmMTbTiQjN7PdJlMV7Y11X8gID4ivpxX9BwP+ezfa5IJUGKanG/XPsFRFZvzW
	+w91JMBD2jwTIuY19qA66NaWObSbeT+v9qSA/aXqJ/r7GLtPWY+L4rF0kBBhrcq0sS9IS1
	YH38iFpVF78cVoohANLZiDMxyNqiEUlth5rF658DWk6HyldpYOdOSloQqohF0RloLbf5f+
	O1QY45sabtAAMz5DyzbmCTCGTzJvoZxmpqGlyZ73gD3OpdV5mqJKFQtQUXHgsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ViTmWloD5J2eKVReHF1z7HtFirOwWOw1jQ1azvN/uQ=;
	b=99/QUoc8tSeZF+1c6hGSR5xjtwKPDTxKJiyjGqHWes2RoXstjBOuax6m03o+e/SbOdYvh9
	hLslsBJWfKFMgqDg==
Date: Thu, 03 Sep 2026 09:41:19 +0200
Subject: [PATCH v2 04/15] ARM: drop custom asm/auxvec.h
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-4-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=523;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4mJFyYPX7/9EiMcEouBDn+ZTTOxkaHBJ3RQn0m6AUq0=;
 b=sVImdxunzIXRXXF2KzwDmKwk5x92lBY65ndCWzK3uf7dXH1bpo1cEYC44cBh8xKpT1XJtE/ZI
 nX8kEx7kkkRCESasFd8Wvn+OVgSU5t7OhvXleYrjtpeuaW16BitTJtC
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004133_062946_EEFD258E 
X-CRM114-Status: UNSURE (   6.62  )
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
aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29v
ayA8a2Vlc0BrZXJuZWwub3JnPgotLS0KIGFyY2gvYXJtL2luY2x1ZGUvYXNtL2F1eHZlYy5oIHwg
MSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vYXV4dmVjLmgKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGZiZDM4OGM0NjI5OS4uMDAwMDAwMDAwMDAwCi0t
LSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2F1eHZlYy5oCisrKyAvZGV2L251bGwKQEAgLTEgKzAs
MCBAQAotI2luY2x1ZGUgPHVhcGkvYXNtL2F1eHZlYy5oPgoKLS0gCjIuNTUuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
