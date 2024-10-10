Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA25CF11C7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnSX4nW3cMJohsjWZLQeuOSbMXutXGhTHkeRVvTH4bk=; b=hInODrpRbcm5Ac
	8MhU6T8dz3BBbGOQ3LfPFif3rsJ4PN3R0LMg9qozA2m4ntb9Lnkx7VE+Lir6PBXtzmJpEUXRNw+Ap
	estkP0eHGWu4hq8m7Al7xCe7Z7viP/OrfeNdbeJ8VdeY8I7J+/tHfiI/Fp/rnLf1unSI4mO+QYzsa
	kdVNPPRWku3pl2eOyhbrJe1bOgm0ItzyT5hTL/k/cwL19qR4GyAJxdTaFl685m3g/6sRm1OuDGx9D
	77fSNSzEjgwsyN9WakhXn52jTllzWrf1yV5Ut2j0BGOSkVh5hf1Vysm/4dVVjzUryA8quDbwPfccv
	Aph/Z41/sgsvpDb1pG2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syvcb-0000000DSRX-3e7x;
	Thu, 10 Oct 2024 16:02:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLd-0000000DOes-1k7G;
	Thu, 10 Oct 2024 15:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bsHx7qJCDp7IdV2H4CgXW4RKtdZIxmt6s+IvFtPbyqE=; b=OGOLcX/WkUIsnhisT0MscbhjAW
	G+axQsE7Y/XW7AoIaLFhHIc6sicxfuxvT38RZ/bjg/4HGxM2mVeEfRhN88Azx1FVKNW731J194rKl
	PAaFRKhwAFw40VmTbiBb2eXyXJcURM4oiNRvuRp5uwcAyPkH4J+JHCEAhb4PquvOON4BvWNuEz08J
	Uutu7y/5hJzfDt8S33FSjcAoSxnuBDItWbDB7rLKDcEC0lZiPl/Vj+9ZwqgqO9itSFGixaYNFcEK2
	YC6lUW23logoRIGY2NyIkefAs/yphmTbczAyUcmhjktODTxqRCoWTlAMD4HmhOdSmdyNAV3+VGiWo
	5fbF/0Kw==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLZ-00000005Qir-1zvV;
	Thu, 10 Oct 2024 15:45:03 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsHx7qJCDp7IdV2H4CgXW4RKtdZIxmt6s+IvFtPbyqE=;
	b=bVQLUC+r0/Au47mrhMwXmYQ+ioZC+OFZQoOvliDU2YgPow76zr+3eWl1iXeXQZhzkvNZwd
	UPK06iM4TS7Qe1ogctAebisMoKyIvigMYwSGOVq3hBhS+c3bXWK+uBCOuqQ3kLjeewA8ZS
	rG14+VvgJM++oRIVOFyJ1jrq0nT0z3kaIg0GDV4oUwtHOb/VqEoBbznA5eepHjJtLa1yf6
	9oKUQg/C8OKSYEgCQUiyTZtCgq7vPnxrSjfCAyGhhyBbLa1JgDepmxG5SESflfsr4pcJ6d
	pGuJ1uewacreeZPZeLE8L8lTrYk04CiMrZhWKPhuKfdG2bkocEltbQ1y3tONtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsHx7qJCDp7IdV2H4CgXW4RKtdZIxmt6s+IvFtPbyqE=;
	b=ADrtVXTWURzZeYoLbH3CWO9mOnOqpADEsBH88QoqujF+oRUQAYvxREHZ8T5z5ujVWPMrLX
	COBQkfx97HO/rACA==
Date: Thu, 10 Oct 2024 17:44:51 +0200
Subject: [PATCH 8/9] LoongArch: vdso: Remove timekeeper includes
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-8-7fe5a3ea4382@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1624;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pLcSqgwzYZzBo43HvSx25Hsn5bLBJRfRGzhKUgfQZe0=;
 b=/+Ru4UIGFSWAYpglbGdQQ15IMR8PhPL5bPtGdy6DloWXB62UlxGU7KiFw9ja3fuJKbpuMnDZH
 Naozzxi/MEKCfguA2aYMFMxjwK8iC8KaCHVKnYuHz2d+3fK6HZI8guE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_164501_671124_C42B4CA4 
X-CRM114-Status: UNSURE (   9.92  )
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
IGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaCB8IDQgLS0tLQogYXJj
aC9sb29uZ2FyY2gva2VybmVsL3Zkc28uYyAgICAgICAgICAgICAgIHwgMSAtCiAyIGZpbGVzIGNo
YW5nZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVk
ZS9hc20vdmRzby92c3lzY2FsbC5oIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vdmRzby92
c3lzY2FsbC5oCmluZGV4IGIxMjczY2U2ZjE0MDY5MWFlODEwNGIyYmUzZDEyMDNlYmM1N2ZhYzIu
Ljg5ODdlOTUxZDBhOTNjMzRjYTc1ZGU2NzZmYjljMTkxZmY0ZWYzYzIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaAorKysgYi9hcmNoL2xvb25n
YXJjaC9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKQEAgLTQsMTUgKzQsMTEgQEAKIAogI2lm
bmRlZiBfX0FTU0VNQkxZX18KIAotI2luY2x1ZGUgPGxpbnV4L3RpbWVrZWVwZXJfaW50ZXJuYWwu
aD4KICNpbmNsdWRlIDx2ZHNvL2RhdGFwYWdlLmg+CiAKIGV4dGVybiBzdHJ1Y3QgdmRzb19kYXRh
ICp2ZHNvX2RhdGE7CiBleHRlcm4gc3RydWN0IHZkc29fcm5nX2RhdGEgKnZkc29fcm5nX2RhdGE7
CiAKLS8qCi0gKiBVcGRhdGUgdGhlIHZEU08gZGF0YSBwYWdlIHRvIGtlZXAgaW4gc3luYyB3aXRo
IGtlcm5lbCB0aW1la2VlcGluZy4KLSAqLwogc3RhdGljIF9fYWx3YXlzX2lubGluZQogc3RydWN0
IHZkc29fZGF0YSAqX19sb29uZ2FyY2hfZ2V0X2tfdmRzb19kYXRhKHZvaWQpCiB7CmRpZmYgLS1n
aXQgYS9hcmNoL2xvb25nYXJjaC9rZXJuZWwvdmRzby5jIGIvYXJjaC9sb29uZ2FyY2gva2VybmVs
L3Zkc28uYwppbmRleCBmNmZjYzUyYWVmYWUwMDQzZTMwNzMyN2I4ZTdhNTg3MmZhZDA4MjJhLi40
ZDdjYjk0MjVkYzM0NTg0ZGQ3YWJkYjgwYTc4NGE0ZjI5MzJlMWI3IDEwMDY0NAotLS0gYS9hcmNo
L2xvb25nYXJjaC9rZXJuZWwvdmRzby5jCisrKyBiL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC92ZHNv
LmMKQEAgLTE1LDcgKzE1LDYgQEAKICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUg
PGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC90aW1lX25hbWVzcGFjZS5oPgotI2luY2x1
ZGUgPGxpbnV4L3RpbWVrZWVwZXJfaW50ZXJuYWwuaD4KIAogI2luY2x1ZGUgPGFzbS9wYWdlLmg+
CiAjaW5jbHVkZSA8YXNtL3Zkc28uaD4KCi0tIAoyLjQ3LjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
