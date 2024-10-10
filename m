Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416A1CF07C7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 08:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUiJRSUqybr+wPY8DeB9GOXhx5XPRE8TOKbeo0CJscA=; b=kUFIvKlxlgOzkw
	lPNOHH0/ZlJcRJS7/HxlBMDW1CuxArt8gofzupxO9ExAISSTtWyAgUj03IE8lRz4ilYY5+8ZIRGVt
	xix+7Ao+p7jnmxVx6VglLB8OpqbGIXiLnv1pz+2okbLw797LqF1HaUZf5H0SwRzycxixAi5CaLCPN
	WDFKXM5l9H3Xhz8c2fp9Hi3pHCfJSWG13crY7U0sHiXCyzN7qro9Q+Wp27mGUAjKkFMtfsxYEzALT
	RGVP5rcKweRCktWDPQki5r2SzJkCRqD86r2YNoM5KmL7hmVmBa+Lp6dH3CiPfjfWFhWYJUMbsF/UG
	ynjXSLTR5f0zJ4+lr8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syoo9-0000000C4BW-1fa1;
	Thu, 10 Oct 2024 08:46:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBq-0000000BlqJ-2YKy;
	Thu, 10 Oct 2024 07:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=K/qRGvuOAyfRD/y9Hw9vI8MnAlUye5M5TSGqQF5eFfA=; b=fgFhSjv1wJ2iKEPZFAFQCNDHZb
	6AvQBeHr0C9GMBElkZgqpWOHtDXLnHQuGw5tKytcWEsxjhNuW1MaPeRpcfZeng5TRdS97yiMRauC0
	O6DgQG5VkWkAFR+yT98ot5w2IOAeaswz5JRl2E9gd5iWikSkFGybVObEVkoVQz5FqsA1cwqNFUu2P
	9TSaU4hsP76harhG6RnTblbgqyclkVv7lOhtoH6JZ8v0mSX8f9kfnuCoPo4ta6vSpdX8q0DxsOr9f
	Q9twL5ddG6EVfXqjUSOCjZxqGqv5emd4cWBgKdgfHW/CgrRMI/DqjFIfuQIyf/euocAVlOlXakDha
	gODzNatg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBj-00000005D04-3s6i;
	Thu, 10 Oct 2024 07:02:23 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/qRGvuOAyfRD/y9Hw9vI8MnAlUye5M5TSGqQF5eFfA=;
	b=lOtgRqrvkWhHs5FDIZhLs96p61mNiVNt6t9AYoLa1thljfyyRleywPXqjeoScsCAYmTDWv
	0r24GjB2ulGnJkoTNTjKVsfA+qpBbIlUHVuwLRLvSg88aafASg37t3FvSAYJKTDkrEFMCF
	Q5L0Cf2OrOk89w2nbzDgMcSfACgIJSovpms7P8XAGOW3atwPhKJxWF47+FzFTW5N/EG7Yg
	2HRzhNr/4GYMtRtie63QKRml5xYibGYWTE6BlzE/8/BbDmr8Rpeyjiyozaei/60X/TdWdk
	tpOmuMYwEhnBlSzBYpZ2bYOmey08TelkMPNRC3g4oVQhOg4Po+4u5KTFktMPbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/qRGvuOAyfRD/y9Hw9vI8MnAlUye5M5TSGqQF5eFfA=;
	b=YPIBKS6fUErLq7tLoUgds5pLbK4UX7EnE/rx00rRDYWatFVJ7tNFzgNAHim8WYkolJMXyq
	eaBMgmb4NJ1+7MBA==
Date: Thu, 10 Oct 2024 09:01:27 +0200
Subject: [PATCH 25/28] powerpc: Add kconfig option for the systemcfg page
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-25-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1852;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ignJMWvkz6E09b32wojexZ5aYHvKHJxJ66AG8ULzy/s=;
 b=C1rNttCPnaP1zlaUjv7iMx0innkkyXvxyKgVYJIFWgJtuaN0zt8AzArXt/OrnrBtT3yS8PQGE
 o07lV8IsHQkADjaSA/YIbNTpmAdiIx+Hy0BA1bX+qUHzEj/ePQM5Dd2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080220_260454_1AF88A2B 
X-CRM114-Status: GOOD (  12.03  )
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

