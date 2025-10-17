Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E19CCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=85oxZF9AXx0M4HcvdekfOgzggogSn4O+eI8KkgzeGI4=; b=WB2tiNsx8pA6mA
	Y+vTtIGHg0dxVBqgV/jpRtJu9dcBrCfAuQ0LDuBJf/Fr7pJ8FiqbItEiliMrSO4TMLaSCwWH+tUuJ
	bQrxP9OEfV2SEI7CaNfi4v0RJEHQSN+2QZel7NUiOjIUETUmmWZml+Fl1ns4AWj3JUDqtT9mm/tWJ
	rd29vWTsdVMHGsAEdM3Yco1mEhtHR4CYJXUnb2rCMrQV00gdxy/zxwXKDbjIa9CIHtDIOb40R38DR
	WlEMYkvVH3ka7cbPUU576eTn1gRbWBuWpiRgFKaC3WSetF+OQRC8A4YJj5lHHxAEjHZtV0sdxsdUX
	Z0kxM/26ultu1mp7LHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOn-00000007SUq-1oNy;
	Fri, 17 Oct 2025 10:09:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOf-00000007SEV-22DO;
	Fri, 17 Oct 2025 10:09:19 +0000
Message-ID: <20251017093030.443142844@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=kgiZQ2LHnoAuUeU4bAPUZQG9DpHKgtV5g2vXbnxY3WU=;
	b=mpkjILJoMW+NxL7mj7Gkt8KfTdP8hlJpo2Od+7iroOPr22g6zAYrA6yUvqMmBvxNsIgubm
	CvGY3j5HuJ+GKdxHiPMjY9rCQ53bXOmVeodjH//fzeLUVju5Bb6VUVR8AgiWuur7rbvdkV
	gxn/pTETiDGuMBDkvtMVlTJDHVlPeeW33L6tqfdVc7PoE4GjPdtSjlMNaKd52hrDg2+tL7
	wUV768CPkGumlygCkw7AUUe6cdpax17aJuyAMZOir0K0ahKMAwQCDdK6KEUtEhAAp3+WlU
	17Zuy6C9rKn8fIYmyOjnpI4ODlq+tUAt8V9oX846q250RQEpr3Ctvv7+PvRq8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=kgiZQ2LHnoAuUeU4bAPUZQG9DpHKgtV5g2vXbnxY3WU=;
	b=tdhXCPyA4ZEVvsSHbhYKGj01qPJmkWPTgxxpK9M9rn0Kr9sE2FveZ1mXCHtQvUnuVlAgry
	ZcvdOvRAb0kTDZAw==
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
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V3 10/12] futex: Convert to scoped masked user access
References: <20251017085938.150569636@linutronix.de>
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 12:09:14 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030917_840540_FF935973 
X-CRM114-Status: GOOD (  13.65  )
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
cGVuIGNvZGVkIGltcGxlbWVudGF0aW9uIHdpdGggdGhlIG5ldyBnZXQvcHV0X3VzZXJfbWFza2Vk
KCkKaGVscGVycy4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkCgpTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IFBldGVyIFppamxzdHJh
IDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6IERhcnJlbiBIYXJ0IDxkdmhhcnRAaW5mcmFkZWFk
Lm9yZz4KQ2M6IERhdmlkbG9ociBCdWVzbyA8ZGF2ZUBzdGdvbGFicy5uZXQ+CkNjOiAiQW5kcsOp
IEFsbWVpZGEiIDxhbmRyZWFsbWVpZEBpZ2FsaWEuY29tPgotLS0KVjM6IEFkYXB0IHRvIHNjb3Bl
IGNoYW5nZXMKVjI6IENvbnZlcnQgdG8gc2NvcGVkIHZhcmlhbnQKLS0tCiBrZXJuZWwvZnV0ZXgv
ZnV0ZXguaCB8ICAgMzcgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCi0tLQotLS0gYS9r
ZXJuZWwvZnV0ZXgvZnV0ZXguaAorKysgYi9rZXJuZWwvZnV0ZXgvZnV0ZXguaApAQCAtMjg1LDQ4
ICsyODUsMTUgQEAgc3RhdGljIGlubGluZSBpbnQgZnV0ZXhfY21weGNoZ192YWx1ZV9sbwogICog
VGhpcyBkb2VzIGEgcGxhaW4gYXRvbWljIHVzZXIgc3BhY2UgcmVhZCwgYW5kIHRoZSB1c2VyIHBv
aW50ZXIgaGFzCiAgKiBhbHJlYWR5IGJlZW4gdmVyaWZpZWQgZWFybGllciBieSBnZXRfZnV0ZXhf
a2V5KCkgdG8gYmUgYm90aCBhbGlnbmVkCiAgKiBhbmQgYWN0dWFsbHkgaW4gdXNlciBzcGFjZSwg
anVzdCBsaWtlIGZ1dGV4X2F0b21pY19jbXB4Y2hnX2luYXRvbWljKCkuCi0gKgotICogV2Ugc3Rp
bGwgd2FudCB0byBhdm9pZCBhbnkgc3BlY3VsYXRpb24sIGFuZCB3aGlsZSBfX2dldF91c2VyKCkg
aXMKLSAqIHRoZSB0cmFkaXRpb25hbCBtb2RlbCBmb3IgdGhpcywgaXQncyBhY3R1YWxseSBzbG93
ZXIgdGhhbiBkb2luZwotICogdGhpcyBtYW51YWxseSB0aGVzZSBkYXlzLgotICoKLSAqIFdlIGNv
dWxkIGp1c3QgaGF2ZSBhIHBlci1hcmNoaXRlY3R1cmUgc3BlY2lhbCBmdW5jdGlvbiBmb3IgaXQs
Ci0gKiB0aGUgc2FtZSB3YXkgd2UgZG8gZnV0ZXhfYXRvbWljX2NtcHhjaGdfaW5hdG9taWMoKSwg
YnV0IHJhdGhlcgotICogdGhhbiBmb3JjZSBldmVyeWJvZHkgdG8gZG8gdGhhdCwgd3JpdGUgaXQg
b3V0IGxvbmctaGFuZCB1c2luZwotICogdGhlIGxvdy1sZXZlbCB1c2VyLWFjY2VzcyBpbmZyYXN0
cnVjdHVyZS4KLSAqCi0gKiBUaGlzIGxvb2tzIGEgYml0IG92ZXJraWxsLCBidXQgZ2VuZXJhbGx5
IGp1c3QgcmVzdWx0cyBpbiBhIGNvdXBsZQotICogb2YgaW5zdHJ1Y3Rpb25zLgogICovCiBzdGF0
aWMgX19hbHdheXNfaW5saW5lIGludCBmdXRleF9nZXRfdmFsdWUodTMyICpkZXN0LCB1MzIgX191
c2VyICpmcm9tKQogewotCXUzMiB2YWw7Ci0KLQlpZiAoY2FuX2RvX21hc2tlZF91c2VyX2FjY2Vz
cygpKQotCQlmcm9tID0gbWFza2VkX3VzZXJfYWNjZXNzX2JlZ2luKGZyb20pOwotCWVsc2UgaWYg
KCF1c2VyX3JlYWRfYWNjZXNzX2JlZ2luKGZyb20sIHNpemVvZigqZnJvbSkpKQotCQlyZXR1cm4g
LUVGQVVMVDsKLQl1bnNhZmVfZ2V0X3VzZXIodmFsLCBmcm9tLCBFZmF1bHQpOwotCXVzZXJfcmVh
ZF9hY2Nlc3NfZW5kKCk7Ci0JKmRlc3QgPSB2YWw7Ci0JcmV0dXJuIDA7Ci1FZmF1bHQ6Ci0JdXNl
cl9yZWFkX2FjY2Vzc19lbmQoKTsKLQlyZXR1cm4gLUVGQVVMVDsKKwlyZXR1cm4gZ2V0X3VzZXJf
bWFza2VkKCpkZXN0LCBmcm9tKSA/IDAgOiAtRUZBVUxUOwogfQogCiBzdGF0aWMgX19hbHdheXNf
aW5saW5lIGludCBmdXRleF9wdXRfdmFsdWUodTMyIHZhbCwgdTMyIF9fdXNlciAqdG8pCiB7Ci0J
aWYgKGNhbl9kb19tYXNrZWRfdXNlcl9hY2Nlc3MoKSkKLQkJdG8gPSBtYXNrZWRfdXNlcl9hY2Nl
c3NfYmVnaW4odG8pOwotCWVsc2UgaWYgKCF1c2VyX3dyaXRlX2FjY2Vzc19iZWdpbih0bywgc2l6
ZW9mKCp0bykpKQotCQlyZXR1cm4gLUVGQVVMVDsKLQl1bnNhZmVfcHV0X3VzZXIodmFsLCB0bywg
RWZhdWx0KTsKLQl1c2VyX3dyaXRlX2FjY2Vzc19lbmQoKTsKLQlyZXR1cm4gMDsKLUVmYXVsdDoK
LQl1c2VyX3dyaXRlX2FjY2Vzc19lbmQoKTsKLQlyZXR1cm4gLUVGQVVMVDsKKwlyZXR1cm4gcHV0
X3VzZXJfbWFza2VkKHZhbCwgdG8pID8gMCA6IC1FRkFVTFQ7CiB9CiAKIHN0YXRpYyBpbmxpbmUg
aW50IGZ1dGV4X2dldF92YWx1ZV9sb2NrZWQodTMyICpkZXN0LCB1MzIgX191c2VyICpmcm9tKQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
