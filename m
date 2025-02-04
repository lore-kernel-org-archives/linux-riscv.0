Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8248FC02193
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 18:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVt6jyILQHqJsBoo/gJTXvPb9DKGxN4GP9+o5CYHhWg=; b=CDWITlCbr2kbzF
	1MwR1iFhn5jPytOEFyOYVvQxJy0bnjkIfqC5+aP35uMa1gc+uqLZPil/rATSzp3Y4aGOP7y306SpM
	o3Tvi1/UucLQbC44BcXAYk1q2DepfjMdRCoUrJ53EVEDVrnAq+jPPmkqzwSSa+XuPnvCbrqBNtC+f
	+5RYt6dmOOT9PB55zc7dZemIz278a/Buiz/0smxVvsxtio7Hrs434nHBCIwUg46gXXW/VaZlvpQRg
	VVtYwPKoRxFOOytRYt/PqpYcFkjeZi3Iu8IkroIptvuFxayxrp3dhrw1AMrZ+ZF06Hwjp94pw29Wp
	/Yaa50tMvVsrOo9q+k4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNfr-00000001DQl-44EX;
	Tue, 04 Feb 2025 18:29:27 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNfp-00000001DQ1-3OuA
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 18:29:27 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-844e1020253so151819839f.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 10:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738693764; x=1739298564; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEPN7BQJIS/NgUdVABl5RKuZM8r7yMxe9P6rzBs6nCI=;
        b=mN5xa6/a0XyJJvYvAmKTjb3agfBNYGxdHAnGAukYZEAS7g7OaDH5YTmm4ymPBy89hR
         Vv2fHu7ftuSGqIL82kojfFvo1jf5phev6zdx+uKZ98ninDuDyy27iNJDCxKIuSv2b6bk
         9hmAs/ubVgM+cWnL+bxDTWQEkeJbEdh4kFcYfAHjmOFJjl2kGZnbX/p6fmzLB4afD0Vl
         fDglUWleEb4mxVkqXkWB9Lwj8dE+AFzJzb8h8xz0ibbp7KR9UNMWQY8BDQZ5BlS2TUPS
         1IZvBVt/R57e6/jx8kHRUIbedCAEbZnTKCCoqv5erqmElHZXBs5CvJHptUaT8DUnhpkP
         DWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738693764; x=1739298564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NEPN7BQJIS/NgUdVABl5RKuZM8r7yMxe9P6rzBs6nCI=;
        b=i7GkXRpLOD1kbPJfHJEOZVIzilVK/cu2XcJQtfORJ0kazenySPJfsczUUmzk7efN/z
         rZX1xio8tiNICpJpqUKoMRur/cSiG+YXxpl2iU/ZEZZ+Du4QryDzp9s59yUmZlgqQUt1
         YjUP39UipecaZeNFKKWyjYL249MQstF53xANS2CQkXt13Y1YsOtqfirmjq/Hf6Mz0OH/
         oNNLAhY2pw+3xjnigOxZM6bG5aB8eTcI5AdOhXUOcaLSEJrNi1xBPkZxaIhSGm5CeIiM
         PFaCw6Wbo0pzJufPO5ZL7IsvtzQF+hM644r6QmwMLZKyxRDgJNnoPHE6/j0RFocUSyvl
         cCvA==
X-Forwarded-Encrypted: i=1; AJvYcCVHnehYseGQ2nkHjnEcT/BPdAdZ/85clczu3uCjMuT6zoCq13/m9GPTrzaWL8r5ZJ5dA3KogeD4BJxDxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnQweIeB3Wyn01CrN/GbSddnr+PRj+TaPP4b4gt+/HBd0dslT1
	5ggPaot//zzn+g4xf5rdJXKJS3TFVFTw+R4c37sTbNvn8eg2wR2HhOjh5guI54g=
