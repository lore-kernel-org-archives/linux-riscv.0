Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B94DCD4F54
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 06:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcJTMhc2VND1HpTTAhcw3M0mYu4PufhRuP4HbcvXuD8=; b=Qq6GS5AXWkRzv0
	d4E0rOQndxwSkePhM4lQTp+Yixus9mq8KMUXwPvTDDsIteCMnJcYdelUYzLIigTXn72/z5rg/QRom
	+zXrI+A0C3fmlBHHgW2liV6b86mWB7RTtPeWdkbb6XX7WxElppATcBQlfXE6ytlt7P3jDG1EzbOGM
	71vL+rk3FrWkyKmVdVZSye2Vzg4uL6udFCtMCxszQaOV8egQJRGkb6/eK/IlTiXooDwjNLkWeFgGG
	FGTcSQGi+9TxPCAtV139gU9Qo6lBX9LddFkQbbnb6W6GiANl4U2GUAnCHa8R1wJGN0DISq3CTEV4n
	T5GCoEioYUZGTeklAt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDuQ-00000000KJ7-0ewp;
	Tue, 19 May 2026 06:26:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDuN-00000000KGm-0PJS
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 06:26:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779171982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xLjfGtVWTP/jP06ir3iIpg5fglsNUDnu6MjLrFOCek=;
	b=2fbtoQi5mdGSqDr44MS8z9Norr3OTPW3OudHn96PVkqdFuSIDvRsKpDbS1d1KbT6NT1enh
	z1s+2RnwTrDt2DeIyPgWZVT6WvIn2siostmAxqUxrVzyWvAVyLXOyOwRQu7LmhZjaoPZBA
	drDxRzlTdXzwLcTKFvjID1s2aYDXTROcY7VW+TkXrMo0LyKhUHTuV+8YuLSEjCYx+rmIHE
	8ZHHuv32X3FOe64iQI9AVZ+wBiEEBy01EZFTTy3WZ9vXQFX/76C9zMtWfVBZa7iVoP3qqX
	WKUlXDd+rGhO2YTZuPng5oMHHf1tgmEeY+J84VhQbvh0NkMjY0xwRAcKqZEiGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779171982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xLjfGtVWTP/jP06ir3iIpg5fglsNUDnu6MjLrFOCek=;
	b=bL6wUB/4Hd8kvAlLRNepQefsxOoPDTO4q3RRFyWmSsTG/i6Psrj72gIEnPQ4JZxUPNpOVq
	zL518YFfwQx4v0AA==
Date: Tue, 19 May 2026 08:26:15 +0200
Subject: [PATCH 1/3] riscv: vdso: Drop CONFIG_GENERIC_TIME_VSYSCALL guard
 around syscall fallbacks
MIME-Version: 1.0
Message-Id: <20260519-vdso-generic_time_vsyscal-v1-1-5c2a5905d5f5@linutronix.de>
References: <20260519-vdso-generic_time_vsyscal-v1-0-5c2a5905d5f5@linutronix.de>
In-Reply-To: <20260519-vdso-generic_time_vsyscal-v1-0-5c2a5905d5f5@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171981; l=1441;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZbWFZhlWoxFG7qvAWI/1cX8V/PeZKphHdM2SPXvo1Ww=;
 b=c8bRXivueKRJj6uY0/+Eddj17oybdxj5UzeGhcA73CYNd5Y5KEMtvi+Xf/93pnhR8SMcnL0Mx
 mTeP4/9Y10aB8fna2xLv62lq9aJuDoPdZLHFjueZFOSsT8MfNJe9Rd6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_232627_272806_4C960714 
X-CRM114-Status: UNSURE (   7.52  )
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

VGhlIHN5c2NhbGwgZGVmaW5pdGlvbnMgY2FuIGJlIGJ1aWx0IGp1c3QgZmluZSBmb3IgMzItYml0
IHN5c3RlbXMuCkFsc28gdGhlIGd1YXJkIGRvZXMgbm90IGNvdmVyIF9fYXJjaF9nZXRfaHdfY291
bnRlcigpIHdoaWNoIGlzIGFsd2F5cwp1c2VkIHRvZ2V0aGVyIHdpdGggdGhvc2Ugc3lzdGVtIGNh
bGwgZmFsbGJhY2tzLiBBbHNvIHRoaXMgaGVhZGVyIGlzCnVudXNlZCB3aGVuIG5vIHZEU08gaXMg
YnVpbHQgYW55d2F5cy4KCkRyb3AgdGhlIGlmZGVmZmVyeS4gVGhlIGxvZ2ljIHdpbGwgYmUgc2lt
cGxlciB0byB1bmRlcnN0YW5kLiBGdXJ0aGVybW9yZQp0aGlzIHByZXBhcmVzIHRoZSBjb21wbGV0
ZSByZW1vdmFsIG9mIENPTkZJR19HRU5FUklDX1RJTUVfVlNZU0NBTEwuCgpTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0t
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmggfCA4IC0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3Zkc28vZ2V0dGltZW9mZGF5LmgKaW5kZXggOWVjMDhmYTA0ZDM1Li42MWNiM2NiYWIxNDMgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaAorKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmgKQEAgLTksMTIgKzks
NiBAQAogI2luY2x1ZGUgPGFzbS9jc3IuaD4KICNpbmNsdWRlIDx1YXBpL2xpbnV4L3RpbWUuaD4K
IAotLyoKLSAqIDMyLWJpdCBsYW5kIGlzIGxhY2tpbmcgZ2VuZXJpYyB0aW1lIHZzeXNjYWxscyBh
cyB3ZWxsIGFzIHRoZSBsZWdhY3kgMzItYml0Ci0gKiB0aW1lIHN5c2NhbGxzIGxpa2UgZ2V0dGlt
ZW9mZGF5LiBTa2lwIHRoZXNlIGRlZmluaXRpb25zIHNpbmNlIG9uIDMyLWJpdC4KLSAqLwotI2lm
ZGVmIENPTkZJR19HRU5FUklDX1RJTUVfVlNZU0NBTEwKLQogI2RlZmluZSBWRFNPX0hBU19DTE9D
S19HRVRSRVMJMQogCiBzdGF0aWMgX19hbHdheXNfaW5saW5lCkBAIC02Niw4ICs2MCw2IEBAIGlu
dCBjbG9ja19nZXRyZXNfZmFsbGJhY2soY2xvY2tpZF90IF9jbGtpZCwgc3RydWN0IF9fa2VybmVs
X3RpbWVzcGVjICpfdHMpCiAJcmV0dXJuIHJldDsKIH0KIAotI2VuZGlmIC8qIENPTkZJR19HRU5F
UklDX1RJTUVfVlNZU0NBTEwgKi8KLQogc3RhdGljIF9fYWx3YXlzX2lubGluZSB1NjQgX19hcmNo
X2dldF9od19jb3VudGVyKHMzMiBjbG9ja19tb2RlLAogCQkJCQkJIGNvbnN0IHN0cnVjdCB2ZHNv
X3RpbWVfZGF0YSAqdmQpCiB7CgotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
