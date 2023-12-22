Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52CFC4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpBgfEU4Z9BEy2IQoDgMmEy6uv5OtA518txCkw78Yts=; b=FJRQqcQpuXXABY
	nTZYO5j3Nc3bGstbw6rLtZkK9poW+QD3LzkU3oJeYvDFwQ1l76sCY7QzbeWcANxQyHqBIB5M0YqZM
	/lVeS3ZMPVuFLwbe+4HcxfS4/ZIS+4NxeOHaLbp/tqKvBN1R2RQ2cYYPyWFDc3iDREEZJ6OnjRKoI
	+O5yOQ4UwvTPJFY0uhPyx78XWXB3/coR9Wx0RM5AsBu/gmdMSO3TF7lQNaKXPMnSvlc4VmQvcDs8f
	lfXLya8NyY4tr0QCWp+pVgFBVaJV1Aynwoxo0I1O+JIdrwtke81b8PZWkvRXWsL3Dytg/Qsrp7iQK
	GQaYV8uFpPgsehyCaB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdaJ-005f4x-0L;
	Fri, 22 Dec 2023 11:20:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdaG-005f4B-0M
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 11:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CF0EDB8227B
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 11:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE6BC433C9
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703244049;
	bh=VyOf0Nbm3eElcobcOdq0RIskLo4Ccvqk/gGgSWsd0Ec=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B/uUWFPkoXZAriI8VSvKQWlcAu38i2HNMHne6Q7pWbHNRtVu9hAkTWoomJtHF40gN
	 gkVKQGd84Ri994M8KJ3F58/CeFBkV2fxc8cS5KtX/dfVIFfvvPjWnfuRF3DYlFWIzb
	 3N7vgTiziO63zUTPlw9x2s3dNxPeKGPZRquRva77oA4X9UyXqjg+bEOWKEjEuKOT88
	 9H2vhUsSpuzdHjikz3ehvq9ltcCxulVphnYmjowwbQJqtfiCRAg5NPSjl91rZk+IQC
	 FsPX9IIlW7l0ifXpmG4wFP8tulZShu71fuJHBe5V4mipxu1zYrYdAzD7D4a/NpzA44
	 86Bnw/AwHZ+gQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a2339262835so192789366b.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 03:20:49 -0800 (PST)
X-Gm-Message-State: AOJu0YyQZs3H+E22+9aakeKIK09sngV+5hDnEFs76XT3Lpe4lAOMw/6K
	UevktVX++u4yxSXtJMYeU5jTrl8WhbtAKSmxsOo=
X-Google-Smtp-Source: AGHT+IH9Ax5gaGTljfFnsV4S+ecgjXZzoRp5b+AUpaKM3FR0Ld4GSciGJygXOpZXIE5wXJ5iU/9ljTazK/ew/Y/FecQ=
X-Received: by 2002:a17:906:51cf:b0:a19:a19b:78cf with SMTP id
 v15-20020a17090651cf00b00a19a19b78cfmr695212ejk.146.1703244047649; Fri, 22
 Dec 2023 03:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20231222074605.452452-1-leobras@redhat.com> <20231222074605.452452-4-leobras@redhat.com>
