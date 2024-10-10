Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A61CF07BA
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87nCK62BeVuuu7jjbyQj7Bbcgj+POn5/uqv+LXCQRkA=; b=eHOhQjrmTAb/2R
	l9Vl9fZBH2QrQK/GP5GNRXMFfEWKeMbDzouGXFKy5z6mD1YtD/M89HfoM5blhCAjzML6xqLU2Nonc
	c21dGTkYlTIFEpvNNE31lQ+dNundzGsSnT5fW5W5J1JxnW8wRQn2X04Hy6t317CR4gi/+nB5AOHdF
	GU8/psMYihR2Jqx5w0cuVkqkYcxqOO36hL14pbVDPcoNyi6JrV06PJ15bv2jWzcZ4NqJ8/rg9mhsR
	Oq+zp2DcamsWNWOHv0x9zvUKzRW33IV752lD2JuP+vw/s3UM+W9Jvw07Wh+y2u/sNH0eBYe3NTYSa
	BuurMMcazBqmMKhpiMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synPR-0000000BoHt-39Zp;
	Thu, 10 Oct 2024 07:16:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBb-0000000Blj2-45ZK;
	Thu, 10 Oct 2024 07:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fSNmDOR8mNkMRWq28GYqTKs82l0VUrUkubx6cM1vMzU=; b=TdZVi72Wfp8iCQ9+6vFox5T6+A
	Wf9McobPp6o394Is1TzKwXqQCwkKVlPb1OT+QlYNLwEfi7YM2YPWvRYB3u12CiD1KwgkbBYGSytLg
	lO8rGy0QngpNJy2UzevIQpz8YSfNkfkIkhhZ7XYssjY1zeSoGuAeAW0TgfRl/LbPs7GoA6Vb0NEpU
	M72g2rNrMxjXW8NYnqKyFTpH0XNozs58zTHQ2oei9lYbTUcFvz/R0coDcdNbDshpIVXpdfwMPsTUR
	hNmNs8N4MtiMAuY7zwgKVEX+Oop8YiN2EEU7uuurt6ZeZ+ISQ7Hl9YUlaO7BI4OpwZGfcubxVCKyi
	jWzm8YnA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBX-00000005CoV-2sVZ;
	Thu, 10 Oct 2024 07:02:10 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSNmDOR8mNkMRWq28GYqTKs82l0VUrUkubx6cM1vMzU=;
	b=JOkVyuu8+7haw1iCeHChIsq68EC1aZ52K0BIUTFKSbeQBBJEUxi312+lOZEntDZeRqi55i
	uPfwqC6MUWoo1hIr/jOFy6UINkmmLclazsQfxOlNbU20Cp81nv/mQXg5Lw9HDsOQdNHFCP
	LpJfynDUc4QyF7vVaG8T1GCx8XEi7L6alOQghxtEvPLNw1z779j7IhCnusT1ZSoki2sRyl
	Q+SPTwcLo2JzuNFf/IM/k2hrg1g2PwSHv6M76K5bNbp4sftQFnCi2Fx9uCCLYINR/NIVdz
	ki/30EscNkMx57JeSpOGozsepAcPW63TEvULocoEomkcVzyTqUWmvWvwqpJ88g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSNmDOR8mNkMRWq28GYqTKs82l0VUrUkubx6cM1vMzU=;
	b=AVwC1K9c5Whn9Va23Yb9J5KSgfAiDM4xWIG2FptaGnWTq9kCeAxZSYBEP2n6BjXznVhhK2
	c+8VOjydf1tjswAw==
Date: Thu, 10 Oct 2024 09:01:10 +0200
Subject: [PATCH 08/28] LoongArch: vDSO: Use vdso/datapage.h to access vDSO
 data
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-8-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=5262;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=FYM4tk82QHVuu/f72Iv7XeP9evNNkMSpW3FoFzuNH7o=;
 b=3bKRUZ5iIdKtZuSy+qOYQwMpqk7fk6/fhq1nYjszxR3DIB4+fVnS5JyZWYVwlBQHQ3aq2KaGg
 dwVWIKtF6RjBgsj72diQERGVQ6Iyc3ErSTAx+eZvjNZs2RfAquBYG3J
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080208_033075_82A033E0 
X-CRM114-Status: GOOD (  14.70  )
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

