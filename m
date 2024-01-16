Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABFCC47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJHRYWeZABN8sDchdoPDiWyDTqg+vdXxAAa+pToUFrs=; b=LMMraVx/5Bjc/s
	aPhnQnUU0fkaFSoF/BW/QxJ0p4fsjj4BoeXpuJoe6Ga2qdjlIQLLE9ubTkA9GuIKfbzTF6B0YKmse
	4Lt5DIOFz6qh8gQ0wG0is92dtWmkY5mYB+9B61Rx2yftRJUPVAoxdjvOQ22+dBahGXsVs8e4AaDKp
	r8+XDHWZGXd/bC0MCUgv8Z8r34tsUNLnJyMVFrNGUm+q792g3e8JmjKpFgs9yx3srJ+AkOZylFyUb
	nvyMFa+3VadRsYgo6MNBzCRYy3+x+qN2LraTXb/jFBz4JK9qgbUe79356HSr5Kkngp9eAvNnX+OVG
	tFgAINeXcktIMowp9tUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPmKt-00Cc2K-2A;
	Tue, 16 Jan 2024 16:30:47 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPmKr-00Cc1f-02
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 16:30:46 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-20503dc09adso6753573fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 08:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705422580; x=1706027380; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2EGnddz4HVPEzCJyDOKwQL+fRJZRBk2jtXoB7hv7LM=;
        b=hAAXxOzfca64eJr5RsVk+tO1K8HMyVMiybSZwPQonU2eemMBT1ActtvzJ+eeAKGhyp
         YHZVZ3DbU+yBmuTrWAcOdOIO+q7OsJn8z+KENXJvuCi7aIAjfMkCCR08kCVAdHSS6li1
         EkQrGF1sL5oHcQz9VzUV986bu+ndoXAgOo8fnFmVk3cXXRB6uW6+UxNG7Tf7RyVzPTP7
         yb/AuzOJNuxCl802vys7qliwtyzyXIeonhjJThdEbu1QwVJ1MWpbI+J3EryQDplOVTCH
         LlHRa5Y2u6lw3uvwwpo2L7sQqOsFaP/pPbiiBTlbPdCo+limZPfaldyfMWeFM250kBLq
         HfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705422580; x=1706027380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2EGnddz4HVPEzCJyDOKwQL+fRJZRBk2jtXoB7hv7LM=;
        b=f9VI501qTrG23j1+6xeZm7OiccVJO6jlIda0tiFHPsmKn1uJ4vx/2PFemNhra+UYH7
         5fPHJ1QXC//5OXEYdBF3DwlzfmMXRrQLBQO/SEWvli1PG/3VWRzo9ad7QTX+JIsMryDm
         7y/NwJXjhZGhwAZDD7/afsEBKCit+6ae2zGFPVkAeAtNjHYey8p3EyyIOnKOQ931/i6N
         3TR7lJaMfjuw24IaWdSlOHtoTBm33GWP3paMFMnfq19uQGppk73Xo4pWetKOaF1kmbpn
         LZea03hjY84KfFf93SMihrc4xYUBXgOS7pyWiMphJGSvo25rwZQB1yH5u+9RZGsKEMJ4
         Pykw==
X-Gm-Message-State: AOJu0Ywd5BrDHZdnzNAmaXavoKVJNn7xOyK2lVfWf/Oqoinp3sr6NgoW
	TSK29a6KysaXg3WDALEA3dqrGc0dbI122dG5FvA5gQ/diC8=
X-Google-Smtp-Source: AGHT+IHCQhTy467LiJCm+Ces7xo8Nf4D2WYTeF8aTO9nIK+JFa2hlgRzM/t9mbpUinDQzzdaKdcYgGUSWsNvY2jNX/g=
X-Received: by 2002:a05:6871:413:b0:203:743e:ba22 with SMTP id
 d19-20020a056871041300b00203743eba22mr10223706oag.89.1705422579663; Tue, 16
 Jan 2024 08:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-4-qiujingbao.dlmu@gmail.com> <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
 <CAJRtX8QFLoWnJBkepZrbneHX8qZdde=aw+zbdErVC91B=u==MA@mail.gmail.com>
 <007e8c14-13eb-4917-b9da-8d47d6c965c7@linaro.org> <CAJRtX8ROH4R_s1=ML5ka340PAE0SWJKK24yVWHw5gCd+7d9pkA@mail.gmail.com>
 <dfcf74a9-db76-43fe-9261-20bf7a993bc3@linaro.org>
