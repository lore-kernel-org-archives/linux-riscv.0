Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64760C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 13:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLeLnNvJa/82EQ+8yJDZBLjC/2EsNBiDchKjDhch5cA=; b=Wo76hRty4EZsLI
	KyPEGvtDqQuHWkl+89+RePiDfo+lJqk6u2ZScGdfQl/WOiLs7oRFloHIfJr8WHFdscYG8ztXB1x1l
	cI8MuNJex98O2F4WUDNWBBt0/s0whWAT9g9MP2/Rnas5TznpGEBEEnAfz6dG9dAup1VGmivkCBXlW
	eC08cm7N1SaG/g7rDNwPyWOO+iK7MHXgJ4pkaDBik39CN4GO0GiDGKP5xd4bDG0b4LMjEC0x+sDcT
	xZ87U6VXKEj3FqU/35HOy56PXjsRtQxhxt/m4bZRyGUIOc2Gjmjj9jOD2yuaVkohjps0JTfQjWt1m
	uFEZ1KtHSYZ+qHcP3yXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmyE-00B8my-2d;
	Mon, 27 Mar 2023 13:33:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmyB-00B8m7-26
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 13:33:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 108D86124D
	for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 13:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332F7C433AC
	for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679923985;
	bh=I2nC4RvrI3XPmmchXfIbX9tkGi9QcppowdjfP5n6HKg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rvN4TbP3P41UabfoZduu5VujQxmn3s5MCDlwFPHGjHfRKUm6ZtrjBNhM6ZH/OjzSM
	 qPWGpP9/0h2WsebqSy0ZZpA7Dj0F7Q5V4JCpEUFnhYLcXgcFvYML+rpduMj/CL4WBh
	 QBSARR67Rr2c5pSCOwQFCuRIRW14OHF8Wm+t5+GrmM7Hq06Cct4XQPxpr84uFHBgC0
	 NMCo3BJaTJ5IYtwshXKeLofd71XNQCvU3vyQG57fVM/MNWY1jxgYcbdTQupNPa5Vbm
	 cQHN/mxSpxUMIbRNM04vDttP7tT5sygci9gfgxYUOqsdC6HmLVsiYEZHR/dnj75oZq
	 FqGZg4Z4YrfFg==
Received: by mail-ed1-f53.google.com with SMTP id w9so36346765edc.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 06:33:05 -0700 (PDT)
X-Gm-Message-State: AAQBX9e6CnPwy/b1Nn0Thm/6x0if33fwlSdxpS+dAbI/YntVzHnNxnCc
	v/Iiyyq2fB3zXxtc2PP4xhwgxU86V39oWzVh/UM=
X-Google-Smtp-Source: AKy350ZI7DmaR3+YGbP/NXYZhn7km7KIid6qvRQlw0MFKgLBu59N2QBPhw3hOGGid8N91ENewfUMIFA1hkMms2hAc5c=
X-Received: by 2002:a17:906:2303:b0:930:310:abf1 with SMTP id
 l3-20020a170906230300b009300310abf1mr5900219eja.5.1679923983279; Mon, 27 Mar
 2023 06:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230324071239.151677-1-guoren@kernel.org> <20230324071239.151677-2-guoren@kernel.org>
 <f170c68c-4975-4f71-ac50-979483cb5848@spud>
In-Reply-To: <f170c68c-4975-4f71-ac50-979483cb5848@spud>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 27 Mar 2023 21:32:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSwt1XkC=kisOAf0_aHmi6E6ty-EV0eSA110E1DzvWc2Q@mail.gmail.com>
Message-ID: <CAJF2gTSwt1XkC=kisOAf0_aHmi6E6ty-EV0eSA110E1DzvWc2Q@mail.gmail.com>
Subject: Re: [PATCH -next V11 1/3] riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
To: Conor Dooley <conor.dooley@microchip.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, mark.rutland@arm.com, 
	bjorn@kernel.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_063307_761273_E20FFC2A 
X-CRM114-Status: GOOD (  25.41  )
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

