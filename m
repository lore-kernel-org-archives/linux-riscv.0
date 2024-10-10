Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB48CF07BE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwsCsxmDZHZKgz1kZRojXABnyXzBfD1c14YT2K2LZ34=; b=1Uv4i+kLkbgrCQ
	MBxYw8dWvyfbAACTnTQtH0ayNkQkpQ81U/mAD1WW7Qxof0QsZ2A44yQrFSNtVSa4GfkjTPB/qMkU8
	gcVsz8S+yKrjOPx8u5gdlTcBASaaSs5DgehXaU6hyyDremLFnwx6J7nMQ6gtHDK1d6OnoiOXUUDKd
	QAo1f2U4MjrKXXpOOk2bCo5R/DXft3W6iYvwcU4xBys94ME+93KN/C8sEg5dBpPsqMjHa6ThKKsDa
	2RuvkZQsC/PpZvK/JgriUfbIGlULtTf/svY8hcYdhuTTBkhAjnXB7pKEY7Va29HwsEy1yGbsX+tsr
	UgciesE0jBaqottf/idQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synd5-0000000Bq6p-1kwg;
	Thu, 10 Oct 2024 07:30:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBl-0000000Blon-3VPH;
	Thu, 10 Oct 2024 07:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=KSbAwh0OU3zF+2tR9EWcVzlag/ghCJTrirF1U/EmWUc=; b=jAgMNiEYktFsdAIaf+aafEPciL
	hELSJP5hujOjRgtz/ZacQdsPGTiL3GYKF8FC7NxvkdZ8tHU4qtQTgUsE/Je5x1PkQ/oRVGMvIrOos
	ys0ifjuKTEIG1uwlH/VvkQAUthCpgH4eg8n5VcEN+kQw6g93a1KLTga34azXs+dX60e9y/w2b8BbN
	VtyKlXiaKBXblT9fshpr7s6vuLdTkVUqHrYRVpsX4v740/05m91BH6a+T2a4dhOhWNJzW+3rRJj5T
	adYC1mR+ux6znUs4zFKEG69ihaeFpCtQC1YpPCf2gRfa9qi1JV1eo2yGurKm64zIpa5XOYFHNtjWd
	F/1EVycQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBg-00000006yG0-2ZRM;
	Thu, 10 Oct 2024 07:02:20 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSbAwh0OU3zF+2tR9EWcVzlag/ghCJTrirF1U/EmWUc=;
	b=fT0XYr4bt3T8KG54HnN3IYu2UZ0oTO+t6RT7qYYVQ5ARIpM6klUk3a2g0UECskgVzPJfdN
	VT6ZV16Gf1SZohSZwi/MhptGx/HtmLY7jjmapoXCxbKjWk+DXYGNIb8s/wBv0s96WfT8B3
	anvuKC8obtknKT/40GHIWCtdpiHFy0kip7ZlHlcF5yTR/pRYuUl6zaluvDOjReafPMqlbr
	bxp2t8chniqiO6W2rONnBrnLNcFpA3e7mFUcmYnHHbKpxNrRG2exEH+hX1EOvrVu0rhwRP
	54szeRYq9V+rGF7eaeewh09tD2xsVlJoD++R8Xl1eiU0kNaZf3iVydyqKa/wcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSbAwh0OU3zF+2tR9EWcVzlag/ghCJTrirF1U/EmWUc=;
	b=RLtYsY+xUckUP0mZzR4vMb5ox7tYb5/K6vCHcQmXEE2h+d6EE9vVy/zlRHhln4NALyW684
	UK3WXX9KOUIHitCg==
Date: Thu, 10 Oct 2024 09:01:23 +0200
Subject: [PATCH 21/28] powerpc: vdso: Remove offset comment from 32bit
 vdso_arch_data
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-21-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=977;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XEWFVUSPeF1jA5lPR0wVB+XVxyxTVSWbfiAECWo8WxA=;
 b=am78tsBd74RSO+kD9Bu9TdSyO3ydCuUjYTZu3uyOVJurwtzIFBgZGPAxHaCrBfouNaLGr49Ox
 fsYzkbNAIVfDQitCU8gng++Dlgtv6VnR21Em9CwtI8nf81CpBJx+Yzl
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080217_451223_27A5E96E 
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

VGhpcyBvZmZzZXQgd2FzIGNvcHktcGFzdGVkIGZyb20gdGhlIHN5c3RlbWNmZyBzdHJ1Y3R1cmUu
Ckl0IGhhcyBubyBtZWFuaW5nIGZvciB0aGUgMzJiaXQgVkRTTy4KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS92ZHNvX2RhdGFwYWdlLmggfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vdmRzb19kYXRhcGFnZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL3Zkc29fZGF0YXBhZ2UuaAppbmRleCAyNDhkZWUxMzhmN2JmNWRjMTFhOTQ5MGE5N2Y0YTM5
MTdiYzQ2ZTkyLi4zZDU4NjJkNGM0ZTE2MThhMjc4NDBkOTEzNmU4OTA4NzBlNzhhNzYxIDEwMDY0
NAotLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdmRzb19kYXRhcGFnZS5oCisrKyBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS92ZHNvX2RhdGFwYWdlLmgKQEAgLTkyLDcgKzkyLDcgQEAg
c3RydWN0IHZkc29fYXJjaF9kYXRhIHsKICAqIEFuZCBoZXJlIGlzIHRoZSBzaW1wbGVyIDMyIGJp
dHMgdmVyc2lvbgogICovCiBzdHJ1Y3QgdmRzb19hcmNoX2RhdGEgewotCV9fdTY0IHRiX3RpY2tz
X3Blcl9zZWM7CQkvKiBUaW1lYmFzZSB0aWNzIC8gc2VjCQkweDM4ICovCisJX191NjQgdGJfdGlj
a3NfcGVyX3NlYzsJCS8qIFRpbWViYXNlIHRpY3MgLyBzZWMgKi8KIAlfX3UzMiBzeXNjYWxsX21h
cFtTWVNDQUxMX01BUF9TSVpFXTsgLyogTWFwIG9mIHN5c2NhbGxzICovCiAJX191MzIgY29tcGF0
X3N5c2NhbGxfbWFwWzBdOwkvKiBObyBjb21wYXQgc3lzY2FsbHMgb24gUFBDMzIgKi8KIAlzdHJ1
Y3QgdmRzb19kYXRhIGRhdGFbQ1NfQkFTRVNdOwoKLS0gCjIuNDcuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
