Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B1CC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 09:55:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 535CF613B7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 09:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 535CF613B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b37Z0vOO0rAlp9Ovucs1AWtwvUSO0WvBeTIth5WSNws=; b=HQkXh19PuudO/DqDC82XMghj3
	i/OD6W52dyirtF0PlXG85Rn1blmUp15didhTlF+hxf7kph4bxx3yCayCqsWLqntFgbquMQjYYLTll
	y95MzHryxZDeH8AijNO4iCNuBBtqU25gRMw7o5ZiH2jmGiP34nLpOLRC+UUKMtZOuYGQryhRHoqSc
	Y7w/7cvVjp4LSt2An1VcKmERwpH9JTHzn9VzEs4/18ZogNnBLpxK8zf75uZwOdjpAr1+V3W80RiFU
	ejw6W/U1muKcGKehaMRpUnujvZrx8vaKh9tIl2Bi8iMrAnJfKwqxteyvPoPPJiECT8cb7u39+Dx0T
	yXyd9FqiA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWFle-008o2C-Bt; Tue, 13 Apr 2021 09:55:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFlW-008o0h-Cm
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 09:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=Yvct8sOOJLGBQfDBsMmriT1SNCcaI/UvFZTnUoJlLes=; b=3AVIOwrmRXpuYRStF4gNFvl//N
 65YF6ukQf2YjGBKxhqVjOsNS5HmCjvzwKeqURgPbFPOseMs4YTRb5LwE2Qoaa9NlWVOU1scDG06R7
 XsNOYQImWFmX1Kr1vNuojmdcfXQfFb7uM9HHTpiQLijV1CTH1DlShFP1eQ42PX+CA1pNzqfoxMO6g
 3uq8IHA8ZSBEN7Mwem6EL5yUgOipvN5JZlL5mkN/obb786BLpGXUYb2FH2+umW+8JDZWaBz2bPNCC
 yTGBX+rOQBKmvQqfpqMG2miotAZsQkYlqnDFZOcQ0TXwTfFeey/vSkCf6jc4BSF3QekpPj1dU7HBM
 s8LOC3PA==;
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFlT-006uEE-PW
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 09:55:25 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id g5so3491407vkg.12
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 02:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Yvct8sOOJLGBQfDBsMmriT1SNCcaI/UvFZTnUoJlLes=;
 b=n5wJ519jpRHUsozl9EpZB85GUIDa6knTZm1cVVHtYhv7emYXNIYffN0LA5ODUrfJrs
 otkcLOEXj4gQwYeauLJ+mON0Shjm3cDhqf6eFCyO5TzuarbNXcfFA+WM0pvNZF1LZVRA
 JNxSjwEZ8ZcNJ/p3PFysFdHdqEcgqOfMbmOl/thAacljqF7qFJaJ3G9DrkCpx6yPPG6c
 OBxTdpQvSUrSg4De7eaSyIIKPzMJ1tAEcpWvJqmDf2fO6fhVGYTYA1xsbQMqTKSYSzY5
 3wZrwr6eWOPELGTvi12uqmOm5FrirISHqZBbidjzi3WVN0yBN7TSIy0RJQqbSHgHW34z
 zYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yvct8sOOJLGBQfDBsMmriT1SNCcaI/UvFZTnUoJlLes=;
 b=Yd1Zc7Lvz3fsrjCJ+g3E4PbutVAb9vFiLLaiCUqMoudF2bdkNFoYhcDZOPzZwkGxum
 rBGYAJz1J+wSv4UxcwWwliQBcPFn2ile5DcbhneXBphDfdcXgEyJNY5ZnX+SmZgUzzhB
 HR8tJOaUyuDFY6AFfYS327hML4/yRgi61F6eldSYHWq240yIYAv580HRgjSIsN6fOZGQ
 1SoBo0EGtQU3ZXFjyRQRvLOKBNYD44yAyMFhA/xHc9x5oaavM2Ykf4390X3kh9AYK3jf
 lQvHRodp264sSpRhlJTvW7SJVtKK6TzGo0m1AwYCrU63AURCwBehNTKPHB3HOsGLOfWo
 x6jw==
