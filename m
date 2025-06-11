Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6FEC61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WoqKc6rOK7PotEDi5lPKOmXwe//cvObSH0dCCA5kEs4=; b=MSS2vJNZdkYkiL
	tYxRvnoFASqpBe/E3F6+sf8TDlAumeq/Q73eZqUeMFRzR83VOou6j10T2cIPtP7a2JDFb0S9ZHkHq
	BlqrJSMcL9uJbJBWUS1sDtm3/7M/z5flfalTymq0tqs0V9v13BObK2sY/JoxZ13gkfR/1D4nRdku1
	xvPCUN8NcYqAUMm0MA3VuLaWebmYJZQ4WcF3ApW786LojsQR5NAh7fGDWReEkphYpDCXrhcAHnJfr
	fa5YQVlJWuXwxEjTj/vVfIgtWGZZ/zN9uK02/nLa48GPNBLlcTh+G2+gbWRsharphUxYxfM8nJv17
	sUc8L2pk+zG1OT0dQg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQD-00000009BlL-30eJ;
	Wed, 11 Jun 2025 08:02:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2u-000000097tN-1lu5
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Jdu/Go4SV5qRaqiaKhllMqx5OXzM41p0GtpXKOIUrDI=; b=HDZwEm+2jKcoVuRp3QYJ32xSfA
	onxgzuPa/fVeXbHhlW5uBwwiyNmVXFeqCrwAKteVJJhZcU2b8X7lNJ2bIoQZDKkzBWzyHADxukTEE
	A9DShC4mNBxfUotAzXoKNWihtW+ZF6kFjIQNYco/xLVP/uix7BUuoL669u2uQs4+moYtLndMOHkJ7
	JF+zVxHoDNDpx1LeMgncPfv3K2BSD2XkrcnfDatKXJfFgM4gVDPzl3I/0et5o2aIbKtOsgCiLA27c
	3TROLHuzjyMLOT2nnyaXUH3hLcSgbw0GjlvhR3jK4tQI9DAKyQYkwqXyKmWYIj+G5ihVESKmr4a8w
	nZsyOWow==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2s-00000002ACC-09RY
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jdu/Go4SV5qRaqiaKhllMqx5OXzM41p0GtpXKOIUrDI=;
	b=e7Z91fB1vallOUjZUNrsO4Z55jFsqYvlY4HHephEEeYBuSk+tmsXoK3j7YhaVypVI8cBtu
	Jjd9sEdlu6b412OKur4cdbuC6ecfGS6VDqVdOYsOcTdI+rZzvssuQHyvtRhW27dLsXmaEa
	mdu+lkVWnBf93I3y4wE0WzHt+T8zZJULXhV1v3o5eE+C+YA8n1zxnrClVYg6vh7skymoSh
	3HYf2sySkwaey4jcShNeu2SgvTfTmO3iv2Pki/zEqmgK750Bcwf96xcFmKsCO7Or1+09Me
	XcGrxLUDnV6uODvgo0MqiaLjbdKDNxKGJDaoZAtbMSnSGiIxMGaHuxRCeSLxhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jdu/Go4SV5qRaqiaKhllMqx5OXzM41p0GtpXKOIUrDI=;
	b=XrPFzeWW/HV/DxmvdsF0KCXIjFmh/fnW2o2Ta8YdF+9ZUSr0durYeotrh2kXgb+WfGbKN8
	0Sii8rbXP2S3KdAw==
Date: Wed, 11 Jun 2025 09:38:12 +0200
Subject: [PATCH v3 06/16] kbuild: doc: add label for userprogs section
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-6-55e3d148cbc6@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=800;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=oUkJFiHVSNpRRfiuTGCTp6nUhDJGSME1Xr0CfXdtdoU=;
 b=fW2l6DvURy9crOmbdwFZlP/AeJHt4Y3p5726+DixNW0iHRf41O72qIyfYfkfxhgae2OL/CTBt
 UuY8ic+qIqWDEzSQz2o+92JxyDiEnRCX5fGe5AyWfmQeFArjYnkii1k
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083850_224181_A44760C4 
X-CRM114-Status: UNSURE (   7.46  )
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

U29tZSB1cGNvbWluZyBuZXcgZG9jdW1lbnRhdGlvbiBzaG91bGQgbGluayBkaXJlY3RseSB0byB0
aGUgdXNlcnByb2dzIHNlY3Rpb24uCgpBZGQgYSBsYWJlbCB0byB0aGUgc2VjdGlvbiBzbyBpdCBj
YW4gYmUgcmVmZXJlbmNlZC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9t
YXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIERvY3VtZW50YXRpb24va2J1aWxkL21h
a2VmaWxlcy5yc3QgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9rYnVpbGQvbWFrZWZpbGVzLnJzdCBiL0RvY3VtZW50YXRp
b24va2J1aWxkL21ha2VmaWxlcy5yc3QKaW5kZXggNGNjN2ExYjg5ZjE4MDM4NTdhNDcyMzI4NDYx
MzExMWU5YWQ3MWQ5Mi4uMmFkZWEzNmFjNmViZjZjMjkyZTAxYTNlMDRjMGI2MzNlM2MxYjhhZCAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9rYnVpbGQvbWFrZWZpbGVzLnJzdAorKysgYi9Eb2N1
bWVudGF0aW9uL2tidWlsZC9tYWtlZmlsZXMucnN0CkBAIC04OTEsNiArODkxLDggQEAgVGhpcyBp
cyBwb3NzaWJsZSBpbiB0d28gd2F5czoKICAgICBUaGlzIHdpbGwgdGVsbCBrYnVpbGQgdG8gYnVp
bGQgbHhkaWFsb2cgZXZlbiBpZiBub3QgcmVmZXJlbmNlZCBpbgogICAgIGFueSBydWxlLgogCisu
LiBfa2J1aWxkX3VzZXJwcm9nczoKKwogVXNlcnNwYWNlIFByb2dyYW0gc3VwcG9ydAogPT09PT09
PT09PT09PT09PT09PT09PT09PQogCgotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
