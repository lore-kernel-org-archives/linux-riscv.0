Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93399E9B371
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8iIXY1vMWE03GMj4bstCKdBV2F99O913FgppCNWYxo=; b=RMVa/0n++OyfeM
	KUg5i40lfMaibR2JfQElJLgmYNWPsM+5Bv+Rykda0XQF4MgBukC22Gb+2vD+cq+A8Esmf8imMNK2f
	eQHTS+XgS9Y2rPdtXwGTaPNebiuDsAqayfzMgSHsUnw9N4AjR3ZmB3dZzXVMzgtmngmNWlaR6aejH
	wSFSjBGWblkW0ZA5/M3LtIIlkyWC+xG8YYJGsV5iu88a5EwEMZLJmKf3QN5K0oO8Q6Fy8d3TtduqT
	U5spJmPc3kAlpeCgpKQGJe+ZtNuPmnCqpqNMZLlp4p2hp8c4leI6safwoUy8a1ia7EDcKLytwQFCs
	V+RDKTWZcHfnHypHoojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LZ-0000000Cw7G-1bU1;
	Mon, 02 Mar 2026 12:26:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LP-0000000Cvqc-0Nv5;
	Mon, 02 Mar 2026 12:25:53 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tlk3cqJZ30Lz5MhUet1qgc5NgTTbprbGncwAJnGFeH8=;
	b=CRJt/UjA77my9s/VwzZr+j6qmjyF3oIVyiLTMYKBq2Sh1cqL0kMsN1qmUgdc0mTKviVZ9P
	rN5i5a2mJ6Syz8O+A5oRl7YkQu+OSRfqOmex5k1XFQHkmUmRrESTPgOKRNKDTjrQIhhPOe
	Pi1gueEvqygXyPKCQB6giWSdTNlUs1PSeqcgS1aXQZ/YSKg5AdFODTmb+LA74y68Q8bzlw
	jpjjnG3HeKthKo3qJCjXHqWWI2YRAQZEtkJjshcmL3gflfzyYuoBG9keXT4sRjMDDa8Mjo
	FvTT8WwqKMRr+0hgvx/TqCyJBmOuXOHqaUuaNctXm7PoJedartXLjhTimMdJLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tlk3cqJZ30Lz5MhUet1qgc5NgTTbprbGncwAJnGFeH8=;
	b=MBwnxjs+xWwop6Ct7CBgP9e8by6gH+y3rfllXxAy/TGMGEjACAyDkON2IpJ6i+NGG/l5A8
	GOlZMj1xzUvgZ9Aw==
Date: Mon, 02 Mar 2026 13:25:30 +0100
Subject: [PATCH 06/15] arm64: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-6-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1548;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NcNAjFpusRcTaOeHqUd5vUDlghSduTpD8ok7Y/f07wQ=;
 b=MiKiwAWA2C+9P7E+r7QvNNNf10TuRkC/eecHXJHLCNJUMLtyvOLvvIqkh8xzavM6nRpnPO504
 Fm13zL1o5/hDGNiNI3mFFSmqn9QMFTOn5P81Y3mb9x9by94kvb/sFzx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042551_312507_FFECD14B 
X-CRM114-Status: GOOD (  11.44  )
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
b25peC5kZT4KLS0tCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCA3ICsr
KysrKysKIGFyY2gvYXJtNjQvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCB8IDYgKystLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC9hcm02NC9pbmNsdWRl
L2FzbS9hdXh2ZWMuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmRl
MjRlYWFhMDZlMgotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vYXV4
dmVjLmgKQEAgLTAsMCArMSw3IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MCAqLworI2lmbmRlZiBfX0FTTV9BVVhWRUNfSAorI2RlZmluZSBfX0FTTV9BVVhWRUNfSAorCisj
ZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggMiAvKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZPICov
CisKKyNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL3VhcGkvYXNtL2F1eHZl
Yy5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCmluZGV4IDc0M2MwYjg0
ZmQzMC4uZmI1MWU5MDY4MTNhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvdWFwaS9h
c20vYXV4dmVjLmgKKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCkBA
IC0xNCwxMyArMTQsMTEgQEAKICAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCiAgKiBhbG9uZyB3aXRoIHRoaXMgcHJvZ3Jh
bS4gIElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KICAqLwotI2lm
bmRlZiBfX0FTTV9BVVhWRUNfSAotI2RlZmluZSBfX0FTTV9BVVhWRUNfSAorI2lmbmRlZiBfX1VB
UElfQVNNX0FVWFZFQ19ICisjZGVmaW5lIF9fVUFQSV9BU01fQVVYVkVDX0gKIAogLyogdkRTTyBs
b2NhdGlvbiAqLwogI2RlZmluZSBBVF9TWVNJTkZPX0VIRFIJMzMKICNkZWZpbmUgQVRfTUlOU0lH
U1RLU1oJNTEJLyogc3RhY2sgbmVlZGVkIGZvciBzaWduYWwgZGVsaXZlcnkgKi8KIAotI2RlZmlu
ZSBBVF9WRUNUT1JfU0laRV9BUkNIIDIgLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTyAqLwotCiAj
ZW5kaWYKCi0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
