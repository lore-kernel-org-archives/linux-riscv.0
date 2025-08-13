Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3441AC87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 05:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xvvoMOk1lGKf2kNsBSqhI5ln3VS9k9TLYJHwwIbfLA=; b=ATXnvXxLqUhF6I
	zug1jrI8SAeXh2HRQzDO3GUAODJNlMUpdD8fj/58E00IRvmqveSy+MCCoQ08QTQU1EFB4nPJ1Gz/3
	PQlXuhOUGeN4Js0DitJeVRM00v5ywlAf3pPCAaVjpOz1xnuygZYnKPavpqTEZeLPq//fUndv2FqVG
	gmX1J8OfXegJNdH4sHbvZhr5p6MRTLhFKFfiIvYEH2VS7WlsssgUsVp89DxsDHFuFoOh6jTgIM68y
	Vcjofyd/ySMLoWfl67Dxu5foiM7+lU2XDtNnnwecHy2s5+kaDMCHjtCBjrdwtCnQnIEiIplblguWF
	Z0jXaS0T6b74E+97SyFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um41w-0000000CeX5-1Bq5;
	Wed, 13 Aug 2025 05:28:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um41u-0000000CeWj-1cO4
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 05:28:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2406fe901c4so39406785ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 22:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755062885; x=1755667685; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aju9Ezzu25BAlOrE4njOpI382Aihv6lGd4Ptk5SgQ+U=;
        b=Ax2gRZx1mp3FKRArcR3S0kGm34DZVgQfyOLtKN8P0k/Gor4fnvggJPWjegtPjOUEHE
         2AiobJTR32EH24MAURORgpihhU7C9mPrBCEH8MjPbKf28z5tnDtsYk7wYEtgg+lXKtk5
         137JzgrGr1/7f2hIfQfWEQHDdo4TrVxZEjYoakNQDTkHLe36+fxehI5rAX1jH5cMW+MQ
         rO66tshN6eSAsN7u8HU9Vdwls0oAiVhg3v+ssPyaBtn85o77C8kYtrI4NohS7H+Pw1eO
         IWiT+l4S8ssEY5+HHCHNfwg9HOjcCF/FdRuspxBdC4hgPFf1OErGVnkdSVO59GvCrJPW
         l+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755062885; x=1755667685;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aju9Ezzu25BAlOrE4njOpI382Aihv6lGd4Ptk5SgQ+U=;
        b=VIRXgVcC2LWfc8i+RrODDzqbKGjlzUP8kS9Vayddx+WArQKfeq2XKbRS0m8leVK+rA
         reLUwmJsvBPp+91RRZ70bTu14sQg200Qsw0/Gt7p3ZVt7yQoAm0EtWVcb9EQnMG1E236
         XWPgquIFtzE7sCKlaWxfhcNOCh6+uvIu8r1rmHWdHiVTsFZznpDZkMujlmIbWvTpXG9Q
         iNrcdqBu7pEVhh5P45NLmNydbSUtTpkJwlCnQPGQeR7Ulu4hhxC6ANY6j7qeOl4feop6
         li1/itEoC3UpTqxdkqQGrFDrY2A95rRP5JAAKMGTmV7CAZhXWILdU32Ceyyrm4M1RKkn
         jXpA==
X-Forwarded-Encrypted: i=1; AJvYcCX9QLz0XEHU0TJynsMuK9RyD3msgQrbkX6Uc3xx5JJ4A190q65ihyfotGMS/0fMOy7E/ceUOpCND6EXZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDHJOioY+mgBHZHVJ4CB/m6NWuTz5qJct8fuvrCPRXPlU4hYGC
	aL4m3j49byqf4Ofw+HHmMJHFtoxc6ZbXlpjfCuysAF/2ZRdXa8VFKksmKl4hjrrxvNxvqn7noFn
	+l2IqeXU=
X-Gm-Gg: ASbGnctEJvF2DYIj/BsnSxWlI8XQuD+UIHnreOaYkgXUlKyZSJ4AkMuqsCgXF5rdMWW
	jy70fvGRtI2pQG/+owEflAS9zz1WjMkz+/2BYeO6Bu7xmaPB6eMWlYWVxrbuTCdcFYPAFOZzPeP
	PqT+cgqkS7pZTNFBKsvEnFaj7KqoeuGa3ZbFrmh9lFRpNZ4ERaVBEoSSY/XWKBTypwoUHAFm6en
	t6S3E4iMsHxE1Bwj41UEHQrtTyn4nEREwZG8UxnqVilzWzwS1mWnpdDIaXeDz1Va1eff04qL+HB
	1XrBEkJwqnTn2wNGAjZO0ESKBE5dLyCrF1vwA4ju3DPZ1NulSN9Y4P3svVACQQ3KdV7Z9rgSGTm
	MxSpuzJ6bXjY/Zvp4Tt4IFdlWFv8=
