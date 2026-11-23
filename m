Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FAC606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W35erRGQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Qhjfuhg5;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DJ5CQ+2g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BFtxBFscHRAPltz20TfiY7P9ZUSRXByNudRGYd9WHUg=; b=W35erRGQFBJxEf0EdA8qEXpgzs
	YdKpBxqkLJ6UOLZnhVT6nL7QMWrnoenPMDfIVmBEkpF+5D4A/XD45b0PugXUN4tNL+yMSiq16M9Oq
	sl+gsuu3tSHp1n/GwfvLXPpm8YXywb29Ie7X5ZXwGKRrpuUEluwvLLs2oxfbFDbZzhS90YnPkWLaU
	FoaGPm/pp+8Ak/m+1vhgV8g225qN1EotxVmcA/1tQkwual9DhPwtpq7Ol8haZIT0m/ryGRTeJ0t3C
	dvrk4XxiFTBpAmnD6GOG+U9P6yuS/+OhDvXAJXvOwcmewD6Mb29l+lv6NaHiea+yGT2wzZvNlgkGW
	6UtLcP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQW9-00000002lg3-0sb1;
	Mon, 23 Nov 2026 09:39:21 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jqJ-3rMo;
	Mon, 23 Nov 2026 09:37:40 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFz11W/0Lqk00aPK2+1rfyP0U4LgLtsvecMTzf9C0fI=;
	b=Qhjfuhg5BOpRdkpv0wg4HWnEWXpfOXKFeEV6Sz/b10Pv8ng2sR4CWRYNUMklJdLK+lfFhQ
	ciG8+VF0sDO41CzlncqE8Nn08rc0T60asEFi81sdelPgJ0xU5AdnXOBI+Fd5RUlN7xW6yQ
	suXN3LFNwZB08v4kbJY5Khoy+gIwVBMhJJcvRMo49tcKazxB2JkNFp7n0LqC/8/Dhebatb
	ZaMhDZgGsx/KdS26g/v+rWxCq4PFo03cy9ktkysnFIHbaU/A25ie0CbJdjqk6+NciQ2riA
	vFNQtU2TwgDZ6bNnr2LODBFP9Ko/KAHQ1WRx+mzOY2aLp/YG/M6n+1r8GRGmfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFz11W/0Lqk00aPK2+1rfyP0U4LgLtsvecMTzf9C0fI=;
	b=DJ5CQ+2glRL7KEbNa9Pi3LC8RLTKlXOHkKWu1TseL+8X5jKEfrdNP/q+t6jT6amybgKSCh
	JOB22dFWK0AzxLBA==
Date: Mon, 23 Nov 2026 10:37:16 +0100
Subject: [PATCH v3 11/15] MIPS: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-11-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1884;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/scq+fYP6ilitEq/RHaQnIRXIqOzidKEXbq390ysiEM=;
 b=VI0g7Ty5sUuiX3Qxq01gVzHhE4kwB7ooWl14HZPmX8PuM1fgFaPwF+XKQX6xfpE7avFmAUJaS
 6ukuvxThL4qDUbzZO3QI098ohACP5JqOVuaivPYQJ/IemhwRfmSZgvo
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013736_119033_208A8487 
X-CRM114-Status: GOOD (  13.06  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlcmUgaXMgbm90aGluZyB1c2Vyc3BhY2UgY2FuIGRvIHdpdGggdGhpcyB2YWx1ZS4gSW4gdGhl
IGtlcm5lbCBpcwphbHdheXMgY29tYmluZWQgd2l0aCBBVF9WRUNUT1JfU0laRV9CQVNFLCB3aGlj
aCBpcyBub3QgZXhwb3NlZCB0bwp1c2Vyc3BhY2UgYW5kIGFsc28gY2hhbmdlcyBmcm9tIHRpbWUg
dG8gdGltZS4KCk1vdmUgdGhlIHN5bWJvbCB0byBhIGtlcm5lbC1pbnRlcm5hbCBoZWFkZXIuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRy
b25peC5kZT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPgotLS0KIGFy
Y2gvbWlwcy9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysK
IGFyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oIHwgIDggKysrLS0tLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL21pcHMvaW5jbHVkZS9hc20vYXV4dmVjLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20v
YXV4dmVjLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi43NmM0NDVl
Nzg5MGYKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vYXV4dmVjLmgK
QEAgLTAsMCArMSwxNyBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArICov
CisvKgorICogQ29weXJpZ2h0IChDKSAyMDE1IEltYWdpbmF0aW9uIFRlY2hub2xvZ2llcworICog
QXV0aG9yOiBBbGV4IFNtaXRoIDxhbGV4LnNtaXRoQGltZ3RlYy5jb20+CisgKgorICogVGhpcyBw
cm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBt
b2RpZnkgaXQKKyAqIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZQorICogRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyAg
ZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgIExpY2Vuc2UsIG9yIChhdCB5b3VyCisgKiBvcHRpb24p
IGFueSBsYXRlciB2ZXJzaW9uLgorICovCisKKyNpZm5kZWYgX19BU01fQVVYVkVDX0gKKyNkZWZp
bmUgX19BU01fQVVYVkVDX0gKKworI2RlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNIIDEgLyogZW50
cmllcyBpbiBBUkNIX0RMSU5GTyAqLworCisjZW5kaWYgLyogX19BU01fQVVYVkVDX0ggKi8KZGlm
ZiAtLWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oIGIvYXJjaC9taXBz
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKaW5kZXggNjEyYzJjNDFmNjBiLi4xMzMxYWM0ZDkz
NWUgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCisrKyBi
L2FyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCkBAIC05LDEyICs5LDEwIEBACiAg
KiBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgogICovCiAKLSNpZm5kZWYgX19BU01fQVVYVkVD
X0gKLSNkZWZpbmUgX19BU01fQVVYVkVDX0gKKyNpZm5kZWYgX19VQVBJX0FTTV9BVVhWRUNfSAor
I2RlZmluZSBfX1VBUElfQVNNX0FVWFZFQ19ICiAKIC8qIExvY2F0aW9uIG9mIFZEU08gaW1hZ2Uu
ICovCiAjZGVmaW5lIEFUX1NZU0lORk9fRUhEUgkJMzMKIAotI2RlZmluZSBBVF9WRUNUT1JfU0la
RV9BUkNIIDEgLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTyAqLwotCi0jZW5kaWYgLyogX19BU01f
QVVYVkVDX0ggKi8KKyNlbmRpZiAvKiBfX1VBUElfQVNNX0FVWFZFQ19IICovCgotLSAKMi41Ni4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
