Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC94E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24fvlnPlWAc97oILWXe49yWY1bpRIHyz/IfB8ieRTFg=; b=b6YumzCRtJB7c8
	ptXeu/7+vk9KB2V5T6wdUESCNub0nigIfz7B7vFLGg5UdOeC5sVcraF0i1UQKAqF0C3ukT7kjoJpk
	WHF1gzppJ8wV1xHAS7a742psejg0vqE2nEHVQ8NKq2aNXzxft6yH0qUzwgmfAF55OPOt3q0MAY7dv
	R8iRzgKL621CvO4Pnp4M6si63z9yf7Mp1qVxjUF0GIi5+3aU9DUhKYChC5Mj6KeWOriuhCLsBi07Y
	qcHD+d7UxsVQy6IDWy1QyBACO2nCN9ucCM3pLh7KRt7aTv5jd3vTMGW9GBKcVS2gwFLRCw+xSg5xq
	lXoyVoMiDtRYv4JT/q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOnV-0000000FHbt-3lbr;
	Wed, 11 Dec 2024 15:38:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOnS-0000000FHbF-2SAL
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 15:38:43 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so6087876a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733931521; x=1734536321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18e2v39B/bPfaKlPN/TzoeLdxl2IwZlzeUqyUF3qyhY=;
        b=m6G+BmzZFhvBkcAsKBubz4p5BY5lAbKWgi0BWxLExrvIMz2jdufZiVuV9uDYgFSPNg
         Msegb2GJw6ClEN/6n4FXEf1K2pVH435XlwHedEI7X9CNFbodiXUrF64a/7KyafDgRBZb
         VdZcdhzUPfJYxtRo/sxPNYNi9QSRDRey6SfSiQ4zfkGaX7tsElFWS0sNKsx+5G4rQ7RL
         vS8jRgpnAp9EL807x6H3PLsJB8TkjmQLXfqZoVlA3uSkYNkyuH3gojTLrkETr4+bJza3
         1EUvf8x4FhZuSC518z2eWOSZ+d7479xofK0ldp++YBAxr9ythvCtc09aYCyMYR9jNM6K
         o08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931521; x=1734536321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18e2v39B/bPfaKlPN/TzoeLdxl2IwZlzeUqyUF3qyhY=;
        b=S8JBkjQA3B7k6r4jlLL8/70LTiGw3y4I08f8qPLbYulytmQ1jDinoweyZnwzNtrzfH
         fTtVEoUrxGhg3Vx9STDz5rBsICjM1HcAUcjzc21rFlfpCpb48ttxUGPKH27DZdqQXm5q
         sRyFRD3THVVrsUB7MXnQ7zn7Qi+bXwlitmLGsjT6Qujz2nivurw5G+RsuWoExoa3EAQQ
         4G7bb9V60zKXQMTEVgWCHx6cNC4ei4YK9mK5zmrJ//UgVY87WRzdZ68Jdlegt3lQqhyk
         5Q4BDT4yRk2BdV/jGVK5R0mbLtMxPvk5Iv3sbBM6fUphZvVKVp9ia/0i2wlRbA23FM3t
         tfog==
X-Forwarded-Encrypted: i=1; AJvYcCX9V0mWRNPJ4RZgRTOssc05W+8yreT/xm6t7dlYbquDzS/VkcO7nFkTcZrCiTA+TA341Zgq/sLeYCWxNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAyf8Edn3MTHo3wTGIEJaRM6BnPv/xmdYMwMzTU7NCBEV8lqRP
	Ie1i0uCehGgFWFiYxD3D0vkLJG07ReNGuJu1EBo9hrX+GqoIlPNE+/6RC5V+L5F1nxeSr8UcqIu
	9vK4IPGQIr+9B8HpenV7whUhFyqQ=
X-Gm-Gg: ASbGncvaqjsg4kWw793sF8/zsDTwBSiviFwK/jEwAClPCO6f+uWsSME5UCd0iqtkJ8I
	HX/nGkeQk4lIQc4EXeJXbQV6OwXnj5jej
X-Google-Smtp-Source: AGHT+IEq0jYPTX3+n9BZVBCd0Bm5hwAq42ViV4hXY2XE8GFJW3Hbww3znuQj55n/BAPeP3l9fyVPrbBKc676oLk7KyI=
X-Received: by 2002:a17:90b:3b49:b0:2ee:8a5d:d520 with SMTP id
 98e67ed59e1d1-2f12802cf76mr4200747a91.23.1733931521209; Wed, 11 Dec 2024
 07:38:41 -0800 (PST)