X-Google-Smtp-Source: AGHT+IEWD1QrQHf15aacA8d3X+YH/g3HK5aeIT/ZRzGKWWsB4ySfzVLYRddBV3zOTrXlbUObhnp0Dw==
X-Received: by 2002:a17:902:c94c:b0:23f:d8e4:ded2 with SMTP id d9443c01a7336-2430d219063mr30698875ad.53.1755062885395;
        Tue, 12 Aug 2025 22:28:05 -0700 (PDT)
Received: from sunil-laptop ([106.51.199.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef658esm317511125ad.3.2025.08.12.22.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 22:28:04 -0700 (PDT)
Date: Wed, 13 Aug 2025 10:57:56 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>, juwenlong@bytedance.com
Subject: Re: [External] Re: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for
 CPPC FFH
Message-ID: <aJwiXKWXik8BmpL8@sunil-laptop>
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
 <aJs-aPH32OxpzR3G@sunil-laptop>
 <CAEEQ3wnHFPBPC0U59rDBJaZYxJ24uJzJ7NDQO0gfmVqoiQwNOw@mail.gmail.com>
 <aJtKZhvNX0p3obFw@sunil-laptop>
 <CAEEQ3wmomscuAzuiRyJu4ha8tiM=s1Y-ytQROPTWr1DScMNL3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wmomscuAzuiRyJu4ha8tiM=s1Y-ytQROPTWr1DScMNL3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_222806_429712_6C21FA23 
X-CRM114-Status: GOOD (  32.47  )
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

SGkgWXVuaHVpLAoKT24gV2VkLCBBdWcgMTMsIDIwMjUgYXQgMTE6MjM6MzlBTSArMDgwMCwgeXVu
aHVpIGN1aSB3cm90ZToKPiBIaSBTdW5pbCwKPiAKPiBPbiBUdWUsIEF1ZyAxMiwgMjAyNSBhdCAx
MDowNuKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+
ClsuLi5dCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIHB1cnBvc2Ugb2YgY3BwY19mZmhfY3NyX3Jl
YWQoKSBpcyB0byBjYWxjdWxhdGUgdGhlIGFjdHVhbAo+ID4gPiA+ID4gZnJlcXVlbmN5IG9mIHRo
ZSBDUFUsIHdoaWNoIGlzIGRlbHRhX0NTUl9DWUNMRS9kZWx0YV9DU1JfWFhYLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IENTUl9YWFggc2hvdWxkIGJlIGEgcmVmZXJlbmNlIGNsb2NrIGFuZCBkb2VzIG5v
dCBjb3VudCBkdXJpbmcgV0ZJCj4gPiA+ID4gPiAoV2FpdCBGb3IgSW50ZXJydXB0KS4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBTaW1pbGFyIHNvbHV0aW9ucyBpbmNsdWRlOiB4ODYncyBhcGVyZi9tcGVy
ZiwgYW5kIEFSTTY0J3MgQU1VIHdpdGgKPiA+ID4gPiA+IHJlZ2lzdGVycyBTWVNfQU1FVkNOVFIw
X0NPUkVfRUwwL1NZU19BTUVWQ05UUjBfQ09OU1RfRUwwLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhv
d2V2ZXIsIHdlIGtub3cgdGhhdCBDU1JfVElNRSBpbiB0aGUgY3VycmVudCBjb2RlIGRvZXMgY291
bnQgZHVyaW5nCj4gPiA+ID4gPiBXRkkuIFNvLCBpcyB0aGlzIGRlc2lnbiB1bnJlYXNvbmFibGU/
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gU2hvdWxkIHdlIGNvbnNpZGVyIHByb3Bvc2luZyBhbiBleHRl
bnNpb24gdG8gc3VwcG9ydCBzdWNoIGEgZGVkaWNhdGVkCj4gPiA+ID4gPiBjb3VudGVyIChhIHJl
ZmVyZW5jZSBjbG9jayB0aGF0IGRvZXMgbm90IGNvdW50IGR1cmluZyBXRkkpPyBUaGlzIHdheSwK
PiA+ID4gPiA+IHRoZSB2YWx1ZSBjYW4gYmUgb2J0YWluZWQgZGlyZWN0bHkgaW4gUy1tb2RlIHdp
dGhvdXQgdHJhcHBpbmcgdG8KPiA+ID4gPiA+IE0tbW9kZSwgZXNwZWNpYWxseSBzaW5jZSByZWFk
aW5nIHRoaXMgY291bnRlciBpcyB2ZXJ5IGZyZXF1ZW50Lgo+ID4gPiA+ID4KPiA+ID4gPiBIaSBZ
dW5odWksCj4gPiA+ID4KPiA+ID4gPiBZZXMsIGJ1dCB3ZSBhbnRpY2lwYXRlZCB0aGF0IHZlbmRv
cnMgbWlnaHQgZGVmaW5lIHRoZWlyIG93biBjdXN0b20gQ1NScy4KPiA+ID4gPiBTbywgd2UgaW50
cm9kdWNlZCBGRkggZW5jb2RpbmcgdG8gYWNjb21tb2RhdGUgc3VjaCBjYXNlcy4KPiA+ID4gPgo+
ID4gPiA+IFRoYW5rcywKPiA+ID4gPiBTdW5pbAo+ID4gPgo+ID4gPiBBcyBtZW50aW9uZWQgZWFy
bGllciwgaXQgaXMgYmVzdCB0byBkaXJlY3RseSByZWFkIENTUl9YWFggKGEgcmVmZXJlbmNlCj4g
PiA+IGNsb2NrIHRoYXQgZG9lcyBub3QgY291bnQgZHVyaW5nIFdGSSkgYW5kIENTUl9DWUNMRSBp
biBTLW1vZGUsIHJhdGhlcgo+ID4gPiB0aGFuIHRyYXBwaW5nIHRvIFNCSS4KPiA+ID4KPiA+IE5v
LiBJIG1lYW50IGRpcmVjdCBDU1IgYWNjZXNzIGl0c2VsZiBub3QgU0JJLiBQbGVhc2UgdGFrZSBh
IGxvb2sgYXQKPiA+IFRhYmxlIDYgb2YgUklTQy1WIEZGSCBzcGVjLgo+ID4KPiA+ID4gZHJpdmVy
cy9hY3BpL3Jpc2N2L2NwcGMuYyBpcyBhIGdlbmVyaWMgZHJpdmVyIHRoYXQgaXMgbm90IHNwZWNp
ZmljIHRvCj4gPiA+IGFueSB2ZW5kb3IuIEN1cnJlbnRseSwgdGhlIHVwc3RyZWFtIGNvZGUgYWxy
ZWFkeSB1c2VzIENTUl9USU1FLCBhbmQKPiA+ID4gdGhlIGxvZ2ljIG9mIENTUl9USU1FIGlzIGlu
Y29ycmVjdC4KPiA+ID4KQUNQSSBzcGVjIGZvciAiUmVmZXJlbmNlIFBlcmZvcm1hbmNlIFJlZ2lz
dGVyIiBzYXlzLAoKIlRoZSBSZWZlcmVuY2UgUGVyZm9ybWFuY2UgQ291bnRlciBSZWdpc3RlciBj
b3VudHMgYXQgYSBmaXhlZCByYXRlIGFueQp0aW1lIHRoZSBwcm9jZXNzb3IgaXMgYWN0aXZlLiBJ
dCBpcyBub3QgYWZmZWN0ZWQgYnkgY2hhbmdlcyB0byBEZXNpcmVkClBlcmZvcm1hbmNlLCBwcm9j
ZXNzb3IgdGhyb3R0bGluZywgZXRjLiIKCj4gPiBDU1JfVElNRSBpcyBqdXN0IGFuIGV4YW1wbGUu
IEl0IGlzIHVwdG8gdGhlIHZlbmRvciBob3cgX0NQQyBvYmplY3RzIGFyZQo+ID4gZW5jb2RlZCB1
c2luZyBGRkguIFRoZSBsaW51eCBjb2RlIGRvZXNuJ3QgbWVhbiBvbmUgc2hvdWxkIHVzZSBDU1Jf
VElNRQo+ID4gYWx3YXlzLgo+IAo+IEZpcnN0LCB0aGUgZXhhbXBsZSBvZiBDU1JfVElNRSBpcyBp
bmNvcnJlY3QuIFdoYXQgaXMgbmVlZGVkIGlzIGEKPiBDU1JfWFhYIChhIHJlZmVyZW5jZSBjbG9j
ayB0aGF0IGRvZXMgbm90IGNvdW50IGR1cmluZyBXRkkpLgo+IAo+IFNlY29uZCwgeW91IG1lbnRp
b25lZCB0aGF0IGVhY2ggdmVuZG9yIGNhbiBjdXN0b21pemUgdGhlaXIgb3duCj4gaW1wbGVtZW50
YXRpb25zLiBCdXQgc2hvdWxkIGFsbCB2ZW5kb3JzJyBDU1JfWFhYL1lZWS8uLi4gYmUgYWRkZWQg
dG8KPiBkcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jPyBTaG91bGRu4oCZdCBkcml2ZXJzL2FjcGkv
cmlzY3YvY3BwYy5jIGZhbGwKPiB1bmRlciB0aGUgc2NvcGUgZGVmaW5lZCBieSB0aGUgUklTQy1W
IGFyY2hpdGVjdHVyZT8KPiAKTm8uIE9uZSBjYW4gaW1wbGVtZW50IHNpbWlsYXIgdG8gY3NyX3Jl
YWRfbnVtKCkgaW4gb3BlbnNiaS4gV2UgZGlkbid0CmFkZCBpdCBzaW5jZSB0aGVyZSB3YXMgbm8g
SFcgaW1wbGVtZW50aW5nIHN1Y2ggdGhpbmcuIFdoYXQgSSBhbQpzYXlpbmcgaXMgd2UgaGF2ZSBG
RkggZW5jb2RpbmcgdG8gc3VwcG9ydCBzdWNoIGNhc2UuCgo+ID4KPiA+ID4gSXQgd291bGQgYmUg
YmVzdCB0byBwcm9tb3RlIGEgc3BlY2lmaWNhdGlvbiB0byBzdXBwb3J0IENTUl9YWFgsIGp1c3QK
PiA+ID4gbGlrZSB3aGF0IGhhcyBiZWVuIGRvbmUgZm9yIHg4NiBhbmQgYXJtNjQuIFdoYXQgZG8g
eW91IHRoaW5rPwo+ID4gPgo+ID4gV291bGRuJ3QgYWJvdmUgd29yaz8gRm9yIGEgc3RhbmRhcmQg
ZXh0ZW5zaW9uLCB5b3UgbWF5IGhhdmUgdG8gcHJvdmlkZQo+ID4gbW9yZSBkYXRhIHdpdGggYWN0
dWFsIEhXLgo+IAo+IFRoaXMgd29u4oCZdCB3b3JrLiBNYXkgSSBhc2sgaG93IHRoZSBjdXJyZW50
IHVwc3RyZWFtIGNvZGUgY2FuIGNhbGN1bGF0ZQo+IHRoZSBhY3R1YWwgQ1BVIGZyZXF1ZW5jeSB1
c2luZyBDU1JfVElNRSB3aXRob3V0IHRyYXBwaW5nIHRvIFNCST8KPiBUaGlzIGlzIGEgdGhlb3Jl
dGljYWwgbG9naWNhbCBpc3N1ZS4gV2h5IGlzIGRhdGEgbmVlZGVkIGhlcmU/Cj4gCkFzIEkgbWVu
dGlvbmVkIGFib3ZlLCBvbmUgY2FuIGltcGxlbWVudCBhIGdlbmVyaWMgQ1NSIHJlYWQgd2l0aG91
dAp0cmFwcGluZyB0byBTQkkuCgo+IENvdWxkIHlvdSB0YWtlIGEgbG9vayBhdCB0aGUgIkFNVSBl
dmVudHMgYW5kIGV2ZW50IG51bWJlcnMiIGNoYXB0ZXIgaW4KPiB0aGUgQVJNNjQgbWFudWFsPwo+
IApBcy1wZXIgQUNQSSBzcGVjIHJlZmVyZW5jZSBwZXJmb3JtYW5jZSBjb3VudGVyIGlzIG5vdCBh
ZmZlY3RlZCBieSBDUFUKc3RhdGUuIFRoZSBSSVNDLVYgRkZIIGVuY29kaW5nIGlzIHN1ZmZpY2ll
bnRseSBnZW5lcmljIHRvIHN1cHBvcnQgdGhpcwpyZXF1aXJlbWVudCwgZXZlbiBpZiB0aGUgc3Rh
bmRhcmQgQ1NSX1RJTUUgY2Fubm90IGJlIHVzZWQuIEluIHN1Y2gKY2FzZXMsIGFuIGFsdGVybmF0
aXZlIENTUiBjYW4gYmUgZW5jb2RlZGVkLCBhY2Nlc3NlZCB2aWEgYW4gT1MtbGV2ZWwKYWJzdHJh
Y3Rpb24gc3VjaCBhcyBjc3JfcmVhZF9udW0oKS4KClRoYW5rcywKU3VuaWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
