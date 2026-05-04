Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE15CCD3423
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 06:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NPRUscWRA+9b22/pCNUPlredtWEGRScRG+mUx77eYXI=; b=GP4hWye7AphS4Z
	lCFs+HlyTuTTDB0cqT4JcdJKaD5aZHazYX6DJVFe/2YxYmyFbVQVZYDMWbdJZSMI98uGg+5c8DiZv
	Ft/HncMJzWxolkktTmseGZ5z/Pil/SFREwyO8WOM9KJ0pyhVmGZbF/RLNqEpmE/eslHWwitm1IoAG
	ZijMLB8+MKjWGmYWlBSnbtoenK2Ahmt31YAWFvS1cNztA8S3jLQXJefTkhZye2NuMl9cmmDk1pD3n
	g2HT/X/A8ipfCpzKcqcqqvM8gqVu8GX807eqOGP24sKB1n5mQdzBWO47vwQRgpw7D2joXa0BKv/M9
	SBPyuY5dx3eNCD3xeW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmpX-0000000CVgj-2OLU;
	Mon, 04 May 2026 06:30:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmpV-0000000CVf3-3Tbd
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 06:30:59 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777876253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+c0qVAoWFa4KFso8EuNbFxUDtnlXBlQpaGboBp9vIik=;
	b=h6CczZuK8W9cQVKAxhffUTjyqCHqUcrWQYm7i7B1ySgQTYG7ivP0sA2iC+jyZXyLbIppyS
	wWR1xkNOvvaCjEDn7Es8E8w+MdJXi1+yAa673+uyZ9K2cpxN3rAwc+7lXklQfcf0szwEWJ
	C+AzW4WHw+Eqv2BemeFY0pNAzE0dD3g5u/wN/Z5CILU6t61Ke/5NWSjHwUXV2wHPITqBq9
	OuE1qXUt/tDR0OaaxRuU+1DyOk224sayOYQ5CFQtcBpFdhhPOtxdMs9WrofPW5hDZc8RtZ
	k6pzTuq17W43+MGuBB1jzzvMhao0d9NMiOdAXodqexQZd7MfTtxoeQ+WD6mfKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777876253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+c0qVAoWFa4KFso8EuNbFxUDtnlXBlQpaGboBp9vIik=;
	b=Tl7Xxk6p0jujQUEO4gdAfBOmpush3FsHnYGuKjRkPdmr2F4E7qwrSzAPfWbnDfMgKomJfN
	FgPmBQWnTpx4ITAA==
Subject: [PATCH 0/4] riscv: alternative: Also patch the CFI vDSO
Date: Mon, 04 May 2026 08:30:49 +0200
Message-Id: <20260504-riscv-cfi-vdso-alternative-v1-0-bcdf3d37f62e@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAwA0F+RnBewRTbdr4wdQhpnQKokUoTiv
 1t2fJdXwcVUHN5dBZOirltuCI8OeKH8E9TUDLGPz36II5o6F+RZsSTfkNZDLNOhRfCVRkqBAse
 JoQW7yaznP/98r+sGXb5HD2wAAAA=
X-Change-ID: 20260428-riscv-cfi-vdso-alternative-7d8ad1a1c29c
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Deepak Gupta <debug@rivosinc.com>, Charles Mirabile <cmirabil@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777876252; l=1012;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=TqZYqBj240lrLb5E2Lw/isoRM/VIluupYFm+On3Esyw=;
 b=2F8N71WowGJYdRXnwZRcgI9xOFRSrqXcBoUW96g8Ye2NX/l+yUWpvZgOdET8f13TLPMMHEnG9
 Nu7hBT1qlhwAEKHkBi5+yZNTsY1u90oQja59qQ0Yb+2F9uBlnUrVGI3
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_233058_017710_61708F8D 
X-CRM114-Status: UNSURE (   4.57  )
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

VGhlIGRlZGljYXRlZCB2RFNPIGZvciBDRkktZW5hYmxlZCB1c2Vyc3BhY2UgY2FuIGFsc28gY29u
dGFpbgphbHRlcm5hdGl2ZSBlbnRyaWVzLgoKSXQgc2VlbXMgdGhlIHZEU08gYWx0ZXJuYXRpdmUg
cGF0Y2hpbmcgaXMgYWN0dWFsbHkgZGVhZCBjb2RlIHNpbmNlCmNvbW1pdCAwYjFkNjBkNmRkOWUg
KCJyaXNjdjogRml4IGJ1aWxkIHdpdGgKQ09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpFPXkiKS4g
SG93ZXZlciBuZXcgdXNhZ2VzIHdpbGwgYmUgYWRkZWQgCnNvb25pc2guCgpTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0t
ClRob21hcyBXZWnDn3NjaHVoICg0KToKICAgICAgcmlzY3Y6IHZkc286IEFsd2F5cyBkZWNsYXJl
IHZkc29fc3RhcnQgc3ltYm9scwogICAgICByaXNjdjogYWx0ZXJuYXRpdmU6IFVzZSBJU19FTkFC
TEVEKCkgb3ZlciBpZmRlZmZlcnkgZm9yIGFwcGx5X3Zkc29fYWx0ZXJuYXRpdmVzKCkKICAgICAg
cmlzY3Y6IGFsdGVybmF0aXZlOiBQYXNzIHZEU08gc3RhcnQgYXMgcGFyYW1ldGVyIHRvIGFwcGx5
X3Zkc29fYWx0ZXJuYXRpdmVzKCkKICAgICAgcmlzY3Y6IGFsdGVybmF0aXZlOiBBbHNvIHBhdGNo
IHRoZSBDRkkgdkRTTwoKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby5oICAgfCAxMCArKysr
Ky0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jIHwgMTQgKysrKysrKy0tLS0t
LS0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCi0t
LQpiYXNlLWNvbW1pdDogMjU0ZjQ5NjM0ZWUxNmE3MzExNzRkMmFlMzRiYzUwYmQ1ZjQ1ZTczMQpj
aGFuZ2UtaWQ6IDIwMjYwNDI4LXJpc2N2LWNmaS12ZHNvLWFsdGVybmF0aXZlLTdkOGFkMWExYzI5
YwoKQmVzdCByZWdhcmRzLAotLSAgClRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
