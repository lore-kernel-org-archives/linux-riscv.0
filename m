Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6964C4345F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 13:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/orOE5zpM+cwul4DmKkUYDAVI+A6Sa42vi+x94J1c0g=; b=s+k67toXXm0cG0R4nQHv+X9GJX
	c1a97X+59KT4S9+OKkXNGZujkoo1A59Z7Cj2jFqcmJqfetNGgGJA2cAKUCUL5YK9fYw6SixPBApqu
	4SM2ANxpU40nV6Iisro1+IVgYjQAjPa9+KIqgbqv1WtBniBCnaHR4/eU6JiRFd5ksgfXE1oXJWWxz
	ZYGJaP8j3f9/G3pJnezKeBPxUtyR45hqMsXO5VkbmiVow3s7oLoClMZVErkEh63UqSMNK51Q/lOyv
	Iu2+OcoQ/YE7ha/MiN30th48p5vP8GrzJpZeNV2HgHlaj5c78H6QfAZ9y5mdmsSrKP2Cn3peE2R0p
	TNX0xFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3Fqi-00000002C30-2yoz;
	Sat, 04 May 2024 13:54:48 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3Fqe-00000002C2I-2M32
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 13:54:46 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2BF583FE4E
	for <linux-riscv@lists.infradead.org>; Sat,  4 May 2024 13:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714830880;
	bh=0WjRr/tkWkr3Xh5WFmNS0edjBe9cmHkmJf/+9+FPMJg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=BB+6xw/uWxLkIzEvgENzaWGM8KqG7FVp0MsjiXSevEnYiZj5GAFm+YoYWWZhpZNBT
	 2f9IUJ+hU9HQaELEY/jrfxrGrjUnbP2JcRTDUDl+eszJMUXkmyC4xmrbxrO0ffW1m5
	 kjNhKaMU/LCMFowSnAPF8X+oJbEdio90phQby4Mzp+ej7Y6wLoYqjIdyd8ooIX0yL2
	 zN6C+x1QaQCcWgoGp0Nkh8aSrqQgpHKKpoXzISuMeAmdoiPVHVl/9sKmoL8i9RcnLl
	 GV0xWXuLOvZnkLKloR2qpHrPPykIyH7LIp3oo1sjDzfPk5NVA79szNzzkNevUBm/Ic
	 fNkkB32YHjv+g==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-439fe1c5facso8106301cf.0
        for <linux-riscv@lists.infradead.org>; Sat, 04 May 2024 06:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714830879; x=1715435679;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0WjRr/tkWkr3Xh5WFmNS0edjBe9cmHkmJf/+9+FPMJg=;
        b=kULmxD2cX/o4chAK5rQ/UIgey4tBH127ot3fZjZtBwyWCcgtgmCueBMQHmAwcB+imU
         OU7BJbCtAAPTxnISLkd66T4eu3OGlFjRgCOaceTrKaYLhv/QdrF+4MHp7OfBrY1zCEbj
         MMxOaMN0kfWgM5vNBblYW31YpXkleq8tW4OL7bWSaC6R5LoI6DkKJsB/MM667ap2kPoQ
         7vT/nk82jIly9y1GeQh3/sHi4zq4ny9qpLHdao/3Sidtp1Jxw8YXZEY82/5u2B2L0YWG
         k5aPPAETqa+9yaIQE8NEkDLVi7K2ED+fX4/xvq3hPYzC+sIz0xn8CbNfJylM56zesAKC
         sWMA==
X-Forwarded-Encrypted: i=1; AJvYcCXJOpGQjLhirLYTPEv9P9kC67OzLM0ZFw3ccvPMCIvP2NxF5koQkMJOzLOdaL/WpaLnLRpSI9Nz6FXdnhmh/ighZo9x3LmPkiGo6qjU/ZOK
X-Gm-Message-State: AOJu0YyS/uxH5LwZxvriXfAJVlBE9iL6XzW8HvFjhNrCnTftvjFizNl0
	lwgA4Mkbhn7+XEsCkD3AfcJfTgeaKFzDLUW648LVPiJttJe2VjB2Je7vogpNr4z4yYdBSP0HJTN
	tjj9p9T/97PA+baVdDy/DJrAdGAkyQSHaIUDytWI82B3Rn8BM2eM2rjFPyS3iCGkdYAA+g6fxDv
	+6POitESKpYoeVal7MWfWBqioxl8cqXxl9ULpuy2TNJ0Ebecijfxl7MXiS
