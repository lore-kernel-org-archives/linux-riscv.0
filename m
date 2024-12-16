Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706FFE7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olGJ07dtYgGoxiu3pcR7k8zj4hiVi0LLErCOWTg+wRg=; b=sC/fOsFz0dCQ+n
	Zs/CUaUObLJzybT+l/EeKAnb7ll/c/I/kXMLoVTLpjtz1IhWbpWvzHEnQTXuk3Qqoqv5GWnTjdUI7
	B8HgXMoIcqPZ/9FkzDl7rq5zGPRjv8vMlIUuVB71OnQZNO1AtjRnMDnrrcwGCglHtlGFiZpQhQIPJ
	xi6L7gdkuV0wKxS3CNxqK3I2tyHzcj+vbvN0w9vDQFUV8aI0jiiz6lxDgZqqf9wvsgUMQR3nUcJsr
	CaRLPIJNh3LVYq+6YPNMTsbldnFbqJ6s9fXoLlhfNcVFYTEYt6Px8xlU3uN51diBDITVF9esdglde
	mQH9I8s8YMuU7wDaJCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNC20-0000000AFVl-07Rb;
	Mon, 16 Dec 2024 14:25:08 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBoH-0000000ABPU-0mE6;
	Mon, 16 Dec 2024 14:10:59 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N50oiaH5NKHF/dGDm4wkuhXe1OR6bWZJX5Stqs/cTIw=;
	b=aCrWR+s6wRokELQB59JYh71GR2O5x3Q64inZNTzhAqbptc707U8NPjUgp8o1r/8sE7YE/k
	2DMlf+YlxInCTNI2uFV5Y+I4jEa0DN4LvADOowuCrKn9mKy8UQBM5Aq3bZp96INIDcJvCr
	eNwVWCbm6JkmtRp3+EXuNpsrlw/JPPg4qN3ibTPLzCtRmNWhBnL0PDZtoeqKwon3wOHX0T
	D1dng8iCAwE1sf3aCP92skbkU24lMNmEnih1ZTr0fOOHbQtn1kPqIcgXkR1DIn71EW29PG
	1OiMYHj7Daz2n+YA7Xrank1xIc94s/YYyaunq4PVkHk4f59S/HslitQ5JT/Naw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N50oiaH5NKHF/dGDm4wkuhXe1OR6bWZJX5Stqs/cTIw=;
	b=8+p5Z2LKgGqmmLfwG75iw3tr/Gv/u91O0Qs238ZJMXUSZESX05G86M/BIp6Sb1Al/JsG+h
	Kay6axPrj4uQ/sDA==
Date: Mon, 16 Dec 2024 15:10:01 +0100
Subject: [PATCH 05/17] vdso: Add generic architecture-specific data storage
MIME-Version: 1.0
Message-Id: <20241216-vdso-store-rng-v1-5-f7aed1bdb3b2@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=5490;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1JfcNRBN31T16h/FySfjXsHOUPI+cqgR61pBaoeiy2g=;
 b=zloDZDsCdkCnNQAVAi7v19Z7KYMR15mdzSloDWxF1efHDX8XfsZFdqZnsCgUXcipRRrinwiil
 rZgOsm8e4zFDRRx+qhkQxIVSFTfIayv2LzJu53PZM2IJX6HNKiLABFk
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_061057_527029_D3CFE230 
X-CRM114-Status: GOOD (  14.72  )
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

