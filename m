Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBCDC61DD3
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILoXqq8C6/KpEuIaIFRc/768EW07iImozbDmogWD5mc=; b=R4qkRZJ2WSp6c/
	Y8nEKP9hxA3Pkk3eJC1sQtGX9izkg6oaXwhq0GiyXMiw/fBpIi9cL3lfAEM20Pm7gF2ZalgG+0PNd
	rg2h95jMTzgtsUUh5YAWrAsA+QNXAjy88ik/l2eWD6ygzDEpkKCgt6MM816+AsHoBIBIr/9m5jCGF
	wuMSFbboDrow7RwBjF732lZ5iLM7rJLuzNrkfx/AYyO9lzQwqmkz0laYewup65lMvT0FGlyPLUEQN
	UYINfD9adewxD0ILRwpMoRMLaEHVm0Liu093FMqaOx/HscXinKYjmFtPWaVeSye5/J7DW403joJp5
	7wirCHArlrReWAcnXAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2251-0000000GdAG-0l0n;
	Thu, 03 Sep 2026 07:41:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224n-0000000GclG-2gyq;
	Thu, 03 Sep 2026 07:41:40 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsqBa4DYT6UOJOiQLZcJsY0z2uNBnuWhMaLFwrPj+rM=;
	b=zh5925hVYaFB8ZqXkqngvUmrw9+a6ujcjssEZbyneFYSTtX2htRdyVd+bPbvOpRgBkbHKS
	UyYRl8bVC/aCmhDACl6PUsAGjL6qD6UrgJ6fMtX0XrK73AXH+bTIM0RQh9RqQBqTE7PfWd
	sy46BX+9UVIXQQ8gXYqvn4EW9yJvpFkVlqSZcEgQdubafxa5Ht10HI2PyF6YkErVIB8+Pz
	tTtz7udMuul61G9wZ8BcAdTTwiUXTNFB24x65Fdz0iHU4ieKAxzzI8OryCDb0/Sujiis8f
	xSWrzR7JgVoAUIc97d1Z76rvV+zJZLsOMPXpSeI9zqAUC1bi8nMdiAkqTFv3cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsqBa4DYT6UOJOiQLZcJsY0z2uNBnuWhMaLFwrPj+rM=;
	b=p+sdR1ZOWyxm4iWpsvHvJ/zT475he8+gLNu/e+0exOHrUUoHvzRjT1tFhSKbw+QZymljTy
	5ABuxLobpVaHXeDQ==
Date: Thu, 03 Sep 2026 09:41:26 +0200
Subject: [PATCH v2 11/15] MIPS: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-11-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1884;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cs0IiOQ51smsz0pVBiUdFi4gN8rZXBN55vGK/+lYj0w=;
 b=fgMzeADRsHBHDhQ0aBCRMVdgaCDOyOHavpx7wa8hChxiqtcHW4YZOAtPgh6azTmpGG9KLODsH
 xiGj8+MIrP/CxqeNABlDpjpPVwhKierLeYQje+RQU0pz9pb8sg6KNDG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004137_862873_96DE480E 
X-CRM114-Status: GOOD (  13.31  )
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
QVVYVkVDX0ggKi8KKyNlbmRpZiAvKiBfX1VBUElfQVNNX0FVWFZFQ19IICovCgotLSAKMi41NS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
