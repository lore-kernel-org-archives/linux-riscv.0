Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE21C00528
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 22:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WVb57z4g9nPddGQvCPzPa/EewdHnkFC9Zexc/TbikDU=; b=LIgWHG7ODUAPaY
	LTE9oTLSDdzgJymVzFuL8HITgjhHwz0WFkqh3Oikdf1AYZobeljZwe9Jwhja+d8vX8V0vbBMuQ3m3
	8DIZrkbDOA5y/OERGEi2reNv2dWj9j1dBhr6HTqqOuYm1OVi3xKedtPvCQq0IUrrGYe7m3hT+w+/i
	TXwNYH17RHVsqxbPrPAcjCFvldthYZPZ3Cl7lxq+z2isLH1WUomJWokzrzWrcnUcRW4ApzZHWEdb0
	GUIJHnf8lOM00LEdcWrEuSdwHr53+xqGBVOwCiiz0jPYSvBrcq1jG/blpUN73JUtJsUgugG461y0y
	oDYPw+WdPxg4uUQ+24jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxlB-003QNe-2k;
	Tue, 01 Aug 2023 22:22:33 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxl8-003QM5-1h
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 22:22:32 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-52164adea19so8279721a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 15:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690928541; x=1691533341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIdAXVeCX023CXL0dIkcMbpnpUwf/1Zbz+CDE0MYpdA=;
        b=zGUTQBqADKJI0542k8Xf15503QgzkM457a2OErcRTosiK6bvEFow9m7Sr7TZudLD+d
         nX3StfOcbjXKfqr3JqP6eyP7r/oOTpgmw9B1ggw+P0bEq2fu9am+TKJ3p8YvKtzZQe1c
         5Xw4CeLJHZyiGvmmWk4G8q6WFAfulgLVE6BA2vVpuKeQJK0QUmixCaaW2xm1zBQ6wTOD
         xInmIcL6Us5aCyV+376xag9hDt9UtAkfmXnz+5wMln63QsLlgWx+6lZu2n/WJptfD0n5
         H98bAM3uLuPmn0HftnR3bUIedI0IO5Wq+PS17LMMuCVD0I/IzEB/psoG+ja5ImRAhV5P
         BV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928541; x=1691533341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIdAXVeCX023CXL0dIkcMbpnpUwf/1Zbz+CDE0MYpdA=;
        b=F8RySgqMnMYpBHUHBYFQZ+2IDKqsGZiOlogRtxaOGBZXw4DkvtqUB82sf/p4Tm4c5F
         cHRPpJrnNI8j/t94judVgGxfe9xZWL771gbXdZHSzuOvkdjAvNr00u6x7uHV/9sePKmP
         1f7utZ6YOt37tnfg4E1xJmlDNiU62Z8FohirwdSbgAsasGJ7eo/nwa+PUjkHQ/7EuJ0R
         4OWV7QK2lzkW7w5KcBLz26/DC5ywixPRR4LSqSj4RFDI6Aw2j6Sjuv1l4DTp1RiETEYJ
         hE16n+tNLAUSm5hghumRw8EuXWnYSdemITocRQQiHmO9QkVCxDP4GcudcPPXZ33Auk36
         g7Rg==
X-Gm-Message-State: ABy/qLZgZ1JaSZm9PfBy/ik7zfws4YFMG2KJ47Bjr1IkiS1gOA3uuts+
	ph6A+bvBqTLbxm1AOpC0USvpULxrI4Hu+KwLIhcl9Q==
X-Google-Smtp-Source: APBJJlG198u3S8vlo+W7HOZPH8S9UFWg5AyX+Zc1gJMMdC04QfJg+j+PVN5g40HMzK3BY1igKJGAvns6JeFwNkx9f58=
X-Received: by 2002:aa7:d748:0:b0:518:6a99:cac3 with SMTP id
 a8-20020aa7d748000000b005186a99cac3mr3830626eds.31.1690928540799; Tue, 01 Aug
 2023 15:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230801-arch-riscv-kernel-v1-1-2b3f2dc0bc61@google.com> <20230801-tinsel-parcel-aa034d07aeb6@spud>
