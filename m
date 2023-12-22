Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDBBC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ms4jvqZ5iRG5eVT48QqM7rhQWSuI7Pb+YGHuTTGQYMw=; b=e4bSqKYHORQFad
	mY1EVtkOJvU9o4L6xqUjQTHnYy90mjmbjsT5LczJLel+yjIJ256jQV69FM2I8PzWY4MYRfwTFJ2uc
	oxqTVQWmSLoFWBrdSPVfe1yA2YUel7Fq8gL3k4ddO6ClON0+D5jc3YvZLFdEiXzgsYEm13pg3RVpi
	jivyILm6L0E28KY7r+yZZjEVXqrcbcQphmLhdaaS4XkdiUMEkX2tGrS+NUiGbgopeb4t7sBQVL9wF
	/6a/CzYMyZ+XSAo0SI9QiYR0xVuDQP6vWgYLhI2rlKMOuqiROtPArq8Fxh+KQbkUHgImfDnZixNt0
	RkNQMEg1kUZgKCgy0XrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe1Q-005pJR-37;
	Fri, 22 Dec 2023 11:48:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe1O-005pG3-0r
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 11:48:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D869ECE21D1
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 11:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A031CC433CC
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 11:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703245729;
	bh=FlymK5LbClRXOG+RMjxFM72ReopkCVFd1+LDQ+0t1YY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jjoCFLnhQ/qGJLo1/8ryvMufpSmX2GhHRSB+/0FZc2sk+oC5OJmOZpUGFZ97LuZ9U
	 obInLRJbXMkEIFMKG4NMMKYRgBtAwiBbVcWRigaocvdv+an9uipppRxF02R+Z9FiFo
	 3hATmjgg05oZryViEo8/pO+6dlFcVw1cy1JaAhaCwvuaKaqkDFsPvme+Z3f+1fTt/G
	 bg3ri4Nisj7jo+ErsnzkgRP25kZdrXHLmfGSqhOMldQUwbrBSKL7EEeizcsRY7JaoQ
	 h2354IbPKTil8mmsvKtLki+xetoJkoCvUSUIJoytYzFgF6U0inm8b2xgtvqov6DcvO
	 ZK7VgBAvR9ZPg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-553a65b6ad4so2261551a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 03:48:49 -0800 (PST)
X-Gm-Message-State: AOJu0YxruUd/c/EzxzA97fKRmEyRYBHqoNNOXzSLW8B4ORTPr9otULpN
	oRKQT3YFm9ake1l539ubN7ATflu1f+VMzc14AbM=
X-Google-Smtp-Source: AGHT+IFVPZzCzb0xj985HwrmUbmW0Jq/RmEvvv5I4UCX5tEPPTVnITvPcvviXuNJYC8itOiyOacSZhaOtRLR4+P+3u0=
X-Received: by 2002:a17:906:4698:b0:a23:f50:6cff with SMTP id
 a24-20020a170906469800b00a230f506cffmr782485ejr.111.1703245728046; Fri, 22
 Dec 2023 03:48:48 -0800 (PST)