In-Reply-To: <20231222074605.452452-4-leobras@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 19:20:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSdrGhAihjYSn_9u8_Yup86GgLDELZSmHnYRc5K1BESBA@mail.gmail.com>
Message-ID: <CAJF2gTSdrGhAihjYSn_9u8_Yup86GgLDELZSmHnYRc5K1BESBA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] riscv: Introduce is_compat_thread() into compat.h
To: Leonardo Bras <leobras@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Greg Ungerer <gerg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, David Hildenbrand <david@redhat.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_032052_415182_E4CD95B0 
X-CRM114-Status: GOOD (  22.55  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMzo0N+KAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiB0YXNrX3VzZXJfcmVnc2V0X3ZpZXcoKSBtYWtlcyB1c2Ug
b2YgYSBmdW5jdGlvbiB2ZXJ5IHNpbWlsYXIgdG8KPiBpc19jb21wYXRfdGFzaygpLCBidXQgcG9p
bnRpbmcgdG8gYSBhbnkgdGhyZWFkLgo+Cj4gSW4gYXJtNjQgYXNtL2NvbXBhdC5oIHRoZXJlIGlz
IGEgZnVuY3Rpb24gdmVyeSBzaW1pbGFyIHRvIHRoYXQ6Cj4gaXNfY29tcGF0X3RocmVhZChzdHJ1
Y3QgdGhyZWFkX2luZm8gKnRocmVhZCkKPgo+IENvcHkgdGhpcyBmdW5jdGlvbiB0byByaXNjdiBh
c20vY29tcGF0LmggYW5kIG1ha2UgdXNlIG9mIGl0IGludG8KPiB0YXNrX3VzZXJfcmVnc2V0X3Zp
ZXcoKS4KPgo+IEFsc28sIGludHJvZHVjZSBhIGNvbXBpbGUtdGltZSB0ZXN0IGZvciBDT05GSUdf
Q09NUEFUIGFuZCBzaW1wbGlmeSB0aGUKPiBmdW5jdGlvbiBjb2RlIGJ5IHJlbW92aW5nIHRoZSAj
aWZkZWYuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJlZGhhdC5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmggfCA4ICsrKysrKysr
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jICAgICAgfCA2ICsrKy0tLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY29tcGF0LmgKPiBpbmRleCA5MTUxN2I1MWI4ZTI3Li5kYTRiMjhjZDAxYTk1IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmgKPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NvbXBhdC5oCj4gQEAgLTIwLDYgKzIwLDE0IEBAIHN0YXRpYyBpbmxpbmUg
aW50IGlzX2NvbXBhdF90YXNrKHZvaWQpCj4gICAgICAgICByZXR1cm4gdGVzdF90aHJlYWRfZmxh
ZyhUSUZfMzJCSVQpOwo+ICB9Cj4KPiArc3RhdGljIGlubGluZSBpbnQgaXNfY29tcGF0X3RocmVh
ZChzdHJ1Y3QgdGhyZWFkX2luZm8gKnRocmVhZCkKPiArewo+ICsgICAgICAgaWYgKCFJU19FTkFC
TEVEKENPTkZJR19DT01QQVQpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKV2UgYWxzbyBj
b3VsZCBwdXQgdGhpcyBpbnRvIGlzX2NvbXBhdF90YXNrKCkuCgo+ICsKPiArICAgICAgIHJldHVy
biB0ZXN0X3RpX3RocmVhZF9mbGFnKHRocmVhZCwgVElGXzMyQklUKTsKPiArfQo+ICsKPiAgc3Ry
dWN0IGNvbXBhdF91c2VyX3JlZ3Nfc3RydWN0IHsKPiAgICAgICAgIGNvbXBhdF91bG9uZ190IHBj
Owo+ICAgICAgICAgY29tcGF0X3Vsb25nX3QgcmE7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3B0cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiBpbmRleCAyYWZl
NDYwZGUxNmE2Li5mMzYyODMyMTIzNjE2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3B0cmFjZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiBAQCAtMzc0LDE0
ICszNzQsMTQgQEAgbG9uZyBjb21wYXRfYXJjaF9wdHJhY2Uoc3RydWN0IHRhc2tfc3RydWN0ICpj
aGlsZCwgY29tcGF0X2xvbmdfdCByZXF1ZXN0LAo+Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9
Cj4gKyNlbHNlCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdXNlcl9yZWdzZXRfdmlldyBjb21wYXRf
cmlzY3ZfdXNlcl9uYXRpdmVfdmlldyA9IHt9Owo+ICAjZW5kaWYgLyogQ09ORklHX0NPTVBBVCAq
Lwo+Cj4gIGNvbnN0IHN0cnVjdCB1c2VyX3JlZ3NldF92aWV3ICp0YXNrX3VzZXJfcmVnc2V0X3Zp
ZXcoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQo+ICB7Cj4gLSNpZmRlZiBDT05GSUdfQ09NUEFU
Cj4gLSAgICAgICBpZiAodGVzdF90c2tfdGhyZWFkX2ZsYWcodGFzaywgVElGXzMyQklUKSkKPiAr
ICAgICAgIGlmIChpc19jb21wYXRfdGhyZWFkKCZ0YXNrLT50aHJlYWRfaW5mbykpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiAmY29tcGF0X3Jpc2N2X3VzZXJfbmF0aXZlX3ZpZXc7Cj4gICAgICAg
ICBlbHNlCj4gLSNlbmRpZgo+ICAgICAgICAgICAgICAgICByZXR1cm4gJnJpc2N2X3VzZXJfbmF0
aXZlX3ZpZXc7Cj4gIH0KPiAtLQo+IDIuNDMuMAo+CkxHVE0KClJldmlld2VkLWJ5OiBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
