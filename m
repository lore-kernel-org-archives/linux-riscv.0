Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A88DC982E6
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 16:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSxLp4UbakCHROXMdFYn4G22OlRRzrJD+qL+FV8R3oU=; b=O0XlOH1o8mFcJJ
	NYhQi3+y5tqOQbStGCjZ7ZVXfQ/5SbcKngx7haMaGwAlHFqCRX60bK1DYAk1EvKNHjC9NAjuEzFyC
	CvXRt+YnSA4LH2/ZFQ+K4tN6rUavUISnYWAOycVVllcylIpkdbpu98pvlRh9Id1O9f1HJxsaLrBXq
	WexWQqqalyC7huvji4Ewfv+2YPDnNEISnYFJt+FJNQ5IFbm+x+RAXFFg53KTVb8JZ0ssGmx8zlNO4
	DIM/UgAuGCdsmkGEFR0Oh51Vwu5Lv3BIH825FDXTCaWTeDkmVm3YqL15DFeW3lnrqZ4NI1TllLv6r
	GqfiEKJOrOQagpwus8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gpJ-00000002p5o-2QFd;
	Mon, 21 Sep 2026 16:25:09 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gpG-00000002p4q-1clq
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 16:25:08 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66e50968489so2929498d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 09:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790007903; cv=none;
        d=google.com; s=arc-20260327;
        b=kUXtQCQzy23DpXePn7xY5D6Gh7blVQWBlmwjURXAPNT6huNk3RnZtEhTJWjt5jXg/o
         B1NZutyUD7t851RGQCktf7yp0L0/A1T3LDVIFam0D91JWrBS7ajVHJi+vKN8bp/VhwVe
         ODp3ut7Sa5AM+3NZ47SVqDCMcybB4ajGBcUDKGIhIOerku4Ln3+vdedCzrslliRgjRNr
         3Xqy1HfmqGM6NvlOc2T80Ylns+0/oku1BuzIfPyAImBLJGuBVe5ljX/ZbNa2J1YUpIug
         pJsvM7ekI6vS17zhS1aS1D7xUd5jegqp98xnLuF0qGMe9/od+JrqS2VzVRcDM5amtjoL
         wOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FscOTKf6GX9LsYtYTRZ38iEWAQ8+A7NhnQp2GLbb0QM=;
        fh=mQKqlF6Hkyo/VnjVbsnXBpiFsmziMv7jUSZGI9wqX0w=;
        b=lyGTOTDEOEylgY07VPU38vHOZWm8apyqDezacZLqw70eXk+3jHv9scVN85//PJjYWr
         sAxYU1XkUjSmym8R0Qy9OB+8h8+Ru4ZyDxs5tKb5mV2VbsivFMjr5SBs+Xbn1xnWBfc3
         XPqN+fic5FQV/GvHeYwN3O1oxXk8Np2kse4QLvFIshyVvP464g0NSJJMguMIkcbvNJkO
         vTPM7wXi6jaK0tw85ucWdl2AIScY8TUGhcmHc1uipYHImoxLWcwW2ST9w44LCH7D9vXo
         o2QGqWSECHNgP9Cc8RRYf4hq3y69yP6xg6itj2tL5Mb37pt9g5U+2+3jpnpCcGGzOwPA
         Bgjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790007903; x=1790612703; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FscOTKf6GX9LsYtYTRZ38iEWAQ8+A7NhnQp2GLbb0QM=;
        b=nOkIAJ05xBaMKEYAnnykxSrZ13PiUGMZNssfdBvtWI7AtkvuYHovI/TdSzEHwaKqoq
         yPgdfZALLCKSd4A82jT1GaDuin/aCg24SLmkBpcmOLP0PLWEAHVvwcJRGOPHnm/8cBlc
         Sb28/l/oMAw1hSX8QMaEpFGAQfQ3uOuJOI9W4E5z2Y5QxBuEpCluBP7U2NIR0vI8wFTN
         xx0cuipEMlSitZE57BShAJNWwFVHNfvr1umj7KWWJqE8WWwUe/3Wfq3kXT5gpehTH8ss
         D+ycrieS6ta5PUC0pcAQalx3yCm0FrJhTrzJ9UPKXn/mwjHXRgMIocEHUTx6en13heoa
         EkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790007903; x=1790612703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FscOTKf6GX9LsYtYTRZ38iEWAQ8+A7NhnQp2GLbb0QM=;
        b=s09MqwAg13PhrGK+5kV5JiTu1GHfBGVw97c249leeLkxx8UszSYDOgJvboJtm3kPVH
         Z3p+XUEocya6gAFJ6gUOVfNlRftgiv9ELNMNUQBcSBVXmlJP8KyYpOZdsD1ucTkUXRZg
         8YJYRCx4ft3gHN5dj5/VA9JtJNqMfNDaWLJZMrA5VKW/3/vItFEgEZ4DYoCn/rJCDJDE
         hW2SHoFhmx63/RMsGX8xX7Nq2MAdyI1rdHw6VW84KVIEXTtvygDF72aMxhh0HcRvpuS4
         hdg9qm8A7kg/cfNvNkBH8CaFEtKSmsa01/MoFtL3i8uX6+jHElzKNDe5FlTNDiss7OfZ
         Oauw==
