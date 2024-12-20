Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95107E7718B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 14:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sByFdkKoxRVZf5cpsqYmcwA0CPQdeuIj9aQbdP75x7E=; b=DghSB15h2Yw3Ha
	38ccd9sqPiYFuDSDTWA6zigiMf2nr1hPk2caeNYuKzZSni2rDgX2Z29syE/6WaiDa3BTiwvD9FhGM
	e7+GK9IZ8stBqEcPQtEuCA3P7zUfKpT/zz98vL8jDB+xY1q8KBszqiiYZiBoNIks0jnym5yMh2IDF
	3D7rXxfN6VGSl2n4cEVPqLLx0uEi17PNMXaXJBPMJT72twQZQCqp0M337sYOIDvDNxqKM25JudfTH
	buDW/l00Sg1kTbH3UaruTdhR0jUxyRQjF+XSkh+x2WqpsSEIza+aSm3YkTplmgG2G9ixYXzywGO7g
	I/ILvAscWsClaJ0CvhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe9U-00000005AYE-1NIb;
	Fri, 20 Dec 2024 14:38:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe6I-000000059rh-1sBB
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 14:35:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216281bc30fso21659865ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 06:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734705334; x=1735310134; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZtvjese48KZzlytF02YIE1ieOtjMj+XC4JVW8Rkw1o=;
        b=V8DAFTBjHV4qDGroLmxlFiLjEJ7wvsBCNLFEwZ4rY/4B6v8wqNAfDAa7ug/E1qh+Vo
         S0J0HzkGvxf3VgQLWzXoPC2zWCk3VsoSHlDnU5wXDnNF+Q3KdP7xrsPQlr6dd3ewlQZW
         qFETNtSV+G5z8IAIfkhx+g2RqjK8BA5FdTmhr71E8lOTZ5+vWb/RtjumpVczTYZxNexo
         haPQLYWZ5xPqAi0PQpv2T1ZSiPS06ONpr1IlzakoNRt9RekV0mEG3qyoTM/OuCCUZYsv
         wPj4IVHilWb15vvb+H0dK/LnPXAhuYN3w1lbkWT3GBOBzG39dewIfPsdWGdfJiy19iJ5
         ywuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705334; x=1735310134;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZtvjese48KZzlytF02YIE1ieOtjMj+XC4JVW8Rkw1o=;
        b=RjNwrzkGQiFIkf2stEL3338KFxsKc2D/eyz7j+Ccpk0u5Fl98feg/87Z8BLoAdWShR
         k3ZqLHOHeu/HantKPV7augdi4HrdkneiR7TONlE16doOrFcGasdqf/21rbpTrUa9pTKh
         6cS6RtpmC+wkL7yid1GUyPfB5htZVyUmu8o3mFAoXAr6k/1ZKZ0PTiN3nn5HMYnOUIsh
         0RRqe8CxXrtuXhuzVczhYvcQ8vECF9Zrqmyl+gF2nIugq6F5IqYNbIyXr/LyDSEiDyBf
         x29IH+4naGMPv2LjghgXgZpfnxfIM4dBb6QNNmB6BI/X32Mw03jQo/4Zotxxmvp0I469
         lUTg==
X-Forwarded-Encrypted: i=1; AJvYcCUNqJD1OSh7XR84UU2w5pQ9mMNBR+gfYgzVrvNuA/egu+RkmU34nu/W444LIUVzvD9np6QxixwAlKrytQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwDqdsvwe/mhid028vsQXArmCbm7rLChmkH8wSmPOvm/e50Jxc
	H8ZYqPLEHeBcsrEbcimgqIX9nppMEgrbYjgqdfhSyn6w6xrkb8ASMiIauVqJc6c=
X-Gm-Gg: ASbGncvqViqwf4+VrlWvHoJkVcjCFv0M/lHhNQVxYQ7j6BNdiPhGObqJCTBgtPnGnQt
	+f6XVYEaDMnJNWEXIjQm30EFv7x0VmRRLZ/4hJW16lgjJ/OW0pfmEp10qSd7ZTFRyMsZNaMh5vo
	KbpsFvxfoIZc9E+0ZAtHP01tdFiD1wdfe/LGvvRGu03uwESAPLlwSfpeDnLLwpQSiXS25Gr+Pbt
	ylN0jsAP0TbEV//vwgpiKlahDjb150fXfV0IfuUk72yko48vU2nOazjwXJjyDt4Nn5s/dvYYhhB
	6OMr02o52zvPSi550ZqgF0pcVPFvOQ8sr92tKrQLBR/Sp+ein/gdyUg=
