Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33BAEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 01:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8MlcOPv0YsIZ9q+uMQP5+IsFAIhIguNAVGer3AhTFE=; b=mkukGL+0A3JVuH
	tAK8mNmJWxltFUAH2FNYhdnYI8PpkA2IJAJptN8zvlrOuXtDOHita0wecXk6nmS7sZLmARK+XeO+n
	82mRz2jOsfIMB9WaKcHhxhbEygLEBI1I8+Xm+Nycjv4f61oo2p19dEDe32gK0oqER5XUO/FKC6JYQ
	4axvuUa4VG00HiAc2I/B6T+CtoHg3/TrTyxN2So+GmXNgn4O5FMtvzzrIA1jyMa39ulV8Evp6cD+C
	2ydkQ/qd4GGY/4d32lPtYSF5gSnYi+5IxRvLatflWOHu3li4UAwOhNjhNuT3veQYItrc5DR0SE6u0
	vQxIZBrl5wY3S04/rA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR0J1-003ebj-1m;
	Wed, 02 Aug 2023 01:05:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR0Iz-003ebO-0x
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 01:05:38 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2680a031283so3840386a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 18:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690938335; x=1691543135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOfoEhakv6Y5bu64uKylY9xP9VvxltVfyqfhwcx3DFg=;
        b=nh9GHiP82vnYxjw8IeEC5XpM9aY0Jr0IkMQBMbEnN2Mvsd2lqz8B+xI79BT7nRy2Qx
         xvwGw8z9BqaiKV+E2W291BUrta5viEfdYotxD4L/V7oRY0ctpwpNk8Su0RlOqRH4Zs1o
         qH545yj+jMsy1LYP897m+mNY+dngAJtvluo9m5S8xwo0/nyQziKX0qNFoboRbO/MPohG
         9julpi1FGhsEa/w/a58XzYhhYKfd3+O5ufHQvVDddDxZtAyhTHQfC/UG0e2uTzpO4fvf
         DKw5/b37n6P/3Q2aVes7yMla+z8JScKjivQgCflBwJKJToVk1L6+mabGS6cW/VWM4XBG
         bnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690938335; x=1691543135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOfoEhakv6Y5bu64uKylY9xP9VvxltVfyqfhwcx3DFg=;
        b=kCXfNuLpqetLbU/4E5XcXGq/+LsFzvHaE7UABPUcgJlBDN/kcFHYUpV8bJ6u9xMBJr
         9UOdR89AHotpT+O7RJPH+K4/XOhXB3R4w5jHCflmmhmdnBM1z7qXxR8PkSt6KBDwx+l0
         wK4c0XipPnesDCtI3zWZodFVTCGjQoavWM6QjngcYUxI324Z/YsBHOLUhrRxTX6pF92i
         0CUG00Os7nhrgGDtcS13V5IyStcmCwtwF9LIpCamaJcqQ4xHtCnC1qF/4t7NYTnko9rk
         9vmMPyEvmBTaqUbcmx445rgB6smxKkRtL5/U1DcfKXCkpKvvwV9cz4zXrHy4GjaDg2sI
         itZg==
X-Gm-Message-State: ABy/qLYW/fsC6P/EKQxdqfv0hR0n+YXezJW4uj8QhGgj3nHFGZyWYERi
	uIZ2WbWVaPjIFCqeB/fpW9FZeW8/LJMDQUInstg=
X-Google-Smtp-Source: APBJJlHGV9wmFO84BvXYJ4645A87rM42LBCYV5BMbJpZtIBwMzhra96BSsEsKx62x8u1seqzZpPc4U1LtcDjPet3q18=
X-Received: by 2002:a17:90a:4815:b0:262:ded7:63d with SMTP id
 a21-20020a17090a481500b00262ded7063dmr13287058pjh.17.1690938335162; Tue, 01
 Aug 2023 18:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230801111014.1432679-1-suagrfillet@gmail.com>
 <CAHVXubgv1xmH7ZF9WsBQ=hYYk1PpKH5PUmYnSH1QTU-Jg1=xOA@mail.gmail.com> <CAJF2gTR-OTfbYVZD2uWm4GFOxbva_OpR70tbhYf197bX+yngRQ@mail.gmail.com>
In-Reply-To: <CAJF2gTR-OTfbYVZD2uWm4GFOxbva_OpR70tbhYf197bX+yngRQ@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Wed, 2 Aug 2023 01:05:23 +0000
Message-ID: <CAAYs2=g2sm=mdoET5tMwBTPwpc-Um-2Xabt9QCaWmAi_VfWTYg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Correct the MODULES_VADDR
To: Guo Ren <guoren@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, 
	sergey.matyukevich@syntacore.com, david@redhat.com, 
	wangkefeng.wang@huawei.com, panqinglin2020@iscas.ac.cn, 
	woodrow.shen@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_180537_335648_45439596 
