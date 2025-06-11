Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8DAC7113C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fI2tbifB2J+y+fwARCejbbzwKbTLke1+XuuJoQi/wj4=; b=JZSoOkboP+UAEn
	D/qlIzJg+ATlqii1Nz1qUvGSqtLuUjt7sw2pTC3hqG6pT3Kgfk7gNI+pcDDzGz2nrKmwiqs8WjYhF
	NX4wMV2FG6c+E/70nnClel8kS1bQiC/eVUZGxTD4tHQrHln4auuBg/rd44OcnVBwiCRjX3/on6q4p
	eGWK5uDmQ0ZF9n8JjbXY4UVcXgtYPAJDOz9ZtA1Diwlz8pgI65UhE32If/7zuPImeF40kj2pQzD6X
	9DuqGirhKVGGaI0CCuA+Ky+w9bHAux7Gww27WoFTPys7C4TGQUOK/3QR02GcwsYU+HOk4TjXzHI/s
	zVuIalkw0/iRz+st6pdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQ8-00000009BhC-1E1T;
	Wed, 11 Jun 2025 08:02:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2p-000000097qF-2oQN
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jf+qTdJjsAtA+bB5leI4PJTuwlXOlpIX5ZJo2P0ZrRA=;
	b=rtyzkTdI4GnKlQy8FN0jWBCti8GM9cjAY4EaL0AVuEJ93q4rewugfqVCWCxMA13xPwVpnb
	Jv7Uas8YsyShnN6b1dugWzdwFWu6vjUMehLDoNRgBz9/vI+JyHvfNuI0gjLWO6OFxGmbBw
	/H4zgXqAgVwwHbpJWgCgWiQcgOw+KJUeIWr5+2lpjvW6SU2NEZek3Eno1Ww6oOdAE0toGO
	COQb7uoVM5cnifhwLsEnl9P/Ymkv7HkV4C6te8Nblte9PyD4NZNpIUzoBB4Ht55oZGezeE
	zo4QMc4P24bWpBZ0/9r1T3Xtelh+N1WUwvIOxBea0YW1CQdPbyUwflgN7DIXGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jf+qTdJjsAtA+bB5leI4PJTuwlXOlpIX5ZJo2P0ZrRA=;
	b=oZ2SorEmLMjdu7q+yki1JdD+B3tmZrXFV36vdUQFb7NaR26cMuYlhNKzBL3fO+wGYmAdnP
	bBc4CPNEeC8dBtBg==
Date: Wed, 11 Jun 2025 09:38:17 +0200
Subject: [PATCH v3 11/16] kunit: Always descend into kunit directory during
 build
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-11-55e3d148cbc6@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=1555;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hoA7a97F0nHmzoK4uqkonciDyfelXXtJw3EAVaFoPK4=;
 b=7XCG/h4e3mcUAjfa8Aj+npyCUw3MngEOW9PZ10TGYegk+rYvn7jRHXImmwGjIDh8ysh0FSRVG
 BGs07a1PUmiDcgBOvjkKKcDKLVtVaI6WGVnyGxP8YNWPsVPqhYjU4ID
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_003847_852701_DDA5937C 
X-CRM114-Status: UNSURE (   9.38  )
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

QW4gdXBjb21pbmcgY2hhbmdlIHdpbGwgYWRkICd1c2VycHJvZ3MnIHRvIHRoZSBrdW5pdCBzdWJk
aXJlY3RvcnkuCkZvciBrYnVpbGQgdG8gcHJvcGVybHkgY2xlYW4gdXAgdGhlc2UgYnVpbGQgYXJ0
aWZhY3RzIHRoZSBzdWJkaXJlY3RvcnkKbmVlZHMgdG8gYmUgYWx3YXlzIHByb2Nlc3NlZC4KClB1
c2hpbmcgdGhlIHNwZWNpYWwgbG9naWMgZm9yIGhvb2subyBpbnRvIHRoZSBrdW5pdCBNYWtlZmls
ZSBhbHNvIG1ha2VzIHRoZQpsb2dpYyBlYXNpZXIgdG8gdW5kZXJzdGFuZC4KClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgot
LS0KIGxpYi9NYWtlZmlsZSAgICAgICB8IDQgLS0tLQogbGliL2t1bml0L01ha2VmaWxlIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9saWIvTWFrZWZpbGUgYi9saWIvTWFrZWZpbGUKaW5kZXggYzM4NTgyZjE4N2RkODE5
MTYxMTMzMTkwNzJlNWNmZWYyNmYyNmM4NC4uNjk4NTY2MTM1MDkxY2MzYmYwMDU0ZjE5NTRiNDM0
ZGMzMzI1MzY0YSAxMDA2NDQKLS0tIGEvbGliL01ha2VmaWxlCisrKyBiL2xpYi9NYWtlZmlsZQpA
QCAtMTA4LDExICsxMDgsNyBAQCB0ZXN0X2ZwdS15IDo9IHRlc3RfZnB1X2dsdWUubyB0ZXN0X2Zw
dV9pbXBsLm8KIENGTEFHU190ZXN0X2ZwdV9pbXBsLm8gKz0gJChDQ19GTEFHU19GUFUpCiBDRkxB
R1NfUkVNT1ZFX3Rlc3RfZnB1X2ltcGwubyArPSAkKENDX0ZMQUdTX05PX0ZQVSkKIAotIyBTb21l
IEtVbml0IGZpbGVzIChob29rcy5vKSBuZWVkIHRvIGJlIGJ1aWx0LWluIGV2ZW4gd2hlbiBLVW5p
dCBpcyBhIG1vZHVsZSwKLSMgc28gd2UgY2FuJ3QganVzdCB1c2Ugb2JqLSQoQ09ORklHX0tVTklU
KS4KLWlmZGVmIENPTkZJR19LVU5JVAogb2JqLXkgKz0ga3VuaXQvCi1lbmRpZgogCiBpZmVxICgk
KENPTkZJR19ERUJVR19LT0JKRUNUKSx5KQogQ0ZMQUdTX2tvYmplY3QubyArPSAtRERFQlVHCmRp
ZmYgLS1naXQgYS9saWIva3VuaXQvTWFrZWZpbGUgYi9saWIva3VuaXQvTWFrZWZpbGUKaW5kZXgg
NWFhNTE5NzhlNDU2YWIzYmI2MGMxMjA3MWEyNmNmMmJkY2IxYjUwOC4uNjU2ZjFmYTM1YWJjYzYz
NWU2N2Q1YjRjYjFiYzU4NmI0ODQxNWFjNSAxMDA2NDQKLS0tIGEvbGliL2t1bml0L01ha2VmaWxl
CisrKyBiL2xpYi9rdW5pdC9NYWtlZmlsZQpAQCAtMTcsNyArMTcsNyBAQCBrdW5pdC1vYmpzICs9
CQkJCWRlYnVnZnMubwogZW5kaWYKIAogIyBLVW5pdCAnaG9va3MnIGFyZSBidWlsdC1pbiBldmVu
IHdoZW4gS1VuaXQgaXMgYnVpbHQgYXMgYSBtb2R1bGUuCi1vYmoteSArPQkJCQlob29rcy5vCitv
YmotJChpZiAkKENPTkZJR19LVU5JVCkseSkgKz0JCWhvb2tzLm8KIAogb2JqLSQoQ09ORklHX0tV
TklUX1RFU1QpICs9CQlrdW5pdC10ZXN0Lm8KIG9iai0kKENPTkZJR19LVU5JVF9URVNUKSArPQkJ
cGxhdGZvcm0tdGVzdC5vCgotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
