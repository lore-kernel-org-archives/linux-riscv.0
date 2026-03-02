Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F65CE9B36D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQdO6on2yZK3tDIwqZ3lC9+rkmP3UjcMy28QUOY2UNU=; b=sZIN0BoeLH7S7T
	Uy1czXXQ3LwTGh7Zr/XVhOMv3CBlH939uepACNq04KC7k7AlYgTamXwU9lbOmtTL3N/CRFoDk0AXu
	3SDqxbbLV5IC2qM+Z6wUz1W6fwimNrvk0ZgFLSWRlSPPGhvh0AVOOJGOhgHj8vCKRYuW9Vrx7HOzx
	PnU1SHeBvJ1SI6qYsiKdr9Vq8sfnuO92EnecMpk8iMfePVNy3oXCScY/UbFKe1ihj49/Y7MJFYBoJ
	TTp+/Mh0dKIlECjMpVTCCPHwZmjbWh1HMRec09YypRv94NRTg71V1JRGiEWsWzu5MUEy8E+z5symm
	Vt3KuO3HpwPkOmINowqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Lr-0000000CwhW-2OQW;
	Mon, 02 Mar 2026 12:26:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LQ-0000000Cvsc-3MAy;
	Mon, 02 Mar 2026 12:25:56 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ecfuUU5azHq8roSLF5Ax0HiBG0Iw5IvlHchWrSnBNHs=;
	b=r/CSxxEZZPx25noWnuLPEOlvg405Xw3xca3EQ0DE8oLM2u4AtAQKtb0mTgYGT7zNHayXKG
	BQcz8N1JHly/LqSLJydEWe+r3AoQ9SjVio2xtukiWONbZ7tY/j6K9f9K/VAjR8Y+XIZzRg
	Gc3NPnb6uEX0qpxuX6WKeYi+5XpUgY123rtr0SMPuI2QKA/Rp/0x4Yn05tRyih5Vmihiq1
	9LOdeK/U4wIXyctQGqk4grG7EJUMxQHBdiNQ768uDI5Dv6mpUX8ufkZ5jaGs7ki5MemiOk
	Kn0+iI9vvKr8GdhcFoMuZ0AFt61kGSLtejHCDQWf6JNj0nKrPOa3fswYI5rCNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ecfuUU5azHq8roSLF5Ax0HiBG0Iw5IvlHchWrSnBNHs=;
	b=S21YjUM37qvJpPQjuNWiTVpxOK1UlM+hhPYM3nYbn/dEZid8oxS5V9nRwJIuc/r7qqTqec
	PWpqTrRguz3wgvCQ==
Date: Mon, 02 Mar 2026 13:25:35 +0100
Subject: [PATCH 11/15] MIPS: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-11-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1842;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=TLuD8XFHYeCFVZxgca4zMFKNXfKPCtPRG8z7BYiMKxc=;
 b=1ouhbDL/O9yTtFSwv4lrq+riHwXSRD0g9+uI9iWaUTHNLcjc0IXfS0sFkkdYUE4260PFKC7dE
 4P5ShG0H57pDHM2jDb3gFoqedukI/2cts2/yo62lyKCENJaUAL69pb8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042553_068021_B4C14630 
X-CRM114-Status: GOOD (  12.94  )
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
b25peC5kZT4KLS0tCiBhcmNoL21pcHMvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICB8IDE3ICsr
KysrKysrKysrKysrKysrCiBhcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCB8ICA4
ICsrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC9t
aXBzL2luY2x1ZGUvYXNtL2F1eHZlYy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uNzZjNDQ1ZTc4OTBmCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9taXBzL2luY2x1
ZGUvYXNtL2F1eHZlYy5oCkBAIC0wLDAgKzEsMTcgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wKyAqLworLyoKKyAqIENvcHlyaWdodCAoQykgMjAxNSBJbWFnaW5hdGlvbiBU
ZWNobm9sb2dpZXMKKyAqIEF1dGhvcjogQWxleCBTbWl0aCA8YWxleC5zbWl0aEBpbWd0ZWMuY29t
PgorICoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJp
YnV0ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0CisgKiB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUKKyAqIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbjsgIGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlICBMaWNlbnNlLCBvciAoYXQg
eW91cgorICogb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyAqLworCisjaWZuZGVmIF9fQVNN
X0FVWFZFQ19ICisjZGVmaW5lIF9fQVNNX0FVWFZFQ19ICisKKyNkZWZpbmUgQVRfVkVDVE9SX1NJ
WkVfQVJDSCAxIC8qIGVudHJpZXMgaW4gQVJDSF9ETElORk8gKi8KKworI2VuZGlmIC8qIF9fQVNN
X0FVWFZFQ19IICovCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9hdXh2
ZWMuaCBiL2FyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCmluZGV4IDYxMmMyYzQx
ZjYwYi4uMTMzMWFjNGQ5MzVlIDEwMDY0NAotLS0gYS9hcmNoL21pcHMvaW5jbHVkZS91YXBpL2Fz
bS9hdXh2ZWMuaAorKysgYi9hcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaApAQCAt
OSwxMiArOSwxMCBAQAogICogb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KICAqLwogCi0jaWZu
ZGVmIF9fQVNNX0FVWFZFQ19ICi0jZGVmaW5lIF9fQVNNX0FVWFZFQ19ICisjaWZuZGVmIF9fVUFQ
SV9BU01fQVVYVkVDX0gKKyNkZWZpbmUgX19VQVBJX0FTTV9BVVhWRUNfSAogCiAvKiBMb2NhdGlv
biBvZiBWRFNPIGltYWdlLiAqLwogI2RlZmluZSBBVF9TWVNJTkZPX0VIRFIJCTMzCiAKLSNkZWZp
bmUgQVRfVkVDVE9SX1NJWkVfQVJDSCAxIC8qIGVudHJpZXMgaW4gQVJDSF9ETElORk8gKi8KLQot
I2VuZGlmIC8qIF9fQVNNX0FVWFZFQ19IICovCisjZW5kaWYgLyogX19VQVBJX0FTTV9BVVhWRUNf
SCAqLwoKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
