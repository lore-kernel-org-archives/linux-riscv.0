Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2309C83F17
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PaHrHyaw/40rp+9BaA0YKybWZCA21CpSJtZc3xK52c=; b=aPKSIea6nLZ4fU
	uvTofgpJwPJFdg7/OtC2yCzD8nudS8BE1Lz4WcF2AnFiTV9/afsMV4Tp4Vb4PPepWw3UQN8AAQ7mE
	SQxX7LftJGPVwfP+gyyWPERQeG42lTvC4SiyvhdvmzWVVOHiFFmZNcyr5E5YXi4CODZgWYk4MJ3B0
	ojFezCYPw77KOIeCpRPB7ure8XDmRbDEscOmWj7TYx0uKAYJbNjDo5s4lKMOYgwfXjr+KWUVD3xfb
	05bPS6zgCBiOgA6xtkEkLBTGHRscCwcYgcbSy0fVjlL6FyycJ8nPvXOwSwze0IWjpnUgQd1xFJGEc
	zCIcAhDZ4mrZbhffHgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZoEN-006Zer-2S;
	Sat, 26 Aug 2023 08:01:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZoEK-006Zdk-28
	for linux-riscv@lists.infradead.org;
	Sat, 26 Aug 2023 08:01:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fef56f7222so15058095e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 26 Aug 2023 01:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693036869; x=1693641669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8zeI6AUjlRlAi0IA4zOJ4FhSx5m+2z7V0zbKgXgsP9A=;
        b=R57hJHNjTKj/VEVKSt8dYUPyyXeow2ml98lOSYDxkU7RHCFR5yDkFFmWRViV5/GByr
         uDOekwb5fbx+0Gti3DO6w1UJiFJ5nf0b7H+Us29Odze8jV4uXk1OWUA+xhfazzeyRyv6
         Zaix3hDh8kwgFoEfVJtJBFXkG9/YfBvOf15xqjo8d+bjbn3j8+21pnDXBj/2YGyXYgyw
         4z1y3pHgYUTmcPtOi3ETJr3T4XefMDk9UlEXz92H7Htvb2ZYPt3zCifw/KFuuJGuhKX0
         L45CD620XAp0ovJ3thFCrG3p6Hms29c8HJG6hCtuvium7AAbq437AVeyrtCxl18AEnV8
         IFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693036869; x=1693641669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zeI6AUjlRlAi0IA4zOJ4FhSx5m+2z7V0zbKgXgsP9A=;
        b=dyCeeVC3xH5RRIrpsu68EAUHzjZ6f4rJJikFJgHEcrEjmRioZH9rkRtGFQ3mUsZ9Ax
         52JTKFH9W4ZoxDqsvwSC3kkuiZ/3GepgjetCMyU4U5WTBnEWwPJXJqhU9oMdVQR5ax4U
         TbPSvkx/d6ZnDJC3OdvnG8DpKQOpM8eVktr+ro3ES8trX7LWXp+blhgFP1H84/GCMfD0
         rwKIJRJ8kgO1QH+ijZaVCOMSiPC9G0IVOnBXKriP4fGAIzzPBcvqdjlLkZqUMZaur6YP
         zRXdKPGGP92u4PxWb/DAEwHeScGP27SPazhILFtVwAwzR38TMwfuv+GoS9vhU0Ndiuue
         QZMA==
X-Gm-Message-State: AOJu0YwLOglPP/cOCbGjf4CsbLSbcDm6vluoeOtMuFx9nSsIUEwVqnjK
	qsO3dburNU7S7H1IXQhzlxdPDA==
X-Google-Smtp-Source: AGHT+IFip3zr5PD+wLFjohJxk2E8ZxQQ84TpALHTFZrixS+eOIyqK8L89Dze85NSTr4EcwqXulYF6A==
X-Received: by 2002:a7b:c413:0:b0:3ff:ca80:eda3 with SMTP id k19-20020a7bc413000000b003ffca80eda3mr7191670wmi.10.1693036868537;
        Sat, 26 Aug 2023 01:01:08 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b003fff96bb62csm4253440wmf.16.2023.08.26.01.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 01:01:07 -0700 (PDT)
