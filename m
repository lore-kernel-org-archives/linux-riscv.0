Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B222CD98D2
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 19:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABbs/Rut+i91geAM8xNIYt6FlCphGXvmmQX/Bq/Sxeo=; b=tA6nTMtwm6a9V+
	60H9kL00KE3FjHyiHIFro01aS8s3qaJKUPw4MPrFZhHK1dmPbt5mHXEL3vDiDzVzBwulgzxUCJjda
	8k6r+hqcUriTuS3zYZuGVBMtodwjsA60P+0DvWkfkelhPhbFxdJTeG/weYVrjL+Jc4jB27y+k4mcG
	CDwwEHVC80Rv7KPBMW1dMFlWGn0yUTxTbh8KxU+fIsQR/KeZB1QlS9kfdWyVo4LfVJL2qg8Mutx2Q
	bPUES2ShDi6DHCfdv3hK0qSYQkk56qAGj2IV8XbMWC3wJ8oYAHNMRsEd7fR8QG2Ju0IaaTIVqnHtE
	k3C7OUyHyVDBQyN4dhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcps-0000000AzU2-2q0t;
	Thu, 13 Nov 2025 19:18:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcpr-0000000AzTR-1kKy
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 19:18:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7856C60524
	for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 19:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D3AC2BC9E
	for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 19:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763061502;
	bh=6UprQ8VPFTOJEJnrAk3c1+70Nbd/u85upyCo1jyU1qk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W0X7qiriJx8qwv9BbYquHPo7dcdlB2adgQNwN+FfcpIdmW/AITZJ5Zpqm03CC/Dxr
	 6GnRSXQmfJ+W2vthEpzKITubGF74mnCc6WUcvin3uowyc8BT86f+//ZfLYv29g+BBF
	 lF+wiMxVq3NM9L1tiAzuG5XwvTH/cQqPOIPuH8Swojls+LSeWQiKJpBdWwsNkrHfoc
	 ViJlr54gGxXeICJKCHSvemTDsL0eAAUa1Kuky49BxecjyBAtJpJBy74zC1sU1paLFh
	 iEnE0JiwwGU2Q+ypXPimklXXrXm0/+3QIl6jESwwRiu7KL4wKdlkBy+NprPJA+WbMw
	 +qgnAYGxQ0H4g==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3d47192e99bso1374957fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 11:18:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWD6/VA8hw3e7op6KYPvQQ8yf8NvWxI2SQa/e4MxhQ7MDaT6SdjUnv8shK+NMz0bdvpFxsGMMhxvGCAqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1qr3E9EsLh4KJ7qjqLRuvHQ266a7mHk5wI7OfRs8brA2cSN4m
	Ij+perpySt54kSXo6nXbx5NC3f37WZyZqETssB622lMi1hv3K4NY1VfiRkUoD6WurwIclNwY8hd
	n+qkWfcxsVh384rmtfLZlYBz4CBPPrAA=
X-Google-Smtp-Source: AGHT+IEEkDRYf3o6eWh7An4Eb7oaPpWELLivUE1adLZQeit4rdCPvsjZcC3pPuLNVua35azYMW1z4kNGcBFvSY5y77M=
X-Received: by 2002:a05:6871:e324:b0:3d4:b889:7d65 with SMTP id
 586e51a60fabf-3e8674043b0mr485629fac.19.1763061501288; Thu, 13 Nov 2025
 11:18:21 -0800 (PST)
MIME-Version: 1.0
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com> <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
 <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m> <2tx3o5es77oa37zqvikcoo6n2ryxvepa54ezsaawcjdbf3g3wp@o2dbcbskjksk>
In-Reply-To: <2tx3o5es77oa37zqvikcoo6n2ryxvepa54ezsaawcjdbf3g3wp@o2dbcbskjksk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 13 Nov 2025 20:18:10 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gupHEg8ip+2R1wYAQ=BQn4Mk5EMMu==StRxwvXA0WwsA@mail.gmail.com>
X-Gm-Features: AWmQ_bka8IUODzeQR5ggeX8uZbZXXCIST1G0sD3k8DJ8TOKe2Mgor6ApCD0oVpM
Message-ID: <CAJZ5v0gupHEg8ip+2R1wYAQ=BQn4Mk5EMMu==StRxwvXA0WwsA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

