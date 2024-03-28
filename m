Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EB4C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 12:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7frdm2OYYmt9dospYVb9ARCtMwhBC86yrKMszpfHEAg=; b=qupwcGs3T9eJWn
	WaS4pglpTZjjYgRqbU6KWcJo9ZXUNNhDmyADKLwZvhVZSEQiZ3eyqyq/xT4GAyzz1ntcSH4+ZEvtI
	DjqxQU06BV4P+J+hS9HFPaxz6mbEqPo1NMIf/dPEpZ/lgN9lEwolROQrbgHWyK9kNwhvDtEpVLnDS
	DQg8PNUseLZSHiVMh6NwBXUm7n0GDlOZjb+2Jhyc9yUvKSxAHQb6R93St5hsNgjIk1P9zDqlOEh3U
	4r3AId1fCGy8IA44/XjWsOxCcgRXrDWzRY9GtSSqIN70f7fVGsddCvzGKBEvq35SeEivPGOPZH539
	pEimrwFj0tyS8BlEqD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpoZw-0000000DqmV-0MaW;
	Thu, 28 Mar 2024 12:09:56 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpoZs-0000000DqjA-2vfi
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 12:09:55 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-222a9eae9a7so441894fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 05:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711627780; x=1712232580; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WXWD1P2EUdUvDGnk7t3ymrWbjSRue1eZVAHGlT2jeU=;
        b=aqYtxSoAxwLqyT7h8FqITTKGVk+I/M/k9WK48uWFPa15VD5d8PB3nfSy8OdAOXLHrH
         e4e+/lQfgHt3BHyVQdS8JRNqvAji3jwmJGY1tczpqIA1G9KKFbfhPHqQOYXY7jGA4pq1
         exbqAQKKrNchOE0yVF/9yq7zSxdXjZ67XYy+6Salb7BDbDZIf6NHHYDXbXvJLkZrrsDW
         ErrEFiCfRwI9lgtoPz9WQcnjS25Jbfl7mzroL9jK0iZJ7Ol/A9hqr7rPHJwdF+ZapmEY
         XR9zpQIDP6774YsUzSyEdzq+MIUt+kbH9zGIap6/ZGjrNgwvLpdwvf6BAhlU808V6+Yi
         Vjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711627780; x=1712232580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WXWD1P2EUdUvDGnk7t3ymrWbjSRue1eZVAHGlT2jeU=;
        b=m2I0ovoNepRfsrkrRxIQ0XZXET9Wxsy0MVnWO+aWCWUOjCcfUF8rAJUtsLxxVELY9y
         vHNGZv/Dm3MHSVjzpGNZ1YQthnshL6LOr6XmB42b64qV2ei0BVuhxF7hIC3KyUGzcD73
         XU7DepFfGWEREJeTKZvDTP9j/oqsEommWueZTWk9Jk5EPt4wzt9qDilU/RgiNEhQB6ZA
         bn+sdzAkyg3j9guWEhkL1WlFiE7Da10GgAYqAkmb0pzEg0qCxkESrZqAbIcqDH8ZZl8T
         J5Dc3gxjjBSlfmbGMQ0wpLA4iB7dAj3vGuLZfc/iDlIs+yti8/ktwgo0r5MnHXciCJVz
         7h3A==
X-Gm-Message-State: AOJu0Yzzt7t8NepT/g+ciH4WmbNGEYg5FQW5/SHlSvObNe+VV/0yK+fJ
	AvDDuhHijHNuaNY9ykhxG0lYA2I+Pjv5etqdYIGwOwlUGMKFlBLjAs2GqmW7vIpx5fnhxjXqCv5
	YkDcbMUErAgA2vpF9E2DAGm2lh/QLro8U7BXM5w==
X-Google-Smtp-Source: AGHT+IG6KMSsNTaCJ4B801uxGRphzA7peDuz6U9DvVc2Nrjue29uyXVo1+rBJ4jLm7c2h0TDErvLIdg+N+zr8LbQtwE=
X-Received: by 2002:a05:6870:510:b0:22b:a8f3:36b7 with SMTP id
 j16-20020a056870051000b0022ba8f336b7mr24986oao.55.1711627780242; Thu, 28 Mar
 2024 05:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240327061258.2370291-1-sorear@fastmail.com> <CAEEQ3w=yNEktgUucmKuUvqfwDYYztVX+jofi5Q7hG-yQWcLbTA@mail.gmail.com>
 <234c458c-15f1-423f-a2fd-0abfc6232c66@app.fastmail.com>
