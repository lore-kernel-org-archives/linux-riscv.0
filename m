Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E32EC001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 20:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5PA0DbzDPUO50H4XM2lz/90vSj2s9WlbQzQ/g/45qA=; b=BYoikxOYEsOF5G
	iwo6M6rxMcmbB1X1dFclLGZopGCfov8w5vPOCJMPTMZgtA8XJL5dn43qtuuPCWjQTgWx03Dx6LOh+
	dSzDd3Mu8ltdt7QLN6kPDfGDcrZtddMUHmSuV0pPsYL+ojn9s3Qe9ydjf29uaj814j89cGFxldyPa
	sKHIaOLxZ2QiOnKcrc7tS/SslCUNnKiBtdPjcKeMhaJxfYMPdiC3cmFEdlS7PR7mwnGZokGO3WNEs
	kzpvxnf4zoHMFX6PeGhyPsA7nuzYtafIo+X7jGceCkYgKsLkwXTTN2ebleO8BZ3bvFFlm/SmTKU2m
	jeKy2I7+EznRd1/tyuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK2g2-004IDT-0V;
	Thu, 13 Jul 2023 20:12:38 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK2fz-004IBg-2L
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 20:12:36 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-c5f98fc4237so988573276.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 13:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689279150; x=1691871150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJH06eQc+B3mlka9ca3yWe/BFaVZyKNH/FYbTdupon0=;
        b=sq8DoIAkiJTqj/hA0HbPY+Du/lUKvsOypg9bWyJovvwhPvhZLs9OnAATt6DyWj3fhk
         rMqRmV+ckvKtX3mqEovL47UsfIWG+DISWqHsS1jzloQgfd80YPjUGEY2gPScLUzXv3aj
         bEKoTztrMYpGlhl7OU1cNI+EkY48vwK5Af5vcxbKGaAcx3oeCKF43vTk9dp0Os+ehnOh
         4Vot+I5Pq1W7h0Qif76nH99c7qDXBLn72YuUgO10h1+BnKw70/5dvPpRQiXxmJnABb9F
         k/FYmn1X8GMw43PAkTPuZbREEdx6SXIktOvGYFRyjOtq0ls4Ne1B0u4C5shdFL81lA90
         k6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689279150; x=1691871150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJH06eQc+B3mlka9ca3yWe/BFaVZyKNH/FYbTdupon0=;
        b=llawoowMlmLXbZpkEiRvDFH5EJ/bWG2of3JGewoA8dE2qFQhADQlBk3XxC2Mm+CLzl
         zjhjtM4Bwe6lfOkb3OQrT43Ytdt/MeuJSR99SoApursfvm1CIiUQ8IARcBB5wCKEK1+Y
         sYU6+afgDzu/UAIbVituDIX0c1mLCNcYaeY8w+dNeg1UkAC1ZMphMP3gEVzV0a+EbxNt
         gGUtCZem4qZWjIUBssFm1/NsQ9dfVseDmxAVa+elo3ZyawbKMZjeWDD7piOdM9/kKSs3
         O0JiHBKB3H02uTaGzQRlXNqiJiMsvwcwsFn7qBEbZhSdLYvxX7CpUu5OWaz4/448wbgb
         TuOA==
X-Gm-Message-State: ABy/qLaNXURgHzNYb6XaF4yvgkBWszz2IdrI8uAeGE8HgkppvufMsOBC
	pINqkN8Qeus0Si6dIlW6NvWDXQxH5ckq8xBojmMkXA==
X-Google-Smtp-Source: APBJJlHsBJjb/bCQUIDnbMcslY/+BRvpuOtfSJIDEY65ZXVL8Q9oqboC4ArbmfQevCrjLrPcX1Bsga2B7wxkVG3h+b4=
X-Received: by 2002:a25:317:0:b0:c67:d3cd:6989 with SMTP id
 23-20020a250317000000b00c67d3cd6989mr2431008ybd.21.1689279150076; Thu, 13 Jul
 2023 13:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
 <20230713095339.189715-2-wangkefeng.wang@huawei.com> <ZLAjFQGgcjt4ykS7@casper.infradead.org>
