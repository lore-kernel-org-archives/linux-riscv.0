Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3852D3CC87
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 22:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpZaNkJ+mEN8UEsPLnXypiCZenblorMwcoYThvlDWao=; b=PUbYByMgmIhGy3
	bcCU/Wg2rp3Kz2RPFkAOBpAOc8No8Us03IJGZIWUDE/eqO2o2ZJ0rGgaXDdBBHLQM3FLpxR3EuUj7
	C7MWakVcSRP/ncGD7V2Soubae4HBs1vrgyyLymiLq8dOdwz592csHQkJeiNCG/bazZ3QwG8wKZEjl
	idnlT5x5EJfiWql+FGMIOi4GxqCbl3HXYKFaD8+sjlwxJs5nzseBWJ3g2GfB85lP7+pDbcpg+ksv1
	X/gx3HgP5R7lctCNGtsB0nYWpoLgXYcK01mquB0cz9b/k68/mXNwfGOlQZvi8zk2HxBlSJ85YxtTa
	kWcqYpn8mNLCg7CVQnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9lg-0000000AzrH-1Kh9;
	Wed, 14 Jan 2026 22:55:12 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9ld-0000000Azq8-1McX
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 22:55:10 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-7904a401d5cso3809047b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 14:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768431308; x=1769036108; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3aA2X7iGQsnnel6fRLVe4SLr2+v2d/5zouhV3Vlqcs=;
        b=tBVNEP5SEfrMiXR3XPkpvdf20D1wUvqGcS3hlBmC2S70zAKAnA01lYEBuUn2MXwXHb
         g6Dzl+0ODfDVsXuc5KCQKSNhPN9bXL7GV61KkS4FRiMagrbrlOlCGSaNGSoNMBizteq2
         kNkuUbquAdIguW+hHmaLJdkLOKmEdc2HWl3wgnw8OYisJU+Hpb8EsN8IvVkqqbI3j1R8
         GREp6m6JnG+ib0aIdyHn9kBCJUVVwV7d5HVpo25WXRbrcsQ4cifvxekyGyd3dOFlKmSE
         kwOpZ4vPM0kkoAxomWquobIqWUaVovGUgFDkeX3ef0NrakMw3/u7iFJpKw7yrQb05LRi
         hxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768431308; x=1769036108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R3aA2X7iGQsnnel6fRLVe4SLr2+v2d/5zouhV3Vlqcs=;
        b=MBOd4LqZmsPvZ7eLeKcAUmmDpfM34nW3kM4zFI1I1E4HGkBUSjmMyq8SwRSdghAS41
         HyQ814Krs4uk28qDfphl7kaHbLQgo0IHoT8GYPFXqXQx04UTovzlfIon8ynUtyRlneDO
         8TK0NViKgXAII0e+JqBYlw4MgYyHDfDZsG+hNpGMH1jPf4zlBmUdor3Tj8g4XSwX/CXe
         OWhcISk+u9+WoIBdY/7TAKoZCCFTU4N8J49l6yP/+/cZVNAxejRr8Kmt1ir1vr5pzVWJ
         bbhQvRbPZjNqYilWZE5Jo8ZHOeAwUIotZMI5c+9BkP2+RCqSUzrrvOrhP/olf1zaMFQ3
         eJSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFE+EPmkso8xyzCe7zY/yDrw/+zF6/kSCHJTRh/knaOsVqJAtPAmid8PAhclw7kvP3p5EUyxn4p2bnzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyN1gx2RCfKmWahu4vsYi4LCnlzAmZzg2BY31L/Nx9a65d6KEPF
	Fpk+3/SenRBFgHogsBWa4rKGUZgFQd0vr5WxXQcZXfXVg2KTquT7uEuXlfOcicud14JjduxuE04
	JAna/9cZr0BSq0si5VsfJkhfPlkMI8jYn3bhwtonykg==
X-Gm-Gg: AY/fxX52LJR7TWhWnL6cC2KOFxAewaS2GEIISOuISMVAFBIsrQJyYTulE1B1MxwqZJq
	a5B0E3ojIE73uSSqr6NwaXuD8BTgKCJ1dLkP0AR2ib+aBILjaKvmqGeOGRyXdPvTNKjyAyH3nP5
	SLuEsX8RzK62JL2SJGKNBAiZm3JYGJ1wkhw1z2fMK7xYfKKf5GX+maX6VxwxRmgK9AiUy4zkG9c
	ay+QpcAU0RETRUBq9ccYA4auuaNFxHOL3pzfhS+m4YFNg8d73+ME5AjRW4e/PHAbHFLDk6t6qaL
	OedsAssdnE2OcVjRyW/nSrFACT5qX7LZljdpfw==
X-Received: by 2002:a05:690e:b8d:b0:644:77bb:5705 with SMTP id
 956f58d0204a3-64903b55ebbmr2982962d50.77.1768431307959; Wed, 14 Jan 2026
 14:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com> <20260113075339-GYA25466@gentoo.org>
 <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com> <20260114-evergreen-gluten-b1c8558e7684@spud>
