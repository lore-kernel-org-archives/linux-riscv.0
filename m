Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696E1E77183
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdlUarOrM8CKtAS2bzy7uKSFzyWwVMAf8fqSVcp39u0=; b=lXpFT/8ktjFo83
	+hhnEShoEvnmS6tRwJRE+0pCXZs+Z8KhqV2IX5syNoMJ/8MPDXZMyEQ0Y27SHiuP2zGANcWfyJAIt
	Av0Uew3EXsDnQJhk1hov+R8gK4Len16NZcqt4tpKg+QpNjcJxYWtzmTyt5mwoyM19NM00fSNZK+ry
	mVrQtoh66cMwqW71SMh9XzT3UDuSlU2Ttu5I9XgkW6/IVe1ddVI7i2b34mufflzzfdiem1zEG/ciu
	MMyCaFSnWh9qUDA5/BTsDKbZc4MRLaBvueEICTZ4xzYk22tp1et7NxqZzx1tsVBrlnKLf5Xjfv6n5
	g8xlbjOmNZRE25u0FOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNByl-0000000AEak-2muO;
	Mon, 16 Dec 2024 14:21:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBoE-0000000ABNx-37SV;
	Mon, 16 Dec 2024 14:10:56 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wSwWjoN9hxq4jHDYryBIZocNpGvXWb/8NjpFHhRy2oo=;
	b=ZMQujSz5tD2kN7+lI0fYpPj98xs+sNfo+W3vBIuWWMNlwpDV/izuo9GkscwMhLkuBG+VwU
	gHcWMsBZi+0oJhgJRxAUYy5qeuKaj3OpwcngqvunDPibOk9ughtlxw6pMuUb6pCV3sFP0Z
	+ARJ8WdZfA7lEkHqX+a58WZSo2329Sf4ZWH/WQT83OraaLzYcppk0aOpV6RYAD5lZFFCM6
	WJhmmmkV6HuSG5f9T1Dv37/9DZ33NYVKdO0fkvbOXx9aGqKVyKsknZEJH9KHiPTtrWK+E6
	INXYArNSQNPlC8uqsma3APkSoos+GlBeVzWuv5mM9ZqC1MYMmGxLAl0UZiWS7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wSwWjoN9hxq4jHDYryBIZocNpGvXWb/8NjpFHhRy2oo=;
	b=qm/1JdwisukCAQ6GVoTkT6wBWxbHH10UkJwsn+dKhsduD9m20Mq0KPz3CVRZZHlB2C11fW
	9Ov67GseUEPV1BDA==
Date: Mon, 16 Dec 2024 15:10:00 +0100
Subject: [PATCH 04/17] vdso: Add generic random data storage
MIME-Version: 1.0
Message-Id: <20241216-vdso-store-rng-v1-4-f7aed1bdb3b2@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
In-Reply-To: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=4160;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Klz0GewD0ghfBFLK7c5qIVdXa+oTtzdoujgf0ypgqME=;
 b=thexmYXfp+n2eSvYCtrf5cHaHBiOJId1Zbewgq/CRRe/slaV9CWnriEbx6SMa7+VxZ1s/NRmL
 of3YMYg6mVqBPc5bM65DLHRgkU9CD5Z5/CTZ07zGsAVXWNGT54vKQM2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_061055_124473_09D547DC 
X-CRM114-Status: GOOD (  13.78  )
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

