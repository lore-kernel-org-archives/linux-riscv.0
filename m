Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76A1CA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Q8iFbqJwPgr0NrumCHjhEK1KjpAvWoC88CiPNtQ7NE=; b=TfOU/IQ5alovef
	hUocj5u3Me+HDe8ynWjekPlWedON8ZS7hGVx5Zyoacx0/fLPTlRaBRybbGkul5I4jVsNFtinGB5iN
	3liKahAubWqE0LhmLx62BV0X/CcZzGo5YwsQ80naIfZ9nyY5s8mTYGoY3XgQjXDNWoWIDIs3crIoM
	2fQx6zdoT2DZ6Mc4AD6hjg0r0Gh2O3BHMAMF1caGLJLnKNZBRt+zGdBT7bruo3tr/aqQ98L+I1GAu
	ivVOY8f8U5917vvJQtt2q0NMvckd998mJXJGVV2GyWh1CwDQnWHemzbnKFA2u0qDVz4A/XYIlj+JW
	I9Im5VRaQjx0HdaBh3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBKJ-0000000DjeM-2V7P;
	Wed, 13 Aug 2025 13:15:35 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAIz-0000000Dbbi-0cH0
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 12:10:10 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76a3818eb9bso6018176b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 05:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755087008; x=1755691808; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ctp2F52pKzxtNKgofgxeub03+NpKxh47PZGccoc1Vw=;
        b=iZOZDcWhOn/KJQKy9RN8DKKpnFitp4s/UB54B6rxcME5k0CLyYuX5xtprrBTh+oqi1
         lp5N8mf1wjSNmHwhtBdSR5iRwYYLq7lmY9zkk7f0QlWoASZMS+XxBWu0hZnCIBYat7iN
         2ykBHXZ0VkVgUqeAUjVHSZQSa94P/g+uwUX1NLm7D0yeaDX6jbo0mNuXeF9i5jwED/K4
         2FRMbCVXGUWZPQbv6WnYIaBpa9ZwkaVEcnrWhJXbVXBH8QqcGoXyNoCBHd1dISIUkAd8
         DHHcwvCL2vFqlfom5t1PaSBhrvFhLpebgxfh6b5+V4EuJpKv9rv0Hz+zkh09RDUrh67B
         zAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755087008; x=1755691808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ctp2F52pKzxtNKgofgxeub03+NpKxh47PZGccoc1Vw=;
        b=Os57EG2xNNNsGcIEDQ7x60ukee1kWweMBAq0Q2Ss+LYYmZk7ExoZ2QJWlYfocZ7uRE
         bLr2NV+JPlcYNgqKFm4L/LtOYIr4V97qXpBLjOaVvqr8I+Av0EVbM7Fn3dHcDB/9At6t
         lGLubPbnz663Twwj1I17cR79XrbXn9VulgB5TxEOoz3t1mxj1O+QFdYwHicDAzHOg2yW
         v8G2Jz1FeHfzu8u5vEP+K5R+EIOznOIT+orJeaDFG5sMVt9w9N1D/V36zH6gk/XV/sS7
         MjuPOASihC2a/UjMKsGRoQZB+SFJHs/WzV9PAGa2FIJ20hiInqFCZV036ZQhGtaj3rRs
         IXQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV73yqTI2f+V2zqmlKacpJJsms+nSzAMPGW17kl3q01CUGcTSSaX+78gzg5bU+Yr97RZgDvYsWybI1Y6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGO6Os8uVVaFi8Qe9gM2ztzEZc1jFxQ8nUOahLU4Lf0uiNyCKV
	5zsrgnimrlrfW2D8FnvETCtG+npLBVz/KdOJtbur2Ve9BAsGoETsAydvVMriZo2KKi4=
X-Gm-Gg: ASbGncvnTzBSHJm+hrAaxKyJF3d2A9XIZcO9GCUvmimavdliTpfhsOutbEmSxdOAxkb
	tSZ7VNOqV64M3FdeOGCYz7lwUnBZSFQwA+/JaNoOh8GqroPD2p8BmTrFI/pKi1QRNRzNyy0Itd2
	ygBF2WwUUhVFvZzP1Lsu3SO5ZLzi1FVF/5SaNEvpAF6ro+pqzTNUQgebhu7bkrH4jzLxrm3Xfg8
	miT6m3fetORnpOytFUdmH9Aiyr9ug8UFNC10GCyr+GVBUNnnOVS6284ZVHGB+6Gnk/8pbvv/zLc
	h3FTLBI+/I6tuAU23wdAx0FhCS3E3iwmE8oHPWyVpgc7If6Q4DvKC3l3tn+f0FbeyfNfeZvNpHA
	p67Blly0+jzJ+j+reb8sP99DEUec=