In-Reply-To: <dfcf74a9-db76-43fe-9261-20bf7a993bc3@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Wed, 17 Jan 2024 00:29:28 +0800
Message-ID: <CAJRtX8Tkie+ykLv8L2EgBQcy9tVP5Yz-_J_eHE-9N9hjt+6gkg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_083045_050231_88935247 
X-CRM114-Status: GOOD (  32.18  )
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

T24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgMTI6MDPigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gMTYvMDEvMjAyNCAx
Njo1MSwgSmluZ2JhbyBRaXUgd3JvdGU6Cj4gPj4+IENWMTgwMCBpcyBhIFJJU0NWIGJhc2VkIFNP
QyB0aGF0IGluY2x1ZGVzIGFuIFJUQyBtb2R1bGUuIFRoZSBSVEMKPiA+Pj4gbW9kdWxlIGhhcyBh
biBPU0Mgb3NjaWxsYXRvcgo+ID4+Cj4gPj4KPiA+PiBJIGFtIG5vdCBnb2luZyB0byByZWFkIHBh
Z2VzIG9mIGRlc2NyaXB0aW9uLiBQbGVhc2Ugd3JpdGUgY29uY2lzZSByZXBsaWVzLgo+ID4KPiA+
IFRoYW5rcywgV2hhdCBJIG1lYW4gaXMgdGhhdCB0aGlzIGhhcmR3YXJlIGluY2x1ZGVzIHR3byBm
dW5jdGlvbnMsIFJUQwo+ID4gYW5kIFBPUi4gSG93IHNob3VsZCBJIGRlc2NyaWJlIHRoZWlyIHJl
bGF0aW9uc2hpcD8KPgo+IFlvdXIgUE9SIGRvZXMgbm90IG5lZWQgdG8gdGFrZSBhbnkgcmVzb3Vy
Y2VzLCBzbyBubyBuZWVkIHRvIGRlc2NyaWJlIGFueQo+IHJlbGF0aW9uc2hpcC4KPgo+IC4uLgo+
Cj4gPj4+IFlvdXIgc3VnZ2VzdGlvbiBpcywgZmlyc3RseSwgdGhlIHBvciBzdWJtb2R1bGUgZG9l
cyBub3QgaGF2ZSBhbnkKPiA+Pj4gcmVzb3VyY2VzLCBzbyBpdCBzaG91bGQgYmUgZGVsZXRlZC4K
PiA+Pgo+ID4+IFNvIHdoZXJlIGRpZCB5b3UgZGVsZXRlIGl0PyBJIHN0aWxsIHNlZSBpdCBpbiB0
aGlzIHBhdGNoLgo+ID4KPiA+IFNob3VsZCBJIGNvbXBsZXRlbHkgZGVsZXRlIGhpbT8gSG93IGNh
biBhIHBvciBkcml2ZXIgb2J0YWluIGRldmljZSBpbmZvcm1hdGlvbj8KPgo+IERlbGV0ZSBjb21w
bGV0ZWx5Lgo+Cj4gRGV2aWNlIGluZm9ybWF0aW9uPyBXaGF0IGlzIHRoaXM/IFdlIGFscmVhZHkg
YWdyZWVkIHlvdSBkb24ndCBoYXZlIGFueQo+IHJlc291cmNlcyBmb3IgUE9SLgo+Cj4gLi4uLgo+
Cj4gPj4gRGV2aWNlIGlzIG9ubHkgb25lIHRoaW5nLCBub3QgdHdvLgo+ID4+Cj4gPj4+ICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDB4NTAyNTAwMCAweDIwMDA+Owo+ID4+PiAgICAgICAgICAg
ICAgICAgICAgIGludGVycnVwdHMgPSA8MTcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gPj4+ICAg
ICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZvc2M+Owo+ID4+PiB9Owo+ID4+PiBIb3dldmVy
LCBpbiByZWFsaXR5LCB0aGUgUE9SIHN1Ym1vZHVsZSBkb2VzIG5vdCB1c2UgSVJRIGFuZCBDTEsu
Cj4gPj4+IFBsZWFzZSBkbyBub3QgaGVzaXRhdGUgdG8gdGVhY2guIFRoYW5rcy4KPiA+Pgo+ID4+
IEkgZXhwZWN0IG9uZSBkZXZpY2Ugbm9kZS4gSG93IG1hbnkgZHJpdmVycyB5b3UgaGF2ZSBkb2Vz
IG5vdCBtYXR0ZXI6IHlvdQo+ID4+IGNhbiBpbnN0YW50aWF0ZSAxMDAgTGludXggZGV2aWNlcyBp
biAxMDAgTGludXggZGV2aWNlIGRyaXZlcnMuCj4gPgo+ID4gSSB1bmRlcnN0YW5kIHdoYXQgeW91
IG1lYW4uIEEgZGV2aWNlIG5vZGUgY29ycmVzcG9uZHMgdG8gbXVsdGlwbGUgZHJpdmVycy4KPiA+
IFNob3VsZCBJIGNvbXBsZXRlbHkgZGVsZXRlIHRoZSBQT1IgZGV2aWNlIHRyZWUgbm9kZSBhbmQg
YWRkIGl0IHdoZW4KPiA+IHN1Ym1pdHRpbmcgdGhlIFBPUiBkcml2ZXI/Cj4KPiA/IEkgd3JvdGUg
aXQgaW4gcHJldmlvdXMgbWVzc2FnZXMgYW5kIHR3aWNlIGluIHRoaXMgdGhyZWFkLiBDb21wbGV0
ZWx5Cj4gZGVsZXRlLiBZb3UgZG8gbm90IGFkZCBpdCBiYWNrISBCZWNhdXNlIGlmIHlvdSBldmVy
IGludGVuZGVkIHRvIGFkZCBpdAo+IGJhY2ssIGl0IHNob3VsZCBiZSBhZGRlZCBzaW5jZSBiZWdp
bm5pbmcuIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0Cj4gc3VibWl0dGluZyBsYXRlciB3b3VsZCBz
b2x2ZS4KPgo+ID4gSWYgdGhhdCdzIHRoZSBjYXNlLCBob3cgY2FuIEkgZXhwbGFpbiB0aGF0IHRo
ZSBydGMgZGV2aWNlIHRyZWUgbm9kZQo+ID4gdXNlcyB0aGUgc3lzY29uIHRhZz8KPiA+IEhvdyBj
YW4gSSBkZXNjcmliZSBhIFBPUiBkZXZpY2UgaW4gRFRTPyBQT1IgaXMgYSBzdWJtb2R1bGUgb2Yg
UlRDLCBhbmQKPiA+IGl0IGFsc28gaGFzIGNvcnJlc3BvbmRpbmcgZHJpdmVycy4KPgo+IEkgc2Fp
ZCwgdGhlcmUgaXMgbm8gbmVlZCBmb3IgUE9SIGluIERUUywgYmVjYXVzZSB5b3UgaGF2ZSBub3Ro
aW5nIHRoZXJlLgo+IFdoeSBkbyB5b3UgaW5zaXN0IG9uIHB1dHRpbmcgaXQgb24gRFRTPwo+Cj4g
PiBJdCdzIGp1c3QgdGhhdCBoaXMgcmVzb3VyY2VzIGFyZSBvbmx5IHNoYXJlZCB3aXRoIFJUQydz
IFJlZy4KPgo+IFdoYXQgcmVzb3VyY2VzPyBSZWc/IFRoYXQncyBub3QgYSBzZXBhcmF0ZSByZXNv
dXJjZS4KCkknbSB2ZXJ5IHNvcnJ5IGFib3V0IHRoaXMuCkJ1dCBJIGZvdW5kIGEgYmluZGluZyBm
aWxlIHRoYXQgb25seSBjb250YWlucyBSZWcgYW5kIENvbXBhdGlibGUuCgpydGNAODA5MjAwMDAg
ewpjb21wYXRpYmxlID0gImNpcnJ1cyxlcDkzMDEtcnRjIjsKcmVnID0gPDB4ODA5MjAwMDAgMHgx
MDA+Owp9OwoKTGluazogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9jaXJy
dXMsZXA5MzAxLXJ0Yy55YW1sCgo+Cj4gVG8gc3VtbWFyaXplOiBEcm9wIFBPUiBmcm9tIERUUyBh
bmQgbmV2ZXIgYnJpbmcgaXQgYmFjaywgdW5sZXNzIHlvdSBjb21lCj4gd2l0aCBzb21lIGRpZmZl
cmVudCBhcmd1bWVudHMsIHdoaWNoIHlvdSBkaWQgbm90IHNheSBhbHJlYWR5Lgo+CgpZb3UgYXJl
IHJpZ2h0LCBpZiB0aGVyZSBpcyBubyBwb3IgZGV2aWNlIHRyZWUgbm9kZSwgaG93IGNhbiB0aGUg
cG9yCmRyaXZlciBvYnRhaW4gdGhlIFJlZz8KVGhhbmsgeW91IGFnYWluLgoKQmVzdCByZWdhcmRz
LApKaW5nYmFvIFFpdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
