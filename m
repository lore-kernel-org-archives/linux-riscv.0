Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC836C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4NsQFPjviF0PgKKPiCLyQrILMfvS5WZ4XI4w4Uch5c=; b=e4wpXxkkL7ltVw
	nzqwkN2yh/1f1V4MQ98bvxNH/Npkno6F6HRgL3jcnoWWd2mLuMA2atPvQJtSSdBvXBVkjAf7HVs7i
	S1EYNOrn8kHrbofq3VQtz/IQwsldLrbv4tTN2gKil+8IrGRpxVnnc2HeX6mxwYanPfZWmoHuZvh2m
	zGa9MqksIQXRxCBXY0nRhBbyPKuXCjjAUH3hmnMm025DqYm3b9DTu75DzY2RVHZ3Pk12gSKuqIPli
	lc5u3zzdWxmdLoioYgMh5hnJps0tKhirnOaaXrA5VFNvKsP6Rzd2Z9B/16W6Gekv2xIga5KiYnSOH
	6/EtNEaU5D6BkOnl4N/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFXT-00000004JUV-2y8o;
	Thu, 02 Jul 2026 11:25:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFXS-00000004JUO-18uq
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 11:25:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40AD160103;
	Thu,  2 Jul 2026 11:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2817C1F00A3F;
	Thu,  2 Jul 2026 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782991501;
	bh=mOM3rzsLQ5zcU0KB7ppqvlisg4HQiYPTf14y3PbqPhs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=kLTmUhIzP0y8iCpVDm6+5t9nX8pnl/FL2IHkdX+LfPQlaEB6wVtL1kzoiWM3qgtdM
	 9lTWMsYU7FF6L2fLFenc6N5j8Ef5Fsck26DORNh2e1uC+hhJjt3XhPbzYodE5No+/4
	 tWeWtodTFyens21QxAEsxxmbVM/H/aptMqXN2OB3YO2ifHuNtRpMc59RFcP/OFJdrl
	 p/pPBwhqDVsZFrWWR0Y/4+EfsV6EJ/+t4oycLzrV5+G6c5l4TaSPPG0X2wti9LPib7
	 U22B6IjMFDRlMrSIOQnTd3sE3VScotvakJyHz80nD/AmM45TrVc/NRY1ZD3+rFexs+
	 OeLrJpr3ynMYA==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Andy
 Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andrew Donnellan
 <andrew+kernel@donnellan.id.au>, Mark Rutland <mark.rutland@arm.com>,
 Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Arnd Bergmann
 <arnd@arndb.de>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Ryan Roberts <ryan.roberts@arm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mukesh Kumar Chaurasiya
 <mkchauras@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Zong
 Li <zong.li@sifive.com>, Nam Cao <namcao@linutronix.de>, Deepak Gupta
 <debug@rivosinc.com>, Lukas Gerlach <lukas.gerlach@cispa.de>, Rui Qi
 <qirui.001@bytedance.com>, Kees Cook <kees@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [RFC] entry: Untangle the return value of
 syscall_enter_from_user_mode from syscall NR
In-Reply-To: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
Date: Thu, 02 Jul 2026 13:24:57 +0200
Message-ID: <878q7tprau.ffs@fw13>
MIME-Version: 1.0
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

