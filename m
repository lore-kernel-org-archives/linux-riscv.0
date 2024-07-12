Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868FCC2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08Ha165Fp4R0dQV11UUi71rxzAL4Nccen8PHuuekjJo=; b=zslYozvSkWbkfk
	oMArPtaAMExHDO3qLSgjRfpo8bJlIY/wjla+vUT18O7hhGLaSNyFxKxYNegyDia30mBLwPrfKTf10
	bBrq7neaElYJpfqh4wmto7MRYVZ6m6tLWgZoDSxKAkQXJuis+sAg1acK5FSvsltxh74Yi57VNLuuk
	uQtezJayyFs+5I98Rs/x1toEPwetHvmsJWzMIuxaykLEX0F8MG5Mav3tD1Y4EWSjif1bJ6kuD0hdm
	dLJV+/gga3Gf29K0w1zmx8vJS+RkTXosLVqcb28nOk9d5TSAQjqjIfbBNwvkOTdRKL6+9h0Tsp5E+
	gHzWXc16U9fYmoFneYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSI6b-00000000VWl-2tWh;
	Fri, 12 Jul 2024 15:22:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSI6Y-00000000VVW-0Zuj
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 15:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720797756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5iNEWViGWsJ0HgvGvNf4C7dCvswRTS9KzeI2onLQu7Q=;
	b=IuMFKLw4mwZCAPOH0Vj0PHe6v6F2tTh7WjStOvK8Y6kzQF7si1saCKODtoNPlKPBFfQ0M3
	v/g/iX/GFPZPliC49SH9/u/6Xpv6x0jKNuXbhmQRC+EwbZ1Q+1a82v4okrgzd1C6AsfPH+
	i0Shx3XhEsdu5DU0K1oMU5XVMbPMAlU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-_9OYXDqnNveKH3KSoWu81A-1; Fri, 12 Jul 2024 11:22:32 -0400
X-MC-Unique: _9OYXDqnNveKH3KSoWu81A-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ee95497b77so21298671fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2024 08:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720797751; x=1721402551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iNEWViGWsJ0HgvGvNf4C7dCvswRTS9KzeI2onLQu7Q=;
        b=TyGxM/wXCdQDj+75LVozIregdMq1VEJr+OsO3Yw4ic4ueC+xOBUTPVh5Hbn1uYrfQI
         SEYa1V2N6xh/LLVmB5mbXXcMz1Q846X726r79EqSHfUQVENXEY5E8nmcyg7qHZYCCroH
         9sV1WpC7em6p2NInBL9GMM1TX6jX1nQmzC7d55ePfSi2XtUVAGFycOcA0ytHGDnoNZ8o
         LuMhsBUajJhlmMO+MBwtsvdCGJgZu1HKEzi8raXAzK03+1fPiziOyNspzNQn9JyqzZ4A
         mlSf6MlB67zs1EJYfbJlRMq/dfj6x3B4ZkiI6IoBP+q3CmDMBOmeocV1ZRiNFt2aL3Z0
         joyw==
X-Forwarded-Encrypted: i=1; AJvYcCXTZ7qT47Sj3v2VVibEoFY70BfR/kcfq4yD4XazDTyr/NgGFaZhmLT0nUkxGx+5eXcyl6BWDj7ul3soXQCQeAt0BZt/oZtP39X3C8zEqDBD
X-Gm-Message-State: AOJu0Yzx3qQYh7FmMXq9T1y4JWOXSh11yCW95n7l2ByTSmU9hDmP557+
	mn3xBAs7T7gqQOvJ/tMkvUMRXOTmMlRFpy+njxHFXcUIox0UhgBzcSu+uwdhqzkiumHuw8p11LY
	SESxZ8UZ3E4zY84YGnKPfIrulZ6Y9j2QCYbfaNzFb8VPWAYq+6uZ72x1N5RKeBy4VCozN7oF4WQ
	Kf1sJxdzVWLpw+t+Bz3xi9TicQHkK/BG4LSFd+AJo8
X-Received: by 2002:a2e:a792:0:b0:2ec:63f:fe91 with SMTP id 38308e7fff4ca-2eeb3181609mr109326981fa.38.1720797751189;
        Fri, 12 Jul 2024 08:22:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE17i70tdv+6mHF9kfzcljP7n2Fvj9afzaPSj88QABadl8SkXkPXm+TirlUDF8NciOpXb1JeKQtL1dVIL8Q2ow=
X-Received: by 2002:a2e:a792:0:b0:2ec:63f:fe91 with SMTP id
 38308e7fff4ca-2eeb3181609mr109326681fa.38.1720797750787; Fri, 12 Jul 2024
 08:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0jae8TYcbChockXDJ9qL+HnA1p3YJQi32NHQsLUtCGDA@mail.gmail.com>
In-Reply-To: <CAAhSdy0jae8TYcbChockXDJ9qL+HnA1p3YJQi32NHQsLUtCGDA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 12 Jul 2024 17:22:18 +0200
Message-ID: <CABgObfZJJHg41KH8=a9Sw7F8A8vthKTmx+w-hH-JP-+8BU3Wug@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.11
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_082238_255966_F6568DA1 
X-CRM114-Status: GOOD (  13.67  )
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

