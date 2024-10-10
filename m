Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA11CF07BA
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pk/x8DrjqkiS8BK3pMikhi4gBuzNio36GzCcd7sOlhg=; b=YbX5zNDPllCyTM
	G7aZVYc1xWwkAFXR/c0TaJPGqzL/yu+2v1KWtoDE4CU4g6xGXVagJxfZ9qMPk8fF/kI10AzvqPuvb
	O3H96vMaxeZm7dMfr9KfQmvYhjubqs/68K4/ogKd1S/DI8JPG3lM8lXyPm9EjMb7Nk253Okn9trD0
	JfIZWeyIC+5tMBQPSYDuOCPWwqaVEQ7UZYVKrXoDN5Ht4LfMax0taAiUC9+uXKBB6ypjZDnmuNxjm
	iGSR2sNqpzzkoEl8VDDq9803qpri1s9aFVNSF/KOlFC87eJtx4Waio7pBQ23r5wmzG+r5qoVtQBOe
	2WxINndZnMQU9PJtI7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synd6-0000000Bq6y-0cnj;
	Thu, 10 Oct 2024 07:30:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBl-0000000Blol-34PA;
	Thu, 10 Oct 2024 07:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pTDHXF1sOudHK9HTgJ3ZTP/z4LvNJlDw5+zHCbtMvNM=; b=ByykMDX+1at8+idMD2TY7EzZq7
	TC0yh6tSBUj9J0ypf6nZgNQfU52PgRUTlkVrIynHVNynkfQbHokCZEeYueDe5HnXPIUHlrpKgoM9C
	iyEaDFGKtJt2zuEqX/CHBC/90cuLm7B4ygZjj3k1SPXvzFd/W0SaeZ7UMghnzzmTAU+V3Wnog6n0u
	9aV8x7d7erwQRRRMA6p/Zb/tmZ1m+kpxC8M2YwfQpXwfvolr9ALY1yjI6NO7GH1csngTJn+hj5JHs
	dZXzrHZASjhrGpxfXrsniuyGq2a5Amu8HIfwV1sP6eIHljzuHp6JmJsjUl9vWeZrs+7gibhx2udWa
	HQfBB20g==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBf-00000005Cwk-2DDK;
	Thu, 10 Oct 2024 07:02:20 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pTDHXF1sOudHK9HTgJ3ZTP/z4LvNJlDw5+zHCbtMvNM=;
	b=IXPj8BsBAaBJJo6BSnCng0U9zvdKWSexCp/crIPo01FLTZ3KLknEHD05xs2zGGyyGEwG6A
	hIbbfRja/Dcy7E/Zvjjx7Xi96P8RkS17Lxa+cdFgxgcti2TkPG/Ec4ZyTTN71dMn7D2iFS
	HqKrDqHpAf+mtMU37wFllkN+XvVj1lDsK5Eb4knhaA7ilJjK2YoCbJzSh8V8i/byIXNRei
	GbwHMWUiZoKERjEuK9GqCNMuQuSx3XNpX8Ss9WMBVkLa/2PiIXcqweN9EDkMW7pqswVMqo
	oGYnunOLuA9mjVGKNNd3lYgB4h3K5umej4H4/6vuZnbO905CmaX6tCzcHXmm7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pTDHXF1sOudHK9HTgJ3ZTP/z4LvNJlDw5+zHCbtMvNM=;
	b=/pXZLgo9teG+rpHkWGFQdrgLKaFfaO3Fy4aaVilmn7MMBZyqnuuk0hC/lmBDVh98h1zpkr
	xDB7CM44QmWupDDw==
Date: Thu, 10 Oct 2024 09:01:21 +0200
Subject: [PATCH 19/28] x86: vdso: Delete vvar.h
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-19-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2578;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=GYrZ3540s+yI5XrDQH6lzPIgpeuMXgvmbbzBwr4UTdY=;
 b=cNDbhwtIfZQJl4q90Ucvyl7QhSMhfxxnVr9lAnUgI3D3zJ3nXxxrBLs/Lik9O3tOnAZKXtlXH
 m/pkG9UlHaICKCxx+pnrXebwBNjf8QJF5447iEn5RV+2yQ7yg/FWVsi
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080215_732932_FFC7B791 
X-CRM114-Status: GOOD (  10.78  )
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

