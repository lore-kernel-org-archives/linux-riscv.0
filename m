Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CF7C52D7B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=emjEJ8LcZluh63EwxSd5kBqrdpqOmdC9hZCpuhGYgWY=; b=I7306/MQ6H8DdQenQrNGn07Sst
	jqeYTtYYqOW7Y1KtYcM5ZxdeAURc4OFWIkrgIqNzIRCmwRB/vUCK++Xm4cYRHykRNKhaMHpgh+l+3
	xNxalY50h72fL+NTcJ+5jWplwouLRN+IXGw2T9iXenY8XXABqeMdzIC/VJjtByROgDSX0THTuakAG
	U/iVzhp0NFC9FbL9Jm+MBByDjkOe2OWUM0tihJJucOEHzETYPWDf/lK/mqdkjkA1BkjycP/udj3UL
	5pdhefZm3qz308UYlV98s0pVA1ZkY5x0IYQft7qp04k45jmOHquB6J7AEoDSXlP2LWjjXuTDBRiJ1
	1EHwiUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc57o-00000008lw0-2S25;
	Thu, 08 Aug 2024 15:32:24 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc57G-00000008lfj-26RD
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 15:31:52 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc6ac9a4aaso11953375ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723131108; x=1723735908; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jc21vP9HtcAG8Jx0fCnF54KV0nEotJ+OQOgwzr/gmUk=;
        b=NV//EppF81xT2mOBinYSktmKcb+BxInItv9FmAGoP8k7n5MoiTkPJ1wpqB+iAUl/o7
         ZFjVtcK4n1iiOhjcKaA0yyJPLFw9y3TBJGePNOdGbTXA3Wzlk6XjguVK99kZbALszo4S
         kon8ezjZw1GAgfpVtNOnwWT+qnCXerfL+GraP56RDGDGLP23B9+cY8RoyDNeLtZSiKM2
         QyqhgwGfIYJBIZNMTvoaby1kY5Rwa1GBnXKRu9ki/PPSC+bSlodFQJQmQmkMdVCRIbtO
         LcwaZU3Vt+JSSdhei9/axn8htIIGm3u57iCwKFC1RXlTu9a0lUieMKOLxpho2F4Ir8yL
         k74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723131108; x=1723735908;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jc21vP9HtcAG8Jx0fCnF54KV0nEotJ+OQOgwzr/gmUk=;
        b=Nxg4W9cHeRUoveIDAFFQWLpsUgO/sRzgjkAqSXKg4NFQ2SHMXI5GVN1denRJr0efmv
         xFgFO0QMaQBVFTKf5ZTOyWkENzGZ7u5Pt/LKG7tGDEJ5RULWlzU7Zsc/k+KJ+x79AGWX
         fbNUV4M/zfNP6z6UZOfXxP7CP1KvT1TMf62fo3dQ+9trGbOzEDH/Sg+fcsU7HzIIFONd
         0kKtgF6yNPbQGnU2Rl/CmZBUXLpfhoO7H6XqsqUZ7KpDYde/5pJL4q06CmwN7nwuhKSY
         YBX/tQtO/LjUk/Rc6vCCiMcYT8WwepUwejDVq1jhJLP5pZHiQpkkzU9gzP5R6fMWcOu2
         OAlw==
X-Forwarded-Encrypted: i=1; AJvYcCWlmA77Zi3COfPM3JUUmnExR+29VDqD5VX7uEPrRQ/FEdgNEUucO4/xaVY+vsrIS+kynN28qbG084z8oLAhSB3dNLwlVNzW0VlhsvGnyK7F
X-Gm-Message-State: AOJu0YyTSBOE+Yhl2lp6N1DXXcz5Dpynz+HqjXbjRUty1pZx9tzRH8Zo
	pDwKKd2UenbzcowM62DGt/mL20jmKIeLIsL8blQbAOpoUmLqLxn2TbvcupQ1pBJUEpOSib3QNKd
	HQw==
X-Google-Smtp-Source: AGHT+IGhpuWFvPPS56LNIyARU7ozQJQwYhKu/y/lvyly0zz2F1cJP6/aGqiYnrRnxhwS3wYjMw23Fn2sh0c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2445:b0:1fb:7978:6cc with SMTP id
 d9443c01a7336-20095249cc8mr361865ad.5.1723131108261; Thu, 08 Aug 2024
 08:31:48 -0700 (PDT)
Date: Thu, 8 Aug 2024 08:31:46 -0700
In-Reply-To: <877ccrqc06.fsf@draig.linaro.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-14-seanjc@google.com>
 <87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com> <877ccrqc06.fsf@draig.linaro.org>