X-CRM114-Status: GOOD (  21.79  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjPlubQ45pyIMeaXpeWRqOS6jCAyMzoy
MOWGmemBk++8mgo+Cj4gT24gVHVlLCBBdWcgMSwgMjAyMyBhdCA4OjA14oCvQU0gQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBTb25nLAo+
ID4KPiA+IE9uIFR1ZSwgQXVnIDEsIDIwMjMgYXQgMToxMOKAr1BNIFNvbmcgU2h1YWkgPHN1YWdy
ZmlsbGV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFzIERvY3VtZW50YXRpb24vcmlz
Y3Yvdm0tbGF5b3V0LnJzdCBkZXNjcmliZXMsIHRoZSAyRy1zaXplZCAibW9kdWxlcywgQlBGIgo+
ID4gPiBhcmVhIHNob3VsZCBsaWUgcmlnaHQgYmVmb3JlIHRoZSAia2VybmVsIiBhcmVhLiBCdXQg
dGhlIGN1cnJlbnQgZGVmaW5pdGlvbgo+ID4gPiBvZiBNT0RVTEVTX1ZBRERSIGlzbid0IGNvbnNp
c3RlbnQgd2l0aCB0aGF0LCBzbyBjb3JyZWN0IGl0Lgo+ID4gPgo+ID4gPiBCZWZvcmUgdGhpcyBw
YXRjaCwgdGhlIHNpemUgb2YgIm1vZHVsZXMiIGZyb20gcHJpbnRfdm1fbGF5b3V0KCkgaXMgbm90
IDJHLgo+ID4gPgo+ID4gPiBbICAgIDAuMDAwMDAwXSAgICAgIG1vZHVsZXMgOiAweGZmZmZmZmZm
MmZmMmYwMDAgLSAweGZmZmZmZmZmYWU2MDAwMDAgKDIwMjIgTUIpCj4gPiA+IFsgICAgMC4wMDAw
MDBdICAgICAgIGxvd21lbSA6IDB4ZmY2MDAwMDAwMDAwMDAwMCAtIDB4ZmY2MDAwMDA0MDAwMDAw
MCAoMTAyNCBNQikKPiA+ID4gWyAgICAwLjAwMDAwMF0gICAgICAga2VybmVsIDogMHhmZmZmZmZm
ZmFlNjAwMDAwIC0gMHhmZmZmZmZmZmZmZmZmZmZmICgxMzA1IE1CKQo+ID4gPgo+ID4gPiBBZnRl
ciB0aGlzIHBhdGNoLCB0aGUgc2l6ZSBpcyAyRy4KPiA+ID4KPiA+ID4gWyAgICAwLjAwMDAwMF0g
ICAgICBtb2R1bGVzIDogMHhmZmZmZmZmZjNhMDAwMDAwIC0gMHhmZmZmZmZmZmJhMDAwMDAwICgy
MDQ4IE1CKQo+ID4gPiBbICAgIDAuMDAwMDAwXSAgICAgICBsb3dtZW0gOiAweGZmNjAwMDAwMDAw
MDAwMDAgLSAweGZmNjAwMDAwNDAwMDAwMDAgKDEwMjQgTUIpCj4gPiA+IFsgICAgMC4wMDAwMDBd
ICAgICAgIGtlcm5lbCA6IDB4ZmZmZmZmZmZiYTAwMDAwMCAtIDB4ZmZmZmZmZmZmZmZmZmZmZiAo
MTExOSBNQikKPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxs
ZXRAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oIHwgMiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+IGluZGV4
IDc1OTcwZWUyYmRhMi4uN2M1N2UxN2ZjNzU4IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUuaAo+ID4gPiBAQCAtNTMsOCArNTMsOCBAQAo+ID4gPiAgI2lmZGVmIENPTkZJR182
NEJJVAo+ID4gPiAgLyogVGhpcyBpcyB1c2VkIHRvIGRlZmluZSB0aGUgZW5kIG9mIHRoZSBLQVNB
TiBzaGFkb3cgcmVnaW9uICovCj4gPiA+ICAjZGVmaW5lIE1PRFVMRVNfTE9XRVNUX1ZBRERSICAg
KEtFUk5FTF9MSU5LX0FERFIgLSBTWl8yRykKPiA+ID4gLSNkZWZpbmUgTU9EVUxFU19WQUREUiAg
ICAgICAgICAoUEZOX0FMSUdOKCh1bnNpZ25lZCBsb25nKSZfZW5kKSAtIFNaXzJHKQo+ID4gPiAg
I2RlZmluZSBNT0RVTEVTX0VORCAgICAgICAgICAgIChQRk5fQUxJR04oKHVuc2lnbmVkIGxvbmcp
Jl9zdGFydCkpCj4gPiA+ICsjZGVmaW5lIE1PRFVMRVNfVkFERFIgICAgICAgICAgKE1PRFVMRVNf
RU5EIC0gU1pfMkcpCj4gPiA+ICAjZW5kaWYKPiA+ID4KPiA+ID4gIC8qCj4gPiA+IC0tCj4gPiA+
IDIuMjAuMQo+ID4gPgo+ID4KPiA+IFRoZSBkb2N1bWVudGF0aW9uIGlzIGFwcHJveGltYXRpdmUs
IHRoZSBtb2R1bGVzIG11c3Qgc3RheSB3aXRoaW4gYSAyR0IKPiA+IHdpbmRvdyB0byAqYWxsKiB0
aGUga2VybmVsIHN5bWJvbHMsIGhlbmNlIHRoZSBfX2VuZCAtIDJHLCBub3QgX19zdGFydC4KPiBU
aHVzLCB0aGUgZnRyYWNlIGRldG91ciB0cmFtcG9saW5lIGNvdWxkIGNvdmVyIGFsbCBrZXJuZWwg
c3ltYm9scy4KPgpUaGF0J3MgYW5vdGhlciB2aWV3IHRvIGhlbHAgbWUgdW5kZXJzdGFuZCB0aGUg
ZGVmaW5pdGlvbiBvZgpNT0RVTEVTX1ZBRERSLFRoYW5rcy4KPiAtLQo+IEJlc3QgUmVnYXJkcwo+
ICBHdW8gUmVuCgoKCi0tIApUaGFua3MsClNvbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
