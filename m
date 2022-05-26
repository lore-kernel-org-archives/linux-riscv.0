Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BBEC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 01:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=8e1/1fQFzZjy3aZOGrssBSt19LKfRLb7LOUDoBdrW5c=; b=wtnJlmUKfAV/GE4VSIShBYBl9F
	Ag2VU/mFnZyRBD3TiVtSy0k442KV4reCninu1kNOQjEzxDSfAcmFXrs9TniLLi+4qvEtRfkYgq8uP
	jC/zkDu4BlFarnWdqdFiTkgIlKbCtdPEcKASQVWRIEmtJjSFAX0KJdqrRSB8IyLAEirfp4RaW77xS
	d43oPvYkVd93EppK9GvzyZGDFZbktgVHoqXtzpGPC9YlMyJYx4bMFcLu2qkqLksi4U1EOcx6RH3A/
	kK2q1zqMiz2UFtHEnfuAfG+g3SMqity3KYXadUXSG6w23w22aimTMVAS7CydKfYCajHkzaknQ9TuZ
	RJCKgpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2HE-00DBR7-WE; Thu, 26 May 2022 01:27:01 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2HB-00DBQO-82
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 01:26:59 +0000
Received: by mail-pf1-x435.google.com with SMTP id c14so483954pfn.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 18:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=IJTqDFjqCzxzT9sNGwb8smwhndUIJK3si2+NAvjLPes=;
        b=Fo56R9QSrSXqfV05MSzzv7c9rMI/iX8H4AGbweLENhxpW5nawqk8y+LqBTCmNg/4i+
         PhXsfFO5c2nBs6fmgjNmwkm+l+iPglwQplWAFk31l2ERXQSR+O8CS83VxWDKHreBauXZ
         C+tIF31wEw/+dWjT+ZrNsjeJafF81tZHuvLMYl2o87d8VzeDw/ei3kuAdkSOYZY6szYf
         /cpcSCkjZrMPdcHw8DAxQ8TdyoZqFlv155nOz1bEHxRW2aRtYt4OLf9v5ZlVNxGt8FTQ
         Ad3jAt5arJXGF/YwYauIPTunz82O+JznzJ+J9Gg2wxJBWktLH8WUbpNHfUT5nZDvCh0n
         B5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=IJTqDFjqCzxzT9sNGwb8smwhndUIJK3si2+NAvjLPes=;
        b=CwksVIJ+EqJSBj7XaFLAhkevDYLkVG7sZDJcufTsqkmgqdodT/WkM3WaRcDl/lO0qW
         9Sy9xX6D7reI+Ps0qzrBwb9WTfJi78X3NwHIPteF9VTC/i8ZwfEu2Ec0CbV7rqRGV9j7
         0ERzn8RdgyC/A9xcCY/+oV4OKBY0I2HakP4E+cJHvC0FfjXEEHYC12wqHRVuhMLRtL3i
         so9omsdFxzMvWbrtqJfPxhQqf5iqeil/j6SneWtIpQElviOGLq7nU5PiM7iFKgWs5TeQ
         R8L856cCF8lyJ9t6xJxSWCKSHNplGgQl0R+KMcw1vhpPQhbG0o5mdCbJ7xprS9SrJd7B
         ehvg==
X-Gm-Message-State: AOAM531esFeU1b1/W6apr1FtzfpKXwvJqGIzphnVXBavnBeOXAUP0RSB
	O0LxQDATA94pTb50vZniNxtlLg==
X-Google-Smtp-Source: ABdhPJwxw+ZGBVWh2A3SVMACHEfgZ3hR+byOfKJRugCCmYszTXdAzNBFX/0zwN8agIEbo1Dw5NMdUw==
X-Received: by 2002:a65:6cc3:0:b0:3f6:26e9:5c1 with SMTP id g3-20020a656cc3000000b003f626e905c1mr30607276pgw.28.1653528416310;
        Wed, 25 May 2022 18:26:56 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id r5-20020a1709028bc500b001608bceb092sm51637plo.124.2022.05.25.18.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 18:26:55 -0700 (PDT)