X-Google-Smtp-Source: AGHT+IEB+BvsoefjQ7Vgsp4o6cvW8xDLBZZay+9fVCOXIUsW3GchN/svfJCRC88uzsyXVDtiu7XXHA==
X-Received: by 2002:a17:902:d485:b0:215:b5d6:5fa8 with SMTP id d9443c01a7336-219e6ea8948mr44866765ad.22.1734705333728;
        Fri, 20 Dec 2024 06:35:33 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:3764:dc48:fb1b:dd06:cba7? ([2409:8a28:f44:3764:dc48:fb1b:dd06:cba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9704dbsm29773545ad.98.2024.12.20.06.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:35:32 -0800 (PST)
Message-ID: <0725252d-1339-4841-bc1d-6cf9e82b2170@bytedance.com>
Date: Fri, 20 Dec 2024 22:35:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
 <20241219171920.GB26279@noisy.programming.kicks-ass.net>
 <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
 <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
 <2f65f93e-9d44-4acc-b63c-8f5a35f59699@arm.com>
 <33ce9b58-4787-49cd-a7f2-34272cb3ecf7@bytedance.com>
 <7f5e6ac7-01ef-46c8-bc85-7f8399dadb19@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <7f5e6ac7-01ef-46c8-bc85-7f8399dadb19@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_063534_528155_27A13769 
X-CRM114-Status: GOOD (  18.53  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDI0LzEyLzIwIDIyOjI4LCBLZXZpbiBCcm9kc2t5IHdyb3RlOgo+IE9uIDIwLzEyLzIw
MjQgMTU6MTYsIFFpIFpoZW5nIHdyb3RlOgo+Pj4+Cj4+Pj4gRGlkIEkgbWlzcyBzb21ldGhpbmc/
Cj4+Pj4KPj4+PiBNeSBwYXRjaCBzZXJpZXMgaXMgbm90IG9ubHkgZm9yIGNsZWFudXAsIGJ1dCBh
bHNvIGZvciBmaXhlcyBvZgo+Pj4+IFVBRiBpc3N1ZSBbMV0sIHNvIGlzIGl0IHBvc3NpYmxlIHRv
IHJlYmFzZSB5b3VyIHBhdGNoIHNlcmllcyBvbnRvCj4+Pj4gbWluZT8gSSBjYW4gcG9zdCB2MyBB
U0FQLgo+Pj4KPj4+IEkgc2VlLCB5b3VycyBzaG91bGQgYmUgbWVyZ2VkIGZpcnN0IHRoZW4uIFRo
ZSBpc3N1ZSBpcyB0aGF0IHlvdXJzIHdvdWxkCj4+PiBkZXBlbmQgb24gc29tZSBvZiB0aGUgcGF0
Y2hlcyBpbiBtaW5lLCBub3QgdGhlIG90aGVyIHdheSByb3VuZC4KPj4+Cj4+PiBNeSBzdWdnZXN0
aW9uIHdvdWxkIHRoZW4gYmUgZm9yIHlvdSB0byB0YWtlIHBhdGNoIDUsIDYgYW5kIDcgZnJvbSBt
eQo+Pj4gc2VyaWVzLCBhcyB0aGV5IG1hdGNoIEFsZXhhbmRlcidzIHN1Z2dlc3Rpb25zIChhbmQg
cGF0Y2ggNSBpcyBJIHRoaW5rIGEKPj4+IHVzZWZ1bCBzaW1wbGlmaWNhdGlvbiksIGFuZCByZXBs
YWNlIHBhdGNoIDIgaW4geW91ciBzZXJpZXMgd2l0aCB0aG9zZS4gSQo+Pj4gd291bGQgdGhlbiBy
ZWJhc2UgbXkgc2VyaWVzIG9uIHRvcCBhbmQgYWRhcHQgaXQgYWNjb3JkaW5nbHkuIERvZXMgdGhh
dAo+Pj4gc291bmQgcmVhc29uYWJsZT8KPj4KPj4gU291bmRzIGdvb2QuIEJ1dCBtYXliZSBqdXN0
IHBhdGNoIDUgYW5kIDYuIEJlY2F1c2UgSSBhY3R1YWxseSBkaWQKPj4gdGhlIHdvcmsgb2YgeW91
ciBwYXRjaCA3IGluIG15IHBhdGNoIDIgYW5kIDQuCj4gCj4gWWVzIHRoYXQncyBmYWlyISBZb3Un
ZCBoYXZlIHRvIGRvIGFkYXB0IG15IHBhdGNoIDcgdG8gbWFrZSBpdCBmaXQgaW4KPiB5b3VyIHNl
cmllcyBzbyBJIGFncmVlIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdGhpcyB3YXkuCgpUaGFua3MhCgo+
IAo+Pgo+PiBTbywgaXMgaXQgb2theSB0byBkbyBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5n
Pwo+Pgo+PiAxLiBJIHNlcGFyYXRlIHRoZSBjdG9yKCkvZHRvcigpIHBhcnQgZnJvbSBteSBwYXRj
aCAyLCBhbmQgdGhlbiByZXBsYWNlCj4+ICDCoMKgIHRoZSByZXN0IHdpdGggeW91ciBwYXRjaCA2
Lgo+PiAyLiB0YWtlIHlvdXIgcGF0Y2ggNSBmb3JtIHlvdXIgc2VyaWVzCj4gCj4gU291bmRzIGdv
b2QgdG8gbWUhCj4gCj4gSUlVQyBEYXZlIEhhbnNlbiBnYXZlIGhpcyBBY2tlZC1ieSBmb3IgdGhl
IHg4NiBwYXJ0IG9mIHBhdGNoIDYgWzFdLAo+IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gYWRkIGl0IHdo
ZW4geW91IHBvc3QgeW91ciB2My4KCk9LLCB3aWxsIGFkZCBpdCEKCj4gCj4+Cj4+IElmIGl0J3Mg
b2ssIEkgd2lsbCBwb3N0IHRoZSB2MyBuZXh0IE1vbmRheS4gOykKPiAKPiBQZXJmZWN0LiBJJ20g
Z29pbmcgb2ZmbGluZSB0b25pZ2h0LCB3aGVuIEkgY29tZSBiYWNrIGluIHRoZSBuZXcgeWVhcgo+
IEknbGwgcmV2aWV3IHlvdXIgdjMgc2VyaWVzIGFuZCBwb3N0IGEgbmV3IHZlcnNpb24gb2YgdGhp
cyBvbmUuCgpUaGFuayB5b3UgdmVyeSBtdWNoISBBbmQgSGFwcHkgTmV3IFllYXIhCgo+IAo+IENo
ZWVycywKPiAtIEtldmluCj4gCj4gWzFdCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
bW0vYTczOTg0MjYtNTZkMS00MGI0LWExYzktNDBhZThjOGE0YjRiQGludGVsLmNvbS8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
