Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3E9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 00:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3iNXA0lZkhznhTE9BsRnCC1cTMeILqBJdw62yNpnnFw=; b=X+/LOrfSwIyjRE
	6zSssTopP/WGu3QapUBSCodJYtbjYDjt6p05nI2Otd30CLWemgg3Al6nCV8KSPRHaeZg/FRFenM6I
	SfHCO2iJ8ITQbiZUohnDRM14YS3sosrwMzyABD3yxAigZKQMp8NLWmdZhv+ftEqEqXG3qXrFf6nw7
	PP5H0JVWNld9bY5wqdCZej+9NhDiepoJub7+MZps/v6jx1h6WnbmNUUeSj7nzg1Ofls2qU5xgVGHh
	r57rDaNNnv9GWmgJbUB8PKa3TVykyzFkk/es4LdA7jb+vseknP8VLjwIYRLG0e63c0B0wHnMSyoVY
	BxeQOXn36aiwv9Ow9jTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu11N-00D08O-KP; Thu, 26 May 2022 00:06:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu11K-00D07i-Vg
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 00:06:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id p5-20020a1c2905000000b003970dd5404dso220908wmp.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 17:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=8Tx5B89wRH0aFtZRAXM3z4Ug2Ls2VMbHaKwqc1lcgtE=;
        b=jX2jVB2PuEO61dP74cOE7eq4vJdkuomI88a4aklp62TGE3bMzTdOq3ZvgrjcGanJ9x
         pfJzN51Dm3OFhODlZ8nHrvaPYURi1/sVlDr7PgEjKj2+voRVEaV8jtqXNVFido/CndB4
         TDCDphpS1W0yIPmkl6Uplc86qK+GsCyD/fpyitHuDEwcEx9PAIvX2AQtdvOT8gAaAh+R
         wdPolM7KIbK+USwDT2vAlnqDKt+md+4KDSduSjtNMf/9L6TbvEAI+aQ+9hUNU/EIM1aN
         hI/EfaJ25j//Oo9dP/A8bzDAbtwt/VvrCBnv+B4uLX5TIqhAy30LRc1OE304PsNFAKl1
         bkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=8Tx5B89wRH0aFtZRAXM3z4Ug2Ls2VMbHaKwqc1lcgtE=;
        b=bjjysYm86eKs/wpJzn3TVGQQWgQYf4Atg2qfNx2rzFM8nu1UhiUh7opr1Vo/WiUdY7
         EqJObNjgxYFb2OxEFutBPPRi/n/RK6jp/A59AvVv0POk2dORlZcAWw+jVGTej8mew66k
         gD109mvfP1goLPKsN9+k+1rjPzxSx8i1pDltWNA5PgCx5edWMvgMFB/bBhDOlMXvlDVK
         plY159PLAUucPh9jtL5QG+Bqald+qtpe8d1M6Fu9imZZpMhVlAxkLBNmjw2aZmjGmu1U
         X2eCLxZuF0teac7Iqaf038Nkv91qhtCyn4Tu5Ix7x7bZem8XTw3Ync5IaaVL42uzuL+X
         assQ==
X-Gm-Message-State: AOAM53264qnvPITXKRkQdPGkleASuRSi4zZMU7FpfmOy/bzxmYVb4Ak/
	074qGMztc48D8/tnRoy0E7rFZg==
X-Google-Smtp-Source: ABdhPJyIzFHlmQXXDNNZPf3lpOzfpRz9q68yW2F7qmH0Tb9sXVpEVISc1p9gio7TPnqDSk3AyvYnPg==
X-Received: by 2002:a1c:2184:0:b0:397:7421:7761 with SMTP id h126-20020a1c2184000000b0039774217761mr2902180wmh.14.1653523587899;
        Wed, 25 May 2022 17:06:27 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id e9-20020a05600c4e4900b003942a244f2esm3087161wmq.7.2022.05.25.17.06.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 May 2022 17:06:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 5/5] riscv/efi_stub: Support for 64bit boot-hartid
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAOnJCUKbT88c+_PzEuchEtzjEtiHcMFvRH_G98z1AmpSdRH+BA@mail.gmail.com>
Date: Thu, 26 May 2022 01:06:26 +0100
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Atish Patra <atishp@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 Sunil V L <sunil.vl@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Message-Id: <898EDFB9-D4AE-45CD-AEEC-FAB4BE7AEBF4@jrtc27.com>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
 <20220525151106.2176147-6-sunilvl@ventanamicro.com>
 <CAMj1kXFhEBv7MVCKZuXdx9=hZx3qWbkATdLDwXAe_Zn9Xyx=dg@mail.gmail.com>
 <1e90b15b-8c73-0de8-2885-1292923b7575@canonical.com>
 <CAOnJCU+r6KgR7bd2dx5QLmmVLjJX8GhETHb6rG65wq0e_m6FVA@mail.gmail.com>
 <5829932A-6E45-46CA-AADA-14EDD903C4AD@jrtc27.com>
 <CAOnJCUKbT88c+_PzEuchEtzjEtiHcMFvRH_G98z1AmpSdRH+BA@mail.gmail.com>