UHVsbGVkLCB0aGFua3MuCgpQYW9sbwoKT24gRnJpLCBKdWwgMTIsIDIwMjQgYXQgMjoxMeKAr1BN
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4K
PiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcgS1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2LjExOgo+IDEp
IFJlZGlyZWN0IEFNTyBsb2FkL3N0b3JlIGFjY2VzcyBmYXVsdCB0cmFwcyB0byBndWVzdAo+IDIp
IFBlcmYga3ZtIHN0YXQgc3VwcG9ydCBmb3IgUklTQy1WCj4gMykgVXNlIEhXIElNU0lDIGd1ZXN0
IGZpbGVzIHdoZW4gYXZhaWxhYmxlCj4KPiBJbiBhZGRpdGlvbiB0byBhYm92ZSwgT05FX1JFRyBz
dXBwb3J0IGZvciBaaW1vcCwKPiBaY21vcCwgWmNhLCBaY2YsIFpjZCwgWmNiIGFuZCBaYXdycyBJ
U0EgZXh0ZW5zaW9ucwo+IGlzIGdvaW5nIHRocm91Z2ggdGhlIFJJU0MtViB0cmVlLgo+Cj4gUGxl
YXNlIHB1bGwuCj4KPiBSZWdhcmRzLAo+IEFudXAKPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgMGZjNjcwZDA3ZDVkZTM2YTU0ZjA2MWY0NTc3NDNjOWNkZTFkOGI0NjoKPgo+
ICAgS1ZNOiBzZWxmdGVzdHM6IEZpeCBSSVNDLVYgY29tcGlsYXRpb24gKDIwMjQtMDYtMDYgMTU6
NTM6MTYgKzA1MzApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
Pgo+ICAgaHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlz
Y3YtNi4xMS0xCj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZTMyNTYxODM0OWNk
YzFmYmJlNjM1NzQwODAyNDk3MzBlN2NmZjllYToKPgo+ICAgUklTQy1WOiBLVk06IFJlZGlyZWN0
IEFNTyBsb2FkL3N0b3JlIGFjY2VzcyBmYXVsdCB0cmFwcyB0byBndWVzdAo+ICgyMDI0LTA2LTI2
IDE4OjM3OjQxICswNTMwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEtWTS9yaXNjdiBjaGFuZ2VzIGZvciA2LjEx
Cj4KPiAtIFJlZGlyZWN0IEFNTyBsb2FkL3N0b3JlIGFjY2VzcyBmYXVsdCB0cmFwcyB0byBndWVz
dAo+IC0gUGVyZiBrdm0gc3RhdCBzdXBwb3J0IGZvciBSSVNDLVYKPiAtIFVzZSBIVyBJTVNJQyBn
dWVzdCBmaWxlcyB3aGVuIGF2YWlsYWJsZQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEFudXAgUGF0ZWwgKDIpOgo+
ICAgICAgIFJJU0MtVjogS1ZNOiBTaGFyZSBBUExJQyBhbmQgSU1TSUMgZGVmaW5lcyB3aXRoIGly
cWNoaXAgZHJpdmVycwo+ICAgICAgIFJJU0MtVjogS1ZNOiBVc2UgSU1TSUMgZ3Vlc3QgZmlsZXMg
d2hlbiBhdmFpbGFibGUKPgo+IFNoZW5saW4gTGlhbmcgKDIpOgo+ICAgICAgIFJJU0NWOiBLVk06
IGFkZCB0cmFjZXBvaW50cyBmb3IgZW50cnkgYW5kIGV4aXQgZXZlbnRzCj4gICAgICAgcGVyZiBr
dm0vcmlzY3Y6IFBvcnQgcGVyZiBrdm0gc3RhdCB0byBSSVNDLVYKPgo+IFl1LVdlaSBIc3UgKDEp
Ogo+ICAgICAgIFJJU0MtVjogS1ZNOiBSZWRpcmVjdCBBTU8gbG9hZC9zdG9yZSBhY2Nlc3MgZmF1
bHQgdHJhcHMgdG8gZ3Vlc3QKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWFfYXBs
aWMuaCAgICAgICAgICAgICB8IDU4IC0tLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fYWlhX2ltc2ljLmggICAgICAgICAgICAgfCAzOCAtLS0tLS0tLS0tLQo+ICBh
cmNoL3Jpc2N2L2t2bS9haWEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDM1ICsr
KysrKy0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9yaXNjdi9rdm0vdHJhY2UuaCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCA2NyArKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysKPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArCj4g
IHRvb2xzL3BlcmYvYXJjaC9yaXNjdi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgIDEg
Kwo+ICB0b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9CdWlsZCAgICAgICAgICAgICAgICAgICB8
ICAxICsKPiAgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwva3ZtLXN0YXQuYyAgICAgICAgICAg
ICAgfCA3OCArKysrKysrKysrKysrKysrKysrKysrCj4gIHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91
dGlsL3Jpc2N2X2V4Y2VwdGlvbl90eXBlcy5oIHwgMzUgKysrKysrKysrKwo+ICAxMyBmaWxlcyBj
aGFuZ2VkLCAyMTUgaW5zZXJ0aW9ucygrKSwgMTEzIGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9k
ZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhX2FwbGljLmgKPiAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYV9pbXNpYy5oCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2t2bS90cmFjZS5oCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCB0b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9rdm0tc3RhdC5jCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9yaXNjdl9leGNlcHRpb25fdHlwZXMu
aAo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