X-Gm-Gg: ASbGncsY90Gv2bzCsTFCCmalchsxSZzzs6gsMSGk3onvC0hSnPbmNibSMEhMBMdRjoZ
	ZUkex6e477FL1p+Cw4CSDSgOKzborlR8v0wGhmDFN/IS59H+UKBKcyDLZowSqOteIUKqisWG5lJ
	i3UVo5o4f+vXoiJ12EuhFBLygTn8uVGJB+6pSb/QwTj23rO8X84RrP0CpN7fPr3z9kPw23L7tUU
	GeqGbdRmUNSMjQwMGytAdK948469GRzOhrM8FJ5qkB33xE4ZuIpWDuT83HZUQUV7nPjcFX8fTTA
	DzOXdg==
X-Google-Smtp-Source: AGHT+IFbEoBr+a4SvrTbADFqhAkrC2SHJ4FukkyjQjHcwGP861IkITZWGwtN5GxQ+yTOHFoL8NSXOQ==
X-Received: by 2002:a05:6e02:18cf:b0:3cf:c7d3:e4b with SMTP id e9e14a558f8ab-3cffe6b7e26mr278996965ab.21.1738693764665;
        Tue, 04 Feb 2025 10:29:24 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7458e67esm2842974173.16.2025.02.04.10.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:29:23 -0800 (PST)
Date: Tue, 4 Feb 2025 10:29:21 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
Message-ID: <Z6JcgeDmt63MupyW@ghost>
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162>
 <Z5xzkwwZAWRRLCdj@ghost>
 <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
 <Z51BpVEkmVCg7gTX@ghost>
 <CAK7LNATs=c4J7mR69ec3scPqw6PK4SKTs-ixrQM_eRiz=EhS8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNATs=c4J7mR69ec3scPqw6PK4SKTs-ixrQM_eRiz=EhS8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_102926_106627_4AB054FC 
X-CRM114-Status: GOOD (  43.29  )
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

