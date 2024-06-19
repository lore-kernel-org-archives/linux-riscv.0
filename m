Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0D4C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 03:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPLoJNF7SHf55xRBCl4ZMMKg9JlI62UXCm1t6KhM3qw=; b=cLjFGM3j29KzxQ
	TwD/AEf4Q8KuGLBgss3/Qwuf/sdjYxdDVMfbFrWnbTOyhDyLRILZp2V91JImG9uaIA7sbixpWlX3P
	4OpQ0gR6cypqmy60onVuZTkmni4TclidvdctVrr+VnnM72tRCZyM+a9Zu4hRmqlEsgw1rlt2/ENip
	O4q0q3ond66RsPWdO3crK536NeAUNih4clP36tHtwGmPdAzWZw3ZMRVc/6xOOMBi094NnRYXUgHRP
	latbF7p7LaNdu/xotUePoMgQFgqbNgT3Xy1lPO5uui4366gDqnkxZ92k8TeJc18ovHd8fifXiuFiA
	E4bHpI6YglYOQVegnFaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJmO7-0000000HKgg-1rgN;
	Wed, 19 Jun 2024 03:53:35 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJmNy-0000000HKf6-3wg8
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 03:53:29 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-6c4926bf9baso5077428a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 20:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718769205; x=1719374005; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4mXtN5dINh8fXJ9StUQgoLkncIjUdBt0xjsRSEbe2c=;
        b=XbsOk6aIW3UOGYxsqJv0Sm3M++pR5ZoXbbRHDZM/Od7tj46oHQpPiGU5IKGK5LXHui
         CME9gVEoqPlI2bpovcrpCQeQRuoWOdcQTjOGbIMaaVrmUwcxwgA6MZrAm4OsZPzDTxJd
         hfyjWQJQat9yhpTETXNoB2qrUfWYH60wRic1ln9zzn4XRbIrJWoWmzncfa1/IbW2+QP1
         h4fmNcgsLj5h0TKNSTmYjijdTmzDElxm6Udvn00XPM5GTf2ooCyyft+AciPnWQp2JLhV
         sZPA5PdTp03dLnswSLI3SNfTd38VNaXPlgVQxAJy8/aGIisG23NGNwTYZW+MNNGo0t3Z
         3fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718769205; x=1719374005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4mXtN5dINh8fXJ9StUQgoLkncIjUdBt0xjsRSEbe2c=;
        b=hHhjeUMRarkUUvjbGT4OMqps8Ys2QFXqlhlOVio1BRpyXXmIQaIfsG2HzepOjKOYrT
         ySz+oD7eGsXw3gVVQmMgo51elrWBWrS49MOdYvg5ZNxzokWkqLNRbbGC/xnUMWT7lAiI
         kelFLhPEzyIweLYLwIbX68cXHT04kFYNhpSLVV5FMl2imOn+c38MplXqWJXlvCIJfs7I
         dDQKtriTPjHtsfUCrrJLWYcyzrsWtMsdeQMKcCB+LTLu1oLc4ApbXPHfjU0RSFVwsUhb
         UnR4EcF1uTJQAWqjZ7fb14W7jQKg3ja0XP75j0NL84hi1Xo1nf9dg4GHl3znuWskb0fE
         yfkw==
X-Forwarded-Encrypted: i=1; AJvYcCUAlDkgDxyqag2tLw48sB7Ilvi7xJWexSzyyPpG5u3jronPC1QqizhjunCv0BB3LDetLrP3ydxsWpK3kgkgWp+0TdrSosMHqzOTkBD1bWDQ
X-Gm-Message-State: AOJu0Yw1GmMf1qBMn2bQcGniEIU20Ny6oelOPvBtQ0QcXVxdpG2lI0CX
	jxfbkLLiAVo31RakMucBqeciqXq884cYI0OLyV6HvL1QsuFbwjJRHszmbeOeiXSr0k/kM5xmAPM
	0CwKfaV8JkyblpeBvdcuQIWhxQ7qKjRTUOZDHNEtOd/jBCtY4VB6uMg==