X-Received: by 2002:a05:622a:296:b0:43a:b15c:e9cd with SMTP id z22-20020a05622a029600b0043ab15ce9cdmr5704940qtw.29.1714830878730;
        Sat, 04 May 2024 06:54:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgNUPmd8Omg8BY6DSgks9Q18f2l7AQMWWDiPcpdB91lbabuImXrnY7zD1n0VbloJMoBfZD97i+xKm67tXuC4k=
X-Received: by 2002:a05:622a:296:b0:43a:b15c:e9cd with SMTP id
 z22-20020a05622a029600b0043ab15ce9cdmr5704920qtw.29.1714830878391; Sat, 04
 May 2024 06:54:38 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 May 2024 13:54:37 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAK7LNASqwN1gd8TovcR3RDkxkE_M=BSDD5GoOoLOkDQnuNDAcA@mail.gmail.com>
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
 <20240502111613.1380453-2-emil.renner.berthing@canonical.com>
 <87ttjgcqjv.fsf@all.your.base.are.belong.to.us> <CAK7LNASqwN1gd8TovcR3RDkxkE_M=BSDD5GoOoLOkDQnuNDAcA@mail.gmail.com>
Mime-Version: 1.0
Date: Sat, 4 May 2024 13:54:37 +0000
Message-ID: <CAJM55Z-dorP1MgiCu=+VV_D+b6XXKWacUjT04QAsKvdmQtNv3g@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] riscv: make image compression configurable
To: Masahiro Yamada <masahiroy@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_065445_018879_5319B45A 
X-CRM114-Status: GOOD (  24.38  )
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