In-Reply-To: <20230801-tinsel-parcel-aa034d07aeb6@spud>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 1 Aug 2023 15:22:07 -0700
Message-ID: <CAFhGd8pCf5Ose-AVH2k-3fP=7AkHsX5eDsd82Z0F5qEdUFT0qQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: cpu: refactor deprecated strncpy
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_152230_560811_2DA83BDA 
X-CRM114-Status: GOOD (  36.91  )
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

T24gVHVlLCBBdWcgMSwgMjAyMyBhdCAyOjI24oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEhleSBKdXN0aW4sCj4KPiBPbiBUdWUsIEF1ZyAwMSwgMjAyMyBh
dCAwOToxNDo1NlBNICswMDAwLCBKdXN0aW4gU3RpdHQgd3JvdGU6Cj4gPiBgc3RybmNweWAgaXMg
ZGVwcmVjYXRlZCBmb3IgdXNlIG9uIE5VTC10ZXJtaW5hdGVkIGRlc3RpbmF0aW9uIHN0cmluZ3Mg
WzFdLgo+ID4KPiA+IEEgc3VpdGFibGUgcmVwbGFjZW1lbnQgaXMgYHN0cnNjcHlgIFsyXSBkdWUg
dG8gdGhlIGZhY3QgdGhhdCBpdAo+ID4gZ3VhcmFudGVlcyBOVUwtdGVybWluYXRpb24gb24gaXRz
IGRlc3RpbmF0aW9uIGJ1ZmZlciBhcmd1bWVudCB3aGljaCBpcwo+ID4gX25vdF8gdGhlIGNhc2Ug
Zm9yIGBzdHJuY3B5YCEKPiA+Cj4gPiBUaGUgYHN2X3R5cGVgIGJ1ZmZlciBpcyBkZWNsYXJlZCB3
aXRoIGEgc2l6ZSBvZiAxNiB3aGljaCBpcyB0aGVuCj4gPiBmb2xsb3dlZCBieSBzb21lIGBzdHJu
Y3B5YCBjYWxscyB0byBwb3B1bGF0ZSB0aGUgYnVmZmVyIHdpdGggb25lIG9mOgo+ID4gInN2MzIi
LCAic3Y1NyIsICJzdjQ4IiwgInN2MzkiIG9yICJub25lIi4gSGFyZC1jb2RpbmcgdGhlIG1heCBs
ZW5ndGggYXMgNSBpcwo+ID4gZXJyb3ItcHJvbmUgYW5kIGludm9sdmVzIGNvdW50aW5nIHRoZSBu
dW1iZXIgb2YgY2hhcmFjdGVycyAoYW5kCj4gPiBob3BlZnVsbHkgbm90IGZvcmdldHRpbmcgdG8g
Y291bnQgdGhlIE5VTC1ieXRlKSBpbiB0aGUgcmF3IHN0cmluZy4KPgo+IFdoYXQgaXMgZXJyb3Ig
cHJvbmUgYWJvdXQgaXQgd2hlbiB0aGVyZSBhcmUgb25seSA0IGNoYXJhY3RlcnMgcG9zc2libGU/
CgpUbyBjbGFyaWZ5LCBJIGRvbid0IGJlbGlldmUgdGhlcmUgaXMgYSBidWcgaW4gdGhlIGN1cnJl
bnQKaW1wbGVtZW50YXRpb24uIEhvd2V2ZXIsIHdoYXQgSSBiZWxpZXZlIHRvIGJlCmVycm9yIHBy
b25lIGlzIHRoYXQgc2ltcGx5IG1pc2NvdW50aW5nIHRoZSBsZW5ndGggb2YgdGhlIHJhdyBzdHJp
bmcKd291bGQgcmVzdWx0IGluIGEgYnVmZmVyIG92ZXJyZWFkLgoKU2VlIGhlcmU6IGh0dHBzOi8v
Z29kYm9sdC5vcmcvei81cmVXN2Exc3oKCj4KPiA+IFVzaW5nIGEgcHJlLWRldGVybWluZWQgbWF4
IGxlbmd0aCBpbiBjb21iaW5hdGlvbiB3aXRoIGBzdHJzY3B5YCBwcm92aWRlcwo+ID4gYSBjbGVh
bmVyLCBsZXNzIGVycm9yLXByb25lIGFzIHdlbGwgYXMgYSBsZXNzIGFtYmlndW91cyBpbXBsZW1l
bnRhdGlvbi4KPiA+IGBzdHJzY3B5YCBndWFyYW50ZWVzIHRoYXQgaXQncyBkZXN0aW5hdGlvbiBi
dWZmZXIgaXMgTlVMLXRlcm1pbmF0ZWQgZXZlbgo+ID4gaWYgaXQncyBzb3VyY2UgYXJndW1lbnQg
ZXhjZWVkcyB0aGUgbWF4IGxlbmd0aCBhcyBkZWZpbmVkIGJ5IHRoZSB0aGlyZAo+Cj4gV3Jvbmcg
aXRzIDspCgpPb3BzLCBFbmdsaXNoIGlzIGhhcmQgOygKCj4KPiA+IGFyZ3VtZW50Lgo+ID4KPiA+
IFRvIGJlIGNsZWFyLCB0aGVyZSBpcyBubyBidWcgKGkgdGhpbms/KSBpbiB0aGUgY3VycmVudCBp
bXBsZW1lbnRhdGlvbgo+ID4gYnV0IHRoZSBjdXJyZW50IGhhcmQtY29kZWQgdmFsdWVzIGluIGNv
bWJpbmF0aW9uIHdpdGggdXNpbmcgYSBkZXByZWNhdGVkCj4gPiBpbnRlcmZhY2UgbWFrZSB0aGlz
IGEgd29ydGh3aGlsZSBjaGFuZ2UsIElNTy4KPiA+Cj4gPiBbMV06IHd3dy5rZXJuZWwub3JnL2Rv
Yy9odG1sL2xhdGVzdC9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCNzdHJuY3B5LW9uLW51bC10ZXJt
aW5hdGVkLXN0cmluZ3MKPiA+IFsyXTogbWFucGFnZXMuZGViaWFuLm9yZy90ZXN0aW5nL2xpbnV4
LW1hbnVhbC00Ljgvc3Ryc2NweS45LmVuLmh0bWwKPgo+IFRoaXMgbGluayBpcyBicm9rZW4sIGl0
IHNob3VsZCBiZQo+IGh0dHBzOi8vbWFucGFnZXMuZGViaWFuLm9yZy90ZXN0aW5nL2xpbnV4LW1h
bnVhbC00Ljgvc3Ryc2NweS45LmVuLmh0bWwKCk5vdGVkLCB3aWxsIGZpeCBpbiBmdXR1cmUgcGF0
Y2hlcy4KCj4KPiBBbHNvLCBpbiB0aGUgZnV0dXJlLCBwbGVhc2UgdXNlIHRoZSBmb3JtCj4KPiBM
aW5rOiA8dXJsPiBbcmVmXQo+Cj4gc28KPgo+IExpbms6IGh0dHBzOi8vbWFucGFnZXMuZGViaWFu
Lm9yZy90ZXN0aW5nL2xpbnV4LW1hbnVhbC00Ljgvc3Ryc2NweS45LmVuLmh0bWwgWzFdCj4KPiBh
bmQgc28gb24uCkdvdCBpdC4gVGhhbmtzIQoKPgo+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29t
L0tTUFAvbGludXgvaXNzdWVzLzkwCj4gPiBDYzogbGludXgtaGFyZGVuaW5nQHZnZXIua2VybmVs
Lm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogSnVzdGluIFN0aXR0IDxqdXN0aW5zdGl0dEBnb29nbGUu
Y29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgfCAxNCArKysrKysrKy0t
LS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvY3B1LmMKPiA+IGluZGV4IGEyZmM5NTIzMThlOS4uMWM1NzZlNGVjMTcxIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdS5jCj4gPiBAQCAtMTcsNiArMTcsOCBAQAo+ID4gICNpbmNsdWRlIDxhc20vc21w
Lmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9wZ3RhYmxlLmg+Cj4gPgo+ID4gKyNkZWZpbmUgU1ZfVFlQ
RV9NQVhfTEVOR1RIIDE2Cj4gPiArCj4gPiAgLyoKPiA+ICAgKiBSZXR1cm5zIHRoZSBoYXJ0IElE
IG9mIHRoZSBnaXZlbiBkZXZpY2UgdHJlZSBub2RlLCBvciAtRU5PREVWIGlmIHRoZSBub2RlCj4g
PiAgICogaXNuJ3QgYW4gZW5hYmxlZCBhbmQgdmFsaWQgUklTQy1WIGhhcnQgbm9kZS4KPiA+IEBA
IC0yNzEsMjEgKzI3MywyMSBAQCBzdGF0aWMgdm9pZCBwcmludF9pc2Eoc3RydWN0IHNlcV9maWxl
ICpmLCBjb25zdCBjaGFyICppc2EpCj4gPgo+ID4gIHN0YXRpYyB2b2lkIHByaW50X21tdShzdHJ1
Y3Qgc2VxX2ZpbGUgKmYpCj4gPiAgewo+ID4gLSAgICAgY2hhciBzdl90eXBlWzE2XTsKPiA+ICsg
ICAgIGNoYXIgc3ZfdHlwZVtTVl9UWVBFX01BWF9MRU5HVEhdOwo+ID4KPiA+ICAjaWZkZWYgQ09O
RklHX01NVQo+ID4gICNpZiBkZWZpbmVkKENPTkZJR18zMkJJVCkKPiA+IC0gICAgIHN0cm5jcHko
c3ZfdHlwZSwgInN2MzIiLCA1KTsKPiA+ICsgICAgIHN0cnNjcHkoc3ZfdHlwZSwgInN2MzIiLCBT
Vl9UWVBFX01BWF9MRU5HVEgpOwo+ID4gICNlbGlmIGRlZmluZWQoQ09ORklHXzY0QklUKQo+ID4g
ICAgICAgaWYgKHBndGFibGVfbDVfZW5hYmxlZCkKPiA+IC0gICAgICAgICAgICAgc3RybmNweShz
dl90eXBlLCAic3Y1NyIsIDUpOwo+ID4gKyAgICAgICAgICAgICBzdHJzY3B5KHN2X3R5cGUsICJz
djU3IiwgU1ZfVFlQRV9NQVhfTEVOR1RIKTsKPiA+ICAgICAgIGVsc2UgaWYgKHBndGFibGVfbDRf
ZW5hYmxlZCkKPiA+IC0gICAgICAgICAgICAgc3RybmNweShzdl90eXBlLCAic3Y0OCIsIDUpOwo+
ID4gKyAgICAgICAgICAgICBzdHJzY3B5KHN2X3R5cGUsICJzdjQ4IiwgU1ZfVFlQRV9NQVhfTEVO
R1RIKTsKPiA+ICAgICAgIGVsc2UKPiA+IC0gICAgICAgICAgICAgc3RybmNweShzdl90eXBlLCAi
c3YzOSIsIDUpOwo+ID4gKyAgICAgICAgICAgICBzdHJzY3B5KHN2X3R5cGUsICJzdjM5IiwgU1Zf
VFlQRV9NQVhfTEVOR1RIKTsKPiA+ICAjZW5kaWYKPiA+ICAjZWxzZQo+ID4gLSAgICAgc3RybmNw
eShzdl90eXBlLCAibm9uZSIsIDUpOwo+ID4gKyAgICAgc3Ryc2NweShzdl90eXBlLCAibm9uZSIs
IFNWX1RZUEVfTUFYX0xFTkdUSCk7Cj4gPiAgI2VuZGlmIC8qIENPTkZJR19NTVUgKi8KPiA+ICAg
ICAgIHNlcV9wcmludGYoZiwgIm1tdVx0XHQ6ICVzXG4iLCBzdl90eXBlKTsKPiA+ICB9Cj4KPiBU
aGlzIGFsbCBzZWVtcyByYXRoZXIgaG9ycmlibGUsIHdlIHNob3VsZCBwcm9iYWJseSBjbGVhbiBp
dCB1cCwgYnV0IHRoYXQKPiBpcyBub3RoaW5nIHRvIGRvIHdpdGggeW91ciBwYXRjaC4gVG8gYmUg
Y2xlYXIsIEkgYW0gYWxzbyBub3QgcmVxdWVzdGluZyBhCj4gcmVzdWJtaXNzaW9uIGZvciB0aGUg
Y29tbWl0IG1lc3NhZ2Ugbml0cGlja2VyeS4KPgo+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKLS0KSnVz
dGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
