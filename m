Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76B1EEAA45
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7C+pvMLX+wLT1XBGwFs3W594onAxAY6YYABLdHjq+QM=; b=vZRKan5/eSaXR4
	47ghXUCETArz/iQfcsAxm5SfvFeby4pAkMMwIFsDeCIxRpV+v07BXZMWUFPWbd3GKRC8WquUdoi29
	MTT8xEI7U5/xc5AYxVbIhxlxj7MvrrNj3P1xmcVN5CQQqZKlP4j/BLV5xXeW5V7LxjKib9IPerx3w
	+PvSCgUifiQT+lJNd/EW373nrOavIgxGov2X8EqgGk7C6mbWYfYbAjjrHeXgxF1vxdJIX2Zxuew3g
	24qqYV6rjZVo91ApGVl5koJqKweIbUtv0K+ljLe+TCscZoYnZyQb5aDZ+Owo0abYBajU1TaOxthsV
	xAuBQz7bcKh1o9pdcNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnHQ-008d6g-1M;
	Thu, 14 Sep 2023 14:25:16 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnHN-008d5J-2Y
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 14:25:15 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bf5bf33bcdso17051421fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1694701509; x=1695306309; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsrwoDLjRwnaUZYSy5S/KIF4yMwSVKMWZIEdp6t3G5c=;
        b=aKe4Q5a2+JxXYqRNmLdDroKC6wXyVtV7umywy7+XOrD/uLHx0b05tymzm8FTg40Foe
         DGl/45S9NQ/e0MTa/bAtb3Li4MaotJVNVLIfETke5dvZDpJkHsi3o7SzB89vXJlRW0AF
         hzvxSCc9/sTeJU1skYXkvZkAn1McGvHj7ygiS9wECTgF3iSRkFt5hp+eOI7CIxncCiFM
         zoNQ1dqDRoKMt8r+HmFSwDFgdu4cgUcgRW7XiincB8O/uxzbeSP0rlXslbhbsUoER6xb
         dqwkPM7Em0mdvAyOUZcUBJGrIy0cnCK7tk35HmK5cALUbC5FZzocj9RaNvQlbAzT2lib
         4pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694701509; x=1695306309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsrwoDLjRwnaUZYSy5S/KIF4yMwSVKMWZIEdp6t3G5c=;
        b=sWARat2/4n0e6Gau29SCdSHX8EeK0ZN76wpgiunNgoJ4CeJaMLxcKS0lmKDqoqwgV9
         zsAndmtHl7nU2Uq+ZqG7gs6NeA9oVUBoJKpQToo7B0km2yUks5YYuYbkEU0ltT5yo8C2
         CbzGUJunNMdhMd81Yf28nbSFs7a4M6q5lrSmjS9HPZ2Z7rQZkDgvBbvro+ag+hAcssl7
         Y9ZZovYuULEIG91f9tYCt/JpEwcx+DQ89C+nIjJXNHDJBelu7Yv6urdE9rVCjBeGvOJf
         dHvpc3+alSjEFDGA81BOtQHdE6Mm7EIgSRvORrM7VDarcwVO7LTXesOqSko3s3KRQnb1
         CR2Q==
X-Gm-Message-State: AOJu0YySg7AvSplnJ1Qj7MxMJvfiMb+E7T9NWucNox/hVCANYTo8uqeT
	FTByKEGDx/LCKz4cIB6nYDN/rS/OnNKaQKAMJoJucQ==
X-Google-Smtp-Source: AGHT+IFyq+HOt9ZCbHlcgwJ92zFW7w8JnSXnuczSf+sy7/bCSbqTHrj1vp8l9l0tUJyltYlfynCBiC2Z1KNZnnePLY0=
X-Received: by 2002:a05:6512:3988:b0:4f8:7124:6803 with SMTP id
 j8-20020a056512398800b004f871246803mr5641252lfu.35.1694701509009; Thu, 14 Sep
 2023 07:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230912115728.172982-1-bjorn@kernel.org> <20230914-roaming-plunging-948c78d9831c@wendy>
 <87pm2kap1p.fsf@all.your.base.are.belong.to.us> <20230914-float-uneven-7cd1a18b3978@wendy>
 <87zg1o3kpd.fsf@all.your.base.are.belong.to.us> <20230914-squad-ripping-e8c98e2d336b@spud>
