Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B13EB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lzeb1aYXc6eJsxzR4Ho2estN8f5lZFAhHsTTp6smWg4=; b=xSEYCxgTx7J4yY
	O97pXqPB0NJqfBJ0KGs+4CqLHYX2hP2chH3knSWGG8TxCd01kHwl7EO2cDWjaScoKglzYaaV/NkmD
	yvE37D3/JJ5krfHudWs5j6EAaIAsKFPiei0i7a0f6+NRm9wYNxVMmZFvR9dxALTqTI8gkrZ7LE94t
	Ivy2bOfLHmH9LSEIVQCRdIGl4kMZuy/KGObHEZ8P9/ONUolYrrvFkIETe5NAV5fDgH0jkOYv8m4iU
	/M8bGDEPDJMXccKb5ZNDvMKLa33XM8/YvByeVKDZnzOPTB0qKp6bN/pORHjPhxrnrOCJEQ0tUZZ0i
	DVIHKiyNcedAOviZOoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrLz-009Csa-1l;
	Wed, 06 Sep 2023 12:09:51 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrLw-009CpH-2h
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 12:09:50 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-79564282cb1so137079839f.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 05:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694002187; x=1694606987; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Va2nW+Usqp8ZrfnRefu/KyBtk1DZM9iZcObEbx3C5o=;
        b=SINcJa+ga0y0LKvGfiugvzvQ090WIPPiXbYWPJ4iivV8sYwz41/YatErlJGXvZpugH
         zh7PF1nwm09SWQmjrN04TuZr+fsndU1xoLYIfBfAb4BCGSvDYi0uSNjUnVQPKrE+MX1f
         z73nKOnZLKooim9MDNFYq/jJ/KVFyuwqIKV8awoMAUl6GBxrjkdd0KqU3eZ0cdfgIUih
         xN/W1294m5DtAx7Fx8jX0JO/PlicV5slbnw81l9JTy27kcAZ02PmvKSUGKBL+dyigT8r
         ETbv3GlRsy36LcB3GZEldnyxJIWesFo9a5ZdAbbW0QXAoYhfh5bYrGQlQyBATxVBV+pL
         pgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694002187; x=1694606987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Va2nW+Usqp8ZrfnRefu/KyBtk1DZM9iZcObEbx3C5o=;
        b=M2BJ3zDN7MHHBJcCFS5IFPr0NiK7MoL0rK5Wkz1h2CDdVfS1yywpiwHqVk8wCOGDAS
         C+Vi984rRyAEIh1aQGG8nkhHw7FE1/EF5Yvxn9D9xqi64e1EtOL7lMNVQqb0n9r+0FEH
         aH7H+9eufKV//whkhrF49WK/Q8VsR4pBW3Tp8coo6AhwhbMjeRDmrKjoJ2UTSexYtsHH
         ZAW6g6zB5632pedvkrN3YsakwCXQjCueibCAGFi3hGkjFsWBO8mqUpnXY+mSM0HqG0Rk
         1uLZivtwViMJuhTs8570f6tOop5lQb4JDnOb6EsvWQJMZ0MmuUGBkwxdqzcB3OCYKZdg
         i1vw==
X-Gm-Message-State: AOJu0YyghL0QuhKOUVJd5PHgMBaFJIe1jFH1Kx/lTcMTa/4Gk45hVzRY
	p9rQZnb9uh1+LDbAmbw2aaRjWvjvkcV+ZWWTx5w=
X-Google-Smtp-Source: AGHT+IGWtERQu1uvVBVvppCTlAc4PSePNP4mqkpS/y84Zw6WXafaYObIR3DZxO29+98HddvyRnwByAxFYYmURZplQcI=
X-Received: by 2002:a5e:9e41:0:b0:792:9ace:f7ba with SMTP id
 j1-20020a5e9e41000000b007929acef7bamr14897870ioq.11.1694002186899; Wed, 06
 Sep 2023 05:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com> <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
 <CAHVXubiENHt36LrcSBoNU0rAMQ8EoT6tde9M8vLP3Hw2nwMm8g@mail.gmail.com>
