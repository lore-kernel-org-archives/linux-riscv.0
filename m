Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91055C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 06:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfQY//fJoRemt5gFg5XZLA5dtV4PplP77+39Nt0nN3Y=; b=EJvnhqwHvhhzff
	43MZNau+X+0XmAZpIAXeYiicyzssRv/xkDIU/0YjfvG5/KV7kuiEh+gEOF37+r9k+wa9b+OiNEQHz
	cA1VrxJddv6WEpZ5YoV0sfzZ+7NdSdnTt8QGdJJOzQ7gs1nEyJq0rXcOa393UlqljU+BlCCexz8Zq
	ZyU8ZnzmaLy7EiXTtteeV+aLv5ZXl5hywQxoz+7QiPls+lKKDconcAxMZjXflVr2bJo0UCH1NZC1L
	r9nw3fgGr8S1PIy+PvN3R6VkEfRXfTieY9PiGLm3pW2kmqxbUzeGjb7w5N2BDgG1tj01PLL+UYcfD
	hnvqIGo0IXb92Kh64GFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDeqJ-00Gut6-0O;
	Thu, 14 Dec 2023 06:05:07 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDeqE-00Guqt-1c
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 06:05:05 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ce94f62806so4457780b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 22:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702533901; x=1703138701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvVjokEhJRkgiYQ+o9OaV0HA0xI9C7Xt69a6c2d+FcQ=;
        b=TvKVxbQYrkf1ufcmtyAi1k1y1KP2G8Si9nXrtSamzCnVmAZ3/vnM/O+A1pMWD32sOk
         eIjZcQt34qwOsSWjScjoNSQpLPT7fXvsHFjBfc+LKNn26ox/SYTmmwaFDBEjbpcUVyiS
         8Ls6am5KvEHnvhr5Mnymc9z0EpBf8BCzED+2GDK7iV/mcGNXp03BcxMzeaHl37xX9ZS9
         b9T6GyN6KG6YyAu4hXGxJRQMs19n4UOz89E1c6ltIqzl3BvqOzPYMnf1KWGCSdA3rg15
         AKg/FL3MDCB+4W/3BOQRAb0LaHiIMS3MgvSZj6ZNvg2c79uW5e/RutDMHuMgx24J9NK5
         7BjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702533901; x=1703138701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvVjokEhJRkgiYQ+o9OaV0HA0xI9C7Xt69a6c2d+FcQ=;
        b=q+qWKwz16j15+jtaQLzawSvzkHS+6RARO1ktOzxeEXTBLFW4/o8SPvI3yrkxMizNy/
         zFEhXMBHMZQwwL5ENnob/D9335S/IgIgXIaFmTgM/MJYqMD/sobTpmbEQpFbHWrEac5s
         LzVyu+nKFJo8q8PLjqjTbdhCuoktJZx9xtVxwI0HawZl5q30pqKvDbIbKnazk55LepyL
         eX9xXv1gYeCagkjuq5MbnaE3dMAXP65xKjPrmVFmLuqUtJVJZqetmDPkEnQMCqeUomFH
         v7HNhC7FsHKE+f3d18YVZxZ6BPrXV1Ufr5DLE3SvuMxExfeHekr2iI71Di6FekhzwyK+
         V5Ow==
X-Gm-Message-State: AOJu0YyEFNHzbSnXgMaJhkqr8Ivi3o/1a6rb9V+t0W/REJzITa72LNYH
	MJm7bvcM3vOT1WOX8XAbCZGlSOv6KLKZjDWBJOv2gA==
X-Google-Smtp-Source: AGHT+IHIasKoIhsfkj7Yu+FMUSkaxjPll3cuawBTpXD75vrutVj6NpINC37M3K8JiCCZ1y7ffegWrPb57ZwkbEZ9v2I=
X-Received: by 2002:a17:90a:e395:b0:286:bfed:6f55 with SMTP id
 b21-20020a17090ae39500b00286bfed6f55mr4390822pjz.38.1702533901140; Wed, 13
 Dec 2023 22:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-20-seanjc@google.com>
