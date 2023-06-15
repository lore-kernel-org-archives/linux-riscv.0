Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9492EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 05:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u536MKAfS4gG06DEIb9DCqBdIqpQevdDC4Q64XSNDWc=; b=ItWh+YCa8tB8Ed
	n2Z1+2N+A0b7+2ZZPqe2DZdU04Z5cVjIrK645mxC+Eeoq8Zwaq6JdPwe54RExAX4TMhkmWpxEE9SL
	Kx2OwVwTezhXlW2s9YefmyJ1xu7+wAL+N+OmlYfZGgDm3wggzGrtU2I5DxsBRiBjOBCJoQRtWhYbP
	UOtJznYoFb7akwkNy5qFxAK/e9yCcAqJ6KWLYPl7bTOFTRVY0+PbX6LPm/u6nh2r1zdNKGmSFwhwK
	bJcDENgGnBUjv4iX7BSw8lZ8Uou8j27QV49QyfEW5h9+nEFODXCtwcS69+tE2dD+o4UwheEIu4EGY
	LssvAvAVG70myW3PXZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9foq-00Dkwy-1e;
	Thu, 15 Jun 2023 05:46:52 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9fon-00DkwK-0w
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 05:46:50 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-bcd0226607bso666358276.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 22:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686808008; x=1689400008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4BBZdcwV53I4/SexLSk4m4e3GYSRd1uRKWHBlB/d9A=;
        b=UCpwqoTDu/DROrJquC1iaX7jIAVfquVUK6sURGuKJtxmN9g4RKtD00nto+vvsS8bNp
         oKbK8Y+RXJKKxH4f6u6caNxlKAG/AeQYQTFTIE75tNmOhPEd9IMFwtSOaoPgEfwZtAFP
         0jQj9J/BXTtj7MHcewu/5cBMRHZzzI2y+9/jGHd6knT98/9bBKLBsMO0LOZmRQjvFkfM
         UJ3CFb7GECyuOK7+34bZMWwtncdS6fZ0xfPvc8zd+4V22sN1LESqOE0EfWkHBkt5HF85
         xqcEhQa87H/PJxBncJy+DmQvK0yhYTj4LMeZw45Hk2jZsgiu92DYgaR+FrH5BTywvV3C
         mHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686808008; x=1689400008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4BBZdcwV53I4/SexLSk4m4e3GYSRd1uRKWHBlB/d9A=;
        b=GqAkFWa8dj/QuDULC7NPTFIDoOQXLXUmUe9x4vMv4fdBWPy+YZh4Wpy9v58WOePmdm
         xwhWb5W/nxfjTtOiG8x+8FzWn+Sh8IOWLQblqIbHSbg9QdZt2BD5kjX7m9UiSRBWs232
         tVzeNoJnyXe1q8UBPn2nVOYiZMfU4UiIKnoiNslynOVTgMR2mmslCK9xyAhCv4KKwuXU
         gTLN2uwtgZPFk/zVMBR69/L13nubDNjeE2uwMH1M8K+k+RCIsNVUbE2MC9Y/Z2Al5kn9
         x+3zDw4Lh4DHRqpbnYDz0TSUHEi+HZRNg7fTUjbV+Z1A9bxE5zqK7T2n09soJWHV3aJl
         HMew==
X-Gm-Message-State: AC+VfDyVORymdQMbx8ItqstfhvtAAATMwCcR+jbVxnPIefPrDR47oP7y
	7ECjqyLYtX/D9w0/6cVR4aLWLnWjt4CSYcHG1mPOMA==
X-Google-Smtp-Source: ACHHUZ672iNfzCBweTy9QLV/i/rzr5Vs6Tq41Zax9L7mWUr9BNqjo0vzLUUxM2G49aQFlhWghyl53s3wEwbXOODugyU=
X-Received: by 2002:a25:da84:0:b0:ba9:b304:107b with SMTP id
 n126-20020a25da84000000b00ba9b304107bmr4885752ybf.27.1686808007846; Wed, 14
 Jun 2023 22:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230613153415.350528-1-apatel@ventanamicro.com>
 <20230613153415.350528-7-apatel@ventanamicro.com> <ZInSqC6b7RPD1nzX@ziepe.ca>
 <CAK9=C2XBObBGh2R2pxVgM0E1gFPBn4m7DKzoTxEmDdZ9V1QLrA@mail.gmail.com> <ZInvvMZvrP4U/LL+@ziepe.ca>
