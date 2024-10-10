Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1FBCF11FF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybcRjIODCqPU4NfF9wJMZZvBd4V4TaDgn49c5c2MoL4=; b=hst+C3HftCh/iy
	uQuUEOck8Lkq+3AIHKC5aNIEv4CGDaNclnUtHBcpUrQjM+D8M7xOdbcZFdeUErtD5KvDFZwo1/3dm
	Eig9AbGYRHqmgWdS7J+aSCJPk46shvP4g7TdHcdDzzr1GWvDR1VBxynAO7F3ySPJfY8zczOwRfFth
	05AEcCxZHRVRfMONveSxdvLT7ukqLVmui2xYhBLrXV0zvH0hrHq/v73WppHEI2lbn+lNixAjW1xAv
	LSDkdddC2BMOUvhM2L6heM/8t6cPI+g2NZtJ4Gbq/QmEqz7QjX5a5CINmwpGV7z4EZApkp+b6Qjch
	FfEXR73yO9rt4wi0TJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syvcc-0000000DSRz-2ETM;
	Thu, 10 Oct 2024 16:02:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLd-0000000DOew-1shc;
	Thu, 10 Oct 2024 15:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=a2YqBVOHBfNFQlYc2gfs+s/qyh0QTOeEVhJlFH/p2/E=; b=YdAxOAhlriM6ubT1ZLpunONPpB
	BkzHvmmBRXohnRAuFgSKBd8/Fiw44HPC6N/kwcK5GrLkTmhnjyrjE05qMMxxxfhyZsqGenR9hGm/8
	es7UES+rvTmgUNzdKsUAofZX4dplHzi7wrFIRZpDNp7eLPw84c6YkyS2PJVL/KtVfFgxVEiQop1DK
	Vns2iP/+n7XfOuNF0axdJYxQlJE+gsHesiYn/KDxg7N1NWYlH1pY6xgydQp8sVU00A4UXQaqke5Ow
	tJjfgFjAMzgP6qqEyaA+glVMkZyrD588G7IiE+6dj1OKi3De+Ls+uj3+qG308zkXqV34cMeZYPz4g
	LvlvMU+A==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLZ-00000005Qit-204v;
	Thu, 10 Oct 2024 15:45:04 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2YqBVOHBfNFQlYc2gfs+s/qyh0QTOeEVhJlFH/p2/E=;
	b=1OiwjVdjrZF9JLf67Y/LK2PMnwLAF6f41w7jSmYgltcI3k2cD+n7bBb3R7AXe/M5orD3c+
	jNG47qrWfoeO74dHjhGwcCiplD51Ks4/wT8wVWFsAkjuLH8y+TdThHOIlghS0ejZ7F4aJa
	fdpD7VdAq91WotwCAmPne8F2NLFwMYZWf5cDB6bRigLRB+bdwIg6emBC7Dyzs8W7a+OKUm
	xzIv9EKcqqDk6zspMO0Spc74duaQFMTeiUOuvLkj/W4zrG6P7wdxMUk7y1gP4aWoksQl6V
	TbQmh1ZbbScffPyjmfP0nXGZR3w7Hdnc4ywqwQ0P5zuxX07uFPWXRTvgGEjLCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2YqBVOHBfNFQlYc2gfs+s/qyh0QTOeEVhJlFH/p2/E=;
	b=9vMVf9CbfgONWR64KkrCcVV2A6E13/KxqF+wIJ6JAeIgkdde2/u1qMBZ2EVk1IjlQezOJt
	gT4pUMl2c2fdb5AA==
Date: Thu, 10 Oct 2024 17:44:52 +0200
Subject: [PATCH 9/9] MIPS: vdso: Remove timekeeper includes
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-9-7fe5a3ea4382@linutronix.de>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1279;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/bLPps0kAlBRHgd8VurrfZ2wFo+tXRF7XdxLtwWPU+E=;
 b=70spRKqHOmT+bRC0fNPVPL3cOST7P0HmO7QAaigcg8bU87MT4d/jPV/ffmUNPS4FcH3K4ltDk
 qXWF2y4zePwCAnlPQXanKbWKEAG//thS3UqbZsh6pujUgMXZF0G2YYS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_164501_709628_1467C2FA 
X-CRM114-Status: UNSURE (   8.38  )
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

U2luY2UgdGhlIGdlbmVyaWMgVkRTTyBjbG9jayBtb2RlIHN0b3JhZ2UgaXMgdXNlZCwgdGhpcyBo
ZWFkZXIgZmlsZSBpcwp1bnVzZWQgYW5kIGNhbiBiZSByZW1vdmVkLgoKVGhpcyBhdm9pZHMgaW5j
bHVkaW5nIGEgbm9uLVZEU08gaGVhZGVyIHdoaWxlIGJ1aWxkaW5nIHRoZSBWRFNPLAp3aGljaCBj
YW4gbGVhZCB0byBjb21waWxhdGlvbiBlcnJvcnMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vp
w59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL21pcHMv
aW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oIHwgMSAtCiBhcmNoL21pcHMva2VybmVsL3Zkc28u
YyAgICAgICAgICAgICAgIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaCBiL2FyY2gv
bWlwcy9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKaW5kZXggNDcxNjhhYWYxZWZmMDUxMTk5
Y2Y2NjhkNTg0ZTkwM2IxZWI4YTNiZS4uYTQ1ODI4NzBhYWVhNDlhYzI4OGQ2MmVjNGZhMTMzOGE5
ODYyMTkxOCAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwu
aAorKysgYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oCkBAIC00LDcgKzQs
NiBAQAogCiAjaWZuZGVmIF9fQVNTRU1CTFlfXwogCi0jaW5jbHVkZSA8bGludXgvdGltZWtlZXBl
cl9pbnRlcm5hbC5oPgogI2luY2x1ZGUgPHZkc28vZGF0YXBhZ2UuaD4KIAogZXh0ZXJuIHN0cnVj
dCB2ZHNvX2RhdGEgKnZkc29fZGF0YTsKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rZXJuZWwvdmRz
by5jIGIvYXJjaC9taXBzL2tlcm5lbC92ZHNvLmMKaW5kZXggZGRhMzZmYTI2MzA3ZTI3ZDNkZTQx
NGM4MTE0NTBlZDkxMjI5NGEwZS4uNGM4ZTNjMGFhMjEwNDc2ZDdiOGNiMzQ5Yjk5ZTlhNWE0NTNh
YTdjZSAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2tlcm5lbC92ZHNvLmMKKysrIGIvYXJjaC9taXBz
L2tlcm5lbC92ZHNvLmMKQEAgLTE0LDcgKzE0LDYgQEAKICNpbmNsdWRlIDxsaW51eC9yYW5kb20u
aD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KLSNp
bmNsdWRlIDxsaW51eC90aW1la2VlcGVyX2ludGVybmFsLmg+CiAKICNpbmNsdWRlIDxhc20vYWJp
Lmg+CiAjaW5jbHVkZSA8YXNtL21pcHMtY3BzLmg+CgotLSAKMi40Ny4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