T24gTW9uLCBNYXIgMjcsIDIwMjMgYXQgNzozMOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMDM6
MTI6MzdBTSAtMDQwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVu
IDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gQWRkIGluZGVwZW5kZW50IGlycSBz
dGFja3MgZm9yIHBlcmNwdSB0byBwcmV2ZW50IGtlcm5lbCBzdGFjayBvdmVyZmxvd3MuCj4gPiBJ
dCBpcyBhbHNvIGNvbXBhdGlibGUgd2l0aCBWTUFQX1NUQUNLIGJ5IGltcGxlbWVudGluZwo+ID4g
YXJjaF9hbGxvY192bWFwX3N0YWNrLiAgTWFueSBhcmNoaXRlY3R1cmVzIGhhdmUgc3VwcG9ydGVk
Cj4gPiBIQVZFX0lSUV9FWElUX09OX0lSUV9TVEFDSywgcmlzY3Ygc2hvdWxkIGZvbGxvdyB1cC4K
PiA+Cj4gPiBUZXN0ZWQtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiA+
IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9pcnEuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvaXJxLmMKPiA+
IEBAIC05LDYgKzksMzcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvaXJxY2hpcC5oPgo+ID4gICNp
bmNsdWRlIDxsaW51eC9zZXFfZmlsZS5oPgo+ID4gICNpbmNsdWRlIDxhc20vc21wLmg+Cj4gPiAr
I2luY2x1ZGUgPGFzbS92bWFwX3N0YWNrLmg+Cj4gPiArCj4gPiArI2lmZGVmIENPTkZJR19JUlFf
U1RBQ0tTCj4gPiArREVGSU5FX1BFUl9DUFUodWxvbmcgKiwgaXJxX3N0YWNrX3B0cik7Cj4KPiBi
dHcsIHNwYXJzZSBpcyBjb21wbGFpbmluZyBhYm91dCB0aGlzIHZhcmlhYmxlOgo+IC4uL2FyY2gv
cmlzY3Yva2VybmVsL2lycS5jOjE1OjE6IHdhcm5pbmc6IHN5bWJvbCAnX19wY3B1X3Njb3BlX2ly
cV9zdGFja19wdHInIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CkkgZGVj
bGFyZWQgaXQgaW4gdHJhcHMuYywgbWF5YmUgSSBzaG91bGQgcHV0IGl0IGluIHRoZSB2bWFwX3N0
YWNrLmguCgo+Cj4gSSdtIG5vdCBpbW1lZGlhdGVseSBzdXJlIHdoeSB0aGF0IGlzIHRoZSBjYXNl
LCBidXQgc2hvdWxkIGJlCj4gcmVwcm9kdWNpYmxlIHdpdGggZ2NjLTEyIGFsbG1vZGNvbmZpZy4K
Pgo+IFRoYW5rcywKPiBDb25vci4KPgo+ID4gKwo+ID4gKyNpZmRlZiBDT05GSUdfVk1BUF9TVEFD
Swo+ID4gK3N0YXRpYyB2b2lkIGluaXRfaXJxX3N0YWNrcyh2b2lkKQo+ID4gK3sKPiA+ICsgICAg
IGludCBjcHU7Cj4gPiArICAgICB1bG9uZyAqcDsKPiA+ICsKPiA+ICsgICAgIGZvcl9lYWNoX3Bv
c3NpYmxlX2NwdShjcHUpIHsKPiA+ICsgICAgICAgICAgICAgcCA9IGFyY2hfYWxsb2Nfdm1hcF9z
dGFjayhJUlFfU1RBQ0tfU0laRSwgY3B1X3RvX25vZGUoY3B1KSk7Cj4gPiArICAgICAgICAgICAg
IHBlcl9jcHUoaXJxX3N0YWNrX3B0ciwgY3B1KSA9IHA7Cj4gPiArICAgICB9Cj4gPiArfQo+ID4g
KyNlbHNlCj4gPiArLyogaXJxIHN0YWNrIG9ubHkgbmVlZHMgdG8gYmUgMTYgYnl0ZSBhbGlnbmVk
IC0gbm90IElSUV9TVEFDS19TSVpFIGFsaWduZWQuICovCj4gPiArREVGSU5FX1BFUl9DUFVfQUxJ
R05FRCh1bG9uZyBbSVJRX1NUQUNLX1NJWkUvc2l6ZW9mKHVsb25nKV0sIGlycV9zdGFjayk7Cj4g
PiArCj4gPiArc3RhdGljIHZvaWQgaW5pdF9pcnFfc3RhY2tzKHZvaWQpCj4gPiArewo+ID4gKyAg
ICAgaW50IGNwdTsKPiA+ICsKPiA+ICsgICAgIGZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpCj4g
PiArICAgICAgICAgICAgIHBlcl9jcHUoaXJxX3N0YWNrX3B0ciwgY3B1KSA9IHBlcl9jcHUoaXJx
X3N0YWNrLCBjcHUpOwo+ID4gK30KPiA+ICsjZW5kaWYgLyogQ09ORklHX1ZNQVBfU1RBQ0sgKi8K
PiA+ICsjZWxzZQo+ID4gK3N0YXRpYyB2b2lkIGluaXRfaXJxX3N0YWNrcyh2b2lkKSB7fQo+ID4g
KyNlbmRpZiAvKiBDT05GSUdfSVJRX1NUQUNLUyAqLwo+ID4KPiA+ICBpbnQgYXJjaF9zaG93X2lu
dGVycnVwdHMoc3RydWN0IHNlcV9maWxlICpwLCBpbnQgcHJlYykKPiA+ICB7Cj4gPiBAQCAtMTgs
NiArNDksNyBAQCBpbnQgYXJjaF9zaG93X2ludGVycnVwdHMoc3RydWN0IHNlcV9maWxlICpwLCBp
bnQgcHJlYykKPiA+Cj4gPiAgdm9pZCBfX2luaXQgaW5pdF9JUlEodm9pZCkKPiA+ICB7Cj4gPiAr
ICAgICBpbml0X2lycV9zdGFja3MoKTsKPiA+ICAgICAgIGlycWNoaXBfaW5pdCgpOwo+ID4gICAg
ICAgaWYgKCFoYW5kbGVfYXJjaF9pcnEpCj4gPiAgICAgICAgICAgICAgIHBhbmljKCJObyBpbnRl
cnJ1cHQgY29udHJvbGxlciBmb3VuZC4iKTsKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4gaW5kZXggMWY0ZTM3
YmU3ZWIzLi5iNjk5MzNhYjZiZjggMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiBAQCAtMzA1LDE2
ICszMDUsNTAgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgbm9pbnN0ciB2b2lkIGRvX3BhZ2VfZmF1
bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAgfQo+ID4gICNlbmRpZgo+ID4KPiA+IC1hc21s
aW5rYWdlIF9fdmlzaWJsZSBub2luc3RyIHZvaWQgZG9faXJxKHN0cnVjdCBwdF9yZWdzICpyZWdz
KQo+ID4gK3N0YXRpYyB2b2lkIG5vaW5zdHIgaGFuZGxlX3Jpc2N2X2lycShzdHJ1Y3QgcHRfcmVn
cyAqcmVncykKPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3QgcHRfcmVncyAqb2xkX3JlZ3M7Cj4gPiAt
ICAgICBpcnFlbnRyeV9zdGF0ZV90IHN0YXRlID0gaXJxZW50cnlfZW50ZXIocmVncyk7Cj4gPgo+
ID4gICAgICAgaXJxX2VudGVyX3JjdSgpOwo+ID4gICAgICAgb2xkX3JlZ3MgPSBzZXRfaXJxX3Jl
Z3MocmVncyk7Cj4gPiAgICAgICBoYW5kbGVfYXJjaF9pcnEocmVncyk7Cj4gPiAgICAgICBzZXRf
aXJxX3JlZ3Mob2xkX3JlZ3MpOwo+ID4gICAgICAgaXJxX2V4aXRfcmN1KCk7Cj4gPiArfQo+ID4g
Kwo+ID4gKyNpZmRlZiBDT05GSUdfSVJRX1NUQUNLUwo+ID4gK0RFQ0xBUkVfUEVSX0NQVSh1bG9u
ZyAqLCBpcnFfc3RhY2tfcHRyKTsKPiA+ICsjZW5kaWYKSSBkZWNsYXJlZCBpdCBoZXJlLgoKPiA+
ICsKPiA+ICthc21saW5rYWdlIHZvaWQgbm9pbnN0ciBkb19pcnEoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4gPiArewo+ID4gKyAgICAgaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGlycWVudHJ5X2Vu
dGVyKHJlZ3MpOwo+ID4gKyNpZmRlZiBDT05GSUdfSVJRX1NUQUNLUwo+ID4gKyAgICAgaWYgKG9u
X3RocmVhZF9zdGFjaygpKSB7Cj4gPiArICAgICAgICAgICAgIHVsb25nICpzcCA9IHBlcl9jcHUo
aXJxX3N0YWNrX3B0ciwgc21wX3Byb2Nlc3Nvcl9pZCgpKQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICArIElSUV9TVEFDS19TSVpFL3NpemVvZih1bG9uZyk7Cj4gPiAr
ICAgICAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZSgKPiA+ICsgICAgICAgICAgICAgImFkZGkg
ICBzcCwgc3AsIC0iUklTQ1ZfU1pQVFIgICJcbiIKPiA+ICsgICAgICAgICAgICAgUkVHX1MiICBy
YSwgKHNwKSAgICAgICAgICAgICAgICBcbiIKPiA+ICsgICAgICAgICAgICAgImFkZGkgICBzcCwg
c3AsIC0iUklTQ1ZfU1pQVFIgICJcbiIKPiA+ICsgICAgICAgICAgICAgUkVHX1MiICBzMCwgKHNw
KSAgICAgICAgICAgICAgICBcbiIKPiA+ICsgICAgICAgICAgICAgImFkZGkgICBzMCwgc3AsIDIq
IlJJU0NWX1NaUFRSICJcbiIKPiA+ICsgICAgICAgICAgICAgIm1vdmUgICBzcCwgJVtzcF0gICAg
ICAgICAgICAgICBcbiIKPiA+ICsgICAgICAgICAgICAgIm1vdmUgICBhMCwgJVtyZWdzXSAgICAg
ICAgICAgICBcbiIKPiA+ICsgICAgICAgICAgICAgImNhbGwgICBoYW5kbGVfcmlzY3ZfaXJxICAg
ICAgICBcbiIKPiA+ICsgICAgICAgICAgICAgImFkZGkgICBzcCwgczAsIC0yKiJSSVNDVl9TWlBU
UiJcbiIKPiA+ICsgICAgICAgICAgICAgUkVHX0wiICBzMCwgKHNwKSAgICAgICAgICAgICAgICBc
biIKPiA+ICsgICAgICAgICAgICAgImFkZGkgICBzcCwgc3AsICJSSVNDVl9TWlBUUiAgICJcbiIK
PiA+ICsgICAgICAgICAgICAgUkVHX0wiICByYSwgKHNwKSAgICAgICAgICAgICAgICBcbiIKPiA+
ICsgICAgICAgICAgICAgImFkZGkgICBzcCwgc3AsICJSSVNDVl9TWlBUUiAgICJcbiIKPiA+ICsg
ICAgICAgICAgICAgOgo+ID4gKyAgICAgICAgICAgICA6IFtzcF0gInIiIChzcCksIFtyZWdzXSAi
ciIgKHJlZ3MpCj4gPiArICAgICAgICAgICAgIDogImEwIiwgImExIiwgImEyIiwgImEzIiwgImE0
IiwgImE1IiwgImE2IiwgImE3IiwKPiA+ICsgICAgICAgICAgICAgICAidDAiLCAidDEiLCAidDIi
LCAidDMiLCAidDQiLCAidDUiLCAidDYiLAo+ID4gKyAgICAgICAgICAgICAgICJtZW1vcnkiKTsK
PiA+ICsgICAgIH0gZWxzZQo+ID4gKyNlbmRpZgo+ID4gKyAgICAgICAgICAgICBoYW5kbGVfcmlz
Y3ZfaXJxKHJlZ3MpOwo+ID4KPiA+ICAgICAgIGlycWVudHJ5X2V4aXQocmVncywgc3RhdGUpOwo+
ID4gIH0KPiA+IC0tCj4gPiAyLjM2LjEKPiA+Cj4gPgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
