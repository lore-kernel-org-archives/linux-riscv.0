Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F54C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 20:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NCXKKILqvrgu+xaZoUa3DNSx+5acCZMVFwD+EGwv74=; b=yzmsZ0cuS16nOj
	vP0OO/7nhQBDThvjJQSOqLF4xRdbv5R/EWMUmG2+jZNl7zQAWkTvyebrecOwOOS5rvMiH93BSX0uN
	/7yhGpgistgQOw/NpyPxJlpJ+FMs4NbOqCpkJrtc0I5I8auRqxU4kIbKk1gd/RA0uPxnUBkVGD2xj
	Bv5IM6lMq6L36RzI1Z2shuG/w0YF6/uojZgqgYAU4O1wNM4MV905fW7m025unnPb3qN2ciWL9Arh4
	YDPdwurV6Gv2f1F5kp8rPGWW25lxT8zvTvOeqiiherbABvOdKSc93dj1TxabskeqtOGgfFFZQnw0x
	lHaugTm1czHSgSEHRtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMZTw-00000008ICC-07KW;
	Wed, 26 Jun 2024 20:43:08 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMZRw-00000008H7K-3s8D
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 20:41:09 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52ce09b76e0so859213e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 13:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719434463; x=1720039263; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvqpZm+deOZ11Eji88xBj8E0l9mzRvWeVq0FD6NU9YA=;
        b=VnAWH9Ij4NLQVKyc1uiszGgs67p59RGpKUbB2luuvsL5MeiX7+wSBatrKuyCdfCttx
         wR2R0pBLoIOJxnRP3N3dRjDR+XXoM4k+z609U5A8wb/st4tg0jSs46jB5QXMG1mBnPiP
         Rd4rwNOFGQ5lXEOWUnjFnGHwghqVMVeWLJvNPUnLovReNl8F89Yr01SKMg6vuv9X5m3R
         C2Sj+q63Cv9dwDojyTGH+hei/QA7WRjNH6OaUoKIN9o+ffHQcqJBWKe/4SdYNfaMoTU1
         69XsLl/RzGY320jlPdq77rOlOZF/1gegu+ASbu0CZ96YQugV+POO96v2eJBD3pr619VM
         qRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719434463; x=1720039263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvqpZm+deOZ11Eji88xBj8E0l9mzRvWeVq0FD6NU9YA=;
        b=Dd5g+YmS06gBG72JRPUTI4RiQ0xibX9IbegvC6RXPviU3lpv9WvVG2ttwrdRJDhb6S
         0GcX8YKA4zpU8lHGF7ApC/Ero23pKWLbnLYb+Vl0TtDvA6NwDUngd833FmGxtgJs/iSz
         sesPobbOkFhcFS2eNqYXtKif10MOdYvaEvb+O3VelwMiGjZW11soKOU4H0Hjo/ly9LyK
         Rd3B7eaMLr3pHYKNolodIpxgqRAKG6CHnPu7VzFKDVrEJRPvHpDtT24SkG0d3D9KFzsT
         ThbPBTBgt1X/Us/upZQCtvUtH5H+R2N5SEvGA/7Y1UM4pmxW7I6G+TMkHxFfnUfoZIcE
         08qw==
X-Forwarded-Encrypted: i=1; AJvYcCV+tJkRqMq3of3Y7b4zMhiotRhWzDukvkyVecLbTrwMo2N5sAT9toSlJqicHSRs0bBBUMCQwxNtx7Ou+vxXNqFBSVHK6HQfv3lmgfMl/C4/
X-Gm-Message-State: AOJu0YwllVFmSzr06QnYc8OD9JQb3Jwquwk9HVRKdVK+heZzpPopBTNV
	KRj+rD5qV/s2mndd6zCbqaM6ZxZ+kLx2jRg9AEBKA5fFsLu6udeWL6EIEjWbWoDNE6TXuBWSm2P
	MH+2vGU1netBoQ7y/AdHEHxndo5tEeIPR3eBXGds0qo+lkn/C
X-Google-Smtp-Source: AGHT+IENbv1JB8KrYfz9k4cJJbNQpQvc3N1XgF/oP1hbnTMuUKfGE8n6eqcvVdPstQafQqQTqXppzX65dn8nHDLTa8k=
X-Received: by 2002:a05:6512:a90:b0:52c:c4b3:7e95 with SMTP id
 2adb3069b0e04-52e7038ba94mr23119e87.18.1719434463152; Wed, 26 Jun 2024
 13:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
 <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com> <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
 <CAHBxVyHx9hTRPosizV_yn6DUZi-MTNTrAbJdkV3049D-qsDHcw@mail.gmail.com>
 <20240626-eraser-unselect-99e68a1f5a3e@spud> <20240626-spyglass-clutter-4ff4d7b26dd4@spud>
