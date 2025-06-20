Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A79C71155
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NRV6jMU5zM//9xlK/2WBCF+suKsfTJpM+0mMvpvbHRc=; b=afjSp5aTUTg4uQ
	qLyPLqtF1MEeTMJmSftBD4/EmlCLcvdVoOO6uPk400SaZ2fnTBPNxF6pGMgsNxakhpZjM8aQVjZ1h
	915A4eZlDaq9+oB8Kzu95Tn5Huge8GfxmbN3saaij1so7+unPK9DmE+1Yl8O3oDuLK6cNAvsQf51J
	pkyFJyH6ZOxXannxAK3vkmvMaeOH8nkutieT+I/6EMezrD0PMDcI+nz/G6Sfz+e/TGdFT2hwY0tE9
	GTteaH5EW3Zf3kSwg7hUbeAYbCPyOwJReTuJ9vn71fKsITf8atky290dWIE+I2c2DEQPYxA4m4Inf
	EqnHEZAhNM44GAIxsZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaC4-0000000FUdi-37DQ;
	Fri, 20 Jun 2025 11:46:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZd4-0000000FQoY-1whK
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 11:09:55 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750417791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PWqArSOAfTC1L3Ga/GRvc43T5ZdN4RWui3vJm5T69f0=;
	b=oGePHy8ntSocBb8MmX7vxwMR9AqGRAPw0yxsBBrcSfEeaK1J4g5eQEg9+8zn5QV19p9F8C
	rdJhUnL5TuKHtOxM40vvqSPPbyagDXffZmP0GSTQx67YmcZnIfjvc+e1KpBrJpFLw2wli+
	RbCV1BHNjfw+sxnUEdRsHk6gXGklaJi618XzRu7HGUadmZoOz4ZhqskAeinurLKFH61F9B
	mu/okgLunmYf7hJEclF8rUZzxq6Lwlc/72jc8YUsS7J8JxYPiOqLPn/jSjQ0jnGUpI5Pfo
	qCUg51IxvxsWrB/p682AUP/BT0odvO3FucyXsKFZD/piun7nnbslBgJhxVtFFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750417791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PWqArSOAfTC1L3Ga/GRvc43T5ZdN4RWui3vJm5T69f0=;
	b=gItVlmoprKsgxq+suCSmg/zOUer9qJQuKwHSqxDJwzd5/0p34r50fGnn5RHBtznem2B6fK
	pQY35dFXapMQoiCg==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Nylon Chen <nylon.chen@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH] Revert "riscv: misaligned: fix sleeping function called during misaligned access handling"
Date: Fri, 20 Jun 2025 13:09:39 +0200
Message-Id: <20250620110939.1642735-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_040954_640952_B108CD16 
X-CRM114-Status: UNSURE (   8.78  )
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

VGhpcyByZXZlcnRzIGNvbW1pdCA2MWE3NGFkMjU0NjIgKCJyaXNjdjogbWlzYWxpZ25lZDogZml4
IHNsZWVwaW5nIGZ1bmN0aW9uCmNhbGxlZCBkdXJpbmcgbWlzYWxpZ25lZCBhY2Nlc3MgaGFuZGxp
bmciKS4gVGhlIGNvbW1pdCBhZGRyZXNzZXMgYSBzbGVlcGluZwppbiBhdG9taWMgY29udGV4dCBw
cm9ibGVtLCBidXQgaXQgaXMgbm90IHRoZSBjb3JyZWN0IGZpeCBhcyBleHBsYWluZWQgYnkKQ2zD
qW1lbnQ6CgoiVXNpbmcgbm9mYXVsdCB3b3VsZCBsZWFkIHRvIGZhaWx1cmUgdG8gcmVhZCBmcm9t
IHVzZXIgbWVtb3J5IHRoYXQgaXMgcGFnZWQKb3V0IGZvciBpbnN0YW5jZS4gVGhpcyBpcyBub3Qg
cmVhbGx5IGFjY2VwdGFibGUsIHdlIHNob3VsZCBoYW5kbGUgdXNlcgptaXNhbGlnbmVkIGFjY2Vz
cyBldmVuIGF0IGFuIGFkZHJlc3MgdGhhdCB3b3VsZCBnZW5lcmF0ZSBhIHBhZ2UgZmF1bHQuIgoK
VGhpcyBidWcgaGFzIGJlZW4gcHJvcGVybHkgZml4ZWQgYnkgY29tbWl0IDQ1MzgwNWYwYTI4ZiAo
InJpc2N2OgptaXNhbGlnbmVkOiBlbmFibGUgSVJRcyB3aGlsZSBoYW5kbGluZyBtaXNhbGlnbmVk
IGFjY2Vzc2VzIikuCgpSZXZlcnQgdGhpcyBpbXByb3BlciBmaXguCgpMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9iNzc5YmVlZC1lNDRlLTRhNWUtOTU1MS00NjQ3Njgy
YjBkMjFAcml2b3NpbmMuY29tLwpTaWduZWQtb2ZmLWJ5OiBOYW0gQ2FvIDxuYW1jYW9AbGludXRy
b25peC5kZT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBhcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCmlu
ZGV4IGRkOGU0YWY2NTgzZjQuLjkzMDQzOTI0ZmU2YzYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19t
aXNhbGlnbmVkLmMKQEAgLTQ1NCw3ICs0NTQsNyBAQCBzdGF0aWMgaW50IGhhbmRsZV9zY2FsYXJf
bWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJdmFsLmRhdGFfdTY0ID0g
MDsKIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Ci0JCWlmIChjb3B5X2Zyb21fdXNlcl9ub2ZhdWx0
KCZ2YWwsICh1OCBfX3VzZXIgKilhZGRyLCBsZW4pKQorCQlpZiAoY29weV9mcm9tX3VzZXIoJnZh
bCwgKHU4IF9fdXNlciAqKWFkZHIsIGxlbikpCiAJCQlyZXR1cm4gLTE7CiAJfSBlbHNlIHsKIAkJ
bWVtY3B5KCZ2YWwsICh1OCAqKWFkZHIsIGxlbik7CkBAIC01NTUsNyArNTU1LDcgQEAgc3RhdGlj
IGludCBoYW5kbGVfc2NhbGFyX21pc2FsaWduZWRfc3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
CiAJCXJldHVybiAtRU9QTk9UU1VQUDsKIAogCWlmICh1c2VyX21vZGUocmVncykpIHsKLQkJaWYg
KGNvcHlfdG9fdXNlcl9ub2ZhdWx0KCh1OCBfX3VzZXIgKilhZGRyLCAmdmFsLCBsZW4pKQorCQlp
ZiAoY29weV90b191c2VyKCh1OCBfX3VzZXIgKilhZGRyLCAmdmFsLCBsZW4pKQogCQkJcmV0dXJu
IC0xOwogCX0gZWxzZSB7CiAJCW1lbWNweSgodTggKilhZGRyLCAmdmFsLCBsZW4pOwotLSAKMi4z
OS41CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
