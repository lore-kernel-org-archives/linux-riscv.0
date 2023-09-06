Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAF8EB8FD6
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLlXwnPgRtrcU3HzaVoe4dfCUVu8s4qxrmk/X1v4yAY=; b=4jgvhWp0Ij8qpf
	mlX0ZT6Ksfz3ZhLSn20K10dwDkUjH3Xk+BVdUZRy1NvciNOFz12SP+NmY3TTjnIU0SKsMVLtSK7ew
	M+5O5MKxmQ2V2151Al8WqPltS+sMp8+4nF4RyVdN7CvFQkOZvftTvz3pzv3QXZzwn8/FLW6ro38Gw
	m9bW7uzs+IAJoFJhPYwXIMMUfrubmqNrlcMIwYfnbGLenY8DzWJzdu8joyo4RhLfOtS2YW0/8t46k
	7DlnXklVmQvA0Yp2EUfzGURc21580q0oNPeGITypDPAm5Y+udefGCLxY1r/Y22ZfPjqx093pocSjw
	klyVV5RAvBiREMFfO3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdt0V-00A8PV-2Y;
	Wed, 06 Sep 2023 13:55:47 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdt0S-00A8Ns-2j
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 13:55:46 +0000
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-792707f78b5so158868739f.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 06:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694008542; x=1694613342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbyDWxJfqMgWVcylxBXfX+Os4k5+YTlBDL7fHB3febM=;
        b=awBpZTXQj/8VgIrImmSUTwTt2RQ09WGEiVMvILCPTPGyuxKYrzf5jwxf0CqpmlC4ZK
         OHxrdSNaOGNSg5cDU176vaUrVDe79dRCBb7LUHti5drbvSHr5NAoPdkvYJkQ0m4sOscr
         xy78oqbJBUqY8O0G1ikuIcE3/Iy+vmY1o4H2BlHicgzqP5xvsps9onrfdUQGpgASHajn
         w3C+OZWYoHXHvEdd43hU5yereMKVf9xT/yKHvAr4KXXnwBbOPQAx9StJn9fMj++RLUB6
         06RHkrlZhQrTBys7PdDbAsXn2J7sExSqm6H6XZ4LRzzBE82d2wxvzE7ubdjc+k77r0ec
         K9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694008542; x=1694613342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbyDWxJfqMgWVcylxBXfX+Os4k5+YTlBDL7fHB3febM=;
        b=KDeKKukpu64bfHZJ7Q/U6AIYCydY+Y3Nag9d9IlFO5AvRUpO19natSx8YUcvZSJqJd
         1mLq+6h8luXUx17yazOUq/gG7cnmfEbK/P9P+ugLlv6fcpO0aJkLIVkaf+9SueauBV5n
         eXMEe87z8mH/AXz5tuaDjDevNV+cnN7bQx/aH+8+0gMzHWOJzuTqw5Y3/xip6ewPa/0f
         pGaTlwwphS9Xq/dUfoeHgU2SGn4EYvrwwrSRFwvSWsA3Jaf9XJSpnyiOj0IWKBqdNS/i
         srPFswCpSjIEBtDaQQVTwkcsQrrCsrNRoF8txg8mq7BEkphya7ncYKdNY37lIyjJu5qp
         A0LQ==
X-Gm-Message-State: AOJu0Yz7WX1J7g6Fb+wV5ryUHPYYVwBWWrex+9JA8c6Qqm1TxSvPuujA
	pTapPqbP2UGRGrflMPk9th3Suo13iTiV7SZ0FBN0AHQa6EA=
X-Google-Smtp-Source: AGHT+IEZ0jkfj5Uf6FsapgkFNw1rXiq5p1/+3jIz1mfjeACGaSCI2qPmHp4YWLahdQbag1gsTEFoO5T7XElRYHgHrNc=
X-Received: by 2002:a6b:d607:0:b0:794:d833:4a8a with SMTP id
 w7-20020a6bd607000000b00794d8334a8amr17885350ioa.0.1694008542041; Wed, 06 Sep
 2023 06:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com> <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
 <CAHVXubiENHt36LrcSBoNU0rAMQ8EoT6tde9M8vLP3Hw2nwMm8g@mail.gmail.com>
 <CA+V-a8vJJFCKy3pCL2Qp1NogL-K5s9moGDbv3tTvx+z1FeKarw@mail.gmail.com>
 <CAHVXubhLB9Pw51C1ed1Youp9k0qTJKrokUAqf=Xnr+m3BoN5=g@mail.gmail.com>
 <CA+V-a8s0i=VMSbMa6WvOiZpqe_idAhq4cZ0inSdCNy39-rQeAg@mail.gmail.com> <CAHVXubjgjAwMOi0J5zZJkuX8RKwgfKp-_=tVTLDvKN=tBBdxNQ@mail.gmail.com>
