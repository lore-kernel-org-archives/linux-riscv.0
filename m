Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1976CAC5B7
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 03:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+C4YGUTYWBMx0zVBnipxzYSY/dTXfh4tZ8qq2hIfwa8=; b=QmPrTxiTI1EFqT
	VBpm2ygItR2+Ch75ywFfNQ1G2ndxHN5vbi4suC7vZ+3mQiLQigGXNch7e2QEtcG/+YS4w+OeH2XF2
	NX36BO/OjR41jhCpkEwyhJapiOG3Hh5Zrdl+1wJ+CwK9UPqRiXSH/eDxPf7gmJfvwliB3FSgPPv/8
	ZtGG45iYv9HX00IFiEBkbZ/LBtTOT6Kh7Vd+LM7zhPjChCu4+xn5dRSKE9esmfl7VgnE4TcyR8aJo
	d6l1rS1Si/pb7QAPkxu9e1gf5PWtrYSuf+cl2GW2vi0G4CdHGNQ6DAqU0kCRl9aIMtAH2cZWlQUFD
	xv+U4ZKZ/vPsED6ktezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqlc6-00000007OVd-1IJU;
	Wed, 18 Sep 2024 03:44:22 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqlc3-00000007OUx-1k7V
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 03:44:21 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3e039889ca0so3590533b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 20:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1726631057; x=1727235857; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DobwYhNLX7T7HDxembho0c7pkvfHZaGZKAqaliF5l+8=;
        b=ehnkWdlgZ9w8aa6OzfVB6CQPF+rIzSxWUaurWYdctp/vDT8unX6Ir3Rmg3ZEvrsY7c
         oqPlBGDNMKMEbiDvnAG1E2x4kesJjpE6dHyhvfxzldrl0RdB7UGrREJUQ2c5vvliyy9G
         DDGwXZPk/J/GPKgYS6YQa4sS0kKpY9mR9vl1XjHhJZU9kSwS+BT4ncBtJ/a8o9ZdHVxr
         iJeTo2GC2xnKajKhvGLUetVBi6a5QbXO7sXefcrLNGfqoiN4ScssaDMkLCtdguA/Paoo
         88TVFdfwXkYDJISOPBzJqZFWmC071FoI7UGxEcNk+mgHUxCvbRacFQ3FF/3cXoLWvodE
         Z66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726631057; x=1727235857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DobwYhNLX7T7HDxembho0c7pkvfHZaGZKAqaliF5l+8=;
        b=ssdRP66eBDNW6Fr2pjuvRR4ie1mz2cQvm2LvNvzKcRQh1DZNUY3GxRh3bGXyo78m65
         di/C5fwk5vRAcc5GtEluSyJhVHhxCbx8TSuOCGdUdsdY1bPGQbRgXO/zB2k0PuL3Axug
         Vd0ZgAReNobQeVwMmnIKFxoYfwbhh8Ynsy/qFglUPTonTW0kRv1mmgcSFXHnvTAvIeXZ
         6cygPjjU1A8iZ80e87YrqPZNlm4MHcX5KEgRWRxC3cUNZBdpafOGd4Q4niP6XEGui3xY
         K9Oe0maz9YFIMnpJyKNLDzJMv/Y9Jt9Bh0COBL9zYZhoORHtPQL7FiXq7Ln5M9e2k3Wj
         jw4g==
X-Forwarded-Encrypted: i=1; AJvYcCWsyONELk2jDixe3qJ5uMDpyFuh5RpDMVuh/bZ4oZeZxI5fnxkkkLjqZrcykfjwIr62kYFk2IbUQjdW+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfFq3jCzdEUWBOVgoHfK7p7sRAp4Gh3d4Dre+Uktu2Zf2IJss0
	3oUwAijowzdyMRQbkH/9XABEBI8kpIa51ADkKDK5YbrVvOns+mVUZYOWhBJvO5irMRmdpOVVrOS
	TlLfDH1d3UbO7EdANtQzMWrKAMZahxMR4UBpqXbr/TzyeDYsERvfHwg==
X-Google-Smtp-Source: AGHT+IF6de8Ljl0ByArbrMkxhZs+4LwqOYs7ZOBCk6m5TQb5f1t5owv4UvkHCcuojdyGYfR5plBv4DlUn7J0rn9ve1s=
X-Received: by 2002:a05:6808:219c:b0:3e0:4076:183b with SMTP id
 5614622812f47-3e071ae397dmr18229228b6e.32.1726631057195; Tue, 17 Sep 2024
 20:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240723021820.87718-1-cuiyunhui@bytedance.com> <CAEEQ3w=hsAEp8t+eH1GQW4M9ZY2TPXGUuhyNLB5DFEo88vwDZA@mail.gmail.com>
