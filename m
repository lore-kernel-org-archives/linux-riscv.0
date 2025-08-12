Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE0ACA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4jts7wC+O6NVqX1WPqmXmreyXtro68cL0GtDeUkzPg=; b=ky3Kc9TcAdmVSm
	T5Gmbyx1GRnI7CqO6e7JKCcj7ytWHvORLXODYf4dAF530PpACqHIyrpjUthteArd3Zq6vuDkPr5je
	n1kmIZtv3kmbDKKtfpCk75muIcHeOeXtY2sN+z3BfMs51XF106dV/B7hahLsQi9id/h9o+e1LvnoS
	i/ENXGPyGTBOKUEdFD6SjBkaJRnhHpc3xbt2e/VOL/l34bE9Z5hS0iet/xXVcxpZ2egezoPCi447E
	TQIddsPIIiFtuUpwqSPWo8NQZMJEOXii1Of1guJojfY2ISMHGdLeB2D4YIk4BNUYD8Fw/4f6LzNcC
	AQIDeImwiR9Ug0wStL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulst6-0000000BbiH-1toy;
	Tue, 12 Aug 2025 17:34:16 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpeC-0000000B0cG-2h1C
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 14:06:41 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76be8e4b59aso4733927b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 07:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755007600; x=1755612400; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zx9oekVSmxCmaENR1V+wY9m/ybp/4Sj6Dwt7Jr21Xsg=;
        b=GLXRsnK8hS+yflmaCvYPl7cO12ee5Onx0EvXXWJeE0P4VZjGq3Vh6Kv6K9v7lD9BT5
         6ERQPAwYerwu0HdiGd2rRjrIe6RqN5PSlRhpq2ieK+LI6c/Fg4mypND+oqQwzxjEfvwH
         gedrv97cf7k4A+0U4m4SifC4yCzakmbZteqStu8E+t3aFFN/Coiozbk317XLBfVIlm4w
         3pmJSfqQhpsGBc0hhP5rDb+1cfJoQvo74QL3LYRiDEJEj6Im/VRHh3+7kNPgBmWRJ3y8
         7w66hKYeGTgQCLhQX+4sVzjYh8ly5SUIpOfrs40GmUtVuQGSc4eU11bDn1htRQ6y5Qzi
         +AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755007600; x=1755612400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zx9oekVSmxCmaENR1V+wY9m/ybp/4Sj6Dwt7Jr21Xsg=;
        b=pgbb0sreOW2cMCXu7fBP43BGKJWH3OFcGB3D9Lv0d4loLF7OvkU+/Q/SSdfrYZqEW0
         bQ3tU6050e2WYyzvzDGuVVpEqv9TL6gK9dNwdQYrO5SGL4SWWmjrPInESAiTXnSoN/PS
         KiA81uxsQ6wKt1OFAUmIh4aISc37fLFUabYmDNK4k7G28zqV7kvj5t0+wy25+8qXqIMT
         QEWp+UXA6ffUMFKbGiYfoV2ikORfJ2maD1XVk3nL33qGYWaeXPClb9S1/RjusR/aeRN9
         OL0CVhOBgCEkg6lbVRuGy+1mpdVew+T1TvuXmzrluexUiaadFi7Ts5bAHZNYEht8eF+S
         7jLg==
X-Forwarded-Encrypted: i=1; AJvYcCXmsTIiMtnUU1tQvodMZPCYpQWssPU1QyKb8W/HZYR6HiswKd/z5b472ZXz43dw/+8ysxNEBzHPpJkX9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+rOwKTo6cXlr+f9Nv9jxMjOC6fnfVb/niTmHdvxybZF/UHds/
	aOzFI/KChU4sfaZ2oSOAJW0KFBNGVzLPnn5xJIx3/GST5eHA+HBcbqXcAT5Ba/aZI8w=
