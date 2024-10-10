Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFA8CF07C8
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 08:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ip17pmB7PsbzszazzcpaGytmtlPQWjWiqoxyYRoJuZQ=; b=voDeOafpZJyfbJ
	rjOmt8bexxFThyzWYSGyFv9j3WARyGN5P79bpuAGvoJlEbSO6sIoknmJxM0uRcR4lOnsX1qUqUi65
	ONZV3U3dWbg3D/Km+faOC5aAJCVObSwXijQrpOidUJ04Zk9fkIzZrad2jq5PBXaVG/Q9wJVNyrMJK
	1tcSGfRlpfubx92hKvmqLBAfnVB6ExYkFMFKpOoO/EZmTuMsIUSZtbdae3HHPxzoxKsC7zO2f/iIf
	Vx/68/JWLzrMdo18+IormtOsidcxdIY5AtjPG/lmsOBeVaRu9sj2XzJtCE8o01GhjFNps4r6dg5BR
	FLs1kh7ynzAgZ4s9ARkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syooE-0000000C4F9-2oLM;
	Thu, 10 Oct 2024 08:46:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBj-0000000BlnL-2qVR;
	Thu, 10 Oct 2024 07:02:37 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LP0hk2FuVWMkIH2lJtKmZQH6c1LDdfDQst6rCNa4pzU=;
	b=OsPDoj04Z4RSZNlsLV888deerj4w+hB2Ln35SeNDjwL7sNeyYHjNN2Lzl8ME+keSBorRON
	3Ea/C8rmiBf/B3NDxRRsVjvO1fNDiWPmj8/UfvYa/uIPgo1B9ckMhEaDqb0OSqR83WCqZg
	BEq7UWOFJGyXZyiT/fI1tH8AoHR2Of18EGKoXEFM1Txke+ntHd7/AXNUQ8USw9wCkzzCYa
	9R2Uunlf/zn+dtWEUrwRK9APM7O5JwfbEkPx/OJJ5gY41VFWBKJdRt0qbRQkAWPbdnDp89
	AKrY9GEaMohgJe/N7gZmJBbs9zQwLcg/O+4AsDbUcDWgHbIN/pKUwGgfGKGWnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LP0hk2FuVWMkIH2lJtKmZQH6c1LDdfDQst6rCNa4pzU=;
	b=uZQ0blBW9HT2ulSu6F1O3z7gz72EApU+rDi5lIMk2OHLEbZEv1p3LQYxwNCByu6BpYIV2f
	k0UV01jPmr6yXIBQ==
Date: Thu, 10 Oct 2024 09:01:26 +0200
Subject: [PATCH 24/28] powerpc/pseries/lparcfg: Use num_possible_cpus() for
 potential processors
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-24-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1399;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xl8NslvwmgdUlYXKqMSBkSIGo+Q6/TRE4tpTp6tPB6g=;
 b=i8N6VHR2dbk5BpKAW6jdHV8EjNkjT4udcZOMDwp1LfatWcSVkcJxtoTEMbI/wewMKiZ4UKRoS
 eQdEKwsbAlmCVbvp6A79N8+6Eo28lxI4ZbMuDyNT+01NBDCPxLLJAX4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_000219_918303_3380262B 
X-CRM114-Status: GOOD (  11.31  )
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

VGhlIHN5c3RlbWNmZyBwcm9jZXNzb3JDb3VudCB2YXJpYWJsZSB0cmFja3MgY3VycmVudGx5IG9u
bGluZSB2YXJpYWJsZXMsCm5vdCBwb3NzaWJsZSBvbmVzLCBzbyB0aGUgc3RvcmVkIHZhbHVlIGlz
IHdyb25nLgpUaGUgY29kZSBwcmVmZXJhYmx5IHRyaWVzIHRvIHVzZSB0aGUgaWJtLGxyZHItY2Fw
YWNpdHkgZmllbGQgNCB3aGljaAoicmVwcmVzZW50cyB0aGUgbWF4aW11bSBudW1iZXIgb2YgcHJv
Y2Vzc29ycyB0aGF0IHRoZSBndWVzdCBjYW4gaGF2ZS4iClN3aXRjaCBmcm9tIHByb2Nlc3NvckNv
dW50IHRvIHRoZSBiZXR0ZXIgbWF0Y2hpbmcgbnVtX3Bvc3NpYmxlX2NwdXMoKS4KClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRl
PgotLS0KIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9scGFyY2ZnLmMgfCAzICstLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9scGFyY2ZnLmMgYi9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zL3BzZXJpZXMvbHBhcmNmZy5jCmluZGV4IGFjYzY0MGZjY2NhMTdiNTRjNDJl
Y2ExYTI0MmIzN2FkNDI5OWY2ODUuLmNjMjI5MjRmMTU5ZjUwNDE2MTMwZjJkY2Q4ZjlkMGJhMGRj
MDk3M2YgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9scGFyY2Zn
LmMKKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL2xwYXJjZmcuYwpAQCAtMjks
NyArMjksNiBAQAogI2luY2x1ZGUgPGFzbS9maXJtd2FyZS5oPgogI2luY2x1ZGUgPGFzbS9ydGFz
Lmg+CiAjaW5jbHVkZSA8YXNtL3RpbWUuaD4KLSNpbmNsdWRlIDxhc20vdmRzb19kYXRhcGFnZS5o
PgogI2luY2x1ZGUgPGFzbS92aW8uaD4KICNpbmNsdWRlIDxhc20vbW11Lmg+CiAjaW5jbHVkZSA8
YXNtL21hY2hkZXAuaD4KQEAgLTUzMCw3ICs1MjksNyBAQCBzdGF0aWMgaW50IHBzZXJpZXNfbHBh
cmNmZ19kYXRhKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqdikKIAkJbHJkcnAgPSBvZl9nZXRf
cHJvcGVydHkocnRhc19ub2RlLCAiaWJtLGxyZHItY2FwYWNpdHkiLCBOVUxMKTsKIAogCWlmIChs
cmRycCA9PSBOVUxMKSB7Ci0JCXBhcnRpdGlvbl9wb3RlbnRpYWxfcHJvY2Vzc29ycyA9IHZkc29f
ZGF0YS0+cHJvY2Vzc29yQ291bnQ7CisJCXBhcnRpdGlvbl9wb3RlbnRpYWxfcHJvY2Vzc29ycyA9
IG51bV9wb3NzaWJsZV9jcHVzKCk7CiAJfSBlbHNlIHsKIAkJcGFydGl0aW9uX3BvdGVudGlhbF9w
cm9jZXNzb3JzID0gYmUzMl90b19jcHVwKGxyZHJwICsgNCk7CiAJfQoKLS0gCjIuNDcuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