In-Reply-To: <CAHVXubiENHt36LrcSBoNU0rAMQ8EoT6tde9M8vLP3Hw2nwMm8g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 Sep 2023 13:08:46 +0100
Message-ID: <CA+V-a8vJJFCKy3pCL2Qp1NogL-K5s9moGDbv3tTvx+z1FeKarw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230906_050948_877595_8540496B 
X-CRM114-Status: GOOD (  24.16  )
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

SGkgQWxleGFuZHJlLAoKT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAxOjAx4oCvUE0gQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IEhpIFByYWJoYWthciwK
Pgo+IE9uIFdlZCwgU2VwIDYsIDIwMjMgYXQgMTo0OeKAr1BNIExhZCwgUHJhYmhha2FyCj4gPHBy
YWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBbGV4YW5kcmUsCj4g
Pgo+ID4gT24gVHVlLCBBdWcgMSwgMjAyMyBhdCA5OjU44oCvQU0gQWxleGFuZHJlIEdoaXRpIDxh
bGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBmdW5jdGlvbiB1
c2VkIHRvIHNpbXBseSBmbHVzaCB0aGUgd2hvbGUgdGxiIG9mIGFsbCBoYXJ0cywgYmUgbW9yZQo+
ID4gPiBzdWJ0aWxlIGFuZCB0cnkgdG8gb25seSBmbHVzaCB0aGUgcmFuZ2UuCj4gPiA+Cj4gPiA+
IFRoZSBwcm9ibGVtIGlzIHRoYXQgd2UgY2FuIG9ubHkgdXNlIFBBR0VfU0laRSBhcyBzdHJpZGUg
c2luY2Ugd2UgZG9uJ3Qga25vdwo+ID4gPiB0aGUgc2l6ZSBvZiB0aGUgdW5kZXJseWluZyBtYXBw
aW5nIGFuZCB0aGVuIHRoaXMgZnVuY3Rpb24gd2lsbCBiZSBpbXByb3ZlZAo+ID4gPiBvbmx5IGlm
IHRoZSBzaXplIG9mIHRoZSByZWdpb24gdG8gZmx1c2ggaXMgPCB0aHJlc2hvbGQgKiBQQUdFX1NJ
WkUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90
bGJmbHVzaC5oIHwgMTEgKysrKystLS0tLQo+ID4gPiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5j
ICAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+
IEFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0Y2gsIEkgYW0gc2VlaW5nIG1vZHVsZSBsb2FkIGlzc3Vl
cyBvbiBSWi9GaXZlCj4gPiAoY29tcGxldGUgbG9nIFswXSkuIEkgYW0gdGVzdGluZyBkZWZjb25m
aWcgKyBbMV0gKHJ6L2ZpdmUgcmVsYXRlZAo+ID4gY29uZmlncykuCj4gPgo+ID4gQW55IHBvaW50
ZXJzIG9uIHdoYXQgY291bGQgYmUgYW4gaXNzdWUgaGVyZT8KPgo+IENhbiB5b3UgZ2l2ZSBtZSB0
aGUgZXhhY3QgdmVyc2lvbiBvZiB0aGUga2VybmVsIHlvdSB1c2U/IFRoZSB0cmFwCj4gYWRkcmVz
c2VzIGFyZSB2bWFsbG9jIGFkZHJlc3NlcywgYW5kIGEgZml4IGZvciB0aG9zZSBsYW5kZWQgdmVy
eSBsYXRlCj4gaW4gdGhlIHJlbGVhc2UgY3ljbGUuCj4KSSBhbSB1c2luZyBuZXh0LTIwMjMwOTA2
LCBJdmUgcHVzaGVkIGEgYnJhbmNoIFsxXSBmb3IgeW91IHRvIGhhdmUgYSBsb29rLgoKWzBdIGh0
dHBzOi8vZ2l0aHViLmNvbS9wcmFiaGFrYXJsYWQvbGludXgvdHJlZS9yemZpdmUtZGVidWcKCkNo
ZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
