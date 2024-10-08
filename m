Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C8ACED26E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 06:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TVYBHcmFWRAX42Qu0L+yzjZZaa2d/CjVBZZbFU0pFHE=; b=GmyAxFWIZ3n3lJ
	rZFvf6SKhar4sClSA6gcaywoIRoPjJfJpWIZYvSCdAeFZSVEpYTndWKkTLibX7KVRVX3uWx/cBdr2
	g4xMM4gwmPxWK50AsECFTgWmR9rSBB7EM2xkh4bKYgiJ6J8R1ZIJSrOeFQFbjK8tDDkOVPM3Pwlx4
	4JDU3E7bWMp0LCjpkmVriRuJEgwJFNwRwG+Z2p4TG91ejnV7QOWtCnRckfrI/E2UWeT31SBgY7K+T
	lgBYwwRXP0TM1zWIP8dzR0xg8MDjFgFesasj2lVkxsBrRohFxYfiC3slhN0JV9EHbcjQ9Ni/oF49e
	GbDpaBhYOeJbPQI1846Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3gj-00000004eZB-3cUA;
	Tue, 08 Oct 2024 06:27:17 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3e2-00000004e5w-21P7;
	Tue, 08 Oct 2024 06:24:36 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XN5Zw3r7hz9sPd;
	Tue,  8 Oct 2024 08:24:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83WsnfrASkNO; Tue,  8 Oct 2024 08:24:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XN5Zw2vlKz9rvV;
	Tue,  8 Oct 2024 08:24:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F4488B788;
	Tue,  8 Oct 2024 08:24:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WqcteU_NOog8; Tue,  8 Oct 2024 08:24:24 +0200 (CEST)
Received: from [192.168.233.14] (unknown [192.168.233.14])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CB258B763;
	Tue,  8 Oct 2024 08:24:23 +0200 (CEST)
Message-ID: <8e99826f-b38a-4cb3-ba5e-a20512248853@csgroup.eu>
Date: Tue, 8 Oct 2024 08:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
To: Steven Rostedt <rostedt@goodmis.org>, LKML
 <linux-kernel@vger.kernel.org>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20241007204743.41314f1d@gandalf.local.home>
 <20241007205458.2bbdf736@gandalf.local.home>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241007205458.2bbdf736@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_232430_959792_21EA439B 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAwOC8xMC8yMDI0IMOgIDAyOjU0LCBTdGV2ZW4gUm9zdGVkdCBhIMOpY3JpdMKgOgo+IE9u
IE1vbiwgNyBPY3QgMjAyNCAyMDo0Nzo0MyAtMDQwMAo+IFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPiAKPj4gKyNpZm5kZWYgQ09ORklHX0hBVkVfRFlOQU1JQ19G
VFJBQ0VfV0lUSF9BUkdTCj4+ICtzdHJ1Y3QgX19hcmNoX2Z0cmFjZV9yZWdzIHsKPj4gKwlzdHJ1
Y3QgcHRfcmVncwkJcmVnczsKPj4gK307Cj4+ICsKPj4gKyNkZWZpbmUgYXJjaF9mdHJhY2VfZ2V0
X3JlZ3MoZnJlZ3MpCQkJCQlcCj4+ICsJKHsgc3RydWN0IF9fYXJjaF9mcmVnc19yZWdzICpfX2Yg
PSAoc3RydWN0IF9fYXJjaF9mdHJhY2VfcmVncyAqKShmcmVncyk7IFwKPj4gKwkJJl9fZi0+cmVn
czsJCQkJCQlcCj4+ICsJfSkKPiAKPiBJIHdyb3RlIHRoZSBhcmNoX2Z0cmFjZV9nZXRfcmVncygp
IGF0IHRoZSBzdGFydCBvZiBjcmVhdGluZyB0aGlzIHBhdGNoLgo+IAo+PiArCj4+ICtzdHJ1Y3Qg
ZnRyYWNlX3JlZ3M7Cj4+ICsjZGVmaW5lIGFyY2hfZnRyYWNlX3JlZ3MoZnJlZ3MpICgoc3RydWN0
IF9fYXJjaF9mdHJhY2VfcmVncyAqKShmcmVncykpCj4+ICsKPiAKPiBJIGp1c3QgcmVhbGl6ZWQg
SSBjYW4gc2ltcGxpZnkgaXQgd2l0aDoKPiAKPiAjZGVmaW5lIGFyY2hfZnRyYWNlX2dldF9yZWdz
KGZyZWdzKQkoeyAmYXJjaF9mdHJhY2VfcmVncyhmcmVncyktPnJlZ3M7IH0pCgpJcyBpdCBwb3Nz
aWJsZSB0byB3cml0ZSBpdCBhcyBhIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb24gdG8gZW5mb3JjZSB0
eXBlIApjaGVja2luZyA/Cgo+IAo+IEkgbWF5IHNlbmQgYSB2MiAodG9tb3Jyb3cpLgo+IAo+IC0t
IFN0ZXZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
