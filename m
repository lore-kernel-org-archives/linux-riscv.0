Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D9CE9B375
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYotQXYrYOpOUa237OspAt8X50c3cm/tSJGyl1RhIa8=; b=plkTh6KTgrnC1r
	KIzC9daRPG9rMab1xE/CAuSpXeNH4G4HMGZsBHHzpWazUKPythRXQQQmjpiEIldgglnNcQkrSab8M
	wD7BVW7NrFooDEC915HIzK84mcLjroy4Mgcl0bC1qBsRzfZu6sWPXFUSL/he4Q48f1czpBN3dyXCW
	yosukgAD49idHpZ05Cc5f++m9Qvyg4xE6ugPsX0LJRTUH2bFC/he38WVJxgChoeRZnLrwmPzBenWz
	RIFKex4GPKTmNzwLsn/06YNv/YkI2Q+Htjhh6T0rdHtY/q0it/aF48R1IMV34MjOofhz88y6laE47
	wYvkl9vx23nsgfdpymwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Li-0000000CwO6-1bL1;
	Mon, 02 Mar 2026 12:26:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LQ-0000000CvrU-0xUX;
	Mon, 02 Mar 2026 12:25:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJXnjzhafvwvwcLJeLx/JDThum82eNRZ+z9+q40EfBA=;
	b=zCoq9RLGS8+8Po3hHcth4EHhs3ixn4AZwUIPixmCjgLS1Hf03Lgv9rf45OpQ6lXKNYcXmO
	x0ZUWl6+/PgitXxeWXIAzELn5d1DXLXNveRN9V3nF0ozyW2UUehdzvPfjGObc1KJJdDrL4
	nptOdJbV7CxiN74qy7BRfU4PGFVQaeTGo+XxFJnmWo0PTJnjnUg5HmCvvm22q9qyxQgeJ7
	X5BS/l8Yhy3jYQfDTK8hyatzbIIv6JfQsxytr6PIJESv6V9EwDsSq/G6tuk7rOU8/WH9fV
	LGEhauN3fOdaJMmrQI1L3e6wvuXkuiFz2uTYTcldWK1Zipo7oGvhkQShz2ob/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJXnjzhafvwvwcLJeLx/JDThum82eNRZ+z9+q40EfBA=;
	b=jvOwc5/7jBII+uejUvR7Ec31ujH98q8FcAeuuCJ+X8H4M7QnsAQzjQ0jhftKvsfJJyxGq/
	KBFXdSVINJ5ZpaAg==
Date: Mon, 02 Mar 2026 13:25:34 +0100
Subject: [PATCH 10/15] powerpc: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-10-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1572;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KhAA9NBJJtHIM22o0JEE0DI+I7SP3GR1+cUX6gC6bWM=;
 b=1xI34QvitdF0I83i8CIUtWdYTc0yBgqiKjqBALtMj6mhthZIMQsEaK/I9frbiDgrwa8Dyn2kR
 BAhEAkxtO/bDDzmtnODmzu2v6S9A4iYl4oRMI1eIsDxYQs6Kx5lcAWN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042553_023141_74F0D495 
X-CRM114-Status: GOOD (  11.16  )
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
b25peC5kZT4KLS0tCiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICB8IDcg
KysrKysrKwogYXJjaC9wb3dlcnBjL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggfCA2ICsrLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2F1eHZlYy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uZDZjMTgwZTlhYzJjCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2F1eHZlYy5oCkBAIC0wLDAgKzEsNyBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAgKi8KKyNpZm5kZWYgX0FTTV9QT1dFUlBDX0FVWFZFQ19ICisjZGVmaW5lIF9B
U01fUE9XRVJQQ19BVVhWRUNfSAorCisjZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gJMTUgLyog
ZW50cmllcyBpbiBBUkNIX0RMSU5GTyAqLworCisjZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvdWFw
aS9hc20vYXV4dmVjLmgKaW5kZXggYWE3YzE2MjE1NDUzLi45YWI1YjZkMTc5MjkgMTAwNjQ0Ci0t
LSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCisrKyBiL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCkBAIC0xLDYgKzEsNiBAQAogLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgV0lUSCBMaW51eC1zeXNjYWxsLW5vdGUgKi8KLSNp
Zm5kZWYgX0FTTV9QT1dFUlBDX0FVWFZFQ19ICi0jZGVmaW5lIF9BU01fUE9XRVJQQ19BVVhWRUNf
SAorI2lmbmRlZiBfVUFQSV9BU01fUE9XRVJQQ19BVVhWRUNfSAorI2RlZmluZSBfVUFQSV9BU01f
UE9XRVJQQ19BVVhWRUNfSAogCiAvKgogICogV2UgbmVlZCB0byBwdXQgaW4gc29tZSBleHRyYSBh
dXggdGFibGUgZW50cmllcyB0byB0ZWxsIGdsaWJjIHdoYXQKQEAgLTUwLDYgKzUwLDQgQEAKIAog
I2RlZmluZSBBVF9NSU5TSUdTVEtTWgkJNTEgICAgICAvKiBzdGFjayBuZWVkZWQgZm9yIHNpZ25h
bCBkZWxpdmVyeSAqLwogCi0jZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gJMTUgLyogZW50cmll
cyBpbiBBUkNIX0RMSU5GTyAqLwotCiAjZW5kaWYKCi0tIAoyLjUzLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