In-Reply-To: <20260114-evergreen-gluten-b1c8558e7684@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 06:54:57 +0800
X-Gm-Features: AZwV_Qhkxzj_Y9cwaD4tSP0GMlfoxTMZyhjGCrw4ED-TcUztP4RUDmlAh8THzag
Message-ID: <CAH1PCMZAEwO4Vg=TdZ9SR1uwm3OOw_y79iCRC+E+SZiVRNtp+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing devicetrees
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_145509_617784_9C3CE57D 
X-CRM114-Status: GOOD (  21.32  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNDo0MuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCAxMDozMzozNEFNICsw
ODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gSGksIENvbm9yLCBZaXh1bgo+ID4KPiA+IE9uIFR1
ZSwgSmFuIDEzLCAyMDI2IGF0IDM6NTPigK9QTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEd1b2RvbmcsCj4gPiA+Cj4gPiA+Cj4gPiA+IE9uIDE1OjQ1
IFR1ZSAxMyBKYW4gICAgICwgR3VvZG9uZyBYdSB3cm90ZToKPiA+ID4gPiAiYiIgaXMgcmF0aWZp
ZWQgKEFwci8yMDI0KSBtdWNoIGxhdGVyIHRoYW4gaXRzIGNvbXBvbmVudHMgemJhL3piYi96YnMK
PiA+ID4gPiAoSnVuLzIwMjEpLiBXaXRoICJiIiBhZGRlZCBpbnRvIHJpc2N2L2V4dGVuc2lvbnMu
eWFtbCwgYSBkZXBlbmRlbmN5Cj4gPiA+ID4gY2hlY2tpbmcgcnVsZSBpcyBub3cgZW5mb3JjZWQs
IHdoaWNoIHJlcXVpcmVzIHRoYXQgd2hlbiB6YmEsIHpiYiwgYW5kIHpicwo+ID4gPiA+IGFyZSBh
bGwgc3BlY2lmaWVkLCAiYiIgbXVzdCBiZSBhZGRlZCBhcyB3ZWxsLiBGYWlsaW5nIHRvIGRvIHRo
aXMgd2lsbAo+ID4gPiA+IGNhdXNlIGR0YnNfY2hlY2sgc2NoZW1hIGNoZWNrIHdhcm5pbmdzLgo+
ID4gPiA+Cj4gPiA+ID4gQWNjb3JkaW5nIHRvIHVhYmkucnN0LCBhcyBhIHNpbmdsZS1sZXR0ZXIg
ZXh0ZW5zaW9uLCAiYiIgc2hvdWxkIGJlIGFkZGVkCj4gPiA+ID4gYWZ0ZXIgImMiIGluIGNhbm9u
aWNhbCBvcmRlci4KPiA+ID4gPgo+ID4gPiA+IFVwZGF0ZSBleGlzdGluZyBkZXZpY2V0cmVlIGZp
bGVzIHRvIGNvbmZvcm0gdG8gdGhpcyBydWxlLiBMaW5lIGJhbGFuY2luZwo+ID4gPiA+IGlzIHBl
cmZvcm1lZCB3aGVyZSBuZWVkZWQgdG8gaW1wcm92ZSByZWFkYWJpbGl0eS4KPiA+ID4gPgo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+ID4g
PiA+IC0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FubG9naWMvZHIxdjkwLmR0c2kg
ICAgIHwgICA1ICstCj4gPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0NC1j
cHVzLmR0c2kgfCAyNTYgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ID4gPiA+ICBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kgICAgICAgIHwgIDMyICsrLS0KPiA+ID4g
PiAgMyBmaWxlcyBjaGFuZ2VkLCAxNDcgaW5zZXJ0aW9ucygrKSwgMTQ2IGRlbGV0aW9ucygtKQo+
ID4gPiBwbGVhc2UgaGF2ZSBzZXBhcmF0ZWQgcGF0Y2ggZm9yIGRpZmZlcmVudCBTb0NzLCBzbyB0
aGV5IGNhbiBnbyB2aWEKPiA+Cj4gPiBVbmRlcnN0YW5kIHlvdXIgY29uY2Vybi4KPiA+Cj4gPiA+
IHRoZWlyIG93biBTb0MgdHJlZS4uIHRoYW5rcwo+ID4KPiA+IENvbm9yLCBpcyBpdCBwb3NzaWJs
ZSB0byB0YWtlIHRoaXMgYXMgb25lIHBhdGNoIGluc3RlYWQ/Cj4gPgo+ID4gSXQgZml4ZXMgdGhl
IHNhbWUgZHRic19jaGVjayB3YXJuaW5ncyBmcm9tIHJpc2N2L2V4dGVuc2lvbnMueWFtbCBhY3Jv
c3MgdGhyZWUKPiA+IFNvQ3MuIEtlZXBpbmcgdGhlbSB0b2dldGhlciBtYWludGFpbnMgcmVhZGFi
aWxpdHkgYW5kIGNsZWFyIHRyYWNraW5nLCBJTUhPLgo+ID4KPiA+IEhhcHB5IHRvIHNwbGl0IGlm
IG5lZWRlZCwgYnV0IHdhbnRlZCB0byBjaGVjayBmaXJzdC4KPgo+IEknZCByYXRoZXIgeW91IHNw
bGl0IGl0LCBzb3JyeS4KClN1cmUsIHdpbGwgZG8uClRoYW5rIHlvdSBib3RoLgoKQlIKR3VvZG9u
ZyBYdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
