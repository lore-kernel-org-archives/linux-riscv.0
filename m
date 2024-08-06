Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0F1C52D70
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 15:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jURmsw1WD/XWb9rgRB0yTwDdvgrlaCHy/iXHeXKNvYc=; b=Tn1xDe6h2Gi6UL
	OHHEQ15iVqyN8bZ1ZexzaFEdXTWs46CYU0TNOAuusUITlqzrcCzLcp14AKycSuWrSb/nUw0/LT4S8
	L2aCzQCQ9XMgre2/PWwSCqgZ7BILALmg4N4CxEko3SgW2x5zeGoAHzuoJ66lZdlSzYX+eioAXPf3Q
	LRTf7SUrCTozY98H1NW/Xp98HzoWVOxgaYIIwPMpfZoe1BUVYr+7iHUDh62cgHblKEl06lNDGULxb
	KBzPk+schC4tWrWx+lM3IT0i0hmH0Qrh+bnAPV6uz5v+U6jq+G3Rr5xDvY5CQHsrFes2L79D8KFb6
	OBOn7+NF89wI98pYOi6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbLkK-000000027Nw-2Dtm;
	Tue, 06 Aug 2024 15:05:08 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbLjQ-00000002716-3Vuf
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 15:04:16 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-39b3e12754eso2789975ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1722956651; x=1723561451; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nqpVJEa3gF+vLMgvdD8twTbWevyBd39Y3ES27W51MM=;
        b=z8VOoq/raCO/SrTN7a8EaMiCEiq4ppVoI2RDNdPioM6P2eeFn3uxTRYbmwqZjGQYxZ
         RFBZ0rbwXJcuOpg33mhuqAnwbjen3ohZerUG6LMXp1nCE9oE7A9X5WHojj1sj8fyHfjp
         cdkuZP28IzHOWLrR1+3EVyjOcD5RhJ1Pjur5CJsTKTyNMUST4gnQziM2HZdxMqrlVb34
         0t3otyfLPFIa+Bn0dZwbaXclhHbiOICEMcCEKqKBk+5U5+5TbGf/1PGlSDtecuVWeAqa
         ajY/lUxoP+7g68M0fjeot0K0XAaUGNGhFun8XuWJk/N4d+ajATyp/sQfgT/lEu/9Yhvw
         mRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956651; x=1723561451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nqpVJEa3gF+vLMgvdD8twTbWevyBd39Y3ES27W51MM=;
        b=YE4d7+11uklhnNb7T5QLfwDs+Kpg+3FwpExRkdoSG2TkIRXWTmoxtjyVAKkzCnoWk9
         fkHG/1dIf01asyrhJYthHpTgnkbEEahlg9p4ufS3EqgHOATw4AVXoiUM/SgMELranJJW
         Aiv73UAF8e9IyoECzWOQz2jHn9s/BmhEq5sf4v39j/XXGzhEfCv1RK29sXFDnQJ2Tfua
         36Oq5zleq6BgTc5DkCDy+Jhfa9FGu9MM6clrbk90ugBIdndJonfe7Hp+g0M/AYwWRLc4
         Hr1xEvvy6b1w8PbkON3OPttPlfal7SEg+touyuzmJTFnia1tv07aHjZBylebubj/AHxN
         JUPg==
X-Forwarded-Encrypted: i=1; AJvYcCXj+EB32SQF2pxtyBNl/ql/z+ECB34sw24owSdbpVGUrDs3R5lZpM8QesMJ6CIt1iIT3m6c/ZfixndqEiVkgi/77VHaPJlotPStw7JXwx0U
X-Gm-Message-State: AOJu0Yx2aVPZNZDjZ/543FqoQjw9QsOHBP3lVR8r6BHWXvGKYXvcUF7p
	URDsWebE3qjTlenJOcXYd6sJHXnkGcF1PJYN9Vj8KRedZf6+Y4kaIuDJxclGaSRCysmf5+9BKSq
	Tpzr4k+6ZafpsUVpFRON3jDMEv7ytqz2v8HmhRQ==