T24gVHVlLCBGZWIgMDQsIDIwMjUgYXQgMDE6MDQ6MjZQTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IE9uIFNhdCwgRmViIDEsIDIwMjUgYXQgNjozM+KAr0FNIENoYXJsaWUgSmVua2lu
cyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwgRmViIDAxLCAy
MDI1IGF0IDEyOjEwOjAyQU0gKzA5MDAsIE1hc2FoaXJvIFlhbWFkYSB3cm90ZToKPiA+ID4gT24g
RnJpLCBKYW4gMzEsIDIwMjUgYXQgMzo1NOKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUBy
aXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjUg
YXQgMDg6NTI6NDVQTSAtMDcwMCwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4gPiA+ID4gPiBP
biBXZWQsIEphbiAyMiwgMjAyNSBhdCAwNzoxNzoyNlBNIC0wODAwLCBDaGFybGllIEplbmtpbnMg
d3JvdGU6Cj4gPiA+ID4gPiA+IE9uIHJpc2N2LCBrZXJuZWwgbW9kdWxlcyBlbmQgdXAgd2l0aCBh
IHNpZ25pZmljYW50IG51bWJlciBvZiBsb2NhbAo+ID4gPiA+ID4gPiBzeW1ib2xzLiBUaGlzIGJl
Y29tZXMgYXBwYXJlbnQgd2hlbiBjb21waWxpbmcgbW9kdWxlcyB3aXRoIGRlYnVnIHN5bWJvbHMK
PiA+ID4gPiA+ID4gZW5hYmxlZC4gVXNpbmcgYW1kZ3B1LmtvIGFzIGFuIGV4YW1wbGUgb2YgYSBs
YXJnZSBtb2R1bGUsIG9uIHJpc2N2IHRoZQo+ID4gPiA+ID4gPiBzaXplIGlzIDc1NE1CIChubyBz
dHJpcHBpbmcpLCA1M01CICgtLXN0cmlwLWRlYnVnKSwgYW5kIDIxTUIKPiA+ID4gPiA+ID4gKC0t
c3RyaXAtdW5uZWVkZWQpLiBPTiB4ODYsIGFtZGdwdS5rbyBpcyA0ODJNQiAobm8gc3RyaXBwaW5n
KSwgMjFNQgo+ID4gPiA+ID4gPiAoLS1zdHJpcC1kZWJ1ZyksIGFuZCAyME1CICgtLXN0cmlwLXVu
bmVlZGVkKS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVXNlIC0tc3RyaXAtdW5uZWVkZWQgaW5z
dGVhZCBvZiAtLXN0cmlwLWRlYnVnIHRvIHN0cmlwIG1vZHVsZXMgc28KPiA+ID4gPiA+ID4gZGVj
cmVhc2UgdGhlIHNpemUgb2YgdGhlIHJlc3VsdGluZyBtb2R1bGVzLiBUaGlzIGlzIHBhcnRpY3Vs
YXJseQo+ID4gPiA+ID4gPiByZWxldmFudCBmb3IgcmlzY3YsIGJ1dCBhbHNvIG1hcmdpbmFsbHkg
YWlkcyBvdGhlciBhcmNoaXRlY3R1cmVzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+ID4gPiA+ID4K
PiA+ID4gPiA+IElzIHRoZXJlIGFueSBzb3J0IG9mIHJlZ3Jlc3Npb24gcmlzayB3aXRoIHRoaXMg
cGF0Y2g/IElmIHNvLCBhbm90aGVyCj4gPiA+ID4gPiBvcHRpb24gbWF5IGJlIHRvIGdpdmUgYW5v
dGhlciBsZXZlbCB0byBJTlNUQUxMX01PRF9TVFJJUCBsaWtlIDIgc28gdGhhdAo+ID4gPiA+ID4g
SU5TVEFMTF9NT0RfU1RSSVA9MSBjb250aW51ZXMgdG8gYmVoYXZlIGFzIGJlZm9yZSBidXQgcGVv
cGxlIGNhbiBlYXNpbHkKPiA+ID4gPiA+IG9wdCBpbnRvIHRoaXMgb3B0aW9uLiBObyBzdHJvbmcg
b3BpbmlvbiBiZWNhdXNlIEkgYW0gbm90IHN1cmUgYnV0IHdhcwo+ID4gPiA+ID4gbm90IHN1cmUg
aWYgaXQgd2FzIGNvbnNpZGVyZWQuCj4gPiA+ID4KPiA+ID4gPiBJIGRvIG5vdCBiZWxpZXZlIHRo
aXMgd291bGQgY2F1c2UgcmVncmVzc2lvbnMuIFRoZSBkZXNjcmlwdGlvbiBvbiBnbnUKPiA+ID4g
PiBzdHJpcCBpczoKPiA+ID4gPgo+ID4gPiA+ICJSZW1vdmUgYWxsIHN5bWJvbHMgdGhhdCBhcmUg
bm90IG5lZWRlZCBmb3IgcmVsb2NhdGlvbiBwcm9jZXNzaW5nIGluCj4gPiA+ID4gYWRkaXRpb24g
dG8gZGVidWdnaW5nIHN5bWJvbHMgYW5kIHNlY3Rpb25zIHN0cmlwcGVkIGJ5IC0tc3RyaXAtZGVi
dWcuIgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGRlc2NyaXB0aW9uIG9uIGxsdm0tc3RyaXAgaXM6Cj4g
PiA+ID4KPiA+ID4gPiAiUmVtb3ZlIGZyb20gdGhlIG91dHB1dCBhbGwgbG9jYWwgb3IgdW5kZWZp
bmVkIHN5bWJvbHMgdGhhdCBhcmUgbm90Cj4gPiA+ID4gcmVxdWlyZWQgYnkgcmVsb2NhdGlvbnMu
IEFsc28gcmVtb3ZlIGFsbCBkZWJ1ZyBzZWN0aW9ucy4iCj4gPiA+ID4KPiA+ID4gPiBnbnUgc3Ry
aXAgLS1zdHJpcC11bm5lZWRlZCBzdHJpcHMgc2xpZ2h0bHkgbW9yZSBhZ2dyZXNzaXZlbHkgYnV0
IGl0IGRvZXMKPiA+ID4gPiBub3QgYXBwZWFyIHRoaXMgY2F1c2VzIGFueSBpc3N1ZXMuCj4gPiA+
ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBSZWdhcmRsZXNzOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFJl
dmlld2VkLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4gPiA+ID4K
PiA+ID4gPiBUaGFua3MhCj4gPiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gSXQgaXMgdHJ1ZSAtLXN0
cmlwLXVubmVlZGVkIGRyb3BzIGEgbG90IG9mIGNvbXBpbGVyLWdlbmVyYXRlZCBzeW1ib2xzLCBi
dXQKPiA+ID4gaXQgYWxzbyBkcm9wcyByZWFsIHN5bWJvbHMgdGhhdCBvcmlnaW5hdGUgaW4gdGhl
IHNvdXJjZSBjb2RlLgo+ID4gPgo+ID4gPiBTbywgdGhpcyB3b3VsZCBnaXZlIHVzZXItdmlzaWJs
ZSBjaGFuZ2VzIGZvciBrYWxsc3ltcyBhdCBsZWFzdC4KPiA+Cj4gPiBBZGRpbmcgSU5TVEFMTF9N
T0RfU1RSSVA9Ii0tc3RyaXAtdW5uZWVkZWQiIHdvdWxkIGJlIHN1ZmZpY2llbnQgZm9yCj4gPiBy
aXNjdi4gSG93ZXZlciwgdGhpcyBoYXMgdGhlIGRvd25zaWRlIHRoYXQgcmlzY3Ygd2lsbCByZXF1
aXJlIGRpZmZlcmVudAo+ID4gZmxhZ3MgdGhhbiBvdGhlciBhcmNoaXRlY3R1cmVzIHRvIGdldCBy
ZWFzb25hYmx5IHNpemVkIG1vZHVsZXMuCj4gCj4gWW91IGNhbiB1c2UgSU5TVEFMTF9NT0RfU1RS
SVA9LS1zdHJpcC11bm5lZWRlZCBmb3IgYWxsIGFyY2hpdGVjdHVyZSBpZiB5b3UgbGlrZS4KPiAK
PiBJIGFzc3VtZSB0aGlzIGlzIGEgcmlzY3YgaXNzdWUuIFNwZWNpZmljYWxseSwgcmlzY3YgZ2Nj
Lgo+IFdpdGggTExWTT0xLCBJIHNlZSBtdWNoIHNtYWxsZXIgcmlzY3YgbW9kdWxlcyB1c2luZyBJ
TlNUQUxMX01PRF9TVFJJUD0xLgo+IAo+IC0tc3RyaXAtdW5uZWVkZWQgaXMgbmVlZGxlc3NseSBh
Z2dyZXNzaXZlIGZvciBvdGhlciBhcmNoaXRlY3R1cmVzLAo+IGFuZCBJIGRvIG5vdCBzZWUgYSBn
b29kIHJlYXNvbiB0byBjaGFuZ2UgdGhlIGRlZmF1bHQuCgpZZXMgaXQgaXMgcHJpbWFyaWx5IGFu
IGlzc3VlIHdpdGggcmlzY3YgR0NDLiBJIHdhcyBob3BpbmcgZm9yIHNvbWV0aGluZwptb3JlIHN0
YW5kYXJkaXplZCBzbyB0aGF0IG90aGVyIHBlb3BsZSB1c2luZyByaXNjdiBHQ0Mgd291bGRuJ3QK
ZW5jb3VudGVyIHRoaXMuIFdvdWxkIGl0IGJlIHJlYXNvbmFibGUgdG8gYWRkIHRoaXMgZmxhZyBi
eSBkZWZhdWx0IG9ubHkKZm9yIHRoZSByaXNjdiBhcmNoaXRlY3R1cmUsIG9yIGRvIHlvdSB0aGlu
ayBpdCdzIGp1c3QgYmV0dGVyIHRvIGxlYXZlIGl0CnVwIHRvIHRoZSB1c2VyJ3MgY2hvaWNlPwoK
LSBDaGFybGllCgo+IAo+IAo+IAo+IAo+IAo+IAo+IAo+IAo+IAo+ID4KPiA+IEkgYmVsaWV2ZSB0
aGVzZSBzeW1ib2xzIGFyZSBvbmx5IHVzZWZ1bCBmb3IgZGVidWdnaW5nLCBpcyB0aGVyZSBhCj4g
PiB1c2VjYXNlIGZvciB0aGVtIHRvIGJlIGF2YWlsYWJsZSB3aGVuIHRoZSB1c2VyIGhhcyBtb2R1
bGVzIGNvbXBpbGVkIHdpdGgKPiA+IElOU1RBTExfTU9EX1NUUklQPTE/Cj4gPgo+ID4gLSBDaGFy
bGllCj4gPgo+ID4gPgo+ID4gPgo+ID4gPiAkIHJpc2N2NjQtbGludXgtZ251LW5tICAtbgo+ID4g
PiAvdG1wL3N0cmlwLXVubmVlZGVkL2xpYi9tb2R1bGVzLzYuMTMuMC0wOTc2MC1nNjllODU4ZTBi
OGIyL2tlcm5lbC9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua28KPiA+ID4gID4g
L3RtcC9zeW1ib2wtd2l0aC1zdHJpcC11bm5lZWRlZAo+ID4gPiAkIHJpc2N2NjQtbGludXgtZ251
LW5tICAtbgo+ID4gPiAvdG1wL3N0cmlwLWRlYnVnL2xpYi9tb2R1bGVzLzYuMTMuMC0wOTc2MC1n
NjllODU4ZTBiOGIyL2tlcm5lbC9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua28K
PiA+ID4gID4gL3RtcC9zeW1ib2wtd2l0aC1zdHJpcC1kZWJ1Zwo+ID4gPgo+ID4gPiAkICBkaWZm
IC11IC90bXAvc3ltYm9sLXdpdGgtc3RyaXAtZGVidWcgIC90bXAvc3ltYm9sLXdpdGgtc3RyaXAt
dW5uZWVkZWQKPiA+ID4gIFsgc25pcCBdCj4gPiA+ICAwMDAwMDAwMDAwMTY3NmNjIHQgdXZkX3Y2
XzBfcmluZ190ZXN0X3JpbmcKPiA+ID4gIDAwMDAwMDAwMDAxNjc4MDIgdCB1dmRfdjZfMF9yaW5n
X2VtaXRfcGlwZWxpbmVfc3luYwo+ID4gPiAgMDAwMDAwMDAwMDE2N2EwMiB0IHV2ZF92Nl8wX3Jp
bmdfZW1pdF9mZW5jZQo+ID4gPiAtMDAwMDAwMDAwMDE2N2I1OCByIENTV1RDSC4yCj4gPiA+IC0w
MDAwMDAwMDAwMTY3YjY4IHIgYWJtX3NldHRpbmdzCj4gPiA+IC0wMDAwMDAwMDAwMTY3YjgwIHIg
YWJtX2NvbmZpZwo+ID4gPiAtMDAwMDAwMDAwMDE2N2I5MCByIG1pbl9yZWR1Y3Rpb25fdGFibGVf
dl8yXzIKPiA+ID4gLTAwMDAwMDAwMDAxNjdiYTAgciBtYXhfcmVkdWN0aW9uX3RhYmxlX3ZfMl8y
Cj4gPiA+IC0wMDAwMDAwMDAwMTY3YmIwIHIgbWluX3JlZHVjdGlvbl90YWJsZQo+ID4gPiAtMDAw
MDAwMDAwMDE2N2JjMCByIG1heF9yZWR1Y3Rpb25fdGFibGUKPiA+ID4gLTAwMDAwMDAwMDAxNjdi
ZDAgciBjdXN0b21fYmFja2xpZ2h0X2N1cnZlMAo+ID4gPiAgMDAwMDAwMDAwMDE2N2MzOCByIGFi
bV9zZXR0aW5nc19jb25maWcyCj4gPiA+ICAwMDAwMDAwMDAwMTY3YzcwIHIgYWJtX3NldHRpbmdz
X2NvbmZpZzEKPiA+ID4gIDAwMDAwMDAwMDAxNjdjYTggciBhYm1fc2V0dGluZ3NfY29uZmlnMAo+
ID4gPgo+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiAtLQo+ID4gPiBCZXN0IFJlZ2FyZHMKPiA+ID4g
TWFzYWhpcm8gWWFtYWRhCj4gCj4gCj4gCj4gLS0KPiBCZXN0IFJlZ2FyZHMKPiBNYXNhaGlybyBZ
YW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
