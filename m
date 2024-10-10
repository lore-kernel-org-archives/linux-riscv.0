Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E455CEE323
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 15:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7CD3YXvywx4erYZyeIEuBlkZHaeIjzTEDSF0dND4aJA=; b=3++if2D/dPs012
	32xdv+olmpw6a4x8t7NMTT3LRjFS8ensqeGccQLALZ02qrZs0CAzXqHui0lfVsB2U6FC2fZdLNTsp
	imU16zxB/DpJ72ohxCcPfy4lEQAYqoHqjGhKrvzY/3hQk+9T1nMHSZTLzYG6W3kbJ9XIqCv0mH4E5
	xs7Rt4/DdzYky3hlO0cCC8trhmTtz+rps/Ft3CnGFnJ48p+PNvsghLA7/h+Obccf9UY+oEvxOg7Hl
	uqnazam6fr/q4HSIPZc1fY1BJbdp4r0D3soDpKLqaayLPZpE3Mem8+w1dfHYauSTj9nUzbfHik9rY
	A2pDZzZj03TTRGYwq5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syvZg-0000000DReu-1yBl;
	Thu, 10 Oct 2024 15:59:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLT-0000000DOYz-22uc;
	Thu, 10 Oct 2024 15:44:59 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WB2N5QQfjQyKK/IUZ575K6iS8NC3eDxd0F8948RG5sI=;
	b=ps5/mk3mLsDUcipYhz2wooMeo7xb/Bn2oBPHVLBrTQ3HFkqDcYJw7haKo5JLGLxvxpa0Ut
	iVzD3jy/0zexbSOPVOypbrhox3PKsimdvyEuOqVawg0v8ms+IgZEUUSIkzUOYLP6cWrJhV
	ogjefToGPLbVkuZ/zwTjy4REwnantdhl3WvBJbGxAbb+aWMlxri+pW5bG7xV+TgIoFlZJU
	u4Jgp0XP7/cOTC3s2qC1LSczikNFB8FXdDPVckdjW25HunnkiMwr/osgbleBYRyHT7LUND
	f89GQ/KI9KFltOPdCFC4scwzYUBNIQJopih6hTVRKhrpODcOlXJsnP8rMFX8jQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WB2N5QQfjQyKK/IUZ575K6iS8NC3eDxd0F8948RG5sI=;
	b=emr3NoHm0dHHfPU9ByEiH4Mdm2TEYYw/8+O2ANg9R48cypLGQulPkR9BJ0bgx2rqUqf5G4
	7XJZRDGckZp7jGDg==
Subject: [PATCH 0/9] vdso: Remove timekeeper argument and includes
Date: Thu, 10 Oct 2024 17:44:43 +0200
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGz2B2cC/x2NwQqDMBAFf0X27EISSqv9FREJyasuSJSsDS3iv
 zf0OIeZOUmRBUrP5qSMIipbqmDbhsLi0wyWWJmccTdrrOESdeMZqWqBfQ7L9N6jPzAV/Wrw68r
 mbjv0HRz6B9XOnvGSz/8xjNf1A5OTjDxzAAAA
X-Change-ID: 20241010-vdso-generic-arch_update_vsyscall-0618e98e2e97
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=2075;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vEHRAngD9MuOuPCRiDNA82VJK+gEUM8qSBaRt6uEvJ8=;
 b=szGvUeLPyxK9BXdP3C2DAht9jfEjDDdicb9QA7bfacls7AZdd5//5wdmNBRY3OWPdXAQ8Ggs1
 vq/W4RoWU/nAhk3XVNwRQTRkMgu+o4WOS9VefNnOTg/jkrdU3MIarWk
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_084455_840256_A65077C6 
X-CRM114-Status: UNSURE (   8.21  )
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

