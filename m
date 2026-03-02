Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62825E9B376
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E97h8EkDYUxE6NOwzwtth8dRsn4HDAiex4iiM/2ePXY=; b=BKoyBTVlGXPXp5
	aF1M00kuerXM6KmFPxL02Id6cMVPPtp3QbROi7aLkMm0BgMCwZSPyDxtiT+RIUySyhrgAmVWZBDO8
	bOy1jG95mZMUnTkUmujJ214ecSpS+yaNBtbKDhCYC42jMgE9aNWxpWwLqoP35zS2XivX2X3I7XKaW
	F+CuGTHujs3bs6/hiK35cTXYPX+6/xKTCi0vPvdSEgGfyU8ONnwHD4rWQhTtKzP6XEaKugsWe1lZL
	c2tTLgyrqO3n4GbGuL4F3QUkihKSp+DokmGGOC0E0dWG88dJx7Gon8ZQUBqpF22wfOUOgFyc3mfBe
	U3tiNB/XScZCGllxpSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Lc-0000000CwCc-2oEd;
	Mon, 02 Mar 2026 12:26:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LP-0000000Cvqd-0NAz;
	Mon, 02 Mar 2026 12:25:54 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yr/FVLaERA/6AyGKnbc+eEestu0HgmTMXr3G7w1zsEE=;
	b=NgEmBRH83vNY7H36CH4oO6VnJ5MAvKmiUKvwK3t7ouIQuPACqkkjKl2URmwcjH+onPdSZb
	r9EzOPFWNJPD/IuM4H7H7vF+bKQ2SYeG40TaRA9tVFaRIHivjPmTcNQ5/9CdZNluIMIyXb
	eAEshz46RA8/Ju0Ah9MapcJN+oVWn19o1cu3Mz6ujerXIQ7x5HQj7wht4jZmqkSgxgJ1TF
	3OxHlKUOzBCmOC0KB00MIeEsuA/rH+5YF1NUpCcU5Zfiqm6TXzb8mbOaNOvRguUB5IAS6w
	sz6lJH8dDDk5KbCgBUQK4ckDtwyo3MRB9L7tWcpXT8jZB/H/xMqqehwM/C37xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yr/FVLaERA/6AyGKnbc+eEestu0HgmTMXr3G7w1zsEE=;
	b=wBjvzdwEGM5OTq4hn5Ae5qenwnN25sPzXSMLGyi7kK7MBM5frm1SN3i93koTAjShsmKHdH
	r/HgSkHAiAt1SKCQ==
Date: Mon, 02 Mar 2026 13:25:29 +0100
Subject: [PATCH 05/15] x86: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-5-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1952;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=H/zS+Ct3UHio/FsL18acsKnK+cbSHWGTE0BjVHLUtvg=;
 b=zafh0BF3nW0lW74zLMVAm5CMViipzIhJlV12m0OWQt+FQwiQhO8t2F9dDNqKSZeCroOF2w7dU
 QaM4A6LGzPhCYQpOkBtTE0q/iOHVWPqMyNJAu5/H35A8mav/lYtcmVc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042551_347650_0850EEC6 
X-CRM114-Status: GOOD (  10.37  )
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
b25peC5kZT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgIHwgMTIgKysr
KysrKysrKysrCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oIHwgMTMgKysrLS0t
LS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hdXh2ZWMuaCBiL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2F1eHZlYy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uZWQyNmFkMDlmM2UzCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20vYXV4dmVjLmgKQEAgLTAsMCArMSwxMiBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAgKi8KKyNpZm5kZWYgX0FTTV9YODZfQVVYVkVDX0gKKyNkZWZpbmUgX0FTTV9YODZf
QVVYVkVDX0gKKworLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTzogKi8KKyNpZiBkZWZpbmVkKENP
TkZJR19JQTMyX0VNVUxBVElPTikgfHwgIWRlZmluZWQoQ09ORklHX1g4Nl82NCkKKyMgZGVmaW5l
IEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggMworI2Vsc2UgLyogZWxzZSBpdCdzIG5vbi1jb21wYXQgeDg2
LTY0ICovCisjIGRlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNIIDIKKyNlbmRpZgorCisjZW5kaWYg
LyogX0FTTV9YODZfQVVYVkVDX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvdWFw
aS9hc20vYXV4dmVjLmggYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCmluZGV4
IGJkZGU5ZTE4Zjk0ZS4uNjY3N2M5YWNlMTE3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRl
L3VhcGkvYXNtL2F1eHZlYy5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVj
LmgKQEAgLTEsNiArMSw2IEBACiAvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBX
SVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLwotI2lmbmRlZiBfQVNNX1g4Nl9BVVhWRUNfSAotI2Rl
ZmluZSBfQVNNX1g4Nl9BVVhWRUNfSAorI2lmbmRlZiBfVUFQSV9BU01fWDg2X0FVWFZFQ19ICisj
ZGVmaW5lIF9VQVBJX0FTTV9YODZfQVVYVkVDX0gKIC8qCiAgKiBBcmNoaXRlY3R1cmUtbmV1dHJh
bCBBVF8gdmFsdWVzIGluIDAtMTcsIGxlYXZlIHNvbWUgcm9vbQogICogZm9yIG1vcmUgb2YgdGhl
bSwgc3RhcnQgdGhlIHg4Ni1zcGVjaWZpYyBvbmVzIGF0IDMyLgpAQCAtMTAsMTEgKzEwLDQgQEAK
ICNlbmRpZgogI2RlZmluZSBBVF9TWVNJTkZPX0VIRFIJCTMzCiAKLS8qIGVudHJpZXMgaW4gQVJD
SF9ETElORk86ICovCi0jaWYgZGVmaW5lZChfX0tFUk5FTF9fKSAmJiAoZGVmaW5lZChDT05GSUdf
SUEzMl9FTVVMQVRJT04pIHx8ICFkZWZpbmVkKENPTkZJR19YODZfNjQpKQotIyBkZWZpbmUgQVRf
VkVDVE9SX1NJWkVfQVJDSCAzCi0jZWxzZSAvKiBlbHNlIGl0J3Mgbm9uLWNvbXBhdCB4ODYtNjQg
Ki8KLSMgZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggMgotI2VuZGlmCi0KLSNlbmRpZiAvKiBf
QVNNX1g4Nl9BVVhWRUNfSCAqLworI2VuZGlmIC8qIF9VQVBJX0FTTV9YODZfQVVYVkVDX0ggKi8K
Ci0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
