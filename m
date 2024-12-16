Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4752E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlphyiTHXQ0gGaegjK2HcNehLDP8JuAk+SVOheN9I7o=; b=SEGRrj/6Xxy03S
	ZrNLC5Pjkr1MKNdmklD+Bm2FgtmrJ9Fx+5GsIvVQHXJafWD2wvqZ9So/GAVBw4Ytdmx1leW5Ofd9u
	vd8jrFtM/I80NPyHCJw6qyRXrVHcNWdyVjOOeVpQE+tfLieu+v9CZomF3BCIZ6+5ZMl025W5M9fzm
	4eNm2dMuInyb9vhS/awPj7ug0n64XywR85DZ5LYVcDiQBkWploc5+LWgfS4oMNR2/w4pAh4kX3KIy
	AeFmZn9y3VY2YHSBh32b+O3AmiGxcrWV5B9UZ1KzZ0GXlvSB94bEw72SjLARFgZCFMMZawvx7WcA8
	LDeHQayCJgpNUCftDiPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCB4-0000000AHIV-1Y4d;
	Mon, 16 Dec 2024 14:34:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBoU-0000000ABbp-31mD;
	Mon, 16 Dec 2024 14:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+X6YFpq2hPlq2zytbOuG7IndNMje9dbLylp0yNgLumw=; b=lof5eg78FPeaNwj84ooBQXKPd+
	iCrgrorZhuW+Mwl5g+pMm/pxvkp9w8Vgd1JQNM2dl+hMjhSQQY2D1/Xw3YXCY2x6aNEyYjQ58EvR2
	ZEYGFxVHC2nineEB/8E+DneRl77bZpiIrvjjub41szjwON0GHGFagDXNh9Hmx5v/7lZvytEyDTrw7
	AhafmbtmktItisJxEc0fsIVxQVLQsZpTwn0LAb9KRubZDzEuWnBSUZfFWPq+F8h98VMw5wAOWtVX8
	Bm2IFLbq1WdPTYenHGhyOlS/W9A2c3rpVEbo3+hatIYYsp8jsBkSjS7gfZApnvGVM91s4TJwViSBg
	IYFx6eeg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBoO-00000004qzG-2J3A;
	Mon, 16 Dec 2024 14:11:09 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+X6YFpq2hPlq2zytbOuG7IndNMje9dbLylp0yNgLumw=;
	b=AvGSP8Vwrugo0+sWSRdWIdUjMGMPGixEOFXnsGNm/2ObSCVT55Cm1k1FdxbwBtifNhgzuP
	HBJ9Z7HkFYPxx6SBg9qhdauOdENrM+UtUSopJiHKxdZ+8CM+XqHupZWYjiDXpc/mNQLhTx
	6wa5t5NmBQDGVBbQ4FDNh3O25nt3kt3+sXSycD25Leek54u2kY9QiOzxlbwD4wgRtjqJuz
	yCMK9EbDEXlMcdPanMLn6fF8/EuqVqxgAtGSG+03QOs9tKXGfcbY3lFzWKkrMH1orQQSXc
	Tpcn6HCIp9o984qMnjoLz69jxRDRZ8NoubqU2QRmd6u1TQYrzqXhKIbPegUe3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+X6YFpq2hPlq2zytbOuG7IndNMje9dbLylp0yNgLumw=;
	b=TokoK/DRb6/6eK4cCLk9S0VuypXKh5WoL2LK69A1xhz0H9QuClCz46TdGdEBAeJ1I0aX7i
	RCot+PJD2JpkKPCQ==
Date: Mon, 16 Dec 2024 15:10:11 +0100
Subject: [PATCH 15/17] vdso: Remove remnants of architecture-specific
 random state storage
MIME-Version: 1.0
Message-Id: <20241216-vdso-store-rng-v1-15-f7aed1bdb3b2@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=4459;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MvA1FZBKdQc7iqER+HGfETL8kJGgorbHDXmM2tDCu+A=;
 b=Zr3xRYbCcw/UO3x7DwLfDqF5D1DrgaT+ruGfbEEhYCjU6h/tg+VN3P/RMcP7buU5FAN5votq8
 97qrRNVioYMC0E20AHyDs0dMoBu1Wvr3yEaegeIwSyuNNXT/YyznjG7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_141104_869805_C1EA3B24 
X-CRM114-Status: GOOD (  14.79  )
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