dmRzby9kYXRhcGFnZS5oIHByb3ZpZGVzIHN5bWJvbHMgYW5kIGZ1bmN0aW9ucyB0byBlYXNlIHRo
ZSBhY2Nlc3MgdG8Kc2hhcmVkIHZEU08gZGF0YSBmcm9tIGJvdGggdGhlIGtlcm5lbCBhbmQgdGhl
IHZEU08uCk1ha2UgdXNlIG9mIGl0IHRvIHNpbXBsaWZ5IHRoZSBjdXJyZW50IGNvZGUgYW5kIGFs
c28gcHJlcGFyZSBmb3IgZnVydGhlcgpjaGFuZ2VzIHVuaWZ5aW5nIHRoZSB2RFNPIGRhdGEgc3Rv
cmFnZSBiZXR3ZWVuIGFyY2hpdGVjdHVyZXMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59z
Y2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL2xvb25nYXJj
aC9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oICAgIHwgIDMgKy0tCiBhcmNoL2xvb25nYXJj
aC9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oIHwgIDQgKystLQogYXJjaC9sb29uZ2Fy
Y2gvaW5jbHVkZS9hc20vdmRzby92ZHNvLmggICAgICAgICB8IDE4ICstLS0tLS0tLS0tLS0tLS0t
LQogYXJjaC9sb29uZ2FyY2gva2VybmVsL2FzbS1vZmZzZXRzLmMgICAgICAgICAgICB8ICA5ICsr
KysrKysrKwogYXJjaC9sb29uZ2FyY2gvdmRzby92ZHNvLmxkcy5TICAgICAgICAgICAgICAgICB8
ICA4ICsrKysrKystCiBhcmNoL2xvb25nYXJjaC92ZHNvL3ZnZXRjcHUuYyAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIDYgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vdmRzby9nZXRy
YW5kb20uaCBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3Zkc28vZ2V0cmFuZG9tLmgKaW5k
ZXggMDJmMzY3NzI1NDFiN2RlYjg5YWEyOTRmMTNlNGQ1MzlkNmU2NjI2ZC4uZTgwZjNjNGFjNzQ4
MWJhN2Y5ZjVkOTIxMGZlZmE3OGMzMjkzMjQzYiAxMDA2NDQKLS0tIGEvYXJjaC9sb29uZ2FyY2gv
aW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaAorKysgYi9hcmNoL2xvb25nYXJjaC9pbmNsdWRl
L2FzbS92ZHNvL2dldHJhbmRvbS5oCkBAIC0zMCw4ICszMCw3IEBAIHN0YXRpYyBfX2Fsd2F5c19p
bmxpbmUgc3NpemVfdCBnZXRyYW5kb21fc3lzY2FsbCh2b2lkICpfYnVmZmVyLCBzaXplX3QgX2xl
biwgdW5zCiAKIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgY29uc3Qgc3RydWN0IHZkc29fcm5nX2Rh
dGEgKl9fYXJjaF9nZXRfdmRzb19ybmdfZGF0YSh2b2lkKQogewotCXJldHVybiAoY29uc3Qgc3Ry
dWN0IHZkc29fcm5nX2RhdGEgKikoZ2V0X3Zkc29fZGF0YSgpICsgVlZBUl9MT09OR0FSQ0hfUEFH
RVNfU1RBUlQgKgotCSAgICAgICBQQUdFX1NJWkUgKyBvZmZzZXRvZihzdHJ1Y3QgbG9vbmdhcmNo
X3Zkc29fZGF0YSwgcm5nX2RhdGEpKTsKKwlyZXR1cm4gJl9sb29uZ2FyY2hfZGF0YS5ybmdfZGF0
YTsKIH0KIAogI2VuZGlmIC8qICFfX0FTU0VNQkxZX18gKi8KZGlmZiAtLWdpdCBhL2FyY2gvbG9v
bmdhcmNoL2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmggYi9hcmNoL2xvb25nYXJjaC9p
bmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oCmluZGV4IDg5ZTZiMjIyYzJmMmQxY2UyNDAx
OThmMmZiYzE0NTUzZDBkNmI5NGQuLjdlYjNmMDQxYWY3NjRkMTQxYjAwNWY4MjE1OTNhMzU4MDk2
ODc0YmEgMTAwNjQ0Ci0tLSBhL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGlt
ZW9mZGF5LmgKKysrIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2Zk
YXkuaApAQCAtOTEsMTQgKzkxLDE0IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBsb29uZ2FyY2hfdmRz
b19ocmVzX2NhcGFibGUodm9pZCkKIAogc3RhdGljIF9fYWx3YXlzX2lubGluZSBjb25zdCBzdHJ1
Y3QgdmRzb19kYXRhICpfX2FyY2hfZ2V0X3Zkc29fZGF0YSh2b2lkKQogewotCXJldHVybiAoY29u
c3Qgc3RydWN0IHZkc29fZGF0YSAqKWdldF92ZHNvX2RhdGEoKTsKKwlyZXR1cm4gX3Zkc29fZGF0
YTsKIH0KIAogI2lmZGVmIENPTkZJR19USU1FX05TCiBzdGF0aWMgX19hbHdheXNfaW5saW5lCiBj
b25zdCBzdHJ1Y3QgdmRzb19kYXRhICpfX2FyY2hfZ2V0X3RpbWVuc192ZHNvX2RhdGEoY29uc3Qg
c3RydWN0IHZkc29fZGF0YSAqdmQpCiB7Ci0JcmV0dXJuIChjb25zdCBzdHJ1Y3QgdmRzb19kYXRh
ICopKGdldF92ZHNvX2RhdGEoKSArIFZWQVJfVElNRU5TX1BBR0VfT0ZGU0VUICogUEFHRV9TSVpF
KTsKKwlyZXR1cm4gX3RpbWVuc19kYXRhOwogfQogI2VuZGlmCiAjZW5kaWYgLyogIV9fQVNTRU1C
TFlfXyAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vdmRzby92ZHNv
LmggYi9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS92ZHNvL3Zkc28uaAppbmRleCBlMzFhYzc0
NzQ1MTNjNzM3ZmNjMDA3MWQ2ZjI1NTRkYzRkNDQ3MTAxLi4xYzE4M2E5YjIxMTVhMjlhOTk3ZWM4
ZGIwZTc4OGQ4N2ZiMTkxZGNlIDEwMDY0NAotLS0gYS9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2Fz
bS92ZHNvL3Zkc28uaAorKysgYi9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS92ZHNvL3Zkc28u
aApAQCAtNDgsMjMgKzQ4LDcgQEAgZW51bSB2dmFyX3BhZ2VzIHsKIAogI2RlZmluZSBWVkFSX1NJ
WkUgKFZWQVJfTlJfUEFHRVMgPDwgUEFHRV9TSElGVCkKIAotc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBsb25nIGdldF92ZHNvX2Jhc2Uodm9pZCkKLXsKLQl1bnNpZ25lZCBsb25nIGFkZHI7Ci0KLQlf
X2FzbV9fKAotCSIgbGEucGNyZWwgJTAsIF9zdGFydFxuIgotCTogIj1yIiAoYWRkcikKLQk6Ci0J
Oik7Ci0KLQlyZXR1cm4gYWRkcjsKLX0KLQotc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGdl
dF92ZHNvX2RhdGEodm9pZCkKLXsKLQlyZXR1cm4gZ2V0X3Zkc29fYmFzZSgpIC0gVlZBUl9TSVpF
OwotfQorZXh0ZXJuIHN0cnVjdCBsb29uZ2FyY2hfdmRzb19kYXRhIF9sb29uZ2FyY2hfZGF0YSBf
X2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5KCJoaWRkZW4iKSkpOwogCiAjZW5kaWYgLyogX19BU1NF
TUJMWV9fICovCiAKZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9hc20tb2Zmc2V0
cy5jIGIvYXJjaC9sb29uZ2FyY2gva2VybmVsL2FzbS1vZmZzZXRzLmMKaW5kZXggYmVlOWY3YTMx
MDhmMGU2ZjZkODI1MTY1MWQxMmRmNjc3NTI5YmRhNy4uMDQ5YzVjM2UzNzBjYmIwMGZkYWY2NzMw
Zjc3Nzc4NDdjNzMyNWZiNCAxMDA2NDQKLS0tIGEvYXJjaC9sb29uZ2FyY2gva2VybmVsL2FzbS1v
ZmZzZXRzLmMKKysrIGIvYXJjaC9sb29uZ2FyY2gva2VybmVsL2FzbS1vZmZzZXRzLmMKQEAgLTE0
LDYgKzE0LDcgQEAKICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+CiAjaW5jbHVkZSA8YXNtL3Byb2Nl
c3Nvci5oPgogI2luY2x1ZGUgPGFzbS9mdHJhY2UuaD4KKyNpbmNsdWRlIDx2ZHNvL2RhdGFwYWdl
Lmg+CiAKIHN0YXRpYyB2b2lkIF9fdXNlZCBvdXRwdXRfcHRyZWdfZGVmaW5lcyh2b2lkKQogewpA
QCAtMzIxLDMgKzMyMiwxMSBAQCBzdGF0aWMgdm9pZCBfX3VzZWQgb3V0cHV0X2t2bV9kZWZpbmVz
KHZvaWQpCiAJT0ZGU0VUKEtWTV9HUEdELCBrdm0sIGFyY2gucGdkKTsKIAlCTEFOSygpOwogfQor
CitzdGF0aWMgdm9pZCBfX3VzZWQgb3V0cHV0X3Zkc29fZGVmaW5lcyh2b2lkKQoreworCUNPTU1F
TlQoIkxvb25nQXJjaCB2RFNPIG9mZnNldHMuIik7CisKKwlERUZJTkUoX19WVkFSX1BBR0VTLCBW
VkFSX05SX1BBR0VTKTsKKwlCTEFOSygpOworfQpkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gv
dmRzby92ZHNvLmxkcy5TIGIvYXJjaC9sb29uZ2FyY2gvdmRzby92ZHNvLmxkcy5TCmluZGV4IDZi
NDQxYmRlNDAyNmVhOGFjZGE5NjllN2MzMjA1YTkzNTBhNzZjZDcuLjE2MGNmYWVmMmRlNDViMTI0
MzUwMmM3MzU2ZjhhOTEzNjU4NTQ4ZmUgMTAwNjQ0Ci0tLSBhL2FyY2gvbG9vbmdhcmNoL3Zkc28v
dmRzby5sZHMuUworKysgYi9hcmNoL2xvb25nYXJjaC92ZHNvL3Zkc28ubGRzLlMKQEAgLTMsNiAr
Myw4IEBACiAgKiBBdXRob3I6IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGxvb25nc29uLmNuPgog
ICogQ29weXJpZ2h0IChDKSAyMDIwLTIwMjIgTG9vbmdzb24gVGVjaG5vbG9neSBDb3Jwb3JhdGlv
biBMaW1pdGVkCiAgKi8KKyNpbmNsdWRlIDxhc20vcGFnZS5oPgorI2luY2x1ZGUgPGdlbmVyYXRl
ZC9hc20tb2Zmc2V0cy5oPgogCiBPVVRQVVRfRk9STUFUKCJlbGY2NC1sb29uZ2FyY2giLCAiZWxm
NjQtbG9vbmdhcmNoIiwgImVsZjY0LWxvb25nYXJjaCIpCiAKQEAgLTEwLDcgKzEyLDExIEBAIE9V
VFBVVF9BUkNIKGxvb25nYXJjaCkKIAogU0VDVElPTlMKIHsKLQlQUk9WSURFKF9zdGFydCA9IC4p
OworCVBST1ZJREUoX3Zkc29fZGF0YSA9IC4gLSBfX1ZWQVJfUEFHRVMgKiBQQUdFX1NJWkUpOwor
I2lmZGVmIENPTkZJR19USU1FX05TCisJUFJPVklERShfdGltZW5zX2RhdGEgPSBfdmRzb19kYXRh
ICsgUEFHRV9TSVpFKTsKKyNlbmRpZgorCVBST1ZJREUoX2xvb25nYXJjaF9kYXRhID0gX3Zkc29f
ZGF0YSArIDIgKiBQQUdFX1NJWkUpOwogCS4gPSBTSVpFT0ZfSEVBREVSUzsKIAogCS5oYXNoCQk6
IHsgKiguaGFzaCkgfQkJCTp0ZXh0CmRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC92ZHNvL3Zn
ZXRjcHUuYyBiL2FyY2gvbG9vbmdhcmNoL3Zkc28vdmdldGNwdS5jCmluZGV4IDllNDQ1YmUzOTc2
M2FlYmM3NWU5ZTk3ZDc3YjQwZTE0YTAxOGRlZWEuLjBkYjUxMjU4YjJhN2NhN2U0NGQyZWI2OGVh
NTE0ZmFjZTQ4MzkzZjcgMTAwNjQ0Ci0tLSBhL2FyY2gvbG9vbmdhcmNoL3Zkc28vdmdldGNwdS5j
CisrKyBiL2FyY2gvbG9vbmdhcmNoL3Zkc28vdmdldGNwdS5jCkBAIC0yMSw3ICsyMSw3IEBAIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IHJlYWRfY3B1X2lkKHZvaWQpCiAKIHN0YXRpYyBfX2Fs
d2F5c19pbmxpbmUgY29uc3Qgc3RydWN0IHZkc29fcGNwdV9kYXRhICpnZXRfcGNwdV9kYXRhKHZv
aWQpCiB7Ci0JcmV0dXJuIChzdHJ1Y3QgdmRzb19wY3B1X2RhdGEgKikoZ2V0X3Zkc29fZGF0YSgp
ICsgVlZBUl9MT09OR0FSQ0hfUEFHRVNfU1RBUlQgKiBQQUdFX1NJWkUpOworCXJldHVybiBfbG9v
bmdhcmNoX2RhdGEucGRhdGE7CiB9CiAKIGV4dGVybgoKLS0gCjIuNDcuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
