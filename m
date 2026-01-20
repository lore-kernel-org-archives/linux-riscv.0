Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF29CA5FB0
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+/kRSDRf4/8bVTwWtcWXvCpQzj1tlC5Sw5WXUQQTSE=; b=bIcYpXKmBqhYQF
	uYdN3KqYpJwPhyjPy8mmHZkQIUdvUMj76SbVKsxRduEL2O5AnNPoJ8Z34EBsTdP/YSD2i2XOMxZkf
	9xe/q8JUrL6kFaV9zrfLhVzO7kXeq0KYAoTwoUlyPtkGJ/PxvmKnxpTk0jTe2s4VYiQsmxfFDyDj4
	g+lYJPj4RQCCWxhcwReje/DGZifS+cHSWhrEjLo74IUjHL8OdD7hzvKnNlE8EYgj+3kTQ30ed7tBD
	/JgbjpvxkUv16329KSIwS3Pq+mmDru2OY092DcUe4XBuX1Z+NyM99LloxXwvosl5SR5rvwtbbilwr
	YocXY95DNDCHQBiWXYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viErO-00000004CJk-1KhQ;
	Tue, 20 Jan 2026 16:45:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viErL-00000004CJE-25hp;
	Tue, 20 Jan 2026 16:45:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E55491476;
	Tue, 20 Jan 2026 08:45:30 -0800 (PST)
Received: from [10.1.39.200] (XHFQ2J9959.cambridge.arm.com [10.1.39.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 600763F694;
	Tue, 20 Jan 2026 08:45:33 -0800 (PST)
Message-ID: <c5922290-f01c-4c77-995a-9a0ef89053a1@arm.com>
Date: Tue, 20 Jan 2026 16:45:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Fix bugs and performance of kstack offset
 randomisation
Content-Language: en-GB
To: Dave Hansen <dave.hansen@intel.com>, Kees Cook <kees@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
 <20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
 <C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
 <785a7d90-babe-43af-93a6-c220c1877bcf@arm.com>
 <a8ca3483-d61a-41bd-9b1b-17a8f3ac03eb@intel.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a8ca3483-d61a-41bd-9b1b-17a8f3ac03eb@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_084539_573506_2B840F45 
X-CRM114-Status: GOOD (  13.33  )
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

T24gMjAvMDEvMjAyNiAxNjozNywgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4gT24gMS8yMC8yNiAwODoz
MiwgUnlhbiBSb2JlcnRzIHdyb3RlOgo+PiBJIGRvbid0IHRoaW5rIHRoaXMgcXVlc3Rpb24gd2Fz
IHJlYWxseSBhZGRyZXNzZWQgdG8gbWUsIGJ1dCBJJ2xsIGdpdmUgbXkgb3Bpbmlvbgo+PiBhbnl3
YXk7IEkgYWdyZWUgaXQncyBwcmV0dHkgYmluYXJ5IC0gaXQgd2lsbCBlaXRoZXIgd29yayBvciBp
dCB3aWxsIGV4cGxvZGUuCj4+IEkndmUgdGVzdGVkIG9uIGFybTY0IGFuZCB4ODZfNjQgc28gSSBo
YXZlIGhpZ2ggY29uZmlkZW5jZSB0aGF0IGl0IHdvcmtzLiBJZiB5b3UKPj4gZ2V0IGl0IGludG8g
LW5leHQgQVNBUCBpdCBoYXMgMyB3ZWVrcyB0byBzb2FrIGJlZm9yZSB0aGUgbWVyZ2Ugd2luZG93
IG9wZW5zCj4+IHJpZ2h0PyAoTGludXMgc2FpZCBoZSB3b3VsZCBkbyBhbiAtcmM4IHRoaXMgY3lj
bGUpLiBUaGF0IGZlZWxzIGxpa2UgZW5vdWdoIHRpbWUKPj4gdG8gbWUuIEJ1dCBpdCdzIHlvdXIg
dHJlZSDwn5iJCj4gCj4gRmlyc3Qgb2YgYWxsLCB0aGFuayB5b3UgZm9yIHRlc3RpbmcgaXQgb24g
eDg2ISBIYXZpbmcgdGhhdCBvbmUgZGF0YQo+IHBvaW50IHdoZXJlIGl0IGhlbHBlZCBwZXJmb3Jt
YW5jZSBpcyBzdXBlciB2YWx1YWJsZS4KPiAKPiBJJ20gbW9yZSB3b3JyaWVkIHRoYXQgaXQncyBn
b2luZyB0byByZWdyZXNzIHBlcmZvcm1hbmNlIHNvbWV3aGVyZSBhbmQKPiB0aGVuIGl0J3MgZ29p
bmcgdG8gYmUgYSBwYWluIHRvIGJhY2sgb3V0LiBJJ20gbm90IHN1cGVyIHdvcnJpZWQgYWJvdXQK
PiBmdW5jdGlvbmFsIHJlZ3Jlc3Npb25zLgoKRmFpciBlbm91Z2guIExldCdzIGdvIHNsb3cgdGhl
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