X-Forwarded-Encrypted: i=1; AKwUvBzPAwXmwtAIYluQM4I8QQ+l+dBpmz/8OiU9ZtwbqWci3SyG1E7UFlzDphXMjwjeZRHle7V6fKQUgh5SUw==@lists.infradead.org
X-Gm-Message-State: AFuF++nmgTTsAYgNi9gh01MeO/NAuE/QmK+AnfjhMd/dk9TXdjOi1kCe
	uIkd4D//lU9SNnbhIswdDdnRjoDVVgJtMPre7acFHAmC4CmVtPjLPKxqTtivBxLDbpXNhRj1T4r
	uOQ6dGhe6b0xZmNF5A13Z0jgE2hJOBpE=
X-Gm-Gg: AYBFou27WpPk88YZPcI8KK24/ho/3YHqia/fKoaOrfNqh/b1ZISeTrJcAV/peiL61Bw
	XqbyGJ8NQhFab5DzemO+5T+2qQGLFAo2LOtvUu4K1I9iIAMjcaWZ6F73v0EzLB9OMs13LvyvkyL
	zjTrMek2AEZcCuQS2XrbIJ59kkn0J7aN4Dec0F673kNZwLkwfWMH02cGLo+xh5cFMnMG58FxNyL
	2pSChNZt6nNVAzx+9UutBv52JfYRu3jT59eLlXQGxopsh0xfwHMe4Oninn06EbooQVQpAwbZ5R5
	oGcxKCUreBn/hW22ZaPfB54kB+qRQ9DDmxc9ZtLfXXsvRzIR1qe81ScYJyg74l5AJYDxHpgZkkm
	hsaP5KdrKJGaF1yzEDHbF5C8XHnWrG47fIH/7C9DjJnMtmMftHQhDLUBGPSIAieXFrK4n+mmR6z
	/J59bR6KWgaXSFju5Oe6laqs0=
X-Received: by 2002:a05:690e:c4e:b0:672:be40:5eaf with SMTP id
 956f58d0204a3-672be40629dmr713487d50.54.1790007902724; Mon, 21 Sep 2026
 09:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260904195132.141068-1-sidchintamaneni@gmail.com> <DLKORFKGW8D8.XVSVVIH3Q6Q@gmail.com>
In-Reply-To: <DLKORFKGW8D8.XVSVVIH3Q6Q@gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Mon, 21 Sep 2026 09:24:51 -0700
X-Gm-Features: AcwNN1VSvI94aKmDMDlc9C_7_9UyySkBSsqPddt2OeIwAs5C5fHNExBLC9Hitxg
Message-ID: <CAE5sdEgLFFcsQ8rpraQ4L-EvppqxUn+=ZdHFgker2Wd--EGL6g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 0/7] Fix timed may_goto with private stacks
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-riscv@lists.infradead.org, rlmenge@gmail.com, 
	hargar@linux.microsoft.com, apais@microsoft.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_092506_440595_AD33AD13 
X-CRM114-Status: GOOD (  18.06  )
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

