Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE15C43602
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 11:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwxrI4jdwERKH+ek68Bv/FbG5G4TpF3hXAXgLyILdz4=; b=njLjpYV6v8eONv
	4PEqslHU5FLIxTWnUOLOVFdgoMNxIRYuQB6phhAlyeTIXlP9aEoq/EhSWrdDcnOfUJgUvJKA7YTBb
	q4cv00KJWDXtrv6roffCMqbaJUISYbk6B/no/pdz0wp11Bmaqb+IHBNJ6AfVCj+fOv1Idg2YYUa2y
	4oyTAI+eUNLtWxhGNao6kUxCoaZVQ26B/e4PhwfikKs+xdNeDefZXwEQVi/5Z0gvExZQkn09xZ8sO
	XZv9ng8++6KG/l08xvEfqXrbx3GpKgqd6o3T5HgMStLi1+zbU3tRoGtdFsf5hb/W4Dc17Zl+UM0Gf
	gUpgNVtUxefQwlTu/GMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weshO-00000001OsF-24qy;
	Wed, 01 Jul 2026 11:01:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weshL-00000001OrH-387f;
	Wed, 01 Jul 2026 11:01:45 +0000
Date: Wed, 1 Jul 2026 13:01:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782903701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNxVJGEMAXRCpSTfvSk7rdKi0pYQo3rQCK08bwqgoOk=;
	b=3HifUbZ21ScKQtWF6SIw5j3fCUEdR+xRpgI6ZiVs3+DcPllGZA8Ji94V+XUdwDrNcM/7ij
	+H8qYhqLmRVhTFU9Xbty5DTZ8XxGKDqRxQxL1vTqr6BEMw6zmurDnk/JsaoKxSXYAcjN1F
	6Uzt7JsgKFkfst0NWwo8OmJzzjDn+oVuzb9b+HlGgbTb3HddAJsW7TEB+3Wy+xPQgTAZW4
	rSQ74uPNXSFR1hJkaQBX03oVNJspPKuqg0v9yXuMEiJZy1/UuO/gMZkPv3oZJ8hom+tEGH
	PvfGbzUklh8YNbdEj41qDzenKHO+aXOoCmp6dRiLzh0hagRlV5ggtMdszJWLcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782903701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNxVJGEMAXRCpSTfvSk7rdKi0pYQo3rQCK08bwqgoOk=;
	b=LJJCbaRz0pqf6PD4GbhO2SME6PRZyX4Kho1+qmiOyaUmczMK9UnqGhmiZqX5vxb5Za35B/
	Y1Mq4Y/RXRZ4NvBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH v5 8/8] futex: Use runtime constants for __futex_hash()
 hot path
Message-ID: <20260701110139.z8WokGYM@linutronix.de>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-9-kprateek.nayak@amd.com>
 <20260701075714.GP48970@noisy.programming.kicks-ass.net>
 <20260701084150.GNOeboLw@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701084150.GNOeboLw@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_040144_062172_B398697A 
X-CRM114-Status: UNSURE (   7.04  )
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

