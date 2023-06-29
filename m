Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD44EEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXQpIq71VguaVqgrP5rS6RSXyOyyRdhEYPjJdSstnQU=; b=VIF2zJvdo655hh
	l+QmMpffYEaUw7JzWYZ7x0QTHbws0KQFik+NZHazy4pUa78jeYc95drsp5dgPfl0L8m+6yWfFjsjO
	G7jNogV6FlrUEVcLn2/MBsbCmiOdEnBLakGKw7f2sdWET0BncSDgw9mEyIFfzXKOyjnR5oVC7plBY
	ZLMYR9oHMad3EWockZmWneW8EN7W0BaPuTpGG65+IAxqzmjpFI78BDhUH5E1l1jPF9DY75BqaZHLM
	EsQg+elTT6ToZrjM8yyRaAWHnGGisc9kVetrSIORFJ1nHOiZGHBMIeLgW04OyuvPA1q7if0xnRMwi
	71RU5bU0WP5sdbFiOsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0mr-002R1u-02;
	Thu, 29 Jun 2023 23:10:53 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0mn-002R0u-1D
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:10:50 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso1989345e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 16:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688080247; x=1690672247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOurnaMZUdb/k4kFNvbu1tJhgntbSJLOIlDNG1veMtc=;
        b=fRvpjUyIzWosp4wJZ9+CgVdvvl+cSgO0d9f4px0w9swQ5qz9TN5Sp2CHyAOqco6PCi
         0G7/8pE+tDu+++XoUtR7P+tnfsdvo2tXbwpbpSBvCbH8jr8Hm7UG4HF5sWPbuVtNZapv
         XOUZe+6Rlw4RDGKfqaB7crYWWG9AeD8xxdm9MytaL9GB5XYSlwc8PW2h/pAOdQiGKKoH
         eAtdrLW60XDOWld398pHoNySi1Y1uuGOgcs01gF48qlXMNZy61zGiS7Rb5nf6ZzaxzBX
         f6PvRexNJupNK5jRs1nyf8d/DnlGh8HzQB1vTch2WCK7I5Y3rUHUQAU00j1U+rDx1WsY
         UgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688080247; x=1690672247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOurnaMZUdb/k4kFNvbu1tJhgntbSJLOIlDNG1veMtc=;
        b=erPyNihp8il/wG1ZBD7DLypOMtLcALHQZsNo7L7Pb3CZ3iBlqx2zpRiyWmbrE3CQMG
         LaEiu4qf54extAFVhu6wEaWUavjC+vC38jp4bjS+fux0zZSL0a7A8nAz9NDEQffWc2Tc
         Wwl2Bdw/6aN+hosVs56d+aBhN57sBJTC82ybzdPCdvWZ/GCgPpb2WYpUU3c/aWIiGLKb
         Dx9BN3AVytWSeF+Yw/lnOFQYhpcZhxJMDzueFVk+KVQJGCT7XtqeIyKIEGhiMtOsKRqE
         8uAQhcSN8lFaeVs68kV85XALPEu0+KH1/WplRXDe4bSUROqBWCCmjvaoXKgZhkTIVoLO
         9Fpg==
X-Gm-Message-State: ABy/qLY29lkF6rpdwPSjqhu9DI86o0B0iohba8ByVnd/U0wJXWJ+4G3Z
	dcvtXa9Wj5mnb9mZnksOpKnF/OqmTu8tKT+q5EGaJg==
X-Google-Smtp-Source: APBJJlGjycSr7eiVtsYdR8UO8c7yL6rvjBfztXjuRS86wMWH1lovN1IhFs/b0VgwmKIxlYDpwEDhcHF13Dot6nWJINo=
X-Received: by 2002:a05:6512:348e:b0:4f8:6aa4:17ec with SMTP id
 v14-20020a056512348e00b004f86aa417ecmr771881lfr.43.1688080247044; Thu, 29 Jun
 2023 16:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230623222016.3742145-1-evan@rivosinc.com> <20230623222016.3742145-2-evan@rivosinc.com>
 <20230626-veneering-superglue-751719bd967c@wendy> <CALs-HsskE1-OkZxFzH9bM6bR9NBW5R4mh5AJScVtnvHbv+Pi6A@mail.gmail.com>
 <20230629-untaxed-tripping-6000bc8c1873@wendy>