MIME-Version: 1.0
References: <20231222082711.454374-1-leobras@redhat.com>
In-Reply-To: <20231222082711.454374-1-leobras@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 19:48:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTShV+xBjHwQKGEQG-JgEUVa6S8egZNcN7xt_2rPucph9Q@mail.gmail.com>
Message-ID: <CAJF2gTShV+xBjHwQKGEQG-JgEUVa6S8egZNcN7xt_2rPucph9Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] riscv: Improve arch_get_mmap_end() macro
To: Leonardo Bras <leobras@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_034854_657622_427086A2 
X-CRM114-Status: GOOD (  19.42  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgNDoyN+KAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIG1hY3JvIGNhdXNlZCBtZSBzb21lIGNvbmZ1c2lv
biwgd2hpY2ggdG9vayBzb21lIHJldmlld2VyJ3MgdGltZSB0bwo+IG1ha2UgaXQgY2xlYXIsIHNv
IEkgcHJvcG9zZSBhZGRpbmcgYSBzaG9ydCBjb21tZW50IGluIGNvZGUgdG8gYXZvaWQKPiBjb25m
dXNpb24gaW4gdGhlIGZ1dHVyZS4KPgo+IEFsc28sIGFkZGVkIHNvbWUgaW1wcm92ZW1lbnRzIHRv
IHRoZSBtYWNybywgc3VjaCBhcyByZW1vdmluZyB0aGUKPiBhc3N1bXB0aW9uIG9mIFZBX1VTRVJf
U1Y1NyBiZWluZyB0aGUgbGFyZ2VzdCBhZGRyZXNzIHNwYWNlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
TGVvbmFyZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgMTIgKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJv
Y2Vzc29yLmgKPiBpbmRleCBmMTlmODYxY2RhNTQ5Li4yMjc4ZTJhODM2MmFmIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gQEAgLTE4LDE1ICsxOCwyMSBAQAo+ICAjZGVmaW5l
IERFRkFVTFRfTUFQX1dJTkRPVyAgICAgKFVMKDEpIDw8IChNTUFQX1ZBX0JJVFMgLSAxKSkKPiAg
I2RlZmluZSBTVEFDS19UT1BfTUFYICAgICAgICAgIFRBU0tfU0laRV82NAo+Cj4gKy8qCj4gKyAq
IGFkZHIgaXMgYSBoaW50IHRvIHRoZSBtYXhpbXVtIHVzZXJzcGFjZSBhZGRyZXNzIHRoYXQgbW1h
cCBzaG91bGQgcHJvdmlkZSwgc28KPiArICogdGhpcyBtYWNybyBuZWVkcyB0byByZXR1cm4gdGhl
IGxhcmdlc3QgYWRkcmVzcyBzcGFjZSBhdmFpbGFibGUgc28gdGhhdAo+ICsgKiBtbWFwX2VuZCA8
IGFkZHIsIGJlaW5nIG1tYXBfZW5kIHRoZSB0b3Agb2YgdGhhdCBhZGRyZXNzIHNwYWNlLgo+ICsg
KiBTZWUgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L3ZtLWxheW91dC5yc3QgZm9yIG1vcmUgZGV0
YWlscy4KPiArICovCj4gICNkZWZpbmUgYXJjaF9nZXRfbW1hcF9lbmQoYWRkciwgbGVuLCBmbGFn
cykgICAgICAgICAgICAgICAgICAgIFwKPiAgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgdW5zaWduZWQgbG9u
ZyBtbWFwX2VuZDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICB0
eXBlb2YoYWRkcikgX2FkZHIgPSAoYWRkcik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiAgICAgICAgIGlmICgoX2FkZHIpID09IDAgfHwgKElTX0VOQUJMRUQoQ09ORklHX0NPTVBBVCkg
JiYgaXNfY29tcGF0X3Rhc2soKSkpIFwKPiAgICAgICAgICAgICAgICAgbW1hcF9lbmQgPSBTVEFD
S19UT1BfTUFYOyAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgICAgZWxzZSBpZiAoKF9h
ZGRyKSA+PSBWQV9VU0VSX1NWNTcpICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICAgICAg
ICAgICAgIG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsgICAgICAgICAgICAgICAgICAgICAgIFwK
PiAtICAgICAgIGVsc2UgaWYgKCgoKF9hZGRyKSA+PSBWQV9VU0VSX1NWNDgpKSAmJiAoVkFfQklU
UyA+PSBWQV9CSVRTX1NWNDgpKSBcCj4gKyAgICAgICBlbHNlIGlmICgoKF9hZGRyKSA+PSBWQV9V
U0VSX1NWNTcpICYmIChWQV9CSVRTID49IFZBX0JJVFNfU1Y1NykpIFwKPiArICAgICAgICAgICAg
ICAgbW1hcF9lbmQgPSBWQV9VU0VSX1NWNTc7ICAgICAgICAgICAgICAgICAgICAgICAgXApJdCdz
IGNsZWFyZXIuCgpMR1RNLgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+
Cgo+ICsgICAgICAgZWxzZSBpZiAoKChfYWRkcikgPj0gVkFfVVNFUl9TVjQ4KSAmJiAoVkFfQklU
UyA+PSBWQV9CSVRTX1NWNDgpKSBcCj4gICAgICAgICAgICAgICAgIG1tYXBfZW5kID0gVkFfVVNF
Ul9TVjQ4OyAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIGVsc2UgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAg
ICAgICBtbWFwX2VuZCA9IFZBX1VTRVJfU1YzOTsgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
LS0KPiAyLjQzLjAKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