VGhlIHN5c3RlbWNmZyBwYWdlIHRocm91Z2ggcHJvY2ZzIGlzIG9ubHkgYSBiYWNrd2FyZHMtY29t
cGF0aWJsZQppbnRlcmZhY2UgZm9yIHZlcnkgb2xkIGFwcGxpY2F0aW9ucy4KTWFrZSBpdCBwb3Nz
aWJsZSB0byBiZSBkaXNhYmxlZC4KClRoaXMgYWxzbyBjcmVhdGVzIGEgY29udmVuaWVudCBjb25m
aWcgI2RlZmluZSB0byBndWFyZCBhbnkgYWNjZXNzZXMgdG8KdGhlIHN5c3RlbWNmZyBwYWdlLgoK
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0
cm9uaXguZGU+Ci0tLQogYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICAgICB8IDggKysr
KysrKysKIGFyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY19wb3dlcnBjLmMgfCA0ICsrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCmluZGV4IDgwOTRh
MDE5NzRjY2ExZDI3MDAyNzIwZTcwNmY2NmJlYzJhMmQwMzUuLjVkMzQ4ZTFmMDlkNzMwMDAyZWVl
OTg5NGEwYjI4NDdlMWRhYzE1ZDUgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnCisr
KyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCkBAIC0xMjk4LDYgKzEyOTgsMTQgQEAgY29uZmlnIE1P
RFVMRVNfU0laRQogCiBlbmRtZW51CiAKK2NvbmZpZyBQUEM2NF9QUk9DX1NZU1RFTUNGRworCWRl
Zl9ib29sIHkKKwlkZXBlbmRzIG9uIFBQQzY0ICYmIFBST0NfRlMKKwloZWxwCisJICBUaGlzIG9w
dGlvbiBlbmFibGVzIHRoZSBwcmVzZW5jZSBvZiAvcHJvYy9wcGM2NC9zeXN0ZW1jZmcgdGhyb3Vn
aAorCSAgd2hpY2ggdGhlIHN5c3RlbWNmZyBwYWdlIGNhbiBiZSBhY2Nlc3NlZC4KKwkgIFRoaXMg
aW50ZXJmYWNlIG9ubHkgZXhpc3RzIGZvciBiYWNrd2FyZHMtY29tcGF0aWJpbGl0eS4KKwogaWYg
UFBDNjQKICMgVGhpcyB2YWx1ZSBtdXN0IGhhdmUgemVyb2VzIGluIHRoZSBib3R0b20gNjAgYml0
cyBvdGhlcndpc2UgbG90cyB3aWxsIGJyZWFrCiBjb25maWcgUEFHRV9PRkZTRVQKZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY19wb3dlcnBjLmMgYi9hcmNoL3Bvd2VycGMva2Vy
bmVsL3Byb2NfcG93ZXJwYy5jCmluZGV4IDkxMGQyMDgyZTA1ZmQ4NmJkMTE0NjgxNWQ0YjY3NjMz
YTZmMmI0NTkuLjNiZGEzNjU4NDNlNDQzNTc1Mzg2NTFjNmMyNGMxMWE0MWRlMmViMDYgMTAwNjQ0
Ci0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY19wb3dlcnBjLmMKKysrIGIvYXJjaC9wb3dl
cnBjL2tlcm5lbC9wcm9jX3Bvd2VycGMuYwpAQCAtMTQsNyArMTQsNyBAQAogI2luY2x1ZGUgPGFz
bS9ydGFzLmg+CiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgogCi0jaWZkZWYgQ09ORklHX1BQ
QzY0CisjaWZkZWYgQ09ORklHX1BQQzY0X1BST0NfU1lTVEVNQ0ZHCiAKIHN0YXRpYyBsb2ZmX3Qg
cGFnZV9tYXBfc2VlayhzdHJ1Y3QgZmlsZSAqZmlsZSwgbG9mZl90IG9mZiwgaW50IHdoZW5jZSkK
IHsKQEAgLTU5LDcgKzU5LDcgQEAgc3RhdGljIGludCBfX2luaXQgcHJvY19wcGM2NF9pbml0KHZv
aWQpCiB9CiBfX2luaXRjYWxsKHByb2NfcHBjNjRfaW5pdCk7CiAKLSNlbmRpZiAvKiBDT05GSUdf
UFBDNjQgKi8KKyNlbmRpZiAvKiBDT05GSUdfUFBDNjRfUFJPQ19TWVNURU1DRkcgKi8KIAogLyoK
ICAqIENyZWF0ZSB0aGUgcHBjNjQgYW5kIHBwYzY0L3J0YXMgZGlyZWN0b3JpZXMgZWFybHkuIFRo
aXMgYWxsb3dzIHVzIHRvCgotLSAKMi40Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