In-Reply-To: <20230629-untaxed-tripping-6000bc8c1873@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 29 Jun 2023 16:10:11 -0700
Message-ID: <CALs-HstWNYD7HW3kNKjSHF9gd5+DB6ByH-Ay5xboh6dwBxv+-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Probe for unaligned access speed
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_161049_419647_7F60B407 
X-CRM114-Status: GOOD (  44.68  )
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
Cc: linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Masahiro Yamada <masahiroy@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, Li Zhengyu <lizhengyu3@huawei.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgNzowM+KAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgMTI6
MTE6MjVQTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDI2LCAyMDIz
IGF0IDc6MTXigK9BTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3
cm90ZToKPiA+ID4gPiArdm9pZCBjaGVja19taXNhbGlnbmVkX2FjY2VzcyhpbnQgY3B1KQo+ID4g
PiA+ICt7Cj4gPiA+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBqMCwgajE7Cj4gPiA+ID4gKyAgICAg
c3RydWN0IHBhZ2UgKnBhZ2U7Cj4gPiA+ID4gKyAgICAgdm9pZCAqZHN0Owo+ID4gPiA+ICsgICAg
IHZvaWQgKnNyYzsKPiA+ID4gPiArICAgICBsb25nIHdvcmRfY29waWVzID0gMDsKPiA+ID4gPiAr
ICAgICBsb25nIGJ5dGVfY29waWVzID0gMDsKPiA+ID4gPiArICAgICBsb25nIHNwZWVkID0gUklT
Q1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NMT1c7Cj4gPiA+Cj4gPiA+IElzIHRoaXMgbm90IGEgY2hh
bmdlIGZyb20gY3VycmVudCBiZWhhdmlvdXIsIHRoYXQgbWF5IGFjdHVhbGx5IGxlYWQgdG8KPiA+
ID4gaW5jb3JyZWN0IHJlcG9ydGluZy4gUHJlc2VudGx5LCBvbmx5IFQtSGVhZCBzdHVmZiBzZXRz
IGEgc3BlZWQsIHNvCj4gPiA+IGh3cHJvYmUgZmFsbHMgYmFjayB0byBVTktOT1dOIGZvciBldmVy
eXRoaW5nIGVsc2UuIFdpdGggdGhpcywgd2Ugd2lsbAo+ID4gPiBnZXQgc2xvdyBzZXQsIGZvciBh
bnl0aGluZyBmYWlsaW5nIHRoZSB0ZXN0Lgo+ID4gPiBTbG93IGlzIGRlZmluZWQgYXMgIk1pc2Fs
aWduZWQgYWNjZXNzZXMgYXJlIHN1cHBvcnRlZCBpbiBoYXJkd2FyZSwgYnV0Cj4gPiA+IGFyZSBz
bG93ZXIgdGhhbiB0aGUgY29vcmVzcG9uZGluZyBhbGlnbmVkIGFjY2Vzc2VzIHNlcXVlbmNlcyAo
c2ljKSIsIGJ1dAo+ID4gPiB5b3UgaGF2ZSBubyB3YXkgb2Yga25vd2luZywgYmFzZWQgb24gdGhl
IHRlc3QgeW91IGFyZSBwZXJmb3JtaW5nLCB3aGV0aGVyCj4gPiA+IHRoZSBoYXJkd2FyZSBzdXBw
b3J0cyBpdCBvciBpZiBpdCBpcyBlbXVsYXRlZCBieSBmaXJtd2FyZS4KPiA+ID4gUGVyaGFwcyB0
aGF0IGlzIG5vdCByZWxldmFudCB0byB1c2Vyc3BhY2UsIGJ1dCB3YW50ZWQgdG8ga25vdyB5b3Vy
Cj4gPiA+IHRob3VnaHRzLgo+ID4gPgo+ID4KPiA+IEhtLCB0aGF0J3MgdHJ1ZS4gRU1VTEFURUQg
d2FzIGFuIGVhc3kgb25lIHdoZW4gd2Ugd2VyZSBwbGFubmluZyB0byBnZXQKPiA+IHRoaXMgaW5m
byBmcm9tIHRoZSBEVC4gSXQgYWxzbyBtaWdodCBiZSBhbiBlYXN5IG9uZSBpbiB0aGUgZnV0dXJl
LCBpZgo+ID4gd2UgZ2V0IGFuIFNCSSBjYWxsIHRoYXQgYWxsb3dzIHRoZSBrZXJuZWwgdG8gdGFr
ZSBvdmVyIG1pc2FsaWduZWQgdHJhcAo+ID4gaGFuZGxpbmcuIFdlJ2QgdGhlbiBiZSBhYmxlIHRv
IGRvIGEgbWlzYWxpZ25lZCBhY2Nlc3MgYW5kIHNlZSBpZiBvdXIKPiA+IHRyYXAgaGFuZGxlciBn
b3QgY2FsbGVkLgo+ID4KPiA+IE9uZSBvcHRpb24gaXMgdG8gbGVhdmUgdGhlIHZhbHVlIGFsb25l
IGlmIHdlIGZhaWwgdGhlIEZBU1QgdGVzdAo+ID4gKHJhdGhlciB0aGFuIGNoYW5naW5nIGl0IGZy
b20gVU5LTk9XTiB0byBTTE9XKS4gVGhpcyBpc24ndCBncmVhdAo+ID4gdGhvdWdoLCBhcyBpdCBl
ZmZlY3RpdmVseSBtYWtlcyBVTktOT1dOIHN5bm9ueW1vdXMgd2l0aCBTTE9XLCBidXQgaW4gYQo+
ID4gd2F5IHdoZXJlIHVzZXJtb2RlIGNhbid0IHRlbGwgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiAi
SSB0cnVseSBkb24ndAo+ID4ga25vdyIgYW5kICJJIHRyaWVkIHRoZSBmYXN0IHRlc3QgYW5kIGl0
IGZhaWxlZCIuCj4gPgo+ID4gVGhlIGFsdGVybmF0aXZlLCBhcyBpdCBpcyBub3csIG1heSBtaXNs
YWJlbCBzb21lIGVtdWxhdGVkIHN5c3RlbXMgYXMKPiA+IHNsb3cgdW50aWwgdGhlIG5ldyBTQkkg
Y2FsbCBzaG93cyB1cC4KPgo+IE1ha2UgdGhhdCAibWlzbGFiZWwgc29tZSBlbXVsYXRlZCBzeXN0
ZW1zIGZvcmV2ZXIiLCBleGlzdGluZyBzeXN0ZW1zCj4gZG9uJ3QgbWFnaWNhbGx5IGdyb3cgc3Vw
cG9ydCBmb3IgbmV3IGV4dGVuc2lvbnMgdW5mb3J0dW5hdGVseS4KClJpZ2h0LgoKPgo+IFJlYWxp
c3RpY2FsbHkgdGhvdWdoLCBkb2VzIGl0IG1hdHRlciB0byB1c2Vyc3BhY2UgaWYgaXQgaXMgc2xv
dyBiZWNhdXNlCj4gdGhlIGhhcmR3YXJlIGlzIHNsb3csIG9yIGlmIHRoZSBlbXVsYXRpb24gaXMg
c2xvdywgc2luY2UgdGhlcmUncyBub3QKPiByZWFsbHkgYSB3YXkgZm9yIHVzZXJzcGFjZSB0byB0
ZWxsIGZyb20gdGhlIHN5c2NhbGwgYnkgaG93IG11Y2ggaXQgaXMKPiBzbG93ZXIuCj4gSXQgY2Fu
IHByb2JhYmx5IGd1ZXNzIHRoYXQgZW11bGF0aW9uIGlzIHdvcnNlLCBnaXZlbiBob3cgY3JhcCB0
aGUKPiBzcGVlZCBJIHNlZSBvbiBtcGZzIGlzLgo+Cj4gSSdkIHJhdGhlciB3ZSBkaWQgc2F5IHNs
b3csIHJhdGhlciB0aGFuIHBlb3BsZSBzdGFydCB0byBpbnRlcnByZXQKPiBVTktOT1dOIGFzIHNs
b3cuCgpJIHRoaW5rIEkgYWdyZWUuCgo+Cj4gPiBJJ20gbm90IHN1cmUgaG93IGJhZCB0aGlzIGlz
IGluCj4gPiBwcmFjdGljZS4gV2UgY291bGQgYWRkIGEgc3Vic2VxdWVudCBwZXJmb3JtYW5jZSBi
YXIgYmVsb3cgd2hpY2ggd2UKPiA+IGd1ZXNzICJlbXVsYXRlZCIuCj4KPiBOYWgsIEkgZG9uJ3Qg
cmVhbGx5IHRoaW5rIHRoYXQgdGhhdCBpcyByZXF1aXJlZC4KPgo+ID4gVGhpcyBwcm9iYWJseSBt
YXRjaGVzIHdoYXQgdXNlcm1vZGUgd2lsbCB1c2UgdGhhdAo+ID4gdmFsdWUgZm9yIGFueXdheSAo
YSBzeW5vbnltIGZvciAidmVyeSBzbG93IiksIGJ1dCBpdCdzIGJhc2ljYWxseSB0aGUKPiA+IHNh
bWUgcHJvYmxlbSB3aXRoIHJldmVyc2VkIHBvbGFyaXR5ICh3ZSBtaXNsYWJlbCBzb21lIHNsb3cg
c3lzdGVtcyBhcwo+ID4gZW11bGF0ZWQpLiBJJ20gb3BlbiB0byBzdWdnZXN0aW9ucyEKPgo+IEkg
dGhpbmsgSSBqdXN0IGFncmVlZCB3aXRoIHlvdSwgZ2l2ZSBvciB0YWtlLiBJZiBpdCBpcyBmYXN0
LCBzYXkgZmFzdC4KPiBJZiBpdCBpcyBzbG93LCB3ZSBzYXkgaXQgaXMgc2xvdy4gSWYgd2Uga25v
dyBpdCBpcyBlbXVsYXRlZCwgdGhlbiB3ZSBjYW4KPiByZXBvcnQgaXQgYmVpbmcgZW11bGF0ZWQu
IElzIGl0IHRvbyBsYXRlIHRvIHJlbW92ZSB0aGUgImhhcmR3YXJlIiBmcm9tCj4gdGhlIHN5c2Nh
bGwgZG9jdW1lbnRhdGlvbiwgSU9XIHMvc3VwcG9ydGVkIGluIGhhcmR3YXJlL3N1cHBvcnRlZC8/
Cj4KPiBQbGVhc2UgYWN0dWFsbHkgZGVzY3JpYmUgdGhlIGFzc3VtcHRpb25zL3N1YnRsZXRpZXMg
aW4gdGhlIGNvbW1pdAo+IG1lc3NhZ2UgdGhvdWdoLCBzbyB0aGF0IHRoZSByYXRpb25hbGUgZm9y
IHN0dWZmIGlzIGluIHRoZSBoaXN0b3J5IDopCgpXaWxsIGRvLiBJIHBvbmRlcmVkIGFuIGFsdGVy
bmF0aXZlIG9mIGNyZWF0aW5nIGEgImdyYXkgem9uZSIgd2hlcmUgaWYKbWlzYWxpZ25lZCB3b3Jk
cyBhbmQgYnl0ZXMgY29tZSBvdXQgY2xvc2UgdG8gZWFjaCBvdGhlciAod2hpY2ggSSBkb24ndApl
eHBlY3QgdGhlbSB0byksIHdlIGxlYXZlIHRoZSBzZXR0aW5nIG9mIFVOS05PV04gYWxvbmUuIEJ1
dCBJJ20gbm90CnN1cmUgdGhpcyByZWFsbHkgc29sdmVzIGFueXRoaW5nLCBpdCBqdXN0IG1vdmVz
IHRoZSAid2FmZmxlIHBvaW50Igphcm91bmQsIHNvIEkgY291bGRuJ3QgY29udmluY2UgbXlzZWxm
IGl0IHdhcyB2YWx1YWJsZS4KLUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
