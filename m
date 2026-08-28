Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49467C61DC6
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpBr/BfFVbfTs1+/b/V40JoCwhIysjeOzYAog1HlIFw=; b=T+0faSA1HLokvr
	O0zyPNjzdYI6hC8yQ0JefwxdaY8s8vnUBpu8g31zpNANVkaukHVgMqtmXCOzWkdeVuX4x8gT5XL/6
	4Z9zMgiscY+Y7UmG6YMjklhvKjUvEPDzSayU4+UwlPt0X8UqitFXVKylO6wsb726qTVjoyA1J8H8P
	OMMSY3hsE6MDsJS//JnwyXI1DfaJTjqG9uO02xRKvuzPjlr8ygK+gply0C64JBDHGe+9N0JFy8AMY
	P1uNDbUPQs6gRLl97FuY1qRIc2V8t+3NwRxoWtw9CZ6XDhxobRQuyUSRer7pN/vfxSXLLJw8aUBTI
	7QyHwkg/q9JErVI5g8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzrNs-00000005ITy-1nEF;
	Fri, 28 Aug 2026 07:52:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzrNo-00000005ITJ-0Zqw
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 07:52:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso6658565e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 00:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787903534; x=1788508334; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dg/MQ8inXuFFEbvgK+mHsA3iNLAg+xiUDh4PfNOolRQ=;
        b=qycGMxRrrhfFw2ouS7fuH7viz484LH7UJh/HfoADi8ckhmC0xorejxSJR0oXLzYLH8
         nCX1sUwKPxa9YUJw/8SifCsA+imOB0IHtOhx/KSkD2uXPnwCRFnCOm0AroitO+CevI4l
         CNEMi7Dk1YHxpwD2cimYulynVi/yfy/Oe/sKOyrb1eLOn1W7LpPqWsSannE2dEIqQLQ0
         FDX/p0wnHDamSo3Hz3llxu6rjwe9BwDNp4NCGk+U1Q8GcAZ3hNW0ljmd8Wy+EYrrYD+t
         rNzT6shUilyr9MQ8NiuW0czDZb/2k5ic5zBQm0KU9RlZVUJ4lCqkPf2oB+faGU+dbQFg
         KjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787903534; x=1788508334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg/MQ8inXuFFEbvgK+mHsA3iNLAg+xiUDh4PfNOolRQ=;
        b=CTDblASuST8OzslBthXd1S7/e1bZtqEN2DSV1Se7UzJS0ry4c3XA/97IT5h9Uo61vT
         CKtWscfoWqxLofPmctB4uXpsPL1c41QdnGTxnIpqsXt3EneYE9XKC9+Qy5EXPFaIVmhX
         mGQ5/1Y7IOxn8tqWAfOd5wIchaPnQu7Nz04NbEHGXLXd5+nKECThi1y4Bow02s4cK61k
         rqDXEJCXufLRPHu9X/utTJB7BGqmETO2kjGORMwa35JQrbh5M/B2zSygI6AcTjTk92MV
         OKeVTPmtaeQ0ErTCnBKavhGYvQR+QisZ9vI9/4kjq02g/spSlgSQB+s7K+jMH+JJNehO
         lpFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpk5NU/GNgJ+d7I6FEiCSc8KHoCwQAkBmYmbts9UFZPGKDr2CijQIh5X8m7icNOorEfYs/+gAhHNno0pQ==@lists.infradead.org
X-Gm-Message-State: AFuF++ki8FpaxbdDAEYBmyEhWar7Tz3Uj7o81ATiGqist36ay52uIiKW
	mIqGPpH9FcjrzyuieB4kjJUevlOLXs6a0MXgEiZnEp0w8lDQLvLJcULK
