Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C44CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 08:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJ42DK+vEEGLKw1y74goBz1+kLvLgNPwA2c+LX+NhCw=; b=pX2v0qh8uLYA4Y
	i0MBsQQkNsE9Ua3uk0Ixag7hCGY2gznzFdIMgMfJaT6In4rqaxBT8YHvIlLGgoe7RcU+z5rGQ5z0J
	o7XrwCgLwKDRcbR0ulujeEW4tdzxkFPWQwP9LWhYbf2VxUzaGgJR10ElfngR9mLLBE+xFUImPsa5O
	GJfSI3D5ci9cJcVbedWs7JqnnfMvx3fqT5uhiwHm5IwMau/wT78bzZMTAuHEAWU05ovfG1y5/tosz
	8e1gogj/sp+sbvyGrD8zhjXUbMrnHGfBuRbfenHCOhTxQJMv9EulMDSfdjCNcvwd8YENaCpyR+QvZ
	xtp9qIVpXHo+d03Pdygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOWb-00GjVl-14;
	Thu, 19 Oct 2023 08:37:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOWY-00GjTv-07
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 08:36:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32d80ae19f8so5953783f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 01:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697704612; x=1698309412; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6mCzcB/GDUd2unRrKZuVCskrDazBi/mw/PRT1rbkWg=;
        b=LRx1IdkH+vd3fWX/riBtLPcy/Qv7jMCwcxrN3V7ZP06q0ecn1dUf+moaQVDFsCI6MP
         PQ5iN/tT+eu/jp70D3AEy4ixAEz0qFNZ66MjOii7EB08yac5SR4EV5YuLPB1reezDYA+
         QcxPRnMnGgJDuiGLrEi+ocREDGv7hiwVfxi6BOAWxJWtDADPeTqi5nMViy3NTy4bGqaA
         wH64eaZsGonlfmjCSmUeWkKUp9007GL+NJYOtr+iI5YvM+Lt/GDJ+LVjuePLnWLusg2n
         uX2JfAcdvaNr+PnlJL3uQVpEG2WJWWeQnBIJLytDE1HKFLZkye0XJn1Wf3A0tSBJaT2A
         m4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697704612; x=1698309412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6mCzcB/GDUd2unRrKZuVCskrDazBi/mw/PRT1rbkWg=;
        b=VQnGtu646GxRLFDRQFDBuG0dp5OIOly/IKyhUAgRxU5K/FS4d7OOcyNGULzMzo25Ny
         ZRnI75VBJnIq0bPxFCj5+BOB0UlH8MXpnsrKFdoEnQynhi4kZ6gURa1IRXiKKnpftahC
         kTUw5R4LJA+5UQr3Bvu5NRtpa041cDAEP/N6v5l/EIR4q2iH1XJPGZ/RQA/AdcnG5Xbm
         lCdRivFdR7z4NeTNE+RPq0KTGf7LRQyxEMQpLjdLUAuMl2dIgvW5fi2YhUeMRUyLsuNV
         m2VufDUHIKnkk6rI5t8BXmpy5r8zN/ikEYRYQkjh3yhPPLxXQN8SBbaXNRN90DSSbjdR
         40hg==
X-Gm-Message-State: AOJu0Yyx1y+OQZDsAg9o2d9BTcUWNAWEWKBVpdoEy0sP9il16FrDv0ZS
	+ZcbYXi1T7oIn1mRRJG3gaKpRw==
X-Google-Smtp-Source: AGHT+IGqmirZ2VGNjnEscMfJ1GhzumfwG8a4NcJ2nkTX4GXqEQxECBxkLcAH5vJmzlPUzhnWs/Hcmw==
X-Received: by 2002:a5d:5348:0:b0:32d:a221:446 with SMTP id t8-20020a5d5348000000b0032da2210446mr807091wrv.59.1697704612437;
        Thu, 19 Oct 2023 01:36:52 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d63ca000000b0032dab20e773sm3900777wrw.69.2023.10.19.01.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:36:51 -0700 (PDT)
