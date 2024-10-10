Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221C5CF07BA
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fC3+BfKflmbhFo1Ijtv05agLkUp3uJ+1oq8CcCVyxoE=; b=XnMmXNUTqmfwOt
	C5qSkNIGVc9y/cxUzMkS7wo1xICHF0ms40qiloSqOaWcLLQxBRzjhBU6tiIU+01wmq7lpUVNI+iRL
	fYZ1jVr0akSwM1k9bQSI97YyG9hB7pfefAtAisVxM9IQv9s0Bb+oSKI97JRRXbQFa2ggqz3wlV7HM
	BvPU5ps+QJp4JlyzIJJgD5rHt8AAf6N32bge5VaoCottVYNhkSgHKsMBsbf8NK2pKEkwu94pE11i3
	vV9mkGhL9a7ZjgAMZH96O+37mRkiGaOF3uIXE4iA+0csChinYSaj3f4siu8fOMC4+IWs87opLg6qz
	0Hjf07ShXnMcj8riUd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synXj-0000000BpUS-2Vwf;
	Thu, 10 Oct 2024 07:25:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBl-0000000BloG-071U;
	Thu, 10 Oct 2024 07:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Bpx3H6OAW30r2M4gvHlf4N1YsIPw8mw3FdRSSKpTbMo=; b=IQdSB0AE5wo+FFeuiociRwMbm3
	pJWhwmAlr46FHzBz9TYzyGJosfFocPfcoMzD5kPBK1WtZqhZrlPqAdnsB10vrwIFQqXEwi3e+7NEM
	+P0566upamA09Ad9EfQmxp6MhUXuRZUJXB2M11AwTKNsQHkraYmqAVYOyW3F15cSx2CozTwMJkTEN
	zA1glnzGW0YDvOi64EsY/ricKpioubp0qmP04EKxduj/DI6Te+GqlIbsgKRI1UwWPOihc7GdSWvyq
	S09Nn2ocbzFRtb2aiSpO5GkB58/NmR/3iK0ttOwnNfIcMUAqXbIeeWGsT189VnfM0WU6CWM3FTA3G
	Vfr48dxg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBe-00000005Cvp-3WSb;
	Thu, 10 Oct 2024 07:02:18 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bpx3H6OAW30r2M4gvHlf4N1YsIPw8mw3FdRSSKpTbMo=;
	b=fHO6dB5+tJ5AREGbwdyrnC2qHTYIrMf/mNnwcKcW1LGxv8M1u6qQnVRKVnH5V+qcoYbaQ2
	3iiPafwMCXtkU0L392d1SnJNd/mGnPRV/RJrO3tzoGn/XAbrr4Tzv3pKW8+oj2h9tvgdy5
	CxdFvbJh4+4zIeHcC+yfj3qMVcDM7gQVu/7xbTW8aDNo0w7z0OssIyjNtWqt0AiQ1+PHOh
	Ywnn52yHb4Liib84kgA/AFgG7w6LvN3YrVYf7h9Alq2jcCQMgDVM+p00BSb7gRQvNC4Mmh
	uGWkAlX9s/3WkavRgVvqIGC7m+1Cp/19u8iF4aI9dhxJLBYjNkAw2kJeS6S+mg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bpx3H6OAW30r2M4gvHlf4N1YsIPw8mw3FdRSSKpTbMo=;
	b=nVceqz6aoyJ/HPcQx81U9eTkPYPq3uxROiMVUFhWBsYE9y2x+6JUxjov/AHRlCNW3C1bdh
	ousQJBYc6nl11kDQ==
Date: Thu, 10 Oct 2024 09:01:19 +0200
Subject: [PATCH 17/28] x86: vdso: Move the rng offset to vsyscall.h
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-17-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1867;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Np140vGUYm0GdbZeMo/M6YRpqMe7CZ/gv0PibQOMjpk=;
 b=0upqYpRkuYFgrPBW3kR6OrNCpDY5Ss/cEAnk/yBBoRvvML2YQfAHXOqqTYZKYHuk1pq8g9LV8
 8YXoRNL497eB8wR/8v3imo4szSlPYBMVDCYzRvobgH+wYrzKXmyU5S7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080215_211256_6FB263FE 
X-CRM114-Status: GOOD (  10.71  )
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