In-Reply-To: <CAEEQ3w=hsAEp8t+eH1GQW4M9ZY2TPXGUuhyNLB5DFEo88vwDZA@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 18 Sep 2024 11:44:05 +0800
Message-ID: <CAEEQ3wmOKtfMyRYnmEcHcczuRhPjMC8g_rxQc9y3X9gOuaqS0Q@mail.gmail.com>
Subject: Re: [PATCH v3] riscv/mm/fault: add show_pte() before die()
To: conor@kernel.org, punit.agrawal@bytedance.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org, 
	surenb@google.com, peterx@redhat.com, alexghiti@rivosinc.com, 
	willy@infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_204419_484929_8B99DFD2 
X-CRM114-Status: GOOD (  21.51  )
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

SGkgUGFsbWVyLAoKQSBnZW50bGUgcGluZyBmb3IgdGhpcyBwYXRjaC4KCk9uIFRodSwgQXVnIDE1
LCAyMDI0IGF0IDEwOjA14oCvQU0geXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
IHdyb3RlOgo+Cj4gSGkgQWxsLAo+Cj4gQSBnZW50bGUgcGluZywgQW55IG1vcmUgY29tbWVudHMg
b24gdGhpcyBwYXRjaD8KPgo+IE9uIFR1ZSwgSnVsIDIzLCAyMDI0IGF0IDEwOjE44oCvQU0gWXVu
aHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IFdoZW4gdGhl
IGtlcm5lbCBkaXNwbGF5cyAiVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3Qg
YXQKPiA+IHZpcnR1YWwgYWRkcmVzcyIsIHdlIHdvdWxkIGxpa2UgdG8gY29uZmlybSB0aGUgc3Rh
dHVzIG9mIHRoZSB2aXJ0dWFsCj4gPiBhZGRyZXNzIGluIHRoZSBwYWdlIHRhYmxlLiBTbyBhZGQg
c2hvd19wdGUoKSBiZWZvcmUgZGllKCkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1
aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25l
cyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L21tL2Zh
dWx0LmMgfCA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9tbS9mYXVsdC5jIGIvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCj4gPiBpbmRleCA1
MjI0ZjM3MzM4MDIuLmM3MmU2YzdjMDllZiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0v
ZmF1bHQuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCj4gPiBAQCAtMjIsNiArMjIs
NTcgQEAKPiA+Cj4gPiAgI2luY2x1ZGUgIi4uL2tlcm5lbC9oZWFkLmgiCj4gPgo+ID4gK3N0YXRp
YyB2b2lkIHNob3dfcHRlKHVuc2lnbmVkIGxvbmcgYWRkcikKPiA+ICt7Cj4gPiArICAgICAgIHBn
ZF90ICpwZ2RwLCBwZ2Q7Cj4gPiArICAgICAgIHA0ZF90ICpwNGRwLCBwNGQ7Cj4gPiArICAgICAg
IHB1ZF90ICpwdWRwLCBwdWQ7Cj4gPiArICAgICAgIHBtZF90ICpwbWRwLCBwbWQ7Cj4gPiArICAg
ICAgIHB0ZV90ICpwdGVwLCBwdGU7Cj4gPiArICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0g
Y3VycmVudC0+bW07Cj4gPiArCj4gPiArICAgICAgIGlmICghbW0pCj4gPiArICAgICAgICAgICAg
ICAgbW0gPSAmaW5pdF9tbTsKPiA+ICsKPiA+ICsgICAgICAgcHJfYWxlcnQoIkN1cnJlbnQgJXMg
cGd0YWJsZTogJWx1SyBwYWdlc2l6ZSwgJWQtYml0IFZBcywgcGdkcD0weCUwMTZsbHhcbiIsCj4g
PiArICAgICAgICAgICAgICAgIGN1cnJlbnQtPmNvbW0sIFBBR0VfU0laRSAvIFNaXzFLLCBWQV9C
SVRTLAo+ID4gKyAgICAgICAgICAgICAgICBtbSA9PSAmaW5pdF9tbSA/ICh1NjQpX19wYV9zeW1i
b2wobW0tPnBnZCkgOiB2aXJ0X3RvX3BoeXMobW0tPnBnZCkpOwo+ID4gKwo+ID4gKyAgICAgICBw
Z2RwID0gcGdkX29mZnNldChtbSwgYWRkcik7Cj4gPiArICAgICAgIHBnZCA9IHBnZHBfZ2V0KHBn
ZHApOwo+ID4gKyAgICAgICBwcl9hbGVydCgiWyUwMTZseF0gcGdkPSUwMTZseCIsIGFkZHIsIHBn
ZF92YWwocGdkKSk7Cj4gPiArICAgICAgIGlmIChwZ2Rfbm9uZShwZ2QpIHx8IHBnZF9iYWQocGdk
KSB8fCBwZ2RfbGVhZihwZ2QpKQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gKwo+
ID4gKyAgICAgICBwNGRwID0gcDRkX29mZnNldChwZ2RwLCBhZGRyKTsKPiA+ICsgICAgICAgcDRk
ID0gcDRkcF9nZXQocDRkcCk7Cj4gPiArICAgICAgIHByX2NvbnQoIiwgcDRkPSUwMTZseCIsIHA0
ZF92YWwocDRkKSk7Cj4gPiArICAgICAgIGlmIChwNGRfbm9uZShwNGQpIHx8IHA0ZF9iYWQocDRk
KSB8fCBwNGRfbGVhZihwNGQpKQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gKwo+
ID4gKyAgICAgICBwdWRwID0gcHVkX29mZnNldChwNGRwLCBhZGRyKTsKPiA+ICsgICAgICAgcHVk
ID0gcHVkcF9nZXQocHVkcCk7Cj4gPiArICAgICAgIHByX2NvbnQoIiwgcHVkPSUwMTZseCIsIHB1
ZF92YWwocHVkKSk7Cj4gPiArICAgICAgIGlmIChwdWRfbm9uZShwdWQpIHx8IHB1ZF9iYWQocHVk
KSB8fCBwdWRfbGVhZihwdWQpKQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gKwo+
ID4gKyAgICAgICBwbWRwID0gcG1kX29mZnNldChwdWRwLCBhZGRyKTsKPiA+ICsgICAgICAgcG1k
ID0gcG1kcF9nZXQocG1kcCk7Cj4gPiArICAgICAgIHByX2NvbnQoIiwgcG1kPSUwMTZseCIsIHBt
ZF92YWwocG1kKSk7Cj4gPiArICAgICAgIGlmIChwbWRfbm9uZShwbWQpIHx8IHBtZF9iYWQocG1k
KSB8fCBwbWRfbGVhZihwbWQpKQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gKwo+
ID4gKyAgICAgICBwdGVwID0gcHRlX29mZnNldF9tYXAocG1kcCwgYWRkcik7Cj4gPiArICAgICAg
IGlmICghcHRlcCkKPiA+ICsgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICsKPiA+ICsgICAg
ICAgcHRlID0gcHRlcF9nZXQocHRlcCk7Cj4gPiArICAgICAgIHByX2NvbnQoIiwgcHRlPSUwMTZs
eCIsIHB0ZV92YWwocHRlKSk7Cj4gPiArICAgICAgIHB0ZV91bm1hcChwdGVwKTsKPiA+ICtvdXQ6
Cj4gPiArICAgICAgIHByX2NvbnQoIlxuIik7Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyB2b2lk
IGRpZV9rZXJuZWxfZmF1bHQoY29uc3QgY2hhciAqbXNnLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4g
PiAgICAgICAgICAgICAgICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAgewo+ID4gQEAgLTMx
LDYgKzgyLDcgQEAgc3RhdGljIHZvaWQgZGllX2tlcm5lbF9mYXVsdChjb25zdCBjaGFyICptc2cs
IHVuc2lnbmVkIGxvbmcgYWRkciwKPiA+ICAgICAgICAgICAgICAgICBhZGRyKTsKPiA+Cj4gPiAg
ICAgICAgIGJ1c3Rfc3BpbmxvY2tzKDApOwo+ID4gKyAgICAgICBzaG93X3B0ZShhZGRyKTsKPiA+
ICAgICAgICAgZGllKHJlZ3MsICJPb3BzIik7Cj4gPiAgICAgICAgIG1ha2VfdGFza19kZWFkKFNJ
R0tJTEwpOwo+ID4gIH0KPiA+IC0tCj4gPiAyLjM5LjIKPiA+Cj4KPiBUaGFua3MsCj4gWXVuaHVp
CgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