Date: Thu, 19 Oct 2023 10:36:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com, conor.dooley@microchip.com
Subject: Re: [PATCH v1 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20231019-7499e3153836cb6c6353e578@orel>
References: <20231012072148.7010-3-ajones@ventanamicro.com>
 <20231012072148.7010-4-ajones@ventanamicro.com>
 <20231012-powdery-demeanor-4d8dde576f24@spud>
 <20231012-pulverize-founding-f459336028a2@spud>
 <20231012-0cb15beef3128da9f3bd3299@orel>
 <CAK9=C2VFi+jtNGo+dueXcG8iRW=r1z-c1P_8SRGAxaByW=8tuA@mail.gmail.com>
 <20231012-b5b2d068ef07fd574207cc15@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012-b5b2d068ef07fd574207cc15@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_013658_074207_06951D7F 
X-CRM114-Status: GOOD (  42.96  )
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

T24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMDc6MjU6MTFQTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdy
b3RlOgo+IE9uIFRodSwgT2N0IDEyLCAyMDIzIGF0IDEwOjA5OjQ0UE0gKzA1MzAsIEFudXAgUGF0
ZWwgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAxMiwgMjAyMyBhdCA5OjMx4oCvUE0gQW5kcmV3IEpv
bmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwg
T2N0IDEyLCAyMDIzIGF0IDAyOjMyOjQ2UE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+
ID4gPiBPbiBUaHUsIE9jdCAxMiwgMjAyMyBhdCAwMjozMDowMlBNICswMTAwLCBDb25vciBEb29s
ZXkgd3JvdGU6Cj4gPiA+ID4gPiBZbywKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBUaHUsIE9jdCAx
MiwgMjAyMyBhdCAwOToyMTo1MEFNICswMjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiA+ID4g
PiA+IFdoZW4gdGhlIFNVU1AgU0JJIGV4dGVuc2lvbiBpcyBwcmVzZW50IGl0IGltcGxpZXMgdGhh
dCB0aGUgc3RhbmRhcmQKPiA+ID4gPiA+ID4gInN1c3BlbmQgdG8gUkFNIiB0eXBlIGlzIGF2YWls
YWJsZS4gV2lyZSBpdCB1cCB0byB0aGUgZ2VuZXJpYwo+ID4gPiA+ID4gPiBwbGF0Zm9ybSBzdXNw
ZW5kIHN1cHBvcnQsIGFsc28gYXBwbHlpbmcgdGhlIGFscmVhZHkgcHJlc2VudCBzdXBwb3J0Cj4g
PiA+ID4gPiA+IGZvciBub24tcmV0ZW50aXZlIENQVSBzdXNwZW5kLiBXaGVuIHRoZSBrZXJuZWwg
aXMgYnVpbHQgd2l0aAo+ID4gPiA+ID4gPiBDT05GSUdfU1VTUEVORCwgb25lIGNhbiBkbyAnZWNo
byBtZW0gPiAvc3lzL3Bvd2VyL3N0YXRlJyB0byBzdXNwZW5kLgo+ID4gPiA+ID4gPiBSZXN1bXB0
aW9uIHdpbGwgb2NjdXIgd2hlbiBhIHBsYXRmb3JtLXNwZWNpZmljIHdha2UtdXAgZXZlbnQgYXJy
aXZlcy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVz
IDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICtzdGF0aWMg
aW50IF9faW5pdCBzYmlfc3lzdGVtX3N1c3BlbmRfaW5pdCh2b2lkKQo+ID4gPiA+ID4gPiArewo+
ID4gPiA+ID4gPiArIGlmICghc2JpX3NwZWNfaXNfMF8xKCkgJiYgc2JpX3Byb2JlX2V4dGVuc2lv
bihTQklfRVhUX1NVU1ApID4gMCkgewo+ID4gPiA+ID4KPiA+ID4gPiA+IFJhbmRvbSB0aG91Z2h0
IEkgaGFkIHJlYWRpbmcgdGhpcywgd2FzIHRoYXQgaXQnbGwgYmUgcG9zc2libGUgdG8gaGF2ZSBh
Cj4gPiA+ID4gPiBmaXJtd2FyZSB0aGF0IGltcGxlbWVudHMgU0JJIDwgMi4wIHRoYXQgcHJvdmlk
ZXMgdGhlIFNVU1AgZXh0ZW5zaW9uLgo+ID4gPiA+ID4gRldJVywgSSBkb24ndCB0aGluayB0aGF0
IHRoYXQgaXMgcHJvYmxlbWF0aWMsIGJ1dCBtYXliZSBJIGFtIG1pc3NpbmcKPiA+ID4gPiA+IHNv
bWV0aGluZyB0aGF0IHdvdWxkIG1ha2UgaXQgc28uCj4gPiA+ID4KPiA+ID4gPiBIbW0sIG5leHQg
cGF0Y2ggSSBsb29rIGF0IGlzIGZyb20gQW51cCdzIGRlYnVnIGNvbnNvbGUgc2VyaWVzLCBhbmQg
aGUKPiA+ID4gPiBkb2VzIGNoZWNrIHRoYXQgdGhlIFNCSSBpbXBsZW1lbnRhdGlvbiBpcyBhdCBs
ZWFzdCB2ZXJzaW9uIDIuMCBiZWZvcmUKPiA+ID4gPiBwcm9iaW5nIGZvciB0aGUgZXh0ZW5zaW9u
LiBXZSBzaG91bGQgcHJvYmFibHkgaGF2ZSB0aGUgc2FtZSBwb2xpY3kKPiA+ID4gPiBldmVyeXdo
ZXJlLgo+ID4gPgo+ID4gPiBZZWFoLCB0aGUgbWFpbiByZWFzb24gSSB3cm90ZSBpbiB0aGUgb3Ro
ZXIgcmVzcG9uc2UgdGhhdCBJJ2QgcHJlZmVyIG5vdAo+ID4gPiB0byBhbHdheXMgY2hlY2sgdmVy
c2lvbiB3aGVuIHByb2JpbmcgaXMgYmVjYXVzZSBpbiBtb3N0IChJIHRoaW5rIGFsbAo+ID4gPiBl
eGNlcHQgUE1VKSBjYXNlcyBpdCB3b3VsZCBvbmx5IHJlZHVjZSB0aGUgcGxhdGZvcm1zIHdoZXJl
IHRoZSBleHRlbnNpb24KPiA+ID4gY2FuIGJlIHVzZWQsIGJ1dCB3aXRob3V0IGFueSByZWFzb24g
dG8gZG8gc28uIEZvciBleGFtcGxlLCByaWdodCBub3cgUUVNVQo+ID4gPiBidW5kbGVzIGFuIE9w
ZW5TQkkgdjEuMy4xIGJpbmFyeSBhbmQgdGhhdCB2ZXJzaW9uIHN1cHBvcnRzIGJvdGggU1VTUCBh
bmQKPiA+ID4gREJDTiwgYnV0LCBpZiB3ZSB3ZXJlIHRvIGFkZCBTQkkgMi4wIGNoZWNrcyBpbiBM
aW51eCBmb3IgdGhvc2UgZXh0ZW5zaW9ucywKPiA+ID4gdGhlbiB1c2VycyB3aWxsIG5lZWQgdG8g
dXBkYXRlIHRoZWlyIFNCSSBpbXBsZW1lbnRhdGlvbnMgaW4gb3JkZXIgdG8gdXNlCj4gPiA+IHRo
ZW0uIFdoaWxlIHJlcXVpcmluZyB1c2VycyB0byB1cGRhdGUgdGhlaXIgU0JJIGltcGxlbWVudGF0
aW9ucyBtYWtlcwo+ID4gPiBzZW5zZSBmb3IgbmV3IGZ1bmN0aW9uYWxpdHkgb3IgZml4ZXMsIGl0
IHNlZW1zIGxpa2UgYSBsb3QgdG8gYXNrIGZvciB0aGVtCj4gPiA+IHRvIGp1c3QgZ2V0IGEgYmln
Z2VyIG51bWJlciBpbiB0aGVpciB2ZXJzaW9uIGNoZWNrLgo+ID4gPgo+ID4gPiAoQW5kIHRoZW4g
dGhlcmUncyBkb3duc3RyZWFtIFNCSSBpbXBsZW1lbnRhdGlvbnMgd2hpY2ggbWF5IGVuZCB1cCBj
aGVycnkKPiA+ID4gcGlja2luZyBleHRlbnNpb25zLCBzbyB0aGVpciB2ZXJzaW9uIG51bWJlcnMg
d291bGQgYmUgaGFyZCB0byBkZWZpbmUuKQo+ID4gPgo+ID4gPiBTbyBteSB2b3RlIGZvciBMaW51
eCBwb2xpY3kgd291bGQgYmUgdG8gb25seSBkbyB2ZXJzaW9uIGNoZWNrcyB3aGVuCj4gPiA+IG5l
Y2Vzc2FyeS4gQW5kIG15IHByZWZlcmVuY2UgZm9yIFNCSSB3b3VsZCBiZSB0byB0cnkgYW5kIGF2
b2lkIHNwZWNpZnlpbmcKPiA+ID4gZXh0ZW5zaW9ucyB3aGljaCByZXF1aXJlIGNsaWVudHMgdG8g
Y2hlY2sgdmVyc2lvbnMuCj4gPiAKPiA+IEluIGFkZGl0aW9uIHRvIFNCSSBQTVUsIGV2ZW4gU0JJ
IFNUQSBhbmQgU0JJIE5BQ0wgcmVxdWlyZXMgc3BlYyB2ZXJzaW9uCj4gPiBjaGVjayBiZWNhdXNl
IHRoZXNlIG5ldyBTQkkgZXh0ZW5zaW9ucyB1c2UgU0JJX0VSUl9OT19TSE1FTQo+ID4gZXJyb3Ig
Y29kZSB3aGljaCBpcyBub3QgYXZhaWxhYmxlIGluIFNCSSB2MS4wIChvciBsb3dlcikuCj4gCj4g
QnV0IHdoZW4gdGhvc2UgZXh0ZW5zaW9ucyBhcmUgcHJlc2VudCwgdGhleSBtdXN0IGltcGxlbWVu
dCB0aGVpcgo+IHNwZWNpZmljYXRpb25zLCB3aGljaCBtZWFucyBTQklfRVJSX05PX1NITUVNIG11
c3QgYWxzbyBiZSBwcmVzZW50Lgo+IEZyb20gYSBjbGllbnQncyBwZXJzcGVjdGl2ZSBnZXR0aW5n
IGFuIGFmZmlybWF0aXZlIHRoYXQgdGhlIGV4dGVuc2lvbiBpcwo+IHByZXNlbnQgaXMgZW5vdWdo
LiBBbHNvIGNoZWNraW5nIHRoZSBTQkkgdmVyc2lvbiBpcyBiYXNpY2FsbHkgdHVybmluZyB0aGUK
PiBjbGllbnQgaW50byBhbiBTQkkgaW1wbGVtZW50YXRpb24gc2FuaXR5IGNoZWNrZXIuCj4gCj4g
PiAKPiA+IE15IHJlY29tbWVuZGF0aW9uIGlzIHRoYXQgU0JJIGltcGxlbWVudGF0aW9uIHNob3Vs
ZCBjb21wbHkgd2l0aCB0aGUKPiA+IG1pbmltdW0gU0JJIHNwZWMgdmVyc2lvbiByZXF1aXJlZCBi
eSB0aGUgU0JJIGV4dGVuc2lvbnMgd2hpY2ggaXQKPiA+IGltcGxlbWVudHMuCj4gPgo+IAo+IEkg
YWdyZWUsIGJ1dCBTQkkgaW1wbGVtZW50YXRpb24gdmVyc2lvbnMgZG9uJ3QgZ2V0IGJ1bXBlZCB1
bnRpbCBhZnRlcgo+IHNwZWMgZnJlZXplcywgZXZlbiB0aG91Z2ggdGhleSBpbmNvcnBvcmF0ZSBl
dmVyeXRoaW5nIG5lZWRlZCBmb3IgdGhlCj4gbmV3IGV4dGVuc2lvbnMgYW5kIHRoZSBleHRlbnNp
b25zIHRoZW1zZWx2ZXMuCj4gCj4gTGludXggY2FuIGNlcnRhaW5seSBjaG9vc2UgdG8gYmUgc3Ry
aWN0IGFib3V0IHRoZSBTQkkgaW1wbGVtZW50YXRpb25zCj4gZnJvbSB3aGljaCBpdCBlbmFibGVz
IGV4dGVuc2lvbnMsIGJ1dCBJJ20gc3RpbGwgbm90IHN1cmUgaXQncyBuZWNlc3NhcnkuCj4KCkkg
d2FzIGp1c3QgcmV2aWV3aW5nIHRoZSBEQkNOIHNlcmllcyBhbmQgd2FzIGFib3V0IHRvIHJhaXNl
IG15IHRob3VnaHRzCnRoZXJlIGFnYWluIGFib3V0IG5vdCBiZWluZyBzbyBzdHJpY3QgYWJvdXQg
U0JJIGltcGxlbWVudGF0aW9uIHZlcnNpb25zLApidXQgdGhlbiBJIHRob3VnaHQgc29tZSBtb3Jl
IGFib3V0IGl0LiBJIGd1ZXNzIHdlIHNob3VsZCBiZSBzdHJpY3QgYWJvdXQKdGhlIHZlcnNpb24g
c2luY2UgaXQncyBvdGhlcndpc2Ugbm90IHBvc3NpYmxlIHRvIGFueSBjb25maWRlbmNlIHRoYXQg
dGhlCmV4dGVuc2lvbiBhZHZlcnRpc2VkIGlzIHRoZSBleHRlbnNpb24gZGVzY3JpYmVkIGluIHRo
ZSBmcm96ZW4vcmF0aWZpZWQKdmVyc2lvbiBvZiB0aGUgc3BlYyAodGhlcmUgY291bGQgYmUgaW1w
bGVtZW50YXRpb25zIG9mIGRyYWZ0IHNwZWMgdmVyc2lvbnMKd2hpY2ggYXJlIG5vdCBjb21wYXRp
YmxlIHdpdGggdGhlIGZpbmFsIHZlcnNpb24gYW5kIHRob3NlIHdpbGwgaGF2ZSB0aGUKc2FtZSBl
eHRlbnNpb24gSUQpLiBUaGUgbW9zdCBjb25maWRlbmNlIExpbnV4IGNhbiBoYXZlIGluIGFuIFNC
SQpleHRlbnNpb24ncyBpbXBsZW1lbnRhdGlvbiBiZWluZyB3aGF0IGl0IGV4cGVjdHMgdG8gYmUg
d2lsbCBjb21lIGZyb20KYm90aCB0aGUgZXh0ZW5zaW9uJ3MgcHJlc2VuY2UgYW5kIHRoZSBTQkkg
aW1wbGVtZW50YXRpb24ncyB2ZXJzaW9uCmJlaW5nIGF0IGxlYXN0IGFzIGJpZyBhcyB0aGUgdmVy
c2lvbiBpbiB3aGljaCB0aGUgZXh0ZW5zaW9uIHdhcyBmcm96ZW4uCgpMb25nIHN0b3J5IHNob3J0
LCBJJ2xsIGNoYW5nZSB0aGUgYWJvdmUgY29uZGl0aW9uIHRvIGxvb2sgZm9yIDIuMCBhbmQKYXNr
IFFFTVUgZm9sa3MgdG8gcHV0IGFuIE9wZW5TQkkgYmluYXJ5IHdoaWNoIGFkdmVydGlzZXMgMi4w
IGludG8gaXRzCnJlcG8gYXMgc29vbiBhcyBwb3NzaWJsZS4KClRoYW5rcywKZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