T24gV2VkLCBKdWwgMDEgMjAyNiBhdCAxOTo0MiwgTWljaGFsIFN1Y2jDoW5layB3cm90ZToKPiBU
aGUgcmV0dXJuIHZhbHVlIG9mIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUgaXMgdXNlZCBi
b3RoIGZvciB0aGUKPiBhZGp1c3RlZCBzeXNjYWxsIG51bWJlciBhbmQgdGhlIGluZGljYXRvciB0
aGF0IGEgc3lzY2FsbCBzaG91bGQgYmUKPiBza2lwcGVkLgo+Cj4gQXMgc2VjY29tcCBjYW4gYmUg
aW52b2tlZCBvbiBhbnkgc3lzY2FsbCwgaW5jbHVkaW5nIGludmFsaWQgb25lcyB0aGlzCj4gc29t
ZXdoYXQgdW5kZXJtaW5lcyBzZWNjb21wLgo+Cj4gV2hpbGUgdGhlIHNlY2NvbXAgdmFyaWFudHMg
dGhhdCB0ZXJtaW5hdGUgdGhlIHByb2Nlc3MgZG8gbm90IG5lZWQgdG8KPiBjYXJlIGFib3V0IHRo
aXMgZm9yIHRoZSBmaWx0ZXIgdGhhdCBzZXRzIHRoZSBzeXNjYWxsIHJldHVybiB2YWx1ZSB0aGlz
Cj4gZGlzY3RpbmN0aW9uIGlzIHJlcXVpcmVkLgoKWW91IGNvbXBsZXRlbHkgZmFpbCB0byBleHBs
YWluIHdoeSBhbmQgd2hhdCBhY3R1YWwgcHJvYmxlbSB5b3UgYXJlCnRyeWluZyB0byBzb2x2ZS4g
QXQgbGVhc3QgSSBjYW4ndCBmaWd1cmUgaXQgb3V0IGZyb20gdGhlIGFib3ZlIHdvcmQKc2FsYWQu
Cgo+IFBhc3MgdGhlIHN5c2NhbGwgbnVtYmVyIGFzIGEgcG9pbnRlciB0byB0aGUgaW5saW5lIGVu
dHJ5IGZ1bmN0aW9ucywgYW5kCj4gdXNlIHRoZSByZXR1cm4gdmFsdWUgZXhjbHVzaXZlbHkgZm9y
IHRoZSBpbmRpY2F0aW9uIHRoYXQgdGhlIHN5c2NhbGwgaXMKPiBhbHJlYWR5IGhhbmRsZWQuCj4K
PiBUaGlzIHNob3VsZCBhdm9pZCB0aGUgbmVlZCBmb3IgdGhlIHMzOTAgUElGX1NZU0NBTExfUkVU
X1NFVCB3aGljaCBpcyB0aGUKPiB3b3JrYXJvdW5kIGZvciBleGFjdGx5IHRoaXMgZGVmaWNpZW5j
eS4KPgo+IElmIHRoaXMgaXMgZGVzaXJhYmxlIHRoZSBwYXRjaCBjb3VsZCBiZSBzcGxpdCBpbnRv
IHNvbWUgc2VyaWVzIHRoYXQKPiBhZGp1c3RzIHRoZSBjb2RlIGZsb3cgd2hlcmUgbmVlZGVkIHNv
IHRoYXQgdGhlIGZpbmFsIGNoYW5nZSBpcyBtb3N0bHkKPiBtZWNoYW5pY2FsLgoKVGhhdCdzIG5v
dCBhIG1hdHRlciBvZiBkZXNpcmUuIFRoYXQncyBtYW5kYXRvcnkuCgo+IC0JaW5zdHJ1bWVudGF0
aW9uX2JlZ2luKCk7Cj4gLQlpZiAoIWludm9rZV9zeXNjYWxsKHJlZ3MsIG5yKSAmJiBuciAhPSAt
MSkKPiAtCSAJcmVzdWx0X3JlZyhyZWdzKSA9IF9fc3lzX25pX3N5c2NhbGwocmVncyk7Cj4gLQlp
bnN0cnVtZW50YXRpb25fZW5kKCk7Cj4gKwkvKiBTa2lwIHN5c2NhbGwgd2hlbiAtMSBpcyByZXR1
cm5lZCAqLwo+ICsJaWYgKCFzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsICZucikp
IHsKClNlcmlvdXNseT8KCklmIHdlIGdvIGFuZCBzZXBhcmF0ZSB0aGUgc3lzY2FsbCBudW1iZXIg
ZnJvbSB0aGUgcmV0dXJuIHZhbHVlLCB0aGVuIHRoZQpyZXR1cm4gdmFsdWUgMCBtZWFucyBzdWNj
ZXNzIGFuZCBhbnl0aGluZyBlbHNlIGZhaWwuIFdoaWNoIGluIG90aGVyCndvcmRzIGlzIGEgYm9v
bGVhbi4gU28gaW5zdGVhZCBvZiB0YXN0ZWxlc3NseSBhZGRpbmcgYSBjb21wbGV0ZWx5Cm5vbnNl
bnNpY2FsIGNvbW1lbnQgYWJvdXQgLTEgaGVyZSwgc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9k
ZSgpIHdhbnRzCnRvIGhhdmUgdGhlIHJldHVybiB2YWx1ZSB0eXBlIGJvb2wgd2l0aCBhIHByb3Bl
ciBib29sZWFuIGxvZ2ljOiB0cnVlID0Kc3VjY2VzcywgZmFsc2UgPSBhYm9ydC4KCj4gQEAgLTE2
OCw4ICsxNjgsNyBAQCBfX3Zpc2libGUgbm9pbnN0ciB2b2lkIGRvX2ludDgwX2VtdWxhdGlvbihz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgCW5yID0gc3lzY2FsbF8zMl9lbnRlcihyZWdzKTsKPiAg
Cj4gIAlsb2NhbF9pcnFfZW5hYmxlKCk7Cj4gLQluciA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2Vy
X21vZGVfd29yayhyZWdzLCBucik7Cj4gLQlkb19zeXNjYWxsXzMyX2lycXNfb24ocmVncywgbnIp
Owo+ICsJc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZV93b3JrKHJlZ3MsICZucik7CgpIb3cg
ZXhhY3RseSBpcyB0aGlzIGV2ZXIgZ29pbmcgdG8gaW52b2tlIGEgdmFsaWQgc3lzY2FsbD8KCj4g
KwlpZiAoIXN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGVfd29yayhyZWdzLCAmbnIpKSB7Cj4g
KwkJbnIgJj0gR0VOTUFTSygzMSwgMCk7Cj4gKwkJZG9fc3lzY2FsbF8zMl9pcnFzX29uKHJlZ3Ms
IG5yKTsKCiAgZG9fc3lzY2FsbF8zMl9pcnFzX29uKHJlZ3MsIChpbnQpbnIpOwoKd291bGQgYmUg
dG9vIHNpbXBsZSwgcmlnaHQ/CgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