dnZhci5oIHdpbGwgZ28gYXdheSwgc28gbW92ZSB0aGUgbGFzdCB1c2VmdWwgYml0IGludG8gdnN5
c2NhbGwuaC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3Nz
Y2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gveDg2L2VudHJ5L3Zkc28vdmRzby1sYXlvdXQu
bGRzLlMgfCAxICsKIGFyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaCAgfCAzICsr
LQogYXJjaC94ODYvaW5jbHVkZS9hc20vdnZhci5oICAgICAgICAgICB8IDIgLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2VudHJ5L3Zkc28vdmRzby1sYXlvdXQubGRzLlMgYi9hcmNoL3g4Ni9lbnRyeS92ZHNv
L3Zkc28tbGF5b3V0Lmxkcy5TCmluZGV4IGFjY2U2MDczMmU1NDFmNDlkZmMyMWQ3NWUxYjUyNWM4
YTc0ZjIzNDEuLmM3ZTE5NGI2ZTQ3ZGVmM2JmYTY4MWIzZWM1ZDQ1Y2ZmZmJlODM5ZDIgMTAwNjQ0
Ci0tLSBhL2FyY2gveDg2L2VudHJ5L3Zkc28vdmRzby1sYXlvdXQubGRzLlMKKysrIGIvYXJjaC94
ODYvZW50cnkvdmRzby92ZHNvLWxheW91dC5sZHMuUwpAQCAtMSw1ICsxLDYgQEAKIC8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCiAjaW5jbHVkZSA8YXNtL3Zkc28uaD4KKyNp
bmNsdWRlIDxhc20vdmRzby92c3lzY2FsbC5oPgogCiAvKgogICogTGlua2VyIHNjcmlwdCBmb3Ig
dkRTTy4gIFRoaXMgaXMgYW4gRUxGIHNoYXJlZCBvYmplY3QgcHJlbGlua2VkIHRvCmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKaW5kZXggNWQ2NzYwNzQ2ZDE1YjBlMTJjN2JmMGViNzI3
MjQxZTc1NzZjYTljNy4uNmUyMTBlMDVmOWYzMjNlM2U5Y2VjYThhMDRkNWYyMWZiNmQwNDc4MSAx
MDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oCisrKyBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaApAQCAtMiwxMiArMiwxMyBAQAogI2lm
bmRlZiBfX0FTTV9WRFNPX1ZTWVNDQUxMX0gKICNkZWZpbmUgX19BU01fVkRTT19WU1lTQ0FMTF9I
CiAKKyNkZWZpbmUgX19WRFNPX1JORF9EQVRBX09GRlNFVCAgNjQwCisKICNpZm5kZWYgX19BU1NF
TUJMWV9fCiAKICNpbmNsdWRlIDxsaW51eC90aW1la2VlcGVyX2ludGVybmFsLmg+CiAjaW5jbHVk
ZSA8dmRzby9kYXRhcGFnZS5oPgogI2luY2x1ZGUgPGFzbS92Z3RvZC5oPgotI2luY2x1ZGUgPGFz
bS92dmFyLmg+CiAKIGV4dGVybiBzdHJ1Y3QgdmRzb19kYXRhICp2ZHNvX2RhdGE7CiAKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Z2YXIuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3Z2YXIuaAppbmRleCBiNjA1OTE0ZjRkNDM0N2MxNjM0NGU1YjVlMDYzNjk3NTM4ZDQ4OTVlLi5k
OTVjZjkyMjk2ZWY2YWNmNjYwODlhNzM0NDY1ZWRhNGNiYTkxNTRjIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS92dmFyLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vdnZhci5o
CkBAIC0xOSw4ICsxOSw2IEBACiAjaWZuZGVmIF9BU01fWDg2X1ZWQVJfSAogI2RlZmluZSBfQVNN
X1g4Nl9WVkFSX0gKIAotI2RlZmluZSBfX1ZEU09fUk5EX0RBVEFfT0ZGU0VUICA2NDAKLQogI2lm
ZGVmIEVNSVRfVlZBUgogLyoKICAqIEVNSVRfVlZBUigpIGlzIHVzZWQgYnkgdGhlIGtlcm5lbCBs
aW5rZXIgc2NyaXB0IHRvIHB1dCB2dmFycyBpbiB0aGUKCi0tIAoyLjQ3LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