In-Reply-To: <ZInvvMZvrP4U/LL+@ziepe.ca>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 15 Jun 2023 11:16:35 +0530
Message-ID: <CAK9=C2XKg5jBxBtrWMvQP--8Yb4ACFZFyX4wrtLy1efH7hO9ow@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] irqchip/riscv-imsic: Improve IOMMU DMA support
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	iommu@lists.linux.dev, Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_224649_338347_AD75C5D7 
X-CRM114-Status: GOOD (  30.60  )
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

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMTA6MjDigK9QTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6
aWVwZS5jYT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxNCwgMjAyMyBhdCAwOTo0Nzo1M1BNICsw
NTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgODoxNuKA
r1BNIEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+ID4KPiA+ID4gT24g
VHVlLCBKdW4gMTMsIDIwMjMgYXQgMDk6MDQ6MTFQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToK
PiA+ID4gPiBXZSBoYXZlIGEgc2VwYXJhdGUgUklTQy1WIElNU0lDIE1TSSBhZGRyZXNzIGZvciBl
YWNoIENQVSBzbyBjaGFuZ2luZwo+ID4gPiA+IE1TSSAob3IgSVJRKSBhZmZpbml0eSByZXN1bHRz
IGluIHJlLXByb2dyYW1taW5nIG9mIE1TSSBhZGRyZXNzIGluCj4gPiA+ID4gdGhlIFBDSWUgKG9y
IHBsYXRmb3JtKSBkZXZpY2UuCj4gPiA+ID4KPiA+ID4gPiBDdXJyZW50bHksIHRoZSBpb21tdV9k
bWFfcHJlcGFyZV9tc2koKSBpcyBjYWxsZWQgb25seSBvbmNlIGF0IHRoZQo+ID4gPiA+IHRpbWUg
b2YgSVJRIGFsbG9jYXRpb24gc28gSU9NTVUgRE1BIGRvbWFpbiB3aWxsIG9ubHkgaGF2ZSBtYXBw
aW5nCj4gPiA+ID4gZm9yIG9uZSBNU0kgcGFnZS4gVGhpcyBtZWFucyBpb21tdV9kbWFfY29tcG9z
ZV9tc2lfbXNnKCkgY2FsbGVkCj4gPiA+ID4gYnkgaW1zaWNfaXJxX2NvbXBvc2VfbXNpX21zZygp
IHdpbGwgYWx3YXlzIHVzZSB0aGUgc2FtZSBNU0kgcGFnZQo+ID4gPiA+IGlycmVzcGVjdGl2ZSB0
byB0YXJnZXQgQ1BVIE1TSSBhZGRyZXNzLiBJbiBvdGhlciB3b3JkcywgY2hhbmdpbmcKPiA+ID4g
PiBNU0kgKG9yIElSUSkgYWZmaW5pdHkgZm9yIGRldmljZSB1c2luZyBJT01NVSBETUEgZG9tYWlu
IHdpbGwgbm90Cj4gPiA+ID4gd29yay4KPiA+ID4KPiA+ID4gWW91IGRpZG4ndCBhbnN3ZXIgbXkg
cXVlc3Rpb24gZnJvbSBsYXN0IHRpbWUgLSB0aGVyZSBzZWVtcyB0byBiZSBubwo+ID4gPiBpb21t
dSBkcml2ZXIgaGVyZSBzbyB3aHkgYXJlIHlvdSBtZXNzaW5nIHdpdGggaW9tbXVfZG1hX3ByZXBh
cmVfbXNpKCk/Cj4gPiA+Cj4gPiA+IFRoaXMgcGF0aCBpcyBvbmx5IGZvciBwbGF0Zm9ybXMgdGhh
dCBoYXZlIElPTU1VIGRyaXZlcnMgdGhhdCB0cmFuc2xhdGUKPiA+ID4gdGhlIE1TSSB3aW5kb3cu
IFlvdSBzaG91bGQgYWRkIHRoaXMgY29kZSB0byBsaW5rIHRoZSBpbnRlcnJ1cHQKPiA+ID4gY29u
dHJvbGxlciB0byB0aGUgaW9tbXUgZHJpdmVyIHdoZW4geW91IGludHJvZHVjZSB0aGUgaW9tbXUg
ZHJpdmVyLAo+ID4gPiBub3QgaW4gdGhpcyBzZXJpZXM/Cj4gPiA+Cj4gPiA+IEFuZCwgYXMgSSBz
YWlkIGJlZm9yZSwgSSdkIGxpa2UgdG8gTk9UIHNlZSBuZXcgdXNlcnMgb2YKPiA+ID4gaW9tbXVf
ZG1hX3ByZXBhcmVfbXNpKCkgc2luY2UgaXQgaXMgYSB2ZXJ5IHByb2JsZW1hdGljIEFQSS4KPiA+
ID4KPiA+ID4gVGhpcyBoYWNraW5nIG9mIGl0IGhlcmUgaXMgbm90IG1ha2luZyBpdCBiZXR0ZXIg
OigKPiA+Cj4gPiBJIG1pc3VuZGVyc3Rvb2QgeW91ciBwcmV2aW91cyBjb21tZW50cy4KPiA+Cj4g
PiBXZSBjYW4gY2VydGFpbmx5IGRlYWwgd2l0aCB0aGlzIGxhdGVyIHdoZW4gdGhlIElPTU1VCj4g
PiBkcml2ZXIgaXMgYXZhaWxhYmxlIGZvciBSSVNDLVYuIEkgd2lsbCBkcm9wIHRoaXMgcGF0Y2gg
aW4gdGhlCj4gPiBuZXh0IHJldmlzaW9uLgo+Cj4gTm90IG9ubHkganVzdCB0aGlzIHBhdGNoIGJ1
dCB0aGUgY2FsbHMgdG8gaW9tbXVfZG1hX3ByZXBhcmVfbXNpKCkgYW5kCj4gcmVsYXRlZCBBUElz
IGluIHRoZSBwcmlvciBwYXRjaCB0b28uIEFzc3VtZSB0aGUgTVNJIHdpbmRvdyBpcyBkaXJlY3Rs
eQo+IHZpc2libGUgdG8gRE1BIHdpdGhvdXQgdHJhbnNsYXRpb24uCgpPa2F5LCBJIHdpbGwgcmVt
b3ZlIGlvbW11X2RtYV94eXooKSB1c2FnZSBmcm9tIElNU0lDIGRyaXZlciBpbiB0aGUKbmV4dCBy
ZXZpc2lvbi4KCj4KPiBXaGVuIHlvdSBjb21lIHdpdGggYW4gaW9tbXUgZHJpdmVyIHdlIGNhbiBk
aXNjdXNzIGhvdyBiZXN0IHRvIHByb2NlZWQuCgpZZXMsIHRoYXQncyBiZXR0ZXIuCgpSZWdhcmRz
LApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
