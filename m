Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62009CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n32uM7QA/AHDQ1g+ULAZo4owjuSt8F7fPF93w5Dg7nc=; b=tn656Df5TMDWm9
	w/66ZtiYVMXEa3hZaIG1k5fVMXHrn0wahdn9e4GGpnoZ2120mktqpd0lAILzeoK0UmK3QBKbsD2zG
	8Zk9GpjgzLnsGFnQX2z9Y3QOKfAxlMBSJwJ5ZEQm4B9qU1DFl7kbGvab5VBqx9VvqcSF2uQaKIObT
	1s5Mp+V1+5mIIb+UAE4dhaFM7dUPIjreP3yBd90bF2bkoozDSCNxwDxvROPj6iZU8VocU4nX+m9bV
	LoEzmn0vHZdTpunJIrGtQFeIIqukDfeTB5QXgI+dLdUjvN/k9MvlFnNdHbZE+eP5M7KPgn9CDB5uk
	XogVXQMEHIKmCUS4vmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOza-00Gnyw-1I;
	Thu, 19 Oct 2023 09:06:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOzX-00GnxZ-0A
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 09:06:56 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32d8c2c6dfdso6918911f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 02:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697706413; x=1698311213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTzH6q/KHuyR0ZINbw+hcjZ5+0x6X/p2cjmFJ06sw1g=;
        b=1skzaZ+KyWBOapS3ouq6/Ru0+1DrVMVhfSKWpncbrqzionKCPATdmdsB/S+cram10Q
         2u1+1x5zOgBN7TWm/KdloA6ANS278ZW5UWLkq1oa2WuL0hgEBp6gMfv8CGUEff0jajEq
         6xoOH1n7ARIHBfieor+emwoPdyYP0CR5yFFRH7Z3Q6GTFFrN8w7QBvzUL1grOacZIBUI
         pSluvF37GQSrbqLgfVLJPPK4GZa/N+qXJ0tRApIHqQOM8c+11i7884K9ig2WtO5062lo
         kSFE53LWboJaPdbAan3HceBuecUWTlew494s/nWsvcmpu17ntQ/fOmaC8kAAEiLNC3qI
         96JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697706413; x=1698311213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTzH6q/KHuyR0ZINbw+hcjZ5+0x6X/p2cjmFJ06sw1g=;
        b=I+CdY88u+1+PJ245zqFRbbLB9/lTBT48NlHjFgsLuPCOYWlUx8pVq7wU2G+HLKn3ke
         e9i7lrzZz/LIVNAsanaP1yMwWDeSunVqBmKPcIVMEEJIGqc1OTsl34IzV0Cn+Ex2X+/T
         elwhMxYdCM+1kXZeBislHP2T6VfByRPiKUzuU7dj007eIfh0ztGTCnHrAS46wIURcfml
         IyRjEi4/S5XlaqtWNi+Kbf8XlpKCeiepfrY88ggZqEYXzZgX8GMKI81Qo93boNJL+qdI
         ybmUUC6ONzYq/RJclLRONAMSDCFSzphMapMHauCyl8HvY55NJazJMPlTjTJn6IPHGTBw
         CEuQ==
X-Gm-Message-State: AOJu0YwXnoqGVow02E/n64JZ2jBXsQ7kBMRSxbOKSwkIeXh+ETs5SD34
	HwSPw8otu/cn4cAz8ecF3x4SAN0FxUXLsXmoL0nU7g==
X-Google-Smtp-Source: AGHT+IHSkQS9qNtpAIEMi6sxLaFTkgi+j6Rf7WXRtDe59N4GEvIdt/PZ1MtRQGPplsiQPNtP0AvAANDdTsTJLGZENEE=
X-Received: by 2002:adf:db4b:0:b0:32d:b06c:80b5 with SMTP id
 f11-20020adfdb4b000000b0032db06c80b5mr1127928wrj.2.1697706413344; Thu, 19 Oct
 2023 02:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231002151031.110551-1-alexghiti@rivosinc.com>
 <20231002151031.110551-5-alexghiti@rivosinc.com> <20231012-envision-grooving-e6e0461099f1@spud>
 <20231012-exclusion-moaner-d26780f9eb00@spud> <20231013-19d487ddc6b6efd6d6f62f88@orel>
In-Reply-To: <20231013-19d487ddc6b6efd6d6f62f88@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 19 Oct 2023 11:06:42 +0200
Message-ID: <CAHVXubgZ12x5O4Uo404u8uL2qhrtdN5w-DQFvnBib3XhhtrK1Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] riscv: Suffix all page table entry pointers with 'p'
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_020655_317230_FC7FE542 
X-CRM114-Status: GOOD (  22.00  )
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

