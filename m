Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F756EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhsShF5Uxt1UYXGGc6IKC/VEisdkO9pLJ/158B2avZs=; b=1k0Mx29yXYLsDa
	60yhBrUAiCrUf2CQCiHzq3siQDyf83lkaUlBzg+EnUdgGzRloE8ddfZxX98L5N5U11Q9DA8ztFxhe
	DSuJb0q5x+T6nB74jm1aOJOr3UZSW7nVnGZlJsRyPsvWVvFZ04myLDV1lEo/umxjuPSRpe5O31Cg8
	kY3p7yQJTHi9R20ft/RAxSzmcw4Bha1XFE5udgnqVCv+HkYm57j5C5xx33ppyuHC8ptUX5/Mp+2n+
	/Xz7TkuOoPf4iUzAT659sSIncAPpCgWqZkXZvEm/N5SzQzhPfifE0aMC1emEsQhQv/5s6/V2YvzKJ
	1+0gZ6Db/mfa3l6KrYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMV33-00BRpG-37;
	Thu, 20 Jul 2023 14:54:33 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMV30-00BRoX-1o
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 14:54:32 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b703a0453fso13242611fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689864867; x=1690469667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teSvxipO9uwCsDL8hB2i3L6gOp9kRdGn1U7q6RfbZZs=;
        b=QFe4pB8mXDIHFblvpBlu+mIfchNFyDZ43YK60d1h3JwWmIQcqJp8WDht9k0m86RUMx
         dDEdaSINYPAfD7f39fHHCnlu+r7Q10HmU3ycxhiKEaz1IPLRmfNJ9nF6HI/pCnVkzVsm
         59U3KCUYt01GNIVZBgJtIxrGKzt9mLRZXjvcBcoSp8DRNLwekbLua8qENNW0NQmp6wII
         qsMukg0twCAt/qw+ySiJXrVmHDJFR5wwpwmz8Ol2qA+IOGfIM+PZrjVlcbPLd+Z3l0BS
         GoBhwzFr9oRlww3M8jR8wOtt+jrvDM/D/g7DejznH4eO7H47HqiAr6Hpl+EAJY7uiMkA
         WhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864867; x=1690469667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teSvxipO9uwCsDL8hB2i3L6gOp9kRdGn1U7q6RfbZZs=;
        b=LmdFFCyctes30+Fpss0LIWzO5IUHPxXwFsfVDsmKO7pMtunKfJqK8Yvt7ijjMGNxB8
         aWDoErvvENj6c5vNutxy00+hpp7mLpc0zN+rPbuSIdLhsrBJktFzybF8cG7elnF2h/v6
         L6ve2Qg2Op1oN6xtBNWTRc/amamC2KSgFIagEf7LNnOnRVQsZT2sdYlWBz0gUOIEdpUA
         aZ2g086LnBoytFAClD8qjKEuuwTx6Qk84LQdJmXgHV9HZ8TwZaiEp44D6R2Tva1zgbnd
         BjeKR6npiRus+2FfOZi0xSCPSjaorB5CwpW133nKPonBrJkopodfZscOAwFsQNb2KqkP
         kcQg==
X-Gm-Message-State: ABy/qLaRRr0MgM8otI1Hy95JR+SctKbIy/QVDzlDuWXEvFMMZ4q+o3tS
	2+uVo6NwSEN/mZU4hoeIPn1FtB85cMkfF9mnWSc/wg==
X-Google-Smtp-Source: APBJJlFWYLXT7lEWTcpW6DFAxxkCdMSw5MDsAVxUBRUR72BId1uRNPjEXNkfMEN52qs1HcXlQ5TJ/m3fWleX38nYS4k=
X-Received: by 2002:a2e:9b89:0:b0:2b6:e536:a2a3 with SMTP id
 z9-20020a2e9b89000000b002b6e536a2a3mr2619487lji.19.1689864866819; Thu, 20 Jul
 2023 07:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230715150032.6917-1-andy.chiu@sifive.com> <20230715150032.6917-3-andy.chiu@sifive.com>
 <20230717-caution-haste-2d9c7b7478b8@wendy>
