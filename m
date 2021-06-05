Return-Path: <SRS0=INRY=K7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BD4C47082
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 11:02:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BAB760FE5
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 11:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BAB760FE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScvriMAa3F3BHlIGV5kwrh2CIpxhxUqA2ADWWtlkLQw=; b=rHruxB9eEcsI+d
	XzDqdVIrdH5R0K3ZRKua5AYr7DaW4p/2bKS2Pt7Ttz1/wwsAbrKUYCps6lteH8K7A6iuFO2A+pNZM
	6m6rfL5MhKP+OJ+h8DEJeY0ltyBopZYEdPh2kAIrwX4uY05Feo5GnZQI9MnCiIVIbT2/V59sw2eKV
	CvqtyIbBnCheKKSVQyOVq+FhCXkfFAEAzAdcIHnYOpsb9MKgao07urbdIdvHgrMrLz3zNZZxeftA7
	0ZOHafdrccguEZGqGw6SUpn0/AXSKpW/Ju/1mknGrafnBU6C40wEVbHjr77LdLtpP5t7GZZS9rKNr
	A/D4bpxGs3rY4E/t/8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpU4Y-00GTul-DI; Sat, 05 Jun 2021 11:02:34 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpU4V-00GTu6-DN
 for linux-riscv@lists.infradead.org; Sat, 05 Jun 2021 11:02:33 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N3bGP-1lOMe81Uxf-010Zxx for <linux-riscv@lists.infradead.org>; Sat, 05
 Jun 2021 13:02:27 +0200
Received: by mail-wr1-f48.google.com with SMTP id h8so11774762wrz.8
 for <linux-riscv@lists.infradead.org>; Sat, 05 Jun 2021 04:02:26 -0700 (PDT)
X-Gm-Message-State: AOAM532picI9gJt4XPDVKwVlKoJfmURNrXllzklQZ1OTxlOWbv/Xya4c
 icP2CHGzSnm88gFO8HEkhI6is1fRmyAe/EHQlTo=
X-Google-Smtp-Source: ABdhPJyTgAm4kMtZ4p3Ermy7kQq56j4m/FpiomcM6zHsddzu7oi+hv92VtxR6BpYVuCoQL54tJkvc1afe1lQcNxED5I=
X-Received: by 2002:a5d:4050:: with SMTP id w16mr8108472wrp.99.1622890946655; 
 Sat, 05 Jun 2021 04:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210604120639.1447869-1-alex@ghiti.fr>
 <CAK8P3a1TiSNoqUEjTaqPyqnU8d0-p-yZkrsvmXt5fo4Rkfue_w@mail.gmail.com>
 <1287f6f3-2f07-3269-9048-8f7d08eecc09@ghiti.fr>
In-Reply-To: <1287f6f3-2f07-3269-9048-8f7d08eecc09@ghiti.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 5 Jun 2021 13:00:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1_N6dAdjWR10FtgaVz828o7W5Mp55DO3Ex+3en-ikOUw@mail.gmail.com>
Message-ID: <CAK8P3a1_N6dAdjWR10FtgaVz828o7W5Mp55DO3Ex+3en-ikOUw@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Fix BUILTIN_DTB for sifive and microchip soc
To: Alex Ghiti <alex@ghiti.fr>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:o2/vQiNt3RDhs7sdjAnH79BVUeDZ0sc6fBR3SFiZwy+ZpJhToFn
 93zc0EbZaVD8OE7sw21SxbH2d5xK/vaQaBalRFL0pQ7IpsYq+ql0C9Mii+Qms3JrPMaf2x/
 eipnEJBGmnTxYcBzGBWMZ1RqyZTinjDp36LBg66e8S+hUjp2AJCTLsKDSUdQTVQbfn6FPOx
 p1WrYzLpexjTxWxIcGrlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q036w6Ki1gs=:/pGRHo1hpFhvh7iUyoHMe3
 6ENnbUXUQxGv7a8d/jaU7ET1PibeJI0EFTjks16w2x9qEiGvzqR/YgD4dbzyZ8YxJcbanrplI
 U/HjflX7EZ4jMmAYWrkymYQE65qLHUDP1N+LIFUb6Ejy4Q4/M6rBf4y5Jcr/jESgMAW3PeUqe
 H0C8HKI0cq7TmVpbJpF8K+CWtCTHHHVmNp9PrNhnE6YyCs5+xcQcX/tnufnTOpkkVbFcXMt78
 fQyWwPt0ayKKYpH4nIC+821sUJ+D0Mlg2RnXkwAwkgDS0kUkv6EHgwzcyxKkmqlNizUnetYkH
 ZilJGDvEIOCP7Cf6zxJGox9V60muyxdOIpGGvCBYMu2psTARZpEBVh6ZdZcobfroj8t87dKHa
 qlt7GgMWyg7TVaPf+efnCNAMfXpSj/DY1rr9LP8Kg9RHktRs8Iq1shD6VQmVOJ4nTAe+eSt1L
 ZOu9kKqRQRX5aG8zksxOJ/uQ0Mvd1Nk1r2Bi0t0+xH01n5633+A3a3/SuWqLlrf5WmHQvcz1D
 6NfW0lE16991WQ4C2Rj/05o6HSL3dQ4NppVF10doxVRZsQlLtufrzIniE0zh7u9Qyxwi5/Zkw
 dhQ6mvrf457B9E1HCf67kyktDba6BGmaySmnMToBOWLETIbWFYXGy3vXQuCj/c8eh2ZSSz31Y
 Xu48=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_040231_770580_1D006F75 
