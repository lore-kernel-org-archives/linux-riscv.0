Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4136CA0EDA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9YX+qMz41uA/WvKCJc600uM/D4+gVsr6O721si+PWg=; b=0vnNhgEAeA2iTV
	to2ZmaTqamzdAFDybQKuavr2WaONslvh7sAH+FlEBaj0/5ouTPaU1+toYkVFvs9isw8xxmPGdA95I
	LkCvVapoTuQUoRklde9IQt3TfMbxHFyKJRcVBa8MYAWltF0R07JgBAvbt0x1HLtg2L2Q8a4wl2A7D
	31DyUYJwjOsrns4IVdd/Bdlv9W6UwhkUiPYPEMsZb0UEIP2bXU/c81NmdOPb9T1x0MS26DCbpxwsX
	r89Z6jlOUb0FEfQD4q6McIp93kgxmPVuzcDARe3KPbdybQJKf5YnjQPNv8Z6sPEDgMelmHrlOwQfg
	Amn84pGceXuDkzgR2VHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhou-00000009vYV-13aT;
	Tue, 12 Aug 2025 05:45:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoY-00000009v2u-2kOf;
	Tue, 12 Aug 2025 05:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HfCt5JZT5TLY1vTOkO3zmfWoCgmYOOlaa/RcOHdKaps=; b=VtPzKBVAtDLN6/Fexzl8I5Cdac
	czVAHGqufJtui/Fk5aNHivzcateQlmTayQJYzPh1QXgO4OPhyVR7thjtINaLoXD1QZbZqfH7nvu6+
	flO0XUuhL9reMUFIoqKgAmWVpEdGHNffJWTEe7d5LdjmaX7xTbTdtAEn518obGrk69hYJlDUtQ454
	knM84mA8YRSQoWe0a0GehVR416zCJiFlQLFmKi2vNK6/Q7H6mvA8eCRMGnTg73FqBmeYPzXjW96EH
	RjOk7t+T76ia/AN5kpEO6kZO9bZLDGGJfZjA8MM17d/nCkoWqjbHknFGjF1TbwUK52iHVEG33NHUr
	JUJgM+Yg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhoT-0000000Fg6s-0S00;
	Tue, 12 Aug 2025 05:44:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfCt5JZT5TLY1vTOkO3zmfWoCgmYOOlaa/RcOHdKaps=;
	b=zocDmbkM7SrtEfoMUMLk7syduA2FoS07iTJjRQxpoxVtJk6FCTcA63FHi4HDZhjOydKkAT
	DrrV0zBYz8rfc084esfgs4uuXAkhxzoVwcqdSmF7BEFWQKKsdlPKcE3LkSmnxFYonNODFZ
	2sN1ZNTgiR2KEOVXZQEVEMIVuHADKnDkoOaaebcfpKh5m4MlO1i3mxd6K0dfDn4f2gzo2k
	hM+ll5vK+/7O/uRdgK7BcmGop+bMKCmttdkUi9IyiFrD6fxo3aGU/1dH+Y4ccEvyjf/xRm
	ukysMSWz8XN0tHKKSQ2jKT60/8Q/5ewwHZkK0m/GvkKLUmwKhqnNwsd4lL/hmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfCt5JZT5TLY1vTOkO3zmfWoCgmYOOlaa/RcOHdKaps=;
	b=d4tRasLSDVTIK2B95jsGzJ+ah9uconnEpGunOzkAkX0RhJ6u8QF5Rm6WA7PtZmvXd7GJ+4
	tmhczEYwE7G4MtAQ==
Date: Tue, 12 Aug 2025 07:44:25 +0200
Subject: [PATCH v4 12/24] x86/vdso: Enable the vdsocheck tool
MIME-Version: 1.0
Message-Id: <20250812-vdso-absolute-reloc-v4-12-61a8b615e5ec@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3221;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=y8zJkYgbdBbZEV0tFUnY1VVHpY6kpQMx7JNEIl5bx6U=;
 b=fENeUAc8ExvUZD2cHV52CW4BlgBth0NPCMcPLk1EKHf1hnG4lTQ/vRhPMnJvsZZXuIYsNnulZ
 VQ7lpvqs+SzB4XtQHOZ7OgLms0zrQWlEQppNKDCg82HN7J6F262h/0M
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_064446_711873_72F0E536 
X-CRM114-Status: GOOD (  11.06  )
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