VGhlIHRpbWVrZXBlciBhcmd1bWVudCBfX2FybTY0X3VwZGF0ZV92c3lzY2FsbCgpIGlzIG5ldmVy
IHVzZWQgYW5kCmZvciBoaXN0b3JpY2FsIHJlYXNvbnMgbWFueSBWRFNPIGhlYWRlcnMgYW5kIGlt
cGxlbWVudGF0aW9ucyBpbmNsdWRlCnRpbWVrZWVwZXIgaGVhZGVycy4KCldpdGggdGhlIG1vdmUg
dG8gdGhlIGdlbmVyaWMgVkRTTyBjbG9jayBzdG9yYWdlIG1vZGUgdGhlc2UgYXJlIHVudXNlZC4K
SW5jbHVkaW5nIGFyYml0cmFyeSBoZWFkZXJzIGZyb20gVkRTTyBjb2RlIGNhbiBsZWFkIHRvIGJ1
aWxkIHByb2JsZW1zLgoKUmVtb3ZlIGFsbCBvZiB0aGVtLgoKVGhlc2UgcGF0Y2hlcyBhcmUgaW50
ZW5kZWQgdG8gYmUgbWVyZ2VkIHZpYSB0aGUgdGlwIHRyZWUsCnNvIGZvbGxvd2luZyBwYXRjaGVz
IGNhbiBiZSBiYXNlZCBvbiBhIHVuaWZpZWQgYmFzZS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBX
ZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KVGhvbWFzIFdl
acOfc2NodWggKDkpOgogICAgICB2ZHNvOiBSZW1vdmUgdGltZWtlZXBlciBhcmd1bWVudCBvZiBf
X2FyY2hfdXBkYXRlX3ZzeXNjYWxsKCkKICAgICAgYXJtOiB2ZHNvOiBSZW1vdmUgdGltZWtlZXBl
ciBpbmNsdWRlcwogICAgICBhcm02NDogdmRzbzogUmVtb3ZlIHRpbWVrZWVwZXIgaW5jbHVkZQog
ICAgICBwb3dlcnBjL3Zkc286IFJlbW92ZSB0aW1la2VlcGVyIGluY2x1ZGVzCiAgICAgIHJpc2N2
OiB2ZHNvOiBSZW1vdmUgdGltZWtlZXBlciBpbmNsdWRlCiAgICAgIHMzOTAvdmRzbzogUmVtb3Zl
IHRpbWVrZWVwZXIgaW5jbHVkZXMKICAgICAgeDg2L3Zkc286IFJlbW92ZSB0aW1la2VlcGVyIGlu
Y2x1ZGUKICAgICAgTG9vbmdBcmNoOiB2ZHNvOiBSZW1vdmUgdGltZWtlZXBlciBpbmNsdWRlcwog
ICAgICBNSVBTOiB2ZHNvOiBSZW1vdmUgdGltZWtlZXBlciBpbmNsdWRlcwoKIGFyY2gvYXJtL2lu
Y2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaCAgICAgICB8IDQgLS0tLQogYXJjaC9hcm0va2VybmVs
L3Zkc28uYyAgICAgICAgICAgICAgICAgICAgIHwgMSAtCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNt
L3Zkc28vdnN5c2NhbGwuaCAgICAgfCAzICstLQogYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jICAg
ICAgICAgICAgICAgICAgIHwgMSAtCiBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS92ZHNvL3Zz
eXNjYWxsLmggfCA0IC0tLS0KIGFyY2gvbG9vbmdhcmNoL2tlcm5lbC92ZHNvLmMgICAgICAgICAg
ICAgICB8IDEgLQogYXJjaC9taXBzL2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaCAgICAgIHwg
MSAtCiBhcmNoL21pcHMva2VybmVsL3Zkc28uYyAgICAgICAgICAgICAgICAgICAgfCAxIC0KIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggICB8IDQgLS0tLQogYXJjaC9w
b3dlcnBjL2tlcm5lbC90aW1lLmMgICAgICAgICAgICAgICAgIHwgMSAtCiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaCAgICAgfCA0IC0tLS0KIGFyY2gvczM5MC9pbmNsdWRl
L2FzbS92ZHNvL3ZzeXNjYWxsLmggICAgICB8IDUgLS0tLS0KIGFyY2gvczM5MC9rZXJuZWwvdGlt
ZS5jICAgICAgICAgICAgICAgICAgICB8IDEgLQogYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby92
c3lzY2FsbC5oICAgICAgIHwgMSAtCiBpbmNsdWRlL2FzbS1nZW5lcmljL3Zkc28vdnN5c2NhbGwu
aCAgICAgICAgfCAzICstLQoga2VybmVsL3RpbWUvdnN5c2NhbGwuYyAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMTYgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlv
bnMoLSkKLS0tCmJhc2UtY29tbWl0OiA4Y2YwYjkzOTE5ZTEzZDFlOGQ0NDY2ZWI0MDgwYTRjNGQ5
ZDY2ZDdiCmNoYW5nZS1pZDogMjAyNDEwMTAtdmRzby1nZW5lcmljLWFyY2hfdXBkYXRlX3ZzeXNj
YWxsLTA2MThlOThlMmU5NwoKQmVzdCByZWdhcmRzLAotLSAKVGhvbWFzIFdlacOfc2NodWggPHRo
b21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