QWxsIHVzZXJzIG9mIHRoZSByYW5kb20gdkRTTyBhcmUgdXNpbmcgdGhlIGdlbmVyaWMgc3RvcmFn
ZQppbXBsZW1lbnRhdGlvbi4gUmVtb3ZlIHRoZSBub3cgdW5uZWNlc3NhcnkgY29tcGF0aWJpbGl0
eSBhY2Nlc3NvcgpmdW5jdGlvbnMgYW5kIHN5bWJvbHMuCgpDby1kZXZlbG9wZWQtYnk6IE5hbSBD
YW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBOYW0gQ2FvIDxuYW1jYW9A
bGludXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53
ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9jaGFyL3JhbmRvbS5jICAgfCA2
ICsrKy0tLQogaW5jbHVkZS92ZHNvL2RhdGFwYWdlLmggfCA4IC0tLS0tLS0tCiBsaWIvdmRzby9n
ZXRyYW5kb20uYyAgICB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2hhci9yYW5kb20uYyBiL2Ry
aXZlcnMvY2hhci9yYW5kb20uYwppbmRleCAyM2VlNzZiYmI0YWE3MjgyNzRiZjk5ODBhNjBiODYz
MjE2ZDg4Nzk3Li44NGVmZGE3YmVkZTM0ODQwMWRiMmVkMWM0NDNlNWFiMmJjNWRiZDJiIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2NoYXIvcmFuZG9tLmMKKysrIGIvZHJpdmVycy9jaGFyL3JhbmRvbS5j
CkBAIC0yNzgsNyArMjc4LDcgQEAgc3RhdGljIHZvaWQgY3JuZ19yZXNlZWQoc3RydWN0IHdvcmtf
c3RydWN0ICp3b3JrKQogCVdSSVRFX09OQ0UoYmFzZV9jcm5nLmdlbmVyYXRpb24sIG5leHRfZ2Vu
KTsKICNpZmRlZiBDT05GSUdfVkRTT19HRVRSQU5ET00KIAkvKiBiYXNlX2NybmcuZ2VuZXJhdGlv
bidzIGludmFsaWQgdmFsdWUgaXMgVUxPTkdfTUFYLCB3aGlsZQotCSAqIF92ZHNvX3JuZ19kYXRh
LmdlbmVyYXRpb24ncyBpbnZhbGlkIHZhbHVlIGlzIDAsIHNvIGFkZCBvbmUgdG8gdGhlCisJICog
dmRzb19rX3JuZ19kYXRhLT5nZW5lcmF0aW9uJ3MgaW52YWxpZCB2YWx1ZSBpcyAwLCBzbyBhZGQg
b25lIHRvIHRoZQogCSAqIGZvcm1lciB0byBhcnJpdmUgYXQgdGhlIGxhdHRlci4gVXNlIHNtcF9z
dG9yZV9yZWxlYXNlIHNvIHRoYXQgdGhpcwogCSAqIGlzIG9yZGVyZWQgd2l0aCB0aGUgd3JpdGUg
YWJvdmUgdG8gYmFzZV9jcm5nLmdlbmVyYXRpb24uIFBhaXJzIHdpdGgKIAkgKiB0aGUgc21wX3Jt
YigpIGJlZm9yZSB0aGUgc3lzY2FsbCBpbiB0aGUgdkRTTyBjb2RlLgpAQCAtMjkwLDcgKzI5MCw3
IEBAIHN0YXRpYyB2b2lkIGNybmdfcmVzZWVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAkg
KiBiZWNhdXNlIHRoZSB2RFNPIHNpZGUgb25seSBjaGVja3Mgd2hldGhlciB0aGUgdmFsdWUgY2hh
bmdlZCwgd2l0aG91dAogCSAqIGFjdHVhbGx5IHVzaW5nIG9yIGludGVycHJldGluZyB0aGUgdmFs
dWUuCiAJICovCi0Jc21wX3N0b3JlX3JlbGVhc2UoKHVuc2lnbmVkIGxvbmcgKikmX19hcmNoX2dl
dF9rX3Zkc29fcm5nX2RhdGEoKS0+Z2VuZXJhdGlvbiwgbmV4dF9nZW4gKyAxKTsKKwlzbXBfc3Rv
cmVfcmVsZWFzZSgodW5zaWduZWQgbG9uZyAqKSZ2ZHNvX2tfcm5nX2RhdGEtPmdlbmVyYXRpb24s
IG5leHRfZ2VuICsgMSk7CiAjZW5kaWYKIAlpZiAoIXN0YXRpY19icmFuY2hfbGlrZWx5KCZjcm5n
X2lzX3JlYWR5KSkKIAkJY3JuZ19pbml0ID0gQ1JOR19SRUFEWTsKQEAgLTc0Myw3ICs3NDMsNyBA
QCBzdGF0aWMgdm9pZCBfX2NvbGQgX2NyZWRpdF9pbml0X2JpdHMoc2l6ZV90IGJpdHMpCiAJCQlx
dWV1ZV93b3JrKHN5c3RlbV91bmJvdW5kX3dxLCAmc2V0X3JlYWR5KTsKIAkJYXRvbWljX25vdGlm
aWVyX2NhbGxfY2hhaW4oJnJhbmRvbV9yZWFkeV9ub3RpZmllciwgMCwgTlVMTCk7CiAjaWZkZWYg
Q09ORklHX1ZEU09fR0VUUkFORE9NCi0JCVdSSVRFX09OQ0UoX19hcmNoX2dldF9rX3Zkc29fcm5n
X2RhdGEoKS0+aXNfcmVhZHksIHRydWUpOworCQlXUklURV9PTkNFKHZkc29fa19ybmdfZGF0YS0+
aXNfcmVhZHksIHRydWUpOwogI2VuZGlmCiAJCXdha2VfdXBfaW50ZXJydXB0aWJsZSgmY3JuZ19p
bml0X3dhaXQpOwogCQlraWxsX2Zhc3luYygmZmFzeW5jLCBTSUdJTywgUE9MTF9JTik7CmRpZmYg
LS1naXQgYS9pbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaCBiL2luY2x1ZGUvdmRzby9kYXRhcGFnZS5o
CmluZGV4IGIzMjI3ZjFjZjYyODk1YWE2MGNlMGNhOTZhZmE0MjI1OWY0NzcxZjkuLjBmYzI0MGMw
OGUwZjdjZjU5NjEzNWVlZDE4ZGQ2ZjA2MDExOTE3ZDUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdmRz
by9kYXRhcGFnZS5oCisrKyBiL2luY2x1ZGUvdmRzby9kYXRhcGFnZS5oCkBAIC0xNTIsNyArMTUy
LDYgQEAgc3RydWN0IHZkc29fcm5nX2RhdGEgewogI2lmbmRlZiBDT05GSUdfR0VORVJJQ19WRFNP
X0RBVEFfU1RPUkUKIGV4dGVybiBzdHJ1Y3QgdmRzb190aW1lX2RhdGEgX3Zkc29fZGF0YVtDU19C
QVNFU10gX19hdHRyaWJ1dGVfXygodmlzaWJpbGl0eSgiaGlkZGVuIikpKTsKIGV4dGVybiBzdHJ1
Y3QgdmRzb190aW1lX2RhdGEgX3RpbWVuc19kYXRhW0NTX0JBU0VTXSBfX2F0dHJpYnV0ZV9fKCh2
aXNpYmlsaXR5KCJoaWRkZW4iKSkpOwotZXh0ZXJuIHN0cnVjdCB2ZHNvX3JuZ19kYXRhIF92ZHNv
X3JuZ19kYXRhIF9fYXR0cmlidXRlX18oKHZpc2liaWxpdHkoImhpZGRlbiIpKSk7CiAjZWxzZQog
ZXh0ZXJuIGNvbnN0IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSB2ZHNvX3VfdGltZV9kYXRhW0NTX0JB
U0VTXSBfX2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5KCJoaWRkZW4iKSkpOwogZXh0ZXJuIGNvbnN0
IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSB2ZHNvX3VfdGltZW5zX2RhdGFbQ1NfQkFTRVNdIF9fYXR0
cmlidXRlX18oKHZpc2liaWxpdHkoImhpZGRlbiIpKSk7CkBAIC0yMTEsMTMgKzIxMCw2IEBAIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgY29uc3Qgc3RydWN0IHZkc29fcm5nX2RhdGEgKl9fYXJjaF9n
ZXRfdmRzb191X3JuZ19kYXRhKHZvCiB7CiAJcmV0dXJuICZ2ZHNvX3Vfcm5nX2RhdGE7CiB9Ci0j
ZGVmaW5lIF9fYXJjaF9nZXRfdmRzb19ybmdfZGF0YSBfX2FyY2hfZ2V0X3Zkc29fdV9ybmdfZGF0
YQotCi1zdGF0aWMgX19hbHdheXNfaW5saW5lIHN0cnVjdCB2ZHNvX3JuZ19kYXRhICpfX2FyY2hf
Z2V0X3Zkc29fa19ybmdfZGF0YSh2b2lkKQotewotCXJldHVybiB2ZHNvX2tfcm5nX2RhdGE7Ci19
Ci0jZGVmaW5lIF9fYXJjaF9nZXRfa192ZHNvX3JuZ19kYXRhIF9fYXJjaF9nZXRfdmRzb19rX3Ju
Z19kYXRhCiAjZW5kaWYgLyogQ09ORklHX1ZEU09fR0VUUkFORE9NICovCiAKICNlbmRpZiAvKiBD
T05GSUdfR0VORVJJQ19WRFNPX0RBVEFfU1RPUkUgKi8KZGlmZiAtLWdpdCBhL2xpYi92ZHNvL2dl
dHJhbmRvbS5jIGIvbGliL3Zkc28vZ2V0cmFuZG9tLmMKaW5kZXggOTM4Y2E1MzlhYWE2NGJjNDYy
ODBlZjZkZDE3YWE2NjExMjY2OTllYi4uMmVkMDE5YTc2YWJjYTA5OWRlMzMzMjZlZjQ1MTAxY2Y1
MGYyZjc3OCAxMDA2NDQKLS0tIGEvbGliL3Zkc28vZ2V0cmFuZG9tLmMKKysrIGIvbGliL3Zkc28v
Z2V0cmFuZG9tLmMKQEAgLTE1Miw3ICsxNTIsNyBAQCBfX2N2ZHNvX2dldHJhbmRvbV9kYXRhKGNv
bnN0IHN0cnVjdCB2ZHNvX3JuZ19kYXRhICpybmdfaW5mbywgdm9pZCAqYnVmZmVyLCBzaXplXwog
CiAJCS8qCiAJCSAqIFByZXZlbnQgdGhlIHN5c2NhbGwgZnJvbSBiZWluZyByZW9yZGVyZWQgd3J0
IGN1cnJlbnRfZ2VuZXJhdGlvbi4gUGFpcnMgd2l0aCB0aGUKLQkJICogc21wX3N0b3JlX3JlbGVh
c2UoJl92ZHNvX3JuZ19kYXRhLmdlbmVyYXRpb24pIGluIHJhbmRvbS5jLgorCQkgKiBzbXBfc3Rv
cmVfcmVsZWFzZSgmdmRzb19rX3JuZ19kYXRhLmdlbmVyYXRpb24pIGluIHJhbmRvbS5jLgogCQkg
Ki8KIAkJc21wX3JtYigpOwogCkBAIC0yNTYsNSArMjU2LDUgQEAgX19jdmRzb19nZXRyYW5kb21f
ZGF0YShjb25zdCBzdHJ1Y3QgdmRzb19ybmdfZGF0YSAqcm5nX2luZm8sIHZvaWQgKmJ1ZmZlciwg
c2l6ZV8KIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgc3NpemVfdAogX19jdmRzb19nZXRyYW5kb20o
dm9pZCAqYnVmZmVyLCBzaXplX3QgbGVuLCB1bnNpZ25lZCBpbnQgZmxhZ3MsIHZvaWQgKm9wYXF1
ZV9zdGF0ZSwgc2l6ZV90IG9wYXF1ZV9sZW4pCiB7Ci0JcmV0dXJuIF9fY3Zkc29fZ2V0cmFuZG9t
X2RhdGEoX19hcmNoX2dldF92ZHNvX3JuZ19kYXRhKCksIGJ1ZmZlciwgbGVuLCBmbGFncywgb3Bh
cXVlX3N0YXRlLCBvcGFxdWVfbGVuKTsKKwlyZXR1cm4gX19jdmRzb19nZXRyYW5kb21fZGF0YShf
X2FyY2hfZ2V0X3Zkc29fdV9ybmdfZGF0YSgpLCBidWZmZXIsIGxlbiwgZmxhZ3MsIG9wYXF1ZV9z
dGF0ZSwgb3BhcXVlX2xlbik7CiB9CgotLSAKMi40Ny4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