X-Google-Smtp-Source: AGHT+IE5dkU8O3hsRzTzR3mqE211YMexCU92LD+ZH2mO65SVdE7w+UZ8Equ/sKTPvXFYaRtJg+9DX/UprpD7ulXsS18=
X-Received: by 2002:a92:d64d:0:b0:397:d9a9:8769 with SMTP id
 e9e14a558f8ab-39b1fc37fe5mr152610645ab.24.1722956650868; Tue, 06 Aug 2024
 08:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-57-seanjc@google.com>
In-Reply-To: <20240726235234.228822-57-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Aug 2024 20:33:59 +0530
Message-ID: <CAAhSdy1DvkU_C2jmtA1SBNfjp1gxu_6RhFKbf-hkhSNQeTXwwA@mail.gmail.com>
Subject: Re: [PATCH v12 56/84] KVM: RISC-V: Mark "struct page" pfns dirty iff
 a stage-2 PTE is installed
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_080412_998142_EA8685D0 
X-CRM114-Status: GOOD (  15.17  )
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

T24gU2F0LCBKdWwgMjcsIDIwMjQgYXQgNToyNOKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IERvbid0IG1hcmsgcGFnZXMgZGlydHkgaWYgS1ZN
IGJhaWxzIGZyb20gdGhlIHBhZ2UgZmF1bHQgaGFuZGxlciB3aXRob3V0Cj4gaW5zdGFsbGluZyBh
IHN0YWdlLTIgbWFwcGluZywgaS5lLiBpZiB0aGUgcGFnZSBpcyBndWFyYW50ZWVkIHRvIG5vdCBi
ZQo+IHdyaXR0ZW4gYnkgdGhlIGd1ZXN0Lgo+Cj4gSW4gYWRkaXRpb24gdG8gYmVpbmcgYSAodmVy
eSkgbWlub3IgZml4LCB0aGlzIHBhdmVzIHRoZSB3YXkgZm9yIGNvbnZlcnRpbmcKPiBSSVNDLVYg
dG8gdXNlIGt2bV9yZWxlYXNlX2ZhdWx0aW5fcGFnZSgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2Vh
biBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+CgpGb3IgS1ZNIFJJU0MtVjoKQWNr
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgoK
PiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCBiNjM2NTBmOWI5NjYu
LjA2YWE1YTBkMDU2ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gQEAgLTY2OSw3ICs2NjksNiBAQCBpbnQga3ZtX3Jpc2N2
X2dzdGFnZV9tYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgICAgICAgICBnb3Rv
IG91dF91bmxvY2s7Cj4KPiAgICAgICAgIGlmICh3cml0YWJsZSkgewo+IC0gICAgICAgICAgICAg
ICBrdm1fc2V0X3Bmbl9kaXJ0eShoZm4pOwo+ICAgICAgICAgICAgICAgICBtYXJrX3BhZ2VfZGly
dHkoa3ZtLCBnZm4pOwo+ICAgICAgICAgICAgICAgICByZXQgPSBnc3RhZ2VfbWFwX3BhZ2Uoa3Zt
LCBwY2FjaGUsIGdwYSwgaGZuIDw8IFBBR0VfU0hJRlQsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2bWFfcGFnZXNpemUsIGZhbHNlLCB0cnVlKTsKPiBAQCAtNjgyLDYg
KzY4MSw5IEBAIGludCBrdm1fcmlzY3ZfZ3N0YWdlX21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
Cj4gICAgICAgICAgICAgICAgIGt2bV9lcnIoIkZhaWxlZCB0byBtYXAgaW4gRy1zdGFnZVxuIik7
Cj4KPiAgb3V0X3VubG9jazoKPiArICAgICAgIGlmICgoIXJldCB8fCByZXQgPT0gLUVFWElTVCkg
JiYgd3JpdGFibGUpCj4gKyAgICAgICAgICAgICAgIGt2bV9zZXRfcGZuX2RpcnR5KGhmbik7Cj4g
Kwo+ICAgICAgICAgc3Bpbl91bmxvY2soJmt2bS0+bW11X2xvY2spOwo+ICAgICAgICAga3ZtX3Nl
dF9wZm5fYWNjZXNzZWQoaGZuKTsKPiAgICAgICAgIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbihoZm4p
Owo+IC0tCj4gMi40Ni4wLnJjMS4yMzIuZzk3NTJmOWUxMjMtZ29vZwo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
