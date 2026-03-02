Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AEAE9B36D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=reVDdc/FKlaAbhRagFkIjw8gwArvIz9z9AS6kQG6v10=; b=xugpi9aK2F2QjK
	8VMUW4iCyLabcaO4pUbhdjwqv1ywQVz3ixp/TbgiDma+5dD7/ICVvsGqXwGnS5G1i5KMKYroawwiE
	phhd9GFgOf0qygEudaIpEvQO84ctLE7xKrx2P3fLoIbOirkVcOgcRWyD1+1mEqkp/miEwKaE++uMn
	K7KXruIfkzgEjNZDLUPf1Smj1X4237QVsh8ImNX+Gi60Nx7DbkG9s8PspjJxUNBuy7uvhh0sPu68J
	TUwhY716QR64KfMsSNYqKi0PAS9F+QQxqxQ3N7MOXgQpby3LhXIOSoti39LVvH5lMeQZFTj1KWjV2
	/UjNZtL4qGVDUOdlG+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Ln-0000000CwYY-1w5v;
	Mon, 02 Mar 2026 12:26:15 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LR-0000000Cvtg-42e7;
	Mon, 02 Mar 2026 12:25:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IuCsvm2cGfELoFVj6dzhBy1SObe9G7IuVP1EF/2gXo=;
	b=da6EZmSfUm9111bFjIM3F+dNlZNGWPW1eN0BtOHAmyUkek/S4ApnyYsLAvQDTs3BfD8bNR
	olHyAq4d14aPCG7ZVsMhzqZcxVZhq3SlX2/LZCZ6bRx/FXwxP01+/B9YgUVTVhxcjQD3Xe
	2QVGzitWwT+eK+uYSrOBd3wPjWBv6oX0WxUiljKTgs5w4p1AATrCcykQEjpm7Wckv9EzS4
	R+prsnzd1PNt3Wn0W+ZeBl5H6RAhXbXQNmrGKr9HD5az0J/a+4xWjV23G7X5AoolJFcj9Z
	JCL0A7KseyQ+esU0vtZv29qwN6j6gzV74ezeGydEcvB+RCAX1FY+gd/IX8cYpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IuCsvm2cGfELoFVj6dzhBy1SObe9G7IuVP1EF/2gXo=;
	b=l0hZVyeqGYmKCh8kKgBW2VcGXwDLfx5b9Gdrnegn+TBMrdFjh/F3qGt4TKfpLXDUNM+pxG
	6dNRMGZ/nruazVAg==
Date: Mon, 02 Mar 2026 13:25:37 +0100
Subject: [PATCH 13/15] sh: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-13-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1566;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=H/m8MEbscz6WrH/+FAiysHkWJ0RcGdw589TTpDmII/4=;
 b=70FaFWSkNZh4Bigz/FCzkj6Q189+PNtssX+j5xte676xMOG9LLtUgl7gGtydm5ZgSwLz8qm7a
 m8JP07HyaioCw989TZl/9nlUAJ4kPMiJ3LDiNOJB7E4QpPK9Lg7q5Qc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042554_171034_6B4A7CCE 
X-CRM114-Status: GOOD (  11.22  )
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

VGhlcmUgaXMgbm90aGluZyB1c2Vyc3BhY2UgY2FuIGRvIHdpdGggdGhpcyB2YWx1ZS4gSW4gdGhl
IGtlcm5lbCBpcwphbHdheXMgY29tYmluZWQgd2l0aCBBVF9WRUNUT1JfU0laRV9CQVNFLCB3aGlj
aCBpcyBub3QgZXhwb3NlZCB0bwp1c2Vyc3BhY2UgYW5kIGFsc28gY2hhbmdlcyBmcm9tIHRpbWUg
dG8gdGltZS4KCk1vdmUgdGhlIHN5bWJvbCB0byBhIGtlcm5lbC1pbnRlcm5hbCBoZWFkZXIuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRy
b25peC5kZT4KLS0tCiBhcmNoL3NoL2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCA3ICsrKysr
KysKIGFyY2gvc2gvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCB8IDggKysrLS0tLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL3NoL2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC9zaC9pbmNsdWRlL2FzbS9hdXh2
ZWMuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmYwODMwODA4ZWIx
OQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvc2gvaW5jbHVkZS9hc20vYXV4dmVjLmgKQEAgLTAs
MCArMSw3IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworI2lmbmRl
ZiBfX0FTTV9TSF9BVVhWRUNfSAorI2RlZmluZSBfX0FTTV9TSF9BVVhWRUNfSAorCisjZGVmaW5l
IEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggNSAvKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZPICovCisKKyNl
bmRpZiAvKiBfX0FTTV9TSF9BVVhWRUNfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9pbmNsdWRl
L3VhcGkvYXNtL2F1eHZlYy5oIGIvYXJjaC9zaC9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCmlu
ZGV4IDhlYjQ3ZWRlNzE5My4uMWIwN2M0YmZlMTYwIDEwMDY0NAotLS0gYS9hcmNoL3NoL2luY2x1
ZGUvdWFwaS9hc20vYXV4dmVjLmgKKysrIGIvYXJjaC9zaC9pbmNsdWRlL3VhcGkvYXNtL2F1eHZl
Yy5oCkBAIC0xLDYgKzEsNiBAQAogLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
V0lUSCBMaW51eC1zeXNjYWxsLW5vdGUgKi8KLSNpZm5kZWYgX19BU01fU0hfQVVYVkVDX0gKLSNk
ZWZpbmUgX19BU01fU0hfQVVYVkVDX0gKKyNpZm5kZWYgX19VQVBJX0FTTV9TSF9BVVhWRUNfSAor
I2RlZmluZSBfX1VBUElfQVNNX1NIX0FVWFZFQ19ICiAKIC8qCiAgKiBBcmNoaXRlY3R1cmUtbmV1
dHJhbCBBVF8gdmFsdWVzIGluIDAtMTcsIGxlYXZlIHNvbWUgcm9vbQpAQCAtMzQsNiArMzQsNCBA
QAogI2RlZmluZSBBVF9MMURfQ0FDSEVTSEFQRQkzNQogI2RlZmluZSBBVF9MMl9DQUNIRVNIQVBF
CTM2CiAKLSNkZWZpbmUgQVRfVkVDVE9SX1NJWkVfQVJDSCA1IC8qIGVudHJpZXMgaW4gQVJDSF9E
TElORk8gKi8KLQotI2VuZGlmIC8qIF9fQVNNX1NIX0FVWFZFQ19IICovCisjZW5kaWYgLyogX19V
QVBJX0FTTV9TSF9BVVhWRUNfSCAqLwoKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