In-Reply-To: <20230914-squad-ripping-e8c98e2d336b@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 14 Sep 2023 22:24:57 +0800
Message-ID: <CABgGipW6NhfOstpe-P7RZeaF-w72GLqiE2sxLsZVzJx1AC6kqA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] RISC-V BLAKE2s Vector implementation
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, Greentime Hu <greentime.hu@sifive.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Samuel Neves <sneves@dei.uc.pt>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_072513_880991_FC632552 
X-CRM114-Status: GOOD (  21.13  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTA6MTjigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMDQ6MTU6MTBQTSAr
MDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiA+IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+IHdyaXRlczoKPiA+Cj4gPiA+IE9uIFRodSwgU2VwIDE0LCAyMDIzIGF0
IDAyOjU5OjMwUE0gKzAyMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gPiA+PiBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cml0ZXM6Cj4gPiA+Pgo+ID4gPj4gPiBP
biBUdWUsIFNlcCAxMiwgMjAyMyBhdCAwMTo1NzoyMlBNICswMjAwLCBCasO2cm4gVMO2cGVsIHdy
b3RlOgo+ID4gPj4gPj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+
ID4gPj4gPj4KPiA+ID4+ID4+IEhpLAo+ID4gPj4gPj4KPiA+ID4+ID4+IFRoaXMgaXMgQW5keSdz
IGtlcm5lbCBtb2RlIHZlY3RvciBWMiBzZXJpZXMgWzFdLCB3aXRoIG15IEJMQUtFMnMKPiA+ID4+
ID4+IEFWWC01MTItdG8tUklTQy1WIHRyYW5zbGF0aW9uIHBhdGNoIGFwcGVuZGVkLgo+ID4gPj4g
Pj4KPiA+ID4+ID4+IEkndmUgdGFnZ2VkIGl0IGFzIFJGQywgc2luY2UgQW5keSdzIHNlcmllcyBp
cyBzdGlsbCBub3QgaW4tdHJlZSB5ZXQuCj4gPiA+PiA+Pgo+ID4gPj4gPj4gSXQncyBhIGZpcnN0
IHN0ZXAgdG93YXJkcyBhIFZlY3RvciBhaWRlZCBXaXJlZ3VhcmQhIDstKQo+ID4gPj4gPgo+ID4g
Pj4gPiBUaGlzIGhhcyB0aGUgc2FtZSBwcm9ibGVtcyBhcyBBbmR5J3Mgc3R1ZmYgJiBkb2Vzbid0
IGJ1aWxkIHByb3Blcmx5IGZvciB0aGUKPiA+ID4+ID4gYXV0b21hdGlvbi4gV2hhdCBpcyB0aGUg
cGxhbiBiZXR3ZWVuIHlvdXJzZWxmIGFuZCBBbmR5IGZvciBzdWJtaXR0aW5nIGEKPiA+ID4+ID4g
dmVyc2lvbiBvZiB0aGUgaW4ta2VybmVsIHZlY3RvciBzdXBwb3J0IHRoYXQgcGFzc2VzIGJ1aWxk
IHRlc3Rpbmc/Cj4gPiA+Pgo+ID4gPj4gSSdsbCBzeW5jaCB1cCB3aXRoIEFuZHkhIEknbSBub3Qg
ZXZlbiBzdXJlIHRoZSBibGFrZTJzIHBhdGNoIHNob3VsZCBwYXJ0Cj4gPiA+PiBvZiB0aGUgImlu
LWtlcm5lbCB2ZWN0b3IiIHNlcmllcyBhdCBhbGwuCgpIaSwgeWVzLCBJIGhhdmUgYSBwbGFuIHRv
IGZpeCBpdCByZWNlbnRseS4gUGxlYXNlIGV4cGVjdCBhIHJlc3BpbiBvZgp0aGUga2VybmVsLW1v
ZGUgdmVjdG9yIGluIDF+MiB3ZWVrcywgaWYgdGhpcyBkb2Vzbid0IHNlZW0gdG9vIGxvbmcgdG8K
eW91LgoKPiA+ID4KPiA+ID4gVGhlIGluLWtlcm5lbCB2ZWN0b3Igc3R1ZmYgc2hvdWxkIGNvbWUg
d2l0aCBhIHVzZXIsIG90aGVyd2lzZSBpdCdzIGRlYWQKPiA+ID4gY29kZSA6KQo+ID4KPiA+IFN1
cmUsIGp1c3Qgc28gd2UncmUgb24gdGhlIHNhbWUgcGFnZTsgUGF0Y2ggMyAoVmVjdG9yIFhPUikg
aXMgYSB1c2VyCj4gPiBmcm9tIG15IHBlcnNwZWN0aXZlLCBubz8KPgo+IEQnb2gKClRoYW5rcywK
QW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
