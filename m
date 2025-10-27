Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB58CCF9EE
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 08:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=FekeZg6tNZORvMi7AXSlkaA6DyZjY6NMN3PcV2yh4SU=; b=AYMbG46jO/P6zk
	uLssmdnd94yAZqgM1pG4fPlOWCqGLfOP3v5xmjTnUTM+vTWeQFFe1+Uff3pjj+Ti6lbz2ef/nzlrB
	Lr3t3Hhy6v1bBt/EuDi3Jta8QYnq9jzmISk23ldGtRpzsGsKLYBoyUuaucK4n9NmdFZAxBf7Lj7ts
	iDEI+bXBXSWFO0LNGGO8se+ci+cg0pwNTQTMYHuRpWTeAerkcEHjgdgd6fe3Qo2C65dD+wWh4rqJC
	z+fByS8pTLFUy12GEFGa4+AyZ7Kh0zlGORAMHM5gEYEeD92Ep3Py6MeiwFhFxXkvynHLQ+Mwq49an
	/F8sqqJXCHPYRIQADCTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIqO-0000000DP4r-0HQw;
	Mon, 27 Oct 2025 08:44:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpf-0000000DOBt-3gjw;
	Mon, 27 Oct 2025 08:44:09 +0000
Message-ID: <20251027083745.736737934@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=435+37KhAU0mhng1XnAbeS2nHoeU+rxEjwbVMsKftxA=;
	b=I4Kw5Ywek/IX9WMSt/JXEa6snrzGFocVq/IjZtkNm1ANMjiG+drhyzT6KMpNFoZ81+hpq6
	7eExgfokt10EBfmMcQQqV3fHS7o+tZ1wKnuLPw3dhoCmS+7DNc4GlQebCPGHmHeHNEXGGv
	dHUpqGVUsaIl7lhAhzePlzvZ9TZmCnQJkRaIhw6kSszp+Oe3T28gR/NmuCpMOdRMmdbgWK
	49R4Iz46M9aRnw8O5tqYDlJeRDC1t10xoiAaSTGN43wU0DwX72QRSrd7bLWPPaoJLnpDRt
	WsrcrnhgR+2dkKcsStXQmlVjHMHAgmZ8OHZztJdfAQhnJWROQZ2fWyeT4rsVLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=435+37KhAU0mhng1XnAbeS2nHoeU+rxEjwbVMsKftxA=;
	b=5fUpbazZrmkMXN7jn9+9G33jFnKwKg6Vab+X7NXNyTTxhdWjb/TPTSoWsl2TtGRcijzTye
	9yPo5IrGwO3RP/DA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V5 10/12] futex: Convert to get/put_user_inline()
References: <20251027083700.573016505@linutronix.de>
MIME-Version: 1.0
Date: Mon, 27 Oct 2025 09:44:00 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014404_173639_2A9DEBE1 
X-CRM114-Status: GOOD (  16.63  )
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

RnJvbTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CgpSZXBsYWNlIHRoZSBv
cGVuIGNvZGVkIGltcGxlbWVudGF0aW9uIHdpdGggdGhlIG5ldyBnZXQvcHV0X3VzZXJfaW5saW5l
KCkKaGVscGVycy4gVGhpcyBtaWdodCBiZSByZXBsYWNlZCBieSBhIHJlZ3VsYXIgZ2V0L3B1dF91
c2VyKCksIGJ1dCB0aGF0IG5lZWRzCmEgcHJvcGVyIHBlcmZvcm1hbmNlIGV2YWx1YXRpb24uCgpO
byBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZAoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJh
ZGVhZC5vcmc+CkNjOiBEYXJyZW4gSGFydCA8ZHZoYXJ0QGluZnJhZGVhZC5vcmc+CkNjOiBEYXZp
ZGxvaHIgQnVlc28gPGRhdmVAc3Rnb2xhYnMubmV0PgpDYzogIkFuZHLDqSBBbG1laWRhIiA8YW5k
cmVhbG1laWRAaWdhbGlhLmNvbT4KLS0tClY1OiBSZW5hbWUgYWdhaW4gYW5kIHJlbW92ZSB0aGUg
aGVscGVycwpWNDogUmVuYW1lIG9uY2UgbW9hcgpWMzogQWRhcHQgdG8gc2NvcGUgY2hhbmdlcwpW
MjogQ29udmVydCB0byBzY29wZWQgdmFyaWFudAotLS0KIGtlcm5lbC9mdXRleC9jb3JlLmMgIHwg
ICAgNCArLS0KIGtlcm5lbC9mdXRleC9mdXRleC5oIHwgICA1OCArKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCA1NyBkZWxldGlvbnMoLSkKLS0tCi0tLSBhL2tlcm5lbC9mdXRleC9jb3JlLmMK
KysrIGIva2VybmVsL2Z1dGV4L2NvcmUuYwpAQCAtNTgxLDcgKzU4MSw3IEBAIGludCBnZXRfZnV0
ZXhfa2V5KHUzMiBfX3VzZXIgKnVhZGRyLCB1bnMKIAlpZiAoZmxhZ3MgJiBGTEFHU19OVU1BKSB7
CiAJCXUzMiBfX3VzZXIgKm5hZGRyID0gKHZvaWQgKil1YWRkciArIHNpemUgLyAyOwogCi0JCWlm
IChmdXRleF9nZXRfdmFsdWUoJm5vZGUsIG5hZGRyKSkKKwkJaWYgKGdldF91c2VyX2lubGluZShu
b2RlLCBuYWRkcikpCiAJCQlyZXR1cm4gLUVGQVVMVDsKIAogCQlpZiAoKG5vZGUgIT0gRlVURVhf
Tk9fTk9ERSkgJiYKQEAgLTYwMSw3ICs2MDEsNyBAQCBpbnQgZ2V0X2Z1dGV4X2tleSh1MzIgX191
c2VyICp1YWRkciwgdW5zCiAJCQlub2RlID0gbnVtYV9ub2RlX2lkKCk7CiAJCQlub2RlX3VwZGF0
ZWQgPSB0cnVlOwogCQl9Ci0JCWlmIChub2RlX3VwZGF0ZWQgJiYgZnV0ZXhfcHV0X3ZhbHVlKG5v
ZGUsIG5hZGRyKSkKKwkJaWYgKG5vZGVfdXBkYXRlZCAmJiBwdXRfdXNlcl9pbmxpbmUobm9kZSwg
bmFkZHIpKQogCQkJcmV0dXJuIC1FRkFVTFQ7CiAJfQogCi0tLSBhL2tlcm5lbC9mdXRleC9mdXRl
eC5oCisrKyBiL2tlcm5lbC9mdXRleC9mdXRleC5oCkBAIC0yODEsNjMgKzI4MSwxMSBAQCBzdGF0
aWMgaW5saW5lIGludCBmdXRleF9jbXB4Y2hnX3ZhbHVlX2xvCiAJcmV0dXJuIHJldDsKIH0KIAot
LyoKLSAqIFRoaXMgZG9lcyBhIHBsYWluIGF0b21pYyB1c2VyIHNwYWNlIHJlYWQsIGFuZCB0aGUg
dXNlciBwb2ludGVyIGhhcwotICogYWxyZWFkeSBiZWVuIHZlcmlmaWVkIGVhcmxpZXIgYnkgZ2V0
X2Z1dGV4X2tleSgpIHRvIGJlIGJvdGggYWxpZ25lZAotICogYW5kIGFjdHVhbGx5IGluIHVzZXIg
c3BhY2UsIGp1c3QgbGlrZSBmdXRleF9hdG9taWNfY21weGNoZ19pbmF0b21pYygpLgotICoKLSAq
IFdlIHN0aWxsIHdhbnQgdG8gYXZvaWQgYW55IHNwZWN1bGF0aW9uLCBhbmQgd2hpbGUgX19nZXRf
dXNlcigpIGlzCi0gKiB0aGUgdHJhZGl0aW9uYWwgbW9kZWwgZm9yIHRoaXMsIGl0J3MgYWN0dWFs
bHkgc2xvd2VyIHRoYW4gZG9pbmcKLSAqIHRoaXMgbWFudWFsbHkgdGhlc2UgZGF5cy4KLSAqCi0g
KiBXZSBjb3VsZCBqdXN0IGhhdmUgYSBwZXItYXJjaGl0ZWN0dXJlIHNwZWNpYWwgZnVuY3Rpb24g
Zm9yIGl0LAotICogdGhlIHNhbWUgd2F5IHdlIGRvIGZ1dGV4X2F0b21pY19jbXB4Y2hnX2luYXRv
bWljKCksIGJ1dCByYXRoZXIKLSAqIHRoYW4gZm9yY2UgZXZlcnlib2R5IHRvIGRvIHRoYXQsIHdy
aXRlIGl0IG91dCBsb25nLWhhbmQgdXNpbmcKLSAqIHRoZSBsb3ctbGV2ZWwgdXNlci1hY2Nlc3Mg
aW5mcmFzdHJ1Y3R1cmUuCi0gKgotICogVGhpcyBsb29rcyBhIGJpdCBvdmVya2lsbCwgYnV0IGdl
bmVyYWxseSBqdXN0IHJlc3VsdHMgaW4gYSBjb3VwbGUKLSAqIG9mIGluc3RydWN0aW9ucy4KLSAq
Lwotc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQgZnV0ZXhfZ2V0X3ZhbHVlKHUzMiAqZGVzdCwg
dTMyIF9fdXNlciAqZnJvbSkKLXsKLQl1MzIgdmFsOwotCi0JaWYgKGNhbl9kb19tYXNrZWRfdXNl
cl9hY2Nlc3MoKSkKLQkJZnJvbSA9IG1hc2tlZF91c2VyX2FjY2Vzc19iZWdpbihmcm9tKTsKLQll
bHNlIGlmICghdXNlcl9yZWFkX2FjY2Vzc19iZWdpbihmcm9tLCBzaXplb2YoKmZyb20pKSkKLQkJ
cmV0dXJuIC1FRkFVTFQ7Ci0JdW5zYWZlX2dldF91c2VyKHZhbCwgZnJvbSwgRWZhdWx0KTsKLQl1
c2VyX3JlYWRfYWNjZXNzX2VuZCgpOwotCSpkZXN0ID0gdmFsOwotCXJldHVybiAwOwotRWZhdWx0
OgotCXVzZXJfcmVhZF9hY2Nlc3NfZW5kKCk7Ci0JcmV0dXJuIC1FRkFVTFQ7Ci19Ci0KLXN0YXRp
YyBfX2Fsd2F5c19pbmxpbmUgaW50IGZ1dGV4X3B1dF92YWx1ZSh1MzIgdmFsLCB1MzIgX191c2Vy
ICp0bykKLXsKLQlpZiAoY2FuX2RvX21hc2tlZF91c2VyX2FjY2VzcygpKQotCQl0byA9IG1hc2tl
ZF91c2VyX2FjY2Vzc19iZWdpbih0byk7Ci0JZWxzZSBpZiAoIXVzZXJfd3JpdGVfYWNjZXNzX2Jl
Z2luKHRvLCBzaXplb2YoKnRvKSkpCi0JCXJldHVybiAtRUZBVUxUOwotCXVuc2FmZV9wdXRfdXNl
cih2YWwsIHRvLCBFZmF1bHQpOwotCXVzZXJfd3JpdGVfYWNjZXNzX2VuZCgpOwotCXJldHVybiAw
OwotRWZhdWx0OgotCXVzZXJfd3JpdGVfYWNjZXNzX2VuZCgpOwotCXJldHVybiAtRUZBVUxUOwot
fQotCisvKiBSZWFkIGZyb20gdXNlciBtZW1vcnkgd2l0aCBwYWdlZmF1bHRzIGRpc2FibGVkICov
CiBzdGF0aWMgaW5saW5lIGludCBmdXRleF9nZXRfdmFsdWVfbG9ja2VkKHUzMiAqZGVzdCwgdTMy
IF9fdXNlciAqZnJvbSkKIHsKLQlpbnQgcmV0OwotCi0JcGFnZWZhdWx0X2Rpc2FibGUoKTsKLQly
ZXQgPSBmdXRleF9nZXRfdmFsdWUoZGVzdCwgZnJvbSk7Ci0JcGFnZWZhdWx0X2VuYWJsZSgpOwot
Ci0JcmV0dXJuIHJldDsKKwlndWFyZChwYWdlZmF1bHQpKCk7CisJcmV0dXJuIGdldF91c2VyX2lu
bGluZSgqZGVzdCwgZnJvbSk7CiB9CiAKIGV4dGVybiB2b2lkIF9fZnV0ZXhfdW5xdWV1ZShzdHJ1
Y3QgZnV0ZXhfcSAqcSk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