SGkgQ29ub3IsIE1hcmNvLCBBbmRyZXcsCgpPbiBGcmksIE9jdCAxMywgMjAyMyBhdCAxMTo1OOKA
r0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24g
VGh1LCBPY3QgMTIsIDIwMjMgYXQgMTI6MzU6MDBQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3Rl
Ogo+ID4gT24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMTI6MzM6MTVQTSArMDEwMCwgQ29ub3IgRG9v
bGV5IHdyb3RlOgo+ID4gPiBIZXkgQWxleCwKPiA+ID4KPiA+ID4gT24gTW9uLCBPY3QgMDIsIDIw
MjMgYXQgMDU6MTA6MzBQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gPiA+IFRo
YXQgbWFrZXMgaXQgbW9yZSBjbGVhciB3aGF0IHRoZSB1bmRlcmx5aW5nIHR5cGUgaXMsIG5vIGZ1
bmN0aW9uYWwKPiA+ID4gPiBjaGFuZ2VzIGludGVuZGVkLgo+ID4gPgo+ID4gPiBTY2FubmluZyB0
aHJvdWdoIHN0dWZmIG9uIHBhdGNod29yaywgdGhpcyByZWFsbHkgZG9lc24ndCBzZWVtIHdvcnRo
IHRoZQo+ID4gPiBjaHVybi4gSSB0aG91Z2h0IHRoaXMgc29ydCBvZiBIdW5nYXJpYW4gbm90YXRp
b24tZXNxdWUgc3R1ZmYgd2FzIGEKPiA+ID4gcmVsaWMgb2YgYSB0aW1lIGJlZm9yZSBJIGNvdWxk
IHJlYWQgJiBvdXIgZG9jcyBldmVuIGdvIGFzIGZhciBhcyB0bwo+ID4KPiA+IHMvZ28vd2VudC8s
IEkgc2VlIHRoZSBsYW5ndWFnZSBnb3QgY2hhbmdlZCBpbiBtb3JlIHJlY2VudCByZWxlYXNlcyBv
Zgo+ID4gdGhlIGtlcm5lbCEKPgo+IFRoZSBkb2N1bWVudGF0aW9uIHNlZW1zIHRvIHN0aWxsIGJl
IGFnYWluc3QgaXQsIGJ1dCwgZGVzcGl0ZSB0aGF0IGFuZAo+IHRoZSB0d28gdmVyeSB2YWxpZCBw
b2ludHMgcmFpc2VkIGJ5IE1hcmNvIChiYWNrcG9ydGluZyBhbmQgZ2l0LWJsYW1lKSwKPiBJIHRo
aW5rIHB0ZXAgaXMgc3BlY2lhbCBhbmQgSSdtIG1vc3RseSBpbiBmYXZvciBvZiB0aGlzIGNoYW5n
ZS4gV2UgbWF5Cj4gbm90IG5lZWQgdG8gcy9yIGV2ZXJ5IGluc3RhbmNlLCBidXQgY2VydGFpbmx5
IGZ1bmN0aW9ucyB3aGljaCBuZWVkIHRvCj4gcmVmZXIgdG8gYm90aCB0aGUgcHRlIGFuZCB0aGUg
cHRlcCByZXByZXNlbnRhdGlvbnMgb2YgZW50cmllcyBiZWNvbWVzCj4gbW9yZSBjbGVhciB3aGVu
IHVzaW5nIHRoZSAncCcgY29udmVudGlvbiAoYW5kIHRoZW4gaXQncyBuaWNlIHRvIGhhdmUKPiBw
dGVwIHVzZWQgZXZlcnl3aGVyZSBlbHNlIHRvbyBmb3IgY29uc2lzdGVuY3kuLi4pCj4KPiBBbnl3
YXksIGp1c3QgbXkgMiBjZW50cy4KCkkgc3RhcnRlZCBjaGFuZ2luZyB0aGF0IGluIG9uZSBmdW5j
dGlvbiBhbmQgYW5vdGhlciBvbmUsIGFuZCBhbm90aGVyCm9uZS4uLmV0YyB1cCB0byBldmVyeSBp
bnN0YW5jZS4gSSBzdGlsbCB0aGluayB0aGF0IGl0IG1ha2VzIHRoaW5ncwpjbGVhcmVyLCBidXQg
dGhhdCdzIHN1YmplY3RpdmUsIHlvdSByYWlzZWQgdmFsaWQgcG9pbnRzIGFuZCBJJ2QgcmVhbGx5
Cmxpa2UgdG8gc2VlIHRoaXMgbGFuZCBpbiA2Ljcgc28gSSdsbCByZXZlcnQgdGhpcyBwYXRjaCBh
bmQgc2VuZCBhIHYyLgoKVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrcywKCkFsZXgKCj4KPiBUaGFu
a3MsCj4gZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