In-Reply-To: <20230717-caution-haste-2d9c7b7478b8@wendy>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 20 Jul 2023 22:54:15 +0800
Message-ID: <CABgGipWfdGWg2E_2AsCs0Gwxs7KD-xWDvGSMq0m1epWuJ-BxJw@mail.gmail.com>
Subject: Re: [v1, 2/6] riscv: Add support for kernel mode vector
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	Anup Patel <apatel@ventanamicro.com>, guoren@linux.alibaba.com, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>, anup@brainfault.org, 
	Masahiro Yamada <masahiroy@kernel.org>, atishp@atishpatra.org, vineetg@rivosinc.com, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Vincent Chen <vincent.chen@sifive.com>, bjorn@kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, paul.walmsley@sifive.com, 
	greentime.hu@sifive.com, heiko.stuebner@vrull.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_075430_627585_D2CD7B3D 
X-CRM114-Status: GOOD (  39.46  )
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgNjoyM+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBKdWwgMTUsIDIwMjMgYXQgMDM6
MDA6MjhQTSArMDAwMCwgQW5keSBDaGl1IHdyb3RlOgo+ID4gRnJvbTogR3JlZW50aW1lIEh1IDxn
cmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+Cj4gPiBBZGQga2VybmVsX3J2dl9iZWdpbigpIGFu
ZCBrZXJuZWxfcnZ2X2VuZCgpIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucwo+ID4gYW5kIGNvcnJlc3Bv
bmRpbmcgZGVmaW5pdGlvbnMgaW4ga2VybmVsX21vZGVfdmVjdG9yLmMKPiA+Cj4gPiBUaGVzZSBh
cmUgbmVlZGVkIHRvIHdyYXAgdXNlcyBvZiB2ZWN0b3IgaW4ga2VybmVsIG1vZGUuCj4gPgo+ID4g
Q28tZGV2ZWxvcGVkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+
ID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4g
LS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCAgICAgICAgfCAgIDIgKwo+
ID4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgIHwgICAxICsKPiA+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9rZXJuZWxfbW9kZV92ZWN0b3IuYyB8IDEyOSArKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMzIgaW5zZXJ0aW9ucygrKQo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9rZXJuZWxfbW9kZV92ZWN0b3Iu
Ywo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+ID4gaW5kZXggYTRmMzcwNWZkMTQ0Li45
ODMxYjE5MTUzYWUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rv
ci5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gPiBAQCAtMjIs
NiArMjIsOCBAQAo+ID4gIGV4dGVybiB1bnNpZ25lZCBsb25nIHJpc2N2X3ZfdnNpemU7Cj4gPiAg
aW50IHJpc2N2X3Zfc2V0dXBfdnNpemUodm9pZCk7Cj4gPiAgYm9vbCByaXNjdl92X2ZpcnN0X3Vz
ZV9oYW5kbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPiA+ICtpbnQga2VybmVsX3J2dl9iZWdp
bih2b2lkKTsKPiA+ICt2b2lkIGtlcm5lbF9ydnZfZW5kKHZvaWQpOwo+Cj4gU28sIHdlIGRpdGNo
ZWQgYWxsIG9mIHRoZSAicnZ2IiBzdHVmZiBpbiB0aGUgbGFzdCBzZXJpZXMsIHVzaW5nIGVpdGhl
cgo+ICJ2ZWN0b3IiIC0gaGFzX3ZlY3RvcigpIC0gb3IgInJpc2N2X3YiLiBJJ2QgcmF0aGVyIG5v
dCBpbnRyb2R1Y2UgYSB0aGlyZAo+IG5hbWluZyBzY2hlbWUgZm9yIHZlY3RvciByZWxhdGVkIHRo
aW5ncy4uLgo+Cj4gR2l2ZW4gd2hhdCB5b3UgYWRkIGJlbG93IGlzIGZ1bGwgb2Ygb3RoZXIgdGhp
bmdzIHRoYXQgdXNlICJ2ZWN0b3IiLCBob3cKPiBkb2VzIHMvcnZ2L3ZlY3Rvci8gc291bmQgaGVy
ZT8KClllcywgSSBhZ3JlZS4gTGV0J3MgdXNlICd2ZWN0b3InIGluc3RlYWQgb2YgcnZ2LgoKPgo+
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwva2VybmVsX21vZGVfdmVjdG9yLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9rZXJuZWxfbW9kZV92ZWN0b3IuYwo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzBjMTUyYzUwMWE1Cj4gPiAtLS0gL2Rl
di9udWxsCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9rZXJuZWxfbW9kZV92ZWN0b3IuYwo+
Cj4gPiArLyoKPiA+ICsgKiBrZXJuZWxfcnZ2X2JlZ2luKCk6IG9idGFpbiB0aGUgQ1BVIHZlY3Rv
ciByZWdpc3RlcnMgZm9yIHVzZSBieSB0aGUgY2FsbGluZwo+ID4gKyAqIGNvbnRleHQKPiA+ICsg
Kgo+ID4gKyAqIE11c3Qgbm90IGJlIGNhbGxlZCB1bmxlc3MgbWF5X3VzZV92ZWN0b3IoKSByZXR1
cm5zIHRydWUuCj4gPiArICogVGFzayBjb250ZXh0IGluIHRoZSB2ZWN0b3IgcmVnaXN0ZXJzIGlz
IHNhdmVkIGJhY2sgdG8gbWVtb3J5IGFzIG5lY2Vzc2FyeS4KPiA+ICsgKgo+ID4gKyAqIEEgbWF0
Y2hpbmcgY2FsbCB0byBrZXJuZWxfcnZ2X2VuZCgpIG11c3QgYmUgbWFkZSBiZWZvcmUgcmV0dXJu
aW5nIGZyb20gdGhlCj4gPiArICogY2FsbGluZyBjb250ZXh0Lgo+ID4gKyAqCj4gPiArICogVGhl
IGNhbGxlciBtYXkgZnJlZWx5IHVzZSB0aGUgdmVjdG9yIHJlZ2lzdGVycyB1bnRpbCBrZXJuZWxf
cnZ2X2VuZCgpIGlzCj4gPiArICogY2FsbGVkLgo+ID4gKyAqLwo+ID4gK2ludCBrZXJuZWxfcnZ2
X2JlZ2luKHZvaWQpCj4KPiBIb3cgY29tZSB0aGlzIHJldHVybnMgYW4gaW50LCBidXQgeW91IG5l
dmVyIGFjdHVhbGx5IGNoZWNrIHRoZSByZXN1bHQ/IFRoZQo+IG90aGVyIGtlcm5lbF8qX2JlZ2lu
KClzIGRvbid0IHNlZW0gdG8gcmV0dXJuIGFueXRoaW5nIG90aGVyIHRoYW4gdm9pZC4KPgo+ID4g
K3sKPiA+ICsgICAgIGlmICghaGFzX3ZlY3RvcigpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4g
LUVPUE5PVFNVUFA7Cj4gPiArCj4gPiArICAgICBpZiAoIW1heV91c2VfdmVjdG9yKCkpCj4gPiAr
ICAgICAgICAgICAgIHJldHVybiAtRVBFUk07Cj4KPiBJIG5vdGljZSBhcm02NCB0YWtlcyBhIHN0
cm9uZ2VyIGFwcHJvYWNoLiBUaGVyZSwgaWYgdGhlIGhhcygpIGNhbGwKPiBmYWlscywgaXQgaGFz
IGEgV0FSTl9PTigpLiBGb3IgdGhlICFtYXlfdXNlKCkgY2FzZSwgaXQgQlVHKClzLgo+IFNpbmNl
IHVzZXJzIGFyZSBmb3JjZWQgdG8gY2hlY2sgbWF5X3VzZV92ZWN0b3IoKSBiZWZvcmUgY2FsbGlu
Zwo+IGtlcm5lbF9ydnZfYmVnaW4oKS4KPgo+IElzIHRoZXJlIGEgcmVhc29uIHRoYXQgd2Ugc2hv
dWxkIG5vdCB0YWtlIHRoZSBzYW1lIGFwcHJvYWNoPwoKWWVzLCBJIGFncmVlIHRoYXQgaXQgaXMg
YmV0dGVyIHRvIHJldHVybiBub3RoaW5nIGFmdGVyIHNvbWUgdGhpbmtpbmcuCk9yaWdpbmFsbHkg
SSB3YXMgaG9waW5nIHRvIHJldHVybiBhIGZhaWx1cmUgY29kZSBpZiB0aGUgcHJlZW1wdGlibGUK
a2VybmVsLW1vZGUgVmVjdG9yIGZhaWxlZCB0byBhbGxvY2F0ZSBtZW1vcnkgaW4KcmlzY3Zfdl9z
dGFydF9rZXJuZWxfY29udGV4dCgpLiBIb3dldmVyLCByZXR1cm5pbmcgdGhpbmdzIGhlcmUganVz
dApjb21wbGljYXRlcyB0aGUgcHJvZ3JhbW1pbmcgbW9kZWwgZm9yIGtlcm5lbC1tb2RlIFZlY3Rv
ci4gU28sIGxldCdzCmp1c3QgbWFrZSBpdCB0cmFuc3BhcmVudCB0byB1c2VycyBvZiBrZXJuZWxf
dmVjdG9yX2JlZ2luKCkgYW5kIHJldHVybgpub3RoaW5nIGhlcmUuCgo+Cj4gPiArCj4gPiArICAg
ICAvKiBTYXZlIHZlY3RvciBzdGF0ZSwgaWYgYW55ICovCj4gPiArICAgICByaXNjdl92X3ZzdGF0
ZV9zYXZlKGN1cnJlbnQsIHRhc2tfcHRfcmVncyhjdXJyZW50KSk7Cj4gPiArCj4gPiArICAgICAv
KiBBY3F1aXJlIGtlcm5lbCBtb2RlIHZlY3RvciAqLwo+ID4gKyAgICAgZ2V0X2NwdV92ZWN0b3Jf
Y29udGV4dCgpOwo+ID4gKwo+ID4gKyAgICAgLyogRW5hYmxlIHZlY3RvciAqLwo+Cj4gVGhlc2Ug
dGhyZWUgY29tbWVudHMgYXJlIG1vc3RseSBhIHN0YXRlbWVudCBvZiB0aGUgb2J2aW91cywgbm8/
CgpBZ3JlZSwgSSB3aWxsIGRyb3AgdGhvc2UgY29tbWVudHMuCgo+Cj4gPiArICAgICByaXNjdl92
X2VuYWJsZSgpOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gK0VYUE9SVF9T
WU1CT0xfR1BMKGtlcm5lbF9ydnZfYmVnaW4pOwo+ID4gKwo+ID4gKy8qCj4gPiArICoga2VybmVs
X3J2dl9lbmQoKTogZ2l2ZSB0aGUgQ1BVIHZlY3RvciByZWdpc3RlcnMgYmFjayB0byB0aGUgY3Vy
cmVudCB0YXNrCj4gPiArICoKPiA+ICsgKiBNdXN0IGJlIGNhbGxlZCBmcm9tIGEgY29udGV4dCBp
biB3aGljaCBrZXJuZWxfcnZ2X2JlZ2luKCkgd2FzIHByZXZpb3VzbHkKPiA+ICsgKiBjYWxsZWQs
IHdpdGggbm8gY2FsbCB0byBrZXJuZWxfcnZ2X2VuZCgpIGluIHRoZSBtZWFudGltZS4KPiA+ICsg
Kgo+ID4gKyAqIFRoZSBjYWxsZXIgbXVzdCBub3QgdXNlIHRoZSB2ZWN0b3IgcmVnaXN0ZXJzIGFm
dGVyIHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkLAo+ID4gKyAqIHVubGVzcyBrZXJuZWxfcnZ2X2Jl
Z2luKCkgaXMgY2FsbGVkIGFnYWluIGluIHRoZSBtZWFudGltZS4KPiA+ICsgKi8KPiA+ICt2b2lk
IGtlcm5lbF9ydnZfZW5kKHZvaWQpCj4gPiArewo+ID4gKyAgICAgaWYgKFdBUk5fT04oIWhhc192
ZWN0b3IoKSkpCj4KPiBCdXQgdGhlcmUgaXMgYSBXQVJOX09OKCkgaGVyZS4uLgo+Cj4gPiArICAg
ICAgICAgICAgIHJldHVybjsKPiA+ICsKPiA+ICsgICAgIC8qIFJlc3RvcmUgdmVjdG9yIHN0YXRl
LCBpZiBhbnkgKi8KPiA+ICsgICAgIHJpc2N2X3ZfdnN0YXRlX3NldF9yZXN0b3JlKGN1cnJlbnQs
IHRhc2tfcHRfcmVncyhjdXJyZW50KSk7Cj4gPiArCj4gPiArICAgICAvKiBkaXNhYmxlIHZlY3Rv
ciAqLwo+ID4gKyAgICAgcmlzY3Zfdl9kaXNhYmxlKCk7Cj4gPiArCj4gPiArICAgICAvKiByZWxl
YXNlIGtlcm5lbCBtb2RlIHZlY3RvciAqLwo+Cj4gQWdhaW4sIGNvbW1lbnRzIGtpbmRhIHN0YXRl
IHRoZSBvYnZpb3VzLCBubz8KPgo+IE90aGVyd2lzZSwgdGhpcyBzdHVmZiBsb29rcyBnZW5lcmFs
bHkgZmluZSB0byBtZSAmIHNpbWlsYXIgdG8gd2hhdCBpcwo+IGJlaW5nIGRvbmUgZWxzZXdoZXJl
Lgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
