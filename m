Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68D2C19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 01:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzwSTs6WTPhNL9+rbqrJNnjmodYWwvcorGz+5vLzBK0=; b=SuhiNjYjUW/5/b
	8yi5ejIxz7OhAj5ah1k4IqjzbURgCbkL8cdnbzjSd1vbUVfmy+b9u+pNgXYGINNIKzuIhiesxZSyj
	3VxHFlou8d7luCJdN78Ya9+FSHq/0p98y5vN0cw8c4M9VrYpUAtjuNLGXGOllE4lN4RsPJQgZkuyP
	8SP8cY433clTcUNFJ8OITATU3QkUU/g+mxZSGWtUkRrGmM6QsM1c2RGi3ZnkaZuI/hPtqHUOTV4MC
	7feCFMfzztSfG09NBnrQs9X5tn7/k/AdC8TBg/DfCOXO/BeBqQIhtHFcO3tjWbxujOOJjqRrb0cTB
	FXvlRaqF1Dh6Si3rOP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4W3M-0000000Ddi6-0IvE;
	Wed, 08 May 2024 01:25:04 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4W3H-0000000DdhK-40rj
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 01:25:02 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6f44bcbaae7so2898209b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 18:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715131498; x=1715736298; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IhsVJPabx4zntlcqdXyDkSXBtwoq5OQdKJovK8JOcUw=;
        b=FPyc+YREP4waub/p72424F64fGSHhTObQv3WM8WycIfh1K+MEQ9qITytoUnX93JVr1
         flFawA4LUiBg0M/7jjyB0L7LSZBXd6vqrtav5VrsWeft4dTIKcAfcP0AM7B8Vfdra6aX
         KHeebbAE4d1tKkH9lUMIzJbh1SIJa7WighavQaOBvFfskKLlCsv9tgd/luPyLI6zt3sO
         xjvLtZn5uAa1LOxc/jv+z8LvLQDdWslYPZI2OVtgDA8xjbqTEuh61bw5mjhnr0cvJpS+
         za1PbzBpy98FpYWYtwQk0wryccAc9B74NywJkxGvhOJaOOxcSB/gd7XMofK19r+g+oZw
         Y6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715131498; x=1715736298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhsVJPabx4zntlcqdXyDkSXBtwoq5OQdKJovK8JOcUw=;
        b=CQaie7YPSF5Kl6MQHCOIMJxBpeJQ8Oe6A9zS01WY0WB/CHPP2JoVLrHW4mMJ3rFG9N
         tAPAazCHtOxlWEfNbVpocyNJKPBOAf2N7QVZzetkpsU2JjSnhbuBKxl1bKKdSJjfyCdZ
         sAyMJsZHJZPH96mNDN66UYh9np5JjmND5dTbzVRHjqAkDHLK9ZKTbor/20hxrBV+A6Jx
         OIhihXvgNgiWpqyKxa53blNAUbcAYyS3/gI2pH9B+6gqKPanPgpitNMyUOFQjWKHQG61
         +tx4hg8x3PXm8jFT4V7jFJjh6q8da7E2SBt4eT01dhETUCx8n1S7xqxO5zdijAOj7weK
         RWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCURjHoQ77THUZgmDBujpX+z/LWFLGvenOVQvs0bHEfTivrKb2N2Ou7eQYSynIDpkM4X6XJEASL5dg1H00nmueSYKN7ggiYmLGeZEArMcyes
X-Gm-Message-State: AOJu0YzgUXWxJEz0Ja0OmHDcIfUy9mQE9CJ8cLz5Y0eFT30SWGYptBKq
	ApeC7tbBBbSAC6uvE4pEXjZ+u29hL+38y3OIiZD1gLdBy/rPBbw9z05QycmicxI=
X-Google-Smtp-Source: AGHT+IGxrKToRQGeaQOwoFRE1tTJUZMCY6maIjnf3I2s/xOfXSlGbLBrlOsT6whlD51sZanOujXO3g==
X-Received: by 2002:a05:6a20:7f9d:b0:1ad:7e4d:2ea6 with SMTP id adf61e73a8af0-1afc8d39d69mr1707444637.20.1715131497690;
        Tue, 07 May 2024 18:24:57 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:cc75:5174:3d13:7280])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090a1f4900b002b15a672805sm191510pjy.23.2024.05.07.18.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 18:24:57 -0700 (PDT)
Date: Tue, 7 May 2024 18:24:55 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Song Liu <song@kernel.org>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_SVPBMT
 Kconfig option
Message-ID: <ZjrUZ9y45zL7yqex@ghost>
References: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
 <20240506-compile_kernel_with_extensions-v1-4-5c25c134c097@rivosinc.com>
 <11F5B269-05DD-448E-9F85-878E84A5654F@jrtc27.com>
 <ZjqRcsheypWX14yy@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjqRcsheypWX14yy@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_182500_151158_20DF0861 
X-CRM114-Status: GOOD (  34.70  )
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

