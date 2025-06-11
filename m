Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4A0C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ap168iMuIn1uSfnHyOvP9gY+MWNHhI3Bn2RX3vPGW/k=; b=ZWuVXKLUWDhx/N
	rXWxnyYhzCBLJ13taN3Eu1XKxu0wt4e0ez/zp2BlmP6sNCooFHOR21UZQIwYYsd4mrEYNtmQNO5TU
	3I/35xpWzsiBBRliUer0pAZ/az4dH8MPufmPA/6Ku0fLWU2FKbTD8XQRs12rRzNKOkL37oNc623hM
	u4dDFaLzneHpRNEYewZDgl4JplcY8GbU3Yi+ndvkctlBEBJ2+KfXx+qwY1AfHxAOJAwku+YTjs5hX
	hkTZqd+WW8HDD1PVKYfiMjLzdo8Fy9pnVQfz92x6q9mUgvkHZyhuYMJhsbzhSFvmUJFGsnVorXWpt
	qjbRKRwGyshv+5pxkQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQ6-00000009Bfo-426S;
	Wed, 11 Jun 2025 08:02:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2m-000000097nL-1B12
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:46 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTxmS6W6qZRqdjglNd/91xq5t0Sf7lvKNn22lds3tBg=;
	b=oZwKLG8IUYTuUtRD28FKxeMMdCaTX/U77iFBOswUdySXxbVT0aDEE12rgFAxHJCdJ7Tm2U
	j6NkHDdUdtsgxon12m0mDq8uGHOm6NbZH9Wbi8QU0k7qSuW6trogSG6s6qz86EhOh1od19
	EGXzQh4JsW4Y2bflXKGr3DuGTzNmqMU8nmrZQ4ve6JTaAL5koDWhDLxSwQPz3bSPy63zFR
	MTqLMd0CNemfTcflrIwpcgZj/z0ITqLcGZ4FSTgUhKXBbpB4/m9EQJ+v34ck3A4Bg9hqbq
	x0QK8ENEZh104a9oRpzVdBpWgJKwvbgWBntL+tJDDmxIYSks5Dw6ZfZ9TtiB9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTxmS6W6qZRqdjglNd/91xq5t0Sf7lvKNn22lds3tBg=;
	b=Wu9FsCQIrzyRPV9W4FVqoM9fMCPZfkB3SrqeMepwTJ5K0yPoPDHGsRbu3xfz8QlRFhndmH
	eC2CiW8jpb6AobAw==
Date: Wed, 11 Jun 2025 09:38:22 +0200
Subject: [PATCH v3 16/16] kunit: uapi: Validate usability of /proc
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-16-55e3d148cbc6@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=1609;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=bI9Z3Z4OikY2vHRcbYfX3N2odvEeMwzFe2AM1aXY+bg=;
 b=BvsjK8jQfTlN3RKliodcN6Wpr2QQ8UHWYzK87A9Ed7LZXQp5P1ASKEUXcxymrizK7ceed/oo0
 tW6g6ftHi92ABxOyphlY05wObpqRI2GKkfZjkxgZImTBYuS2FOV2ylS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_003844_461172_CF8EE1F7 
X-CRM114-Status: UNSURE (   8.11  )
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

U2hvdyB0aGF0IHRoZSBzZWxmdGVzdHMgYXJlIGV4ZWN1dGVkIGZyb20gYSBmYWlybHkgIm5vcm1h
bCIKdXNlcnNwYWNlIGNvbnRleHQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBsaWIva3VuaXQva3VuaXQtZXhh
bXBsZS11YXBpLmMgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2xpYi9rdW5pdC9rdW5pdC1leGFtcGxlLXVhcGkuYyBiL2xpYi9rdW5pdC9rdW5pdC1leGFtcGxl
LXVhcGkuYwppbmRleCA0Y2U2NTcwNTBkZDRhNTc2NjMyYTQxY2EwMzA5YzRjYjUxMzRjZTE0Li41
ZTdhMGYzYjY4ZjE4MmM0MmIwM2U2Njc1NjdlNjZmMDJkOGMyYjg2IDEwMDY0NAotLS0gYS9saWIv
a3VuaXQva3VuaXQtZXhhbXBsZS11YXBpLmMKKysrIGIvbGliL2t1bml0L2t1bml0LWV4YW1wbGUt
dWFwaS5jCkBAIC04LDEzICs4LDQ1IEBACiAgKiBUaGlzIGlzICp1c2Vyc3BhY2UqIGNvZGUuCiAg
Ki8KIAorI2luY2x1ZGUgPGZjbnRsLmg+CisjaW5jbHVkZSA8dW5pc3RkLmg+CisjaW5jbHVkZSA8
c3RyaW5nLmg+CisKICNpbmNsdWRlICIuLi8uLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rc2Vs
ZnRlc3QuaCIKIAorc3RhdGljIHZvaWQgdGVzdF9wcm9jZnModm9pZCkKK3sKKwljaGFyIGJ1Zlsy
NTZdOworCXNzaXplX3QgcjsKKwlpbnQgZmQ7CisKKwlmZCA9IG9wZW4oIi9wcm9jL3NlbGYvY29t
bSIsIE9fUkRPTkxZKTsKKwlpZiAoZmQgPT0gLTEpIHsKKwkJa3NmdF90ZXN0X3Jlc3VsdF9mYWls
KCJwcm9jZnM6IG9wZW4oKSBmYWlsZWQ6ICVzXG4iLCBzdHJlcnJvcihlcnJubykpOworCQlyZXR1
cm47CisJfQorCisJciA9IHJlYWQoZmQsIGJ1Ziwgc2l6ZW9mKGJ1ZikpOworCWNsb3NlKGZkKTsK
KworCWlmIChyID09IC0xKSB7CisJCWtzZnRfdGVzdF9yZXN1bHRfZmFpbCgicHJvY2ZzOiByZWFk
KCkgZmFpbGVkOiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKKwkJcmV0dXJuOworCX0KKworCWlm
IChyICE9IDE2IHx8IHN0cm5jbXAoImt1bml0LWV4YW1wbGUtdVxuIiwgYnVmLCAxNikgIT0gMCkg
eworCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoInByb2NmczogaW5jb3JyZWN0IGNvbW1cbiIpOwor
CQlyZXR1cm47CisJfQorCisJa3NmdF90ZXN0X3Jlc3VsdF9wYXNzKCJwcm9jZnNcbiIpOworfQor
CiBpbnQgbWFpbih2b2lkKQogewogCWtzZnRfcHJpbnRfaGVhZGVyKCk7CiAJa3NmdF9zZXRfcGxh
big0KTsKLQlrc2Z0X3Rlc3RfcmVzdWx0X3Bhc3MoInVzZXJzcGFjZSB0ZXN0IDFcbiIpOworCXRl
c3RfcHJvY2ZzKCk7CiAJa3NmdF90ZXN0X3Jlc3VsdF9wYXNzKCJ1c2Vyc3BhY2UgdGVzdCAyXG4i
KTsKIAlrc2Z0X3Rlc3RfcmVzdWx0X3NraXAoInVzZXJzcGFjZSB0ZXN0IDM6IHNvbWUgcmVhc29u
XG4iKTsKIAlrc2Z0X3Rlc3RfcmVzdWx0X3Bhc3MoInVzZXJzcGFjZSB0ZXN0IDRcbiIpOwoKLS0g
CjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
