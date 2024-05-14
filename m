Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D972C25B79
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 18:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2s9VpQag4JbpyPVXUu2IhB43Xd+UyvM0Fo8om7QwJsk=; b=rZn8c7vSYCl/L1
	KQzsJp6xMjdCB9O6803Vdy/NtMXqD/yQdqgLZ0JTIKWC6s4MQFyZHsrEo0PNXVH6FmFA+bi1n8LOo
	2BNSsNTXvYDnMG9OsU+LX01W3HhXskIJtypOnR7r9S1d6hjo89iCns0KwFQuFgzBd7E6XsPNwyzqB
	ZswkWfpgKrqui3RCQlX5FlbB0YztZRJLhnuMxpk0O3lVT91u4s6C0kM9VA6s/nO//KfG13c7f5N4+
	0M0BBlUgTJvBQBJYFgcPpSM8xJ0N82anpPSk2TJbm1g0dXl12Pq70HgZoFCpMvQzFFXbTZaTHuSSS
	VSzYZvhaLm2zHt8ja2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wiM-0000000GnpU-1Fnn;
	Tue, 14 May 2024 18:17:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wi7-0000000Gndb-09si
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 18:17:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46ACF6130A;
	Tue, 14 May 2024 18:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144BBC32782;
	Tue, 14 May 2024 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715710630;
	bh=uzmplbv5D7iNpVC5UJ5KWf/1DYXGoJz78n4vD8h3RCI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u38RF5v7U/Hj9CZLp1QiPYeERCnEJgoh07ZTr+NKJv4kYr6gTe+D0EMu11P6CY8WM
	 /VfOglY7oR6cehdaIV8d5RfRqP3YkvRPS6ZuFytkN9ntM2JD3fnW9WVcVZX+YPfn1s
	 V1JJgAkfMSmbtlqYqWLmuCpUHKlabxHwkmygy68bRl7MFYxLgZpGDfOSgKNIgHLLS6
	 mJphqO0rTj088VEgKiFLU+djfgj7UyrKYsvnbKp7uj9Pp5HYfONWTVRtwLk6i+/rs7
	 AKsfNR1dGyB4iibT2WBW09lq69oEBj3rFdo/HNilveyC2k1vfSie5VIQtaj4urzRoD
	 5YC3msP+vLJjQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2 6/8] riscv: Enable memory hotplugging for RISC-V
In-Reply-To: <CAHVXubi6Hv_FCTi=a5FFoxqiUBucrX_NhVGBAWE6qXRXdzOYsA@mail.gmail.com>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-7-bjorn@kernel.org>
 <CAHVXubi6Hv_FCTi=a5FFoxqiUBucrX_NhVGBAWE6qXRXdzOYsA@mail.gmail.com>
Date: Tue, 14 May 2024 20:17:05 +0200
Message-ID: <87r0e4l0m6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_111711_181152_A49104D2 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IE9uIFR1
ZSwgTWF5IDE0LCAyMDI0IGF0IDQ6MDXigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwu
b3JnPiB3cm90ZToKPj4KPj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
Pgo+Pgo+PiBFbmFibGUgQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFBMVUcgYW5kIEFSQ0hfRU5BQkxF
X01FTU9SWV9IT1RSRU1PVkUgZm9yCj4+IFJJU0MtVi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvS2Nv
bmZpZyB8IDIgKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBpbmRl
eCA2YmVjMWJjZTY1ODYuLmI5Mzk4YjY0YmI2OSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9L
Y29uZmlnCj4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBAQCAtMTYsNiArMTYsOCBAQCBj
b25maWcgUklTQ1YKPj4gICAgICAgICBzZWxlY3QgQUNQSV9SRURVQ0VEX0hBUkRXQVJFX09OTFkg
aWYgQUNQSQo+PiAgICAgICAgIHNlbGVjdCBBUkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5UCj4+ICAg
ICAgICAgc2VsZWN0IEFSQ0hfRU5BQkxFX0hVR0VQQUdFX01JR1JBVElPTiBpZiBIVUdFVExCX1BB
R0UgJiYgTUlHUkFUSU9OCj4+ICsgICAgICAgc2VsZWN0IEFSQ0hfRU5BQkxFX01FTU9SWV9IT1RQ
TFVHIGlmIFNQQVJTRU1FTSAmJiA2NEJJVCAmJiBNTVUKPgo+IEkgdGhpbmsgdGhpcyBzaG91bGQg
YmUgU1BBUlNFTUVNX1ZNRU1NQVAgaGVyZS4KCkhtbSwgY2FyZSB0byBlbGFib3JhdGU/IEkgdGhv
dWdodCB0aGF0IHdhcyBvcHRpb25hbC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