X-CRM114-Status: GOOD (  20.32  )
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

T24gU2F0LCBKdW4gNSwgMjAyMSBhdCA4OjM3IEFNIEFsZXggR2hpdGkgPGFsZXhAZ2hpdGkuZnI+
IHdyb3RlOgo+IExlIDQvMDYvMjAyMSDDoCAxNTowOCwgQXJuZCBCZXJnbWFubiBhIMOpY3JpdCA6
Cj4gPiBPbiBGcmksIEp1biA0LCAyMDIxIGF0IDI6MDYgUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4
QGdoaXRpLmZyPiB3cm90ZToKPiA+Pgo+ID4+IEZpeCBCVUlMVElOX0RUQiBjb25maWcgd2hpY2gg
cmVzdWx0ZWQgaW4gYSBkdGIgdGhhdCB3YXMgYWN0dWFsbHkgbm90IGJ1aWx0Cj4gPj4gaW50byB0
aGUgTGludXggaW1hZ2U6IGluIHRoZSBzYW1lIG1hbm5lciBhcyBDYW5hYW4gc29jIGRvZXMsIGNy
ZWF0ZSBhbiBvYmplY3QKPiA+PiBmaWxlIGZyb20gdGhlIGR0YiBmaWxlIHRoYXQgd2lsbCBnZXQg
bGlua2VkIGludG8gdGhlIExpbnV4IGltYWdlLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgo+ID4KPiA+IEFsb25nIHRoZSBzYW1lIGxpbmVz
IGFzIHRoZSBjb21tZW50IHRoYXQgSmlzaGVuZyBaaGFuZyBtYWRlIG9uIHRoZSBmaXhlZAo+ID4g
YWRkcmVzcywgYnVpbGRpbmcgYSBkdGIgaW50byB0aGUga2VybmVsIGl0c2VsZiBmdW5kYW1lbnRh
bGx5IGJyZWFrcyBnZW5lcmljCj4gPiBrZXJuZWwgaW1hZ2VzLgo+ID4KPiA+IEkgY2FuIHVuZGVy
c3RhbmQgdXNpbmcgaXQgb24gSzIxMCwgd2hpY2ggaXMgZXh0cmVtZWx5IGxpbWl0ZWQgYW5kIHdv
dWxkbid0Cj4gPiBydW4gYSBnZW5lcmljIGtlcm5lbCBhbnl3YXksIGJ1dCBmb3Igbm9ybWFsIHBs
YXRmb3JtcyBsaWtlIG1pY3JvY2hpcCBhbmQKPiA+IHNpZml2ZSwgaXQgd291bGQgYmUgYmV0dGVy
IHRvIGRpc2FsbG93IENPTkZJR19CVUlMVElOX0RUQiBpbiBLY29uZmlnCj4gPiBhbmQgcmVxdWly
ZSBhIG5vbi1icm9rZW4gYm9vdCBsb2FkZXIuCj4KPiBJIGtpbmQgb2YgZGlzYWdyZWUgYmVjYXVz
ZSBpZiBJIHdhbnQgdG8gYnVpbGQgYSBjdXN0b20ga2VybmVsIGZvciB0aG9zZQo+IHBsYXRmb3Jt
cyB3aXRoIGEgYnVpbHRpbiBkdGIgZm9yIHNvbWUgcmVhc29ucyAoZGVidWcsIGRldmVsb3BtZW50
Li5FdGMpLAo+IEkgdGhpbmsgSSBzaG91bGQgYmUgYWJsZSB0byBkbyBzby4KCkhvdyBpcyB0aGUg
YnVpbHRpbiBkdGIgYmV0dGVyIHRoYW4gYXBwZW5kZWQgZHRiLCBvciBwYXNzaW5nIHRoZSBkdGIg
dG8gdGhlCmJvb3QgbG9hZGVyIGluIHRoYXQgY2FzZT8KCiAgICAgICAgIEFybmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