MIME-Version: 1.0
References: <20241127172908.17149-1-andybnac@gmail.com> <62f06687-a20d-4f55-b22d-52af707b528a@yadro.com>
In-Reply-To: <62f06687-a20d-4f55-b22d-52af707b528a@yadro.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 11 Dec 2024 23:38:30 +0800
Message-ID: <CAFTtA3OLkteZq1G0bi7La3r1RDc7K9fZvnApYdwqcs+9pMfs4g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt improvements
To: Evgenii Shatokhin <e.shatokhin@yadro.com>
Cc: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, bjorn@rivosinc.com, 
	puranjay12@gmail.com, alexghiti@rivosinc.com, yongxuan.wang@sifive.com, 
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com, 
	tommy.wu@sifive.com, eric.lin@sifive.com, viccent.chen@sifive.com, 
	zong.li@sifive.com, samuel.holland@sifive.com, linux@yadro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_073842_644454_9D6A050C 
X-CRM114-Status: GOOD (  41.68  )
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

SGkgRXZnZW5paSwKCkV2Z2VuaWkgU2hhdG9raGluIDxlLnNoYXRva2hpbkB5YWRyby5jb20+IOaW
vCAyMDI05bm0MTLmnIgy5pelIOmAseS4gCDkuIvljYgzOjU45a+r6YGT77yaCj4KPiBIaSwKPgo+
IE9uIDI3LjExLjIwMjQgMjA6MjksIEFuZHkgQ2hpdSB3cm90ZToKPiA+IFRoaXMgc2VyaWVzIG1h
a2VzIGF0bW9pYyBjb2RlIHBhdGNoaW5nIHBvc3NpYmxlIGluIHJpc2N2IGZ0cmFjZS4gQQo+ID4g
ZGlyZWN0IGJlbmVmaXQgb2YgdGhpcyBpcyB0aGF0IHdlIGNhbiBnZXQgcmlkIG9mIHN0b3BfbWFj
aGluZSgpIHdoZW4KPiA+IHBhdGNoaW5nIGZ1bmN0aW9uIGVudHJpZXMuIFRoaXMgYWxzbyBtYWtl
cyBpdCBwb3NzaWJsZSB0byBydW4gZnRyYWNlCj4gPiB3aXRoIGZ1bGwga2VybmVsIHByZWVtcHRp
b24uIEJlZm9yZSB0aGlzIHNlcmllcywgdGhlIGtlcm5lbCBpbml0aWFsaXplcwo+ID4gcGF0Y2hh
YmxlIGZ1bmN0aW9uIGVudHJpZXMgdG8gTk9QNCArIE5PUDQuIFRvIHN0YXJ0IHRyYWNpbmcsIGl0
IHVwZGF0ZXMKPiA+IGVudHJpZXMgdG8gQVVJUEMgKyBKQUxSIHdoaWxlIGhvbGRpbmcgb3RoZXIg
Y29yZXMgaW4gc3RvcF9tYWNoaW5lLgo+ID4gc3RvcF9tYWNoaW5lKCkgaXMgcmVxdWlyZWQgYmVj
YXVzZSBpdCBpcyBpbXBvc3NpYmxlIHRvIHVwZGF0ZSAyCj4gPiBpbnN0cnVjdGlvbnMsIGFuZCBi
ZSBzZWVuIGF0b21pY2FsbHkuIEFuZCBwcmVlbXB0aW9uIG11c3QgaGF2ZSB0byBiZQo+ID4gcHJl
dmVudGVkLCBhcyBrZXJuZWwgcHJlZW1wdGlvbiBhbGxvd3MgcHJvY2VzcyB0byBiZSBzY2hlZHVs
ZWQgb3V0IHdoaWxlCj4gPiBleGVjdXRpbmcgb24gb25lIG9mIHRoZXNlIGluc3RydWN0aW9uIHBh
aXJzLgo+ID4KPiA+IFRoaXMgc2VyaWVzIGFkZHJlc3NlcyB0aGUgcHJvYmxlbSBieSBpbml0aWFs
aXppbmcgdGhlIGZpcnN0IE5PUDQgdG8KPiA+IEFVSVBDLiBTbywgYXRtb2ljIHBhdGNoaW5nIGlz
IHBvc3NpYmxlIGJlY2F1c2UgdGhlIGtlcm5lbCBvbmx5IGhhcyB0bwo+ID4gdXBkYXRlIG9uZSBp
bnN0cnVjdGlvbi4gQXMgbG9uZyBhcyB0aGUgaW5zdHJ1Y3Rpb24gaXMgbmF0dXJhbGx5IGFsaWdu
ZWQsCj4gPiB0aGVuIGl0IGlzIGV4cGVjdGVkIHRvIGJlIHVwZGF0ZWQgYXRvbWljYWxseS4KPiA+
Cj4gPiBIb3dldmVyLCB0aGUgYWRkcmVzcyByYW5nZSBvZiB0aGUgZnRyYWNlIHRyYW1wb2xpbmUg
aXMgbGltaXRlZCB0byArLTJLCj4gPiBmcm9tIGZ0cmFjZV9jYWxsZXIgYWZ0ZXIgYXBwcGx5aW5n
IHRoaXMgc2VyaWVzLiBUaGlzIGlzc3VlIGlzIGV4cGVjdGVkCj4gPiB0byBiZSBzb2x2ZWQgYnkg
UHVyYW5qYXkncyBDQUxMX09QUywgd2hlcmUgaXQgYWRkcyA4QiBuYXR1cmFsbHkgYWxpZ24KPiA+
IGRhdGEgaW4gZnJvbnQgb2YgcGFjdGhhYmxlIGZ1bmN0aW9ucyBhbmQgY2FuICB1c2UgaXQgdG8g
ZGlyZWN0IGV4ZWN1dGlvbgo+ID4gb3V0IHRvIGFueSBjdXN0b20gdHJhbXBvbGluZXMuCj4gPgo+
ID4gVGhlIHNlcmllcyBpcyBjb21wb3NlZCBieSB0aHJlZSBwYXJ0cy4gVGhlIGZpcnN0IHBhcnQg
Y2xlYW5zIHVwIHRoZQo+ID4gZXhpc3RpbmcgaXNzdWVzIHdoZW4gdGhlIGtlcm5lbCBpcyBjb21w
aWxlZCB3aXRoIGNsYW5nLlRoZSBzZWNvbmQgcGFydAo+ID4gbW9kaWZpZXMgdGhlIGZ0cmFjZSBj
b2RlIHBhdGNoaW5nIG1lY2hhbmlzbSAoMi00KSBhcyBtZW50aW9uZWQgYWJvdmUuCj4gPiBUaGVu
IHByZXBhcmUgZnRyYWNlIHRvIGJlIGFibGUgdG8gcnVuIHdpdGgga2VybmVsIHByZWVtcHRpb24g
KDUsNikKPiA+Cj4gPiBBbiBvbmdvaW5nIGZpeDoKPiA+Cj4gPiBTaW5jZSB0aGVyZSBpcyBubyBy
b29tIGZvciBtYXJraW5nICprZXJuZWxfdGV4dF9hZGRyZXNzIGFzIG5vdHJhY2VbMV0gYXQKPiA+
IHNvdXJjZSBjb2RlIGxldmVsLCB0aGVyZSBpcyBhIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlIHJl
Z3Jlc3Npb24gd2hlbgo+ID4gdXNpbmcgZnVuY3Rpb25fZ3JhcGggd2l0aCBUUkFDRV9JUlFGTEFH
UyBlbmFibGVkLiBUaGVyZSBjYW4gYmUgYXMgbXVjaCBhcwo+ID4gOCBncmFwaCBoYW5kbGVyIGJl
aW5nIGNhbGxlZCBpbiBlYWNoIGZ1bmN0aW9uLWVudHJ5LiBUaGUgY3VycmVudAo+ID4gd29ya2Fy
b3VuZCByZXF1aXJlcyB1cyBlY2hvICIqa2VybmVsX3RleHRfYWRkcmVzcyIgaW50bwo+ID4gc2V0
X2Z0cmFjZV9ub3RyYWNlIGJlZm9yZSBzdGFydGluZyB0aGUgdHJhY2UuIEhvd2V2ZXIsIHdlIG9i
c2VydmVkIHRoYXQKPiA+IHRoZSBrZXJuZWwgc3RpbGwgZW5hYmxlcyB0aGUgcGF0Y2ggc2l0ZSBp
biBzb21lIGNhc2VzIGV2ZW4gd2l0aAo+ID4gKmtlcm5lbF90ZXh0X2FkZHJlc3MgcHJvcGVybHkg
YWRkZWQgaW4gdGhlIGZpbGUgV2hpbGUgdGhlIHJvb3QgY2F1c2UgaXMKPiA+IHN0aWxsIHVuZGVy
IGludmVzdGFndGlvbiwgd2UgY29uc2lkZXIgdGhhdCBpdCBzaG91bGQgbm90IGJlIHRoZSByZWFz
b24KPiA+IGZvciBob2xkaW5nIGJhY2sgdGhlIGNvZGUgcGF0Y2hpbmcsIGluIG9yZGVyIHRvIHVu
YmxvY2sgdGhlIGNhbGxfb3BzCj4gPiBwYXJ0Lgo+ID4KPiA+IFsxXTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDA2MTMwOTMyMzMuMGIzNDllZDBAcm9yc2NoYWNoLmxv
Y2FsLmhvbWUvCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+IC0gQWRkIGEgZml4IHRhZyBmb3Ig
cGF0Y2ggMQo+ID4gLSBBZGQgYSBkYXRhIGZlbmNlIGJlZm9yZSBzZW5kaW5nIG91dCByZW1vdGUg
ZmVuY2UuaSAoNikKPiA+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjQwNjI4LWRldi1hbmR5Yy1keW4tZnRyYWNlLXY0LXYyLTAtMWU1ZjRjYjFmMDQ5QHNpZml2
ZS5jb20vCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+IC0gRHJvcCBwYXRjaCAxIGFzIGl0IGlz
IG1lcmdlZCB0aHJvdWdoIGZpeGVzLgo+ID4gLSBEcm9wIHBhdGNoIDIsIHdoaWNoIGNvbnZlcnRz
IGtlcm5lbF90ZXh0X2FkZHJlc3MgaW50byBub3RyYWNlLiBBcwo+ID4gICAgdXNlcnMgY2FuIHBy
ZXZlbnQgdHJhY2luZyBpdCBieSBjb25maWd1cmluZyB0aGUgdHJhY2Vmcy4KPiA+IC0gVXNlIGEg
bW9yZSBnZW5lcmljIHdheSBpbiBrY29uZmlnIHRvIGFsaWduIGZ1bmN0aW9ucy4KPiA+IC0gTGlu
ayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDYxMy1kZXYtYW5keWMtZHlu
LWZ0cmFjZS12NC12MS0wLTFhNTM4ZTEyYzAxZUBzaWZpdmUuY29tCj4gPgo+ID4KPiA+IEFuZHkg
Q2hpdSAoNyk6Cj4gPiAgICByaXNjdjogZnRyYWNlOiBzdXBwb3J0IGZhc3RjYyBpbiBDbGFuZyBm
b3IgV0lUSF9BUkdTCj4gPiAgICByaXNjdjogZnRyYWNlOiBhbGlnbiBwYXRjaGFibGUgZnVuY3Rp
b25zIHRvIDQgQnl0ZSBib3VuZGFyeQo+ID4gICAgcmlzY3Y6IGZ0cmFjZTogcHJlcGFyZSBmdHJh
Y2UgZm9yIGF0b21pYyBjb2RlIHBhdGNoaW5nCj4gPiAgICByaXNjdjogZnRyYWNlOiBkbyBub3Qg
dXNlIHN0b3BfbWFjaGluZSB0byB1cGRhdGUgY29kZQo+ID4gICAgcmlzY3Y6IHZlY3RvcjogU3Vw
cG9ydCBjYWxsaW5nIHNjaGVkdWxlKCkgZm9yIHByZWVtcHRpYmxlIFZlY3Rvcgo+ID4gICAgcmlz
Y3Y6IGFkZCBhIGRhdGEgZmVuY2UgZm9yIENNT0RYIGluIHRoZSBrZXJuZWwgbW9kZQo+ID4gICAg
cmlzY3Y6IGZ0cmFjZTogc3VwcG9ydCBQUkVFTVBUCj4gPgo+ID4gICBhcmNoL3Jpc2N2L0tjb25m
aWcgICAgICAgICAgICAgICAgIHwgICA0ICstCj4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
ZnRyYWNlLmggICAgfCAgMTEgKysrCj4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vz
c29yLmggfCAgIDUgKysKPiA+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCAgICB8
ICAyMiArKysrLQo+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jICAgIHwgICA3
ICsrCj4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jICAgICAgICAgfCAxMzMgKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAgYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5
bi5TICAgICB8ICAyNSArKysrLS0KPiA+ICAgYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMgICAg
ICAgICB8ICAxNSArKystCj4gPiAgIDggZmlsZXMgY2hhbmdlZCwgMTM1IGluc2VydGlvbnMoKyks
IDg3IGRlbGV0aW9ucygtKQo+ID4gLS0tCj4gPiBiYXNlLWNvbW1pdDogMGViNTEyNzc5ZDY0MmIy
MWNlZDgzNzc4Mjg3YTBmN2EzY2E4ZjJhMQo+ID4gLS0KPiA+IDIuMzkuMyAoQXBwbGUgR2l0LTE0
NSkKPgo+IEkgaGF2ZSB0ZXN0ZWQgdGhpcyBzZXJpZXMgaW4gYSBRRU1VIFZNICgtbWFjaGluZSB2
aXJ0KSB3aXRoIHRoZQo+IHByZWVtcHRpYmxlIGtlcm5lbHMsIENPTkZJR19QUkVFTVBUPXkuCj4K
PiBObyBpc3N1ZXMgaGF2ZSBiZWVuIHJldmVhbGVkIHNvIGZhci4KPgo+IE9uZSBvZiB0aGUga2Vy
bmVscyB3YXMgYnVpbHQgYnkgR0NDIDEzLjIuMCAod2l0aCB0aGUgcGF0Y2ggZm9yIG1pbmltdW0K
PiBhbGlnbm1lbnQgYWRkZWQgb24gdG9wIG9mIGl0KSwgdGhlIG90aGVyIC0gd2l0aCBMTFZNIDE3
LjAuNi4KPgo+IEluIGJvdGggY2FzZXMsIHRoZSBiYXNpYyBib290dGltZSB0ZXN0cyBmb3IgRnRy
YWNlIHBhc3NlZC4KPgo+IFN3aXRjaGluZyB0cmFjZXJzIGJldHdlZW4gbm9wLCBmdW5jdGlvbiwg
ZnVuY3Rpb25fZ3JhcGggYW5kIGJsayBpbiBhCj4gbG9vcCBpbiBwYXJhbGxlbCB3aXRoIHN0cmVz
cy1uZyBhbmQgd2l0aCBuZXR3b3JrIGxvYWQgZm9yIHNldmVyYWwgaG91cnMKPiBkaWQgbm90IHJl
dmVhbCBhbnkgcHJvYmxlbXMgZWl0aGVyLiBLZXJuZWwgY3Jhc2hlcyBoYXBwZW5lZCBpbiB0aGlz
Cj4gc2NlbmFyaW8gYSB5ZWFyIGFnbywgYnV0IG5vdyBpdCBydW5zIGNsZWFuLCBnb29kIQo+Cj4g
RnVuY3Rpb24gcmVkaXJlY3Rpb24gdmlhIEZ0cmFjZSBzZWVtcyB0byB3b3JrIE9LIHRvby4KPgo+
IFRoZSBzaXplIG9mIC50ZXh0IHNlY3Rpb24gaW5jcmVhc2VkIHNsaWdodGx5IGFmdGVyIHRoaXMg
c2VyaWVzLCBieSAwLjM1JQo+IC0gMC4zOCUsIHByb2JhYmx5IGJlY2F1c2Ugb2YgZnVuY3Rpb24g
YWxpZ25tZW50Ogo+ICogMTIwNzUgS0IgPT4gMTIxMjEgS0IgKEdDQykKPiAqIDEyMTY3IEtCID0+
IDEyMjA5IEtCIChMTFZNL2NsYW5nKQo+Cj4gTm90IHN1cmUsIGhvdyB0byB0ZXN0IHRoZSB2ZWN0
b3ItcmVsYXRlZCBwYXJ0IHRob3VnaCwgIltQQVRDSCB2MyA1LzddCj4gcmlzY3Y6IHZlY3Rvcjog
U3VwcG9ydCBjYWxsaW5nIHNjaGVkdWxlKCkgZm9yIHByZWVtcHRpYmxlIFZlY3RvciIKClRoaXMg
c2hvdWxkIGJlIHRlc3RlZCBhcyBsb25nIGFzIGJvdGggdGhlIGtlcm5lbCBpcyBjb21waWxlZCB3
aXRoClJJU0NWX0lTQV9WIGFuZCBQUkVFTVBULCBhbmQgdGhlIGhhcmR3YXJlIHN1cHBvcnRzIHYu
CgpBbmQgdGhhbmtzIGZvciB0aGUgZXh0ZW5zaXZlIHRlc3RpbmcKCj4KPiBGb3IgYWxsIG90aGVy
IHBhdGNoZXMgaW4gdGhlIHNlcmllczoKPiBUZXN0ZWQtYnk6IEV2Z2VuaWkgU2hhdG9raGluIDxl
LnNoYXRva2hpbkB5YWRyby5jb20+Cj4KPiBSZWdhcmRzLAo+IEV2Z2VuaWkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
