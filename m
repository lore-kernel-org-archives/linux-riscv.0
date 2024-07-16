Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F68C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 14:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH4ktRsasxKzDiT5KjG1Ic/uYvNNoKYdZA5Lsd8Lcyw=; b=Q/oAHXc/EQQT57
	hKAINosSWWBwhS/7rutlHEXhjr4nTJMJb2GA4Grs7C4KdMgZbYklvW/8EM6vXN1C8YeoklqwRsiBF
	Hif5KLIGAx/xl06aHLJw4f948JbPD052yD5X875USOAOCKRw+sayM01vU7162S+t0hg0p0UpxsQeJ
	N3ge7SZ47rucB9AEZP8hTO6ED/KYJMW0NV3Z1V0fie0SZorROUof6n++pzLRAbsWkfIrY8ROGbxGg
	2tXhazLvZM6d9y86PXPovds/7cRmEnWpg6t4wtwZim+cR9ObIEHfnffricsywNpyIto0EXYbEz+n8
	m+V0azEWL2ax7ZwcaYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTijW-0000000Aczt-2Rk0;
	Tue, 16 Jul 2024 14:00:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTijU-0000000Acyx-0YQp
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 14:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C6FACE1320;
	Tue, 16 Jul 2024 14:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405FBC116B1;
	Tue, 16 Jul 2024 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721138441;
	bh=q6G0LaBTnMOqEYsABjZwsURGHz9QWdlHe+gyWVklxts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FuBb6prhshjfIeleU2KrheelYSh2TnxOI7dWe1G5Dd3y1F4w95HaNp1CjgnCeXkNW
	 OR9rOeHh6duuGkkJ5a9B5+hzU+Zcd1olvWoEkNfYz71Bws4g6DG4L8z7Aa5cenrALe
	 6D26r7/ySoliE5GFuI9+e63sLpiG32FtnKhiUAgadyy9kgEJBASbO6dTYH3hiBULVG
	 o01Fgg3qZspZLf72CjxlxGa/zXLNpsWmPMJ0jKY5R+4I3dpTGrFGl6nBJRy9Lqwuf2
	 ZfivNfieZL0KusjE55gOWZQ+MTgxa5TCybgmzgp02+S7nSMi5MozglZjRCUHjRgmJ8
	 BqzAaLW5GH6JQ==
Date: Tue, 16 Jul 2024 07:00:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
Message-ID: <20240716140038.GA3272205@thelio-3990X>
References: <20240626130347.520750-2-alexghiti@rivosinc.com>
 <202407041157.odTZAYZ6-lkp@intel.com>
 <20240705172750.GF987634@thelio-3990X>
 <CAHVXubhvk_CbBX=hWFGt+1HEM4cj=cAc1NsCEknn=B8UDcXVSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubhvk_CbBX=hWFGt+1HEM4cj=cAc1NsCEknn=B8UDcXVSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_070044_540690_0318C112 
X-CRM114-Status: GOOD (  19.49  )
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