In-Reply-To: <234c458c-15f1-423f-a2fd-0abfc6232c66@app.fastmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 28 Mar 2024 20:09:29 +0800
Message-ID: <CAEEQ3wm3pJmAndvW1FvH0x2kKNsD8q2-TykasYdNqB1njk-R9A@mail.gmail.com>
Subject: Re: [External] [PATCH] riscv: process: Fix kernel gp leakage
To: "Stefan O'Rear" <sorear@fastmail.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_050952_788959_6C74B442 
X-CRM114-Status: GOOD (  36.63  )
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

SGkgU3RlZmFuLAoKT24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgMTI6NTTigK9BTSBTdGVmYW4gTydS
ZWFyIDxzb3JlYXJAZmFzdG1haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWFyIDI3LCAyMDI0
LCBhdCA0OjQzIEFNLCB5dW5odWkgY3VpIHdyb3RlOgo+ID4gSGkgU3RlZmFuLAo+ID4KPiA+IE9u
IFdlZCwgTWFyIDI3LCAyMDI0IGF0IDI6MTTigK9QTSBTdGVmYW4gTydSZWFyIDxzb3JlYXJAZmFz
dG1haWwuY29tPiB3cm90ZToKPiA+Pgo+ID4+IGNoaWxkcmVncyByZXByZXNlbnRzIHRoZSByZWdp
c3RlcnMgd2hpY2ggYXJlIGFjdGl2ZSBmb3IgdGhlIG5ldyB0aHJlYWQKPiA+PiBpbiB1c2VyIGNv
bnRleHQuIEZvciBhIGtlcm5lbCB0aHJlYWQsIGNoaWxkcmVncy0+Z3AgaXMgbmV2ZXIgdXNlZCBz
aW5jZQo+ID4+IHRoZSBrZXJuZWwgZ3AgaXMgbm90IHRvdWNoZWQgYnkgc3dpdGNoX3RvLiBGb3Ig
YSB1c2VyIG1vZGUgaGVscGVyLCB0aGUKPiA+PiBncCB2YWx1ZSBjYW4gYmUgb2JzZXJ2ZWQgaW4g
dXNlciBzcGFjZSBhZnRlciBleGVjdmUgb3IgcG9zc2libHkgYnkgb3RoZXIKPiA+PiBtZWFucy4K
PiA+Pgo+ID4+IEZpeGVzOiA3ZGI5MWU1N2EwYWMgKCJSSVNDLVY6IFRhc2sgaW1wbGVtZW50YXRp
b24iKQo+ID4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBPJ1JlYXIgPHNvcmVhckBmYXN0bWFpbC5j
b20+Cj4gPj4gLS0tCj4gPj4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyB8IDMgLS0tCj4g
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3Mu
Ywo+ID4+IGluZGV4IDkyOTIyZGJkNWI1Yy4uNTEwNDJmNDhkYTE3IDEwMDY0NAo+ID4+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Nlc3MuYwo+ID4+IEBAIC0yNyw4ICsyNyw2IEBACj4gPj4gICNpbmNsdWRlIDxhc20vdmVj
dG9yLmg+Cj4gPj4gICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgo+ID4+Cj4gPj4gLXJlZ2lz
dGVyIHVuc2lnbmVkIGxvbmcgZ3BfaW5fZ2xvYmFsIF9fYXNtX18oImdwIik7Cj4gPj4gLQo+ID4+
ICAjaWYgZGVmaW5lZChDT05GSUdfU1RBQ0tQUk9URUNUT1IpICYmICFkZWZpbmVkKENPTkZJR19T
VEFDS1BST1RFQ1RPUl9QRVJfVEFTSykKPiA+PiAgI2luY2x1ZGUgPGxpbnV4L3N0YWNrcHJvdGVj
dG9yLmg+Cj4gPj4gIHVuc2lnbmVkIGxvbmcgX19zdGFja19jaGtfZ3VhcmQgX19yZWFkX21vc3Rs
eTsKPiA+PiBAQCAtMjA3LDcgKzIwNSw2IEBAIGludCBjb3B5X3RocmVhZChzdHJ1Y3QgdGFza19z
dHJ1Y3QgKnAsIGNvbnN0IHN0cnVjdCBrZXJuZWxfY2xvbmVfYXJncyAqYXJncykKPiA+PiAgICAg
ICAgIGlmICh1bmxpa2VseShhcmdzLT5mbikpIHsKPiA+PiAgICAgICAgICAgICAgICAgLyogS2Vy
bmVsIHRocmVhZCAqLwo+ID4+ICAgICAgICAgICAgICAgICBtZW1zZXQoY2hpbGRyZWdzLCAwLCBz
aXplb2Yoc3RydWN0IHB0X3JlZ3MpKTsKPiA+PiAtICAgICAgICAgICAgICAgY2hpbGRyZWdzLT5n
cCA9IGdwX2luX2dsb2JhbDsKPiA+PiAgICAgICAgICAgICAgICAgLyogU3VwZXJ2aXNvci9NYWNo
aW5lLCBpcnFzIG9uOiAqLwo+ID4+ICAgICAgICAgICAgICAgICBjaGlsZHJlZ3MtPnN0YXR1cyA9
IFNSX1BQIHwgU1JfUElFOwo+ID4+Cj4gPj4gLS0KPiA+PiAyLjQwLjEKPiA+Pgo+ID4+Cj4gPiBD
YW4geW91IGhlbHAgZXhwcmVzcyBpbiBtb3JlIGRldGFpbCB3aGF0IHRoZSBwcm9ibGVtIHdhcyBi
ZWZvcmUgZml4aW5nIGl0Pwo+Cj4gSXQncyBhIEtBU0xSIGJ5cGFzcywgc2luY2UgZ3BfaW5fZ2xv
YmFsIGlzIHRoZSBhZGRyZXNzIG9mIHRoZSBrZXJuZWwgc3ltYm9sCj4gX19nbG9iYWxfcG9pbnRl
ciQuCj4KPiBUaGUgLyogS2VybmVsIHRocmVhZCAqLyBjb21tZW50IGlzIHNvbWV3aGF0IGluYWNj
dXJhdGUgaW4gdGhhdCBpdCBpcyBhbHNvIHVzZWQKPiBmb3IgdXNlcl9tb2RlX2hlbHBlciB0aHJl
YWRzLCB3aGljaCBleGVjIGEgdXNlciBwcm9jZXNzLCBlLmcuIC9zYmluL2luaXQgb3IKPiB3aGVu
IC9wcm9jL3N5cy9rZXJuZWwvY29yZV9wYXR0ZXJuIGlzIGEgcGlwZS4gU3VjaCB0aHJlYWRzIGRv
IG5vdCBoYXZlCj4gUEZfS1RIUkVBRCBzZXQgYW5kIGFyZSB2YWxpZCB0YXJnZXRzIGZvciBwdHJh
Y2UgZXRjLiBldmVuIGJlZm9yZSB0aGV5IGV4ZWMuCj4KPiBjaGlsZHJlZ3MgaXMgdGhlICp1c2Vy
KiBjb250ZXh0IGR1cmluZyBzeXNjYWxsIGV4ZWN1dGlvbiBhbmQgaXQgaXMgb2JzZXJ2YWJsZQo+
IGZyb20gdXNlcnNwYWNlIGluIGF0IGxlYXN0IGZpdmUgd2F5czoKPgo+IDEuIGtlcm5lbF9leGVj
dmUgZG9lcyBub3QgY3VycmVudGx5IGNsZWFyIGludGVnZXIgcmVnaXN0ZXJzLCBzbyB0aGUgc3Rh
cnRpbmcKPiAgICByZWdpc3RlciBzdGF0ZSBmb3IgUElEIDEgYW5kIG90aGVyIHVzZXIgcHJvY2Vz
c2VzIHN0YXJ0ZWQgYnkgdGhlIGtlcm5lbCBoYXMKPiAgICBzcCA9IHVzZXIgc3RhY2ssIGdwID0g
a2VybmVsIF9fZ2xvYmFsX3BvaW50ZXIkLCBhbGwgb3RoZXIgaW50ZWdlciByZWdpc3RlcnMKPiAg
ICB6ZXJvZWQgYnkgdGhlIG1lbXNldCBpbiB0aGUgcGF0Y2ggY29tbWVudC4KPgo+ICAgIFRoaXMg
aXMgYSBidWcgaW4gaXRzIG93biByaWdodCwgYnV0IEknbSB1bndpbGxpbmcgdG8gYmV0IHRoYXQg
aXQgaXMgdGhlIG9ubHkKPiAgICB3YXkgdG8gZXhwbG9pdCB0aGUgaXNzdWUgYWRkcmVzc2VkIGJ5
IHRoaXMgcGF0Y2guCj4KPiAyLiBwdHJhY2UoUFRSQUNFX0dFVFJFR1NFVCk6IHlvdSBjYW4gUFRS
QUNFX0FUVEFDSCB0byBhIHVzZXJfbW9kZV9oZWxwZXIgdGhyZWFkCj4gICAgYmVmb3JlIGl0IGV4
ZWNzLCBidXQgcHRyYWNlIHJlcXVpcmVzIFNJR1NUT1AgdG8gYmUgZGVsaXZlcmVkIHdoaWNoIGNh
biBvbmx5Cj4gICAgaGFwcGVuIGF0IHVzZXIva2VybmVsIGJvdW5kYXJpZXMuCj4KPiAzLiAvcHJv
Yy8qL3Rhc2svKi9zeXNjYWxsOiB0aGlzIGlzIHBlcmZlY3RseSBoYXBweSB0byByZWFkIHB0X3Jl
Z3MgZm9yCj4gICAgdXNlcl9tb2RlX2hlbHBlcnMgYmVmb3JlIHRoZSBleGVjIGNvbXBsZXRlcywg
YnV0IGdwIGlzIG5vdCBvbmUgb2YgdGhlCj4gICAgcmVnaXN0ZXJzIGl0IHJldHVybnMuCj4KPiA0
LiBQRVJGX1NBTVBMRV9SRUdTX1VTRVI6IExPQ0tET1dOX1BFUkYgbm9ybWFsbHkgcHJldmVudHMg
YWNjZXNzIHRvIGtlcm5lbAo+ICAgIGFkZHJlc3NlcyB2aWEgUEVSRl9TQU1QTEVfUkVHU19JTlRS
LCBidXQgZHVlIHRvIHRoaXMgYnVnIGtlcm5lbCBhZGRyZXNzZXMKPiAgICBhcmUgYWxzbyBleHBv
c2VkIHZpYSBQRVJGX1NBTVBMRV9SRUdTX1VTRVIgd2hpY2ggaXMgcGVybWl0dGVkIHVuZGVyCj4g
ICAgTE9DS0RPV05fUEVSRi4gSSBoYXZlIG5vdCBhdHRlbXB0ZWQgdG8gd3JpdGUgZXhwbG9pdCBj
b2RlLgo+Cj4gNS4gTXVjaCBvZiB0aGUgdHJhY2luZyBpbmZyYXN0cnVjdHVyZSBhbGxvd3MgYWNj
ZXNzIHRvIHVzZXIgcmVnaXN0ZXJzLiBJIGhhdmUKPiAgICBub3QgYXR0ZW1wdGVkIHRvIGRldGVy
bWluZSB3aGljaCBmb3JtcyBvZiB0cmFjaW5nIGFsbG93IGFjY2VzcyB0byB1c2VyCj4gICAgcmVn
aXN0ZXJzIHdpdGhvdXQgYWxyZWFkeSBhbGxvd2luZyBhY2Nlc3MgdG8ga2VybmVsIHJlZ2lzdGVy
cy4KPgo+IERvZXMgdGhpcyBoZWxwPyBIb3cgbXVjaCBvZiB0aGlzIHNob3VsZCBiZSBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2U/CgpGaW5lIGVub3VnaCwgVGhhbmtzLgoKVGhhbmtzLApZdW5odWkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
