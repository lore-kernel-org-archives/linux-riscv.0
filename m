Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334E2CF07BB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNF69SKfu66uHiA7EV4Q/wwicVD7al6LjqThEsoJIcw=; b=owPs82XDB51Krg
	iDL920JAmjNRtWgQoWMzOhZ4LcFu/P8YgEzDppKSJM/YCL/lHgEo6xDc8eqJCWEDJizc17ftryRsb
	7QwbcUVrCQC1yFiJsvcAtBnO7/hmh7zezEDeQ0qaoCcWOlYfZPV2ECZPXfk+e6MbDkdn9emihfeKH
	re8Qf3FOxiCpvFlJiJF9QIQZ7Yj6CC+94FiA2RQRtcbwsCOA+pd+zU5S2TxEkzbNWr3vtmlTD2E6c
	BOsuZkL23+DeM1R+tT2/Zpjwhc98yfqmpleTBPrssscuGU2PGQXRqzcHg0sYPbVVZQCu3tsSsqxg7
	a2udL+25kaHB5H36D8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synPa-0000000BoMg-10xA;
	Thu, 10 Oct 2024 07:16:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBg-0000000Blkg-0d4k;
	Thu, 10 Oct 2024 07:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PwmVSRYHSb9/NywpACjYo1hL5y3FHne1vH2pikuaTow=; b=UDCuD3mo3k0yT+rpfB8xopesOd
	t48M8sn3LOTlZWIGj4XHgXv5cEUB1gP/TnPPjptIHg7eYoJLOKRe9Qqiub/Vy5WVr15aXoE5l4LTd
	lNEi806thO7TpSm0DhJUyjlOSCEwivhCmIFcP+qKvJp5V5CYXpYsdfDlNpfENAW/T/sYQYJcEyKGU
	b5QpX2zAyMLR3uZrjExeDW2/cmA45PHkeAaUnjN0GCrkrK2I6gTmbFrpfWGaknop+DOdmDWSWVJzD
	IfGF9zV6IBQOC6RWD4Z9Mw6bBqreox75XGOJtcLyDUmmUH3XQwtcD9zypUEqyecWfJH6fuKdkmLNJ
	ridE1+4w==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBa-00000005Cs6-2hUi;
	Thu, 10 Oct 2024 07:02:14 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PwmVSRYHSb9/NywpACjYo1hL5y3FHne1vH2pikuaTow=;
	b=YcZEzOUdhlXiCUo9zBxtUEs1lRTFdUtoFZifHE65r17ffT91v48OykPMk0gsduWWnaXFnl
	QI4eADY1DxC1AT3lzNl8lysm9YCa7HnRo5mJcvO2W3L+xJOEvgW6fFbb2DiNKt3M/muTmI
	qVsmg5cNSfpMUhVMQ3xH4EG8d86mbmfH9NQp+zIkVfaRcEkaji8Pc2CznEzR9Buur86WOq
	DHvJY+63fQFNJ/xurgm7CZ6kF0HzLbpiK+ghx0TT/2mjVP+EeHfeboTvz4ubEdmUh3lZDp
	6/HrMR4WkAOYEwuxVs9iRv2xO7Rly29CgjXTkxYlkeAItbnYdrzryLbyddjlGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PwmVSRYHSb9/NywpACjYo1hL5y3FHne1vH2pikuaTow=;
	b=iyMEQhcf2QKpwhtXbu94btRjqz9d7oSo3Oe/vNDfj7ibZpre7LVj0Tw7sOLjCRJ54vanch
	RAVT0BDFlUfpQxCA==
Date: Thu, 10 Oct 2024 09:01:14 +0200
Subject: [PATCH 12/28] x86: vdso: Place vdso_data at beginning of vvar page
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-12-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1094;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=26zrKbXgaegtQRF54QahNJ7RqrsVomxOEoCs/TkZNvU=;
 b=cYpXZmqDh/Rorow/qfQz39qv6eqMnL/Rmdtt5VCTnsFoAYqSwN0e1dWkEh7d9D9sfDeqwtaYF
 jcGpydVABZ8Av8SYTSumXQRs9n9uAnjOWL/Jc4Q1I+J59hCir5Y9t1C
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080210_931730_AB20AE24 
X-CRM114-Status: GOOD (  10.42  )
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

VGhlIG9mZnNldCBvZiB0aGUgdmRzb19kYXRhIG9ubHkgaGFzIGhpc3RvcmljIHJlYXNvbnMsIGFz
IGJhY2sgdGhlbgpvdGhlciB2dmFycyBhbHNvIGV4aXN0ZWQgYW5kIG9mZnNldCAwIHdhcyBhbHJl
YWR5IHVzZWQuCihTZWUgY29tbWl0IDhjNDlkOWE3NGJhYyAoIng4Ni02NDogQ2xlYW4gdXAgdmRz
by9rZXJuZWwgc2hhcmVkIHZhcmlhYmxlcyIpKQpPdmVyIHRpbWUgbW9zdCBvdGhlciB2dmFycyBn
b3QgcmVtb3ZlZCBhbmQgb2Zmc2V0IDAgaXMgZnJlZSBhZ2Fpbi4KCk1vdmluZyB2ZHNvX2RhdGEg
dG8gdGhlIGJlZ2lubmluZyBvZiB0aGUgdnZhciBwYWdlIGFsaWducyB4ODYgd2l0aCBvdGhlcgph
cmNoaXRlY3R1cmVzIGFuZCBvcGVucyB1cCB0aGUgd2F5IGZvciB0aGUgcmVtb3ZhbCBvZiB0aGUg
Y3VzdG9tIHg4Ngp2dmFyIG1hY2hpbmVyeS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3Nj
aHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gveDg2L2luY2x1
ZGUvYXNtL3Z2YXIuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Z2YXIuaCBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3Z2YXIuaAppbmRleCA5ZDlhZjM3ZjdjYWI5ZTNlNjE1OWMwYjc1
OGU1MDBkZGNmYzZiM2U4Li4wMWU2MGUwZjY3MWU5NjI1NjY5ZGM4ZmRhY2YzY2RkZGY4Y2JmNGZi
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92dmFyLmgKKysrIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20vdnZhci5oCkBAIC01OCw3ICs1OCw3IEBAIGV4dGVybiBjaGFyIF9fdnZhcl9w
YWdlOwogCiAvKiBERUNMQVJFX1ZWQVIob2Zmc2V0LCB0eXBlLCBuYW1lKSAqLwogCi1ERUNMQVJF
X1ZWQVIoMTI4LCBzdHJ1Y3QgdmRzb19kYXRhLCBfdmRzb19kYXRhKQorREVDTEFSRV9WVkFSKDAs
IHN0cnVjdCB2ZHNvX2RhdGEsIF92ZHNvX2RhdGEpCiAKICNpZiAhZGVmaW5lZChfU0lOR0xFX0RB
VEEpCiAjZGVmaW5lIF9TSU5HTEVfREFUQQoKLS0gCjIuNDcuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