T24gVGh1LCBOb3YgMTMsIDIwMjUgYXQgNzozMuKAr1BNIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMDUsIDIwMjUgYXQgMDU6
NTI6MDFQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gPiBPbiBNb24sIE5vdiAwMywg
MjAyNSBhdCAwNToxODowOFBNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4g
T24gV2VkLCBPY3QgMjksIDIwMjUgYXQgNTozM+KAr1BNIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gRnJvbTogVGhpZXJyeSBS
ZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiA+ID4gPgo+ID4gPiA+IFNldmVyYWwgZHJpdmVy
cyBjYW4gYmVuZWZpdCBmcm9tIHJlZ2lzdGVyaW5nIHBlci1pbnN0YW5jZSBkYXRhIGFsb25nCj4g
PiA+ID4gd2l0aCB0aGUgc3lzY29yZSBvcGVyYXRpb25zLiBUbyBhY2hpZXZlIHRoaXMsIG1vdmUg
dGhlIG1vZGlmaWFibGUgZmllbGRzCj4gPiA+ID4gb3V0IG9mIHRoZSBzeXNjb3JlX29wcyBzdHJ1
Y3R1cmUgYW5kIGludG8gYSBzZXBhcmF0ZSBzdHJ1Y3Qgc3lzY29yZSB0aGF0Cj4gPiA+ID4gY2Fu
IGJlIHJlZ2lzdGVyZWQgd2l0aCB0aGUgZnJhbWV3b3JrLiBBZGQgYSB2b2lkICogZHJpdmVyIGRh
dGEgZmllbGQgZm9yCj4gPiA+ID4gZHJpdmVycyB0byBzdG9yZSBjb250ZXh0dWFsIGRhdGEgdGhh
dCB3aWxsIGJlIHBhc3NlZCB0byB0aGUgc3lzY29yZSBvcHMuCj4gPiA+ID4KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+ID4gPgo+ID4g
PiBUaGlzIGNoYW5nZSBpcyBmaW5lIHdpdGggbWUsIHNvIEkgY2FuIGFwcGx5IGl0IHVubGVzcyBz
b21lYm9keSBoYXMgYW55Cj4gPiA+IHNwZWNpZmljIGhlYXJ0YnVybiByZWxhdGVkIHRvIGl0IChH
cmVnPyksIGJ1dCBpbiBjYXNlIHlvdSB3YW50IHRvCj4gPiA+IHJvdXRlIGl0IGRpZmZlcmVudGx5
Cj4gPiA+Cj4gPiA+IEFja2VkLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSAoSW50ZWwpIDxyYWZhZWxA
a2VybmVsLm9yZz4KPiA+Cj4gPiBJIGhhdmUgYSBmZXcgZm9sbG93LXVwIHBhdGNoZXMgZm9yIHRo
ZSBUZWdyYSBQTUMgZHJpdmVyIHRoYXQgZGVwZW5kIG9uCj4gPiB0aGlzLiA2LjE5IGlzIHdoYXQg
SSB3YXMgdGFyZ2V0dGluZywgc28gaWYgd2UgY291bGQgcHV0IHRoaXMgaW50byBhCj4gPiBzdGFi
bGUgYnJhbmNoIHRoYXQnZCBiZSB0aGUgYmVzdCBzb2x1dGlvbi4gSSBjYW4gc2V0IHRoYXQgdXAg
dmlhIHRoZQo+ID4gVGVncmEgdHJlZSBpZiB5b3UgYW5kIEdyZWcgYXJlIG9rYXkgd2l0aCBpdC4K
PiA+Cj4gPiBJZiB0aGF0J3MgYWxsIHRvbyBjb21wbGljYXRlZCwgSSBjYW4gcHJvYmFibHkgd2Fp
dCB1bnRpbCB0aGUgbmV4dCBjeWNsZQo+ID4gdG8gbWVyZ2UgdGhlIFBNQyBjaGFuZ2VzLgo+Cj4g
SSd2ZSBhZGRlZCB0aGlzIHNpbmdsZSBwYXRjaCB0byBhIGJyYW5jaCBiYXNlZCBvZmYgb2YgdjYu
MTgtcmMxIHRoYXQgSQo+IHBsYW4gdG8gZmVlZCBpbnRvIGxpbnV4LW5leHQgc28gaXQgY2FuIGdl
dCBzb21lIGJyb2FkZXIgZXhwb3N1cmUuCj4KPiBJIGNhbiBrZWVwIHRoYXQgYnJhbmNoIHN0YWJs
ZSBzbyBpdCBjYW4gZ28gdGhyb3VnaCBtdWx0aXBsZSB0cmVlcyBpZgo+IG5lZWRlZC4gSWYgYW55
b25lJ3MgaW50ZXJlc3RlZCwgdGhlIGJyYW5jaCBpcyBoZXJlOgo+Cj4gICAgICAgICBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90ZWdyYS9saW51eC5naXQv
bG9nLz9oPWZvci02LjE5L3N5c2NvcmUKCllvdSBiZWF0IG1lIHRvIHRoaXMsIHNvcnJ5IGFib3V0
IHRoZSBkZWxheS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
