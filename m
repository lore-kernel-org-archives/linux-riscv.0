Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E57C98317
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SArS6e76q1vLSK0ObW2VJrpUKyX5F2Jf7kS1F4n/C84=; b=tIsiQgujzDsPBl
	maMdF0MSVUHVoBdQpiENAAXLoKRb/HuwECf6UE0TwwYQy4HOmTkayV+GmdiSjT73pJjy8PVUkzUtX
	sStY+6QlueH2jnW6w4CG+5ecsMxt5gyOrPE5SrNpb29eVlV812+UinuHFWMAg2QK1LRJesS5BVgz3
	P1Zs1agzo/C6xqAJEEs8S/6NsGMbGl2KaBrluUkwuE6Sp0qAbj790eNQ7FQKftrFIBJZ+isrtN+CE
	KL26hy4pq+MvDiOPIqHzvLpe3p94EgE7kTYae4THEbdPrwL+TQGBs7vygVSQYF9/z6csIEX9ZyPvr
	TKVi2VlnG9UHG9ywgZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9icM-0000000Az51-3oZC;
	Thu, 24 Sep 2026 12:32:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9icK-0000000Az4j-3DHs;
	Thu, 24 Sep 2026 12:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DxfLt02tiYB/R06QhwaMsYXhy8uIIvTYHfePzbadpUk=; b=oe6eEV9L0ABTn/zvoIR2PsVQQu
	UcLaZY+euSAapAY7xWSpD4DbTuafBJLciOWwFbdwbrp8r3bMpbiqsWzo24iVtggW7WyTD9AVaPp64
	quTRekhDozwO75STDvB4bWmtPjb0/I8lwXC1z3kZC6FhyPTQFgx3EFMO9W8hlwqlHDH8XUa/IC3nH
	2Ln+9CeAExxyQCV7mY1oAboHZ39320mizT2R/lX8i37Fe2YEGrZFi76Y64BCETbF3SByWXBwyNy5r
	TYmeoMpDH2q2b2NVBycS7ubZmH+c0hVhPfsvAoKT/YjXovycZ6E5Mk20ntUthn4yJ/Cpopx9vU9JX
	MW0cDdzA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9icI-0000000Fy2t-0Avx;
	Thu, 24 Sep 2026 12:31:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A49A152B;
	Thu, 24 Sep 2026 05:31:51 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2777F3F86C;
	Thu, 24 Sep 2026 05:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790253115; bh=tyroa8lBoOqLwHpTeRHuGpjV833qc9sQbRMa/D+dsoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lz309Dy3TlEu+7y1tHZCYfrdPqaWCgtZMoXnPf8tuQOM4LMWKCZ6sgCmYSkYsjvcs
	 tO7bMRWvAOIpOXYh7A+nfbCx25N76QAhUGvlajWZ3EFwvUyLVK0EAGgwuHLQJWAXUT
	 QV+kIw/8QJ9o4Wbe1n28zhddNcWmz6QOOLHombIo=
Date: Thu, 24 Sep 2026 13:31:42 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	jszhang@kernel.org, japo@linux.ibm.com, peterz@infradead.org,
	jpoimboe@kernel.org, seanjc@google.com, pmladek@suse.com,
	thuth@redhat.com, ynorov@nvidia.com, joelagnelf@nvidia.com,
	david@davidgow.net, fujita.tomonori@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arUYLsJJewE--wqo@J2N7QTR9R3>
References: <20260922054959.955093-2-mkchauras@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922054959.955093-2-mkchauras@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_133158_285030_7DE978FC 
X-CRM114-Status: GOOD (  10.54  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMTE6MjA6MDBBTSArMDUzMCwgTXVrZXNoIEt1bWFyIENo
YXVyYXNpeWEgKElCTSkgd3JvdGU6Cj4gVmVyaWZ5IHRoYXQgdGhlIF9fYnVnX3RhYmxlIGVudHJ5
IGVtaXR0ZWQgYnkgQVJDSF9XQVJOX0FTTSBoYXMgYSBjb3JyZWN0Cj4gYnVnX2FkZHIgZGlzcGxh
Y2VtZW50IOKAlCBpLmUuIHRoZSBhcmNoJ3MgdHJhcCBsYWJlbCByZWZlcmVuY2UgcmVzb2x2ZXMg
dG8KPiB0aGUgdHJhcCBpbnN0cnVjdGlvbiDigJQgYnkgY2FsbGluZyBmaW5kX2J1ZygpIHdpdGgg
dGhlIGV4YWN0IHZpcnR1YWwgYWRkcmVzcwo+IG9mIHRoZSB0cmFwLCBtaXJyb3Jpbmcgd2hhdCB0
aGUgcmVhbCB0cmFwIGhhbmRsZXIgZG9lcy4KPiAKPiBUbyBzdXBwb3J0IGFsbCBhcmNoaXRlY3R1
cmVzLCBlYWNoIGFyY2ggdGhhdCBpbXBsZW1lbnRzIEFSQ0hfV0FSTl9BU00gbm93Cj4gZGVmaW5l
cyBBUkNIX1dBUk5fQVNNX1RSQVBfTEFCRUwsIGEgc3RyaW5nIGNvbnN0YW50IG5hbWluZyB0aGUg
bG9jYWwgbGFiZWwKPiBhdCB3aGljaCB0aGUgdHJhcCBpbnN0cnVjdGlvbiBpcyBwbGFjZWQ6Cj4g
Cj4gICB4ODYgICAgICAgIjEiICAgICAodWQyIGF0IGxhYmVsIDE6KQo+ICAgcG93ZXJwYyAgICIx
IiAgICAgKHR3aSBhdCBsYWJlbCAxOikKPiAgIHJpc2N2ICAgICAiMSIgICAgIChlYnJlYWsgYXQg
bGFiZWwgMTopCj4gICBhcm02NCAgICAgIjE0NDcxIiAoYnJrIHBsYWNlZCBhdCAxNDQ3MTogYnkg
X19CVUdfRU5UUllfRU5EKQo+ICAgczM5MCAgICAgICIwIiAgICAgKG1jIGF0IGxhYmVsIDA6KQoK
SSdtIG5vdCBhIGZhbiBvZiBleHBvc2luZyBzdWNoIGEgbG93LWxldmVsIGltcGxlbWVudGF0aW9u
IGRldGFpbCBvdXQgb2YKdGhlIGFyY2hpdGVjdHVyZSBjb2RlLCBhbmQgSSBkb24ndCB0aGluayB3
ZSBzaG91bGQgZXhwb3NlIHRoaXMuCgpXaGF0IGV4YWN0bHkgYXJlIHlvdSB0cnlpbmcgdG8gdmVy
aWZ5IGhlcmUsIGFuZCB3aHk/IEhhcyB0aGVyZSBiZWVuCnNvbWUgX3NwZWNpZmljXyBpc3N1ZSBv
biBwb3dlcnBjIHRoYXQgY2F1c2VkIHlvdSB0byBsb29rIGF0IHRoaXM/CgpNYXJrLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