X-Google-Smtp-Source: AGHT+IG8myJ10Gv4rgdI0AE0LBkAKwh/LKCs0T5qlEmgvDKP08qqEdYSjjLe+WuTC0rtZlde65DDWNY4XKIwTLjJ+5Y=
X-Received: by 2002:a17:90b:3717:b0:2bf:f248:3506 with SMTP id
 98e67ed59e1d1-2c7b5b7aa9cmr1419260a91.12.1718769204926; Tue, 18 Jun 2024
 20:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230725070549.89810-1-luxu.kernel@bytedance.com>
 <mhng-a0239c56-385e-40a9-8a71-45d50e28b45d@palmer-ri-x1c9>
 <CAPYmKFvXf7q_8QzFe4VFL1s-j0P3ZGSZ8nG1q4HmtU4rzek77Q@mail.gmail.com>
 <CAPYmKFvqpe48zaLKrTz085cJcO9fwL+BtHujU4p48onR1Nodfw@mail.gmail.com>
 <329b22c6-435c-424a-8211-b9a029b0897d@ghiti.fr> <ZnFqDRXRjoHMaJXW@andrea> <9268589d-9ccc-4cdd-9de2-5019407ef313@ghiti.fr>
In-Reply-To: <9268589d-9ccc-4cdd-9de2-5019407ef313@ghiti.fr>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 19 Jun 2024 11:53:14 +0800
Message-ID: <CAPYmKFu8_72K21GL15W6fwyUv36FfEOcQKCv7dKgoT29gOwhSg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: Fix local irq restore when flags
 indicates irq disabled
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrea Parri <parri.andrea@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_205327_810112_2490691D 
X-CRM114-Status: GOOD (  18.92  )
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

