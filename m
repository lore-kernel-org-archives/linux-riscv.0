Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD54C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 09:23:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A90611F2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 09:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1A90611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1b9gTl460Lo4CZJsaJIoRtTCsVocij1GbsixyjCTv1o=; b=Ee30TTFzDXriSJna9BhSXYeZA
	IW7fp+i1y3WFDjFqB28ynMpB2z+DlB4ZYlLA4AGVrLZSiohzEEy4IS7lt0sZ7+NgU5CR00SVIHt9V
	QSCnbGrVxMUdWImqI8wmoA9GQKRhL16KNBMzlVmC43jv0kpC6+20qHBg8jHvNDkfyREdUlZ98jmSQ
	A/HXnz7F5mewaxpokuJOtT/DaxKdj0XiN6zHdH8IcueguHvxlGBX1kAUALgcZ54rbppttc+/Wj/af
	c0BKotE4uujHxcOokmbV3dlCV0oB0giOOlrTNuMnxVHZNnADjnPYTlXxg9OIj7dWecDDqkb4I5Mhr
	i7kQYvP7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWFG6-008hAO-KJ; Tue, 13 Apr 2021 09:22:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFG3-008h9p-HG
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 09:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=3+fqnoLwxyQPHQHnoLLAVQBCiytVesKrPDDSyoe7Zqg=; b=TXhikxceVLHGrNtgxcE18YdBd0
 KhBYzwunt4ER1Dlqhe6alVzufTqUNhoh+H1PTPnZI5S+KOS2m7+Pd4Uw3pcWviJTdUlxuv0sHjQii
 +laZ7/wRERuaNoCnOUDqJU2KSFLQuFfrIdFvyqkRKfF5nyosDokgM/NqiHpEgG+WwD8KCfRpnPlz0
 NY3mwEe/G/S2RVTvDF1GOW9apGBVSbJ5tTTG98Fj7WOfkJ5uC+z1ajaJa00tu6j1XukMQZlR6JRuZ
 COGnAl8vJwdlo4EjGrlq5e3NhoiIP6Eu80AlX9NieHEmCOkHErsInz7QGIsAFYAiR8pnrS1Hnsvtu
 6k1dPF5w==;
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFG0-006sEQ-OJ
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 09:22:54 +0000
Received: by mail-ua1-x92b.google.com with SMTP id q18so5095540uas.11
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 02:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3+fqnoLwxyQPHQHnoLLAVQBCiytVesKrPDDSyoe7Zqg=;
 b=QvOv1wOuaUSs/Qm4R+41uWhRkCEcpDeQWbvMM4smQD31kuqRumI1NyigCeageOAdaE
 I4fMOa0DXTfi3G0aTmh+6redYSzmYSvn8w1B5m4CkzgrE1W2t4OgOv4eyq2cYPzWfwTz
 ziCG1/UxTtcjZk1PiQGSv+YSBhCa60yNjLGDBnBzHiz7iq4+huRbuMkc9o7OuiZlcs+e
 C29ixSkYJdx6sW5Sc3JLDZHPth1M6RhsT9dxzGuZPWDvD5pbavGh/7DMz7bTR1hVrQAD
 iF2bMOhKSFDXoePtFFDYzCla4ZcIR0HKbs4gY10KtaZ2rEmnHxnp4NvnoOWcyEsqVz4X
 qD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3+fqnoLwxyQPHQHnoLLAVQBCiytVesKrPDDSyoe7Zqg=;
 b=CVTkrSQdXrYmIjgCGwFnEpIIZECL7Ta0yS8yp5FXqqTNzMIpXfFCn2pUPNiXJnxn9B
 ttTD6jYgt7wdYrNDnoZiAp67An6jZo21g+nYsSqdpkJFXtSsTOvC9QDFaDy809UgKIoZ
 njMQKIuHz536AZMlfXHmcwr4ULqtrkF4wiScDRA3gSlSW6h3yU6cXoUw4QnLd12/av3a
 XwdNvewhBOyQ1jIMH7Kru/uYSp3GD4P/zF0ObUU/OZPOXi8FdSEef56Hzi1+g0TWJAjD
 zlccqdvzjc5WTrr4L1P+oEYrEAiKckuk2aR7AcIvvRH7RX4oHhbHplb+NuXfcQLEUk3U
 dh5w==
X-Gm-Message-State: AOAM533cpHfz/FIUFA8+hpfc088eJCHgmN17zqH7FYRNfL/f+LQUOq3r
 r0YtmuE66OOaDWgsLiA6jM1ejK02ASJSzI0iLlk=
