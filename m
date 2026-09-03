Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7AAC79F80
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0w/2P8si8X2ndA93OD6dN7veg6drWn55DdGD7cw0UkQ=; b=rxOFAwCExmN/Qj
	1JS7i0X22yKKDYpQAenJvj7LKXoPlGj1SfA72kqXSJKl8CLPdMFCeQLem4zRaRsv3nLFiGrzi+CVP
	iAifo7+ipr4kdBz1XHy81q4dU0x19UuEkmbNuF5UsvP9RjZE8+ZNA6jPOya2/xMJj4SNbbwTzYsb6
	qA3ZKfGmcwe3lhwFgxbqaQzkNnIq/+F9lXeeYx41xvLx5XOulHNiExoGvL1nEq6ffenBiHtDph0r4
	nfNbKr1apTljxxs2nn9csAH3JjIHTPZ2bjCz6Vd2M8LbdAnRZj6xCvuobqbg1UskUZuClIDS6RXbT
	KW5jxlhscnG4EYgv/V5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224t-0000000Gcxw-2Z0H;
	Thu, 03 Sep 2026 07:41:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224m-0000000GckX-1yhA;
	Thu, 03 Sep 2026 07:41:37 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ki6vCDtSsDDzCEZI/NcbNJ3KgWETZe+Z10mKdQ4zEk=;
	b=JRAktFNXxfqlu91+k0T2FMDT4dsLDIeVGQryd6RNRQsuL46sy/f9GL5vDjkZKQ30As6CcG
	y4jIxtHNpGkyX+UhGpiNboqpvEodSBecEITblgygLwQokeFFzkr4Ll4/Kox4gQrXToVFIp
	kon8oSRUeQS9RYhfREsXXYvbviB3VOFMEYbPe44WYPcSnEZuE7YOVTEGDeSAcTLSfytBB2
	JOTRwiImSbzXdhs1ON3fmLAM3LhOaWZKK8smMIzsqPrz2JndfdBbQN+CbPhNhe8sM/Iz6b
	eANcYhOIf4zoYbsM667zurVliaQFBYG8cKeHkcXVNim7ooOJoagfrjvMhfBmMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ki6vCDtSsDDzCEZI/NcbNJ3KgWETZe+Z10mKdQ4zEk=;
	b=rK84N3JlIpaV6T1bzwKE39uGn8xsTCz7f8WrxvWFFv+kVDj8BN/3RvEkemb1aT2Nkwh7du
	noB85/lLZP64wTAg==
Date: Thu, 03 Sep 2026 09:41:22 +0200
Subject: [PATCH v2 07/15] RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-7-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Andy Chiu <andybnac@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1597;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0OrggZCxf341yuayoYgLFkIud/BbXPm8wUo8eswQB68=;
 b=zhOmyJcp+hUlpRYlMOMkNTdyZ8WTdo37I7acj8KYZ6OLWoNxxSsviLjOF6r/Sk08e+CLGGGht
 PvbTNZ2WTwDAQepQqfT+Q6q1+uLkzHf02DaJ7pId4DOxwMaHCCDF5eb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004136_706378_0B94CDEC 
X-CRM114-Status: GOOD (  12.59  )
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
b25peC5kZT4KQWNrZWQtYnk6IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPiAjIGFyY2gv
cmlzY3YKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keWJuYWNAZ21haWwuY29tPgpSZXZpZXdl
ZC1ieTogS2VlcyBDb29rIDxrZWVzQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9hdXh2ZWMuaCAgICAgIHwgMTMgKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2F1eHZlYy5oIHwgIDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2F1eHZlYy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hdXh2ZWMuaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmZiNDIzMzQ0NTI3NgotLS0gL2Rldi9udWxsCisr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXV4dmVjLmgKQEAgLTAsMCArMSwxMyBAQAorLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLworLyoKKyAqIENvcHlyaWdo
dCAoQykgMjAxMiBBUk0gTHRkLgorICogQ29weXJpZ2h0IChDKSAyMDE1IFJlZ2VudHMgb2YgdGhl
IFVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYQorICovCisKKyNpZm5kZWYgX0FTTV9SSVNDVl9BVVhW
RUNfSAorI2RlZmluZSBfQVNNX1JJU0NWX0FVWFZFQ19ICisKKy8qIGVudHJpZXMgaW4gQVJDSF9E
TElORk8gKi8KKyNkZWZpbmUgQVRfVkVDVE9SX1NJWkVfQVJDSAkxMAorCisjZW5kaWYgLyogX1VB
UElfQVNNX1JJU0NWX0FVWFZFQ19IICovCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20vYXV4dmVjLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgK
aW5kZXggOTUwNTBlYmU5YWQwLi4wYTcyNWYyYWEyZTcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vYXV4dmVjLmgKQEAgLTMzLDggKzMzLDYgQEAKICNkZWZpbmUgQVRfTDNfQ0FDSEVTSVpFCQk0
NgogI2RlZmluZSBBVF9MM19DQUNIRUdFT01FVFJZCTQ3CiAKLS8qIGVudHJpZXMgaW4gQVJDSF9E
TElORk8gKi8KLSNkZWZpbmUgQVRfVkVDVE9SX1NJWkVfQVJDSAkxMAogI2RlZmluZSBBVF9NSU5T
SUdTVEtTWgkJNTEKIAogI2VuZGlmIC8qIF9VQVBJX0FTTV9SSVNDVl9BVVhWRUNfSCAqLwoKLS0g
CjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