VGhlIHZkc29jaGVjayB0b29sIHZhbGlkYXRlcyB0aGUgb2JqZWN0IGZpbGVzIGFuZCBmaW5hbCAu
c28gbGlicmFyeS4KSXQgY2FuIGRldGVjdCBpZiB0aGUgY29tcGlsZXIgY3JlYXRlZCByZWxvY2F0
aW9ucyB3aGljaCBhcmUgaW5jb21wYXRpYmxlCndpdGggdGhlIHZEU08gd2hpY2ggbmVlZCB0byBi
ZSB3b3JrZWQgYXJvdW5kLgoKV2lyZSBpdCB1cCBmb3IgdGhlIGFyY2hpdGVjdHVyZS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4
LmRlPgotLS0KIGFyY2gveDg2L2VudHJ5L3Zkc28vTWFrZWZpbGUgfCAgNiArKystLS0KIGxpYi92
ZHNvL0tjb25maWcgICAgICAgICAgICAgfCAgMSArCiBsaWIvdmRzby9jaGVjay92ZHNvY2hlY2su
cnMgIHwgMTIgKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvZW50cnkvdmRzby9NYWtlZmls
ZSBiL2FyY2gveDg2L2VudHJ5L3Zkc28vTWFrZWZpbGUKaW5kZXggZjI0N2Y1ZjVjYjQ0ZGFkNzA2
NzAxZGQ1MzQ0YzlhODAzMWRlZmZjMS4uOWRhOWNkZjhjOTc2Y2NlYmFjMTQyOWFmZDI0NGQ0Yzll
YTZlZjVmYSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvZW50cnkvdmRzby9NYWtlZmlsZQorKysgYi9h
cmNoL3g4Ni9lbnRyeS92ZHNvL01ha2VmaWxlCkBAIC0zNSw3ICszNSw3IEBAIENQUEZMQUdTX3Zk
c28ubGRzICs9IC1QIC1DCiBWRFNPX0xERkxBR1NfdmRzby5sZHMgPSAtbSBlbGZfeDg2XzY0IC1z
b25hbWUgbGludXgtdmRzby5zby4xIFwKIAkJCS16IG1heC1wYWdlLXNpemU9NDA5NgogCi0kKG9i
aikvdmRzbzY0LnNvLmRiZzogJChvYmopL3Zkc28ubGRzICQodm9ianMpIEZPUkNFCiskKG9iaikv
dmRzbzY0LnNvLmRiZzogJChvYmopL3Zkc28ubGRzICQodm9ianMpICQodmRzb2NoZWNrKSBGT1JD
RQogCSQoY2FsbCBpZl9jaGFuZ2VkLHZkc29fYW5kX2NoZWNrKQogCiBIT1NUX0VYVFJBQ0ZMQUdT
ICs9IC1JJChzcmN0cmVlKS90b29scy9pbmNsdWRlIC1JJChzcmN0cmVlKS9pbmNsdWRlL3VhcGkg
LUkkKHNyY3RyZWUpL2FyY2gvJChTVUJBUkNIKS9pbmNsdWRlL3VhcGkKQEAgLTEwOCw3ICsxMDgs
NyBAQCAkKG9iaikvJS5zbzogT0JKQ09QWUZMQUdTIDo9IC1TIC0tcmVtb3ZlLXNlY3Rpb24gX19l
eF90YWJsZQogJChvYmopLyUuc286ICQob2JqKS8lLnNvLmRiZyBGT1JDRQogCSQoY2FsbCBpZl9j
aGFuZ2VkLG9iamNvcHkpCiAKLSQob2JqKS92ZHNveDMyLnNvLmRiZzogJChvYmopL3Zkc294MzIu
bGRzICQodm9iangzMnMpIEZPUkNFCiskKG9iaikvdmRzb3gzMi5zby5kYmc6ICQob2JqKS92ZHNv
eDMyLmxkcyAkKHZvYmp4MzJzKSAkKHZkc29jaGVjaykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdl
ZCx2ZHNvX2FuZF9jaGVjaykKIAogQ1BQRkxBR1NfdmRzbzMyL3Zkc28zMi5sZHMgPSAkKENQUEZM
QUdTX3Zkc28ubGRzKQpAQCAtMTQ0LDcgKzE0NCw3IEBAIGVuZGlmCiAKICQob2JqKS92ZHNvMzIu
c28uZGJnOiBLQlVJTERfQ0ZMQUdTID0gJChLQlVJTERfQ0ZMQUdTXzMyKQogCi0kKG9iaikvdmRz
bzMyLnNvLmRiZzogJChvYmopL3Zkc28zMi92ZHNvMzIubGRzICQodm9ianMzMikgRk9SQ0UKKyQo
b2JqKS92ZHNvMzIuc28uZGJnOiAkKG9iaikvdmRzbzMyL3Zkc28zMi5sZHMgJCh2b2JqczMyKSAk
KHZkc29jaGVjaykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZCx2ZHNvX2FuZF9jaGVjaykKIAog
IwpkaWZmIC0tZ2l0IGEvbGliL3Zkc28vS2NvbmZpZyBiL2xpYi92ZHNvL0tjb25maWcKaW5kZXgg
YjQ2MWUyYmU2ZGI4MGVhZTk1N2M4ZTBhMWFiNTczYTg1ZDc4ZmQxNS4uZTkyMTUwODQ0NjJkZmIz
M2E1Y2Q1NWE1NzE3MWQyZWM0Mjk1YTI3MCAxMDA2NDQKLS0tIGEvbGliL3Zkc28vS2NvbmZpZwor
KysgYi9saWIvdmRzby9LY29uZmlnCkBAIC01MSw2ICs1MSw3IEBAIGNvbmZpZyBHRU5FUklDX1ZE
U09fREFUQV9TVE9SRQogCiBjb25maWcgSEFWRV9WRFNPQ0hFQ0sKIAlib29sCisJZGVmYXVsdCB5
IGlmIFg4NgogCWhlbHAKIAkgIFNlbGVjdGVkIGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgYXJlIHN1
cHBvcnRlZCBieSB0aGUgJ3Zkc29jaGVjaycgcHJvZ2FtLgogCSAgT25seSB0cmFuc2l0aW9uYWwu
CmRpZmYgLS1naXQgYS9saWIvdmRzby9jaGVjay92ZHNvY2hlY2sucnMgYi9saWIvdmRzby9jaGVj
ay92ZHNvY2hlY2sucnMKaW5kZXggM2M0MjExMDBhOTE3NDBjZTM3MzVlZGZiYzk4MzdlZjQ5ZjU1
ZDhmOC4uYzRmZWI3NWY5M2VjMGE2YTE1M2E3NThlZTdhNTFjYzZmMmY1OGJmMSAxMDA2NDQKLS0t
IGEvbGliL3Zkc28vY2hlY2svdmRzb2NoZWNrLnJzCisrKyBiL2xpYi92ZHNvL2NoZWNrL3Zkc29j
aGVjay5ycwpAQCAtMzQsNiArMzQsMTggQEAgZm4gaXNfaWdub3JlZF9zZWN0aW9uKCZzZWxmLCBz
ZWN0aW9uOiAmZWxmOjpTZWN0aW9uPCdfPikgLT4gYm9vbCB7CiAKIGZuIGFsbG93ZWRfcmVsb2Nh
dGlvbnNfZm9yX21hY2hpbmUobWFjaGluZTogdTE2KSAtPiBPcHRpb248QWxsb3dlZFJlbG9jYXRp
b25zPCdzdGF0aWM+PiB7CiAgICAgbWF0Y2ggbWFjaGluZSBhcyB1MzIgeworICAgICAgICBiaW5k
aW5nczo6RU1fMzg2ID0+IFNvbWUoQWxsb3dlZFJlbG9jYXRpb25zIHsKKyAgICAgICAgICAgIGln
bm9yZWRfb2JqZWN0X2ZpbGVfc2VjdGlvbnM6IE5vbmUsCisgICAgICAgICAgICBpbl9vYmplY3Rf
ZmlsZTogJlsKKyAgICAgICAgICAgICAgICBiaW5kaW5nczo6Ul8zODZfUEMzMiwKKyAgICAgICAg
ICAgICAgICBiaW5kaW5nczo6Ul8zODZfR09UT0ZGLAorICAgICAgICAgICAgICAgIGJpbmRpbmdz
OjpSXzM4Nl9HT1RQQywKKyAgICAgICAgICAgIF0sCisgICAgICAgIH0pLAorICAgICAgICBiaW5k
aW5nczo6RU1fWDg2XzY0ID0+IFNvbWUoQWxsb3dlZFJlbG9jYXRpb25zIHsKKyAgICAgICAgICAg
IGlnbm9yZWRfb2JqZWN0X2ZpbGVfc2VjdGlvbnM6IE5vbmUsCisgICAgICAgICAgICBpbl9vYmpl
Y3RfZmlsZTogJltiaW5kaW5nczo6Ul9YODZfNjRfUEMzMiwgYmluZGluZ3M6OlJfWDg2XzY0X1BM
VDMyXSwKKyAgICAgICAgfSksCiAgICAgICAgIF8gPT4gTm9uZSwKICAgICB9CiB9CgotLSAKMi41
MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