T24gMjAyNi0wNy0wMSAxMDo0MTo1NSBbKzAyMDBdLCBUbyBQZXRlciBaaWpsc3RyYSB3cm90ZToK
PiBUaGlzIG1ha2VzIGl0IGdvIGF3YXkgYXQgbm8gZXh0cmEgcHJpY2UgYnV0IHllYWggbGV0IG1l
IGJvb3QgYSBiaWcgYm94Cj4gYW5kIHNlZS4KCmFzLWlzOgp8JCAuL3BlcmYgYmVuY2ggZnV0ZXgg
aGFzaCAtZiAxIC10IDEgLXIgMTAgLWIgMAp8ICMgUnVubmluZyAnZnV0ZXgvaGFzaCcgYmVuY2ht
YXJrOgp8IFJ1biBzdW1tYXJ5IFtQSUQgMzU4OF06IDEgdGhyZWFkcywgZWFjaCBvcGVyYXRpbmcg
b24gMSBbcHJpdmF0ZV0gZnV0ZXhlcyBmb3IgMTAgc2Vjcy4KfCAKfCBbdGhyZWFkICAwXSBmdXRl
eDogMHg1NTU1ZTVhZDQ3NDAgWyA2NDQ5NjMyIG9wcy9zZWMgXQp8IAp8IEF2ZXJhZ2VkIDY0NDk2
MzIgb3BlcmF0aW9ucy9zZWMgKCstIDAsMDAlKSwgdG90YWwgc2VjcyA9IDEwCnwgRnV0ZXggaGFz
aGluZzogZ2xvYmFsIGhhc2gKCnJvdWdobHkgdGhhdCBhcmVhLCByZXBlYXRlZCBydW5zIHVzdWFs
bHkgY2hhbmdlIHRoZSBsYXN0IHRocmVlIGRpZ2l0cy4KUGF0Y2hlZDoKCnwgJCAuL3BlcmYgYmVu
Y2ggZnV0ZXggaGFzaCAtZiAxIC10IDEgLXIgMTAgLWIgMAp8ICMgUnVubmluZyAnZnV0ZXgvaGFz
aCcgYmVuY2htYXJrOgp8IFJ1biBzdW1tYXJ5IFtQSUQgMjM3NV06IDEgdGhyZWFkcywgZWFjaCBv
cGVyYXRpbmcgb24gMSBbcHJpdmF0ZV0gZnV0ZXhlcyBmb3IgMTAgc2Vjcy4KfAp8IFt0aHJlYWQg
IDBdIGZ1dGV4OiAweDU1ODVkZGViZDc0MCBbIDY1MzIwMDQgb3BzL3NlYyBdCnwKfCBBdmVyYWdl
ZCA2NTMyMDA0IG9wZXJhdGlvbnMvc2VjICgrLSAwLDAwJSksIHRvdGFsIHNlY3MgPSAxMAp8IEZ1
dGV4IGhhc2hpbmc6IGdsb2JhbCBoYXNoCgpmb3IgcHJpdmF0ZSBoYXNoIHRoZXJlIGlzIGNoYW5n
ZSB3aXRoaW4gdGhlIG5vaXNlIGFyZWEgZm9yIC1iIDgxOTIuCgpTbyB3ZSBoYXZlIGhlcmUgKzEu
MjglIG9wcy9zZWMuIE5vdCBncm91bmQgYnJlYWtpbmcsIG5vdCBiYWQgZWl0aGVyLgoKV2l0aCBt
b3JlIHRocmVhZHM6CnwgJCAuL3BlcmYgYmVuY2ggZnV0ZXggaGFzaCAgLXIgMzAgLWIgMAp8ICMg
UnVubmluZyAnZnV0ZXgvaGFzaCcgYmVuY2htYXJrOgp8IFJ1biBzdW1tYXJ5IFtQSUQgMjQyNF06
IDE0NCB0aHJlYWRzLCBlYWNoIG9wZXJhdGluZyBvbiAxMDI0IFtwcml2YXRlXSBmdXRleGVzIGZv
ciAzMCBzZWNzLgp8IAp8IFt0aHJlYWQgIDBdIGZ1dGV4ZXM6IDB4NTU2ZjNhMzM4N2MwIC4uLiAw
eDU1NmYzYTMzOTdiYyBbIDIxMDQ0MjIgb3BzL3NlYyBdCuKApgp8IFt0aHJlYWQgMTQzXSBmdXRl
eGVzOiAweDU1NmYzYTNkOTY2MCAuLi4gMHg1NTZmM2EzZGE2NWMgWyAyMTA1NDgwIG9wcy9zZWMg
XQp8IAp8IEF2ZXJhZ2VkIDIxMTE0ODYgb3BlcmF0aW9ucy9zZWMgKCstIDAsMDMlKSwgdG90YWwg
c2VjcyA9IDMwCnwgRnV0ZXggaGFzaGluZzogZ2xvYmFsIGhhc2gKClRvOgoKfCAkIC4vcGVyZiBi
ZW5jaCBmdXRleCBoYXNoICAtciAzMCAtYiAwICAgICAgICAgIAp8ICMgUnVubmluZyAnZnV0ZXgv
aGFzaCcgYmVuY2htYXJrOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgCnwgUnVuIHN1bW1hcnkgW1BJRCAyNzIzXTogMTQ0IHRocmVh
ZHMsIGVhY2ggb3BlcmF0aW5nIG9uIDEwMjQgW3ByaXZhdGVdIGZ1dGV4ZXMgZm9yIDMwIHNlY3Mu
CnwKfFt0aHJlYWQgIDBdIGZ1dGV4ZXM6IDB4NTYwYTA5ZTQ4N2MwIC4uLiAweDU2MGEwOWU0OTdi
YyBbIDIxMzU2ODggb3BzL3NlYyBdCuKApgp8W3RocmVhZCAxNDNdIGZ1dGV4ZXM6IDB4NTYwYTA5
ZWU5NjYwIC4uLiAweDU2MGEwOWVlYTY1YyBbIDIxMzc2Njggb3BzL3NlYyBdCnwKfCBBdmVyYWdl
ZCAyMTM5Njg1IG9wZXJhdGlvbnMvc2VjICgrLSAwLDAzJSksIHRvdGFsIHNlY3MgPSAzMAp8IEZ1
dGV4IGhhc2hpbmc6IGdsb2JhbCBoYXNoCgorMS4zNCUuIEFnYWluLCBub3QgZ3JvdW5kIGJyZWFr
aW5nIGJ1dCBzdGlsbCB2aXNpYmxlLiBBbmQgdGhlIG1lbW9yeQpzYXZpbmdzLgoKVGhhdCBpcyBi
dHcsIDcuMi1yYzEgb24gYSBJbnRlbChSKSBYZW9uKFIpIENQVSBFNy04ODkwIHYzICg0IE5VTUEK
bm9kZXMpLgoKU2ViYXN0aWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
