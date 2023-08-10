Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C06C001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 07:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnxVfM1GROs04nh8JQI79Fp2Nvg0KreaP/E7su7B92E=; b=HjhcPVu14JdbSD
	v4ycH6asv5oZv8RLQjkSo3ALQhzl93vrIrQBA/ZIr7uuA7+EpuFJSv6hrROPQJ65XMKYM3t0gh6GN
	XFLN4tlESc34jUAedhavV7vtExf8B63Su6dKCC9uGdZedOprmfyEmy7JfVnQy0jB5bIYeXYEnLyjE
	fE3NxfxbIOu7xKuFI8SzgSUpbk5l7l8JngVXaeV2kgwgYOwUw8he/Kwx0qQGIRtbf25uW9xCQDZ6l
	UwV+MTbgFGA44mH7RahS5IZbLCu+eixRhYMaGtXNI7gAStJdVHpXfclQPTz+oBKYTQFU78SxPDhUX
	U03hLKvmeZZohlgy5CWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU09N-006ky9-2S;
	Thu, 10 Aug 2023 07:32:05 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU09J-006kxS-07
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 07:32:04 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b703a0453fso9186881fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691652716; x=1692257516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oXHpas/KmXDTLglHDU9vAguiX9YfCSmqZJvftrbw/7Y=;
        b=JRby+fFKyn058b4haTDj5DdvPR1VYTDezA/wzuec1odNIuXDGa0h7u2VUrqecquGKe
         Yz8ZWPXK7gK36RgB4i0gYBvpxNKBFkjvt6hJ6OsTBFaoseEEpAe8ngWVMF/x9caQnDqT
         qRU+pc0BXp93nGWiGYHoPXLQgmvi33CDqlAHKZnn6TQbBa5sDOUHOjVBh3vTimmBtjxZ
         sKVirGQo9LU2WgqwgKvTS9mZEE73E6EWOIfYa2bt+vjUPMDBDPALsaSvEtrYe4Oo8ILg
         IxrBCGe8Icwrsp/JsayX6EH+M3PrvrxGT3U1SSXaUWWhIDszRpwVPHc0gTlzM7UnbW2B
         82+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691652716; x=1692257516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXHpas/KmXDTLglHDU9vAguiX9YfCSmqZJvftrbw/7Y=;
        b=faqOS5MlcMR74oKGpdAakP2vyMxFVE4s1C2qPiZO0YMmBKCcipwgcvvFNrXdoPbtaZ
         mdvMjFZ2498ldH6y8UnUBlsB7NjAr45/6Rxkk8w3N2kCp5wEyy89ZqkBLrXjbc5jStoX
         NHFBTPHkoNEjCP0C70LEm+bn5TtZJqGz2PEwLlVl3vO3uxrxKx1bmrZcf37Bb26dn6yz
         5ll7hVFi/i2cbpv6P+WUUZcq1/4Li071ubxSgWb/Zr+8q/4YP1MZae30YPxfcwcNFBTI
         OvbJ0ySGfZ4Sz0YG1ZPUTurFgGTYpJkEh2Mvkiq94P4ap2v+5Yqa3ZcnS0QfgPpW+THZ
         KRMA==
X-Gm-Message-State: AOJu0YwMdOuYprwVHvONYi6evLgWcehltSEDvbtFr83dtTMXKhEKYsPH
	BJwr6Zf3Hwmt6HHzg9W9I1q6wg==
X-Google-Smtp-Source: AGHT+IGdQBUQpWJ8Z3xflI/wby8YMORlNTDQRDBiCcgHttfZ/VLS3uptXnPKc3LpARma7gLlveJ/gw==
X-Received: by 2002:a2e:9f0c:0:b0:2b6:9bd3:840e with SMTP id u12-20020a2e9f0c000000b002b69bd3840emr1372656ljk.21.1691652716262;
        Thu, 10 Aug 2023 00:31:56 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m22-20020a1709060d9600b00992a8a54f32sm533357eji.139.2023.08.10.00.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 00:31:55 -0700 (PDT)
Date: Thu, 10 Aug 2023 09:31:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH 2/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20230810-30583d716fb7652e22c868ee@orel>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-10-ajones@ventanamicro.com>
 <CALs-HssK7ys8kjZPuodoz9qEe_hReyihfbBdQsp1exLH3vxkSQ@mail.gmail.com>
 <20230809-7aa41e2dd2fd2909f1266a20@orel>
 <20230809-disrupt-jersey-f2545c5903fe@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230809-disrupt-jersey-f2545c5903fe@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_003201_079867_814596D6 