In-Reply-To: <20230916003118.2540661-20-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 11:34:49 +0530
Message-ID: <CAAhSdy1bzQ2mxOew0iw-OuLWxzOhk3LtO+908TYw2gw+5yN3RA@mail.gmail.com>
Subject: Re: [PATCH 19/26] KVM: Standardize include paths across all architectures
To: Sean Christopherson <seanjc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_220502_540343_35D3F096 
X-CRM114-Status: GOOD (  17.73  )
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

T24gU2F0LCBTZXAgMTYsIDIwMjMgYXQgNjowMeKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IFN0YW5kYXJkaXplIEtWTSdzIGluY2x1ZGUgcGF0
aHMgYWNyb3NzIGFsbCBhcmNoaXRlY3R1cmVzIGJ5IGRlY2xhcmluZwo+IHRoZSBLVk0tc3BlY2lm
aWMgaW5jbHVkZXMgaW4gdGhlIGNvbW1vbiBNYWtlZmlsZS5rdm0uICBIYXZpbmcgY29tbW9uIEtW
TQo+ICJvd24iIHRoZSBpbmNsdWRlZCBwYXRocyByZWR1Y2VzIHRoZSB0ZW1wdGF0aW9uIHRvIHVu
bmVjZXNzYXJpbHkgYWRkCj4gdmlydC9rdm0gdG8gYXJjaCBpbmNsdWRlIHBhdGhzLCBhbmQgY29u
dmVyc2VseSBpZiBhbGxvd2luZyBhcmNoIGNvZGUgdG8KPiBncmFiIGhlYWRlcnMgZnJvbSB2aXJ0
L2t2bSBiZWNvbWVzIGRlc2lyYWJsZSwgdmlydC9rdm0gY2FuIGJlIGFkZGVkIHRvCj4gYWxsIGFy
Y2hpdGVjdHVyZSdzIGluY2x1ZGUgcGF0aCB3aXRoIGEgc2luZ2xlIGxpbmUgdXBkYXRlLgo+Cj4g
SGF2aW5nIHRoZSBjb21tb24gS1ZNIG1ha2VmaWxlIGFwcGVuZCB0byBjY2ZsYWdzIGFsc28gcHJv
dmlkZXMgYQo+IGNvbnZlbmllbnQgbG9jYXRpb24gdG8gYXBwZW5kIG90aGVyIHRoaW5ncywgZS5n
LiBLVk0tc3BlY2lmaWMgI2RlZmluZXMuCj4KPiBOb3RlLCB0aGlzIGNoYW5nZXMgdGhlIGJlaGF2
aW9yIG9mIHMzOTAgYW5kIFBQQywgYXMgczM5MCBhbmQgUFBDCj4gcHJldmlvdXNseSBvdmVyd3Jv
dGUgY2NmbGFncy15IGluc3RlYWQgb2YgYWRkaW5nIG9uLiAgVGhlcmUgaXMgbm8gZXZpZGVuY2UK
PiB0aGF0IG92ZXJ3cml0aW5nIGNjZmxhZ3MteSB3YXMgbmVjZXNzYXJ5IG9yIGV2ZW4gZGVsaWJl
cmF0ZSwgYXMgYm90aCBzMzkwCj4gYW5kIFBQQyBzd2l0Y2hlZCB0byB0aGUgb3ZlcndyaXRlIGJl
aGF2aW9yIHdpdGhvdXQgc28gbXVjaCBhcyBhIHBhc3NpbmcKPiBtZW50aW9uIHdoZW4gRVhUUkFf
Q0ZMQUdTIHdhcyByZXBsYWNlZCB3aXRoIGNjZmxhZ3MteSAoY29tbWl0IGM3MzAyOGEwMjg4Nwo+
ICgiczM5MDogY2hhbmdlIHRvIG5ldyBmbGFnIHZhcmlhYmxlIikgYW5kIGNvbW1pdCA0MTA4ZDli
YTkwOTEKPiAoInBvd2VycGMvTWFrZWZpbGVzOiBDaGFuZ2UgdG8gbmV3IGZsYWcgdmFyaWFibGVz
IikpLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2ds
ZS5jb20+CgpGb3IgS1ZNIFJJU0MtVjoKQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL2FybTY0L2t2bS9NYWtlZmls
ZSAgIHwgMiAtLQo+ICBhcmNoL21pcHMva3ZtL01ha2VmaWxlICAgIHwgMiAtLQo+ICBhcmNoL3Bv
d2VycGMva3ZtL01ha2VmaWxlIHwgMiAtLQo+ICBhcmNoL3Jpc2N2L2t2bS9NYWtlZmlsZSAgIHwg
MiAtLQo+ICBhcmNoL3MzOTAva3ZtL01ha2VmaWxlICAgIHwgMiAtLQo+ICBhcmNoL3g4Ni9rdm0v
TWFrZWZpbGUgICAgIHwgMSAtCj4gIHZpcnQva3ZtL01ha2VmaWxlLmt2bSAgICAgfCAyICsrCj4g
IDcgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2t2bS9NYWtlZmlsZSBiL2FyY2gvYXJtNjQva3ZtL01ha2Vm
aWxlCj4gaW5kZXggYzBjMDUwZTUzMTU3Li4zOTk2NDg5YmFlZWYgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9hcm02NC9rdm0vTWFrZWZpbGUKPiArKysgYi9hcmNoL2FybTY0L2t2bS9NYWtlZmlsZQo+IEBA
IC0zLDggKzMsNiBAQAo+ICAjIE1ha2VmaWxlIGZvciBLZXJuZWwtYmFzZWQgVmlydHVhbCBNYWNo
aW5lIG1vZHVsZQo+ICAjCj4KPiAtY2NmbGFncy15ICs9IC1JICQoc3JjdHJlZSkvJChzcmMpCj4g
LQo+ICBpbmNsdWRlICQoc3JjdHJlZSkvdmlydC9rdm0vTWFrZWZpbGUua3ZtCj4KPiAgb2JqLSQo
Q09ORklHX0tWTSkgKz0ga3ZtLm8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2t2bS9NYWtlZmls
ZSBiL2FyY2gvbWlwcy9rdm0vTWFrZWZpbGUKPiBpbmRleCA5NmE3Y2QyMWIxNDAuLmQxOThlMWFk
ZGVhNyAxMDA2NDQKPiAtLS0gYS9hcmNoL21pcHMva3ZtL01ha2VmaWxlCj4gKysrIGIvYXJjaC9t
aXBzL2t2bS9NYWtlZmlsZQo+IEBAIC00LDggKzQsNiBAQAo+Cj4gIGluY2x1ZGUgJChzcmN0cmVl
KS92aXJ0L2t2bS9NYWtlZmlsZS5rdm0KPgo+IC1jY2ZsYWdzLXkgKz0gLUlhcmNoL21pcHMva3Zt
Cj4gLQo+ICBrdm0tJChDT05GSUdfQ1BVX0hBU19NU0EpICs9IG1zYS5vCj4KPiAga3ZtLXkgKz0g
ICAgbWlwcy5vIGVtdWxhdGUubyBlbnRyeS5vIFwKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2t2bS9NYWtlZmlsZSBiL2FyY2gvcG93ZXJwYy9rdm0vTWFrZWZpbGUKPiBpbmRleCAwOGEwZTUz
ZDU4YzcuLmQ2YzY2NzhkZGY2NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bvd2VycGMva3ZtL01ha2Vm
aWxlCj4gKysrIGIvYXJjaC9wb3dlcnBjL2t2bS9NYWtlZmlsZQo+IEBAIC0zLDggKzMsNiBAQAo+
ICAjIE1ha2VmaWxlIGZvciBLZXJuZWwtYmFzZWQgVmlydHVhbCBNYWNoaW5lIG1vZHVsZQo+ICAj
Cj4KPiAtY2NmbGFncy15IDo9IC1JYXJjaC9wb3dlcnBjL2t2bQo+IC0KPiAgaW5jbHVkZSAkKHNy
Y3RyZWUpL3ZpcnQva3ZtL01ha2VmaWxlLmt2bQo+Cj4gIGNvbW1vbi1vYmpzLXkgKz0gcG93ZXJw
Yy5vIGVtdWxhdGVfbG9hZHN0b3JlLm8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vTWFr
ZWZpbGUgYi9hcmNoL3Jpc2N2L2t2bS9NYWtlZmlsZQo+IGluZGV4IDRjMjA2N2ZjNTlmYy4uZmY3
ZDVmNjdlMjI5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL01ha2VmaWxlCj4gKysrIGIv
YXJjaC9yaXNjdi9rdm0vTWFrZWZpbGUKPiBAQCAtMyw4ICszLDYgQEAKPiAgIyBNYWtlZmlsZSBm
b3IgUklTQy1WIEtWTSBzdXBwb3J0Cj4gICMKPgo+IC1jY2ZsYWdzLXkgKz0gLUkgJChzcmN0cmVl
KS8kKHNyYykKPiAtCj4gIGluY2x1ZGUgJChzcmN0cmVlKS92aXJ0L2t2bS9NYWtlZmlsZS5rdm0K
Pgo+ICBvYmotJChDT05GSUdfS1ZNKSArPSBrdm0ubwo+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAv
a3ZtL01ha2VmaWxlIGIvYXJjaC9zMzkwL2t2bS9NYWtlZmlsZQo+IGluZGV4IGYxNzI0OWFiMmE3
Mi4uZjgxNTMxODllMDAzIDEwMDY0NAo+IC0tLSBhL2FyY2gvczM5MC9rdm0vTWFrZWZpbGUKPiAr
KysgYi9hcmNoL3MzOTAva3ZtL01ha2VmaWxlCj4gQEAgLTUsOCArNSw2IEBACj4KPiAgaW5jbHVk
ZSAkKHNyY3RyZWUpL3ZpcnQva3ZtL01ha2VmaWxlLmt2bQo+Cj4gLWNjZmxhZ3MteSA6PSAtSWFy
Y2gvczM5MC9rdm0KPiAtCj4gIGt2bS15ICs9IGt2bS1zMzkwLm8gaW50ZXJjZXB0Lm8gaW50ZXJy
dXB0Lm8gcHJpdi5vIHNpZ3Aubwo+ICBrdm0teSArPSBkaWFnLm8gZ2FjY2Vzcy5vIGd1ZXN0ZGJn
Lm8gdnNpZS5vIHB2Lm8KPgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vTWFrZWZpbGUgYi9h
cmNoL3g4Ni9rdm0vTWFrZWZpbGUKPiBpbmRleCA4MGUzZmUxODRkMTcuLmQxM2YxYTdiN2IzZCAx
MDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9rdm0vTWFrZWZpbGUKPiArKysgYi9hcmNoL3g4Ni9rdm0v
TWFrZWZpbGUKPiBAQCAtMSw2ICsxLDUgQEAKPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAo+Cj4gLWNjZmxhZ3MteSArPSAtSSAkKHNyY3RyZWUpL2FyY2gveDg2L2t2bQo+ICBj
Y2ZsYWdzLSQoQ09ORklHX0tWTV9XRVJST1IpICs9IC1XZXJyb3IKPgo+ICBpZmVxICgkKENPTkZJ
R19GUkFNRV9QT0lOVEVSKSx5KQo+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9NYWtlZmlsZS5rdm0g
Yi92aXJ0L2t2bS9NYWtlZmlsZS5rdm0KPiBpbmRleCAyOTM3M2I1OWQ4OWEuLmU4NTA3OWFkMjQ1
ZCAxMDA2NDQKPiAtLS0gYS92aXJ0L2t2bS9NYWtlZmlsZS5rdm0KPiArKysgYi92aXJ0L2t2bS9N
YWtlZmlsZS5rdm0KPiBAQCAtMyw2ICszLDggQEAKPiAgIyBNYWtlZmlsZSBmb3IgS2VybmVsLWJh
c2VkIFZpcnR1YWwgTWFjaGluZSBtb2R1bGUKPiAgIwo+Cj4gK2NjZmxhZ3MteSArPSAtSSQoc3Jj
dHJlZSkvJChzcmMpCj4gKwo+ICBLVk0gPz0gLi4vLi4vLi4vdmlydC9rdm0KPgo+ICBrdm0teSA6
PSAkKEtWTSkva3ZtX21haW4ubyAkKEtWTSkvZXZlbnRmZC5vICQoS1ZNKS9iaW5hcnlfc3RhdHMu
bwo+IC0tCj4gMi40Mi4wLjQ1OS5nZTRlMzk2ZmQ1ZS1nb29nCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