X-Gm-Gg: AR+sD139aDURU3dD3caF55rfZLtoXP/AovFTSWfNtBt/b7H46aY9nMZfsAkbTWa8A0G
	reAUvK2PXn9J0oyvU4HeqKhmWDO9Wy+SGPgJ4mKt2pafv8KoYg1lOLdDYPbAvQvO+eBHjkqS1RW
	LrnjHLIQuOsLVGNEsjtRPVj1xjX+jejaC6LO/v/dCwgZfB8XUsbrkTs+x75cJtjuZoa2+QOUzX4
	FFs0+c7n30QwqndUHaXPwVsf1LdUG+UNvZQMtui7n1CS4mcwxVVuzrgJmMVTWwuZiAy0cf9xnRd
	QzIfHaIUrH4nRLY0PRwOiTNTEdHX02bz7VmT3h+0ZAsKAg9bpbkf8TtGuZx02vN4kLewYh8wa9o
	XHUcT2D9abUqqZH+hymqg8geNrCeCCWfIOwaJfyIkRwdkjJ9igKG5T80sBUc/CLT9/6QNiRXkX5
	CykIO8Yvmt3ee8EyZouuM8p/gBjWl+/Dl5aP00D5yxrBRADXmEYv7PIAeCKcQk4Z3d/HOfZIrj4
	aSAEc1PBW4aKncyhAkDo8nGBw==
X-Received: by 2002:a05:600c:1394:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49b91c47b6bmr60078885e9.9.1787903533497;
        Fri, 28 Aug 2026 00:52:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm41438895e9.12.2026.08.28.00.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:52:13 -0700 (PDT)
Date: Fri, 28 Aug 2026 08:52:11 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zong Li <zong.li@sifive.com>
Cc: Guo Ren <guoren@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>,
 zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org,
 robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org,
 yuanzhu@bytedance.com
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
Message-ID: <20260828085211.2c8e6b74@pumpkin>
In-Reply-To: <CANXhq0qtt7U3jKEB4drvSn7gg55nwWm8VFnfY-NRGjBaWVr_MQ@mail.gmail.com>
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
	<20260615123821.373248-1-guoren@kernel.org>
	<7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
	<CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
	<e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn>
	<CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
	<20260618143634.7f3dd6c5@pumpkin>
	<CANXhq0qtt7U3jKEB4drvSn7gg55nwWm8VFnfY-NRGjBaWVr_MQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_005216_228649_0DCFC8BE 
X-CRM114-Status: GOOD (  34.57  )
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