X-CRM114-Status: GOOD (  39.74  )
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

T24gV2VkLCBBdWcgMDksIDIwMjMgYXQgMDc6MTI6NThQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFdlZCwgQXVnIDA5LCAyMDIzIGF0IDA2OjU4OjE1UE0gKzAyMDAsIEFuZHJldyBK
b25lcyB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDA5LCAyMDIzIGF0IDA5OjAwOjM1QU0gLTA3MDAs
IEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiA+IE9uIFdlZCwgQXVnIDksIDIwMjMgYXQgNDo1NeKAr0FN
IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gLi4uCj4g
PiA+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl90aGlzX2NwdV9oYXNfZXh0
ZW5zaW9uX2xpa2VseShjb25zdCB1bnNpZ25lZCBsb25nIGV4dCkKPiA+ID4gPiArewo+ID4gPiA+
ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFKSAmJiByaXNj
dl9oYXNfZXh0ZW5zaW9uX2xpa2VseShleHQpKQo+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1
cm4gdHJ1ZTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICByZXR1cm4gX19yaXNjdl9pc2FfZXh0
ZW5zaW9uX2F2YWlsYWJsZShoYXJ0X2lzYVtzbXBfcHJvY2Vzc29yX2lkKCldLmlzYSwgZXh0KTsK
PiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29s
IHJpc2N2X3RoaXNfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoY29uc3QgdW5zaWduZWQgbG9u
ZyBleHQpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19S
SVNDVl9BTFRFUk5BVElWRSkgJiYgcmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShleHQpKQo+
ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4gPiArCj4gPiA+ID4gKyAg
ICAgICByZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShoYXJ0X2lzYVtzbXBf
cHJvY2Vzc29yX2lkKCldLmlzYSwgZXh0KTsKPiA+ID4gPiArfQo+ID4gPiAKPiA+ID4gQW5vdGhl
ciB3YXkgdG8gZG8gdGhpcyB3b3VsZCBiZSB0byBhZGQgYSBwYXJhbWV0ZXIgdG8KPiA+ID4gcmlz
Y3ZfaGFzX2V4dGVuc2lvbl8qKCkgKGFzIHRoZXJlIGFyZSB2ZXJ5IGZldyB1c2VycyksIHRoZW4g
dGhlc2UgbmV3Cj4gPiA+IGZ1bmN0aW9ucyBjYW4gdHVybiBhcm91bmQgYW5kIGNhbGwgdGhvc2Ug
d2l0aCB0aGUgbmV3IHBhcmFtZXRlciBzZXQgdG8KPiA+ID4gaGFydF9pc2Fbc21wX3Byb2Nlc3Nv
cl9pZCgpXS5pc2EuIEl0J3MgYSB0b3NzdXAsIHNvIHVwIHRvIHlvdS4gVGhlCj4gPiA+IG9ubHkg
YWR2YW50YWdlIHRvIGl0IEkgY2FuIGFyZ3VlIGlzIGl0IGtlZXBzIHRoZSBjb2RlIGZsb3dzIG1v
cmUKPiA+ID4gdW5pZmllZC4KPiA+ID4KPiA+IAo+ID4gSSBsaWtlIHVuaWZpY2F0aW9uLCBidXQg
SSB0aGluayBJJ2QgcHJlZmVyIHdlIGNyZWF0ZSB3cmFwcGVycyBhbmQKPiA+IHRyeSB0byBhdm9p
ZCBjYWxsZXJzIG5lZWRpbmcgdG8gY29uc3RydWN0IGhhcnRfaXNhW10uaXNhIHBhcmFtZXRlcnMK
PiA+IHRoZW1zZWx2ZXMuIEknbSBhbHNvIG5vdCBhIGJpZyBmYW4gb2YgdGhlIE5VTEwgcGFyYW1l
dGVyIG5lZWRlZCB3aGVuCj4gPiByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSgpIGlzIGlu
dm9rZWQgZm9yIHRoZSByaXNjdl9pc2EgYml0bWFwLgo+ID4gU28gd2UgbmVlZDoKPiA+IAo+ID4g
ICAxLiBjaGVjayBpZiBhbiBleHRlbnNpb24gaXMgaW4gcmlzY3ZfaXNhCj4gPiAgIDIuIGNoZWNr
IGlmIGFuIGV4dGVuc2lvbiBpcyBpbiBhIGJpdG1hcCBwcm92aWRlZCBieSB0aGUgY2FsbGVyCj4g
PiAgIDMuIGNoZWNrIGlmIGFuIGV4dGVuc2lvbiBpcyBpbiB0aGlzIGNwdSdzIGlzYSBiaXRtYXAK
PiA+ICAgNC4gY2hlY2sgaWYgYW4gZXh0ZW5zaW9uIGlzIGluIHRoZSBpc2EgYml0bWFwIG9mIGEg
Y3B1IHByb3ZpZGVkIGJ5IHRoZQo+ID4gICAgICBjYWxsZXIKPiA+IAo+ID4gVGhlIG9ubHkgb25l
IHdlIGNhbiBvcHRpbWl6ZSB3aXRoIGFsdGVybmF0aXZlcyBpcyAoMSksIHNvIGl0IGRlZmluaXRl
bHkKPiA+IGdldHMgd3JhcHBlcnMgKHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5L3VubGlrZWx5
KCkpLiAoMykgYW5kICg0KSBjYW4KPiA+IGFsc28gZ2V0IHdyYXBwZXJzIHdoaWNoIGZpcnN0IHRy
eSB0aGUgb3B0aW1pemVkICgxKSwgbGlrZSBJIGhhdmUgYWJvdmUuCj4gPiBBY3R1YWxseSAoMykn
cyB3cmFwcGVyIGNvdWxkIGJlIGJhc2VkIG9uICg0KSdzLCBvciBvbmx5IHByb3ZpZGUgd3JhcHBl
cnMKPiA+IGZvciAoNCkKPiA+IAo+ID4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNj
dl9jcHVfaGFzX2V4dGVuc2lvbl9saWtlbHkoaW50IGNwdSwgY29uc3QgdW5zaWduZWQgbG9uZyBl
eHQpCj4gPiAgewo+ID4gICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfQUxURVJOQVRJ
VkUpICYmIHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KGV4dCkpCj4gPiAgICAgICAgICByZXR1
cm4gdHJ1ZTsKPiA+IAo+ID4gICAgICByZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWls
YWJsZShoYXJ0X2lzYVtjcHVdLmlzYSwgZXh0KTsKPiA+ICB9Cj4gPiAKPiA+ICBzdGF0aWMgX19h
bHdheXNfaW5saW5lIGJvb2wgcmlzY3ZfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoaW50IGNw
dSwgY29uc3QgdW5zaWduZWQgbG9uZyBleHQpCj4gPiAgewo+ID4gICAgICBpZiAoSVNfRU5BQkxF
RChDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkUpICYmIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtl
bHkoZXh0KSkKPiAKPiBXaHkgYXJlIHlvdSBnYXRpbmcgb24gQ09ORklHX1JJU0NWX0FMVEVSTkFU
SVZFIGhlcmU/CgpUaGlzIGVuc3VyZXMgd2UgcmVtb3ZlIHRoZSByaXNjdl9oYXNfZXh0ZW5zaW9u
X1t1bl1saWtlbHkoKSBjYWxsCndoZW4gdGhhdCBjYWxsIHdvdWxkIGVuZCB1cCB1c2luZyBpdHMK
X19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBleHQpIGZhbGxiYWNrLiBJZiB0
aGF0IGZhbGxiYWNrCndoZXJlIHRvIHJldHVybiBmYWxzZSwgdGhlbiB3ZSdkIHN0aWxsIG5lZWQg
dG8gbWFrZSB0aGUKX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShoYXJ0X2lzYVtjcHVd
LmlzYSwgZXh0KSBjYWxsLCBkb3VibGluZwp0aGUgY29zdC4gV2hlcmVhcywgd2hlbiB3ZSBnYXRl
IG9uIENPTkZJR19SSVNDVl9BTFRFUk5BVElWRSwgd2Uga25vdyB0aGF0CnJpc2N2X2hhc19leHRl
bnNpb25fW3VuXWxpa2VseSgpIHdpbGwgdXNlIGFuIGFsdGVybmF0aXZlIHRvIGNoZWNrIHRoZQpn
bG9iYWwgc2V0IG9mIGV4dGVuc2lvbnMuIFdoZW4gdGhlIGV4dGVuc2lvbiBpcyB0aGVyZSwgdGhl
IGNvbXBpbGVyCmVuc3VyZXMgdGhhdCBldmVyeXRoaW5nIHZhbmlzaGVzLiBXaGVuIGl0J3Mgbm90
LCB3ZSdsbCBmYWxsYmFjayB0byBhCnNpbmdsZSBzZWFyY2ggb2YgdGhlIGNwdSdzIGlzYSBiaXRt
YXAuCgo+IAo+ID4gICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiAKPiA+ICAgICAgcmV0dXJuIF9f
cmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaGFydF9pc2FbY3B1XS5pc2EsIGV4dCk7Cj4g
PiAgfQo+ID4gCj4gPiBhbmQgdGhlbiB1c2Ugc21wX3Byb2Nlc3Nvcl9pZCgpIGRpcmVjdGx5IGlu
IHRoZSBjYWxsZXJzIHRoYXQgbmVlZAo+ID4gdG8gY2hlY2sgdGhpc19jcHUncyBleHRlbnNpb25z
Lgo+ID4gCj4gPiBGb3IgY2FzZSAoMiksIEknZCBhZHZvY2F0ZSB3ZSByZW5hbWUgX19yaXNjdl9p
c2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSgpIHRvCj4gPiByaXNjdl9oYXNfZXh0ZW5zaW9uKCkgYW5k
IGRyb3AgdGhlIHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKCkgbWFjcm8KPiA+IGluIG9y
ZGVyIHRvIGF2b2lkIGhhdmluZyBzb21lIGNhbGxzIHdpdGggUklTQ1ZfSVNBX0VYVF8qIHNwZWxs
ZWQgb3V0IGFuZAo+ID4gb3RoZXJzIHRoYXQgcmVseSBvbiB0aGUgcGFzdGluZy4KPiAKPiA+IEFu
ZCwgaWRlYWxseSwgd2UnZCBjb252ZXJ0IG1vc3QKPiA+IHJpc2N2X2hhc19leHRlbnNpb24oTlVM
TCwgZXh0KSBjYWxscyB0byByaXNjdl9oYXNfZXh0ZW5zaW9uX1t1bl1saWtlbHkoKS4KPiAKPiA+
IEknbSBhbHNvIG5vdCBhIGJpZyBmYW4gb2YgdGhlIE5VTEwgcGFyYW1ldGVyIG5lZWRlZCB3aGVu
Cj4gPiByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSgpIGlzIGludm9rZWQgZm9yIHRoZSBy
aXNjdl9pc2EgYml0bWFwCj4gCj4gUmF0aGVyIHRoYW4gYWN0dWFsbHkgYWN0IG9uIG15IGNvbmNl
cm5zIGFib3V0Cj4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSgpLCBJJ3ZlIGJlZW4g
YnVzeSBkZXZvdGluZyBteSBzcGFyZQo+IHRpbWUgdG8gcGxheWluZyBNTU9zIHdpdGggdGhlIGV4
Y3VzZSBvZiBub3Qgd2FudGluZyB0byBmaWRkbGUgZnVydGhlcgo+IHdpdGggY3B1ZmVhdHVyZS5j
IGV0IGFsIHVudGlsIFBhbG1lciBtZXJnZWQgdGhlIG5ldyBEVCBwcm9wZXJ0eSBzdHVmZiwKPiBi
dXQgc3BsaXR0aW5nIG91dCB5b3VyIGNhc2UgMSBhYm92ZSBzZWVtcyBsaWtlIGl0IHdvdWxkIHJl
YWxseSBoZWxwCj4gdGhlcmUuIFRoZSBOVUxMIGFyZ3VtZW50IGNhc2UgaXMgdGhlIG9uZSBJIHRo
aW5rIGhhcyB0aGUgcG90ZW50aWFsIHRvCj4gYmUgYSBmb290Z3VuIGluIHRoZSBmYWNlIG9mIGNv
bmZpZyBvcHRpb25zLgo+IFNwbGl0IG91dCB3ZSBjYW4gZG9jdW1lbnQgdGhhdCBwdXJwb3NlIG9m
IGVhY2ggZnVuY3Rpb24gJiBob3BlZnVsbHkKPiBoYXZlIG9uZSBzZXQgb2YgZnVuY3Rpb25zIHRo
YXQgZGVhbHMgd2l0aCAidGhpcyBleHRlbnNpb24gd2FzIGRldGVjdGVkCj4gdG8gYmUgcHJlc2Vu
dCBpbiB0aGUgaGFyZHdhcmUiIGFuZCBvbmUgdGhhdCBkb2VzICJ0aGlzIGV4dGVuc2lvbiB3YXMK
PiBkZXRlY3RlZCAmIHN1cHBvcnRlZCBieSB0aGlzIHBhcnRpY3VsYXIga2VybmVsIi4KClNvdW5k
cyBnb29kIHRvIG1lIQoKPiAKPiBJJ2xsIHRyeSB0byB0YWtlIGEgcHJvcGVyIGxvb2sgYXQgdGhp
cyBzZXJpZXMgdG9tb3Jyb3cgOikKPgoKVGhhbmtzIQpkcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