U29tZSBhcmNoaXRlY3R1cmVzIG5lZWQgdG8gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGRhdGEgdG8g
dGhlIHZEU08uCkVuYWJsZSB0aGUgZ2VuZXJpYyB2RFNPIHN0b3JhZ2UgbWVjaGFuaXNtIHRvIGJv
dGggc3RvcmUgYW5kIG1hcCB0aGlzCmRhdGEuIFNvbWUgYXJjaGl0ZWN0dXJlcyByZXF1aXJlIG1v
cmUgdGhhbiBhIHNpbmdsZSBwYWdlLCBsaWtlCkxvb25nQXJjaCwgc28gcHJlcGFyZSBmb3IgdGhh
dCB1c2VjYXNlLCB0b28uCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFz
LndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL0tjb25maWcgICAgICAgICAgICAg
ICAgfCAgNCArKysrCiBpbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaCAgICAgfCAzMiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogbGliL3Zkc29fa2VybmVsL2RhdGFzdG9yZS5jIHwgMTQg
KysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvS2NvbmZpZyBiL2FyY2gvS2NvbmZpZwppbmRleCA2NjgyYjJhNTNlMzQyY2Jh
Y2MwNWI3MGVmOTljYjFjNDdlZmU1NWU4Li40OGYzN2U2YzAwNjc0ZjQzM2EwZDZlNmUwNWNlNzJj
MjdjZjAwMGI3IDEwMDY0NAotLS0gYS9hcmNoL0tjb25maWcKKysrIGIvYXJjaC9LY29uZmlnCkBA
IC0xNTc2LDYgKzE1NzYsMTAgQEAgY29uZmlnIEhBVkVfU1BBUlNFX1NZU0NBTExfTlIKIAkgIGVu
dHJpZXMgYXQgNDAwMCwgNTAwMCBhbmQgNjAwMCBsb2NhdGlvbnMuIFRoaXMgb3B0aW9uIHR1cm5z
IG9uIHN5c2NhbGwKIAkgIHJlbGF0ZWQgb3B0aW1pemF0aW9ucyBmb3IgYSBnaXZlbiBhcmNoaXRl
Y3R1cmUuCiAKK2NvbmZpZyBBUkNIX0hBU19WRFNPX0FSQ0hfREFUQQorCWRlcGVuZHMgb24gR0VO
RVJJQ19WRFNPX0RBVEFfU1RPUkUKKwlib29sCisKIGNvbmZpZyBBUkNIX0hBU19WRFNPX1RJTUVf
REFUQQogCWJvb2wKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS92ZHNvL2RhdGFwYWdlLmggYi9pbmNs
dWRlL3Zkc28vZGF0YXBhZ2UuaAppbmRleCA1Y2UzMjI0MjJmY2I3YmE3N2FlYWZkZGJmMTMyZmQz
ZTVkYmM1YTBjLi5iMzIyN2YxY2Y2Mjg5NWFhNjBjZTBjYTk2YWZhNDIyNTlmNDc3MWY5IDEwMDY0
NAotLS0gYS9pbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaAorKysgYi9pbmNsdWRlL3Zkc28vZGF0YXBh
Z2UuaApAQCAtOSwxMSArOSwxMyBAQAogI2luY2x1ZGUgPHVhcGkvbGludXgvdHlwZXMuaD4KICNp
bmNsdWRlIDx1YXBpL2FzbS1nZW5lcmljL2Vycm5vLWJhc2UuaD4KIAorI2luY2x1ZGUgPHZkc28v
YWxpZ24uaD4KICNpbmNsdWRlIDx2ZHNvL2JpdHMuaD4KICNpbmNsdWRlIDx2ZHNvL2Nsb2Nrc291
cmNlLmg+CiAjaW5jbHVkZSA8dmRzby9rdGltZS5oPgogI2luY2x1ZGUgPHZkc28vbGltaXRzLmg+
CiAjaW5jbHVkZSA8dmRzby9tYXRoNjQuaD4KKyNpbmNsdWRlIDx2ZHNvL3BhZ2UuaD4KICNpbmNs
dWRlIDx2ZHNvL3Byb2Nlc3Nvci5oPgogI2luY2x1ZGUgPHZkc28vdGltZS5oPgogI2luY2x1ZGUg
PHZkc28vdGltZTMyLmg+CkBAIC0yNSw2ICsyNywxNSBAQAogc3RydWN0IGFyY2hfdmRzb190aW1l
X2RhdGEge307CiAjZW5kaWYKIAorI2lmIGRlZmluZWQoQ09ORklHX0FSQ0hfSEFTX1ZEU09fQVJD
SF9EQVRBKQorI2luY2x1ZGUgPGFzbS92ZHNvL2FyY2hfZGF0YS5oPgorI2VsaWYgZGVmaW5lZChD
T05GSUdfR0VORVJJQ19WRFNPX0RBVEFfU1RPUkUpCitzdHJ1Y3QgdmRzb19hcmNoX2RhdGEgewor
CS8qIE5lZWRlZCBmb3IgdGhlIGdlbmVyaWMgY29kZSwgbmV2ZXIgYWN0dWFsbHkgdXNlZCBhdCBy
dW50aW1lICovCisJY2hhciBfX3VudXNlZDsKK307CisjZW5kaWYKKwogI2RlZmluZSBWRFNPX0JB
U0VTCShDTE9DS19UQUkgKyAxKQogI2RlZmluZSBWRFNPX0hSRVMJKEJJVChDTE9DS19SRUFMVElN
RSkJCXwgXAogCQkJIEJJVChDTE9DS19NT05PVE9OSUMpCQl8IFwKQEAgLTE0Niw5ICsxNTcsMTEg
QEAgZXh0ZXJuIHN0cnVjdCB2ZHNvX3JuZ19kYXRhIF92ZHNvX3JuZ19kYXRhIF9fYXR0cmlidXRl
X18oKHZpc2liaWxpdHkoImhpZGRlbiIpKSkKIGV4dGVybiBjb25zdCBzdHJ1Y3QgdmRzb190aW1l
X2RhdGEgdmRzb191X3RpbWVfZGF0YVtDU19CQVNFU10gX19hdHRyaWJ1dGVfXygodmlzaWJpbGl0
eSgiaGlkZGVuIikpKTsKIGV4dGVybiBjb25zdCBzdHJ1Y3QgdmRzb190aW1lX2RhdGEgdmRzb191
X3RpbWVuc19kYXRhW0NTX0JBU0VTXSBfX2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5KCJoaWRkZW4i
KSkpOwogZXh0ZXJuIGNvbnN0IHN0cnVjdCB2ZHNvX3JuZ19kYXRhIHZkc29fdV9ybmdfZGF0YSBf
X2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5KCJoaWRkZW4iKSkpOworZXh0ZXJuIGNvbnN0IHN0cnVj
dCB2ZHNvX2FyY2hfZGF0YSB2ZHNvX3VfYXJjaF9kYXRhIF9fYXR0cmlidXRlX18oKHZpc2liaWxp
dHkoImhpZGRlbiIpKSk7CiAKIGV4dGVybiBzdHJ1Y3QgdmRzb190aW1lX2RhdGEgKnZkc29fa190
aW1lX2RhdGE7CiBleHRlcm4gc3RydWN0IHZkc29fcm5nX2RhdGEgKnZkc29fa19ybmdfZGF0YTsK
K2V4dGVybiBzdHJ1Y3QgdmRzb19hcmNoX2RhdGEgKnZkc29fa19hcmNoX2RhdGE7CiAjZW5kaWYK
IAogLyoqCkBAIC0xNjEsMTAgKzE3NCwxNSBAQCB1bmlvbiB2ZHNvX2RhdGFfc3RvcmUgewogCiAj
aWZkZWYgQ09ORklHX0dFTkVSSUNfVkRTT19EQVRBX1NUT1JFCiAKKyNkZWZpbmUgVkRTT19BUkNI
X0RBVEFfU0laRSBBTElHTihzaXplb2Yoc3RydWN0IHZkc29fYXJjaF9kYXRhKSwgUEFHRV9TSVpF
KQorI2RlZmluZSBWRFNPX0FSQ0hfREFUQV9QQUdFUyAoVkRTT19BUkNIX0RBVEFfU0laRSA+PiBQ
QUdFX1NISUZUKQorCiBlbnVtIHZkc29fcGFnZXMgewogCVZEU09fVElNRV9QQUdFX09GRlNFVCwK
IAlWRFNPX1RJTUVOU19QQUdFX09GRlNFVCwKIAlWRFNPX1JOR19QQUdFX09GRlNFVCwKKwlWRFNP
X0FSQ0hfUEFHRVNfU1RBUlQsCisJVkRTT19BUkNIX1BBR0VTX0VORCA9IFZEU09fQVJDSF9QQUdF
U19TVEFSVCArIFZEU09fQVJDSF9EQVRBX1BBR0VTIC0gMSwKIAlWRFNPX05SX1BBR0VTCiB9Owog
CkBAIC0yMDQsNiArMjIyLDEzIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgc3RydWN0IHZkc29f
cm5nX2RhdGEgKl9fYXJjaF9nZXRfdmRzb19rX3JuZ19kYXRhKHZvaWQpCiAKICNlbmRpZiAvKiBD
T05GSUdfR0VORVJJQ19WRFNPX0RBVEFfU1RPUkUgKi8KIAorI2lmZGVmIENPTkZJR19BUkNIX0hB
U19WRFNPX0FSQ0hfREFUQQorc3RhdGljIF9fYWx3YXlzX2lubGluZSBjb25zdCBzdHJ1Y3QgdmRz
b19hcmNoX2RhdGEgKl9fYXJjaF9nZXRfdmRzb191X2FyY2hfZGF0YSh2b2lkKQoreworCXJldHVy
biAmdmRzb191X2FyY2hfZGF0YTsKK30KKyNlbmRpZiAvKiBDT05GSUdfQVJDSF9IQVNfVkRTT19B
UkNIX0RBVEEgKi8KKwogLyoKICAqIFRoZSBnZW5lcmljIHZEU08gaW1wbGVtZW50YXRpb24gcmVx
dWlyZXMgdGhhdCBnZXR0aW1lb2ZkYXkuaAogICogcHJvdmlkZXM6CkBAIC0yMzQsMTEgKzI1OSwx
OCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHN0cnVjdCB2ZHNvX3JuZ19kYXRhICpfX2FyY2hf
Z2V0X3Zkc29fa19ybmdfZGF0YSh2b2lkKQogI2RlZmluZSBfX3Zkc29fdV9ybmdfZGF0YQogI2Vu
ZGlmCiAKKyNpZmRlZiBDT05GSUdfQVJDSF9IQVNfVkRTT19BUkNIX0RBVEEKKyNkZWZpbmUgX192
ZHNvX3VfYXJjaF9kYXRhCVBST1ZJREUodmRzb191X2FyY2hfZGF0YSA9IHZkc29fdV9kYXRhICsg
MyAqIFBBR0VfU0laRSk7CisjZWxzZQorI2RlZmluZSBfX3Zkc29fdV9hcmNoX2RhdGEKKyNlbmRp
ZgorCiAjZGVmaW5lIFZEU09fVlZBUl9TWU1TCQkJCQkJXAogCVBST1ZJREUodmRzb191X2RhdGEg
PSAuIC0gX19WRFNPX1BBR0VTICogUEFHRV9TSVpFKTsJXAogCVBST1ZJREUodmRzb191X3RpbWVf
ZGF0YSA9IHZkc29fdV9kYXRhKTsJCVwKIAlfX3Zkc29fdV90aW1lbnNfZGF0YQkJCQkJXAogCV9f
dmRzb191X3JuZ19kYXRhCQkJCQlcCisJX192ZHNvX3VfYXJjaF9kYXRhCQkJCQlcCiAKIAogI2Vu
ZGlmIC8qICFfX0FTU0VNQkxZX18gKi8KZGlmZiAtLWdpdCBhL2xpYi92ZHNvX2tlcm5lbC9kYXRh
c3RvcmUuYyBiL2xpYi92ZHNvX2tlcm5lbC9kYXRhc3RvcmUuYwppbmRleCAwZDRmNTMxN2I1MDhh
NTRiNGYzMjk1ZjAzMzVkMWVlZmNlNzRkNzhjLi42NjhjYWM4YzRmODBhYzcxZDNmNmRlNzFlOThl
OTYzYmM2NWExYzE1IDEwMDY0NAotLS0gYS9saWIvdmRzb19rZXJuZWwvZGF0YXN0b3JlLmMKKysr
IGIvbGliL3Zkc29fa2VybmVsL2RhdGFzdG9yZS5jCkBAIC0yNCw2ICsyNCwxNCBAQCBzdHJ1Y3Qg
dmRzb19ybmdfZGF0YSAqdmRzb19rX3JuZ19kYXRhID0gJnZkc29fcm5nX2RhdGFfc3RvcmUuZGF0
YTsKIHN0YXRpY19hc3NlcnQoc2l6ZW9mKHZkc29fcm5nX2RhdGFfc3RvcmUpID09IFBBR0VfU0la
RSk7CiAjZW5kaWYgLyogQ09ORklHX1ZEU09fR0VUUkFORE9NICovCiAKKyNpZmRlZiBDT05GSUdf
QVJDSF9IQVNfVkRTT19BUkNIX0RBVEEKK3N0YXRpYyB1bmlvbiB7CisJc3RydWN0IHZkc29fYXJj
aF9kYXRhCWRhdGE7CisJdTgJCQlwYWdlW1ZEU09fQVJDSF9EQVRBX1NJWkVdOworfSB2ZHNvX2Fy
Y2hfZGF0YV9zdG9yZSBfX3BhZ2VfYWxpZ25lZF9kYXRhOworc3RydWN0IHZkc29fYXJjaF9kYXRh
ICp2ZHNvX2tfYXJjaF9kYXRhID0gJnZkc29fYXJjaF9kYXRhX3N0b3JlLmRhdGE7CisjZW5kaWYK
Kwogc3RhdGljIHZtX2ZhdWx0X3QgdnZhcl9mYXVsdChjb25zdCBzdHJ1Y3Qgdm1fc3BlY2lhbF9t
YXBwaW5nICpzbSwKIAkJCSAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCB2
bV9mYXVsdCAqdm1mKQogewpAQCAtNjMsNiArNzEsMTIgQEAgc3RhdGljIHZtX2ZhdWx0X3QgdnZh
cl9mYXVsdChjb25zdCBzdHJ1Y3Qgdm1fc3BlY2lhbF9tYXBwaW5nICpzbSwKIAkJCXJldHVybiBW
TV9GQVVMVF9TSUdCVVM7CiAJCXBmbiA9IF9fcGh5c190b19wZm4oX19wYV9zeW1ib2wodmRzb19r
X3JuZ19kYXRhKSk7CiAJCWJyZWFrOworCWNhc2UgVkRTT19BUkNIX1BBR0VTX1NUQVJUIC4uLiBW
RFNPX0FSQ0hfUEFHRVNfRU5EOgorCQlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0FSQ0hfSEFTX1ZE
U09fQVJDSF9EQVRBKSkKKwkJCXJldHVybiBWTV9GQVVMVF9TSUdCVVM7CisJCXBmbiA9IF9fcGh5
c190b19wZm4oX19wYV9zeW1ib2wodmRzb19rX2FyY2hfZGF0YSkpICsKKwkJCXZtZi0+cGdvZmYg
LSBWRFNPX0FSQ0hfUEFHRVNfU1RBUlQ7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXJldHVybiBW
TV9GQVVMVF9TSUdCVVM7CiAJfQoKLS0gCjIuNDcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
