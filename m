Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86166CF07B8
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OI34Xnv+3nUrWyU6ZYZgpK0LvnhHiCbmqHe8b9JNeNw=; b=AyG9efS6lk6Bw4
	mKA/O/oB6uvyZzU9wZRcWiI2+fWy4NLIkMpi/C935Sa/ho+OTBCA89uBXvpDw1cmRopGyf3mLo+m9
	HOMuInHVjw+Z2SVErFSIUHBVvFtR3gSj1Pwh5A6DjSBDB+CS04zA/jkpe0DYIZxsAdU624dGKXAYV
	uP99ZoN9xERnJr61VELxDYk5Em4FSgArTLssXsgVgC/sGq+QHRYe6ger9dCcrXzZx4eF5j3FtgrjB
	rN8TXV99bjB/XBJTgA9XoTACxDRCMcnocaG9y+ZAebQMbqOZMrKYQHr3AGpX1eurkh/ZHUecGeHCm
	KEQxjUV5jpMvXuPhb+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synIV-0000000Bnse-0daK;
	Thu, 10 Oct 2024 07:09:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBa-0000000Blic-3FBj;
	Thu, 10 Oct 2024 07:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KF1X3F6ARHGxF8oaxKdzOM4GysZzGmQKcnkswWuBTx0=; b=j/SBbj3T/61rGL9WKL06ERNWNj
	kEqd8cPgvCJA0IGZEhaG9HfLHZjjhvY+ujI+Ifne8/XUctXHOqbOMKia5B1eBnmx0AruAFJurrCw6
	y4s8DHDYp6Dc4YcedX2/8KXegT1YtkHh5UO0beBnvinNp0EMbAu7x5zjO9NVv4asqmJzDAR9U/W2w
	7S7NRRZVPkZiNE9b4cBcA7uUsBLMUF1t1TtjjEELA2MrHh0V2yDLQscL8vbMAPIm3Yiy5bgX3EyL9
	dS+JT4he6MPgHirRxwgJzT0LDeeZWUW9LjtwSCCapviB3XF0oVwY/CdfjuPfU/MbqN6WueoatVyes
	tHrV13hQ==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBX-00000005CoR-2EOx;
	Thu, 10 Oct 2024 07:02:09 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KF1X3F6ARHGxF8oaxKdzOM4GysZzGmQKcnkswWuBTx0=;
	b=ndJGHPfLf2ExpAJ4MbxYj5J+P8wuFGPA7VYN9NrXrNAlUm/CGVxUrauYkG7TikMLhcJxcW
	iYwYdcNH5zfSrEBIy6lQMphOmnfJCE2iBKi76iPIHzw2lm67oIBLKMmGv4o6xsuENV3Myh
	ZMy30US0WZjW3qpAQMEbjjivpvqZ3CQcPPdqXQZq90KEIthe4wDpFw5ctRf6kBi/tz2cMk
	1RzXAnqR9sZVO/JiMKcJ/Qtv0ZKmrNnOsqgOQMvHaNQaERMQ0LRmxDFNnlG1ehHvcq5RqB
	di01YHTH1z+vMFEWL+Gj0vn08Yfy+H+PsfKAjPiZtv6I/8MsShEMUFQVU7F7Fw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KF1X3F6ARHGxF8oaxKdzOM4GysZzGmQKcnkswWuBTx0=;
	b=MH2T81AojO0jKuneSuCD3w8FdNX+OeGnOT9yCnWr3ROkgtmsAPXlTHrQQkIrlSnbh7IvlZ
	nzv+XX0BfnW2BKAQ==
Date: Thu, 10 Oct 2024 09:01:08 +0200
Subject: [PATCH 06/28] riscv: vdso: Use only one single vvar mapping
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-6-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=3820;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=WIPUW1+5c4OWUexEOYHAu/zDSui+TD1Rmwt6KNpKs/A=;
 b=rP6ASr+p5qtSseOgybXaXYykoMDxYyz+tu1FXrx8Y3WZD4L2xbuIpAuT0PAHKcEkh9WZFigt/
 RdDK+Gfq3LhADBTLK1iLgcDK80l4VS/omBd9TTZ4wW4ybQLNN2a7Sud
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080207_753808_FCFDF2A4 
X-CRM114-Status: GOOD (  14.19  )
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