In-Reply-To: <ZLAjFQGgcjt4ykS7@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 13 Jul 2023 13:12:15 -0700
Message-ID: <CAJuCfpGBaAJof=5-Xh1saoN9dhOauMiHBZzb0crVNn9OyOeZHw@mail.gmail.com>
Subject: Re: [PATCH rfc -next 01/10] mm: add a generic VMA lock-based page
 fault handler
To: Matthew Wilcox <willy@infradead.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_131235_766156_CD87CF23 
X-CRM114-Status: GOOD (  21.13  )
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

T24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgOToxNeKAr0FNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+ID4gK2ludCB0cnlfdm1hX2xvY2tlZF9wYWdlX2ZhdWx0
KHN0cnVjdCB2bV9sb2NrZWRfZmF1bHQgKnZtbGYsIHZtX2ZhdWx0X3QgKnJldCkKPiA+ICt7Cj4g
PiArICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKPiA+ICsgICAgIHZtX2ZhdWx0X3Qg
ZmF1bHQ7Cj4KPgo+IE9uIFRodSwgSnVsIDEzLCAyMDIzIGF0IDA1OjUzOjI5UE0gKzA4MDAsIEtl
ZmVuZyBXYW5nIHdyb3RlOgo+ID4gKyNkZWZpbmUgVk1fTE9DS0VEX0ZBVUxUX0lOSVQoX25hbWUs
IF9tbSwgX2FkZHJlc3MsIF9mYXVsdF9mbGFncywgX3ZtX2ZsYWdzLCBfcmVncywgX2ZhdWx0X2Nv
ZGUpIFwKPiA+ICsgICAgIF9uYW1lLm1tICAgICAgICAgICAgICAgID0gX21tOyAgICAgICAgICAg
ICAgICAgIFwKPiA+ICsgICAgIF9uYW1lLmFkZHJlc3MgICAgICAgICAgID0gX2FkZHJlc3M7ICAg
ICAgICAgICAgIFwKPiA+ICsgICAgIF9uYW1lLmZhdWx0X2ZsYWdzICAgICAgID0gX2ZhdWx0X2Zs
YWdzOyAgICAgICAgIFwKPiA+ICsgICAgIF9uYW1lLnZtX2ZsYWdzICAgICAgICAgID0gX3ZtX2Zs
YWdzOyAgICAgICAgICAgIFwKPiA+ICsgICAgIF9uYW1lLnJlZ3MgICAgICAgICAgICAgID0gX3Jl
Z3M7ICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIF9uYW1lLmZhdWx0X2NvZGUgICAgICAgID0g
X2ZhdWx0X2NvZGUKPgo+IE1vcmUgY29uc29saWRhdGVkIGNvZGUgaXMgYSBnb29kIGlkZWE7IG5v
IHF1ZXN0aW9uLiAgQnV0IEkgZG9uJ3QgdGhpbmsKPiB0aGlzIGlzIHRoZSByaWdodCB3YXkgdG8g
ZG8gaXQuCj4KPiA+ICtpbnQgX193ZWFrIGFyY2hfdm1hX2NoZWNrX2FjY2VzcyhzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3Qgdm1fbG9ja2VkX2ZhdWx0ICp2bWxmKTsKPgo+IFRoaXMgc2hvdWxkIGJlOgo+Cj4gI2lmbmRl
ZiB2bWFfY2hlY2tfYWNjZXNzCj4gYm9vbCB2bWFfY2hlY2tfYWNjZXNzKHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hLCApCj4gewo+ICAgICAgICAgcmV0dXJuICh2bWEtPnZtX2ZsYWdzICYgdm1f
ZmxhZ3MpID09IDA7Cj4gfQo+ICNlbmRpZgo+Cj4gYW5kIHRoZW4gYXJjaGVzIHdoaWNoIHdhbnQg
dG8gZG8gc29tZXRoaW5nIGRpZmZlcmVudCBjYW4ganVzdCBkZWZpbmUKPiB2bWFfY2hlY2tfYWNj
ZXNzLgo+Cj4gPiAraW50IHRyeV92bWFfbG9ja2VkX3BhZ2VfZmF1bHQoc3RydWN0IHZtX2xvY2tl
ZF9mYXVsdCAqdm1sZiwgdm1fZmF1bHRfdCAqcmV0KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hOwo+ID4gKyAgICAgdm1fZmF1bHRfdCBmYXVsdDsKPgo+IERlY2xh
cmluZyB0aGUgdm1mIGluIHRoaXMgZnVuY3Rpb24gYW5kIHRoZW4gY29weWluZyBpdCBiYWNrIGlz
IGp1c3Qgd3JvbmcuCj4gV2UgbmVlZCB0byBkZWNsYXJlIHZtX2ZhdWx0X3QgZWFybGllciAoaW4g
dGhlIGFyY2ggZmF1bHQgaGFuZGxlcikgYW5kCj4gcGFzcyBpdCBpbi4KCkRpZCB5b3UgbWVhbiB0
byBzYXkgIndlIG5lZWQgdG8gZGVjbGFyZSB2bWYgKHN0cnVjdCB2bV9mYXVsdCkgZWFybGllcgoo
aW4gdGhlIGFyY2ggZmF1bHQgaGFuZGxlcikgYW5kIHBhc3MgaXQgaW4uIiA/Cgo+ICBJIGRvbid0
IHRoaW5rIHRoYXQgY3JlYXRpbmcgc3RydWN0IHZtX2xvY2tlZF9mYXVsdCBpcyB0aGUKPiByaWdo
dCBpZGVhIGVpdGhlci4KPgo+ID4gKyAgICAgaWYgKCEodm1sZi0+ZmF1bHRfZmxhZ3MgJiBGQVVM
VF9GTEFHX1VTRVIpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsKPiA+
ICsgICAgIHZtYSA9IGxvY2tfdm1hX3VuZGVyX3JjdSh2bWxmLT5tbSwgdm1sZi0+YWRkcmVzcyk7
Cj4gPiArICAgICBpZiAoIXZtYSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
PiArCj4gPiArICAgICBpZiAoYXJjaF92bWFfY2hlY2tfYWNjZXNzKHZtYSwgdm1sZikpIHsKPiA+
ICsgICAgICAgICAgICAgdm1hX2VuZF9yZWFkKHZtYSk7Cj4gPiArICAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgZmF1bHQgPSBoYW5kbGVfbW1f
ZmF1bHQodm1hLCB2bWxmLT5hZGRyZXNzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm1sZi0+ZmF1bHRfZmxhZ3MgfCBGQVVMVF9GTEFHX1ZNQV9MT0NLLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdm1sZi0+cmVncyk7Cj4gPiArICAgICAqcmV0ID0gZmF1bHQ7
Cj4gPiArCj4gPiArICAgICBpZiAoIShmYXVsdCAmIChWTV9GQVVMVF9SRVRSWSB8IFZNX0ZBVUxU
X0NPTVBMRVRFRCkpKQo+ID4gKyAgICAgICAgICAgICB2bWFfZW5kX3JlYWQodm1hKTsKPiA+ICsK
PiA+ICsgICAgIGlmICgoZmF1bHQgJiBWTV9GQVVMVF9SRVRSWSkpCj4gPiArICAgICAgICAgICAg
IGNvdW50X3ZtX3ZtYV9sb2NrX2V2ZW50KFZNQV9MT0NLX1JFVFJZKTsKPiA+ICsgICAgIGVsc2UK
PiA+ICsgICAgICAgICAgICAgY291bnRfdm1fdm1hX2xvY2tfZXZlbnQoVk1BX0xPQ0tfU1VDQ0VT
Uyk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiAgI2VuZGlmIC8q
IENPTkZJR19QRVJfVk1BX0xPQ0sgKi8KPiA+Cj4gPiAgI2lmbmRlZiBfX1BBR0VUQUJMRV9QNERf
Rk9MREVECj4gPiAtLQo+ID4gMi4yNy4wCj4gPgo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
