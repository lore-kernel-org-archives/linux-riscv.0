Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B697ECCD1BB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=gxSfQR0wkKj+Z5hNpwMORRrIpfG23GYCQtRhmjmtWgY=; b=B88b9BCfFXpruh
	vta4Kdp19djTkk3jH7Fc5CpcTeht1s42Nl7ztW8rlwA/pXzlNyZjNYBwrJfQ+kvdD+fqLhgfinEZt
	l3SklmksnNEn6nCiMisxOfxO4SIGsVmqPhiTLStVXFRQnO4RvZGRK3OKJxgbVIwjkmvFjoS1fB6sf
	Cq+YJFFRYNllnqvjb1UodeBh0DVsIpysh1S83UBhGJ0CMGjbh1IAh7Aw8V/CiNMZvT3TnMBqnXuyF
	Vps1KavbqUcNOi4AkReOPqLQet18/ZbUD5EW9eO7pbIEm0HO8jlzfOyrSEyS97irApHLb3aIaVmXv
	Pi/MPOl3PE0rkODRUoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYI7-00000002rMA-1IzX;
	Wed, 22 Oct 2025 12:50:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYHF-00000002qTD-49TJ;
	Wed, 22 Oct 2025 12:49:22 +0000
Message-ID: <20251022103112.478876605@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761137354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=CaAPbzoialu5mXFNLErT5ZTF4fpG+LkmcGL7QamE02U=;
	b=YCUM+m2IJhIlYNc3cw3Ka+JSw1r0rxQfagyYMBCbI5G0Wlrimf1GqVMRdPE4fE3q4DTDLL
	I3sZqCcSstmzPTAmKHsfJLX2C34OtucmDjHa59k+mhfvh5+9VviczJU5Sds0cipnh9SwfO
	oWZS+Qqu+HQ4gtdRXc2up+rIBxMO9BqQkbGhl/pgs0VaF5lnHLpP1SJqiRYu7DsIVtGwog
	iJzQBkR3BVxzibX9Vi4X6eSTOXUzrvM9S2tLua3pO5DkDcic3JptOzX0xEuxlfeEOEsy1h
	aSrVdebfZCKdTbD1hru16EJ14VbE11jH6OE5kYTFRDrxovf+JUjMjnVnSMwjFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761137354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=CaAPbzoialu5mXFNLErT5ZTF4fpG+LkmcGL7QamE02U=;
	b=IZpjJMDCZvmWlpmGgE3lhdOQmOPckYbthUby0iY/Im/yxFE9DkRTg5O+cgCbWyzDN24LUx
	wOuZ0lgHzEUESmCA==
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
Subject: [patch V4 10/12] futex: Convert to scoped user access
References: <20251022102427.400699796@linutronix.de>
MIME-Version: 1.0
Date: Wed, 22 Oct 2025 14:49:14 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_054920_905336_8F45C015 
X-CRM114-Status: GOOD (  14.11  )
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
cGVuIGNvZGVkIGltcGxlbWVudGF0aW9uIHdpdGggdGhlIG5ldyBnZXQvcHV0X3VzZXJfc2NvcGVk
KCkKaGVscGVycy4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkCgpTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IFBldGVyIFppamxzdHJh
IDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6IERhcnJlbiBIYXJ0IDxkdmhhcnRAaW5mcmFkZWFk
Lm9yZz4KQ2M6IERhdmlkbG9ociBCdWVzbyA8ZGF2ZUBzdGdvbGFicy5uZXQ+CkNjOiAiQW5kcsOp
IEFsbWVpZGEiIDxhbmRyZWFsbWVpZEBpZ2FsaWEuY29tPgotLS0KVjQ6IFJlbmFtZSBvbmNlIG1v
YXIKVjM6IEFkYXB0IHRvIHNjb3BlIGNoYW5nZXMKVjI6IENvbnZlcnQgdG8gc2NvcGVkIHZhcmlh
bnQKLS0tCiBrZXJuZWwvZnV0ZXgvZnV0ZXguaCB8ICAgMzcgKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzUgZGVs
ZXRpb25zKC0pCi0tLQotLS0gYS9rZXJuZWwvZnV0ZXgvZnV0ZXguaAorKysgYi9rZXJuZWwvZnV0
ZXgvZnV0ZXguaApAQCAtMjg1LDQ4ICsyODUsMTUgQEAgc3RhdGljIGlubGluZSBpbnQgZnV0ZXhf
Y21weGNoZ192YWx1ZV9sbwogICogVGhpcyBkb2VzIGEgcGxhaW4gYXRvbWljIHVzZXIgc3BhY2Ug
cmVhZCwgYW5kIHRoZSB1c2VyIHBvaW50ZXIgaGFzCiAgKiBhbHJlYWR5IGJlZW4gdmVyaWZpZWQg
ZWFybGllciBieSBnZXRfZnV0ZXhfa2V5KCkgdG8gYmUgYm90aCBhbGlnbmVkCiAgKiBhbmQgYWN0
dWFsbHkgaW4gdXNlciBzcGFjZSwganVzdCBsaWtlIGZ1dGV4X2F0b21pY19jbXB4Y2hnX2luYXRv
bWljKCkuCi0gKgotICogV2Ugc3RpbGwgd2FudCB0byBhdm9pZCBhbnkgc3BlY3VsYXRpb24sIGFu
ZCB3aGlsZSBfX2dldF91c2VyKCkgaXMKLSAqIHRoZSB0cmFkaXRpb25hbCBtb2RlbCBmb3IgdGhp
cywgaXQncyBhY3R1YWxseSBzbG93ZXIgdGhhbiBkb2luZwotICogdGhpcyBtYW51YWxseSB0aGVz
ZSBkYXlzLgotICoKLSAqIFdlIGNvdWxkIGp1c3QgaGF2ZSBhIHBlci1hcmNoaXRlY3R1cmUgc3Bl
Y2lhbCBmdW5jdGlvbiBmb3IgaXQsCi0gKiB0aGUgc2FtZSB3YXkgd2UgZG8gZnV0ZXhfYXRvbWlj
X2NtcHhjaGdfaW5hdG9taWMoKSwgYnV0IHJhdGhlcgotICogdGhhbiBmb3JjZSBldmVyeWJvZHkg
dG8gZG8gdGhhdCwgd3JpdGUgaXQgb3V0IGxvbmctaGFuZCB1c2luZwotICogdGhlIGxvdy1sZXZl
bCB1c2VyLWFjY2VzcyBpbmZyYXN0cnVjdHVyZS4KLSAqCi0gKiBUaGlzIGxvb2tzIGEgYml0IG92
ZXJraWxsLCBidXQgZ2VuZXJhbGx5IGp1c3QgcmVzdWx0cyBpbiBhIGNvdXBsZQotICogb2YgaW5z
dHJ1Y3Rpb25zLgogICovCiBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBmdXRleF9nZXRfdmFs
dWUodTMyICpkZXN0LCB1MzIgX191c2VyICpmcm9tKQogewotCXUzMiB2YWw7Ci0KLQlpZiAoY2Fu
X2RvX21hc2tlZF91c2VyX2FjY2VzcygpKQotCQlmcm9tID0gbWFza2VkX3VzZXJfYWNjZXNzX2Jl
Z2luKGZyb20pOwotCWVsc2UgaWYgKCF1c2VyX3JlYWRfYWNjZXNzX2JlZ2luKGZyb20sIHNpemVv
ZigqZnJvbSkpKQotCQlyZXR1cm4gLUVGQVVMVDsKLQl1bnNhZmVfZ2V0X3VzZXIodmFsLCBmcm9t
LCBFZmF1bHQpOwotCXVzZXJfcmVhZF9hY2Nlc3NfZW5kKCk7Ci0JKmRlc3QgPSB2YWw7Ci0JcmV0
dXJuIDA7Ci1FZmF1bHQ6Ci0JdXNlcl9yZWFkX2FjY2Vzc19lbmQoKTsKLQlyZXR1cm4gLUVGQVVM
VDsKKwlyZXR1cm4gZ2V0X3VzZXJfc2NvcGVkKCpkZXN0LCBmcm9tKSA/IDAgOiAtRUZBVUxUOwog
fQogCiBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBmdXRleF9wdXRfdmFsdWUodTMyIHZhbCwg
dTMyIF9fdXNlciAqdG8pCiB7Ci0JaWYgKGNhbl9kb19tYXNrZWRfdXNlcl9hY2Nlc3MoKSkKLQkJ
dG8gPSBtYXNrZWRfdXNlcl9hY2Nlc3NfYmVnaW4odG8pOwotCWVsc2UgaWYgKCF1c2VyX3dyaXRl
X2FjY2Vzc19iZWdpbih0bywgc2l6ZW9mKCp0bykpKQotCQlyZXR1cm4gLUVGQVVMVDsKLQl1bnNh
ZmVfcHV0X3VzZXIodmFsLCB0bywgRWZhdWx0KTsKLQl1c2VyX3dyaXRlX2FjY2Vzc19lbmQoKTsK
LQlyZXR1cm4gMDsKLUVmYXVsdDoKLQl1c2VyX3dyaXRlX2FjY2Vzc19lbmQoKTsKLQlyZXR1cm4g
LUVGQVVMVDsKKwlyZXR1cm4gcHV0X3VzZXJfc2NvcGVkKHZhbCwgdG8pID8gMCA6IC1FRkFVTFQ7
CiB9CiAKIHN0YXRpYyBpbmxpbmUgaW50IGZ1dGV4X2dldF92YWx1ZV9sb2NrZWQodTMyICpkZXN0
LCB1MzIgX191c2VyICpmcm9tKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
