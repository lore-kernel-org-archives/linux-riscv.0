Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57266C79FAD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wp61z8/2PuwF5cqKb8d0lNC/+wbDBOfheKzGdH1I8eE=; b=Wj3yyG0sdqfoig
	AHTR7sFnTvOVKqOz+f4DKHZz2xk2WKl8HnxWWq8NS4UnwN4PQqOTN65c6xHpYGNDO++yAQ/pX6zLF
	yNyw/XOrw6WaHdzanE9KsmoCJ08s+LLT1xPz2puHCgaLea603ObHUaZ/YUgVEaSG5UlCkg4oupxJB
	fpEhY87G5ZnaRJH/ozDyVFiz4Js6HGu2xTPwiaNCWGHVxgQoaWnLlathNfj5ZZpKN3gU1tLEfDIZ7
	4EEQvLjPRHsi6HdH4XBw394yQ+O8CoC7fa4f+E+Fp6vuY9V5vD4Fy6rS9UBiexald12R7O9d7uit9
	+m0r1hOlKr1bLuz0Y3+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E28-0000000BAoh-2TVc;
	Wed, 09 Sep 2026 08:51:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1k-0000000BAEc-1642;
	Wed, 09 Sep 2026 08:51:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2FjQtlKuBRuzu4eO4IKv/TzmPoMG616xBuEpp/c8bc=;
	b=n2EgP00AGy2SQ4LhsPxtPFcrw12hi7WXrNw754S6JRZX1HFzsFe/pseBtP/fjyxUDKlDOn
	/Fr8WjmdlV9A0IGs3lUqPsFYY90n0IUQO5Hj6p21mT64kGEeGvGWuuTZPU5n496dF5M7Ms
	bcj2yDheQqOg+7JhGM0FJ/PojVqBQlQW3GT/MdnO6PBZU8yiPKLKbUCbTSyjQaawwkWvOc
	ntK+a7n4xZNVoAH7QQ2Ttqq2cchue1vDh0sAmhWeszDfCSPhAGfnZTc/nOs1yEvWMAnfNq
	/wvAMUyqxwWoNSKxuUocyo7gSfJX3HzwHWhwoB/5kRRfZSdUz+uRcSaJSayGqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2FjQtlKuBRuzu4eO4IKv/TzmPoMG616xBuEpp/c8bc=;
	b=xg6fz2OaJ/Xk4FVyNOThVXZ9GzDXOqKv0ZM2svim1anJaDd8tHxGt6Dcu201EiLHS+ELJL
	/Qm97XTr0L3JARCQ==
Date: Wed, 09 Sep 2026 10:51:28 +0200
Subject: [PATCH 15/15] vdso: Remove __ASSEMBLER__ guards from vsyscall.h
MIME-Version: 1.0
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-15-63ae856cc659@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1972;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=C6Fh+EQTCyl+s4g26T56GGCWX2U0MtHr/51cTDgzY94=;
 b=/pF3AoTQzmD4pEP7pZqPjpk1T5eSdh8cNjifxUmXeKgAF4pL9mdehQYC/Qro0bgZ/bG3BCQbX
 AwbkyNhcCofDs37bRkBnMPJkPmAKCpz/Hs/RJAXHs0uvQGQmO5ufIiW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015132_477531_0648843D 
X-CRM114-Status: UNSURE (   7.07  )
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