X-Google-Smtp-Source: ABdhPJwCsSi4s4YrIkf6QDZ0+X7eoYdJ+MGzKe+aVa0JddnDAt4pwi6WTWzy1mAn31Yln4iO8o5BWzyJHJW8fmDzKTc=
X-Received: by 2002:a9f:2c90:: with SMTP id w16mr22430324uaj.88.1618305771239; 
 Tue, 13 Apr 2021 02:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
In-Reply-To: <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>
Date: Tue, 13 Apr 2021 11:22:40 +0200
Message-ID: <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
To: Peter Zijlstra <peterz@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 catalin.marinas@arm.com, will.deacon@arm.com, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_022252_816831_1F2215A3 
X-CRM114-Status: GOOD (  27.25  )
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

T24gVHVlLCBBcHIgMTMsIDIwMjEgYXQgMTA6MDMgQU0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgQXByIDEyLCAyMDIxIGF0IDExOjU0OjU1
UE0gKzAyMDAsIENocmlzdG9waCBNw7xsbG5lciB3cm90ZToKPiA+IE9uIE1vbiwgQXByIDEyLCAy
MDIxIGF0IDc6MzMgUE0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6
Cj4KPiA+ID4gTXkgcGxhbiBpcyB0byBhZGQgYSBnZW5lcmljIHRpY2tldC1iYXNlZCBsb2NrLCB3
aGljaCBjYW4gYmUgc2VsZWN0ZWQgYXQKPiA+ID4gY29tcGlsZSB0aW1lLiAgSXQnbGwgaGF2ZSBu
byBhcmNoaXRlY3R1cmUgZGVwZW5kZW5jaWVzICh0aG91Z2ggaXQnbGwKPiA+ID4gbGlrZWx5IGhh
dmUgc29tZSBob29rcyBmb3IgYXJjaGl0ZWN0dXJlcyB0aGF0IGNhbiBtYWtlIHRoaXMgZ28gZmFz
dGVyKS4KPiA+ID4gVXNlcnMgY2FuIHRoZW4ganVzdCBwaWNrIHdoaWNoIHNwaW5sb2NrIGZsYXZv
ciB0aGV5IHdhbnQsIHdpdGggdGhlIGlkZWEKPiA+ID4gYmVpbmcgdGhhdCBzbWFsbGVyIHN5c3Rl
bXMgd2lsbCBwZXJmb3JtIGJldHRlciB3aXRoIHRpY2tldCBsb2NrcyBhbmQKPiA+ID4gbGFyZ2Vy
IHN5c3RlbXMgd2lsbCBwZXJmb3JtIGJldHRlciB3aXRoIHF1ZXVlZCBsb2Nrcy4gIFRoZSBtYWlu
IGdvYWwKPiA+ID4gaGVyZSBpcyB0byBnaXZlIHRoZSBsZXNzIHdpZGVseSB1c2VkIGFyY2hpdGVj
dHVyZXMgYW4gZWFzeSB3YXkgdG8gaGF2ZQo+ID4gPiBmYWlyIGxvY2tzLCBhcyByaWdodCBub3cg
d2UndmUgZ290IGEgbG90IG9mIGNvZGUgZHVwbGljYXRpb24gYmVjYXVzZSBhbnkKPiA+ID4gYXJj
aGl0ZWN0dXJlIHRoYXQgd2FudHMgdGlja2V0IGxvY2tzIGhhcyB0byBkbyBpdCB0aGVtc2VsdmVz
Lgo+ID4KPiA+IEluIHRoZSBjYXNlIG9mIExML1NDIHNlcXVlbmNlcywgd2UgaGF2ZSBhIG1heGlt
dW0gb2YgMTYgaW5zdHJ1Y3Rpb25zCj4gPiBvbiBSSVNDLVYuIE15IGNvbmNlcm4gd2l0aCBhIHB1
cmUtQyBpbXBsZW1lbnRhdGlvbiB3b3VsZCBiZSB0aGF0Cj4gPiB3ZSBjYW5ub3QgZ3VhcmFudGVl
IHRoaXMgKGUuZy4gc29tZWJvZHkgd2FudHMgdG8gY29tcGlsZSB3aXRoIC1PMCkKPiA+IGFuZCBJ
IGRvbid0IGtub3cgb2YgYSB3YXkgdG8gYWJvcnQgdGhlIGJ1aWxkIGluIGNhc2UgdGhpcyBsaW1p
dCBleGNlZWRzLgo+ID4gVGhlcmVmb3JlIEkgaGF2ZSBwcmVmZXJyZWQgaW5saW5lIGFzc2VtYmx5
IGZvciBPcGVuU0JJIChteSBpbml0aWFsIGlkZWEKPiA+IHdhcyB0byB1c2UgY2xvc3VyZS1saWtl
IExML1NDIG1hY3Jvcywgd2hlcmUgeW91IGNhbiB3cml0ZSB0aGUgbG9vcAo+ID4gaW4gZm9ybSBv
ZiBDIGNvZGUpLgo+Cj4gRm9yIHRpY2tldCBsb2NrcyB5b3UgcmVhbGx5IG9ubHkgbmVlZHMgYXRv
bWljX2ZldGNoX2FkZCgpIGFuZAo+IHNtcF9zdG9yZV9yZWxlYXNlKCkgYW5kIGFuIGFyY2hpdGVj
dHVyYWwgZ3VhcmFudGVlcyB0aGF0IHRoZQo+IGF0b21pY19mZXRjaF9hZGQoKSBoYXMgZndkIHBy
b2dyZXNzIHVuZGVyIGNvbnRlbnRpb24gYW5kIHRoYXQgYSBzdWItd29yZAo+IHN0b3JlICh0aHJv
dWdoIHNtcF9zdG9yZV9yZWxlYXNlKCkpIHdpbGwgZmFpbCB0aGUgU0MuCj4KPiBUaGVuIHlvdSBj
YW4gZG8gc29tZXRoaW5nIGxpa2U6Cj4KPiB2b2lkIGxvY2soYXRvbWljX3QgKmxvY2spCj4gewo+
ICAgICAgICAgdTMyIHZhbCA9IGF0b21pY19mZXRjaF9hZGQoMTw8MTYsIGxvY2spOyAvKiBTQywg
Z2l2ZXMgdXMgUkNzYyAqLwo+ICAgICAgICAgdTE2IHRpY2tldCA9IHZhbCA+PiAxNjsKPgo+ICAg
ICAgICAgZm9yICg7Oykgewo+ICAgICAgICAgICAgICAgICBpZiAodGlja2V0ID09ICh1MTYpdmFs
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAgICBjcHVf
cmVsYXgoKTsKPiAgICAgICAgICAgICAgICAgdmFsID0gYXRvbWljX3JlYWRfYWNxdWlyZShsb2Nr
KTsKPiAgICAgICAgIH0KPiB9Cj4KPiB2b2lkIHVubG9jayhhdG9taWNfdCAqbG9jaykKPiB7Cj4g
ICAgICAgICB1MTYgKnB0ciA9ICh1MTYgKilsb2NrICsgKCEhX19CSUdfRU5ESUFOX18pOwo+ICAg
ICAgICAgdTMyIHZhbCA9IGF0b21pY19yZWFkKGxvY2spOwo+Cj4gICAgICAgICBzbXBfc3RvcmVf
cmVsZWFzZShwdHIsICh1MTYpdmFsICsgMSk7Cj4gfQo+Cj4gVGhhdCdzIF9hbG1vc3RfIGFzIHNp
bXBsZSBhcyBhIHRlc3QtYW5kLXNldCA6LSkgSXQgaXNuJ3QgcXVpdGUgb3B0aW1hbAo+IG9uIHg4
NiBmb3Igbm90IGJlaW5nIGFsbG93ZWQgdG8gdXNlIGEgbWVtb3Agb24gdW5sb2NrLCBzaW5jZSBp
dHMgYmVpbmcKPiBmb3JjZWQgaW50byBhIGxvYWQtc3RvcmUgYmVjYXVzZSBvZiBhbGwgdGhlIHZv
bGF0aWxlLCBidXQgd2hhdGV2ZXIuCgpXaGF0IGFib3V0IHRyeWxvY2soKT8KSS5lLiBvbmUgY291
bGQgaW1wbGVtZW50IHRyeWxvY2soKSB3aXRob3V0IGEgbG9vcCwgYnkgbGV0dGluZwp0cnlsb2Nr
KCkgZmFpbCBpZiB0aGUgU0MgZmFpbHMuClRoYXQgbG9va3Mgc2FmZSBvbiBmaXJzdCB2aWV3LCBi
dXQgbm9ib2R5IGRvZXMgdGhpcyByaWdodCBub3cuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