VGhlIHZ2YXIgbWFwcGluZyBpcyB0aGUgc2FtZSBmb3IgYWxsIHByb2Nlc3Nlcy4gVXNlIGEgc2lu
Z2xlIG1hcHBpbmcgdG8Kc2ltcGxpZnkgdGhlIGxvZ2ljIGFuZCBhbGlnbiBpdCB3aXRoIHRoZSBv
dGhlciBhcmNoaXRlY3R1cmVzLgoKSW4gYWRkaXRpb24gdGhpcyB3aWxsIGVuYWJsZSB0aGUgbW92
ZSBvZiB0aGUgdnZhciBoYW5kbGluZyBpbnRvIGdlbmVyaWMgY29kZS4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0K
IGFyY2gvcmlzY3Yva2VybmVsL3Zkc28uYyB8IDUyICsrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyks
IDM1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwppbmRleCA5ODMxNWI5ODI1NmRmNDEyZDQ4NDc5YzAx
MTRiNWE1YjQ5YTdiNTgzLi4zY2EzYWU0Mjc3ZTE4N2U3OTBhOGJmNTEzYTllODBkOGI2MjkwYmIy
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdmRzby5jCkBAIC0yMywxMSArMjMsNiBAQCBlbnVtIHZ2YXJfcGFnZXMgewogCVZWQVJf
TlJfUEFHRVMsCiB9OwogCi1lbnVtIHJ2X3Zkc29fbWFwIHsKLQlSVl9WRFNPX01BUF9WVkFSLAot
CVJWX1ZEU09fTUFQX1ZEU08sCi19OwotCiAjZGVmaW5lIFZWQVJfU0laRSAgKFZWQVJfTlJfUEFH
RVMgPDwgUEFHRV9TSElGVCkKIAogc3RhdGljIHVuaW9uIHZkc29fZGF0YV9zdG9yZSB2ZHNvX2Rh
dGFfc3RvcmUgX19wYWdlX2FsaWduZWRfZGF0YTsKQEAgLTM4LDggKzMzLDYgQEAgc3RydWN0IF9f
dmRzb19pbmZvIHsKIAljb25zdCBjaGFyICp2ZHNvX2NvZGVfc3RhcnQ7CiAJY29uc3QgY2hhciAq
dmRzb19jb2RlX2VuZDsKIAl1bnNpZ25lZCBsb25nIHZkc29fcGFnZXM7Ci0JLyogRGF0YSBNYXBw
aW5nICovCi0Jc3RydWN0IHZtX3NwZWNpYWxfbWFwcGluZyAqZG07CiAJLyogQ29kZSBNYXBwaW5n
ICovCiAJc3RydWN0IHZtX3NwZWNpYWxfbWFwcGluZyAqY207CiB9OwpAQCAtOTIsNiArODUsOCBA
QCBzdHJ1Y3QgdmRzb19kYXRhICphcmNoX2dldF92ZHNvX2RhdGEodm9pZCAqdnZhcl9wYWdlKQog
CXJldHVybiAoc3RydWN0IHZkc29fZGF0YSAqKSh2dmFyX3BhZ2UpOwogfQogCitzdGF0aWMgY29u
c3Qgc3RydWN0IHZtX3NwZWNpYWxfbWFwcGluZyBydl92dmFyX21hcDsKKwogLyoKICAqIFRoZSB2
dmFyIG1hcHBpbmcgY29udGFpbnMgZGF0YSBmb3IgYSBzcGVjaWZpYyB0aW1lIG5hbWVzcGFjZSwg
c28gd2hlbiBhIHRhc2sKICAqIGNoYW5nZXMgbmFtZXNwYWNlIHdlIG11c3QgdW5tYXAgaXRzIHZ2
YXIgZGF0YSBmb3IgdGhlIG9sZCBuYW1lc3BhY2UuCkBAIC0xMDgsMTIgKzEwMyw4IEBAIGludCB2
ZHNvX2pvaW5fdGltZW5zKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHRpbWVfbmFt
ZXNwYWNlICpucykKIAltbWFwX3JlYWRfbG9jayhtbSk7CiAKIAlmb3JfZWFjaF92bWEodm1pLCB2
bWEpIHsKLQkJaWYgKHZtYV9pc19zcGVjaWFsX21hcHBpbmcodm1hLCB2ZHNvX2luZm8uZG0pKQot
CQkJemFwX3ZtYV9wYWdlcyh2bWEpOwotI2lmZGVmIENPTkZJR19DT01QQVQKLQkJaWYgKHZtYV9p
c19zcGVjaWFsX21hcHBpbmcodm1hLCBjb21wYXRfdmRzb19pbmZvLmRtKSkKKwkJaWYgKHZtYV9p
c19zcGVjaWFsX21hcHBpbmcodm1hLCAmcnZfdnZhcl9tYXApKQogCQkJemFwX3ZtYV9wYWdlcyh2
bWEpOwotI2VuZGlmCiAJfQogCiAJbW1hcF9yZWFkX3VubG9jayhtbSk7CkBAIC0xNTUsNDMgKzE0
NiwzNCBAQCBzdGF0aWMgdm1fZmF1bHRfdCB2dmFyX2ZhdWx0KGNvbnN0IHN0cnVjdCB2bV9zcGVj
aWFsX21hcHBpbmcgKnNtLAogCXJldHVybiB2bWZfaW5zZXJ0X3Bmbih2bWEsIHZtZi0+YWRkcmVz
cywgcGZuKTsKIH0KIAotc3RhdGljIHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgcnZfdmRzb19t
YXBzW10gX19yb19hZnRlcl9pbml0ID0gewotCVtSVl9WRFNPX01BUF9WVkFSXSA9IHsKLQkJLm5h
bWUgICA9ICJbdnZhcl0iLAotCQkuZmF1bHQgPSB2dmFyX2ZhdWx0LAotCX0sCi0JW1JWX1ZEU09f
TUFQX1ZEU09dID0gewotCQkubmFtZSAgID0gIlt2ZHNvXSIsCi0JCS5tcmVtYXAgPSB2ZHNvX21y
ZW1hcCwKLQl9LAorc3RhdGljIGNvbnN0IHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgcnZfdnZh
cl9tYXAgPSB7CisJLm5hbWUgICA9ICJbdnZhcl0iLAorCS5mYXVsdCA9IHZ2YXJfZmF1bHQsCit9
OworCitzdGF0aWMgc3RydWN0IHZtX3NwZWNpYWxfbWFwcGluZyBydl92ZHNvX21hcCBfX3JvX2Fm
dGVyX2luaXQgPSB7CisJLm5hbWUgICA9ICJbdmRzb10iLAorCS5tcmVtYXAgPSB2ZHNvX21yZW1h
cCwKIH07CiAKIHN0YXRpYyBzdHJ1Y3QgX192ZHNvX2luZm8gdmRzb19pbmZvIF9fcm9fYWZ0ZXJf
aW5pdCA9IHsKIAkubmFtZSA9ICJ2ZHNvIiwKIAkudmRzb19jb2RlX3N0YXJ0ID0gdmRzb19zdGFy
dCwKIAkudmRzb19jb2RlX2VuZCA9IHZkc29fZW5kLAotCS5kbSA9ICZydl92ZHNvX21hcHNbUlZf
VkRTT19NQVBfVlZBUl0sCi0JLmNtID0gJnJ2X3Zkc29fbWFwc1tSVl9WRFNPX01BUF9WRFNPXSwK
KwkuY20gPSAmcnZfdmRzb19tYXAsCiB9OwogCiAjaWZkZWYgQ09ORklHX0NPTVBBVAotc3RhdGlj
IHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgcnZfY29tcGF0X3Zkc29fbWFwc1tdIF9fcm9fYWZ0
ZXJfaW5pdCA9IHsKLQlbUlZfVkRTT19NQVBfVlZBUl0gPSB7Ci0JCS5uYW1lICAgPSAiW3Z2YXJd
IiwKLQkJLmZhdWx0ID0gdnZhcl9mYXVsdCwKLQl9LAotCVtSVl9WRFNPX01BUF9WRFNPXSA9IHsK
LQkJLm5hbWUgICA9ICJbdmRzb10iLAotCQkubXJlbWFwID0gdmRzb19tcmVtYXAsCi0JfSwKK3N0
YXRpYyBzdHJ1Y3Qgdm1fc3BlY2lhbF9tYXBwaW5nIHJ2X2NvbXBhdF92ZHNvX21hcCBfX3JvX2Fm
dGVyX2luaXQgPSB7CisJLm5hbWUgICA9ICJbdmRzb10iLAorCS5tcmVtYXAgPSB2ZHNvX21yZW1h
cCwKIH07CiAKIHN0YXRpYyBzdHJ1Y3QgX192ZHNvX2luZm8gY29tcGF0X3Zkc29faW5mbyBfX3Jv
X2FmdGVyX2luaXQgPSB7CiAJLm5hbWUgPSAiY29tcGF0X3Zkc28iLAogCS52ZHNvX2NvZGVfc3Rh
cnQgPSBjb21wYXRfdmRzb19zdGFydCwKIAkudmRzb19jb2RlX2VuZCA9IGNvbXBhdF92ZHNvX2Vu
ZCwKLQkuZG0gPSAmcnZfY29tcGF0X3Zkc29fbWFwc1tSVl9WRFNPX01BUF9WVkFSXSwKLQkuY20g
PSAmcnZfY29tcGF0X3Zkc29fbWFwc1tSVl9WRFNPX01BUF9WRFNPXSwKKwkuY20gPSAmcnZfY29t
cGF0X3Zkc29fbWFwLAogfTsKICNlbmRpZgogCkBAIC0yMjcsNyArMjA5LDcgQEAgc3RhdGljIGlu
dCBfX3NldHVwX2FkZGl0aW9uYWxfcGFnZXMoc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJfQogCiAJ
cmV0ID0gX2luc3RhbGxfc3BlY2lhbF9tYXBwaW5nKG1tLCB2ZHNvX2Jhc2UsIFZWQVJfU0laRSwK
LQkJKFZNX1JFQUQgfCBWTV9NQVlSRUFEIHwgVk1fUEZOTUFQKSwgdmRzb19pbmZvLT5kbSk7CisJ
CShWTV9SRUFEIHwgVk1fTUFZUkVBRCB8IFZNX1BGTk1BUCksICZydl92dmFyX21hcCk7CiAJaWYg
KElTX0VSUihyZXQpKQogCQlnb3RvIHVwX2ZhaWw7CiAKCi0tIAoyLjQ3LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
