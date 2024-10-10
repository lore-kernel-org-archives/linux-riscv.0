Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4301CCF07BD
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLhLgc8o1xqYF2hDuVCdMZaoSoqdCRdlt+D5FG8lVFM=; b=eo3aIEcYCuTRoT
	JSvIaK8NgXmtp0gTzgxdnGJPesLTLpPQcw3u1BqeME+WwMWY+8UREyU/1JMVpPJ31gJCqcd5yeEE2
	C0aeBG3Aw1icw++6iU2TDq4ZOIGoBrBsWT3BULuukxB/ZGZUuuggnvKbrkV+8eKOsbka1nWPACKzI
	gEtP5KvJ0mX7v2euxqUZ9aZAR0prtmMv+3nThLpMHGzES5w5UQ4wYBSJLlbE1STFXPoxpeMTcaXX4
	hUVjlGHkYQ592z0pSjjkeJ4utVop0TbZgK7l7IGXqWjNorN/oWgfXyfHN0KfCwbmA87Vj8wCm1Sd4
	Y+NPJvyujlfACY8H+QYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synPY-0000000BoLR-1kPJ;
	Thu, 10 Oct 2024 07:16:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBT-0000000BleT-38SG;
	Thu, 10 Oct 2024 07:02:16 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0yg1Ny2tTSYsDQ8zQCSNx/jJFJpXIxfnXxTsLb9B9k=;
	b=C8zvqEjo7kb3/oHoz3hb2Om0uiUtYkl55IA9xwWdquAqygCrWODizYf4D6Rw7jAt2zVOuw
	n7OdnQnUgrc5pfjJNzC8YT11DgZ9fsFPnsueJ9GqEwL6Uv3bPMrgzEMM3rMIHS3Eh+NaO1
	ZEvhWra78hEda0HGQg1WZpdvR2Rw7ZGbVaWHYkFpAne47VwHgM7hKauWlVU7QH/0ke03uk
	eAC9PGrgijetGH32veinriyNtlvyjUprCUzGdLAb+F1DETCn4G0iL/b+IIcvg09SEIeVnP
	3SKWPVlgZzjTuXN2WypHhNvHFMn2f7io0CQaEph0qAZpR7XpDnLXrw/lcof30g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0yg1Ny2tTSYsDQ8zQCSNx/jJFJpXIxfnXxTsLb9B9k=;
	b=W7xf0VzJWJPfLuV3guK71mDn+icBDuyZaH32+yBjMmN1PYalZOV/xzGWjl0tLIzAZUBcGH
	IdmG4ZQGtWVr/cAA==
Date: Thu, 10 Oct 2024 09:01:04 +0200
Subject: [PATCH 02/28] csky/vdso: Remove arch_vma_name()
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-2-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=956;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=uTttyYxVmC9yRNmwzxocSlf0ZjyD8nT16PDerFELjlM=;
 b=WCeLreUXzlZ5+MKodzNN22RGiDxtcpRTA/LR4S/eEW4/gG78TAak0Hv5qP+iXIr4pQIw1CbRC
 NsfVsXwXTuzBlj98CEUA7UytkjzUZXv0jKFFlmkIBdO3GkDqiFYYz81
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_000203_984350_67A14748 
X-CRM114-Status: UNSURE (   7.76  )
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

QWxsIGNhbGxlcnMgb2YgYXJjaF92bWFfbmFtZSgpIGFsc28gZ2V0IHRoZSBuYW1lIHZpYSB2bV9v
cHMsIHdoaWNoIGZvcgp0aGVzZSBWTUFzIHdpbGwgdXNlIHRoZSBuYW1lIGZyb20gJ3N0cnVjdCB2
bWFfc3BlY2lhbF9tYXBwaW5nJy4KVGhlcmVmb3JlIHRoZSBjdXN0b20gaW1wbGVtZW50YXRpb24g
aXMgdW5uZWNlc3NhcnkgYW5kIGNhbiBiZSByZW1vdmVkIGluCmZhdm9yIG9mIHRoZSBkZWZhdWx0
IGltcGxlbWVudGF0aW9uIGZyb20ga2VybmVsL3NpZ25hbC5jLgoKU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJj
aC9jc2t5L2tlcm5lbC92ZHNvLmMgfCA3IC0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9rZXJuZWwvdmRzby5jIGIvYXJjaC9jc2t5
L2tlcm5lbC92ZHNvLmMKaW5kZXggOTJhYjhhYzZhNTk2MGUzMGI2NjA1MzBhZTliMTAxMzdkNTg3
MjM2OS4uYzU0ZDAxOWQ2NmJjYWY4YWM0NjMzMDY3MDc2Njc5ZDgzYjY3YThmOCAxMDA2NDQKLS0t
IGEvYXJjaC9jc2t5L2tlcm5lbC92ZHNvLmMKKysrIGIvYXJjaC9jc2t5L2tlcm5lbC92ZHNvLmMK
QEAgLTgyLDEwICs4MiwzIEBAIGludCBhcmNoX3NldHVwX2FkZGl0aW9uYWxfcGFnZXMoc3RydWN0
IGxpbnV4X2JpbnBybSAqYnBybSwKIAltbWFwX3dyaXRlX3VubG9jayhtbSk7CiAJcmV0dXJuIHJl
dDsKIH0KLQotY29uc3QgY2hhciAqYXJjaF92bWFfbmFtZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSkKLXsKLQlpZiAodm1hLT52bV9tbSAmJiAodm1hLT52bV9zdGFydCA9PSAobG9uZyl2bWEt
PnZtX21tLT5jb250ZXh0LnZkc28pKQotCQlyZXR1cm4gIlt2ZHNvXSI7Ci0JcmV0dXJuIE5VTEw7
Ci19CgotLSAKMi40Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
