Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E26E68944
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knKwuUv71K+sRUDxPJHfkmokAHGRzTqOBFLaZjO37uM=; b=1z5y6CYYtPxLe9
	79iVG+p0rhlPai4VIUw7zdOTqyBKy/HGhNDKCGrAclyKaLemfozMHXv3Myf7OUWLLZlObuiq9+Bqu
	2ORLQj0k8IifrU1mLj3LIt6/OmZ1Ck+Kp7LQ+KfvDOULksedN9xYE/jrY6fdQ68Y1mCiyuWZZT+cS
	SXcdg0vgjqxOScEmUQ7ptVRY1Okfcu3/6wQGY/dNI78+c/3JO3n96C8tc3wClqwkbaV9yBACtWNrO
	Mg5K/q7cKTzXKeRlfb22aJs2ohAhYEiyUKrlLSeexZvCEziiqL+9Fs1N390TOANCCUPAEPykDhU7j
	V4NeqHwEaMJ36sl/pkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6QZC-00000002whK-3XdL;
	Thu, 31 Oct 2024 08:30:06 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6QZA-00000002wge-3tB0
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 08:30:06 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3e60fca5350so435922b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2024 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1730363400; x=1730968200; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH8e7AOiWH3awFct5qkKtFpb6rSOcfTNhf3kUlx1Gwg=;
        b=FEbwG5uUvCXxilidfjTDGnsHzFaTw0ijltMN9hfy+fLT1hU/9gjQBHPlbPSACOqb2c
         qWCUhMt2j3dcs9kks+Aqh/R55wNz80SFrjK9Qz3r4UUN9mGUHyMML6cyDdzG5HoAtXYx
         echaafrx0SIgx2WKbbsg2E0Uxxp94mGiuGgh9pYv+4zfidbWGBjo+SYffBoTJz4zwe1X
         zZoZ+tTPM+s6m/vujbbcUZ3HECSRg0yBGQjvpDvPojRs4B0dbIAvQQgQf5e/9AbqdhNd
         ej1eiCBjKv5Jc0QpTrqLpNeooSozrbPuXXXqQB/RCMFVJ0jii7El/nNdpfClKWLJMbk4
         9atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730363400; x=1730968200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vH8e7AOiWH3awFct5qkKtFpb6rSOcfTNhf3kUlx1Gwg=;
        b=N75A0s0X8mCpZ7JkhJwvkF0jOSoHMQfUgaIRB4DafQJSw+uLbQkuS5f8o8OuB1C+Tu
         m5EUdl0vY92nb/LUrdO4VaYkpINxWUnvZ4Ly0+vtni9ibsY2fLcdcXziYtw0ZnCsmqjg
         +Fg7BjRhEleAM+ImGm4UHaXXIdm66tXPLC+uwg66LFrZZDtBABSHgt11iYtXLH/jails
         WNuBoMpqwfMBOcnKk7f/Mmint9m1Vl5n2Q+joZ8pxopCtWxh1jkhCFIONS4B1O6V6uX9
         1QfTRPkWG0XTbunsGJNnGulxqOrrZWTEagufC6vIXcsJsXgBdodyrIrj212lhXkKWRdX
         O6Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWfCDDJ6DlRcOilPJjFj7D8oh61+0YKYIo87LvSpno24KLgIxpVVZI9OzqC7FeQPKhUFGH6ZxotfofVJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW04bT3s8zY5VazA5uEQ5qRNWoVS+8Zl7fRWbeuqMIn7Jf1GaS
	8senmEz62yN41SO/KcOAFZ+zssZBZ7kxaeRGfivmG3NFsFA/Xg3w0LtBw9MhvOJMmkm2QxyltoI
	x/vD0gO+3LAlRX8Kg40b4PZ4PRdq2FomvmdswnA==
X-Google-Smtp-Source: AGHT+IFExSOYo4sEJSuj2lEyGg5WDXQS8nF7c/ddrKLXCYZB/1hIU7pwgiPv7OfE75XNRxhuSDwF7s7QDJmPhfL9nQI=
X-Received: by 2002:a05:6808:178c:b0:3e6:777:a799 with SMTP id
 5614622812f47-3e6384430aemr16703618b6e.25.1730363400597; Thu, 31 Oct 2024
 01:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241025091527.57825-1-cuiyunhui@bytedance.com>
 <20241025-puritan-sank-b8a828ef5872@spud> <3CCBB0AB-169D-4677-9A44-53E4148908D5@jrtc27.com>