T24gVHVlLCBNYXkgMDcsIDIwMjQgYXQgMDE6Mzk6MTRQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDA3LCAyMDI0IGF0IDA2OjQwOjUyQU0gKzAxMDAsIEplc3Np
Y2EgQ2xhcmtlIHdyb3RlOgo+ID4gT24gNyBNYXkgMjAyNCwgYXQgMDI6NDAsIENoYXJsaWUgSmVu
a2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiAKPiA+ID4gU3ZwYm10IHdv
dWxkIG5vdCBiZW5lZml0IGZyb20gaGF2aW5nIFBMQVRGT1JNX1NVUFBPUlRTX1JJU0NWX0lTQV9T
VlBCTVQKPiA+ID4gc28ganVzdCByZW5hbWUgUklTQ1ZfSVNBX1NWUEJNVCB0byBQTEFURk9STV9N
QVlfU1VQUE9SVF9SSVNDVl9JU0FfU1ZQQk1UCj4gPiA+IGFuZCBtb3ZlIHRoZSBkZWZpbml0aW9u
IHRvIEtjb25maWcuaXNhLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5r
aW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+ID4gLS0tCj4gPiA+IGFyY2gvcmlzY3YvS2Nv
bmZpZyAgICAgfCAxNyAtLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiBhcmNoL3Jpc2N2L0tjb25maWcu
aXNhIHwgMTcgKysrKysrKysrKysrKysrKysKPiA+ID4gMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4gaW5kZXggOWMzYTQzNDc5
NTNiLi4yMjMwM2EzYWI1OWUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+
ID4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4gQEAgLTQ4NCwyMyArNDg0LDYgQEAg
Y29uZmlnIFJJU0NWX0FMVEVSTkFUSVZFX0VBUkxZCj4gPiA+IGhlbHAKPiA+ID4gIEFsbG93cyBl
YXJseSBwYXRjaGluZyBvZiB0aGUga2VybmVsIGZvciBzcGVjaWFsIGVycmF0YQo+ID4gPiAKPiA+
ID4gLWNvbmZpZyBSSVNDVl9JU0FfU1ZQQk1UCj4gPiA+IC0gYm9vbCAiU3ZwYm10IGV4dGVuc2lv
biBzdXBwb3J0IGZvciBzdXBlcnZpc29yIG1vZGUgcGFnZS1iYXNlZCBtZW1vcnkgdHlwZXMiCj4g
PiA+IC0gZGVwZW5kcyBvbiA2NEJJVCAmJiBNTVUKPiA+ID4gLSBkZXBlbmRzIG9uIFJJU0NWX0FM
VEVSTkFUSVZFCj4gPiA+IC0gZGVmYXVsdCB5Cj4gPiA+IC0gaGVscAo+ID4gPiAtICAgQWRkIHN1
cHBvcnQgZm9yIHRoZSBTdnBibXQgSVNBLWV4dGVuc2lvbiAoU3VwZXJ2aXNvci1tb2RlOgo+ID4g
PiAtICAgcGFnZS1iYXNlZCBtZW1vcnkgdHlwZXMpIGluIHRoZSBrZXJuZWwgd2hlbiBpdCBpcyBk
ZXRlY3RlZCBhdCBib290Lgo+ID4gPiAtCj4gPiA+IC0gICBUaGUgbWVtb3J5IHR5cGUgZm9yIGEg
cGFnZSBjb250YWlucyBhIGNvbWJpbmF0aW9uIG9mIGF0dHJpYnV0ZXMKPiA+ID4gLSAgIHRoYXQg
aW5kaWNhdGUgdGhlIGNhY2hlYWJpbGl0eSwgaWRlbXBvdGVuY3ksIGFuZCBvcmRlcmluZwo+ID4g
PiAtICAgcHJvcGVydGllcyBmb3IgYWNjZXNzIHRvIHRoYXQgcGFnZS4KPiA+ID4gLQo+ID4gPiAt
ICAgVGhlIFN2cGJtdCBleHRlbnNpb24gaXMgb25seSBhdmFpbGFibGUgb24gNjQtYml0IGNwdXMu
Cj4gPiA+IC0KPiA+ID4gLSAgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5
IFkuCj4gPiA+IC0KPiA+ID4gY29uZmlnIFRPT0xDSEFJTl9IQVNfWkJCCj4gPiA+IGJvb2wKPiA+
ID4gZGVmYXVsdCB5Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuaXNhIGIv
YXJjaC9yaXNjdi9LY29uZmlnLmlzYQo+ID4gPiBpbmRleCAzNzU4NWJjZDc2M2UuLjUwZTIxN2Rj
NTcxOSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnLmlzYQo+ID4gPiArKysg
Yi9hcmNoL3Jpc2N2L0tjb25maWcuaXNhCj4gPiA+IEBAIC0xNjgsMyArMTY4LDIwIEBAIGNvbmZp
ZyBQTEFURk9STV9TVVBQT1JUU19SSVNDVl9JU0FfU1ZOQVBPVAo+ID4gPiAgbm90IHN1cHBvcnQg
U3ZuYXBvdC4KPiA+ID4gCj4gPiA+IGVuZGNob2ljZQo+ID4gPiArCj4gPiA+ICtjb25maWcgUklT
Q1ZfSVNBX1NWUEJNVAo+ID4gCj4gPiBIaSBDaGFybGllLAo+ID4gRGVzcGl0ZSB0aGUgc3ViamVj
dCBhbmQgYm9keSB5b3UgaGF2ZW7igJl0IHJlbmFtZWQgaXQgaW4gdGhpcyBwYXRjaD8KPiAKPiBJ
IGRpZG4ndCBkbyBhIGdvb2Qgam9iIGF0IGV4cGxhaW5pbmcgZXhhY3RseSB3aGF0J3MgaGFwcGVu
aW5nIGhlcmUuIFRoZQo+IGNvbmZpZyBvcHRpb24gIlBMQVRGT1JNX01BWV9TVVBQT1JUX1JJU0NW
X0lTQV9TVlBCTVQiIG1vc3QgY2xvc2VseQo+IGZvbGxvd3MgdGhlIHNlbWFudGljcyBvZiB3aGF0
ICJSSVNDVl9JU0FfU1ZQQk1UIiBwcmV2aW91c2x5IHdhcy4gVGhpcwo+IHBhdGNoIGNoYW5nZXMg
IlJJU0NWX0lTQV9TVlBCTVQiIHRvIG1lYW4gdGhhdCBlaXRoZXIKPiBQTEFURk9STV9NQVlfU1VQ
UE9SVF9SSVNDVl9JU0FfU1ZQQk1UIG9yCj4gUExBVEZPUk1fU1VQUE9SVFNfUklTQ1ZfSVNBX1NW
TkFQT1Qgd2FzIHNlbGVjdGVkLgoKRGlzcmVnYXJkIHdoYXQgSSBzYWlkLi4uIEkgd2FzIHRoaW5r
aW5nIGFib3V0IHRoZSBvdGhlciBleHRlbnNpb25zIGFuZApmb3Jnb3QgdGhpcyBvbmUgd2FzIGRp
ZmZlcmVudC4gVGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dCEgSSBuZWVkCnRvIGNoYW5n
ZSB0aGlzIGRlc2NyaXB0aW9uIHRvIGp1c3Qgc2F5IHRoYXQgdGhlIGRlZmluaXRpb24gbW92ZWQg
dG8KS2NvbmZpZy5pc2EuCgotIENoYXJsaWUKCj4gCj4gLSBDaGFybGllCj4gCj4gPiAKPiA+IEpl
c3MKPiA+IAo+ID4gPiArIGJvb2wgIlN2cGJtdCBleHRlbnNpb24gc3VwcG9ydCBmb3Igc3VwZXJ2
aXNvciBtb2RlIHBhZ2UtYmFzZWQgbWVtb3J5IHR5cGVzIgo+ID4gPiArIGRlcGVuZHMgb24gNjRC
SVQgJiYgTU1VCj4gPiA+ICsgZGVwZW5kcyBvbiBSSVNDVl9BTFRFUk5BVElWRQo+ID4gPiArIGRl
ZmF1bHQgeQo+ID4gPiArIGhlbHAKPiA+ID4gKyAgIEFkZCBzdXBwb3J0IGZvciB0aGUgU3ZwYm10
IElTQS1leHRlbnNpb24gKFN1cGVydmlzb3ItbW9kZToKPiA+ID4gKyAgIHBhZ2UtYmFzZWQgbWVt
b3J5IHR5cGVzKSBpbiB0aGUga2VybmVsIHdoZW4gaXQgaXMgZGV0ZWN0ZWQgYXQgYm9vdC4KPiA+
ID4gKwo+ID4gPiArICAgVGhlIG1lbW9yeSB0eXBlIGZvciBhIHBhZ2UgY29udGFpbnMgYSBjb21i
aW5hdGlvbiBvZiBhdHRyaWJ1dGVzCj4gPiA+ICsgICB0aGF0IGluZGljYXRlIHRoZSBjYWNoZWFi
aWxpdHksIGlkZW1wb3RlbmN5LCBhbmQgb3JkZXJpbmcKPiA+ID4gKyAgIHByb3BlcnRpZXMgZm9y
IGFjY2VzcyB0byB0aGF0IHBhZ2UuCj4gPiA+ICsKPiA+ID4gKyAgIFRoZSBTdnBibXQgZXh0ZW5z
aW9uIGlzIG9ubHkgYXZhaWxhYmxlIG9uIDY0LWJpdCBjcHVzLgo+ID4gPiArCj4gPiA+ICsgICBJ
ZiB5b3UgZG9uJ3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSBZLgo+ID4gPiAKPiA+ID4gLS0g
Cj4gPiA+IDIuNDQuMAo+ID4gPiAKPiA+ID4gCj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
ID4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiA+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