T24gRnJpLCAyOCBBdWcgMjAyNiAxMDo1MjowOCArMDgwMApab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+IHdyb3RlOgoKPiBPbiBGcmksIEp1biAxOSwgMjAyNiBhdCAxMjowMuKAr0FNIERhdmlk
IExhaWdodAo+IDxkYXZpZC5sYWlnaHQubGludXhAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBP
biBUaHUsIDE4IEp1biAyMDI2IDE3OjUxOjM0ICswODAwCj4gPiBHdW8gUmVuIDxndW9yZW5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPiAgCj4gPiA+IEhpIFZpdmlhbiwKPiA+ID4KPiA+ID4gQXMgbm90
ZWQgaW4gdGhlIFJJU0MtViBJT01NVSBTcGVjaWZpY2F0aW9uLCBDaGFwdGVyIDY6ICAKPiA+ID4g
PiBXaGV0aGVyIGFuIDgtYnl0ZSBhY2Nlc3MgdG8gYW4gSU9NTVUgcmVnaXN0ZXIgaXMgc2luZ2xl
LWNvcHkgYXRvbWljIGlzIFVOU1BFQ0lGSUVELCBhbmQgc3VjaCBhbiBhY2Nlc3MgbWF5IGFwcGVh
ciwgaW50ZXJuYWxseSB0byB0aGUgSU9NTVUsIGFzIGlmIHR3byBzZXBhcmF0ZSA0LWJ5dGUgYWNj
ZXNzZXMg4oCUIGZpcnN0IHRvIHRoZSBoaWdoIGhhbGYgYW5kIHNlY29uZCB0byB0aGUgbG93IGhh
bGYg4oCUIHdlcmUgcGVyZm9ybWVkLiAgCj4gPiA+Cj4gPiA+IFRoZXJlZm9yZSwgdGhlIGF0b21p
Y2l0eSBvZiA2NC1iaXQgTU1JTyBhY2Nlc3NlcyBpcyBVTlNQRUNJRklFRCBhbmQKPiA+ID4gbm90
IGNsZWFybHkgZGVmaW5lZCBpbiB0aGUgY3VycmVudCByYXRpZmllZCBSSVNDLVYgSU9NTVUKPiA+
ID4gc3BlY2lmaWNhdGlvbi4gVG8gaGFuZGxlIHRoaXMgY29ycmVjdGx5LCB0aGUgTGludXggUklT
Qy1WIElPTU1VIGRyaXZlcgo+ID4gPiBzaG91bGQgZmFsbCBiYWNrIHRvIDMyLWJpdCBNTUlPIGFj
Y2Vzc2VzIHdoZW4gcmVhZGluZyA2NC1iaXQgcmVnaXN0ZXJzCj4gPiA+IChlLmcuLCBwZXJmb3Jt
YW5jZSBjb3VudGVycykuIFRoZSBiZWhhdmlvciBvZiAzMi1iaXQgTU1JTyBhY2Nlc3NlcyBpcwo+
ID4gPiBtb3JlIHByZWNpc2VseSBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSU9NTVUgc3BlY2lmaWNh
dGlvbi4KPiA+ID4KPiA+ID4gVGh1cywgbWFueSBoYXJkd2FyZSB2ZW5kb3JzIGltcGxlbWVudCAz
Mi1iaXQgTU1JTyAocmF0aGVyIHRoYW4gNjQtYml0Cj4gPiA+IE1NSU8pIGJhc2VkIG9uIHRoZSBj
dXJyZW50IHJhdGlmaWVkIFJJU0MtViBJT01NVSBzcGVjaWZpY2F0aW9uLCBhbmQKPiA+ID4gdGhp
cyBkcml2ZXIgZG9lcyBub3QgYXBwZWFyIHRvIGJlbmVmaXQgZnJvbSA2NC1iaXQgTU1JTyBhY2Nl
c3MgZWl0aGVyLgo+ID4gPiBQZXJmb3JtYW5jZSBpcyBmdW5kYW1lbnRhbGx5IGNvbnN0cmFpbmVk
IGJ5IGJ1cyBsYXRlbmN5OyBhc3N1bWluZyB0aGF0Cj4gPiA+IHNpbXBseSByZWR1Y2luZyB0aGUg
bnVtYmVyIG9mIGFjY2Vzc2VzIHdpbGwgaW1wcm92ZSBwZXJmb3JtYW5jZSBpcyBhbgo+ID4gPiBv
dmVyc2ltcGxpZmljYXRpb24gdGhhdCBpZ25vcmVzIHRoZSB1bmRlcmx5aW5nIGhhcmR3YXJlCj4g
PiA+IGNoYXJhY3RlcmlzdGljcy4gIAo+ID4KPiA+IElmIHRoZSBidXMgbGF0ZW5jeSBpcyBzaWdu
aWZpY2FudCBpdCBpcyBhbG1vc3QgY2VydGFpbmx5IHdvcnRoIHVzaW5nCj4gPiBtZW1vcnkgYWNj
ZXNzZXMgdG8gYXZvaWQgcmUtcmVhZGluZyB0aGUgaGkgcmVnaXN0ZXIuCj4gPgo+ID4gU29tZXRo
aW5nIGxpa2UgdGhpcyBtaWdodCB3b3JrOgo+ID4KPiA+IHN0YXRpYyB2b2xhdGlsZSB1MzIgaGlf
cHJldiwgbG9fcHJldjsKPiA+Cj4gPiAgICAgICAgIHUzMiBoaSA9IHJlYWRfcmVnX2hpKCk7Cj4g
PiAgICAgICAgIHUzMiBsbyA9IHJlYWRfcmVnX2xvKCk7Cj4gPgo+ID4gICAgICAgICBpZiAobG8g
PD0gbG9fcHJldiB8fCBoaSAhPSBoaV9wcmV2KSB7Cj4gPiAgICAgICAgICAgICAgICAgdTMyIGhp
X3RtcCA9IHJlYWRfcmVnX2hpOwo+ID4gICAgICAgICAgICAgICAgIGlmIChoaV90bXAgIT0gaGkp
IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGhpID0gaGlfdG1wOwo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgbG8gPSAwOwo+ID4gICAgICAgICAgICAgICAgIH0KPiA+ICAgICAgICAg
ICAgICAgICBsb19wcmV2ID0gfjB1Owo+ID4gICAgICAgICAgICAgICAgIGhpX3ByZXYgPSBoaTsK
PiA+ICAgICAgICAgfQo+ID4gICAgICAgICBsb19wcmV2ID0gbG87Cj4gPiAgICAgICAgIHJldHVy
biAodTY0KWhpIDw8IDMyIHwgbG87Cj4gPiAgCj4gCj4gSGkgRGFpdmQsCj4gCj4gSSBpbmNsdWRl
ZCB0aGlzIGluIG15IHY1IG9mIHRoZSBJT01NVSBQTVUgc2VyaWVzLCBidXQgd2Ugbm90aWNlZCB0
aGF0Cj4gc2FzaGlrby1ib3QgQUkgcmVwb3J0ZWQgdHdvIGlzc3VlczoKCkkgZGlkIHNheSAnc29t
ZXRoaW5nIGxpa2UgdGhpcycgbWlnaHQgd29yay4uLi4KCkRhdmlkCgo+IAo+IDE6IFRoZSBsb19w
cmV2IGlzIGltbWVkaWF0ZWx5IG92ZXJ3cml0dGVuOgo+IFRoZSB0cmFpbGluZyAncG11LT5sb19w
cmV2W2lkeF0gPSBsbzsnIGlzIG91dHNpZGUgdGhlIGlmIGJsb2NrIGFuZAo+IHJ1bnMgdW5jb25k
aXRpb25hbGx5LCBzbyB0aGUgJ2xvX3ByZXYgPSB+MHUnIGlzIGNsb2JiZXJlZCBiZWZvcmUgdGhl
Cj4gZnVuY3Rpb24gZXZlbiByZXR1cm5zLiBJdCBuZXZlciBzdXJ2aXZlcyB0byB0aGUgbmV4dCBj
YWxsLiBsb19wcmV2Cj4gZW5kcyB1cCBob2xkaW5nIHRoZSBndWVzc2VkIHZhbHVlICh0eXBpY2Fs
bHkgMCkgaW5zdGVhZCwgd2hpY2ggaXMgYQo+IHBlcmZlY3RseSBvcmRpbmFyeSBzbWFsbCBudW1i
ZXIsIGFuZCB0aGUgaW50ZW5kZWQgImFsd2F5cyByZS12ZXJpZnkKPiBuZXh0IHRpbWUiIGJlaGF2
aW91ciBuZXZlciBoYXBwZW5zLiBUaGUgc2VudGluZWwgd3JpdGUgd2FzIGVmZmVjdGl2ZWx5Cj4g
ZGVhZCBjb2RlLgo+IAo+IDI6IFRoZSB3cmFwIGNoZWNrIGl0c2VsZiBjYW4gbWlzcyBhIHdyYXAK
PiBIZXJlIGlzIGEgY29uY3JldGUgc2VxdWVuY2UuIEFzc3VtZSBhIHByZXZpb3VzIGNhbGwgbGVm
dCBoaV9wcmV2ID0gMQo+IGFuZCBsb19wcmV2ID0gNSwgaS5lLiB0aGUgY291bnRlciB3YXMgMHgx
XzAwMDAwMDA1LiBTb21lIHRpbWUgbGF0ZXIKPiB0aGUgY291bnRlciBoYXMgYWR2YW5jZWQgY2xv
c2UgdG8gMHgxX0ZGRkZGRkZGOgo+IAo+ICAgMS4gaGkgPSByZWFkbChhZGRyICsgNCkgIC0+IGNv
dW50ZXIgaXMgMHgxX0ZGRkZGRkYwLCBzbyBoaSA9IDEKPiAgIDIuIHRoZSBjb3VudGVyIGNyb3Nz
ZXMgdGhlIGJvdW5kYXJ5IGFuZCBiZWNvbWVzIDB4Ml8wMDAwMDAwOAo+ICAgMy4gbG8gPSByZWFk
bChhZGRyKSAgICAgIC0+IGxvID0gOAo+IAo+IFRoZSBjaGVjayB0aGVuIGV2YWx1YXRlczoKPiAK
PiAgIGxvICg4KSA8PSBsb19wcmV2ICg1KSAgIC0+IGZhbHNlCj4gICBoaSAoMSkgIT0gaGlfcHJl
diAoMSkgICAtPiBmYWxzZQo+IAo+IEJvdGggYXJlIGZhbHNlLCBzbyB0aGUgZmFzdCBwYXRoIGlz
IHRha2VuIGFuZCAweDFfMDAwMDAwMDggaXMKPiByZXR1cm5lZC4gVGhlIHRydWUgdmFsdWUgaXMg
MHgyXzAwMDAwMDA4LCBzbyB0aGUgcmVzdWx0IGlzIHNob3J0IGJ5Cj4gMl4zMiBhbmQgdGhlIHRo
aXJkIHJlYWQgb2YgdGhlIGhpZ2ggaGFsZiBuZXZlciBldmVuIGV4ZWN1dGVzLgo+IAo+IEJvdGgg
c2l0dWF0aW9ucyBzaGFyZSB0aGUgc2FtZSByb290IGNhdXNlOiBJdCBwdXRzIHRoZSByZWxpYWJs
ZSBjaGVjawo+ICh0aGUgdGhpcmQgcmVhZCkgaW5zaWRlIGFuIGlmIGd1YXJkZWQgYnkgdGhlIHVu
cmVsaWFibGUgY3Jvc3MtY2FsbAo+IGhldXJpc3RpYyAnbG8gPD0gbG9fcHJldiB8fCBoaSAhPSBo
aV9wcmV2KScKPiBDYXNlIDEgaXMgYW4gaXNzdWUgaW4gdGhlIGJvb2trZWVwaW5nIHRoYXQgaGV1
cmlzdGljIGRlcGVuZHMgb24sIGFuZAo+IGNhc2UgMiBzaG93cyB0aGF0IGV2ZW4gd2l0aCBjb3Jy
ZWN0IGJvb2trZWVwaW5nIHRoZSBoZXVyaXN0aWMgaXMgbm90Cj4gc291bmQuCj4gCj4gVG8gbWFr
ZSBldmVyeXRoaW5nIHNpbXBsZXIsIEkgd291bGQgdXNlIHlvdXIgZmlyc3QgdmVyc2lvbiBmb3Ig
dGhlCj4gbGF0ZXN0IElPTU1VIFBNVSBzZXJpZXM6Cj4gCj4gICAgICAgICBoaSA9IHJlYWRfaGko
KTsKPiAgICAgICAgIGxvID0gcmVhZF9sbygpOwo+ICAgICAgICAgaWYgKGhpICE9IHJlYWRfaGko
KSkgewo+ICAgICAgICAgICAgICAgICAvLyBQaWNrIGEgdmFsdWUgdGhhdCBoYXBwZW5lZCB3aGls
ZSBkb2luZyB0aGUgcmVhZHMuCj4gICAgICAgICAgICAgICAgIGhpKys7Cj4gICAgICAgICAgICAg
ICAgIGxvID0gMDsKPiAgICAgICAgIH0KPiAKPiA+IEl0IHNob3VsZG4ndCBuZWVkIGFueSBsb2Nr
aW5nIGJ1dCB0aGUgYWNjZXNzZXMgZG8gbmVlZCB0byBiZSBvcmRlcmVkLgo+ID4KPiA+ICAgICAg
ICAgRGF2aWQKPiA+Cj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YgIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