To: Atish Patra <atishp@atishpatra.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_170631_064113_141D8B1A 
X-CRM114-Status: GOOD (  20.04  )
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

T24gMjYgTWF5IDIwMjIsIGF0IDAwOjQ5LCBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0aXNocGF0cmEu
b3JnPiB3cm90ZToKPiAKPiBPbiBXZWQsIE1heSAyNSwgMjAyMiBhdCA0OjM2IFBNIEplc3NpY2Eg
Q2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4+IAo+PiBPbiAyNiBNYXkgMjAyMiwg
YXQgMDA6MTEsIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+Pj4g
Cj4+PiBPbiBXZWQsIE1heSAyNSwgMjAyMiBhdCA5OjA5IEFNIEhlaW5yaWNoIFNjaHVjaGFyZHQK
Pj4+IDxoZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Pj4+IAo+Pj4+
IE9uIDUvMjUvMjIgMTc6NDgsIEFyZCBCaWVzaGV1dmVsIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIDI1
IE1heSAyMDIyIGF0IDE3OjExLCBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4g
d3JvdGU6Cj4+Pj4+PiAKPj4+Pj4+IFRoZSBib290LWhhcnRpZCBjYW4gYmUgYSA2NGJpdCB2YWx1
ZSBvbiBSVjY0IHBsYXRmb3Jtcy4gQ3VycmVudGx5LAo+Pj4+Pj4gdGhlICJib290LWhhcnRpZCIg
aW4gRFQgaXMgYXNzdW1lZCB0byBiZSAzMmJpdCBvbmx5LiBUaGlzIHBhdGNoCj4+Pj4+PiBkZXRl
Y3RzIHRoZSBzaXplIG9mIHRoZSAiYm9vdC1oYXJ0aWQiIGFuZCB1c2VzIDMyYml0IG9yIDY0Yml0
Cj4+Pj4+PiBGRFQgcmVhZHMgYXBwcm9wcmlhdGVseS4KPj4+Pj4+IAo+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4+Pj4+PiAtLS0KPj4+
Pj4+IGRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvcmlzY3Ytc3R1Yi5jIHwgMTIgKysrKysr
KysrLS0tCj4+Pj4+PiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Pj4+Pj4gCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9lZmkvbGli
c3R1Yi9yaXNjdi1zdHViLmMgYi9kcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3Jpc2N2LXN0
dWIuYwo+Pj4+Pj4gaW5kZXggOWU4NWU1OGQxZjI3Li5kNzQ4NTMzZjEzMjkgMTAwNjQ0Cj4+Pj4+
PiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3Jpc2N2LXN0dWIuYwo+Pj4+Pj4g
KysrIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9yaXNjdi1zdHViLmMKPj4+Pj4+IEBA
IC0yOSw3ICsyOSw3IEBAIHN0YXRpYyBpbnQgZ2V0X2Jvb3RfaGFydGlkX2Zyb21fZmR0KHZvaWQp
Cj4+Pj4+PiB7Cj4+Pj4+PiBjb25zdCB2b2lkICpmZHQ7Cj4+Pj4+PiBpbnQgY2hvc2VuX25vZGUs
IGxlbjsKPj4+Pj4+IC0gY29uc3QgZmR0MzJfdCAqcHJvcDsKPj4+Pj4+ICsgY29uc3Qgdm9pZCAq
cHJvcDsKPj4+Pj4+IAo+Pj4+Pj4gZmR0ID0gZ2V0X2VmaV9jb25maWdfdGFibGUoREVWSUNFX1RS
RUVfR1VJRCk7Cj4+Pj4+PiBpZiAoIWZkdCkKPj4+Pj4+IEBAIC00MCwxMCArNDAsMTYgQEAgc3Rh
dGljIGludCBnZXRfYm9vdF9oYXJ0aWRfZnJvbV9mZHQodm9pZCkKPj4+Pj4+IHJldHVybiAtRUlO
VkFMOwo+Pj4+Pj4gCj4+Pj4+PiBwcm9wID0gZmR0X2dldHByb3AoKHZvaWQgKilmZHQsIGNob3Nl
bl9ub2RlLCAiYm9vdC1oYXJ0aWQiLCAmbGVuKTsKPj4+Pj4+IC0gaWYgKCFwcm9wIHx8IGxlbiAh
PSBzaXplb2YodTMyKSkKPj4+Pj4+ICsgaWYgKCFwcm9wKQo+Pj4+Pj4gKyByZXR1cm4gLUVJTlZB
TDsKPj4+Pj4+ICsKPj4+Pj4+ICsgaWYgKGxlbiA9PSBzaXplb2YodTMyKSkKPj4+Pj4+ICsgaGFy
dGlkID0gKHVuc2lnbmVkIGxvbmcpIGZkdDMyX3RvX2NwdSgqKGZkdDMyX3QgKilwcm9wKTsKPj4+
Pj4+ICsgZWxzZSBpZiAobGVuID09IHNpemVvZih1NjQpKQo+Pj4+Pj4gKyBoYXJ0aWQgPSAodW5z
aWduZWQgbG9uZykgZmR0NjRfdG9fY3B1KCooZmR0NjRfdCAqKXByb3ApOwo+Pj4+PiAKPj4+Pj4g
RG9lcyBSSVNDLVYgY2FyZSBhYm91dCBhbGlnbm1lbnQ/IEEgNjQtYml0IHF1YW50aXR5IGlzIG5v
dCBndWFyYW50ZWVkCj4+Pj4+IHRvIGFwcGVhciA2NC1iaXQgYWxpZ25lZCBpbiB0aGUgRFQsIGFu
ZCB0aGUgY2FzdCB2aW9sYXRlcyBDIGFsaWdubWVudAo+Pj4+PiBydWxlcywgc28gdGhpcyBzaG91
bGQgcHJvYmFibHkgdXNlZCBnZXRfdW5hbGlnbmVkX2JlNjQoKSBvciBzb21ldGhpbmcKPj4+Pj4g
bGlrZSB0aGF0Lgo+Pj4+IAo+Pj4+IFdoZW4gcnVubmluZyBpbiBTLW1vZGUgdGhlIFNCSSBoYW5k
bGVzIHVuYWxpZ25lZCBhY2Nlc3MgYnV0IHRoaXMgaGFzIGEKPj4+PiBwZXJmb3JtYW5jZSBwZW5h
bHR5Lgo+Pj4+IAo+Pj4+IFdlIGNvdWxkIHVzZSBmZHQ2NF90b19jcHUoX19nZXRfdW5hbGlnbmVk
X3QoZmR0NjRfdCwgcHJvcCkpIGhlcmUuCj4+Pj4gCj4+PiAKPj4+IEl0IGlzIGJldHRlciB0byBh
dm9pZCB1bmFsaWduZWQgYWNjZXNzIGluIHRoZSBrZXJuZWwuIFRoZXJlIGFyZSBzb21lCj4+PiBw
bGFucyB0byBkaXNhYmxlCj4+PiBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgZW11bGF0aW9uIGluIHRo
ZSBmaXJtd2FyZSBpZiB1c2VyIHNwYWNlIHJlcXVlc3RzCj4+PiBpdCB2aWEgcHJjdGwuCj4+IAo+
PiBXaHk/Cj4+IAo+IFRvIHN1cHBvcnQgcHJjdGwgY2FsbCB3aXRoIFBSX1NFVF9VTkFMSUdOCgpJ
cyB0aGF0IG5lZWRlZD8gSXTigJlzIGFsbW9zdCBlbnRpcmVseSB1bnVzZWQgYXMgZmFyIGFzIEkg
Y2FuIHRlbGwsIHdpdGgKYWxsIGJ1dCBvbmUgdXNlIHR1cm5pbmcgdW5hbGlnbmVkIGZpeHVwcyAq
b24qLCBhbmQgdGhlIG90aGVyIHVzZSBiZWluZwpJQS02NC1zcGVjaWZpYy4gV2hhdCBpcyB0aGUg
YWN0dWFsIHVzZSBjYXNlIG90aGVyIHRoYW4gc2VlaW5nIGEgdGhpbmcKdGhhdCBleGlzdHMgb24g
c29tZSBhcmNoaXRlY3R1cmVzIGFuZCB3YW50aW5nIHRvIGhhdmUgaXQgZG8gc29tZXRoaW5nCm9u
IFJJU0MtVj8KCkplc3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