TWFzYWhpcm8gWWFtYWRhIHdyb3RlOgo+IE9uIFRodSwgTWF5IDIsIDIwMjQgYXQgMTA6MDXigK9Q
TSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBFbWlsIFJl
bm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4gd3JpdGVz
Ogo+ID4KPiA+ID4gUHJldmlvdXNseSB0aGUgYnVpbGQgcHJvY2VzcyB3b3VsZCBhbHdheXMgc2V0
IEtCVUlMRF9JTUFHRSB0byB0aGUKPiA+ID4gdW5jb21wcmVzc2VkIEltYWdlIGZpbGUgKHVubGVz
cyBYSVBfS0VSTkVMIG9yIEVGSV9aQk9PVCB3YXMgZW5hYmxlZCkgYW5kCj4gPiA+IHVuY29uZGl0
aW9uYWxseSBjb21wcmVzcyBpdCBpbnRvIEltYWdlLmd6LiBIb3dldmVyIHRoZXJlIGFyZSBhbHJl
YWR5Cj4gPiA+IGJ1aWxkIHRhcmdldHMgZm9yIEltYWdlLmJ6MiwgSW1hZ2UubHo0LCBJbWFnZS5s
em1hLCBJbWFnZS5sem8gYW5kCj4gPiA+IEltYWdlLnpzdGQsIHNvIGxldCdzIG1ha2UgdXNlIG9m
IHRob3NlLCBtYWtlIHRoZSBjb21wcmVzc2lvbiBtZXRob2QKPiA+ID4gY29uZmlndXJhYmxlIGFu
ZCBzZXQgS0JVSUxEX0lNQUdFIGFjY29yZGluZ2x5IHNvIHRoYXQgdGFyZ2V0cyBsaWtlCj4gPiA+
ICdtYWtlIGluc3RhbGwnIGFuZCAnbWFrZSBiaW5kZWItcGtnJyB3aWxsIHVzZSB0aGUgY2hvc2Vu
IGltYWdlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8
ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNo
L3Jpc2N2L0tjb25maWcgICAgICAgICB8ICA3ICsrKysrKysKPiA+ID4gIGFyY2gvcmlzY3YvTWFr
ZWZpbGUgICAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0K
PiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9pbnN0YWxsLnNoIHwgIDkgKysrKystLS0KPiA+ID4gIDMg
ZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCj4gPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiA+ID4gaW5kZXggYmUwOWM4ODM2ZDU2Li42YzA5MmQxZWE3ZGIgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4g
QEAgLTEzOCw2ICsxMzgsMTMgQEAgY29uZmlnIFJJU0NWCj4gPiA+ICAgICAgIHNlbGVjdCBIQVZF
X0dDQ19QTFVHSU5TCj4gPiA+ICAgICAgIHNlbGVjdCBIQVZFX0dFTkVSSUNfVkRTTyBpZiBNTVUg
JiYgNjRCSVQKPiA+ID4gICAgICAgc2VsZWN0IEhBVkVfSVJRX1RJTUVfQUNDT1VOVElORwo+ID4g
PiArICAgICBzZWxlY3QgSEFWRV9LRVJORUxfQlpJUDIgaWYgIVhJUF9LRVJORUwgJiYgIUVGSV9a
Qk9PVAo+ID4gPiArICAgICBzZWxlY3QgSEFWRV9LRVJORUxfR1pJUCBpZiAhWElQX0tFUk5FTCAm
JiAhRUZJX1pCT09UCj4gPiA+ICsgICAgIHNlbGVjdCBIQVZFX0tFUk5FTF9MWjQgaWYgIVhJUF9L
RVJORUwgJiYgIUVGSV9aQk9PVAo+ID4gPiArICAgICBzZWxlY3QgSEFWRV9LRVJORUxfTFpNQSBp
ZiAhWElQX0tFUk5FTCAmJiAhRUZJX1pCT09UCj4gPiA+ICsgICAgIHNlbGVjdCBIQVZFX0tFUk5F
TF9MWk8gaWYgIVhJUF9LRVJORUwgJiYgIUVGSV9aQk9PVAo+ID4gPiArICAgICBzZWxlY3QgSEFW
RV9LRVJORUxfVU5DT01QUkVTU0VEIGlmICFYSVBfS0VSTkVMICYmICFFRklfWkJPT1QKPiA+ID4g
KyAgICAgc2VsZWN0IEhBVkVfS0VSTkVMX1pTVEQgaWYgIVhJUF9LRVJORUwgJiYgIUVGSV9aQk9P
VAo+ID4gPiAgICAgICBzZWxlY3QgSEFWRV9LUFJPQkVTIGlmICFYSVBfS0VSTkVMCj4gPiA+ICAg
ICAgIHNlbGVjdCBIQVZFX0tQUk9CRVNfT05fRlRSQUNFIGlmICFYSVBfS0VSTkVMCj4gPiA+ICAg
ICAgIHNlbGVjdCBIQVZFX0tSRVRQUk9CRVMgaWYgIVhJUF9LRVJORUwKPiA+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gPiA+IGluZGV4
IDViMzExNWExOTg1Mi4uMjliZTY3NjQxNWQ2IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2
L01ha2VmaWxlCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiA+ID4gQEAgLTEyOSwx
MSArMTI5LDI3IEBAIGVuZGlmCj4gPiA+ICBDSEVDS0ZMQUdTICs9IC1EX19yaXNjdiAtRF9fcmlz
Y3ZfeGxlbj0kKEJJVFMpCj4gPiA+Cj4gPiA+ICAjIERlZmF1bHQgdGFyZ2V0IHdoZW4gZXhlY3V0
aW5nIHBsYWluIG1ha2UKPiA+ID4gLWJvb3QgICAgICAgICA6PSBhcmNoL3Jpc2N2L2Jvb3QKPiA+
ID4gK2Jvb3QgOj0gYXJjaC9yaXNjdi9ib290Cj4gPiA+ICBpZmVxICgkKENPTkZJR19YSVBfS0VS
TkVMKSx5KQo+ID4gPiAgS0JVSUxEX0lNQUdFIDo9ICQoYm9vdCkveGlwSW1hZ2UKPiA+ID4gK2Vs
c2UgaWZlcSAoJChDT05GSUdfUklTQ1ZfTV9NT0RFKSQoQ09ORklHX0FSQ0hfQ0FOQUFOKSx5eSkK
PiA+ID4gK0tCVUlMRF9JTUFHRSA6PSAkKGJvb3QpL2xvYWRlci5iaW4KPiA+ID4gK2Vsc2UgaWZl
cSAoJChDT05GSUdfRUZJX1pCT09UKSx5KQo+ID4gPiArS0JVSUxEX0lNQUdFIDo9ICQoYm9vdCkv
dm1saW51ei5lZmkKPiA+ID4gK2Vsc2UgaWZlcSAoJChDT05GSUdfS0VSTkVMX0daSVApLHkpCj4g
PiA+ICtLQlVJTERfSU1BR0UgOj0gJChib290KS9JbWFnZS5nego+ID4gPiArZWxzZSBpZmVxICgk
KENPTkZJR19LRVJORUxfQlpJUDIpLHkpCj4gPiA+ICtLQlVJTERfSU1BR0UgOj0gJChib290KS9J
bWFnZS5iejIKPiA+ID4gK2Vsc2UgaWZlcSAoJChDT05GSUdfS0VSTkVMX0xaNCkseSkKPiA+ID4g
K0tCVUlMRF9JTUFHRSA6PSAkKGJvb3QpL0ltYWdlLmx6NAo+ID4gPiArZWxzZSBpZmVxICgkKENP
TkZJR19LRVJORUxfTFpNQSkseSkKPiA+ID4gK0tCVUlMRF9JTUFHRSA6PSAkKGJvb3QpL0ltYWdl
Lmx6bWEKPiA+ID4gK2Vsc2UgaWZlcSAoJChDT05GSUdfS0VSTkVMX0xaTykseSkKPiA+ID4gK0tC
VUlMRF9JTUFHRSA6PSAkKGJvb3QpL0ltYWdlLmx6bwo+ID4gPiArZWxzZSBpZmVxICgkKENPTkZJ
R19LRVJORUxfWlNURCkseSkKPiA+ID4gK0tCVUlMRF9JTUFHRSA6PSAkKGJvb3QpL0ltYWdlLnpz
dAo+ID4gPiAgZWxzZQo+ID4gPiAtS0JVSUxEX0lNQUdFIDo9ICQoYm9vdCkvSW1hZ2UuZ3oKPiA+
ID4gK0tCVUlMRF9JTUFHRSA6PSAkKGJvb3QpL0ltYWdlCj4gPiA+ICBlbmRpZgo+ID4KPiA+IFJl
YWxseSBhIG5pdC9jaGFuZ2UgaWYgeW91IHdhbnQsIGJ1dCBtYXliZSBkb2luZyBzb21ldGhpbmcg
bGlrZQo+ID4gYXJjaC9zMzkwL2Jvb3QvTWFrZWZpbGUgZG9lcyBpcyBlYXNpZXIgdG8gcmVhZDoK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvTWFr
ZWZpbGUKPiA+IGluZGV4IDAyNDQ4MmM2ODgzNS4uNzBmMDhlOTk5OWI0IDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ID4gKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ID4g
QEAgLTEyOCw2ICsxMjgsMTQgQEAgZW5kaWYKPiA+ICAjIGFyY2ggc3BlY2lmaWMgcHJlZGVmaW5l
cyBmb3Igc3BhcnNlCj4gPiAgQ0hFQ0tGTEFHUyArPSAtRF9fcmlzY3YgLURfX3Jpc2N2X3hsZW49
JChCSVRTKQo+ID4KPiA+ICtzdWZmaXgtJChDT05GSUdfS0VSTkVMX0daSVApICA6PSAuZ3oKPiA+
ICtzdWZmaXgtJChDT05GSUdfS0VSTkVMX0JaSVAyKSA6PSAuYnoyCj4gPiArc3VmZml4LSQoQ09O
RklHX0tFUk5FTF9MWjQpICA6PSAubHo0Cj4gPiArc3VmZml4LSQoQ09ORklHX0tFUk5FTF9MWk1B
KSAgOj0gLmx6bWEKPiA+ICtzdWZmaXgtJChDT05GSUdfS0VSTkVMX0xaTykgIDo9IC5sem8KPiA+
ICtzdWZmaXgtJChDT05GSUdfS0VSTkVMX1haKSAgOj0gLnh6Cj4gPiArc3VmZml4LSQoQ09ORklH
X0tFUk5FTF9aU1REKSAgOj0gLnpzdAo+ID4gKwo+ID4gICMgRGVmYXVsdCB0YXJnZXQgd2hlbiBl
eGVjdXRpbmcgcGxhaW4gbWFrZQo+ID4gIGJvb3QgOj0gYXJjaC9yaXNjdi9ib290Cj4gPiAgaWZl
cSAoJChDT05GSUdfWElQX0tFUk5FTCkseSkKPiA+IEBAIC0xMzYsMjAgKzE0NCw4IEBAIGVsc2Ug
aWZlcSAoJChDT05GSUdfUklTQ1ZfTV9NT0RFKSQoQ09ORklHX0FSQ0hfQ0FOQUFOKSx5eSkKPiA+
ICBLQlVJTERfSU1BR0UgOj0gJChib290KS9sb2FkZXIuYmluCj4gPiAgZWxzZSBpZmVxICgkKENP
TkZJR19FRklfWkJPT1QpLHkpCj4gPiAgS0JVSUxEX0lNQUdFIDo9ICQoYm9vdCkvdm1saW51ei5l
ZmkKPiA+IC1lbHNlIGlmZXEgKCQoQ09ORklHX0tFUk5FTF9HWklQKSx5KQo+ID4gLUtCVUlMRF9J
TUFHRSA6PSAkKGJvb3QpL0ltYWdlLmd6Cj4gPiAtZWxzZSBpZmVxICgkKENPTkZJR19LRVJORUxf
QlpJUDIpLHkpCj4gPiAtS0JVSUxEX0lNQUdFIDo9ICQoYm9vdCkvSW1hZ2UuYnoyCj4gPiAtZWxz
ZSBpZmVxICgkKENPTkZJR19LRVJORUxfTFo0KSx5KQo+ID4gLUtCVUlMRF9JTUFHRSA6PSAkKGJv
b3QpL0ltYWdlLmx6NAo+ID4gLWVsc2UgaWZlcSAoJChDT05GSUdfS0VSTkVMX0xaTUEpLHkpCj4g
PiAtS0JVSUxEX0lNQUdFIDo9ICQoYm9vdCkvSW1hZ2UubHptYQo+ID4gLWVsc2UgaWZlcSAoJChD
T05GSUdfS0VSTkVMX0xaTykseSkKPiA+IC1LQlVJTERfSU1BR0UgOj0gJChib290KS9JbWFnZS5s
em8KPiA+IC1lbHNlIGlmZXEgKCQoQ09ORklHX0tFUk5FTF9aU1REKSx5KQo+ID4gLUtCVUlMRF9J
TUFHRSA6PSAkKGJvb3QpL0ltYWdlLnpzdAo+ID4gIGVsc2UKPiA+IC1LQlVJTERfSU1BR0UgOj0g
JChib290KS9JbWFnZQo+ID4gK0tCVUlMRF9JTUFHRSA6PSAkKGJvb3QpL0ltYWdlJChzdWZmaXgt
eSkKPiA+ICBlbmRpZgo+Cj4KPgo+Cj4gR29vZCBpZGVhLgo+Cj4KPiBJZiB5b3UgYXZvaWQgdGhl
ICdlbHNlIGlmZXEnIGNoYWluIGNvbXBsZXRlbHksCj4geW91IGFsc28gY291bGQgZG8gbGlrZSB0
aGlzOgo+Cj4KPgo+IGJvb3QtaW1hZ2UtJChDT05GSUdfS0VSTkVMX0daSVApICAgICAgICAgOj0g
SW1hZ2UuZ3oKPiAgICAuLi4KPiBib290LWltYWdlLSQoQ09ORklHX0tFUk5FTF9aU1REKSAgICAg
ICAgIDo9IEltYWdlLnpzdAo+IGJvb3QtaW1hZ2UtJChDT05GSUdfS0VSTkVMX1VOQ09NUFJFU1NF
RCkgOj0gSW1hZ2UKPiBib290LWltYWdlLSQoQ09ORklHX1JJU0NWX01fTU9ERSkgICAgICAgIDo9
IGxvYWRlci5iaW4KPiBib290LWltYWdlLSQoQ09ORklHX0FSQ0hfQ0FOQUFOKSAgICAgICAgIDo9
IGxvYWRlci5iaW4KPiBib290LWltYWdlLSQoQ09ORklHX0VGSV9aQk9PVCkgICAgICAgICAgIDo9
IHZtbGludXouZWZpCj4gYm9vdC1pbWFnZS0kKENPTkZJR19YSVBfS0VSTkVMKSAgICAgICAgICA6
PSB4aXBJbWFnZQo+Cj4gS0JVSUxEX0lNQUdFIDo9ICQoYm9vdCkvJChib290LWltYWdlLXkpCgpI
aSBNYXNhaGlybyBhbmQgQmrDtnJuLgoKSSBsaWtlIHRoaXMgYXBwcm9hY2guIEJ1dCBJIHRoaW5r
IGl0IGRvZXNuJ3QgcXVpdGUgZG8gdGhlIHNhbWUgd2hlbiBmeC4KQ09ORklHX1JJU0NWX01fTU9E
RT1uIGJ1dCBDT05GSUdfQVJDSF9DQU5BQU49eSB3aGljaCBJIHRoaW5rIGlzIGEgdmFsaWQKY29u
ZmlndXJhdGlvbiBmb3IgdGhlIG5ldyBLZW5kcnl0ZSBLMjMwIHN1cHBvcnQuIEluIHRoaXMgY2Fz
ZSBib290LWltYWdlLXkKd291bGQgYmUgb3ZlcndyaXR0ZW4gd2l0aCB0aGUgbG9hZGVyLmJpbiB2
YWx1ZSBldmVuIGZvciBTLW1vZGUga2VybmVscy4KClRvIGtlZXAgdGhlIHByZXZpb3VzIGJlaGF2
aW91ciB3ZSdkIG5lZWQgc29tZXRoaW5nIGxpa2UKCiAgYm9vdC1pbWFnZS0kKENPTkZJR19SSVND
Vl9NX01PREUgKmFuZCogQ09ORklHX0FSQ0hfQ0FOQUFOKSA6PSBsb2FkZXIuYmluCgpNYXliZSBq
dXN0CgogIGlmZXEgKCQoQ09ORklHX1JJU0NWX01fTU9ERSkseSkKICBib290LWltYWdlLSQoQ09O
RklHX0FSQ0hfQ0FOQUFOKSA6PSBsb2FkZXIuYmluCiAgZW5kaWYKCkRvIHlvdSBndXlzIGhhdmUg
YSBiZXR0ZXIgc29sdXRpb24/CgovRW1pbAoKPgo+Cj4KPiBFbWlsJ3MgY3VycmVudCBwYXRjaCB3
aWxsIHdvcmssIG9mIGNvdXJzZS4KPgo+Cj4KPgo+IEJUVywgdGhpcyBwYXRjaCB3aWxsIGNvbmZs
aWN0IHdpdGgKPiAzYjkzOGUyMzFiNjYwYTI3OGRlMjk4OGVlNzdiODMyZDY2NWM1MzI2Cj4gSXQg
bGFuZHMgaW4gcmlzY3Ygc3Vic3lzdGVtLgoKT2gsIHlvdSdyZSByaWdodC4gSSdsbCByZWJhc2Ug
b24gdGhhdCBmb3IgdjIsIHRoYW5rcy4KCi9FbWlsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