Message-ID: <ZrTk4sQS8k1-GBb3@google.com>
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
From: Sean Christopherson <seanjc@google.com>
To: "Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_083150_659606_331CEE75 
X-CRM114-Status: GOOD (  15.85  )
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

T24gVGh1LCBBdWcgMDgsIDIwMjQsIEFsZXggQmVubsOpZSB3cm90ZToKPiBTZWFuIENocmlzdG9w
aGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JpdGVzOgo+IAo+ID4gT24gVGh1LCBBdWcgMDgs
IDIwMjQsIEFsZXggQmVubsOpZSB3cm90ZToKPiA+PiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFu
amNAZ29vZ2xlLmNvbT4gd3JpdGVzOgo+ID4+IAo+ID4+ID4gTm93IHRoYXQgaHZhX3RvX3Bmbigp
IG5vIGxvbmdlciBzdXBwb3J0cyBiZWluZyBjYWxsZWQgaW4gYXRvbWljIGNvbnRleHQsCj4gPj4g
PiBtb3ZlIHRoZSBtaWdodF9zbGVlcCgpIGFubm90YXRpb24gZnJvbSBodmFfdG9fcGZuX3Nsb3co
KSB0bwo+ID4+ID4gaHZhX3RvX3BmbigpLgo+ID4+IAo+ID4+IFRoZSBjb21tZW50YXJ5IGZvciBo
dmFfdG9fcGZuX2Zhc3QgZGlzYWdyZWVzLgo+ID4+IAo+ID4+ICAgLyoKPiA+PiAgICAqIFRoZSBm
YXN0IHBhdGggdG8gZ2V0IHRoZSB3cml0YWJsZSBwZm4gd2hpY2ggd2lsbCBiZSBzdG9yZWQgaW4g
QHBmbiwKPiA+PiAgICAqIHRydWUgaW5kaWNhdGVzIHN1Y2Nlc3MsIG90aGVyd2lzZSBmYWxzZSBp
cyByZXR1cm5lZC4gIEl0J3MgYWxzbyB0aGUKPiA+PiAgICAqIG9ubHkgcGFydCB0aGF0IHJ1bnMg
aWYgd2UgY2FuIGluIGF0b21pYyBjb250ZXh0Lgo+ID4+ICAgICovCj4gPj4gICBzdGF0aWMgYm9v
bCBodmFfdG9fcGZuX2Zhc3Qoc3RydWN0IGt2bV9mb2xsb3dfcGZuICprZnAsIGt2bV9wZm5fdCAq
cGZuKQo+ID4+IAo+ID4+IEF0IHdoaWNoIHBvaW50IGRpZCBpdCBsb29zZSB0aGUgYWJpbGl0eSB0
byBydW4gaW4gdGhlIGF0b21pYyBjb250ZXh0PyBJCj4gPj4gY291bGRuJ3Qgd29yayBpdCBvdXQg
ZnJvbSB0aGUgY29tbWl0cy4KPiA+Cj4gPiBJdCBkaWRuJ3QgbG9zZSB0aGUgYWJpbGl0eSBwZXIg
c2UgKGNhbGxpbmcgaHZhX3RvX3Bmbl9mYXN0KCkgaW4gYXRvbWljIGNvbnRleHQKPiA+IHdvdWxk
IHN0aWxsIGJlIGZ1bmN0aW9uYWxseSBvayksIHJhdGhlciB0aGUgcHJldmlvdXMgcGF0Y2gKPiA+
Cj4gPiAgIEtWTTogRHJvcCBAYXRvbWljIHBhcmFtIGZyb20gZ2ZuPT5wZm4gYW5kIGh2YT0+cGZu
IEFQSXMKPiA+Cj4gPiByZW1vdmVkIHN1cHBvcnQgZm9yIGRvaW5nIHNvIGluIG9yZGVyIHRvIHNp
bXBsaWZ5IGh2YV90b19wZm4oKSBhcyBhIHdob2xlLgo+IAo+IEl0IHN0aWxsIHN0aWNrcyBvdXQg
Z2l2ZW4gdGhlIG9ubHkgY2FsbGVyIG5vIGxvbmdlciBlbmZvcmNlcyB0aGlzLiAKCk9oLCBzb3Jy
eSwgSSBzaG91bGQgaGF2ZSBiZWVuIG1vcmUgZXhwbGljaXQuICBJJ2xsIGZpeCB0aGUgY29tbWVu
dCwgSSBzaW1wbHkKbWlzc2VkIGl0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
