Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F745CF07BE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBccEGmh5FvXH02CBoiIMw+EHQdOrK4BoO4PKhxaYaY=; b=0+2bjoCjco+a13
	NQS2vmm9yeD3UCstR5h9c9tPUHbemZMamWKeG7fNPGnNHZT7YxGIvHZ9KLJWYhKuwlMLmO84aNjLm
	9x/40NF2mXh8SXqz97ZOaI8ns24x3C2hCVlkUdFfXC34u1CRstoCOM8h3kQXCWwAQ1Lh7PaVD95dN
	Jni0zZ4xY1t515TJt2HG4mIFtLMc2lmQGeUmen1c1rBIrrNfGyD8vKo624JltA7d2GcCou2rSjxuT
	0HH3dCRkRjSqiTOC2T9vFI4fhVUKAh/agN9Msmz28fq6iCQCFv3s22n+6VsYVJHCmBpxWXwARDnKs
	acKmvQgKvvtdID/xkj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synh1-0000000Bqsy-1g63;
	Thu, 10 Oct 2024 07:34:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBn-0000000Blpd-1urz;
	Thu, 10 Oct 2024 07:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=H3pxKJZa6Dz9N7KL0fbqaL5NdHUudM6Tn8tfqCrpw3A=; b=E/t0Bf+ZJNar8gIvoqOcvHoV7N
	e4zXqXDWm5HUkV1ru0tC9HL5owoh3XZio6LNbk3Gs2d+zVEugcZtdZfx2c1FhgsBEGzLHdl4mnEsI
	CIY9wi6CjKX6k2Eyf7X8oXdNQwr7YMP83DljEQk/0gtm9FvLfJ8C1fgbOuzCxkNkSwUp68UwWDNk2
	S7HaIJ/RtOR7nXh52tLzR1avQM+mWMy/I0D+CsXEQ7/P+ND5q4xSFrg2o/I+NO7AFlf7TDy4IOQgM
	JuGa1Hm1CckhXgNIpIthwaaKFz3MIlNF6LUpsYm0MEGUIH33qihT/obnE1pLqlpdLsvumD8ybZbcW
	ckD5JsjQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBi-00000006yI7-1M1v;
	Thu, 10 Oct 2024 07:02:22 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3pxKJZa6Dz9N7KL0fbqaL5NdHUudM6Tn8tfqCrpw3A=;
	b=2DTRy1A1Cjt3N6qDqe5K0BoAWO29rvBuX3lWT/Kmdq6y6DUlcu+o5N8xMasJzUVFMAo323
	UCWJxZJB7uVwh7vYgi3rL2c0aF10kiV40gO86n/FY/Gs6ELFI+WXw7034+C6fvjVBU9+Km
	6cUj/yfxOGAwsXhHSJ2qvlw1ok88sEREx8RQhGYFJOIsTdYbYDwaEVkcsxgTzLpxI+TDis
	xeE+Yt3rVnUBreZ8INH6EZmxAjW4tIgl5jkaqNfISJLN0D4il65wDYfLb8f+yqiR/btJX7
	U8AKYv47UGDAMFlRmMSXU4DnS4ffmBoiLEGkqWweLFrxuGgKyqZ62pR70p4NYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3pxKJZa6Dz9N7KL0fbqaL5NdHUudM6Tn8tfqCrpw3A=;
	b=IV/lmQLC+tb6/qwPperJNfOrXaHrcDq0MS4XMYW93SesVIBdhcL1FpwRI9clUaqYuSppji
	GOyanx7CMHQtKaDQ==
Date: Thu, 10 Oct 2024 09:01:25 +0200
Subject: [PATCH 23/28] powerpc/pseries/lparcfg: Fix printing of
 system_active_processors
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-23-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1056;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HfYxZYn096ZmYlxVv66aK8g/TgQVVJxm5uuInCFA/Ag=;
 b=oZA7lqIB0ZYZamYJTdMLiIdxhQ9YAXkJRqSzP0DH/sWgj/BV0RrnPmuB+2EWqY1XHIcr4xxVG
 83Z3yTTuW7NAeyn0FiM1R3/kFvm4xnMGIAGj4qfIF/57BcVneBBZgVP
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080219_150579_725F99DD 
X-CRM114-Status: GOOD (  11.40  )
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

V2hlbiBwcmludGluZyB0aGUgaW5mb3JtYXRpb24gInN5c3RlbV9hY3RpdmVfcHJvY2Vzc29ycyIs
IHRoZSB2YXJpYWJsZQpwYXJ0aXRpb25fcG90ZW50aWFsX3Byb2Nlc3NvcnMgaXMgdXNlZCBpbnN0
ZWFkIG9mCnBhcnRpdGlvbl9hY3RpdmVfcHJvY2Vzc29ycy4gVGhlIHdyb25nIHZhbHVlIGlzIGRp
c3BsYXllZC4KClVzZSBwYXJ0aXRpb25fYWN0aXZlX3Byb2Nlc3NvcnMgaW5zdGVhZC4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4
LmRlPgotLS0KIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9scGFyY2ZnLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvbHBhcmNmZy5jIGIvYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy9wc2VyaWVzL2xwYXJjZmcuYwppbmRleCA2MmRhMjBmOTcwMGE5NzQyMDBj
MDVhOWQ1ZGU5MDg3NDZmMmYxNTFkLi5hY2M2NDBmY2NjYTE3YjU0YzQyZWNhMWEyNDJiMzdhZDQy
OTlmNjg1IDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvbHBhcmNm
Zy5jCisrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9scGFyY2ZnLmMKQEAgLTU1
Myw3ICs1NTMsNyBAQCBzdGF0aWMgaW50IHBzZXJpZXNfbHBhcmNmZ19kYXRhKHN0cnVjdCBzZXFf
ZmlsZSAqbSwgdm9pZCAqdikKIAl9IGVsc2UgewkJLyogbm9uIFNQTFBBUiBjYXNlICovCiAKIAkJ
c2VxX3ByaW50ZihtLCAic3lzdGVtX2FjdGl2ZV9wcm9jZXNzb3JzPSVkXG4iLAotCQkJICAgcGFy
dGl0aW9uX3BvdGVudGlhbF9wcm9jZXNzb3JzKTsKKwkJCSAgIHBhcnRpdGlvbl9hY3RpdmVfcHJv
Y2Vzc29ycyk7CiAKIAkJc2VxX3ByaW50ZihtLCAic3lzdGVtX3BvdGVudGlhbF9wcm9jZXNzb3Jz
PSVkXG4iLAogCQkJICAgcGFydGl0aW9uX3BvdGVudGlhbF9wcm9jZXNzb3JzKTsKCi0tIAoyLjQ3
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
