Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE67DC4453A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nf2jf+oioXfDBGLa8Bc1u/3OLRtrYrUmnuAU6CgYmdE=; b=I2h9ICWHqy3n4i
	q+2rNnEzRck4YV2k0wq/qG1dER8uQZTKtC9ZrzwJ7nncmHkGMJadRwGi70C5uX9BO5AmT/cp4WDSz
	yzZ4l7uPqbYa6dbk7YdVuwJ4/gYKRXqBe2XkuViYjU0c2d2c087bE4Q2/QvOFSj7cmgSJs+6IBLKj
	XlCT81eFGcWeTb/p38l6aiq/h9rZ7FFn19kSAH+cvgc2om6pTkdjZCi+Mb+DzG82cMiy3iiGJpJRq
	+avGTqkZyLPYOBufVmlmoVpjQA0RHwhAqAXhE7bP2fR4F/+ej+oSmUiM34EPQqH1zWpKf6i8aETJ7
	mcsfz7iojXmzXhST3eFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSva-0000000BLBV-4BUj;
	Wed, 22 Jul 2026 09:07:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSvY-0000000BL9u-3BkS
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 09:07:46 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784711262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gh7IB1M6N9Ghw7Ou3jOSHhN9PUFNHZxKQr5j52fg6HQ=;
	b=QYO0t1wCxHJP/AmlkgK4t98FEh47TD4JhH1bteo8TIyx0jXzjEvGs4JL+p1AVGazSYCdjI
	ZmIUjOaQCHqW6VBnk8Atl4yZfM4ZPHmDcZE0YHpW3nHHems/D+3AMJWWhdtTm0Cs1ksBud
	VeEGPgE9WnSC/fw10Pgoj5pgY004SK0Sz31zy91AQ7N7csKJBpwhkIKMyxhgTkmMgJnzkz
	4sjQdz9m4u9LiyqQFa0v6Tz6oD2CsZcCxFhYLAdSdKQCVdzW5tVXMLw9qagPoh8mu0wZZx
	XRUYCyXAr/jULK0V4bkzbcvmD9AjOoHOSvWtTFZw6qSGS72MEGzWq6eonn59bg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784711262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gh7IB1M6N9Ghw7Ou3jOSHhN9PUFNHZxKQr5j52fg6HQ=;
	b=29rNHpWv/VgQZkKWb/mfZ69R6R/9UT3/61dAWfY1qLITktSaTyqWJHId4kelLik1Pushcl
	mBTCTslhr1C+ltBw==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v4 1/3] riscv: compat_vdso: switch to standard kbuild rule
Date: Wed, 22 Jul 2026 11:06:42 +0200
Message-ID: <82d1f43d6ad6a84b56e102444023ae7eee41eb13.1784710768.git.namcao@linutronix.de>
In-Reply-To: <cover.1784710768.git.namcao@linutronix.de>
References: <cover.1784710768.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_020744_946480_563D7DFA 
X-CRM114-Status: UNSURE (   8.66  )
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

VGhlIGNvbXBhdF92ZHNvIE1ha2VmaWxlIGhhcyBhIGN1c3RvbSBidWlsZCBydWxlIGZvciAqLlMg
ZmlsZXMuIFRoaXMKaXMgdW5uZWNlc3NhcnksIGFuZCBtYWtlcyBpdCBoYXJkIHRvIGV4dGVuZCB0
aGlzIE1ha2VmaWxlIHRvIHN1cHBvcnQKYnVpbGRpbmcgKi5jIGZpbGVzLgoKU3dpdGNoIHRvIHN0
YW5kYXJkIGtidWlsZCBydWxlIGluc3RlYWQuCgpSZXZpZXdlZC1ieTogVGhvbWFzIFdlacOfc2No
dWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IE5hbSBD
YW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL2NvbXBhdF92
ZHNvL01ha2VmaWxlIHwgOCArLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NvbXBhdF92
ZHNvL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvY29tcGF0X3Zkc28vTWFrZWZpbGUKaW5k
ZXggMjRlMzdkMWVmN2VjLi43ZWM5ZGQ0N2M0ZmEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NvbXBhdF92ZHNvL01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NvbXBhdF92
ZHNvL01ha2VmaWxlCkBAIC04LDcgKzgsNiBAQCBjb21wYXRfdmRzby1zeW1zICA9IHJ0X3NpZ3Jl
dHVybgogY29tcGF0X3Zkc28tc3ltcyArPSBnZXRjcHUKIGNvbXBhdF92ZHNvLXN5bXMgKz0gZmx1
c2hfaWNhY2hlCiAKLUNPTVBBVF9DQyA6PSAkKENDKQogQ09NUEFUX0xEIDo9ICQoTEQpCiAKICMg
YmludXRpbHMgMi4zNSBkb2VzIG5vdCBzdXBwb3J0IHRoZSB6aWZlbmNlaSBleHRlbnNpb24sIGJ1
dCBpbiB0aGUgSVNBCkBAIC00Myw4ICs0Miw3IEBAICQob2JqKS9jb21wYXRfdmRzby5zby5kYmc6
ICQob2JqKS9jb21wYXRfdmRzby5sZHMgJChvYmotY29tcGF0X3Zkc28pIEZPUkNFCiBMREZMQUdT
X2NvbXBhdF92ZHNvLnNvLmRiZyA9IC1zaGFyZWQgLVMgLXNvbmFtZT1saW51eC1jb21wYXRfdmRz
by5zby4xIFwKIAktLWJ1aWxkLWlkPXNoYTEgLS1oYXNoLXN0eWxlPWJvdGggLS1laC1mcmFtZS1o
ZHIKIAotJChvYmotY29tcGF0X3Zkc28pOiAlLm86ICUuUyBGT1JDRQotCSQoY2FsbCBpZl9jaGFu
Z2VkX2RlcCxjb21wYXRfdmRzb2FzKQorJChvYmotY29tcGF0X3Zkc28pOiBLQlVJTERfQUZMQUdT
ICs9ICQoQ09NUEFUX0NDX0ZMQUdTKQogCiAjIHN0cmlwIHJ1bGUgZm9yIHRoZSAuc28gZmlsZQog
JChvYmopLyUuc286IE9CSkNPUFlGTEFHUyA6PSAtUwpAQCAtNjYsNyArNjQsMyBAQCBxdWlldF9j
bWRfY29tcGF0X3Zkc29sZCA9IFZEU09MRCAgJEAKICAgICAgIGNtZF9jb21wYXRfdmRzb2xkID0g
JChDT01QQVRfTEQpICQobGRfZmxhZ3MpICQoQ09NUEFUX0xEX0ZMQUdTKSAtVCAkKGZpbHRlci1v
dXQgRk9SQ0UsJF4pIC1vICRALnRtcCAmJiBcCiAgICAgICAgICAgICAgICAgICAgJChPQkpDT1BZ
KSAkKHBhdHN1YnN0ICUsIC1HIF9fY29tcGF0X3Zkc29fJSwgJChjb21wYXRfdmRzby1zeW1zKSkg
JEAudG1wICRAICYmIFwKICAgICAgICAgICAgICAgICAgICBybSAkQC50bXAKLQotIyBhY3R1YWwg
YnVpbGQgY29tbWFuZHMKLXF1aWV0X2NtZF9jb21wYXRfdmRzb2FzID0gVkRTT0FTICAkQAotICAg
ICAgY21kX2NvbXBhdF92ZHNvYXMgPSAkKENPTVBBVF9DQykgJChhX2ZsYWdzKSAkKENPTVBBVF9D
Q19GTEFHUykgLWMgLW8gJEAgJDwKLS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