VGhlc2UgaGVhZGVycyBhcmUgb25seSB1c2VkIGZyb20gcmVndWxhciBDIGNvZGUuCgpSZW1vdmUg
dGhlIHVubmVjZXNzYXJ5IGd1YXJkcy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVo
IDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvYXJtL2luY2x1ZGUv
YXNtL3Zkc28vdnN5c2NhbGwuaCAgIHwgNCAtLS0tCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Zk
c28vdnN5c2NhbGwuaCB8IDQgLS0tLQogaW5jbHVkZS92ZHNvL3ZzeXNjYWxsLmggICAgICAgICAg
ICAgICAgfCA0IC0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oIGIvYXJjaC9hcm0vaW5j
bHVkZS9hc20vdmRzby92c3lzY2FsbC5oCmluZGV4IDE0ZjJlYTlkODY0MC4uYjk3ZGRhMTAwZTUy
IDEwMDY0NAotLS0gYS9hcmNoL2FybS9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKKysrIGIv
YXJjaC9hcm0vaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oCkBAIC0yLDggKzIsNiBAQAogI2lm
bmRlZiBfX0FTTV9WRFNPX1ZTWVNDQUxMX0gKICNkZWZpbmUgX19BU01fVkRTT19WU1lTQ0FMTF9I
CiAKLSNpZm5kZWYgX19BU1NFTUJMWV9fCi0KICNpbmNsdWRlIDx2ZHNvL2RhdGFwYWdlLmg+CiAj
aW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KIApAQCAtMTQsNiArMTIsNCBAQCB2b2lkIF9fYXJj
aF9zeW5jX3Zkc29fdGltZV9kYXRhKHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSAqdmRhdGEpCiB9CiAj
ZGVmaW5lIF9fYXJjaF9zeW5jX3Zkc29fdGltZV9kYXRhIF9fYXJjaF9zeW5jX3Zkc29fdGltZV9k
YXRhCiAKLSNlbmRpZiAvKiAhX19BU1NFTUJMWV9fICovCi0KICNlbmRpZiAvKiBfX0FTTV9WRFNP
X1ZTWVNDQUxMX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby92
c3lzY2FsbC5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKaW5kZXgg
N2Q5ZDZiZGQ1OGIyLi43YzQ2YzM3ZmQzNmYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVk
ZS9hc20vdmRzby92c3lzY2FsbC5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby92
c3lzY2FsbC5oCkBAIC0yLDggKzIsNiBAQAogI2lmbmRlZiBfX0FTTV9WRFNPX1ZTWVNDQUxMX0gK
ICNkZWZpbmUgX19BU01fVkRTT19WU1lTQ0FMTF9ICiAKLSNpZm5kZWYgX19BU1NFTUJMRVJfXwot
CiAjaW5jbHVkZSA8dmRzby9kYXRhcGFnZS5oPgogCiAjZGVmaW5lIFZEU09fUFJFQ0lTSU9OX01B
U0sJfigweEZGMDBVTEw8PDQ4KQpAQCAtMTksNiArMTcsNCBAQCB2b2lkIF9fYXJjaF91cGRhdGVf
dmRzb19jbG9jayhzdHJ1Y3QgdmRzb19jbG9jayAqdmMpCiB9CiAjZGVmaW5lIF9fYXJjaF91cGRh
dGVfdmRzb19jbG9jayBfX2FyY2hfdXBkYXRlX3Zkc29fY2xvY2sKIAotI2VuZGlmIC8qICFfX0FT
U0VNQkxFUl9fICovCi0KICNlbmRpZiAvKiBfX0FTTV9WRFNPX1ZTWVNDQUxMX0ggKi8KZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdmRzby92c3lzY2FsbC5oIGIvaW5jbHVkZS92ZHNvL3ZzeXNjYWxsLmgK
aW5kZXggMjlkZDRlMDk3MjIwLi5hZjYyYmJmMDRlYWMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdmRz
by92c3lzY2FsbC5oCisrKyBiL2luY2x1ZGUvdmRzby92c3lzY2FsbC5oCkBAIC0yLDEwICsyLDYg
QEAKICNpZm5kZWYgX19WRFNPX1ZTWVNDQUxMX0gKICNkZWZpbmUgX19WRFNPX1ZTWVNDQUxMX0gK
IAotI2lmbmRlZiBfX0FTU0VNQkxFUl9fCi0KICNpbmNsdWRlIDxhc20vdmRzby92c3lzY2FsbC5o
PgogCi0jZW5kaWYgLyogIV9fQVNTRU1CTEVSX18gKi8KLQogI2VuZGlmIC8qIF9fVkRTT19WU1lT
Q0FMTF9IICovCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