X-Gm-Message-State: AOAM530m7vhQPN/pK8tAFv8iwWq+MCudL0AFoY1BRjDd+qInm2605LL8
 QMPETthWJltMEB9huevVfv9jNtJHIM16i5763k4=
X-Google-Smtp-Source: ABdhPJwkB9gsXdYcwpLg+R/UQ27PkC7ft/YcKcFQBaZX8rf2MyQfdpHzq4CpISmuQpYkEqrOt08phUOao1p245wLzrA=
X-Received: by 2002:a1f:1184:: with SMTP id 126mr13321709vkr.21.1618307721975; 
 Tue, 13 Apr 2021 02:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
 <20210413093059.GB15806@arm.com>
In-Reply-To: <20210413093059.GB15806@arm.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>
Date: Tue, 13 Apr 2021 11:55:11 +0200
Message-ID: <CAHB2gtQAtcud3tKaJ0QnsQq1KP7iceRW9HZRpf30Qz+w=nMadg@mail.gmail.com>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 will.deacon@arm.com, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_025523_865669_DCBF6CF5 
X-CRM114-Status: GOOD (  35.58  )
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

T24gVHVlLCBBcHIgMTMsIDIwMjEgYXQgMTE6MzEgQU0gQ2F0YWxpbiBNYXJpbmFzCjxjYXRhbGlu
Lm1hcmluYXNAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEFwciAxMywgMjAyMSBhdCAxMToy
Mjo0MEFNICswMjAwLCBDaHJpc3RvcGggTcO8bGxuZXIgd3JvdGU6Cj4gPiBPbiBUdWUsIEFwciAx
MywgMjAyMSBhdCAxMDowMyBBTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+
IHdyb3RlOgo+ID4gPiBPbiBNb24sIEFwciAxMiwgMjAyMSBhdCAxMTo1NDo1NVBNICswMjAwLCBD
aHJpc3RvcGggTcO8bGxuZXIgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBBcHIgMTIsIDIwMjEgYXQg
NzozMyBQTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPiA+ID4g
PiA+IE15IHBsYW4gaXMgdG8gYWRkIGEgZ2VuZXJpYyB0aWNrZXQtYmFzZWQgbG9jaywgd2hpY2gg
Y2FuIGJlIHNlbGVjdGVkIGF0Cj4gPiA+ID4gPiBjb21waWxlIHRpbWUuICBJdCdsbCBoYXZlIG5v
IGFyY2hpdGVjdHVyZSBkZXBlbmRlbmNpZXMgKHRob3VnaCBpdCdsbAo+ID4gPiA+ID4gbGlrZWx5
IGhhdmUgc29tZSBob29rcyBmb3IgYXJjaGl0ZWN0dXJlcyB0aGF0IGNhbiBtYWtlIHRoaXMgZ28g
ZmFzdGVyKS4KPiA+ID4gPiA+IFVzZXJzIGNhbiB0aGVuIGp1c3QgcGljayB3aGljaCBzcGlubG9j
ayBmbGF2b3IgdGhleSB3YW50LCB3aXRoIHRoZSBpZGVhCj4gPiA+ID4gPiBiZWluZyB0aGF0IHNt
YWxsZXIgc3lzdGVtcyB3aWxsIHBlcmZvcm0gYmV0dGVyIHdpdGggdGlja2V0IGxvY2tzIGFuZAo+
ID4gPiA+ID4gbGFyZ2VyIHN5c3RlbXMgd2lsbCBwZXJmb3JtIGJldHRlciB3aXRoIHF1ZXVlZCBs
b2Nrcy4gIFRoZSBtYWluIGdvYWwKPiA+ID4gPiA+IGhlcmUgaXMgdG8gZ2l2ZSB0aGUgbGVzcyB3
aWRlbHkgdXNlZCBhcmNoaXRlY3R1cmVzIGFuIGVhc3kgd2F5IHRvIGhhdmUKPiA+ID4gPiA+IGZh
aXIgbG9ja3MsIGFzIHJpZ2h0IG5vdyB3ZSd2ZSBnb3QgYSBsb3Qgb2YgY29kZSBkdXBsaWNhdGlv
biBiZWNhdXNlIGFueQo+ID4gPiA+ID4gYXJjaGl0ZWN0dXJlIHRoYXQgd2FudHMgdGlja2V0IGxv
Y2tzIGhhcyB0byBkbyBpdCB0aGVtc2VsdmVzLgo+ID4gPiA+Cj4gPiA+ID4gSW4gdGhlIGNhc2Ug
b2YgTEwvU0Mgc2VxdWVuY2VzLCB3ZSBoYXZlIGEgbWF4aW11bSBvZiAxNiBpbnN0cnVjdGlvbnMK
PiA+ID4gPiBvbiBSSVNDLVYuIE15IGNvbmNlcm4gd2l0aCBhIHB1cmUtQyBpbXBsZW1lbnRhdGlv
biB3b3VsZCBiZSB0aGF0Cj4gPiA+ID4gd2UgY2Fubm90IGd1YXJhbnRlZSB0aGlzIChlLmcuIHNv
bWVib2R5IHdhbnRzIHRvIGNvbXBpbGUgd2l0aCAtTzApCj4gPiA+ID4gYW5kIEkgZG9uJ3Qga25v
dyBvZiBhIHdheSB0byBhYm9ydCB0aGUgYnVpbGQgaW4gY2FzZSB0aGlzIGxpbWl0IGV4Y2VlZHMu
Cj4gPiA+ID4gVGhlcmVmb3JlIEkgaGF2ZSBwcmVmZXJyZWQgaW5saW5lIGFzc2VtYmx5IGZvciBP
cGVuU0JJIChteSBpbml0aWFsIGlkZWEKPiA+ID4gPiB3YXMgdG8gdXNlIGNsb3N1cmUtbGlrZSBM
TC9TQyBtYWNyb3MsIHdoZXJlIHlvdSBjYW4gd3JpdGUgdGhlIGxvb3AKPiA+ID4gPiBpbiBmb3Jt
IG9mIEMgY29kZSkuCj4gPiA+Cj4gPiA+IEZvciB0aWNrZXQgbG9ja3MgeW91IHJlYWxseSBvbmx5
IG5lZWRzIGF0b21pY19mZXRjaF9hZGQoKSBhbmQKPiA+ID4gc21wX3N0b3JlX3JlbGVhc2UoKSBh
bmQgYW4gYXJjaGl0ZWN0dXJhbCBndWFyYW50ZWVzIHRoYXQgdGhlCj4gPiA+IGF0b21pY19mZXRj
aF9hZGQoKSBoYXMgZndkIHByb2dyZXNzIHVuZGVyIGNvbnRlbnRpb24gYW5kIHRoYXQgYSBzdWIt
d29yZAo+ID4gPiBzdG9yZSAodGhyb3VnaCBzbXBfc3RvcmVfcmVsZWFzZSgpKSB3aWxsIGZhaWwg
dGhlIFNDLgo+ID4gPgo+ID4gPiBUaGVuIHlvdSBjYW4gZG8gc29tZXRoaW5nIGxpa2U6Cj4gPiA+
Cj4gPiA+IHZvaWQgbG9jayhhdG9taWNfdCAqbG9jaykKPiA+ID4gewo+ID4gPiAgICAgICAgIHUz
MiB2YWwgPSBhdG9taWNfZmV0Y2hfYWRkKDE8PDE2LCBsb2NrKTsgLyogU0MsIGdpdmVzIHVzIFJD
c2MgKi8KPiA+ID4gICAgICAgICB1MTYgdGlja2V0ID0gdmFsID4+IDE2Owo+ID4gPgo+ID4gPiAg
ICAgICAgIGZvciAoOzspIHsKPiA+ID4gICAgICAgICAgICAgICAgIGlmICh0aWNrZXQgPT0gKHUx
Nil2YWwpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiAgICAgICAg
ICAgICAgICAgY3B1X3JlbGF4KCk7Cj4gPiA+ICAgICAgICAgICAgICAgICB2YWwgPSBhdG9taWNf
cmVhZF9hY3F1aXJlKGxvY2spOwo+ID4gPiAgICAgICAgIH0KPiA+ID4gfQo+ID4gPgo+ID4gPiB2
b2lkIHVubG9jayhhdG9taWNfdCAqbG9jaykKPiA+ID4gewo+ID4gPiAgICAgICAgIHUxNiAqcHRy
ID0gKHUxNiAqKWxvY2sgKyAoISFfX0JJR19FTkRJQU5fXyk7Cj4gPiA+ICAgICAgICAgdTMyIHZh
bCA9IGF0b21pY19yZWFkKGxvY2spOwo+ID4gPgo+ID4gPiAgICAgICAgIHNtcF9zdG9yZV9yZWxl
YXNlKHB0ciwgKHUxNil2YWwgKyAxKTsKPiA+ID4gfQo+ID4gPgo+ID4gPiBUaGF0J3MgX2FsbW9z
dF8gYXMgc2ltcGxlIGFzIGEgdGVzdC1hbmQtc2V0IDotKSBJdCBpc24ndCBxdWl0ZSBvcHRpbWFs
Cj4gPiA+IG9uIHg4NiBmb3Igbm90IGJlaW5nIGFsbG93ZWQgdG8gdXNlIGEgbWVtb3Agb24gdW5s
b2NrLCBzaW5jZSBpdHMgYmVpbmcKPiA+ID4gZm9yY2VkIGludG8gYSBsb2FkLXN0b3JlIGJlY2F1
c2Ugb2YgYWxsIHRoZSB2b2xhdGlsZSwgYnV0IHdoYXRldmVyLgo+ID4KPiA+IFdoYXQgYWJvdXQg
dHJ5bG9jaygpPwo+ID4gSS5lLiBvbmUgY291bGQgaW1wbGVtZW50IHRyeWxvY2soKSB3aXRob3V0
IGEgbG9vcCwgYnkgbGV0dGluZwo+ID4gdHJ5bG9jaygpIGZhaWwgaWYgdGhlIFNDIGZhaWxzLgo+
ID4gVGhhdCBsb29rcyBzYWZlIG9uIGZpcnN0IHZpZXcsIGJ1dCBub2JvZHkgZG9lcyB0aGlzIHJp
Z2h0IG5vdy4KPgo+IE5vdCBmYW1pbGlhciB3aXRoIFJJU0MtViBidXQgSSdkIHJlY29tbWVuZCB0
aGF0IGEgdHJ5bG9jayBvbmx5IGZhaWxzIGlmCj4gdGhlIGxvY2sgaXMgbG9ja2VkIChhZnRlciBM
UikuIEEgU0MgbWF5IGZhaWwgZm9yIG90aGVyIHJlYXNvbnMKPiAoY2FjaGVsaW5lIGV2aWN0aW9u
OyBkZXBlbmRpbmcgb24gdGhlIG1pY3JvYXJjaGl0ZWN0dXJlKSBldmVuIGlmIHRoZQo+IGxvY2sg
aXMgdW5sb2NrZWQuIEF0IGxlYXN0IG9uIGFybTY0IHdlIGhhZCB0aGlzIGlzc3VlIHdpdGggYW4K
PiBpbXBsZW1lbnRhdGlvbiBoYXZpbmcgYSB0ZW5kZW5jeSB0byBhbHdheXMgZmFpbCB0aGUgZmly
c3QgU1RYUi4KCkludGVyZXN0aW5nIGRhdGEgcG9pbnQuClRoYW5rcyEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
