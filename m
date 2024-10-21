Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD4ED17123
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9tnWuMPNji90iWXtt3yIWSZMYcXd+q8ACFDPhnvjllc=; b=AgkTx+wljML5l+BdVqlolutHqu
	s+WZb7+Ieh3j6tkjzcmhw0acGtGba2jfRftbuL40fwnSMBBlf3uiRIAdEZRN8R0ZX3UQZiHL1NbLc
	RyAqbpvtjlQJUNnSNIRAE6S8CNxxtZFDqUqK5MsUspyMyMXjGGhx7UqpjEsrqihRF3LLIPOGum5lP
	DChXthe/HTyJ8/pIH9ja/rBGz9dJODwKJTUD6hhOH7Sfer9z5Bjc5JnJMUxRRtjb7dKNl4UPSlRC6
	rGveQWj98qgt/pgvr0vgGN2uUQt2QLKXA+VVeV4XeiOOf55+560iRNsP8bOCsB/UTrAEznvGpUt5i
	vyxgQNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2xcR-00000008NAd-0KRq;
	Mon, 21 Oct 2024 18:59:07 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2xb8-00000008Mwx-3zql
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 18:57:48 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7ea6efcd658so4087252a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729537065; x=1730141865; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRc3VGGNkUkUR9ifA4nNeX0hRZiSdlXeerhUJQ+tYBo=;
        b=w9Go7hKJw2sDm5AgMc/FV593puEvk3b38U/G5B4gLnqr+6L2CVc+DVhm0V81WfmNKa
         OHhWH3KYMQkNthbrZIAX86lJgzPyTaDKhohCGsU/cJEtOIhLaC48gj+HQZwgl6NDJ1CZ
         nuexkOmhkgk7uKS5NUtdR9OkK3iGAG3XYzEN6sSk5TPMo0QDfu0N9hyhfUqQUyRfyvbp
         ieHl5KD+a1oeJ2uuZWoIu5C0Id2UKvSsJuAIWVOWdNmh98CuosswKtr1K/gSOmyXAYzF
         KEALUUdydCTmls7mejUTN3W4c2WdjjsEqXEKO0Ttkvcc1FFQ+dRin42dixn0k4IFNDwL
         EYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729537065; x=1730141865;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TRc3VGGNkUkUR9ifA4nNeX0hRZiSdlXeerhUJQ+tYBo=;
        b=IVyZXrerOsIvZGFCdjOa4DyoA4gR2L7VMxjDUP4oLDjUoqhGez7/xoQuKOrwal+9Vt
         M0PM5wAscTFGSsjBrfq60HXgqzARezlDVGUYdchSUOS/8Ey9SOXgi4e1xdakMqNwYW8h
         vaLFBb7EcrxAOfjGHXAuz/i/esQJD0C6dug/WLAaW37NScqG174DoqRBP/6KjqrjbuaB
         0D5fpxiKzaVosP56rrgMiyrNyGpT0JQ5VizzCgZH+Ez/CHO+Rig197p2yfGRK7SXeIsQ
         q7WDcRlOQaC8Ej2N1Fyg0aeUplNDaxwUYXRoXNQh6QDeJSw5ubcv6BEyHQyB5GDjDV8W
         c+gg==
X-Forwarded-Encrypted: i=1; AJvYcCVpLkmxIyFmIOY7bXy9XaX8wR5IfrOlU1SdVvNAxKd7B5B6ZLIci9NDaGH0ETynuyYbGL8XtJ9yXldDCw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+kWFRVAsV9K+bNYt/+DjzTeAmK9ZLJ7CHRt+rnjEymUQGiWqn
	gcM/Agyc55y9aavQpTVvwWXxVqLeV6U4+Z9N8u9wHfuIkdyRO7anFukrfCRhXhhkfmaqlMawz2Q
	KIw==
X-Google-Smtp-Source: AGHT+IHRYlBrX6M+NH4TUGVEqm9BFtB7q+VVhXD5EoRBvSsXa42IiMZxJc+hXyxs+ZPnB8HLQQfXC/cdu0E=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:3858:0:b0:7e9:f93c:22b9 with SMTP id
 41be03b00d2f7-7eacc895cf2mr12508a12.10.1729537064143; Mon, 21 Oct 2024
 11:57:44 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:57:42 -0700