QWxsIHVzZXJzIGhhdmUgYmVlbiByZW1vdmVkLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOf
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC94ODYvaW5j
bHVkZS9hc20vdnZhci5oIHwgNjYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNjYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYvaW5jbHVkZS9hc20vdnZhci5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vdnZhci5o
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBkOTVjZjkyMjk2ZWY2YWNmNjYwODlhNzM0
NDY1ZWRhNGNiYTkxNTRjLi4wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Z2YXIuaAorKysgL2Rldi9udWxsCkBAIC0xLDY2
ICswLDAgQEAKLS8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8KLS8q
Ci0gKiB2dmFyLmg6IFNoYXJlZCB2RFNPL2tlcm5lbCB2YXJpYWJsZSBkZWNsYXJhdGlvbnMKLSAq
IENvcHlyaWdodCAoYykgMjAxMSBBbmR5IEx1dG9taXJza2kKLSAqCi0gKiBBIGhhbmRmdWwgb2Yg
dmFyaWFibGVzIGFyZSBhY2Nlc3NpYmxlIChyZWFkLW9ubHkpIGZyb20gdXNlcnNwYWNlCi0gKiBj
b2RlIGluIHRoZSB2c3lzY2FsbCBwYWdlIGFuZCB0aGUgdmRzby4gIFRoZXkgYXJlIGRlY2xhcmVk
IGhlcmUuCi0gKiBTb21lIG90aGVyIGZpbGUgbXVzdCBkZWZpbmUgdGhlbSB3aXRoIERFRklORV9W
VkFSLgotICoKLSAqIEluIG5vcm1hbCBrZXJuZWwgY29kZSwgdGhleSBhcmUgdXNlZCBsaWtlIGFu
eSBvdGhlciB2YXJpYWJsZS4KLSAqIEluIHVzZXIgY29kZSwgdGhleSBhcmUgYWNjZXNzZWQgdGhy
b3VnaCB0aGUgVlZBUiBtYWNyby4KLSAqCi0gKiBUaGVzZSB2YXJpYWJsZXMgbGl2ZSBpbiBhIHBh
Z2Ugb2Yga2VybmVsIGRhdGEgdGhhdCBoYXMgYW4gZXh0cmEgUk8KLSAqIG1hcHBpbmcgZm9yIHVz
ZXJzcGFjZS4gIEVhY2ggdmFyaWFibGUgbmVlZHMgYSB1bmlxdWUgb2Zmc2V0IHdpdGhpbgotICog
dGhhdCBwYWdlOyBzcGVjaWZ5IHRoYXQgb2Zmc2V0IHdpdGggdGhlIERFQ0xBUkVfVlZBUiBtYWNy
by4gIChJZgotICogeW91IG1lc3MgdXAsIHRoZSBsaW5rZXIgd2lsbCBjYXRjaCBpdC4pCi0gKi8K
LQotI2lmbmRlZiBfQVNNX1g4Nl9WVkFSX0gKLSNkZWZpbmUgX0FTTV9YODZfVlZBUl9ICi0KLSNp
ZmRlZiBFTUlUX1ZWQVIKLS8qCi0gKiBFTUlUX1ZWQVIoKSBpcyB1c2VkIGJ5IHRoZSBrZXJuZWwg
bGlua2VyIHNjcmlwdCB0byBwdXQgdnZhcnMgaW4gdGhlCi0gKiByaWdodCBwbGFjZS4gQWxzbywg
aXQncyB1c2VkIGJ5IGtlcm5lbCBjb2RlIHRvIGltcG9ydCBvZmZzZXRzIHZhbHVlcy4KLSAqLwot
I2RlZmluZSBERUNMQVJFX1ZWQVIob2Zmc2V0LCB0eXBlLCBuYW1lKSBcCi0JRU1JVF9WVkFSKG5h
bWUsIG9mZnNldCkKLSNkZWZpbmUgREVDTEFSRV9WVkFSX1NJTkdMRShvZmZzZXQsIHR5cGUsIG5h
bWUpIFwKLQlFTUlUX1ZWQVIobmFtZSwgb2Zmc2V0KQotCi0jZWxzZQotCi1leHRlcm4gY2hhciBf
X3Z2YXJfcGFnZTsKLQotI2RlZmluZSBERUNMQVJFX1ZWQVIob2Zmc2V0LCB0eXBlLCBuYW1lKQkJ
CQlcCi0JZXh0ZXJuIHR5cGUgdnZhcl8gIyMgbmFtZVtDU19CQVNFU10JCQkJXAotCV9fYXR0cmli
dXRlX18oKHZpc2liaWxpdHkoImhpZGRlbiIpKSk7CQkJCVwKLQlleHRlcm4gdHlwZSB0aW1lbnNf
ICMjIG5hbWVbQ1NfQkFTRVNdCQkJCVwKLQlfX2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5KCJoaWRk
ZW4iKSkpOwkJCQlcCi0KLSNkZWZpbmUgREVDTEFSRV9WVkFSX1NJTkdMRShvZmZzZXQsIHR5cGUs
IG5hbWUpCQkJCVwKLQlleHRlcm4gdHlwZSB2dmFyXyAjIyBuYW1lCQkJCQlcCi0JX19hdHRyaWJ1
dGVfXygodmlzaWJpbGl0eSgiaGlkZGVuIikpKTsJCQkJXAotCi0jZGVmaW5lIFZWQVIobmFtZSkg
KHZ2YXJfICMjIG5hbWUpCi0jZGVmaW5lIFRJTUVOUyhuYW1lKSAodGltZW5zXyAjIyBuYW1lKQot
Ci0jZGVmaW5lIERFRklORV9WVkFSKHR5cGUsIG5hbWUpCQkJCQkJXAotCXR5cGUgbmFtZVtDU19C
QVNFU10JCQkJCQlcCi0JX19hdHRyaWJ1dGVfXygoc2VjdGlvbigiLnZ2YXJfIiAjbmFtZSksIGFs
aWduZWQoMTYpKSkgX192aXNpYmxlCi0KLSNkZWZpbmUgREVGSU5FX1ZWQVJfU0lOR0xFKHR5cGUs
IG5hbWUpCQkJCQlcCi0JdHlwZSBuYW1lCQkJCQkJCVwKLQlfX2F0dHJpYnV0ZV9fKChzZWN0aW9u
KCIudnZhcl8iICNuYW1lKSwgYWxpZ25lZCgxNikpKSBfX3Zpc2libGUKLQotI2VuZGlmCi0KLS8q
IERFQ0xBUkVfVlZBUihvZmZzZXQsIHR5cGUsIG5hbWUpICovCi0KLURFQ0xBUkVfVlZBUigwLCBz
dHJ1Y3QgdmRzb19kYXRhLCBfdmRzb19kYXRhKQotCi0jdW5kZWYgREVDTEFSRV9WVkFSCi0jdW5k
ZWYgREVDTEFSRV9WVkFSX1NJTkdMRQotCi0jZW5kaWYKCi0tIAoyLjQ3LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
