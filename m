Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CC0CFC5F1
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VD96iJwmf22U16uxZ4A+fCOd8r0EN1ch5xxAgd7pBzU=; b=Nn2p1dDfKbxyif
	aWrL8bBnK50NonUlPFEOfefoaxffQgs91domZ4QRgYHdIm5yRCAsmG0/6hcRdqfWBp/fZnbUATHe6
	hEQxVsxfi68dGep0NgwugFsOaFkuxpu0xAS+/BcqSJRcJlT/1AQ2FYY8ktcbmAS8CMgRAr0wHNDxC
	QPssp4AI7PEz09GVKu5ml8Q70SDzRZ/y4gQd9bofQ6hJVvYVp9YWv2VVtFON9w0oocEgroi8gn5Sk
	uTvEqxzN3k/NJn5N5mFK6PPG1YXg5CTnmiKHDXsJWmAn399/2Agc5EqnakFE8DV8lStK9uzn98vRO
	KP8teqx+8i2StX2GfacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sywly-0000000DdtP-12gW;
	Thu, 10 Oct 2024 17:16:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLU-0000000DOZD-1ecW;
	Thu, 10 Oct 2024 15:45:11 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//WOaSb+qiFuhDcrD1QvrKSX9jq6HrXx3vMVSTOjlpM=;
	b=2VrXyCvlEPG/qSkhA7AEYBYXeD45ZWKkLTe2Mlb6dw7lZRpUe5oEjGYhhUTX9WxqWueCmX
	bWyV8FnZpDzj5zu6qChhR6ojn1Jco3nNNl6s6iqrrUSoJjd1fIrYn3aeRZ/SExewoutWqf
	D5xXvosPkw4N7cOT+3CDeFTl0H83mGQjnQU0pXyQWSEffFSNQWpuR0lJXUguCuMfB9XWp3
	vpIgRP5XjW5p56Eo3UApKPrbAzpyLxDzfUjNyI1flxZBOJLMcQhg7ZgijRNfW34LG2iHhk
	LUe6H17KpbiZZMKc2tFVOsdVPc27Hyahhm3Yb4c82oQB0prBIni+Hbhledyjmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//WOaSb+qiFuhDcrD1QvrKSX9jq6HrXx3vMVSTOjlpM=;
	b=84jkthMWjxjsydzn/4oqUu2+UXGDE3w3mSl6Nx3zbBL3u4gTWtw+ZFEf10TNhsDTjLWQy+
	cBy+YXEZCzhNQPAA==
Date: Thu, 10 Oct 2024 17:44:47 +0200
Subject: [PATCH 4/9] powerpc/vdso: Remove timekeeper includes
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-4-7fe5a3ea4382@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1560;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2LvKRYHam7JPvf9YTnYT/Pt96cAREdv5IB7CnEDdMso=;
 b=wCeMto8LigT0NWmLWaYqjH4etZsM507fuDoQptvkr3x3QkMHLdq+92lLyQYSHdu4J9UgjahuM
 gvKGsW+JLn0B/ParFwQLICcr2DHaXVyP0GNd1k0EsAzL/zETzTfLLPv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_084456_608173_EC64892B 
X-CRM114-Status: UNSURE (   9.81  )
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
YW4gbGVhZCB0byBjb21waWxhdGlvbiBlcnJvcnMuCgpBbHNvIGRyb3AgdGhlIGNvbW1lbnQgd2hp
Y2ggaXMgb3V0IG9mIGRhdGUgYW5kIGluIHRoZSB3cm9uZyBwbGFjZS4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0K
IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggfCA0IC0tLS0KIGFyY2gv
cG93ZXJwYy9rZXJuZWwvdGltZS5jICAgICAgICAgICAgICAgfCAxIC0KIDIgZmlsZXMgY2hhbmdl
ZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
dmRzby92c3lzY2FsbC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwu
aAppbmRleCA5MmY0ODBkOGNjNmRjYjkwNWQ1OTYwMTg1Y2E4YjYxNWNmYzU0MWVlLi40ODU2MGEx
MTk1NTk1NmI4ZmJiNTkzNjAzMzRhODE5NzI3MjNiZDU3IDEwMDY0NAotLS0gYS9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oCisrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS92ZHNvL3ZzeXNjYWxsLmgKQEAgLTQsMTIgKzQsOCBAQAogCiAjaWZuZGVmIF9fQVNTRU1C
TFlfXwogCi0jaW5jbHVkZSA8bGludXgvdGltZWtlZXBlcl9pbnRlcm5hbC5oPgogI2luY2x1ZGUg
PGFzbS92ZHNvX2RhdGFwYWdlLmg+CiAKLS8qCi0gKiBVcGRhdGUgdGhlIHZEU08gZGF0YSBwYWdl
IHRvIGtlZXAgaW4gc3luYyB3aXRoIGtlcm5lbCB0aW1la2VlcGluZy4KLSAqLwogc3RhdGljIF9f
YWx3YXlzX2lubGluZQogc3RydWN0IHZkc29fZGF0YSAqX19hcmNoX2dldF9rX3Zkc29fZGF0YSh2
b2lkKQogewpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC90aW1lLmMgYi9hcmNoL3Bv
d2VycGMva2VybmVsL3RpbWUuYwppbmRleCAwZmY5ZjAzOGU4MDBkYjZkYmM5MTBjZTU4MTU1MGI0
NTdlZTVmMmRiLi40YTk1NjU0YzFkMzZmMjVkNjAyMTI4NDg4OWZkZDE1MTA3ODJiNDA4IDEwMDY0
NAotLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3RpbWUuYworKysgYi9hcmNoL3Bvd2VycGMva2Vy
bmVsL3RpbWUuYwpAQCAtNzUsNyArNzUsNiBAQAogLyogcG93ZXJwYyBjbG9ja3NvdXJjZS9jbG9j
a2V2ZW50IGNvZGUgKi8KIAogI2luY2x1ZGUgPGxpbnV4L2Nsb2NrY2hpcHMuaD4KLSNpbmNsdWRl
IDxsaW51eC90aW1la2VlcGVyX2ludGVybmFsLmg+CiAKIHN0YXRpYyB1NjQgdGltZWJhc2VfcmVh
ZChzdHJ1Y3QgY2xvY2tzb3VyY2UgKik7CiBzdGF0aWMgc3RydWN0IGNsb2Nrc291cmNlIGNsb2Nr
c291cmNlX3RpbWViYXNlID0gewoKLS0gCjIuNDcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
