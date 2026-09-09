Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6331BC79FB8
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNX0RZxNpeWYUdQpQhs0jv3YZPi5GHw02d4m8Z1c8og=; b=NtRXKfrGb6RX5s
	Ztnwtxzd9yn6YX1apNjTBh6/Q48B8B8Ra4JHVYyYV4WHE9vDyly++6a8Dthb/H0jzSomHpM8SmdXp
	uo3mp43sYawAaYYljSeXldVyifKOJtwjkUzJyp5LTVi0KbsHKjY6YTmZ+LNrfMdwRfW1ibuWepoUk
	56DbW77/YIjGAmEcF+QRBEhLoBkV3BPgwUg7ap3yD/Vq6tXjDTYiKt5Mb04S/7XU89KcLEePIQZ4+
	PUgkDaH+EwzkByRJfqDs3cZ5aKoP23jarRMil3Vd2TMqo7xFHh3wklt36W9FTa0bWZEcymYhiyfcj
	8y9LvIxoFO4WZ+SpEpwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1y-0000000BAS3-0me4;
	Wed, 09 Sep 2026 08:51:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1e-0000000BAAd-38Cb;
	Wed, 09 Sep 2026 08:51:29 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csWZa+FXPkZtKlamZnzOe5wDFOkHxV9+VSViUYlt1Zs=;
	b=zLyb9Fwu7jbI0CwCPLxrGbMAjONAtXhsvd2aOXrsZeTIM+Vd6cAkXeT/9cSCtBgc6rUvND
	gGL505R+4si2jE3aeqnbSbLIG8k98l5iRxrDYXFAKQOWMVSkZxKFlP21c6TSMA2i/iy116
	/ylwRK8HcPiR9PgT8J7h2y8C76UQ6h/hhfKtVfvGj6xJZzmOon5VHgnFpIj7kux2X934+R
	88gvKVckykd4QMY7I4EvAl22PfX5GKMA8NcVnV99WfoKqT9h3DM3L6nfOz4IF1LXAzPclD
	t74OiDujJWbszZsh0qrw62upWw14+r6iyZ4jcroh7b+1fqc9tncGYHc7XAbHiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csWZa+FXPkZtKlamZnzOe5wDFOkHxV9+VSViUYlt1Zs=;
	b=N/A0UM8L3DUA6/r4Ux30sANcZeIqXCYs4ZXEjCKOONRgT4pANRJ15Uu4BotsUrawfjPr6e
	4wH9FEacXhaQoNBg==
Date: Wed, 09 Sep 2026 10:51:16 +0200
Subject: [PATCH 03/15] vdso/getrandom: Define fallback
 __arch_get_vdso_u_rng_data() in getrandom.c
MIME-Version: 1.0
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-3-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1595;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Inx1GMMAL9hTofIIG5CeNr2zKHZu0vdSWjUErNB5P+Q=;
 b=S5UXcl0xftPFhFxyzIYGTlv2hiN5xVRt8TcojCGkIIJlfpcJoQYHo8t1Vw1w+qVFkJDkfU+DX
 KiIc9K+4lvbCboRLbKhU8xLm4rTxtAlsgsM1YN6LzOWh2SHeS6QsfsX
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015126_953957_EB55A35E 
X-CRM114-Status: UNSURE (   6.33  )
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

X19hcmNoX2dldF92ZHNvX3Vfcm5nX2RhdGEoKSBpcyBvbmx5IHVzZWQgaW4gZ2V0cmFuZG9tLmMu
IHZzeXNjYWxsLmgKaGFzIGJlY29tZSBhIGR1bXBpbmcgZ3JvdW5kIGZvciBkaWZmZXJlbnQga2lu
ZHMgb2YgZmFsbGJhY2tzLgoKTW92ZSB0aGUgZmFsbGJhY2sgZnVuY3Rpb24gZGVmaW5pdGlvbiBp
bnRvIGdldHJhbmRvbS5jLApzaW1pbGFyIHRvIG90aGVyIGZhbGxiYWNrcy4KClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgot
LS0KIGluY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby92c3lzY2FsbC5oIHwgNyAtLS0tLS0tCiBsaWIv
dmRzby9nZXRyYW5kb20uYyAgICAgICAgICAgICAgICB8IDcgKysrKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9hc20tZ2VuZXJpYy92ZHNvL3ZzeXNjYWxsLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3Zkc28v
dnN5c2NhbGwuaAppbmRleCBmZTEyZmIxZmI0NDIuLmNkZjdiMzljZDM0OSAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNvL3ZzeXNjYWxsLmgKKysrIGIvaW5jbHVkZS9hc20tZ2Vu
ZXJpYy92ZHNvL3ZzeXNjYWxsLmgKQEAgLTQsMTMgKzQsNiBAQAogCiAjaWZuZGVmIF9fQVNTRU1C
TEVSX18KIAotI2lmbmRlZiBfX2FyY2hfZ2V0X3Zkc29fdV9ybmdfZGF0YQotc3RhdGljIF9fYWx3
YXlzX2lubGluZSBjb25zdCBzdHJ1Y3QgdmRzb19ybmdfZGF0YSAqX19hcmNoX2dldF92ZHNvX3Vf
cm5nX2RhdGEodm9pZCkKLXsKLQlyZXR1cm4gJnZkc29fdV9ybmdfZGF0YTsKLX0KLSNlbmRpZgot
CiAjaWZuZGVmIF9fYXJjaF91cGRhdGVfdmRzb19jbG9jawogc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSB2b2lkIF9fYXJjaF91cGRhdGVfdmRzb19jbG9jayhzdHJ1Y3QgdmRzb19jbG9jayAqdmMpCiB7
CmRpZmYgLS1naXQgYS9saWIvdmRzby9nZXRyYW5kb20uYyBiL2xpYi92ZHNvL2dldHJhbmRvbS5j
CmluZGV4IDI4NTFhZmE5MTU0Zi4uNmZmNDY1NDkyODFjIDEwMDY0NAotLS0gYS9saWIvdmRzby9n
ZXRyYW5kb20uYworKysgYi9saWIvdmRzby9nZXRyYW5kb20uYwpAQCAtMTksNiArMTksMTMgQEAK
IC8qIEJyaW5nIGluIGRlZmF1bHQgYWNjZXNzb3JzICovCiAjaW5jbHVkZSA8dmRzby92c3lzY2Fs
bC5oPgogCisjaWZuZGVmIF9fYXJjaF9nZXRfdmRzb191X3JuZ19kYXRhCitzdGF0aWMgX19hbHdh
eXNfaW5saW5lIGNvbnN0IHN0cnVjdCB2ZHNvX3JuZ19kYXRhICpfX2FyY2hfZ2V0X3Zkc29fdV9y
bmdfZGF0YSh2b2lkKQoreworCXJldHVybiAmdmRzb191X3JuZ19kYXRhOworfQorI2VuZGlmCisK
ICNkZWZpbmUgTUVNQ1BZX0FORF9aRVJPX1NSQyh0eXBlLCBkc3QsIHNyYywgbGVuKSBkbyB7CQkJ
CVwKIAl3aGlsZSAobGVuID49IHNpemVvZih0eXBlKSkgewkJCQkJCVwKIAkJX19wdXRfdW5hbGln
bmVkX3QodHlwZSwgX19nZXRfdW5hbGlnbmVkX3QodHlwZSwgc3JjKSwgZHN0KTsJXAoKLS0gCjIu
NTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