In-Reply-To: <ZxYrYe/WN8XoB+fI@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <20241010182427.1434605-52-seanjc@google.com>
 <ZxYrYe/WN8XoB+fI@yzhao56-desk.sh.intel.com>
Message-ID: <ZxakJr_jWkU-Y54e@google.com>
Subject: Re: [PATCH v13 51/85] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
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
	"Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_115747_015067_E7B77B9B 
X-CRM114-Status: GOOD (  23.78  )
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

T24gTW9uLCBPY3QgMjEsIDIwMjQsIFlhbiBaaGFvIHdyb3RlOgo+IE9uIFRodSwgT2N0IDEwLCAy
MDI0IGF0IDExOjIzOjUzQU0gLTA3MDAsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gPiBV
c2UgX19rdm1fZmF1bHRpbl9wYWdlKCkgZ2V0IHRoZSBBUElDIGFjY2VzcyBwYWdlIHNvIHRoYXQg
S1ZNIGNhbgo+ID4gcHJlY2lzZWx5IHJlbGVhc2UgdGhlIHJlZmNvdW50ZWQgcGFnZSwgaS5lLiB0
byByZW1vdmUgeWV0IGFub3RoZXIgdXNlcgo+ID4gb2Yga3ZtX3Bmbl90b19yZWZjb3VudGVkX3Bh
Z2UoKS4gIFdoaWxlIHRoZSBwYXRoIGlzbid0IGhhbmRsaW5nIGEgZ3Vlc3QKPiA+IHBhZ2UgZmF1
bHQsIHRoZSBzZW1hbnRpY3MgYXJlIGVmZmVjdGl2ZWx5IHRoZSBzYW1lOyBLVk0ganVzdCBoYXBw
ZW5zIHRvCj4gPiBiZSBtYXBwaW5nIHRoZSBwZm4gaW50byBhIFZNQ1MgZmllbGQgaW5zdGVhZCBv
ZiBhIHNlY29uZGFyeSBNTVUuCj4gPiAKPiA+IFRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4
LmJlbm5lZUBsaW5hcm8ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNv
biA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gPiAtLS0KCi4uLgoKPiA+IEBAIC02ODM4LDEwICs2ODQw
LDEzIEBAIHZvaWQgdm14X3NldF9hcGljX2FjY2Vzc19wYWdlX2FkZHIoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQo+ID4gIAkJdm1jc193cml0ZTY0KEFQSUNfQUNDRVNTX0FERFIsIHBmbl90b19ocGEo
cGZuKSk7Cj4gPiAgCj4gPiAgCS8qCj4gPiAtCSAqIERvIG5vdCBwaW4gYXBpYyBhY2Nlc3MgcGFn
ZSBpbiBtZW1vcnksIHRoZSBNTVUgbm90aWZpZXIKPiA+IC0JICogd2lsbCBjYWxsIHVzIGFnYWlu
IGlmIGl0IGlzIG1pZ3JhdGVkIG9yIHN3YXBwZWQgb3V0Lgo+ID4gKwkgKiBEbyBub3QgcGluIHRo
ZSBBUElDIGFjY2VzcyBwYWdlIGluIG1lbW9yeSBzbyB0aGF0IGl0IGNhbiBiZSBmcmVlbHkKPiA+
ICsJICogbWlncmF0ZWQsIHRoZSBNTVUgbm90aWZpZXIgd2lsbCBjYWxsIHVzIGFnYWluIGlmIGl0
IGlzIG1pZ3JhdGVkIG9yCj4gPiArCSAqIHN3YXBwZWQgb3V0LiAgS1ZNIGJhY2tzIHRoZSBtZW1z
bG90IHdpdGggYW5vbnltb3VzIG1lbW9yeSwgdGhlIHBmbgo+ID4gKwkgKiBzaG91bGQgYWx3YXlz
IHBvaW50IGF0IGEgcmVmY291bnRlZCBwYWdlIChpZiB0aGUgcGZuIGlzIHZhbGlkKS4KPiA+ICAJ
ICovCj4gPiAtCWt2bV9yZWxlYXNlX3Bmbl9jbGVhbihwZm4pOwo+ID4gKwlpZiAoIVdBUk5fT05f
T05DRSghcmVmY291bnRlZF9wYWdlKSkKPiA+ICsJCWt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4ocmVm
Y291bnRlZF9wYWdlKTsKPiBXaHkgaXQncyBub3QKPiBpZiAoIVdBUk5fT05fT05DRSghcmVmY291
bnRlZF9wYWdlKSkgewo+IAlpZiAod3JpdGFibGUpCj4gCQlrdm1fcmVsZWFzZV9wYWdlX2RpcnR5
KHJlZmNvdW50ZWRfcGFnZSkKPiAJZWxzZQo+IAkJa3ZtX3JlbGVhc2VfcGFnZV9jbGVhbihyZWZj
b3VudGVkX3BhZ2UpCj4gfQo+IAo+IG9yIHNpbXBseSBub3QgcGFzcyAid3JpdGFibGUiIHRvIF9f
a3ZtX2ZhdWx0aW5fcGZuKCkgYXMgd2Uga25vdyB0aGUgc2xvdCBpcwo+IG5vdCByZWFkLW9ubHkg
YW5kIHRoZW4gc2V0IGRpcnR5ID8KCl9fa3ZtX2ZhdWx0aW5fcGZuKCkgcmVxdWlyZXMgYSBub24t
TlVMTCBAd3JpdGFibGUuICBUaGUgaW50ZW50IGlzIHRvIGhlbHAgZW5zdXJlCnRoZSBjYWxsZXIg
aXMgYWN0dWFsbHkgY2hlY2tpbmcgd2hldGhlciBhIHJlYWRhYmxlIHZzLiB3cml0YWJsZSBtYXBw
aW5nIHdhcwphY3F1aXJlZC4gIEZvciBjYXNlcyB0aGF0IGV4cGxpY2l0bHkgcGFzcyBGT0xMX1dS
SVRFLCBpdCdzIGF3a3dhcmQsIGJ1dCB0aG9zZQpzaG91bGQgYmUgZmV3IGFuZCBmYXIgYmV0d2Vl
bi4KCj4gaWYgKCFXQVJOX09OX09OQ0UoIXJlZmNvdW50ZWRfcGFnZSkpCj4gCWt2bV9yZWxlYXNl
X3BhZ2VfZGlydHkocmVmY291bnRlZF9wYWdlKQoKWWEsIHRoaXMgaXMgcHJvYmFibHkgbW9yZSBj
b3JyZWN0PyAgVGhvdWdoIEkgd291bGQgc3Ryb25nbHkgcHJlZmVyIHRvIG1ha2UgYW55CmNoYW5n
ZSBpbiBiZWhhdmlvciBvbiB0b3Agb2YgdGhpcyBzZXJpZXMuICBUaGUgdXNlIG9mIGt2bV9yZWxl
YXNlX3BhZ2VfY2xlYW4oKQp3YXMgYWRkZWQgYnkgY29tbWl0IDg3ODk0MGIzM2Q3NiAoIktWTTog
Vk1YOiBSZXRyeSBBUElDLWFjY2VzcyBwYWdlIHJlbG9hZCBpZgppbnZhbGlkYXRpb24gaXMgaW4t
cHJvZ3Jlc3MiKSwgYW5kIEkgc3VzcGVjdCB0aGUgb25seSByZWFzb24gaXQgYWRkZWQgdGhlCmt2
bV9zZXRfcGFnZV9hY2Nlc3NlZCgpIGNhbGwgaXMgYmVjYXVzZSB0aGVyZSB3YXMgbm8gInVudXNl
ZCIgdmFyaWFudC4gIEkuZS4gdGhlcmUKd2FzIG5vIGNvbmNpb3VzIGRlY2lzaW9uIHRvIHNldCBB
Y2Nlc3NlZCBidXQgbm90IERpcnR5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
