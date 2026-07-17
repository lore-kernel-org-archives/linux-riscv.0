Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5473EC44507
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 06:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uN63po2aQoiad8YaPSKit+8QGKU4CaduAoO9bxnOhro=; b=P2um3hxzeumKsC
	r0llHWizTaIQeUa5yccNCfXipcIHNcSIzjN4nwYo/he44fjiqvJRi7cVLIeviM+RbTbfVeiG51fYn
	4/961LWPM4UJoZtVczwL2tY4Lkd/JsER0f0cpjQUqQy9VKMfcxCPPrK6nwN4gU5HracodXUWY8sP7
	/+Z4uf5ozt5YXXK04BHWbYEJAEdg+ak30wEzVQEx4I0CWQBiKBiuyiFmEQyjCTKUsnZG/osluiHbK
	DIMEjlUQN4KBhFtVIC03m5ziHrBJE4BsLKF4IrF1bxPsoliTEYqNe7Xa80g7PD7/3giHj8AYdgp3s
	WvnV7iuP8hYCrpUNV+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbr6-00000001E1l-3GPM;
	Fri, 17 Jul 2026 06:15:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbqx-00000001Dtu-0pVV;
	Fri, 17 Jul 2026 06:15:20 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784268901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=ovjYqPfP49nfKV50tUridaUCmN2wEut8eA8C8vu1HpUDDDG4MKVHrU+TXQvRmHTHW/SZG9
	eBN4eN4cj8OOVwsHfa7RzuAN+xk7krnjKS5R+GB1U3UxER99/Eqb1/ZtQgpHkjTVKVWXUx
	6hNRIh6jvfY2o+Tys7CVxCKW9AjEmKTLZMeK7CIPuXd3YnXe12XnfHniJ6ECaxNzycCOsb
	NVYeZ3UvZzPN8GQ73OQ/rjH0KM3zUS0Xr5Mb1wLpmkM5S5XGbOO9e2Co0c+UZR21PGGTH0
	qM5qhKiWB6+VgQ1nxscWhy9jyFC5VfsKAWTvv53Q+rGOpW9cpcD9ssalzRtHIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784268901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=r4tWelhaNShXcQKY3JDouYaui2eyhEbnWAbHyyJe+5Jr4uhktzkJdfKjWxywa+MG1Bb1hX
	dMs3a1rcRJ+vIyBA==
Date: Fri, 17 Jul 2026 08:14:47 +0200
Subject: [PATCH v2 3/7] MIPS: csrc-r4k: Remove CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery
MIME-Version: 1.0
Message-Id: <20260717-vdso-arch-clockmodes-v2-3-756f5a5d1467@linutronix.de>
References: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
In-Reply-To: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784268894; l=1015;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=t3APLy9t2SZVxR8iClS2KaGCf82ju0LDxr/0aH1HIvc=;
 b=xI8NbmAXSs8ogUaOoFJQHyozFpyiKZY+gTXc6elvzxJ/8aAMz++2OBYOxxmDzQezptzAU4LCo
 C3mfof7qJeGDv8TsxQP4KGhrtSCFjQ1QLt4BHVyXQNIUkV1JNwmDam6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_231519_389055_FF860306 
X-CRM114-Status: UNSURE (   7.44  )
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

Tm93IHRoYXQgdGhlcmUgaXMgYSBkZWZpbml0aW9uIG9mIFZEU09fQ0xPQ0tNT0RFX1I0SyBldmVu
IGlmIG5vCnZEU08gaXMgYnVpbHQsIHRoZSB1Z2x5IGlmZGVmZmVyeSBjYW4gYmUgcmVtb3ZlZC4K
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51
dHJvbml4LmRlPgotLS0KIGFyY2gvbWlwcy9rZXJuZWwvY3NyYy1yNGsuYyB8IDIgLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rZXJuZWwv
Y3NyYy1yNGsuYyBiL2FyY2gvbWlwcy9rZXJuZWwvY3NyYy1yNGsuYwppbmRleCAyNDFhOTM0NTQz
YTguLjU5ZWNhMzk3ZjI5NyAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2tlcm5lbC9jc3JjLXI0ay5j
CisrKyBiL2FyY2gvbWlwcy9rZXJuZWwvY3NyYy1yNGsuYwpAQCAtMTI2LDE0ICsxMjYsMTIgQEAg
aW50IF9faW5pdCBpbml0X3I0a19jbG9ja3NvdXJjZSh2b2lkKQogCWNsb2Nrc291cmNlX21pcHMu
cmF0aW5nID0gMjAwOwogCWNsb2Nrc291cmNlX21pcHMucmF0aW5nICs9IGNsYW1wKG1pcHNfaHB0
X2ZyZXF1ZW5jeSAvIDEwMDAwMDAwLCAwLCA5OSk7CiAKLSNpZmRlZiBDT05GSUdfR0VORVJJQ19H
RVRUSU1FT0ZEQVkKIAkvKgogCSAqIFIyIG9ud2FyZHMgbWFrZXMgdGhlIGNvdW50IGFjY2Vzc2li
bGUgdG8gdXNlciBtb2RlIHNvIGl0IGNhbiBiZSB1c2VkCiAJICogYnkgdGhlIFZEU08gKEhXUkVu
YSBpcyBjb25maWd1cmVkIGJ5IGNvbmZpZ3VyZV9od3JlbmEoKSkuCiAJICovCiAJaWYgKGNwdV9o
YXNfbWlwc19yMl9yNiAmJiByZGh3cl9jb3VudF91c2FibGUoKSkKIAkJY2xvY2tzb3VyY2VfbWlw
cy52ZHNvX2Nsb2NrX21vZGUgPSBWRFNPX0NMT0NLTU9ERV9SNEs7Ci0jZW5kaWYKIAogCWNsb2Nr
c291cmNlX3JlZ2lzdGVyX2h6KCZjbG9ja3NvdXJjZV9taXBzLCBtaXBzX2hwdF9mcmVxdWVuY3kp
OwogCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