X-Gm-Gg: ASbGncuGmn2VELVn7ZFYBf7wJZ+dIIXljke8wKZc1dl4MTrzpiSLV61wPJfWYtxOi08
	Z25MDccvV3JprULfPAwTygWZ1A1/ixF/oXzdfSvTXBytOrjX1qZF8UP5RYgwmFalYRNN113XLg7
	33kL8ie7gug4UJJ/zWa+RpXFm+xgXOM9BRs3wddXVX2jxWVsmHeAVt+eMXg0QnWOaoKB1bKaJvX
	wqmz3/xTeiR1WVoeGMManI5nZlXcMvG6zy9/lSRcWaheAdAFrU2kertyh8pmi5sgbh0im0gBEcX
	WCDWFC2N+2gQ1eD58PS/GU8e7DPDU926r+qpc1aQsocXVP5yyl1lY9E0e1+QaXijN+PEhq2pqQn
	9noJTIgC2wrOi1W+lClOT7UwZs8Q=
X-Google-Smtp-Source: AGHT+IGcHsbPj8XO4cfW2pkk7LoFwg04kGCDkYJV8zmTFaJVh057ytF2HwAZGrdzENuzynVjDOcyWw==
X-Received: by 2002:a05:6a00:2d28:b0:76c:c48f:d7ab with SMTP id d2e1a72fcca58-76e0d1263e1mr5042146b3a.13.1755007599557;
        Tue, 12 Aug 2025 07:06:39 -0700 (PDT)