In-Reply-To: <20240626-spyglass-clutter-4ff4d7b26dd4@spud>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 26 Jun 2024 13:40:52 -0700
Message-ID: <CAHBxVyEg2uKKdikXib77JDmCKs8qDGJHvj3stsFgCgO0U9omRg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to hpmevent
 mapping while starting cpus
To: Conor Dooley <conor@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_134105_163205_3015B2A9 
X-CRM114-Status: GOOD (  18.92  )
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

T24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgOTozOeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAyNiwgMjAyNCBhdCAwNTozNzowN1BNICsw
MTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAyNiwgMjAyNCBhdCAwOTox
ODo0NkFNIC0wNzAwLCBBdGlzaCBLdW1hciBQYXRyYSB3cm90ZToKPiA+ID4gT24gV2VkLCBKdW4g
MjYsIDIwMjQgYXQgNjoyNOKAr0FNIFNhbXVlbCBIb2xsYW5kCj4gPiA+IDxzYW11ZWwuaG9sbGFu
ZEBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIDIwMjQtMDYtMjYgMjoyMyBB
TSwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gPiA+ID4gPiBGcm9tOiBTYW11ZWwgSG9sbGFuZCA8c2Ft
dWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDdXJyZW50bHksIHdl
IHN0b3AgYWxsIHRoZSBjb3VudGVycyB3aGlsZSBhIG5ldyBjcHUgaXMgYnJvdWdodCBvbmxpbmUu
Cj4gPiA+ID4gPiBIb3dldmVyLCB0aGUgaHBtZXZlbnQgdG8gY291bnRlciBtYXBwaW5ncyBhcmUg
bm90IHJlc2V0LiBUaGUgZmlybXdhcmUgbWF5Cj4gPiA+ID4gPiBoYXZlIHNvbWUgc3RhbGUgZW5j
b2RpbmcgaW4gdGhlaXIgbWFwcGluZyBzdHJ1Y3R1cmUgd2hpY2ggbWF5IGxlYWQgdG8KPiA+ID4g
PiA+IHVuZGVzaXJhYmxlIHJlc3VsdHMuIFdlIGhhdmUgbm90IGVuY291bnRlcmVkIHN1Y2ggc2Nl
bmFyaW8gdGhvdWdoLgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgbmVlZHM6Cj4gPiA+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KPiA+ID4gPgo+ID4gPgo+ID4gPiBPb3BzLiBTb3JyeSBJIG1pc3NlZCB0aGF0
Lgo+ID4gPgo+ID4gPiBAQWxleGFuZHJlIEdoaXRpCj4gPgo+ID4gV2hhdCdzIEFsZXggZ29pbmcg
dG8gYmUgYWJsZSB0byBkbz8KPiA+CgpIZSBpcyBjb2xsZWN0aW5nIHRoZSBmaXhlcyBwYXRjaGVz
IGluIHRoZSBSSVNDLVYgdHJlZSBhbmQgcGluZ2VkIGZvcgpyZXZpc2lvbiBmb3IgdGhpcyBwYXRj
aCBsYXN0IHdlZWsuCgo+ID4gPiBAUGFsbWVyIERhYmJlbHQgOiBDYW4geW91IGFkZCB0aGF0IHdo
aWxlIHBpY2tpbmcgdXAKPiA+ID4gdGhlIHBhdGNoIG9yIHNob3VsZCBJIHJlc3BpbiBhIHY0ID8K
PiA+Cj4gPiBiNCBzaG91bGQgcGljayB0aGUgc2lnbm9mZiB1cCB0aG91Z2guICJwZXJmOiBSSVND
LVY6IENoZWNrIHN0YW5kYXJkCj4gPiBldmVudCBhdmFpbGFiaWxpdHkiIHNlZW1zIHRvIGJlIG1p
c3NpbmcgeW91ciBzaWdub2ZmIHRob3VnaC4uLgo+Cj4gSHVoLCB0aGlzIGRvZXNuJ3QgcmVhbGx5
IG1ha2Ugc2Vuc2UuIEkgbWVhbnQ6Cj4gICAgICAgICBiNCBzaG91bGQgcGljayB0aGUgc2lnbm9m
ZiB1cCwgdGhvdWdoICJwZXJmOiBSSVNDLVY6IENoZWNrIHN0YW5kYXJkCj4gICAgICAgICBldmVu
dCBhdmFpbGFiaWxpdHkiIHNlZW1zIHRvIGJlIG1pc3NpbmcgeW91ciBzaWdub2ZmLi4uCgpTdHJh
bmdlLiBJIG1vZGlmaWVkIGFuZCBzZW50IHRoZSBwYXRjaCB1c2luZyBiNCBhcyB3ZWxsLiBJdCdz
IG1pc3NpbmcKbXkgc2lnbiBvZmYgdG9vLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