In-Reply-To: <CAHVXubjgjAwMOi0J5zZJkuX8RKwgfKp-_=tVTLDvKN=tBBdxNQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 Sep 2023 14:54:41 +0100
Message-ID: <CA+V-a8uxe=sT7oX4Dk4zppCbYzWdZgWt9Xh4m+pA2+3t8kfnjg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_065545_025950_F7EEDDB4 
X-CRM114-Status: GOOD (  38.02  )
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

SGkgQWxleGFuZHJlLAoKT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAxOjQz4oCvUE0gQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgU2VwIDYs
IDIwMjMgYXQgMjoyNOKAr1BNIExhZCwgUHJhYmhha2FyCj4gPHByYWJoYWthci5jc2VuZ2dAZ21h
aWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBbGV4YW5kcmUsCj4gPgo+ID4gT24gV2VkLCBTZXAg
NiwgMjAyMyBhdCAxOjE44oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAyOjA54oCvUE0g
TGFkLCBQcmFiaGFrYXIKPiA+ID4gPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+IEhpIEFsZXhhbmRyZSwKPiA+ID4gPgo+ID4gPiA+IE9uIFdlZCwgU2Vw
IDYsIDIwMjMgYXQgMTowMeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSGkgUHJhYmhha2FyLAo+ID4gPiA+ID4K
PiA+ID4gPiA+IE9uIFdlZCwgU2VwIDYsIDIwMjMgYXQgMTo0OeKAr1BNIExhZCwgUHJhYmhha2Fy
Cj4gPiA+ID4gPiA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBIaSBBbGV4YW5kcmUsCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIFR1
ZSwgQXVnIDEsIDIwMjMgYXQgOTo1OOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUaGlzIGZ1bmN0
aW9uIHVzZWQgdG8gc2ltcGx5IGZsdXNoIHRoZSB3aG9sZSB0bGIgb2YgYWxsIGhhcnRzLCBiZSBt
b3JlCj4gPiA+ID4gPiA+ID4gc3VidGlsZSBhbmQgdHJ5IHRvIG9ubHkgZmx1c2ggdGhlIHJhbmdl
Lgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhlIHByb2JsZW0gaXMgdGhhdCB3ZSBjYW4g
b25seSB1c2UgUEFHRV9TSVpFIGFzIHN0cmlkZSBzaW5jZSB3ZSBkb24ndCBrbm93Cj4gPiA+ID4g
PiA+ID4gdGhlIHNpemUgb2YgdGhlIHVuZGVybHlpbmcgbWFwcGluZyBhbmQgdGhlbiB0aGlzIGZ1
bmN0aW9uIHdpbGwgYmUgaW1wcm92ZWQKPiA+ID4gPiA+ID4gPiBvbmx5IGlmIHRoZSBzaXplIG9m
IHRoZSByZWdpb24gdG8gZmx1c2ggaXMgPCB0aHJlc2hvbGQgKiBQQUdFX1NJWkUuCj4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+Cj4gPiA+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25l
cyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+
ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDExICsrKysrLS0tLS0KPiA+
ID4gPiA+ID4gPiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAgIHwgMzQgKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gPiA+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDMxIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IEFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0Y2gsIEkgYW0gc2VlaW5nIG1vZHVsZSBsb2FkIGlz
c3VlcyBvbiBSWi9GaXZlCj4gPiA+ID4gPiA+IChjb21wbGV0ZSBsb2cgWzBdKS4gSSBhbSB0ZXN0
aW5nIGRlZmNvbmZpZyArIFsxXSAocnovZml2ZSByZWxhdGVkCj4gPiA+ID4gPiA+IGNvbmZpZ3Mp
Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBBbnkgcG9pbnRlcnMgb24gd2hhdCBjb3VsZCBiZSBh
biBpc3N1ZSBoZXJlPwo+ID4gPiA+ID4KPiA+ID4gPiA+IENhbiB5b3UgZ2l2ZSBtZSB0aGUgZXhh
Y3QgdmVyc2lvbiBvZiB0aGUga2VybmVsIHlvdSB1c2U/IFRoZSB0cmFwCj4gPiA+ID4gPiBhZGRy
ZXNzZXMgYXJlIHZtYWxsb2MgYWRkcmVzc2VzLCBhbmQgYSBmaXggZm9yIHRob3NlIGxhbmRlZCB2
ZXJ5IGxhdGUKPiA+ID4gPiA+IGluIHRoZSByZWxlYXNlIGN5Y2xlLgo+ID4gPiA+ID4KPiA+ID4g
PiBJIGFtIHVzaW5nIG5leHQtMjAyMzA5MDYsIEl2ZSBwdXNoZWQgYSBicmFuY2ggWzFdIGZvciB5
b3UgdG8gaGF2ZSBhIGxvb2suCj4gPiA+ID4KPiA+ID4gPiBbMF0gaHR0cHM6Ly9naXRodWIuY29t
L3ByYWJoYWthcmxhZC9saW51eC90cmVlL3J6Zml2ZS1kZWJ1Zwo+ID4gPgo+ID4gPiBHcmVhdCwg
dGhhbmtzLCBJIGhhZCB0byBnZXQgcmlkIG9mIHRoaXMgcG9zc2liaWxpdHkgOikKPiA+ID4KPiA+
ID4gQXMtaXMsIEkgaGF2ZSBubyBpZGVhLCBjYW4geW91IHRyeSB0byAiYmlzZWN0IiB0aGUgcHJv
YmxlbT8gSSBtZWFuCj4gPiA+IHdoaWNoIHBhdGNoIGluIHRoZSBzZXJpZXMgbGVhZHMgdG8gdGhv
c2UgdHJhcHM/Cj4gPiA+Cj4gPiBPb3BzIHNvcnJ5IGZvciBub3QgbWVudGlvbmluZyBlYXJsaWVy
LCB0aGlzIGlzIHRoZSBvZmZlbmRpbmcgcGF0Y2gKPiA+IHdoaWNoIGxlYWRzIHRvIHRoZSBpc3N1
ZXMgc2VlbiBvbiByei9maXZlLgo+Cj4gT2ssIHNvIGF0IGxlYXN0IEkgZm91bmQgdGhlIGZvbGxv
d2luZyBwcm9ibGVtLCBidXQgSSBkb24ndCBzZWUgaG93Cj4gdGhhdCBjb3VsZCBmaXggeW91ciBp
c3N1ZTogY2FuIHlvdSBnaXZlIGEgdHJ5IGFueXdheT8gSSBrZWVwIGxvb2tpbmcKPiBpbnRvIHRo
aXMsIHRoYW5rcwo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2Fy
Y2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IGluZGV4IGRmMmEwODM4YzNhMS4uYjU2OTJiYzZjNzZh
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ICsrKyBiL2FyY2gvcmlz
Y3YvbW0vdGxiZmx1c2guYwo+IEBAIC0yMzksNyArMjM5LDcgQEAgdm9pZCBmbHVzaF90bGJfcmFu
Z2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gdW5zaWduZWQgbG9uZyBzdGFydCwKPgo+
ICB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWdu
ZWQgbG9uZyBlbmQpCj4gIHsKPiAtICAgICAgIF9fZmx1c2hfdGxiX3JhbmdlKE5VTEwsIHN0YXJ0
LCBlbmQsIFBBR0VfU0laRSk7Cj4gKyAgICAgICBfX2ZsdXNoX3RsYl9yYW5nZShOVUxMLCBzdGFy
dCwgZW5kIC0gc3RhcnQsIFBBR0VfU0laRSk7Cj4gIH0KPgpJIGFtIGFibGUgdG8gcmVwcm9kdWNl
IHRoZSBpc3N1ZSB3aXRoIHRoZSBhYm92ZSBjaGFuZ2UgdG9vLgoKQ2hlZXJzLApQcmFiaGFrYXIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