PFNOSVA+Cgo+IEkgdGhpbmsgd2UgY2FuIGtlZXAgdGhpcyBmaXggbG9jYWwgdG8geDg2LiBXb3Vs
ZCBiZSBsZXNzIGNodXJuIGluIHRoZSBlbmQuCj4KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHg4NiBz
d2l0Y2hlcyB0aGUgQlBGIGZyYW1lIHBvaW50ZXIgZnJvbSBSQlAgdG8gUjkgZm9yCj4gcHJpdmF0
ZSBzdGFja3MsIGJ1dCB0aGUgdHJhbXBvbGluZSBzdGlsbCB1c2VzIFJCUC4gYXJtNjQgYW5kIHBv
d2VycGM2NCBrZWVwCj4gdXNpbmcgWDI1IGFuZCBSMzEgcmVzcGVjdGl2ZWx5IGZvciBib3RoIHN0
YWNrIG1vZGVzLCBzbyB0aGVpciB0cmFtcG9saW5lcwo+IGFscmVhZHkgdXNlIHRoZSByaWdodCBm
cmFtZSBwb2ludGVyLgo+Cj4gSW5zdGVhZCBvZiBjaGFuZ2luZyB0aGUgZ2VuZXJpYyBmaXh1cCwg
Y2FuIHdlIHJlc29sdmUgdGhlIHBvaW50ZXIgaW4gdGhlIHg4NiBKSVQKPiB3aGVuIGVtaXR0aW5n
IHRoZSBjYWxsIHRvIGFyY2hfYnBmX3RpbWVkX21heV9nb3RvKCk/IFdlIGFscmVhZHkga25vdyB3
aGV0aGVyCj4gcHJpdl9mcmFtZV9wdHIgaXMgc2V0IHRoZXJlLiBSMTAgY29udGFpbnMgdGhlIG9m
ZnNldCBwYXNzZWQgdGhyb3VnaCBCUEZfUkVHX0FYLAo+IHNvIHdlIGNhbiBlbWl0Ogo+Cj4gLyog
UHJpdmF0ZSBzdGFjayAqLwo+IGxlYXEgKCVyOSwgJXIxMCksICVyMTAKPgo+IC8qIE5vcm1hbCBz
dGFjayAqLwo+IGxlYXEgKCVyYnAsICVyMTApLCAlcjEwCj4KPiBUaGVuIHJlbW92ZSB0aGUgTEVB
IGZyb20gdGhlIHg4NiB0cmFtcG9saW5lLCBhcyBwYXRjaCAyIGFscmVhZHkgZG9lcy4KPgoKbWFr
ZSBzZW5zZSEgSSB0aG91Z2h0IHRoYXQgdGhlIHJlbWFpbmluZyBhcmNoJ3MgaGF2ZSBhIHNpbWls
YXIgcHJpdmF0ZQpzdGFja3MgYXBwcm9hY2ggdG8geDg2LiBJJ2xsIGdpdmUgaXQgYSB0cnkgYW5k
IHJlLXNwaW4gdGhlIHBhdGNoLgoKPiBUaGlzIGdpdmVzIGJwZl9jaGVja190aW1lZF9tYXlfZ290
bygpIHRoZSBzYW1lIGFkZHJlc3MgdXNlZCBieSB0aGUgZ2VuZXJhdGVkCj4gbG9hZHMgYW5kIHN0
b3JlczogdGhlIEJQRiBmcmFtZSBwb2ludGVyIHBsdXMgdGhlIGNvdW50ZXLigJlzIHN0YWNrIG9m
ZnNldC4gRm9yCj4gbm9ybWFsIHN0YWNrcywgd2UganVzdCBtb3ZlIHRoZSBleGlzdGluZyBjYWxj
dWxhdGlvbiBpbnRvIHRoZSBKSVQuIEZvciBwcml2YXRlCj4gc3RhY2tzLCB3ZSB1c2UgUjkgaW5z
dGVhZCBvZiBSQlAsIHdoaWNoIGZpeGVzIHRoZSBtaXNtYXRjaC4KPgo+IFRoZSBleGlzdGluZyBz
YXZlL3Jlc3RvcmUgb2YgUjkgYXJvdW5kIHRoZSBjYWxsIHNob3VsZCBzdGF5LiBXZSBhbHNvIGxl
YXZlIFJCUAo+IGFsb25lLCBzaW5jZSBpdCBpcyBzdGlsbCBuZWVkZWQgZm9yIHRoZSBuYXRpdmUg
ZnJhbWUgY2hhaW4gYW5kIHVud2luZGluZy4KPgo+IEkgaGF2ZW7igJl0IHRlc3RlZCB0aGlzIGFw
cHJvYWNoLCBzbyBpdCBzdGlsbCBuZWVkcyBjaGVja2luZyB3aXRoIGJvdGggbm9ybWFsIGFuZAo+
IHByaXZhdGUgc3RhY2tzLgo+Cj4gcHctYm90OiBjcgo+Cj4gPiBTaWRkaGFydGggQ2hpbnRhbWFu
ZW5pICg3KToKPiA+ICAgYnBmOiBGaXggdGltZWQgbWF5X2dvdG8gc3RhY2sgcG9pbnRlciBmb3Ig
cHJpdmF0ZSBzdGFja3MKPiA+ICAgYnBmLCB4ODY6IFVzZSByZXNvbHZlZCBwb2ludGVyIGZvciB0
aW1lZCBtYXlfZ290bwo+ID4gICBicGYsIGFybTY0OiBVc2UgcmVzb2x2ZWQgcG9pbnRlciBmb3Ig
dGltZWQgbWF5X2dvdG8KPiA+ICAgYnBmLCBwb3dlcnBjNjQ6IFVzZSByZXNvbHZlZCBwb2ludGVy
IGZvciB0aW1lZCBtYXlfZ290bwo+ID4gICBicGYsIHJpc2N2OiBVc2UgcmVzb2x2ZWQgcG9pbnRl
ciBmb3IgdGltZWQgbWF5X2dvdG8KPiA+ICAgYnBmLCBzMzkwOiBVc2UgcmVzb2x2ZWQgcG9pbnRl
ciBmb3IgdGltZWQgbWF5X2dvdG8KPiA+ICAgc2VsZnRlc3RzL2JwZjogVGVzdCB0aW1lZCBtYXlf
Z290byB3aXRoIHByaXZhdGUgc3RhY2tzCj4gPgo+ID4gIGFyY2gvYXJtNjQvbmV0L2JwZl90aW1l
ZF9tYXlfZ290by5TICAgICAgICAgICB8IDEyICsrLS0tLS0tCj4gPiAgYXJjaC9wb3dlcnBjL25l
dC9icGZfdGltZWRfbWF5X2dvdG8uUyAgICAgICAgIHwgIDggKystLS0KPiA+ICBhcmNoL3Jpc2N2
L25ldC9icGZfdGltZWRfbWF5X2dvdG8uUyAgICAgICAgICAgfCAxMyArKysrLS0tLQo+ID4gIGFy
Y2gvczM5MC9uZXQvYnBmX2ppdF9jb21wLmMgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0KPiA+
ICBhcmNoL3MzOTAvbmV0L2JwZl90aW1lZF9tYXlfZ290by5TICAgICAgICAgICAgfCAgOCArKy0t
LQo+ID4gIGFyY2gveDg2L25ldC9icGZfdGltZWRfbWF5X2dvdG8uUyAgICAgICAgICAgICB8ICA2
IC0tLS0KPiA+ICBrZXJuZWwvYnBmL2ZpeHVwcy5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxOSArKysrKystLS0tLS0KPiA+ICAuLi4vYnBmL3Byb2dzL3ZlcmlmaWVyX2JwZl9mYXN0Y2Fs
bC5jICAgICAgICAgfCAzMCArKysrKysrKysrLS0tLS0tLS0tCj4gPiAgLi4uL3NlbGZ0ZXN0cy9i
cGYvcHJvZ3MvdmVyaWZpZXJfbWF5X2dvdG9fMS5jIHwgMTcgKysrKysrLS0tLS0KPiA+ICAuLi4v
YnBmL3Byb2dzL3ZlcmlmaWVyX3ByaXZhdGVfc3RhY2suYyAgICAgICAgfCAxOSArKysrKysrKysr
KysKPiA+ICAxMCBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspLCA2MyBkZWxldGlvbnMo
LSkKPiA+Cj4gPgo+ID4gYmFzZS1jb21taXQ6IGQ3NjE5MzRjOTQ4M2VjZGU5M2ZlOTlkODcwNTI4
MmY3MTZkZmVlNTAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