Date: Wed, 25 May 2022 18:26:55 -0700 (PDT)
X-Google-Original-Date: Wed, 25 May 2022 18:26:54 PDT (-0700)
Subject: Re: [PATCH V2] riscv: compat: Using seperated vdso_maps for compat_vdso_info
In-Reply-To: <CAJF2gTQvmKE5UYTmhQMd0MTF-CJm08_VHpcSqS7ik=MGtZ0Jag@mail.gmail.com>
CC: jrtc27@jrtc27.com, Arnd Bergmann <arnd@arndb.de>, linux@roeck-us.net,
  heiko@sntech.de, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
  linux-kernel@vger.kernel.org, guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: guoren@kernel.org
Message-ID: <mhng-33d1c05c-e54e-4b8d-a016-18560b855e33@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_182657_550937_6CD5B2C6 
X-CRM114-Status: GOOD (  27.11  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyNSBNYXkgMjAyMiAxODoyNDowMSBQRFQgKC0wNzAwKSwgZ3VvcmVuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gT24gVGh1LCBNYXkgMjYsIDIwMjIgYXQgOTowMCBBTSBKZXNzaWNhIENsYXJr
ZSA8anJ0YzI3QGpydGMyNy5jb20+IHdyb3RlOgo+Pgo+PiBPbiAyNiBNYXkgMjAyMiwgYXQgMDE6
MzMsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+PiA+Cj4+ID4gRnJvbTogR3VvIFJlbiA8Z3Vv
cmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+PiA+Cj4+ID4gVGhpcyBpcyBhIGZpeHVwIGZvciB2ZHNv
IGltcGxlbWVudGF0aW9uIHdoaWNoIGNhdXNlZCBtdXNsIHRvCj4+ID4gZmFpbC4KPj4gPgo+PiA+
IFsgICAxMS42MDAwODJdIFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJvY2Vzcwo+PiA+IFsgICAx
MS42Mjg1NjFdIGluaXRbMV06IHVuaGFuZGxlZCBzaWduYWwgMTEgY29kZSAweDEgYXQKPj4gPiAw
eDAwMDAwMDAwMDAwMDAwMDAgaW4gbGliYy5zb1tmZmZmZmY4YWQzOTAwMCthNDAwMF0KPj4gPiBb
ICAgMTEuNjI5Mzk4XSBDUFU6IDAgUElEOiAxIENvbW06IGluaXQgTm90IHRhaW50ZWQKPj4gPiA1
LjE4LjAtcmM3LW5leHQtMjAyMjA1MjAgIzEKPj4gPiBbICAgMTEuNjI5NDYyXSBIYXJkd2FyZSBu
YW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4+ID4gWyAgIDExLjYyOTU0Nl0gZXBjIDogMDBm
ZmZmZmY4YWRhMTEwMCByYSA6IDAwZmZmZmZmOGFkYTEzYzggc3AgOgo+PiA+IDAwZmZmZmZmYzU4
MTk5ZjAKPj4gPiBbICAgMTEuNjI5NTg2XSAgZ3AgOiAwMGZmZmZmZjhhZDM5MDAwIHRwIDogMDBm
ZmZmZmY4YWRlMDk5OCB0MCA6Cj4+ID4gZmZmZmZmZmZmZmZmZmZmZgo+PiA+IFsgICAxMS42Mjk1
OThdICB0MSA6IDAwZmZmZmZmYzU4MTlmZDAgdDIgOiAwMDAwMDAwMDAwMDAwMDAwIHMwIDoKPj4g
PiAwMGZmZmZmZjhhZGUwY2MwCj4+ID4gWyAgIDExLjYyOTYxMF0gIHMxIDogMDBmZmZmZmY4YWRl
MGNjMCBhMCA6IDAwMDAwMDAwMDAwMDAwMDAgYTEgOgo+PiA+IDAwZmZmZmZmYzU4MTlhMDAKPj4g
PiBbICAgMTEuNjI5NjIyXSAgYTIgOiAwMDAwMDAwMDAwMDAwMDAxIGEzIDogMDAwMDAwMDAwMDAw
MDAxZSBhNCA6Cj4+ID4gMDBmZmZmZmZjNTgxOWIwMAo+PiA+IFsgICAxMS42Mjk2MzRdICBhNSA6
IDAwZmZmZmZmYzU4MTliMDAgYTYgOiAwMDAwMDAwMDAwMDAwMDAwIGE3IDoKPj4gPiAwMDAwMDAw
MDAwMDAwMDAwCj4+ID4gWyAgIDExLjYyOTY0NV0gIHMyIDogMDBmZmZmZmY4YWRlMGFjOCBzMyA6
IDAwZmZmZmZmOGFkZTBlYzggczQgOgo+PiA+IDAwZmZmZmZmOGFkZTA3MjgKPj4gPiBbICAgMTEu
NjI5NjU2XSAgczUgOiAwMGZmZmZmZjhhZGUwYTkwIHM2IDogMDAwMDAwMDAwMDAwMDAwMCBzNyA6
Cj4+ID4gMDBmZmZmZmZjNTgxOWU0MAo+PiA+IFsgICAxMS42Mjk2NjddICBzOCA6IDAwZmZmZmZm
OGFkZTBjYTAgczkgOiAwMGZmZmZmZjhhZGRiYTUwIHMxMDoKPj4gPiAwMDAwMDAwMDAwMDAwMDAw
Cj4+ID4gWyAgIDExLjYyOTY3OF0gIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6IDAwMDAwMDAw
MDAwMDAwMDIgdDQgOgo+PiA+IDAwMDAwMDAwMDAwMDAwMDEKPj4gPiBbICAgMTEuNjI5Njg4XSAg
dDUgOiAwMDAwMDAwMDAwMDIwMDAwIHQ2IDogZmZmZmZmZmZmZmZmZmZmZgo+PiA+IFsgICAxMS42
Mjk2OTldIHN0YXR1czogMDAwMDAwMDAwMDAwNDAyMCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAw
Cj4+ID4gY2F1c2U6IDAwMDAwMDAwMDAwMDAwMGQKPj4gPgo+PiA+IFRoZSBsYXN0IF9fdmRzb19p
bml0KCZjb21wYXRfdmRzb19pbmZvKSByZXBsYWNlcyB0aGUgZGF0YSBpbiBub3JtYWwKPj4gPiB2
ZHNvX2luZm8uIFRoaXMgaXMgYW4gb2J2aW91cyBidWcuCj4+ID4KPj4gPiBSZXBvcnRlZC1ieTog
R3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+PiA+IFRlc3RlZC1ieTogR3VlbnRl
ciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+PiA+IFRlc3RlZC1ieTogSGVpa28gU3TDvGJu
ZXIgPGhlaWtvQHNudGVjaC5kZT4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4+ID4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4+
ID4gLS0tCj4+ID4gQ2hhbmdlcyBpbiBWMjoKPj4gPiAtIEFkZCBUZXN0ZWQtYnkKPj4gPiAtIFJl
bmFtZSB2dmFyICYgdmRzbyBpbiAvcHJvYy88cGlkPi9tYXBzLgo+Pgo+PiBXaHk/IE5vIG90aGVy
IGFyY2hpdGVjdHVyZSByZW5hbWVzIGl0IHRvIHRoYXQsIGFuZCB2YXJpb3VzIHBpZWNlcyBvZgo+
PiBzb2Z0d2FyZSBsb29rIGZvciB0aGUgbWFnaWMgW3Zkc29dIG5hbWUsIGluY2x1ZGluZyBHREIg
YW5kIExMREIsIHRob3VnaAo+PiBieSBteSBjb3VudCB0aGVyZSBhcmUgNTcgc291cmNlIHBhY2th
Z2VzIGluIERlYmlhbiB0aGF0IGNvbnRhaW4gdGhlCj4+IHN0cmluZyBsaXRlcmFsICJbdmRzb10i
IChpbmNsdWRpbmcgcXVvdGVzKSwgaW5jbHVkaW5nIEZpcmVmb3gsCj4+IEFuZHJvaWQncyBBUlQs
IGx2bTIgYW5kIGVsZnV0aWxzLgo+IE9wcHMsIFRoeCBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuIEFi
YW5kb24gdGhlIHZlcnNpb24gb2YgdGhlIHBhdGNoLiBAUGFsbWVyCgpPSywgSSdsbCBzdGljayB3
aXRoIHRoZSB2MSBJIGhhZCAtLSBldmVyeXRoaW5nIHdhcyBzdGlsbCBpbiBzdGFnaW5nIAphbnl3
YXksIHRob3VnaCB0aGUgdGVzdHMgcHJvYmFibHkgd291bGRuJ3QgaGF2ZSBmb3VuZCB0aGlzIG9u
ZSBhcyBJIApkb24ndCBydW4gYW55IG9mIHRob3NlIChJJ20ganVzdCBydW5uaW5nIGJ1aWxkcm9v
dCdzIGRlZmF1bHRzKS4KCj4KPj4KPj4gSmVzcwo+Pgo+PiA+IC0tLQo+PiA+IGFyY2gvcmlzY3Yv
a2VybmVsL3Zkc28uYyB8IDE1ICsrKysrKysrKysrKystLQo+PiA+IDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiA+Cj4+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Zkc28uYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+PiA+IGlu
ZGV4IDUwZmU0Yzg3NzYwMy4uOTU3ZjE2NGM5Nzc4IDEwMDY0NAo+PiA+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3Zkc28uYwo+PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+PiA+
IEBAIC0yMDYsMTIgKzIwNiwyMyBAQCBzdGF0aWMgc3RydWN0IF9fdmRzb19pbmZvIHZkc29faW5m
byBfX3JvX2FmdGVyX2luaXQgPSB7Cj4+ID4gfTsKPj4gPgo+PiA+ICNpZmRlZiBDT05GSUdfQ09N
UEFUCj4+ID4gK3N0YXRpYyBzdHJ1Y3Qgdm1fc3BlY2lhbF9tYXBwaW5nIHJ2X2NvbXBhdF92ZHNv
X21hcHNbXSBfX3JvX2FmdGVyX2luaXQgPSB7Cj4+ID4gKyAgICAgW1JWX1ZEU09fTUFQX1ZWQVJd
ID0gewo+PiA+ICsgICAgICAgICAgICAgLm5hbWUgICA9ICJbY29tcGF0IHZ2YXJdIiwKPj4gPiAr
ICAgICAgICAgICAgIC5mYXVsdCA9IHZ2YXJfZmF1bHQsCj4+ID4gKyAgICAgfSwKPj4gPiArICAg
ICBbUlZfVkRTT19NQVBfVkRTT10gPSB7Cj4+ID4gKyAgICAgICAgICAgICAubmFtZSAgID0gIltj
b21wYXQgdmRzb10iLAo+PiA+ICsgICAgICAgICAgICAgLm1yZW1hcCA9IHZkc29fbXJlbWFwLAo+
PiA+ICsgICAgIH0sCj4+ID4gK307Cj4+ID4gKwo+PiA+IHN0YXRpYyBzdHJ1Y3QgX192ZHNvX2lu
Zm8gY29tcGF0X3Zkc29faW5mbyBfX3JvX2FmdGVyX2luaXQgPSB7Cj4+ID4gICAgICAgLm5hbWUg
PSAiY29tcGF0X3Zkc28iLAo+PiA+ICAgICAgIC52ZHNvX2NvZGVfc3RhcnQgPSBjb21wYXRfdmRz
b19zdGFydCwKPj4gPiAgICAgICAudmRzb19jb2RlX2VuZCA9IGNvbXBhdF92ZHNvX2VuZCwKPj4g
PiAtICAgICAuZG0gPSAmcnZfdmRzb19tYXBzW1JWX1ZEU09fTUFQX1ZWQVJdLAo+PiA+IC0gICAg
IC5jbSA9ICZydl92ZHNvX21hcHNbUlZfVkRTT19NQVBfVkRTT10sCj4+ID4gKyAgICAgLmRtID0g
JnJ2X2NvbXBhdF92ZHNvX21hcHNbUlZfVkRTT19NQVBfVlZBUl0sCj4+ID4gKyAgICAgLmNtID0g
JnJ2X2NvbXBhdF92ZHNvX21hcHNbUlZfVkRTT19NQVBfVkRTT10sCj4+ID4gfTsKPj4gPiAjZW5k
aWYKPj4gPgo+PiA+IC0tCj4+ID4gMi4zNi4xCj4+ID4KPj4gPgo+PiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+ID4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiA+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPj4KPgo+Cj4g
LS0gCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KPgo+IE1MOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