Received: from sunil-laptop ([106.51.199.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8fa33sm29884689b3a.43.2025.08.12.07.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:06:38 -0700 (PDT)
Date: Tue, 12 Aug 2025 19:36:30 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>
Subject: Re: [External] Re: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for
 CPPC FFH
Message-ID: <aJtKZhvNX0p3obFw@sunil-laptop>
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
 <aJs-aPH32OxpzR3G@sunil-laptop>
 <CAEEQ3wnHFPBPC0U59rDBJaZYxJ24uJzJ7NDQO0gfmVqoiQwNOw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wnHFPBPC0U59rDBJaZYxJ24uJzJ7NDQO0gfmVqoiQwNOw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_070640_681218_F38A84D8 
X-CRM114-Status: GOOD (  33.94  )
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

T24gVHVlLCBBdWcgMTIsIDIwMjUgYXQgMDk6MzI6MTBQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBTdW5pbCwKPiAKPiAKPiBPbiBUdWUsIEF1ZyAxMiwgMjAyNSBhdCA5OjE14oCvUE0g
U3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1
ZSwgQXVnIDEyLCAyMDI1IGF0IDA3OjI1OjQ0UE0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4g
PiA+IEhpIFN1bmlsLAo+ID4gPgo+ID4gPiBPbiBUaHUsIE1heSAxNSwgMjAyNSBhdCA1OjQ04oCv
UE0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gQWRkIHRoZSByZWFkIG9mIENTUl9DWUNMRSB0byBjcHBjX2ZmaF9jc3JfcmVhZCgpIHRv
IGZpeCB0aGUKPiA+ID4gPiB3YXJuaW5nIG1lc3NhZ2U6ICJDUFBDIENwdWZyZXE6IGNwcGNfc2Nh
bGVfZnJlcV93b2tyZm46IGZhaWxlZAo+ID4gPiA+IHRvIHJlYWQgcGVyZiBjb3VudGVycyIuCj4g
PiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRh
bmNlLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYyB8
IDUgKysrKy0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNjdi9j
cHBjLmMgYi9kcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jCj4gPiA+ID4gaW5kZXggNGNkZmYzODdk
ZWZmNi4uYzFhY2FlYjE4ZWFjMyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2FjcGkvcmlz
Y3YvY3BwYy5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYwo+ID4gPiA+
IEBAIC02OSwxMSArNjksMTQgQEAgc3RhdGljIHZvaWQgY3BwY19mZmhfY3NyX3JlYWQodm9pZCAq
cmVhZF9kYXRhKQo+ID4gPiA+ICAgICAgICAgc3RydWN0IHNiaV9jcHBjX2RhdGEgKmRhdGEgPSAo
c3RydWN0IHNiaV9jcHBjX2RhdGEgKilyZWFkX2RhdGE7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAg
IHN3aXRjaCAoZGF0YS0+cmVnKSB7Cj4gPiA+ID4gLSAgICAgICAvKiBTdXBwb3J0IG9ubHkgVElN
RSBDU1IgZm9yIG5vdyAqLwo+ID4gPiA+ICAgICAgICAgY2FzZSBDU1JfVElNRToKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgZGF0YS0+cmV0LnZhbHVlID0gY3NyX3JlYWQoQ1NSX1RJTUUpOwo+ID4g
PiA+ICAgICAgICAgICAgICAgICBkYXRhLT5yZXQuZXJyb3IgPSAwOwo+ID4gPiA+ICAgICAgICAg
ICAgICAgICBicmVhazsKPiA+ID4gPiArICAgICAgIGNhc2UgQ1NSX0NZQ0xFOgo+ID4gPiA+ICsg
ICAgICAgICAgICAgICBkYXRhLT5yZXQudmFsdWUgPSBjc3JfcmVhZChDU1JfQ1lDTEUpOwo+ID4g
PiA+ICsgICAgICAgICAgICAgICBkYXRhLT5yZXQuZXJyb3IgPSAwOwo+ID4gPiA+ICsgICAgICAg
ICAgICAgICBicmVhazsKPiA+ID4gPiAgICAgICAgIGRlZmF1bHQ6Cj4gPiA+ID4gICAgICAgICAg
ICAgICAgIGRhdGEtPnJldC5lcnJvciA9IC1FSU5WQUw7Cj4gPiA+ID4gICAgICAgICAgICAgICAg
IGJyZWFrOwo+ID4gPiA+IC0tCj4gPiA+ID4gMi4zOS4yCj4gPiA+ID4KPiA+ID4KPiA+ID4gVGhl
IHB1cnBvc2Ugb2YgY3BwY19mZmhfY3NyX3JlYWQoKSBpcyB0byBjYWxjdWxhdGUgdGhlIGFjdHVh
bAo+ID4gPiBmcmVxdWVuY3kgb2YgdGhlIENQVSwgd2hpY2ggaXMgZGVsdGFfQ1NSX0NZQ0xFL2Rl
bHRhX0NTUl9YWFguCj4gPiA+Cj4gPiA+IENTUl9YWFggc2hvdWxkIGJlIGEgcmVmZXJlbmNlIGNs
b2NrIGFuZCBkb2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJCj4gPiA+IChXYWl0IEZvciBJbnRlcnJ1
cHQpLgo+ID4gPgo+ID4gPiBTaW1pbGFyIHNvbHV0aW9ucyBpbmNsdWRlOiB4ODYncyBhcGVyZi9t
cGVyZiwgYW5kIEFSTTY0J3MgQU1VIHdpdGgKPiA+ID4gcmVnaXN0ZXJzIFNZU19BTUVWQ05UUjBf
Q09SRV9FTDAvU1lTX0FNRVZDTlRSMF9DT05TVF9FTDAuCj4gPiA+Cj4gPiA+IEhvd2V2ZXIsIHdl
IGtub3cgdGhhdCBDU1JfVElNRSBpbiB0aGUgY3VycmVudCBjb2RlIGRvZXMgY291bnQgZHVyaW5n
Cj4gPiA+IFdGSS4gU28sIGlzIHRoaXMgZGVzaWduIHVucmVhc29uYWJsZT8KPiA+ID4KPiA+ID4g
U2hvdWxkIHdlIGNvbnNpZGVyIHByb3Bvc2luZyBhbiBleHRlbnNpb24gdG8gc3VwcG9ydCBzdWNo
IGEgZGVkaWNhdGVkCj4gPiA+IGNvdW50ZXIgKGEgcmVmZXJlbmNlIGNsb2NrIHRoYXQgZG9lcyBu
b3QgY291bnQgZHVyaW5nIFdGSSk/IFRoaXMgd2F5LAo+ID4gPiB0aGUgdmFsdWUgY2FuIGJlIG9i
dGFpbmVkIGRpcmVjdGx5IGluIFMtbW9kZSB3aXRob3V0IHRyYXBwaW5nIHRvCj4gPiA+IE0tbW9k
ZSwgZXNwZWNpYWxseSBzaW5jZSByZWFkaW5nIHRoaXMgY291bnRlciBpcyB2ZXJ5IGZyZXF1ZW50
Lgo+ID4gPgo+ID4gSGkgWXVuaHVpLAo+ID4KPiA+IFllcywgYnV0IHdlIGFudGljaXBhdGVkIHRo
YXQgdmVuZG9ycyBtaWdodCBkZWZpbmUgdGhlaXIgb3duIGN1c3RvbSBDU1JzLgo+ID4gU28sIHdl
IGludHJvZHVjZWQgRkZIIGVuY29kaW5nIHRvIGFjY29tbW9kYXRlIHN1Y2ggY2FzZXMuCj4gPgo+
ID4gVGhhbmtzLAo+ID4gU3VuaWwKPiAKPiBBcyBtZW50aW9uZWQgZWFybGllciwgaXQgaXMgYmVz
dCB0byBkaXJlY3RseSByZWFkIENTUl9YWFggKGEgcmVmZXJlbmNlCj4gY2xvY2sgdGhhdCBkb2Vz
IG5vdCBjb3VudCBkdXJpbmcgV0ZJKSBhbmQgQ1NSX0NZQ0xFIGluIFMtbW9kZSwgcmF0aGVyCj4g
dGhhbiB0cmFwcGluZyB0byBTQkkuCj4gCk5vLiBJIG1lYW50IGRpcmVjdCBDU1IgYWNjZXNzIGl0
c2VsZiBub3QgU0JJLiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQKVGFibGUgNiBvZiBSSVNDLVYgRkZI
IHNwZWMuCgo+IGRyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMgaXMgYSBnZW5lcmljIGRyaXZlciB0
aGF0IGlzIG5vdCBzcGVjaWZpYyB0bwo+IGFueSB2ZW5kb3IuIEN1cnJlbnRseSwgdGhlIHVwc3Ry
ZWFtIGNvZGUgYWxyZWFkeSB1c2VzIENTUl9USU1FLCBhbmQKPiB0aGUgbG9naWMgb2YgQ1NSX1RJ
TUUgaXMgaW5jb3JyZWN0Lgo+CkNTUl9USU1FIGlzIGp1c3QgYW4gZXhhbXBsZS4gSXQgaXMgdXB0
byB0aGUgdmVuZG9yIGhvdyBfQ1BDIG9iamVjdHMgYXJlCmVuY29kZWQgdXNpbmcgRkZILiBUaGUg
bGludXggY29kZSBkb2Vzbid0IG1lYW4gb25lIHNob3VsZCB1c2UgQ1NSX1RJTUUKYWx3YXlzLgog
Cj4gSXQgd291bGQgYmUgYmVzdCB0byBwcm9tb3RlIGEgc3BlY2lmaWNhdGlvbiB0byBzdXBwb3J0
IENTUl9YWFgsIGp1c3QKPiBsaWtlIHdoYXQgaGFzIGJlZW4gZG9uZSBmb3IgeDg2IGFuZCBhcm02
NC4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gCldvdWxkbid0IGFib3ZlIHdvcms/IEZvciBhIHN0YW5k
YXJkIGV4dGVuc2lvbiwgeW91IG1heSBoYXZlIHRvIHByb3ZpZGUKbW9yZSBkYXRhIHdpdGggYWN0
dWFsIEhXLgoKVGhhbmtzLApTdW5pbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