Date: Sat, 26 Aug 2023 10:01:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230826-3869468d499caf2850681d08@orel>
References: <20230711201831.2695097-1-evan@rivosinc.com>
 <20230824-factual-jawed-2dddd2cf2bdd@wendy>
 <CALs-Hss51fQE1yxe1Y1T86X+OfjPaAd386vosQ8gzRm=Njm1gw@mail.gmail.com>
 <20230824-exploit-spectacle-ecedd91e9075@spud>
 <CALs-HssqaOjvUOdBVn=oN+uzkkmjguys2UttTYgdcqJwJB0HnQ@mail.gmail.com>
 <20230825-374a82446ed3eea02fcb41e6@orel>
 <CALs-HstfA29DDrmVemP6bZe+kON9JDKYR3p132gG_WefA6d7eQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HstfA29DDrmVemP6bZe+kON9JDKYR3p132gG_WefA6d7eQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_010112_698401_F0D00A6D 
X-CRM114-Status: GOOD (  51.00  )
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

T24gRnJpLCBBdWcgMjUsIDIwMjMgYXQgMDM6NTE6MjhQTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBGcmksIEF1ZyAyNSwgMjAyMyBhdCAxOjE24oCvQU0gQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBBdWcgMjQsIDIwMjMg
YXQgMDM6MDY6NTNQTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+ID4gT24gVGh1LCBBdWcg
MjQsIDIwMjMgYXQgMTA6MjnigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4gLi4uCj4gPiA+ID4gRG8geW91IHdhbnQgdG8gaGF2ZSB0aGlzIG5ldyB0aGluZyBp
biBjcHVpbmZvIHRlbGwgdGhlIHVzZXIgInRoaXMgaGFydAo+ID4gPiA+IGhhcyB4eXogZXh0ZW5z
aW9ucyB0aGF0IGFyZSBzdXBwb3J0ZWQgYnkgYSBrZXJuZWwsIGJ1dCBtYXliZSBub3QgdGhpcwo+
ID4gPiA+IGtlcm5lbCIgb3IgdG8gdGVsbCB0aGUgdXNlciAidGhpcyBoYXJ0IGhhcyB4eXogZXh0
ZW5zaW9ucyB0aGF0IGFyZQo+ID4gPiA+IHN1cHBvcnRlZCBieSB0aGlzIGtlcm5lbCI/IFlvdXIg
dGV4dCBhYm92ZSBzYXlzICJ1bmRlcnN0b29kIGJ5IHRoZQo+ID4gPiA+IGtlcm5lbCIsIGJ1dCBJ
IHRoaW5rIHRoYXQncyBhIHBvb3IgZGVmaW5pdGlvbiB0aGF0IG5lZWRzIHRvIGJlIGltcHJvdmVk
Cj4gPiA+ID4gdG8gc3BlbGwgb3V0IGV4YWN0bHkgd2hhdCB5b3UgbWVhbi4gSU9XIGRvZXMgInVu
ZGVyc3Rvb2QiIG1lYW4gdGhlCj4gPiA+ID4ga2VybmVsIHdpbGwgcGFyc2UgdGhlbSBpbnRvIGEg
c3RydWN0dXJlLCBvciBkb2VzIGl0IG1lYW4gInllcyB5b3UgY2FuCj4gPiA+ID4gdXNlIHRoaXMg
ZXh0ZW5zaW9uIG9uIHRoaXMgcGFydGljdWxhciBoYXJ0Ii4KPiA+ID4KPiA+ID4gSSdtIGltYWdp
bmluZyAvcHJvYy9jcHVpbmZvIGJlaW5nIGNsb3NlciB0byAidGhlIENQVSBoYXMgaXQgYW5kIHRo
ZQo+ID4gPiBrZXJuZWwgYXQgbGVhc3QgdmFndWVseSB1bmRlcnN0YW5kcyBpdCwgYnV0IG1heSBu
b3QgaGF2ZSBmdWxsIHN1cHBvcnQKPiA+ID4gZm9yIGl0IGVuYWJsZWQiLiBJJ20gYXNzdW1pbmcg
L3Byb2MvY3B1aW5mbyBpcyBtb3N0bHkgdXNlZCBieSAxKQo+ID4gPiBodW1hbnMgd2FudGluZyB0
byBrbm93IGlmIHRoZXkgaGF2ZSBoYXJkd2FyZSBzdXBwb3J0IGZvciBhIGZlYXR1cmUsCj4gPiA+
IGFuZCAyKSBhZG1pbmlzdHJhdG9ycyBjb2xsZWN0aW5nIHRlbGVtZXRyeSB0byBtYW5hZ2UgZmxl
ZXRzIChpZSBkbyBJCj4gPiA+IGhhdmUgYW55IGhhcmR3YXJlIGRlcGxveWVkIHRoYXQgc3VwcG9y
dHMgWCkuCj4gPgo+ID4gSXMgKDIpIGEgc3BlY2lhbCBjYXNlIG9mICgxKT8gKEkgd2FudCB0byBt
YWtlIHN1cmUgSSB1bmRlcnN0YW5kIGFsbCB0aGUKPiA+IGNhc2VzLikKPiAKPiBNb3JlIG9yIGxl
c3MsIHllcy4gSW4gYnVja2V0IHR3byBhcmUgYWxzbyBmb2xrcyB3b25kZXJpbmcgdGhpbmdzIGxp
a2UKPiAiYXJlIGFsbCB0aGVzZSBjcmFzaCByZXBvcnRzIEknbSBnZXR0aW5nIHNwZWNpZmljIHRv
IG1hY2hpbmVzIHdpdGggWCIuCj4gCj4gPgo+ID4gPiBQcm9ncmFtbWVycyBsb29raW5nIHRvCj4g
PiA+IHNlZSAiaXMgdGhlIGtlcm5lbCBzdXBwb3J0IGZvciB0aGlzIGZlYXR1cmUgcmVhZHkgcmln
aHQgbm93IiB3b3VsZAo+ID4gPiBpZGVhbGx5IG5vdCBiZSBwYXJzaW5nIC9wcm9jL2NwdWluZm8g
dGV4dCwgYXMgbW9yZSBkaXJlY3QgbWVjaGFuaXNtcwo+ID4gPiBsaWtlIHNwZWNpZmljIGh3cHJv
YmUgYml0cyBmb3IgImFtIEkgZnVsbHkgcmVhZHkgdG8gZ28iIHdvdWxkIGJlCj4gPiA+IGVhc2ll
ciB0byB3b3JrIHdpdGguIEZlZWwgZnJlZSB0byB5ZWxsIGF0IG1lIGlmIHRoaXMgb3ZlcmFsbCB2
aXNpb24KPiA+ID4gc2VlbXMgZmxhd2VkLgo+ID4gPgo+ID4gPiBJIHRyaWVkIHRvIGxvb2sgdG8g
c2VlIGlmIHRoZXJlIHdhcyBjb25zZW5zdXMgYW1vbmcgdGhlIG90aGVyCj4gPiA+IGFyY2hpdGVj
dHVyZXMuIEFhcmNoNjQgc2VlbXMgdG8gZ28gd2l0aCAic3VwcG9ydGVkIGFuZCBmdWxseSBlbmFi
bGVkIiwKPiA+ID4gYXMgdGhlaXIgY3B1X2hhc19mZWF0dXJlKCkgZGlyZWN0bHkgdGVzdHMgZWxm
X2h3Y2FwLCBhbmQgZWxlbWVudHMgaW4KPiA+ID4gYXJtNjRfZWxmX2h3Y2Fwc1tdIGFyZSBLY29u
ZmlnIGdhdGVkLiBYODYgaXMgY29tcGxpY2F0ZWQsIGJ1dCBJSVJDIGlzCj4gPiA+IG1vcmUgYWxv
bmcgdGhlIGxpbmVzIG9mICJoYXJkd2FyZSBoYXMgaXQiLiBUaGV5IGhhdmUgdHdvIG1hY3JvcywK
PiA+ID4gY3B1X2hhcygpIGZvciAicmF3IGNhcGFiaWxpdHkiIGFuZCBjcHVfZmVhdHVyZV9lbmFi
bGVkKCkgZm9yICJrZXJuZWwKPiA+ID4gY2FuIGRvIGl0IHRvbyIsIGFuZCB0aGV5IHVzZSBjcHVf
aGFzKCkgZm9yIC9wcm9jL2NwdWluZm8gZmxhZ3MuCj4gPiA+Cj4gPgo+ID4gSSdkIGxlYW4gbW9y
ZSB0b3dhcmRzIHRoZSB3YXkgQUFyY2g2NCBnb2VzLCBiZWNhdXNlLCB1bmxlc3MgL3Byb2MvY3B1
aW5mbwo+ID4gaXMganVzdCBhIGJsaW5kIHJlZ3VyZ2l0YXRpb24gb2YgYW4gaXNhIHN0cmluZyBm
cm9tIERUIC8gQUNQSSwgdGhlbiB0aGUKPiA+IGtlcm5lbCBtdXN0IGF0IGxlYXN0IGtub3cgc29t
ZXRoaW5nIGFib3V0IGl0LiBBZHZlcnRpc2luZyBhIGZlYXR1cmUgd2hpY2gKPiA+IGlzIGtub3du
LCBidXQgYWxzbyBrbm93biBub3QgdG8gd29yaywgc2VlbXMgb2RkIHRvIG1lLiBTbyBteSB2b3Rl
IGlzIHRoYXQKPiA+IG9ubHkgZmVhdHVyZXMgd2hpY2ggYXJlIHByZXNlbnQgYW5kIGVuYWJsZWQg
aW4gdGhlIGtlcm5lbCBvciBwcmVzZW50IGFuZAo+ID4gbm90IG5lY2Vzc2FyeSB0byBiZSBlbmFi
bGVkIGluIHRoZSBrZXJuZWwgaW4gb3JkZXIgZm9yIHVzZXJzcGFjZSBvcgo+ID4gdmlydHVhbCBt
YWNoaW5lcyB0byB1c2UgYmUgYWR2ZXJ0aXNlZCBpbiAvcHJvYy9jcHVpbmZvLgo+ID4KPiA+IFdl
IHN0aWxsIGhhdmUgU01CSU9TIChkbWlkZWNvZGUpIHRvIGJsaW5kbHkgZHVtcCB3aGF0IHRoZSBo
YXJkd2FyZQo+ID4gc3VwcG9ydHMgZm9yIGNhc2VzICgxKSBhbmQgKDIpIGFib3ZlLgo+IAo+IFll
YWgsIHRoZXJlJ3MgYW4gYXJndW1lbnQgdG8gYmUgbWFkZSBmb3IgdGhhdC4gTXkgd29ycnkgaXMg
aXQncyBhCj4gZGlmZmljdWx0IGxpbmUgdG8gaG9sZC4gVGhlIGJhciB5b3UncmUgcmVhbGx5IHRy
eWluZyB0byBkZXNjcmliZSAob3IKPiBhdCBsZWFzdCB3aGF0IHBlb3BsZSBtaWdodCB0YWtlIGF3
YXkgZnJvbSBpdCkgaXMgImlmIGl0J3MgbGlzdGVkIGhlcmUKPiB0aGVuIGl0J3MgZnVsbHkgcmVh
ZHkgdG8gYmUgdXNlZCBpbiB1c2Vyc3BhY2UiLiBCdXQgdGhlbiB0aGluZ3MgZ2V0Cj4gc3F1aXNo
eSB3aGVuIHRoZXJlIGFyZSBhZGRpdGlvbmFsIHdheXMgdG8gY29udHJvbCB0aGUgdXNlIG9mIHRo
ZQo+IGZlYXR1cmUgKHByY3RscygpIGluIGluaXQgdG8gdHVybiBpdCBvbiwgdXNlcm1vZGUgcG9s
aWN5IHRvIHR1cm4gaXQKPiBvZmYsIHNlY3VyaXR5IGRvb2RhZHMgdGhhdCBkaXNhYmxlIGl0LCBl
dGMpLiBJJ20gYXNzdW1pbmcgbm9ib2R5IHdhbnRzCj4gYSB2ZXJzaW9uIG9mIC9wcm9jL2NwdWlu
Zm8gdGhhdCBjaGFuZ2VzIGRlcGVuZGluZyBvbiB3aGljaCBwcm9jZXNzIGlzCj4gYXNraW5nLiBT
byB0aGVuIHRoZSBsaW5lIHdvdWxkIGhhdmUgdG8gYmUgbW9yZSBjYXJlZnVsbHkgZGVzY3JpYmVk
IGFzCj4gIndlbGwsIHRoZSBoYXJkd2FyZSBjYW4gZG8gaXQsIGFuZCB0aGUga2VybmVsIENPVUxE
IGRvIGl0IHVuZGVyIHNvbWUKPiBjaXJjdW1zdGFuY2VzLCBidXQgWU1NViIsIHdoaWNoIGVuZHMg
dXAgZmFsbGluZyBzb21ld2hhdCBzaG9ydCBvZiB0aGUKPiBvcmlnaW5hbCBnb2FsLiBJbiBteSBt
aW5kIGtlZXBpbmcgL3Byb2MvY3B1aW5mbyBhcyBjbG9zZSB0byAiaGVyZSdzCj4gd2hhdCB0aGUg
aGFyZHdhcmUgY2FuIGRvIiBzZWVtcyBsaWtlIGEgbW9yZSBkZWZlbnNpYmxlIHBvc2l0aW9uLgo+
IC1FdmFuCgpJIGFncmVlIHdpdGggdGhhdC4gSSB3YXMgYWN0dWFsbHkgZXZlbiB0cnlpbmcgdG8g
c2F5IHRoZSBzYW1lIHRoaW5nLApidXQgb25seSBieSBicmluZ2luZyB1cCB2aXJ0dWFsIG1hY2hp
bmVzLiBPbmNlIHdlIGRlY2lkZSB3ZSdsbCBleHBvc2UKZXh0ZW5zaW9ucyB0byBWTXMsIHdoZXRo
ZXIgb3Igbm90IHRoZSBob3N0IGtlcm5lbCBlbmFibGVzIHRoZW0sIHRoZW4Kbm9uZSBvZiB0aGUg
b3RoZXIgaG9zdCBrZXJuZWwgY29uZmlndXJhdGlvbnMgbWF0dGVyIHdpdGggcmVzcGVjdCB0bwph
ZHZlcnRpc2luZyB0aGUgZmVhdHVyZSwgc2luY2UgdGhlIGd1ZXN0IGtlcm5lbCBtYXkgaGF2ZSBh
IGNvbXBsZXRlbHkKZGlmZmVyZW50IHNldCBvZiBjb25maWd1cmF0aW9ucy4KClNvIEkgdGhpbmsg
d2Ugc2hvdWxkIG9ubHkgYmUgZmlsdGVyaW5nIG91dCBleHRlbnNpb25zIHRoYXQgYXJlIGRpc2Fi
bGVkCmJlY2F1c2UgdGhleSdyZSBicm9rZW4gKGhhdmUgYSBkZXRlY3RlZCBlcnJhdHVtKSwgaGF2
ZSBiZWVuICJoaWRkZW4iCihoYXZlIGEga2VybmVsIGNvbW1hbmQgbGluZSBhbGxvd2luZyB0aGVt
IHRvIGJlIHRyZWF0ZWQgYXMgaWYgbm90CnByZXNlbnQpLCBvciBjYW5ub3QgYmUgdXNlZCBhdCBh
bGwgZHVlIHRvIG1pc3NpbmcgYWNjb21wYW55aW5nIGhhcmR3YXJlCmRlc2NyaXB0aW9ucyAoc3Vj
aCBhcyBibG9jayBzaXplIGluZm8gZm9yIENCTyBleHRlbnNpb25zKS4gSW4gYWxsIGNhc2VzLApJ
IHByZXN1bWUgd2UnZCB3aXJlIGNoZWNrcyB1cCBpbiByaXNjdl9pc2FfZXh0ZW5zaW9uX2NoZWNr
KCkgYW5kIG5vCmNoZWNrcyB3b3VsZCBiZSBnYXRlZCBvbiBLY29uZmlncyBvciBhbnl0aGluZyBl
bHNlLiBBbmQsIHNpbmNlCi9wcm9jL2NwdWluZm8gZ2V0cyBpdHMgbGlzdCBmcm9tIHRoZSBiaXRt
YXAgdGhhdCdzIGFscmVhZHkgZmlsdGVyZWQgYnkKcmlzY3ZfaXNhX2V4dGVuc2lvbl9jaGVjaygp
LCB0aGVuLCBsb25nIHN0b3J5IHNob3J0LCB3ZSdyZSBnb29kIHRvIGdvIDotKQoKQnV0IG1heWJl
IHdlIGNhbiB0cnkgdG8gc3BlbGwgdGhhdCBwb2xpY3kgb3V0IGEgYml0IG1vcmUgaW4KRG9jdW1l
bnRhdGlvbi9yaXNjdi91YWJpLnJzdC4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
