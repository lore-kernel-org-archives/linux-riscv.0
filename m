Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63082E9B37A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrsnJMyo9M9/2r/9DNcTXQLzP+WbsvcNLUhuvpBI0vE=; b=CmSrFmg9qUYBV4
	AsF93jpLzOvG1qe5pgwx8SlC18AeFdFV2z34CePZBKARplpHc/fQ++u/4uJMO7DEPsUgfLX2WeEWn
	7YLmYdIOP/L/QXaMtFJVMKbgvzHhSz7uMxV5E++9FtYR63giWQ1CqwLSR0wY+gP6ZzdljAHdwj1C7
	IY8fviddJj4IyivpfaS3FBLuYJQIc+yb6gxHS+twwtwlxWSIlozMtKjaOibfOyK51YcHdAm3IXfkY
	ifR9wg8Z2TnFDujATofcEtRrOs8M0OJsffhUI8pyODOKUYp9MBuUOTrhKbM4kD4k+xo9b2MTSu/oq
	AmAjpsEcd8RjKE57dlhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Le-0000000CwFL-0130;
	Mon, 02 Mar 2026 12:26:06 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LP-0000000Cvqf-0dop;
	Mon, 02 Mar 2026 12:25:54 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXDeF7UDpB8ZiPE3iLm028k2zogpL4XBUC66IjBoygE=;
	b=u5zypD0/i7Uz5OODrlF49hQ+lpWWTOdLI3nJOWR1OIvOaMO/3vb+rs4YWorLAbvP3SeupE
	efw3ir1dAVgCC7GhhgW3qdEFCEqGz/gSDiFzw5LRuYIKpRBxkhhBowXFddLuhZtiaOP4gF
	dlepkL6XEteTWqc5T9no4ZA3k61IKxfE6IyhfQStErarfrPL67AkxEbr6CYYlqNEZQVMqN
	NX7z/XIV3AaMIkKD+rc7xX8BEr+XDtbuCIpEFqfZ3QBZQ8mYAYth30AHwbN8dJIxz2QK7H
	BcQ+zup4ER2aBs9NnJ3azWnJ9/PQBtVXq08kdgFnw32rydUXnsqSCDbbdOlVJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXDeF7UDpB8ZiPE3iLm028k2zogpL4XBUC66IjBoygE=;
	b=YRuN5Am8QTcAru6KtUv5IvXWiWNuN4ajxCeRCgIAwKrJtoAJkHubhsTbdBJDWkHmvs5dPw
	Q4dALwGBXmkPgVBw==
Date: Mon, 02 Mar 2026 13:25:32 +0100
Subject: [PATCH 08/15] LoongArch: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-8-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1725;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+/a7BCuaRvs/grFgisGI29OqfBKuEYQlySRlV2+Ad3w=;
 b=PsVs/lovJCA1Gx2WwwkdDjFmcUu2Juw49xEDuMkmmUjNuORoQIekOKf3Yr14UygMky0lYF1th
 pALKMlLZtR4CkzYTF734/hb85wQvMSVlXVQIwWJIc24yD/mabNmcyJT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042551_422530_CE5EEF95 
X-CRM114-Status: GOOD (  11.63  )
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
b25peC5kZT4KLS0tCiBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgIHwg
MTQgKysrKysrKysrKysrKysKIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVj
LmggfCAgOCArKystLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL2F1eHZl
Yy5oIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vYXV4dmVjLmgKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4zN2RkNzE3YTNhMjIKLS0tIC9kZXYvbnVsbAorKysg
Yi9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9hdXh2ZWMuaApAQCAtMCwwICsxLDE0IEBACisv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsgKi8KKy8qCisgKiBBdXRob3I6IEhh
bmx1IExpIDxsaWhhbmx1QGxvb25nc29uLmNuPgorICogICAgICAgICBIdWFjYWkgQ2hlbiA8Y2hl
bmh1YWNhaUBsb29uZ3Nvbi5jbj4KKyAqCisgKiBDb3B5cmlnaHQgKEMpIDIwMjAtMjAyMiBMb29u
Z3NvbiBUZWNobm9sb2d5IENvcnBvcmF0aW9uIExpbWl0ZWQKKyAqLworCisjaWZuZGVmIF9fQVNN
X0FVWFZFQ19ICisjZGVmaW5lIF9fQVNNX0FVWFZFQ19ICisKKyNkZWZpbmUgQVRfVkVDVE9SX1NJ
WkVfQVJDSCAxIC8qIGVudHJpZXMgaW4gQVJDSF9ETElORk8gKi8KKworI2VuZGlmIC8qIF9fQVNN
X0FVWFZFQ19IICovCmRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL3VhcGkvYXNt
L2F1eHZlYy5oIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAppbmRl
eCA5MjJkOWU2YjUwNTguLjc5NjkxYzQyMmM3ZSAxMDA2NDQKLS0tIGEvYXJjaC9sb29uZ2FyY2gv
aW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAorKysgYi9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL3Vh
cGkvYXNtL2F1eHZlYy5oCkBAIC02LDEyICs2LDEwIEBACiAgKiBDb3B5cmlnaHQgKEMpIDIwMjAt
MjAyMiBMb29uZ3NvbiBUZWNobm9sb2d5IENvcnBvcmF0aW9uIExpbWl0ZWQKICAqLwogCi0jaWZu
ZGVmIF9fQVNNX0FVWFZFQ19ICi0jZGVmaW5lIF9fQVNNX0FVWFZFQ19ICisjaWZuZGVmIF9fVUFQ
SV9BU01fQVVYVkVDX0gKKyNkZWZpbmUgX19VQVBJX0FTTV9BVVhWRUNfSAogCiAvKiBMb2NhdGlv
biBvZiBWRFNPIGltYWdlLiAqLwogI2RlZmluZSBBVF9TWVNJTkZPX0VIRFIJCTMzCiAKLSNkZWZp
bmUgQVRfVkVDVE9SX1NJWkVfQVJDSCAxIC8qIGVudHJpZXMgaW4gQVJDSF9ETElORk8gKi8KLQot
I2VuZGlmIC8qIF9fQVNNX0FVWFZFQ19IICovCisjZW5kaWYgLyogX19VQVBJX0FTTV9BVVhWRUNf
SCAqLwoKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