X-Google-Smtp-Source: AGHT+IH0C1/qTJWpzJOf6elM3dBIKaaS5s0expNMa5K6zOI/s22YABkFFQ9Tsn3lSLcl6u9YJxSYzQ==
X-Received: by 2002:a05:6a00:848:b0:748:f854:b765 with SMTP id d2e1a72fcca58-76e20c9a0dcmr4330521b3a.4.1755087007920;
        Wed, 13 Aug 2025 05:10:07 -0700 (PDT)
Received: from sunil-laptop ([106.51.199.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe9003sm31729375b3a.125.2025.08.13.05.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 05:10:07 -0700 (PDT)
Date: Wed, 13 Aug 2025 17:39:58 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: =?utf-8?B?6Z6g5paH6b6Z?= <juwenlong@bytedance.com>
Cc: yunhui cui <cuiyunhui@bytedance.com>, rafael@kernel.org,
	lenb@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>
Subject: Re: [External] Re: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for
 CPPC FFH
Message-ID: <aJyAlqd3U5Jq9ipy@sunil-laptop>
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
 <aJs-aPH32OxpzR3G@sunil-laptop>
 <CAEEQ3wnHFPBPC0U59rDBJaZYxJ24uJzJ7NDQO0gfmVqoiQwNOw@mail.gmail.com>
 <aJtKZhvNX0p3obFw@sunil-laptop>
 <CAEEQ3wmomscuAzuiRyJu4ha8tiM=s1Y-ytQROPTWr1DScMNL3g@mail.gmail.com>
 <aJwiXKWXik8BmpL8@sunil-laptop>
 <CAHEos+Msmta3o-HvXoigmJGbD48333Kh8tU3j2D=w_G8gL+OQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHEos+Msmta3o-HvXoigmJGbD48333Kh8tU3j2D=w_G8gL+OQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_051009_187365_C325A2A6 
X-CRM114-Status: GOOD (  42.10  )
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

T24gV2VkLCBBdWcgMTMsIDIwMjUgYXQgMTI6MDY6MTFBTSAtMDcwMCwg6Z6g5paH6b6ZIHdyb3Rl
Ogo+IEhpIFN1bmls77yMCj4gCj4gPiBGcm9tOiAiU3VuaWwgViBMIjxzdW5pbHZsQHZlbnRhbmFt
aWNyby5jb20+Cj4gPiBEYXRlOsKgIFdlZCwgQXVnIDEzLCAyMDI1LCAxMzoyOAo+ID4gU3ViamVj
dDrCoCBSZTogW0V4dGVybmFsXSBSZTogW1BBVENIXSBBQ1BJOiBSSVNDLVY6IENQUEM6IEFkZCBD
U1JfQ1lDTEUgZm9yIENQUEMgRkZICj4gPiBUbzogInl1bmh1aSBjdWkiPGN1aXl1bmh1aUBieXRl
ZGFuY2UuY29tPgo+ID4gQ2M6IDxyYWZhZWxAa2VybmVsLm9yZz4sIDxsZW5iQGtlcm5lbC5vcmc+
LCA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPiwgPHBhbG1lckBkYWJiZWx0LmNvbT4sIDxhb3VA
ZWVjcy5iZXJrZWxleS5lZHU+LCA8YWxleEBnaGl0aS5mcj4sIDxsaW51eC1hY3BpQHZnZXIua2Vy
bmVsLm9yZz4sIDxsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnPiwgPGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc+LCAiQW51cCBQYXRlbCI8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
LCAiUmFodWwgUGF0aGFrIjxycGF0aGFrQHZlbnRhbmFtaWNyby5jb20+LCA8anV3ZW5sb25nQGJ5
dGVkYW5jZS5jb20+Cj4gPiBIaSBZdW5odWksCj4gPgo+ID4KPiA+IE9uIFdlZCwgQXVnIDEzLCAy
MDI1IGF0IDExOjIzOjM5QU0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiA+IEhpIFN1bmls
LAo+ID4gPgo+ID4gPiBPbiBUdWUsIEF1ZyAxMiwgMjAyNSBhdCAxMDowNuKAr1BNIFN1bmlsIFYg
TCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gWy4uLl0KPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoZSBwdXJwb3NlIG9mIGNwcGNfZmZoX2Nzcl9yZWFk
KCkgaXMgdG8gY2FsY3VsYXRlIHRoZSBhY3R1YWwKPiA+ID4gPiA+ID4gPiBmcmVxdWVuY3kgb2Yg
dGhlIENQVSwgd2hpY2ggaXMgZGVsdGFfQ1NSX0NZQ0xFL2RlbHRhX0NTUl9YWFguCj4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiBDU1JfWFhYIHNob3VsZCBiZSBhIHJlZmVyZW5jZSBjbG9jayBh
bmQgZG9lcyBub3QgY291bnQgZHVyaW5nIFdGSQo+ID4gPiA+ID4gPiA+IChXYWl0IEZvciBJbnRl
cnJ1cHQpLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gU2ltaWxhciBzb2x1dGlvbnMgaW5j
bHVkZTogeDg2J3MgYXBlcmYvbXBlcmYsIGFuZCBBUk02NCdzIEFNVSB3aXRoCj4gPiA+ID4gPiA+
ID4gcmVnaXN0ZXJzIFNZU19BTUVWQ05UUjBfQ09SRV9FTDAvU1lTX0FNRVZDTlRSMF9DT05TVF9F
TDAuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBIb3dldmVyLCB3ZSBrbm93IHRoYXQgQ1NS
X1RJTUUgaW4gdGhlIGN1cnJlbnQgY29kZSBkb2VzIGNvdW50IGR1cmluZwo+ID4gPiA+ID4gPiA+
IFdGSS4gU28sIGlzIHRoaXMgZGVzaWduIHVucmVhc29uYWJsZT8KPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+IFNob3VsZCB3ZSBjb25zaWRlciBwcm9wb3NpbmcgYW4gZXh0ZW5zaW9uIHRvIHN1
cHBvcnQgc3VjaCBhIGRlZGljYXRlZAo+ID4gPiA+ID4gPiA+IGNvdW50ZXIgKGEgcmVmZXJlbmNl
IGNsb2NrIHRoYXQgZG9lcyBub3QgY291bnQgZHVyaW5nIFdGSSk/IFRoaXMgd2F5LAo+ID4gPiA+
ID4gPiA+IHRoZSB2YWx1ZSBjYW4gYmUgb2J0YWluZWQgZGlyZWN0bHkgaW4gUy1tb2RlIHdpdGhv
dXQgdHJhcHBpbmcgdG8KPiA+ID4gPiA+ID4gPiBNLW1vZGUsIGVzcGVjaWFsbHkgc2luY2UgcmVh
ZGluZyB0aGlzIGNvdW50ZXIgaXMgdmVyeSBmcmVxdWVudC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiBIaSBZdW5odWksCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFllcywgYnV0IHdlIGFudGlj
aXBhdGVkIHRoYXQgdmVuZG9ycyBtaWdodCBkZWZpbmUgdGhlaXIgb3duIGN1c3RvbSBDU1JzLgo+
ID4gPiA+ID4gPiBTbywgd2UgaW50cm9kdWNlZCBGRkggZW5jb2RpbmcgdG8gYWNjb21tb2RhdGUg
c3VjaCBjYXNlcy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+ID4gPiBT
dW5pbAo+ID4gPiA+ID4KPiA+ID4gPiA+IEFzIG1lbnRpb25lZCBlYXJsaWVyLCBpdCBpcyBiZXN0
IHRvIGRpcmVjdGx5IHJlYWQgQ1NSX1hYWCAoYSByZWZlcmVuY2UKPiA+ID4gPiA+IGNsb2NrIHRo
YXQgZG9lcyBub3QgY291bnQgZHVyaW5nIFdGSSkgYW5kIENTUl9DWUNMRSBpbiBTLW1vZGUsIHJh
dGhlcgo+ID4gPiA+ID4gdGhhbiB0cmFwcGluZyB0byBTQkkuCj4gPiA+ID4gPgo+ID4gPiA+IE5v
LiBJIG1lYW50IGRpcmVjdCBDU1IgYWNjZXNzIGl0c2VsZiBub3QgU0JJLiBQbGVhc2UgdGFrZSBh
IGxvb2sgYXQKPiA+ID4gPiBUYWJsZSA2IG9mIFJJU0MtViBGRkggc3BlYy4KPiA+ID4gPgo+ID4g
PiA+ID4gZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYyBpcyBhIGdlbmVyaWMgZHJpdmVyIHRoYXQg
aXMgbm90IHNwZWNpZmljIHRvCj4gPiA+ID4gPiBhbnkgdmVuZG9yLiBDdXJyZW50bHksIHRoZSB1
cHN0cmVhbSBjb2RlIGFscmVhZHkgdXNlcyBDU1JfVElNRSwgYW5kCj4gPiA+ID4gPiB0aGUgbG9n
aWMgb2YgQ1NSX1RJTUUgaXMgaW5jb3JyZWN0Lgo+ID4gPiA+ID4KPiA+IEFDUEkgc3BlYyBmb3Ig
IlJlZmVyZW5jZSBQZXJmb3JtYW5jZSBSZWdpc3RlciIgc2F5cywKPiA+Cj4gPgo+ID4gIlRoZSBS
ZWZlcmVuY2UgUGVyZm9ybWFuY2UgQ291bnRlciBSZWdpc3RlciBjb3VudHMgYXQgYSBmaXhlZCBy
YXRlIGFueQo+ID4gdGltZSB0aGUgcHJvY2Vzc29yIGlzIGFjdGl2ZS4gSXQgaXMgbm90IGFmZmVj
dGVkIGJ5IGNoYW5nZXMgdG8gRGVzaXJlZAo+ID4gUGVyZm9ybWFuY2UsIHByb2Nlc3NvciB0aHJv
dHRsaW5nLCBldGMuIgo+ID4KPiA+Cj4gPiA+ID4gQ1NSX1RJTUUgaXMganVzdCBhbiBleGFtcGxl
LiBJdCBpcyB1cHRvIHRoZSB2ZW5kb3IgaG93IF9DUEMgb2JqZWN0cyBhcmUKPiA+ID4gPiBlbmNv
ZGVkIHVzaW5nIEZGSC4gVGhlIGxpbnV4IGNvZGUgZG9lc24ndCBtZWFuIG9uZSBzaG91bGQgdXNl
IENTUl9USU1FCj4gPiA+ID4gYWx3YXlzLgo+ID4gPgo+ID4gPiBGaXJzdCwgdGhlIGV4YW1wbGUg
b2YgQ1NSX1RJTUUgaXMgaW5jb3JyZWN0LiBXaGF0IGlzIG5lZWRlZCBpcyBhCj4gPiA+IENTUl9Y
WFggKGEgcmVmZXJlbmNlIGNsb2NrIHRoYXQgZG9lcyBub3QgY291bnQgZHVyaW5nIFdGSSkuCj4g
PiA+Cj4gPiA+IFNlY29uZCwgeW91IG1lbnRpb25lZCB0aGF0IGVhY2ggdmVuZG9yIGNhbiBjdXN0
b21pemUgdGhlaXIgb3duCj4gPiA+IGltcGxlbWVudGF0aW9ucy4gQnV0IHNob3VsZCBhbGwgdmVu
ZG9ycycgQ1NSX1hYWC9ZWVkvLi4uIGJlIGFkZGVkIHRvCj4gPiA+IGRyaXZlcnMvYWNwaS9yaXNj
di9jcHBjLmM/IFNob3VsZG7igJl0IGRyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMgZmFsbAo+ID4g
PiB1bmRlciB0aGUgc2NvcGUgZGVmaW5lZCBieSB0aGUgUklTQy1WIGFyY2hpdGVjdHVyZT8KPiA+
ID4KPiA+IE5vLiBPbmUgY2FuIGltcGxlbWVudCBzaW1pbGFyIHRvIGNzcl9yZWFkX251bSgpIGlu
IG9wZW5zYmkuIFdlIGRpZG4ndAo+ID4gYWRkIGl0IHNpbmNlIHRoZXJlIHdhcyBubyBIVyBpbXBs
ZW1lbnRpbmcgc3VjaCB0aGluZy4gV2hhdCBJIGFtCj4gPiBzYXlpbmcgaXMgd2UgaGF2ZSBGRkgg
ZW5jb2RpbmcgdG8gc3VwcG9ydCBzdWNoIGNhc2UuCj4gPgo+ID4KPiA+ID4gPgo+ID4gPiA+ID4g
SXQgd291bGQgYmUgYmVzdCB0byBwcm9tb3RlIGEgc3BlY2lmaWNhdGlvbiB0byBzdXBwb3J0IENT
Ul9YWFgsIGp1c3QKPiA+ID4gPiA+IGxpa2Ugd2hhdCBoYXMgYmVlbiBkb25lIGZvciB4ODYgYW5k
IGFybTY0LiBXaGF0IGRvIHlvdSB0aGluaz8KPiA+ID4gPiA+Cj4gPiA+ID4gV291bGRuJ3QgYWJv
dmUgd29yaz8gRm9yIGEgc3RhbmRhcmQgZXh0ZW5zaW9uLCB5b3UgbWF5IGhhdmUgdG8gcHJvdmlk
ZQo+ID4gPiA+IG1vcmUgZGF0YSB3aXRoIGFjdHVhbCBIVy4KPiA+ID4KPiA+ID4gVGhpcyB3b27i
gJl0IHdvcmsuIE1heSBJIGFzayBob3cgdGhlIGN1cnJlbnQgdXBzdHJlYW0gY29kZSBjYW4gY2Fs
Y3VsYXRlCj4gPiA+IHRoZSBhY3R1YWwgQ1BVIGZyZXF1ZW5jeSB1c2luZyBDU1JfVElNRSB3aXRo
b3V0IHRyYXBwaW5nIHRvIFNCST8KPiA+ID4gVGhpcyBpcyBhIHRoZW9yZXRpY2FsIGxvZ2ljYWwg
aXNzdWUuIFdoeSBpcyBkYXRhIG5lZWRlZCBoZXJlPwo+ID4gPgo+ID4gQXMgSSBtZW50aW9uZWQg
YWJvdmUsIG9uZSBjYW4gaW1wbGVtZW50IGEgZ2VuZXJpYyBDU1IgcmVhZCB3aXRob3V0Cj4gPiB0
cmFwcGluZyB0byBTQkkuCj4gPgo+ID4KPiA+ID4gQ291bGQgeW91IHRha2UgYSBsb29rIGF0IHRo
ZSAiQU1VIGV2ZW50cyBhbmQgZXZlbnQgbnVtYmVycyIgY2hhcHRlciBpbgo+ID4gPiB0aGUgQVJN
NjQgbWFudWFsPwo+ID4gPgo+ID4gQXMtcGVyIEFDUEkgc3BlYyByZWZlcmVuY2UgcGVyZm9ybWFu
Y2UgY291bnRlciBpcyBub3QgYWZmZWN0ZWQgYnkgQ1BVCj4gPiBzdGF0ZS4gVGhlIFJJU0MtViBG
RkggZW5jb2RpbmcgaXMgc3VmZmljaWVudGx5IGdlbmVyaWMgdG8gc3VwcG9ydCB0aGlzCj4gPiBy
ZXF1aXJlbWVudCwgZXZlbiBpZiB0aGUgc3RhbmRhcmQgQ1NSX1RJTUUgY2Fubm90IGJlIHVzZWQu
IEluIHN1Y2gKPiA+IGNhc2VzLCBhbiBhbHRlcm5hdGl2ZSBDU1IgY2FuIGJlIGVuY29kZWRlZCwg
YWNjZXNzZWQgdmlhIGFuIE9TLWxldmVsCj4gPiBhYnN0cmFjdGlvbiBzdWNoIGFzIGNzcl9yZWFk
X251bSgpLgo+IMKgwqAgwqAgwqAgQXMtcGVyIEFDUEkgU3BlY++8jEJvdGggUmVmZXJlbmNlIHBl
cmZvcm1hbmNlIGNvdW50ZXIgcmVnaXN0ZXIKPiBhbmQgRGVsaXZlcmVkIFBlcmZvcm1hbmNlIENv
dW50ZXIgYXJlIGFmZmVjdGVkIGJ5IENQVQo+IHN0YXRl44CCRnJvbSBBQ1BJIFNwZWPvvIzigJxU
aGUgUmVmZXJlbmNlIFBlcmZvcm1hbmNlIENvdW50ZXIgUmVnaXN0ZXIKPiBjb3VudHMgYXQgYSBm
aXhlZCByYXRlIGFueSB0aW1lIHRoZSBwcm9jZXNzb3IgaXMgYWN0aXZlLuKAnQo+Cj4g4oCcVGhl
IERlbGl2ZXJlZCBQZXJmb3JtYW5jZSBDb3VudGVyIFJlZ2lzdGVyIGluY3JlbWVudHMgYW55IHRp
bWUgdGhlCj4gcHJvY2Vzc29yIGlzIGFjdGl2ZSwgYXQgYSByYXRlIHByb3BvcnRpb25hbCB0byB0
aGUgY3VycmVudCBwZXJmb3JtYW5jZQo+IGxldmVsLCB0YWtpbmcgaW50byBhY2NvdW50IGNoYW5n
ZXMgdG8gRGVzaXJlZCBQZXJmb3JtYW5jZeKAnQo+IOKAnCBQcm9jZXNzb3IgcG93ZXIgc3RhdGVz
IGluY2x1ZGUgYXJlIGRlc2lnbmF0ZWQgQzAsIEMxLCBDMiwgQzMsIC4gLiAuCj4gQ24uIFRoZSBD
MCBwb3dlciBzdGF0ZSBpcyBhbiBhY3RpdmUgcG93ZXIgc3RhdGUgd2hlcmUgdGhlIENQVSBleGVj
dXRlcwo+IGluc3RydWN0aW9ucy4gVGhlIEMxIHRocm91Z2ggQ24gcG93ZXIgc3RhdGVzIGFyZSBw
cm9jZXNzb3Igc2xlZXBpbmcKPiBzdGF0ZXMgd2hlcmUgdGhlIHByb2Nlc3NvciBjb25zdW1lcyBs
ZXNzIHBvd2VyIGFuZCBkaXNzaXBhdGVzIGxlc3MKPiBoZWF0IHRoYW4gbGVhdmluZyB0aGUgcHJv
Y2Vzc29yIGluIHRoZSBDMCBzdGF0ZeKAnS4gU28gdGhlIHRpbWUgY3NyIGNhbgo+IG5vdCBtZWV0
IHRoaXMgcmVxdWlyZW1lbnRzLndlIG5lZWQgYW5vdGhlciBjc3IsIGJ1dCBub3QgYXZhaWxpYWJs
ZSBmb3IKPiBub3cuRWl0aGVyIGltcGxlbWVudCBpdCBhcyB2ZW5kb3Itc3BlY2lmaWMgb3IgY3Jl
YXRlIGEgY29tbXVuaXR5Cj4gZXh0ZW5zaW9uIGZvciBhbGzvvJ8KPgpJdCBpcyB1cHRvIHRoZSBp
bnRlcnByZXRhdGlvbi4gSSBhbSBub3Qgc3VyZSB3aGF0IGlzICJhY3RpdmUiIG9yCiJldGMiIGlu
IHRoZSBiZWxvdyBzdGF0ZW1lbnQuCgoiVGhlIFJlZmVyZW5jZSBQZXJmb3JtYW5jZSBDb3VudGVy
IFJlZ2lzdGVyIGNvdW50cyBhdCBhIGZpeGVkIHJhdGUgYW55CnRpbWUgdGhlIHByb2Nlc3NvciBp
cyBhY3RpdmUuIEl0IGlzIG5vdCBhZmZlY3RlZCBieSBjaGFuZ2VzIHRvIERlc2lyZWQKUGVyZm9y
bWFuY2UsIHByb2Nlc3NvciB0aHJvdHRsaW5nLCBldGMuIgoKU2Vjb25kLCBJIGRvbid0IHNlZSBh
biBpc3N1ZSBpZiBib3RoIHJlZmVyZW5jZSBhbmQgZGVsaXZlcmVkIGNvdW50ZXJzCmluY3JlbWVu
dCBpcnJlc3BlY3RpdmUgb2YgaWRsZSBzdGF0ZSBiZWNhdXNlIHVsdGltYXRlbHkgdGhlIHJhdGlv
CmRlbHRhKGRlbGl2ZXJlZCkvZGVsdGEocmVmZXJlbmNlKSBtYXR0ZXJzIHdoaWNoIHdpbGwgYmUg
c2FtZSBpbiBlaXRoZXIKY2FzZS4KClRoYW5rcywKU3VuaWwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