T24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgMDI6MTk6NTdQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IE9uIEZyaSwgSnVsIDUsIDIwMjQgYXQgNzoyN+KAr1BNIE5hdGhhbiBDaGFuY2Vs
bG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBBbm90aGVyIGFsdGVybmF0aXZlIHdv
dWxkIGJlIHRvIHJlcXVpcmUgTExWTSAxNysgZm9yIFJJU0MtViwgd2hpY2ggbWF5Cj4gPiBub3Qg
YmUgdGhlIHdvcnN0IGFsdGVybmF0aXZlLCBzaW5jZSBJIHRoaW5rIG1vc3QgcGVvcGxlIGRvaW5n
IHNlcmlvdXMKPiA+IHdvcmsgd2l0aCBjbGFuZyB3aWxsIHByb2JhYmx5IGJlIGxpdmluZyBjbG9z
ZSB0byB0aXAgb2YgdHJlZSBhbnl3YXlzCj4gPiBiZWNhdXNlIG9mIGFsbCB0aGUgZXh0ZW5zaW9u
IHdvcmsgdGhhdCBnb2VzIG9uIHVwc3RyZWFtLgo+IAo+IFN0dXBpZCBxdWVzdGlvbiBidXQgd2h5
IHRoZSBmaXggaW4gbGx2bSAxNyB3YXMgbm90IGJhY2twb3J0ZWQgdG8KPiBwcmV2aW91cyB2ZXJz
aW9ucz8KClVuZm9ydHVuYXRlbHksIExMVk0gcmVsZWFzZXMgYXJlIG9ubHkgc3VwcG9ydGVkIGZv
ciBhIGZldyBtb250aHMgd2l0aApmaXhlcywgdW5saWtlIEdDQyB0aGF0IHN1cHBvcnRlZCB0aGVp
ciByZWxlYXNlcyBmb3IgYSBmZXcgeWVhcnMuIEJ5IHRoZQp0aW1lIHRoaXMgaXNzdWUgd2FzIHVu
Y292ZXJlZCBhbmQgcmVzb2x2ZWQgaW4gTExWTSBtYWluICgxNyBhdCB0aGUKdGltZSksIExMVk0g
MTYgd2FzIG5vIGxvbmdlciBzdXBwb3J0ZWQuCgpJIGNvdWxkIHBvdGVudGlhbGx5IHBhdGNoIHRo
ZSBrZXJuZWwub3JnIHRvb2xjaGFpbnMgYnV0IHRoYXQgZG9lc24ndCBmaXgKdGhlIGlzc3VlIGZv
ciBvdGhlciB2ZXJzaW9ucyBvZiBjbGFuZyBvdXQgdGhlcmUuCgo+IEFueXdheSwgSSdkIHJhdGhl
ciByZXF1aXJlIGxsdm0gMTcrIHRoYW4gYWRkIGEgYnVuY2ggb2YgcHJlcHJvY2Vzc29yCj4gZ3Vh
cmRzIGluIHRoaXMgZmlsZSAoSUlVQyB3aGF0IHlvdSBzYWlkIGFib3ZlKSBhcyBpdCBpcyBjb21w
bGV4Cj4gZW5vdWdoLgoKU3VyZSwgdGhpcyBpcyBub3QgYSBzdXBlciB1bnJlYXNvbmFibGUgaXNz
dWUgdG8gYnVtcCB0aGUgbWluaW11bQpzdXBwb3J0ZWQgdmVyc2lvbiBmb3IgUklTQy1WIG92ZXIg
aW4gbXkgb3Bpbmlvbiwgc28gbm8gcmVhbCBvYmplY3Rpb25zCmZyb20gbWUuCgo+IEBDb25vciBE
b29sZXkgQFBhbG1lciBEYWJiZWx0IFdEWVQ/IElzIHRoZXJlIGFueSBpbnRlcmVzdCBpbgo+IHN1
cHBvcnRpbmcgbGx2bSA8IDE3PyBXZSBtYXkgZW5jb3VudGVyIHRoaXMgYnVnIGFnYWluIGluIHRo
ZSBmdXR1cmUgc28KPiBJJ2QgYmUgaW4gZmF2b3Igb2YgbW92aW5nIHRvIGxsdm0gMTcrLgoKRldJ
VywgSSB3b3VsZCBlbnZpc2lvbiBhIGRpZmYgbGlrZSB0aGlzIChhc3N1bWluZyBpdCBhY3R1YWxs
eSB3b3JrcyB0bwpyZXNvbHZlIHRoaXMgaXNzdWUsIEkgZGlkbid0IGFjdHVhbGx5IHRlc3QgaXQp
OgoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvbWluLXRvb2wtdmVyc2lvbi5zaCBiL3NjcmlwdHMvbWlu
LXRvb2wtdmVyc2lvbi5zaAppbmRleCA5MWM5MTIwMTIxMmMuLmU4MWViN2VkMjU3ZCAxMDA3NTUK
LS0tIGEvc2NyaXB0cy9taW4tdG9vbC12ZXJzaW9uLnNoCisrKyBiL3NjcmlwdHMvbWluLXRvb2wt
dmVyc2lvbi5zaApAQCAtMjgsNiArMjgsOCBAQCBsbHZtKQogCQllY2hvIDE1LjAuMAogCWVsaWYg
WyAiJFNSQ0FSQ0giID0gbG9vbmdhcmNoIF07IHRoZW4KIAkJZWNobyAxOC4wLjAKKwllbGlmIFsg
IiRTUkNBUkNIIiA9IHJpc2N2IF07IHRoZW4KKwkJZWNobyAxNy4wLjAKIAllbHNlCiAJCWVjaG8g
MTMuMC4xCiAJZmkKCkNoZWVycywKTmF0aGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
