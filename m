Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16754E9B371
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhuKe+AbqHg9AzNae98p9J5hCjCSJaHywstRL/tFek4=; b=ZdlZRd3HTMLHOu
	S11ZNPSlY+6hrf7wBQ73yxlNWpceF/lgCkgFWeDXDfq046D1/9+WH+hk+ZToKqJ7nPWSb8Ni3I/tP
	gIkWo322+5pWz3oltqCf3sI9ids+NShA0B+z/EnM0WeP1UcQ/34qMy0X+2b3QWdmKgufC4dzIInMY
	Bwz5RWkkq2Djgq6x8qUyPB4hH1CXoUe+lEpDjRPa+zeO2ht3MF6OT0eLExGZIO+W01T6OwFrSQOwE
	iuBnkqp+PucmcUtU5r3OPXeB/2P+h0Cq/gVtrxpdygmkHOkrx0Ae3lOD9cDPnAFCLdR12Ps+0SD7M
	/A78YHXvCW/z4RMS9mtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2M0-0000000Cwv6-07gr;
	Mon, 02 Mar 2026 12:26:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LT-0000000CvvS-0PzA;
	Mon, 02 Mar 2026 12:25:56 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gk+DNY1FnX2Is9++3W7weFVsUWOyhOhif2Eu1mxTHc8=;
	b=bjv0a6y3jCZ57+M0uFA88aCV5qSJ4Nd0obqTh1cZRZ6IaeWWNg/CTFwcAHwXw//lfMMUVu
	m1Mpa8otbmrWDJUuqL59FPydBljYCAaaGVif88nsL7FmUoVnPZ45eBu/dbmrRuw0f6Yo6w
	v9eNArcvNvWsTi5mM3dGszF37CncJy76utUKDIR7HGZiggCkaqipBC1lZDaBI2haLxXiKZ
	M35kORuqVQt+esRy8qf4cdpa+eJ/GDFoQkajHSv+QyO+Ky0KkAVVx8uVkOXMDX0AEguZXr
	nuJHkW7DK+/9SJ98zVgc7fjaR+AC8titmzEOvetbJ5VW1vSlFpSMgU0fO2yfFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gk+DNY1FnX2Is9++3W7weFVsUWOyhOhif2Eu1mxTHc8=;
	b=BYfC3Fegaop1FFBF9oem1OjAUVs0XyTKiFOs56Iip+kmC013SL48mBu/X4JFdKO5qcaRVH
	9OQ9T+TEdCCCwCCw==
Date: Mon, 02 Mar 2026 13:25:39 +0100
Subject: [PATCH 15/15] auxvec.h: Drop fallback AT_VECTOR_SIZE_ARCH
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-15-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=730;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3SgKzX2uaURwdk6BulOU26vMp194sxSrGIKk7+4gH+o=;
 b=vht2sJN2rUis/ZgzV++4P2sJ59ygy9DcT8yNfNbBA9oZ/PokJlfDEb+BAVSUMWrI8Um52Kvy2
 /R46rtq58zdC0ybNyXouxNGCbUYsNmMjl7tobyboz5eg/Pw0p7lpe82
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042555_297009_253561D3 
X-CRM114-Status: UNSURE (   7.27  )
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

QWxsIGFzbSBoZWFkZXJzIG5vdyBkZWZpbmUgdGhpcyBjb25zdGFudC4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0K
IGluY2x1ZGUvbGludXgvYXV4dmVjLmggfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYXV4dmVjLmggYi9pbmNsdWRlL2xp
bnV4L2F1eHZlYy5oCmluZGV4IDY4YzlkNmIxMThhOS4uODE0Zjk4NDcyNmQ2IDEwMDY0NAotLS0g
YS9pbmNsdWRlL2xpbnV4L2F1eHZlYy5oCisrKyBiL2luY2x1ZGUvbGludXgvYXV4dmVjLmgKQEAg
LTksMTAgKzksNiBAQAogI2RlZmluZSBBVF9WRUNUT1JfU0laRV9CQVNFIDIyIC8qIE5FV19BVVhf
RU5UIGVudHJpZXMgaW4gYXV4aWxpYXJ5IHRhYmxlICovCiAgIC8qIG51bWJlciBvZiAiI2RlZmlu
ZSBBVF8uKiIgYWJvdmUsIG1pbnVzIHtBVF9OVUxMLCBBVF9JR05PUkUsIEFUX05PVEVMRn0gKi8K
IAotI2lmbmRlZiBBVF9WRUNUT1JfU0laRV9BUkNICi0jZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FS
Q0ggMAotI2VuZGlmCi0KICNkZWZpbmUgQVRfVkVDVE9SX1NJWkUgKDIqKEFUX1ZFQ1RPUl9TSVpF
X0FSQ0ggKyBBVF9WRUNUT1JfU0laRV9CQVNFICsgMSkpCiAKICNlbmRpZiAvKiBfTElOVVhfQVVY
VkVDX0ggKi8KCi0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