SGkgQWxleCwKCk9uIFR1ZSwgSnVuIDE4LCAyMDI0IGF0IDc6NTLigK9QTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+Cj4gSGkgQW5kcmVhLAo+Cj4gT24gMTgvMDYvMjAy
NCAxMzowNSwgQW5kcmVhIFBhcnJpIHdyb3RlOgo+ID4gKG1lcmdpbmcgcmVwbGllcykKPiA+Cj4g
Pj4+PiBIb3dldmVyLCBpZiBsb2NhbF9pcnFfc2F2ZSgpIGlzIGNhbGxlZCB3aGVuIGlycSBpcyBk
aXNhYmxlZC4gVGhlIFNSX0lFIGJpdCBvZgo+ID4+Pj4gZmxhZyByZXR1cm5lZCBpcyBjbGVhci4g
SWYgc29tZSBjb2RlIGJldHdlZW4gbG9jYWxfaXJxX3NhdmUoKSBhbmQKPiA+Pj4+IGxvY2FsX2ly
cV9yZXN0b3JlKCkgcmVlbmFibGVzIGlycSwgY2F1c2luZyB0aGUgU1JfSUUgYml0IG9mIENTUl9T
VEFUVVMKPiA+Pj4+IGJhY2sgdG8gMSwgdGhlbiBsb2NhbF9pcnFfcmVzdG9yZSgpIGNhbiBub3Qg
cmVzdG9yZSBpcnEgc3RhdHVzIGJhY2sgdG8gZGlzYWJsZWQuCj4gPiBCdXQgZG9lc24ndCB0aGF0
IHJlcHJlc2VudCBzb21lIGJvZ3VzIG1hbmlwdWxhdGlvbiBvZiB0aGUgaXJxIGZsYWdzPyBjZi4K
PiA+Cj4gPiBjb25maWcgREVCVUdfSVJRRkxBR1MKPiA+ICAgICAgIGJvb2wgIkRlYnVnIElSUSBm
bGFnIG1hbmlwdWxhdGlvbiIKPiA+ICAgICAgIGhlbHAKPiA+ICAgICAgICAgRW5hYmxlcyBjaGVj
a3MgZm9yIHBvdGVudGlhbGx5IHVuc2FmZSBlbmFibGluZyBvciBkaXNhYmxpbmcgb2YKPiA+ICAg
ICAgICAgaW50ZXJydXB0cywgc3VjaCBhcyBjYWxsaW5nIHJhd19sb2NhbF9pcnFfcmVzdG9yZSgp
IHdoZW4gaW50ZXJydXB0cwo+ID4gICAgICAgICBhcmUgZW5hYmxlZC4KPiA+Cj4gPiBpbiBwYXJ0
aWN1bGFyLCByYXdfY2hlY2tfYm9ndXNfaXJxX3Jlc3RvcmUoKSBpbiByYXdfbG9jYWxfaXJxX3Jl
c3RvcmUoKS4KPiA+Cj4gPgo+ID4+IFRoaXMgZ290IGxvc3QgYnV0IHRoaXMgaXMgc3RpbGwgY29y
cmVjdCBhbmQgbmVlZGVkLgo+ID4gWW91IG1lYW4gYmVjYXVzZSBvZiB0aGUgbWVudGlvbmVkIHJ0
bDg3MjNlIGV4YW1wbGU/IGFyZSB0aGVyZSBvdGhlciBzdWNoCj4gPiBpbnN0YW5jZXM/ICBJT1cs
IHdoeSBkbyB5b3Ugc2F5IHRoYXQgdGhlIGNoYW5nZXMgaW4gcXVlc3Rpb24gYXJlIG5lZWRlZD8K
Pgo+Cj4gU2ltcGx5IGJlY2F1c2UgdGhlIHNjZW5hcmlvIGluIHRoaXMgZHJpdmVyIGFuZCBJIGxv
b2tlZCBhdCB0aGUgYXJtNjQKPiBpbXBsZW1lbnRhdGlvbiB3aGljaCByZXN0b3JlcyBmbGFncyB1
bmNvbmRpdGlvbmFsbHkuCgpJbmRlZWQsIEFSTTY0IGltcGxlbWVudGF0aW9uIHJlc3RvcmVzIGZs
YWdzIHVuY29uZGl0aW9uYWxseS4KCkFjdHVhbGx5IGluIHRoZSBiZWdpbm5pbmcgSSBmb3VuZCBz
ZXZlcmFsIGRyaXZlcnMgdXNlCmxvY2FsX2lycV9yZXN0b3JlIGFmdGVyIGxvY2FsX2lycV9lbmFi
bGUuClN1Y2ggZHJpdmVycyBpbmNsdWRlICdzY3NpL2FybS9hY29ybnNjc2kuYycsCiduZXQvd2ly
ZWxlc3MvcmVhbHRlay9ydGx3aWZpL3J0bHh4eC9ody5jJywgZXRjLgpJIHdvbmRlciB3aGV0aGVy
IHRoZSBzZW1hbnRpY3Mgb2YgbG9jYWxfaXJxX3Jlc3RvcmUgc2hvdWxkIGJlCnJlc3RvcmluZyBp
cnEgZmxhZ3MgdW5jb25kaXRpb25hbGx5IGFuZCB0aHVzIEkgc3VibWl0dGVkIHRoaXMgcGF0Y2gu
Cgo+Cj4gQnV0IGlmIHRoYXQncyBjb25zaWRlcmVkIGJvZ3VzLCBsZXQncyBkcm9wIHRoaXMuIFNv
cnJ5IFh1IGZvciB0aGUgbm9pc2UsCj4gYW5kIHRoYW5rcyBBbmRyZWEgZm9yIHBvaW50aW5nIHRo
aXMuCgpJdCdzIE9LIGlmIHdlIHRoaW5rIHRoaXMgaXMgbm90IGEgcHJvYmxlbS4gSnVzdCBpZ25v
cmUgdGhpcyBwYXRjaC4KClRoYW5rcyEKClh1IEx1Cgo+Cj4gQWxleAo+Cj4KPiA+Cj4gPiAgICBB
bmRyZWEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
