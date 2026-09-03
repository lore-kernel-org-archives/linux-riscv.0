Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734A0C79F81
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnHGqb15VJ/HpkI9Eoi91YVH5o6krSb579AqKqYOMgg=; b=pt9Bj9Q2vbd3rQ
	zztlXE6rfTpnBlNV9SN56G+JJqxsXn6Sd5cmOYOT2t0KzRGE50TTXJAHJN2EpN5oSZ/GDBMuX6ZAA
	ZhhO2nvH72djbM15alSywMaXYZC+327it25nYnL3t8ICswtRz+UFp8otsaw66OTlLYbAbXJcU6ara
	J0ku3ixKDDo1Nk8ZlZjYm1iNou/+Fq5Wb27AiGSQqTGf4GAqLY9ffpL579al/rhaEFAGSTHIt10hl
	cqQtZwW6OVBYyNiSserdGOnvVUIO6keXkx/unNLb3CQ3Db3uBNco35rK3uBxede0b4YNNSmwev/ca
	aUjkWvKLQyErQ1zWRAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224u-0000000GczS-1iPq;
	Thu, 03 Sep 2026 07:41:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224m-0000000GckY-2SKB;
	Thu, 03 Sep 2026 07:41:39 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ctVC8jdqr6QFYd4YOzfCl075dK66bWX+194Sx7TuH4=;
	b=RmnpqQcHoiAbhcGu+Ye9voJADRcNlHd7//7UZSZpuweS6/azB8kBGlfXNGpZdw+zJFDhmb
	wVqfd/ReM/yvTEBcp2m8agJJbkA7AncmPKWHrzmhKzuSH1IVXory7WFsKLsmSfU+nfF4Fh
	hxpf6Zo0AWb/8lzdQ/XqwzDTqjMN/ZftsjIshCrqha3MqBXvjPJqrmx40U9dtdNY8urMWx
	+B2P0HKRbsRjXaKsVte8egNJzNOx0RSzNnBwbUTf/deLjmYm4421Lw0Q95xES95qHbtIp7
	OG0nZ4yrrLdrUs28+h/3y0b4ZZnyaG3bYORKfR7uKBROl70iqzLJhbBNyDZQmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ctVC8jdqr6QFYd4YOzfCl075dK66bWX+194Sx7TuH4=;
	b=MutDSXtVdZvrjMqfAE/yNMGtPAGK3IDThXDBVUv0sCpVzDTmiCqIuYuqvvtvE2gzScp5oD
	8MjD0OPK1RDnqHBQ==
Date: Thu, 03 Sep 2026 09:41:23 +0200
Subject: [PATCH v2 08/15] LoongArch: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-8-5bc32a71e3d8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1767;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jZmwpcTvA2lKNhTJtgt0mA5Nuuta8CO6fadzS1+09Lc=;
 b=g6xbNGIMHGTFBPIVi/M+7w3xhJb6s8qCkfAEkcXz7LglyUP7ReGfFvVG9ZkdpA32UwGSvrRmY
 cx+niZaAeaKAcK6Qn9T2uEinyA/55qjVdDuG6KFn3ehAIJWX1I+ofN+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004136_818516_FC6E6E71 
X-CRM114-Status: GOOD (  12.11  )
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
Y2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCAxNCArKysrKysrKysrKysr
KwogYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCB8ICA4ICsrKy0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vYXV4dmVjLmggYi9hcmNoL2xvb25n
YXJjaC9pbmNsdWRlL2FzbS9hdXh2ZWMuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAuLjM3ZGQ3MTdhM2EyMgotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvbG9vbmdhcmNo
L2luY2x1ZGUvYXNtL2F1eHZlYy5oCkBAIC0wLDAgKzEsMTQgQEAKKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wKyAqLworLyoKKyAqIEF1dGhvcjogSGFubHUgTGkgPGxpaGFubHVA
bG9vbmdzb24uY24+CisgKiAgICAgICAgIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGxvb25nc29u
LmNuPgorICoKKyAqIENvcHlyaWdodCAoQykgMjAyMC0yMDIyIExvb25nc29uIFRlY2hub2xvZ3kg
Q29ycG9yYXRpb24gTGltaXRlZAorICovCisKKyNpZm5kZWYgX19BU01fQVVYVkVDX0gKKyNkZWZp
bmUgX19BU01fQVVYVkVDX0gKKworI2RlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNIIDEgLyogZW50
cmllcyBpbiBBUkNIX0RMSU5GTyAqLworCisjZW5kaWYgLyogX19BU01fQVVYVkVDX0ggKi8KZGlm
ZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggYi9hcmNo
L2xvb25nYXJjaC9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCmluZGV4IDkyMmQ5ZTZiNTA1OC4u
Nzk2OTFjNDIyYzdlIDEwMDY0NAotLS0gYS9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL3VhcGkvYXNt
L2F1eHZlYy5oCisrKyBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgK
QEAgLTYsMTIgKzYsMTAgQEAKICAqIENvcHlyaWdodCAoQykgMjAyMC0yMDIyIExvb25nc29uIFRl
Y2hub2xvZ3kgQ29ycG9yYXRpb24gTGltaXRlZAogICovCiAKLSNpZm5kZWYgX19BU01fQVVYVkVD
X0gKLSNkZWZpbmUgX19BU01fQVVYVkVDX0gKKyNpZm5kZWYgX19VQVBJX0FTTV9BVVhWRUNfSAor
I2RlZmluZSBfX1VBUElfQVNNX0FVWFZFQ19ICiAKIC8qIExvY2F0aW9uIG9mIFZEU08gaW1hZ2Uu
ICovCiAjZGVmaW5lIEFUX1NZU0lORk9fRUhEUgkJMzMKIAotI2RlZmluZSBBVF9WRUNUT1JfU0la
RV9BUkNIIDEgLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTyAqLwotCi0jZW5kaWYgLyogX19BU01f
QVVYVkVDX0ggKi8KKyNlbmRpZiAvKiBfX1VBUElfQVNNX0FVWFZFQ19IICovCgotLSAKMi41NS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