In-Reply-To: <3CCBB0AB-169D-4677-9A44-53E4148908D5@jrtc27.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 31 Oct 2024 16:29:49 +0800
Message-ID: <CAEEQ3wmn9W8A5y37aFisQqd=8Ke7Lt6nY6am99j0O2cNbsVj-A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: Enable Zicbom in usermode
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Conor Dooley <conor@kernel.org>, punit.agrawal@bytedance.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, cleger@rivosinc.com, 
	charlie@rivosinc.com, evan@rivosinc.com, samuel.holland@sifive.com, 
	andybnac@gmail.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_013004_999390_CB51A0E5 
X-CRM114-Status: GOOD (  26.41  )
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

SGkgSmVzc2ljYSwKCk9uIFNhdCwgT2N0IDI2LCAyMDI0IGF0IDEyOjMy4oCvQU0gSmVzc2ljYSBD
bGFya2UgPGpydGMyN0BqcnRjMjcuY29tPiB3cm90ZToKPgo+IE9uIDI1IE9jdCAyMDI0LCBhdCAx
MToxNiwgQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+IE9uIEZyaSwg
T2N0IDI1LCAyMDI0IGF0IDA1OjE1OjI3UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPj4g
TGlrZSBaaWNib3osIGJ5IGVuYWJsaW5nIHRoZSBjb3JyZXNwb25kaW5nIGJpdHMgb2Ygc2VudmNm
ZywKPiA+PiB0aGUgaW5zdHJ1Y3Rpb25zIGNiby5jbGVhbiwgY2JvLmZsdXNoLCBhbmQgY2JvLmlu
dmFsIGNhbiBiZQo+ID4+IGV4ZWN1dGVkIG5vcm1hbGx5IGluIHVzZXIgbW9kZS4KPiA+Pgo+ID4+
IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4+
IC0tLQo+ID4+IGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIgKy0KPiA+PiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPiA+PiBpbmRleCAxOTkyZWE2NDc4NmUuLmJjODUwNTE4YWI0MSAxMDA2
NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+PiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+PiBAQCAtOTI0LDcgKzkyNCw3IEBAIHVu
c2lnbmVkIGxvbmcgcmlzY3ZfZ2V0X2VsZl9od2NhcCh2b2lkKQo+ID4+IHZvaWQgX19pbml0IHJp
c2N2X3VzZXJfaXNhX2VuYWJsZSh2b2lkKQo+ID4+IHsKPiA+PiBpZiAocmlzY3ZfaGFzX2V4dGVu
c2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1pJQ0JPWikpCj4gPj4gLSBjdXJyZW50LT50aHJl
YWQuZW52Y2ZnIHw9IEVOVkNGR19DQlpFOwo+ID4+ICsgY3VycmVudC0+dGhyZWFkLmVudmNmZyB8
PSBFTlZDRkdfQ0JJRSB8IEVOVkNGR19DQkNGRSB8IEVOVkNGR19DQlpFOwo+ID4KPiA+IEkgYmVs
aWV2ZSB3ZSBwcmV2aW91c2x5IGRlY2lkZWQgdGhhdCB1c2Vyc3BhY2Ugc2hvdWxkIG5vdCBiZSBh
bGxvd2VkIHRvCj4gPiB1c2UgemljYm9tLCBidXQgdGhhdCBub3Qgd2l0aHN0YW5kaW5nIC0gdGhp
cyBpcyB3cm9uZy4gSXQgc2hvdWxkIGJlCj4gPiBjaGVja2luZyBmb3IgWmljYm9tLCBub3QgWmlj
Ym96Lgo+Cj4gQWxsb3dpbmcgY2xlYW4vZmx1c2ggaXMgc2FmZSBidXQgaGFzIHRoZSBzYW1lIHBy
b2JsZW1zIGFzIGZlbmNlLmkgd2l0aAo+IHJlZ2FyZHMgdG8gbWlncmF0aW5nIGJldHdlZW4gaGFy
dHMuIEFsbG93aW5nIGludmFsaWRhdGUsIHVubGVzcyBtYXBwZWQKPiB0byBmbHVzaCwgaXMgbm90
IHNhZmUgaW4gZ2VuZXJhbCB1bmxlc3MgdGhlIGtlcm5lbCBkb2VzIGEgbG90IG9mCj4gZmx1c2hp
bmcgdG8gYXZvaWQgdXNlcnNwYWNlIGFjY2Vzc2luZyBkYXRhIGl0IHNob3VsZG7igJl0IGJlIGFi
bGUgdG8gc2VlLgo+Cj4gQWxzbywgRU5WQ0ZHX0NCSUUgaXMgYSBtYXNrIGZvciBhIG11bHRpLWJp
dCBmaWVsZCwgd2hpY2ggaGFwcGVucyB0bwo+IGhhdmUgdGhlIHNhbWUgdmFsdWUgYXMgRU5WQ0ZH
X0NCSUVfSU5WIChpLmUuIHJlYWxseSBpcyBtYWtpbmcgY2JvLmludmFsCj4gYmUgYW4gaW52YWxp
ZGF0ZSkuIEkgbm90ZSB0aGF0IHRoZSBLVk0gY29kZSwgd2hpY2ggdGhpcyBsaWtlbHkgY29waWVk
Cj4gZnJvbSg/KSwgbWFrZXMgdGhlIHNhbWUgbWlzdGFrZSwgYnV0IHRoZXJlIHRoYXQgaXMgdGhl
IGludGVuZGVkCj4gYmVoYXZpb3VyLCBpZiBtaXNsZWFkaW5nIGFib3V0IHdoYXQgdGhlIGZpZWxk
IHJlYWxseSBpcy4KPgo+IFNvLCB3aXRoIHN1aXRhYmxlIGNhdmVhdHMsIGFsbG93aW5nIGNsZWFu
L2ZsdXNoIGNvdWxkIGJlIGEgcmVhc29uYWJsZQo+IHRoaW5nIHRvIGRvIChtYXliZSB1c2VmdWwg
Zm9yIHVzZXJzcGFjZSBkcml2ZXJzIHNvIGxvbmcgYXMgdGhleSBwaW4KPiB0aGVtc2VsdmVzIHRv
IGEgc3BlY2lmaWMgaGFydD8pLCBidXQgaW52YWxpZGF0ZSBzaG91bGQgb25seSBldmVyIGJlCj4g
YWxsb3dlZCBpZiBtYXBwZWQgdG8gZmx1c2guCj4KPiBKZXNzCj4KWWVzLiBUaGUgb3JpZ2luYWwg
aW50ZW50aW9uIGlzIHRvIGVuYWJsZSBjbGVhbi9mbHVzaC9pbnZhbGlkLiBTbwpFTlZDRkdfQ0JJ
RSB8IEVOVkNGR19DQkNGRSBpcyBhZGRlZC4gV2hlbiBvbmUgY29yZSBpbml0aWF0ZXMgYW4KaW52
YWxpZGF0aW9uLCBvdGhlciBjb3JlcyB3aWxsIGFsc28gaW52YWxpZGF0ZSB0aGUgY29ycmVzcG9u
ZGluZyBjYWNoZQpsaW5lLiBTbyBkbyB3ZSBub3QgbmVlZCB0byB3b3JyeSBhYm91dCB0aGlzIHBy
b2JsZW0/IE1vcmVvdmVyLAppbnZhbGlkYXRpb24gaXMgbm90IGZvdW5kIGluIHRoZSBsb2dpYyBv
ZiBkaXNhYmxpbmcgcHJlZW1wdGlvbiBpbiB0aGUKa2VybmVsLiBPciBwZXJoYXBzIGJpbmRpbmcg
Y29yZXMgYmVsb25ncyB0byB0aGUgdXNlci1zcGFjZSdzIG93bgpsb2dpYy4gQ2FuIHRoaXMgcGF0
Y2ggYmUgZml4ZWQgYXMgUklTQ1ZfSVNBX0VYVF9aSUNCT00gYW5kIHRoZW4gYSB2MgpiZSBzZW50
PwoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