RXh0ZW5kIHRoZSBnZW5lcmljIHZEU08gZGF0YSBzdG9yYWdlIHdpdGggYSBwYWdlIGZvciB0aGUg
cmFuZG9tIHN0YXRlIGRhdGEuClRoZSByYW5kb20gc3RhdGUgZGF0YSBpcyBzdG9yZWQgaW4gYSBk
ZWRpY2F0ZWQgcGFnZSwgYXMgdGhlIGV4aXN0aW5nCnN0b3JhZ2UgcGFnZSBpcyBvbmx5IG1lYW50
IGZvciB0aW1lLXJlbGF0ZWQsIHRpbWUtbmFtZXNwYWNlLWF3YXJlIGRhdGEuClRoaXMgc2ltcGxp
ZmllcyB0byBhY2Nlc3MgbG9naWMgdG8gbm90IG5lZWQgdG8gaGFuZGxlIHRpbWUgbmFtZXNwYWNl
cwphbnltb3JlIGFuZCBhbHNvIGZyZWVzIHVwIG1vcmUgc3BhY2UgaW4gdGhlIHRpbWUtcmVsYXRl
ZCBwYWdlLgoKSW4gY2FzZSBmdXJ0aGVyIGdlbmVyaWMgdkRTTyBkYXRhIHN0b3JlIGlzIHJlcXVp
cmVkIGl0IGNhbiBiZSBhZGRlZCB0bwp0aGUgcmFuZG9tIHN0YXRlIHBhZ2UuCgpTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4K
LS0tCiBpbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaCAgICAgfCAyNCArKysrKysrKysrKysrKysrKysr
KysrKysKIGxpYi92ZHNvX2tlcm5lbC9kYXRhc3RvcmUuYyB8IDE0ICsrKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3Zk
c28vZGF0YXBhZ2UuaCBiL2luY2x1ZGUvdmRzby9kYXRhcGFnZS5oCmluZGV4IDY5YWY0MjQ0MTNk
YjFmMjY1NjA3ZDBmMWJkYmY4ODU1MDU0OGM1YmEuLjVjZTMyMjQyMmZjYjdiYTc3YWVhZmRkYmYx
MzJmZDNlNWRiYzVhMGMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdmRzby9kYXRhcGFnZS5oCisrKyBi
L2luY2x1ZGUvdmRzby9kYXRhcGFnZS5oCkBAIC0xNDUsOCArMTQ1LDEwIEBAIGV4dGVybiBzdHJ1
Y3QgdmRzb19ybmdfZGF0YSBfdmRzb19ybmdfZGF0YSBfX2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5
KCJoaWRkZW4iKSkpCiAjZWxzZQogZXh0ZXJuIGNvbnN0IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSB2
ZHNvX3VfdGltZV9kYXRhW0NTX0JBU0VTXSBfX2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5KCJoaWRk
ZW4iKSkpOwogZXh0ZXJuIGNvbnN0IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSB2ZHNvX3VfdGltZW5z
X2RhdGFbQ1NfQkFTRVNdIF9fYXR0cmlidXRlX18oKHZpc2liaWxpdHkoImhpZGRlbiIpKSk7Citl
eHRlcm4gY29uc3Qgc3RydWN0IHZkc29fcm5nX2RhdGEgdmRzb191X3JuZ19kYXRhIF9fYXR0cmli
dXRlX18oKHZpc2liaWxpdHkoImhpZGRlbiIpKSk7CiAKIGV4dGVybiBzdHJ1Y3QgdmRzb190aW1l
X2RhdGEgKnZkc29fa190aW1lX2RhdGE7CitleHRlcm4gc3RydWN0IHZkc29fcm5nX2RhdGEgKnZk
c29fa19ybmdfZGF0YTsKICNlbmRpZgogCiAvKioKQEAgLTE2Miw2ICsxNjQsNyBAQCB1bmlvbiB2
ZHNvX2RhdGFfc3RvcmUgewogZW51bSB2ZHNvX3BhZ2VzIHsKIAlWRFNPX1RJTUVfUEFHRV9PRkZT
RVQsCiAJVkRTT19USU1FTlNfUEFHRV9PRkZTRVQsCisJVkRTT19STkdfUEFHRV9PRkZTRVQsCiAJ
VkRTT19OUl9QQUdFUwogfTsKIApAQCAtMTg1LDYgKzE4OCwyMCBAQCBzdGF0aWMgX19hbHdheXNf
aW5saW5lIGNvbnN0IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSAqX19hcmNoX2dldF92ZHNvX3VfdGlt
ZW5zX2RhdAogI2RlZmluZSBfX2FyY2hfZ2V0X3RpbWVuc192ZHNvX2RhdGEodmQpIF9fYXJjaF9n
ZXRfdmRzb191X3RpbWVuc19kYXRhKCkKICNlbmRpZiAvKiBDT05GSUdfVElNRV9OUyAqLwogCisj
aWZkZWYgQ09ORklHX1ZEU09fR0VUUkFORE9NCitzdGF0aWMgX19hbHdheXNfaW5saW5lIGNvbnN0
IHN0cnVjdCB2ZHNvX3JuZ19kYXRhICpfX2FyY2hfZ2V0X3Zkc29fdV9ybmdfZGF0YSh2b2lkKQor
eworCXJldHVybiAmdmRzb191X3JuZ19kYXRhOworfQorI2RlZmluZSBfX2FyY2hfZ2V0X3Zkc29f
cm5nX2RhdGEgX19hcmNoX2dldF92ZHNvX3Vfcm5nX2RhdGEKKworc3RhdGljIF9fYWx3YXlzX2lu
bGluZSBzdHJ1Y3QgdmRzb19ybmdfZGF0YSAqX19hcmNoX2dldF92ZHNvX2tfcm5nX2RhdGEodm9p
ZCkKK3sKKwlyZXR1cm4gdmRzb19rX3JuZ19kYXRhOworfQorI2RlZmluZSBfX2FyY2hfZ2V0X2tf
dmRzb19ybmdfZGF0YSBfX2FyY2hfZ2V0X3Zkc29fa19ybmdfZGF0YQorI2VuZGlmIC8qIENPTkZJ
R19WRFNPX0dFVFJBTkRPTSAqLworCiAjZW5kaWYgLyogQ09ORklHX0dFTkVSSUNfVkRTT19EQVRB
X1NUT1JFICovCiAKIC8qCkBAIC0yMTEsMTAgKzIyOCwxNyBAQCBzdGF0aWMgX19hbHdheXNfaW5s
aW5lIGNvbnN0IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSAqX19hcmNoX2dldF92ZHNvX3VfdGltZW5z
X2RhdAogI2RlZmluZSBfX3Zkc29fdV90aW1lbnNfZGF0YQogI2VuZGlmCiAKKyNpZmRlZiBDT05G
SUdfVkRTT19HRVRSQU5ET00KKyNkZWZpbmUgX192ZHNvX3Vfcm5nX2RhdGEJUFJPVklERSh2ZHNv
X3Vfcm5nX2RhdGEgPSB2ZHNvX3VfZGF0YSArIDIgKiBQQUdFX1NJWkUpOworI2Vsc2UKKyNkZWZp
bmUgX192ZHNvX3Vfcm5nX2RhdGEKKyNlbmRpZgorCiAjZGVmaW5lIFZEU09fVlZBUl9TWU1TCQkJ
CQkJXAogCVBST1ZJREUodmRzb191X2RhdGEgPSAuIC0gX19WRFNPX1BBR0VTICogUEFHRV9TSVpF
KTsJXAogCVBST1ZJREUodmRzb191X3RpbWVfZGF0YSA9IHZkc29fdV9kYXRhKTsJCVwKIAlfX3Zk
c29fdV90aW1lbnNfZGF0YQkJCQkJXAorCV9fdmRzb191X3JuZ19kYXRhCQkJCQlcCiAKIAogI2Vu
ZGlmIC8qICFfX0FTU0VNQkxZX18gKi8KZGlmZiAtLWdpdCBhL2xpYi92ZHNvX2tlcm5lbC9kYXRh
c3RvcmUuYyBiL2xpYi92ZHNvX2tlcm5lbC9kYXRhc3RvcmUuYwppbmRleCBjOWNkMjY5YjFlZDFi
NmNkZDVmZGY5ZmU5MjlkMGI3NzgzMTRiOTYyLi4wZDRmNTMxN2I1MDhhNTRiNGYzMjk1ZjAzMzVk
MWVlZmNlNzRkNzhjIDEwMDY0NAotLS0gYS9saWIvdmRzb19rZXJuZWwvZGF0YXN0b3JlLmMKKysr
IGIvbGliL3Zkc29fa2VybmVsL2RhdGFzdG9yZS5jCkBAIC0xNSw2ICsxNSwxNSBAQCBzdGF0aWMg
dW5pb24gdmRzb19kYXRhX3N0b3JlIHZkc29fdGltZV9kYXRhX3N0b3JlIF9fcGFnZV9hbGlnbmVk
X2RhdGE7CiBzdHJ1Y3QgdmRzb190aW1lX2RhdGEgKnZkc29fa190aW1lX2RhdGEgPSB2ZHNvX3Rp
bWVfZGF0YV9zdG9yZS5kYXRhOwogc3RhdGljX2Fzc2VydChzaXplb2YodmRzb190aW1lX2RhdGFf
c3RvcmUpID09IFBBR0VfU0laRSk7CiAKKyNpZmRlZiBDT05GSUdfVkRTT19HRVRSQU5ET00KK3N0
YXRpYyB1bmlvbiB7CisJc3RydWN0IHZkc29fcm5nX2RhdGEJZGF0YTsKKwl1OAkJCXBhZ2VbUEFH
RV9TSVpFXTsKK30gdmRzb19ybmdfZGF0YV9zdG9yZSBfX3BhZ2VfYWxpZ25lZF9kYXRhOworc3Ry
dWN0IHZkc29fcm5nX2RhdGEgKnZkc29fa19ybmdfZGF0YSA9ICZ2ZHNvX3JuZ19kYXRhX3N0b3Jl
LmRhdGE7CitzdGF0aWNfYXNzZXJ0KHNpemVvZih2ZHNvX3JuZ19kYXRhX3N0b3JlKSA9PSBQQUdF
X1NJWkUpOworI2VuZGlmIC8qIENPTkZJR19WRFNPX0dFVFJBTkRPTSAqLworCiBzdGF0aWMgdm1f
ZmF1bHRfdCB2dmFyX2ZhdWx0KGNvbnN0IHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgKnNtLAog
CQkJICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IHZtX2ZhdWx0ICp2bWYp
CiB7CkBAIC00OSw2ICs1OCwxMSBAQCBzdGF0aWMgdm1fZmF1bHRfdCB2dmFyX2ZhdWx0KGNvbnN0
IHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgKnNtLAogCQkJcmV0dXJuIFZNX0ZBVUxUX1NJR0JV
UzsKIAkJcGZuID0gX19waHlzX3RvX3BmbihfX3BhX3N5bWJvbCh2ZHNvX2tfdGltZV9kYXRhKSk7
CiAJCWJyZWFrOworCWNhc2UgVkRTT19STkdfUEFHRV9PRkZTRVQ6CisJCWlmICghSVNfRU5BQkxF
RChDT05GSUdfVkRTT19HRVRSQU5ET00pKQorCQkJcmV0dXJuIFZNX0ZBVUxUX1NJR0JVUzsKKwkJ
cGZuID0gX19waHlzX3RvX3BmbihfX3BhX3N5bWJvbCh2ZHNvX2tfcm5nX2RhdGEpKTsKKwkJYnJl
YWs7CiAJZGVmYXVsdDoKIAkJcmV0dXJuIFZNX0ZBVUxUX1NJR0JVUzsKIAl9CgotLSAKMi40Ny4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
