Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F9FC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xpl1L1+Lqm3NK20xFWdSsE4E2bIXZLDkYMzp3sdcFLk=; b=gKBtNL/7x+VttE
	Go3kAT/TC2AKoW5U52O+zZGSWMK253tJjlnacT8aN+kZ8gI9qIJXtkulD8I7djYqah6Crd00cZk1F
	BI8T3dVu8Ba9Pxo2SYZFK9gVD8ovwMVy2Ki2+Zm2HEfU2PI9kKvwgj3PNPSclDCmxvchsqqGy4fcK
	Oe75Kd586UofDmM9/4+eNqI/62OOHKZtZeRwocGda5ziIacbpIgrpEsdAXaaWDLUtgccem8PC580U
	eDIrPF546j1KkY7t8x7dPQw0LGwlpO35hXxRAAU/+4t9le3XhyI5kZ9iGRB4aZzRAkHbxpGdc9SWC
	lUiJnkyliqotzW9IKyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Ras-0000000CmBi-0Kvl;
	Tue, 07 May 2024 20:39:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Rao-0000000CmAz-43E4
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 20:39:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so1238595ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 13:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715114357; x=1715719157; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VhSbRGfOoucduAp+aZ4PaB9wtbK5SWAr+iQfIgYf3GI=;
        b=EFoxV4O0+tedpO+nqT0yKGejC2nQfdUZ0CR+KIgIVrH0llASLSkwj8/oyNPhbnmlUO
         llVM71t7Mpw80faVsQ6jX0COmoAdbojocwbByutB1FKaD6dvFvZ1yYXbrZ62oBmbyLJp
         S87uYdcbmjaanjF8TfVIHOaIu9n4Lg0X0/Wx4374pM41NkRLde2G+Ev+Tj5uqmUSVytD
         Uj1/+oxff4/fSTiQ3S48j+FEa1cfXhCz6MdaQDZfg0wr7Gchi8iDCu4B0moxAqei3/WC
         WZvFIUKqqkBxq4YWPSbh7uBSZCsn3A53+WCOLOLqTQ+6ncN6WIIkOyr0qh2RZlQFUOk5
         uhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715114357; x=1715719157;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhSbRGfOoucduAp+aZ4PaB9wtbK5SWAr+iQfIgYf3GI=;
        b=iXBchCHC17KohIjy1QkiOCgjA+8XWpOfpnKpDg6tUYwAw4kQ24nxeuVmVYpKfLm30h
         086lZbJlKqWTNKv5Dt0Ha9exWVBUyntezlFnpVsqUeJMgukksjRjp50XY+u6bTeWvFBL
         qUst+yIlQLwDeENUrJ2MjSwiAhN3uIzGXlsGGj/pP3WVTjrETnTH2LPjGubtrjivezqx
         VltyctH91vcgPg0hIrYf4tXTPMcfid7AQD97/YffOIcmdwcNPsaCGuSOrkorBp64Accp
         obAENU3xTAjV7DmlM45RSLIvfqt/ieU8Ass8149x8wOTtyqYNtus223y+szEi17PkEdR
         TDxw==
X-Forwarded-Encrypted: i=1; AJvYcCUI6nTgVlbNKP8BfsTaQKVgDLNcMRqImwv4cxinc/A8SyWYp9OxwZG07n4oGn1nDuXhHORpXRHIQRwcJZsWrumSexaPaHDPf5KzrpFmQReA
X-Gm-Message-State: AOJu0Yye24v4SP/bIo+6iWc1H5l/eO84Jw82c7oBjwX1rCLUo6Wvc1Ep
	mSgpammo7v+PYIgbPU8YE+DpOZ/HSB7d9TTvUS+MNmxYg1WO75VQP/cV78WMYxg=
X-Google-Smtp-Source: AGHT+IFaHdYG2nvp7SaQ4FsUul9QNBAlcLxFzSiFnUIkb2lOpFzVgTdqsoLSQiA01QLQ4FwSV8633A==
X-Received: by 2002:a17:902:e885:b0:1eb:101d:bf53 with SMTP id d9443c01a7336-1ee62f6693dmr56811175ad.1.1715114357069;
        Tue, 07 May 2024 13:39:17 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:9de1:32f1:3d81:10c7])
        by smtp.gmail.com with ESMTPSA id jb20-20020a170903259400b001dd88a5dc47sm10448619plb.290.2024.05.07.13.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 13:39:16 -0700 (PDT)
Date: Tue, 7 May 2024 13:39:14 -0700
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
Message-ID: <ZjqRcsheypWX14yy@ghost>
References: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
 <20240506-compile_kernel_with_extensions-v1-4-5c25c134c097@rivosinc.com>
 <11F5B269-05DD-448E-9F85-878E84A5654F@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11F5B269-05DD-448E-9F85-878E84A5654F@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_133919_030505_5F6329C7 
X-CRM114-Status: GOOD (  28.59  )
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

T24gVHVlLCBNYXkgMDcsIDIwMjQgYXQgMDY6NDA6NTJBTSArMDEwMCwgSmVzc2ljYSBDbGFya2Ug
d3JvdGU6Cj4gT24gNyBNYXkgMjAyNCwgYXQgMDI6NDAsIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gCj4gPiBTdnBibXQgd291bGQgbm90IGJlbmVmaXQg
ZnJvbSBoYXZpbmcgUExBVEZPUk1fU1VQUE9SVFNfUklTQ1ZfSVNBX1NWUEJNVAo+ID4gc28ganVz
dCByZW5hbWUgUklTQ1ZfSVNBX1NWUEJNVCB0byBQTEFURk9STV9NQVlfU1VQUE9SVF9SSVNDVl9J
U0FfU1ZQQk1UCj4gPiBhbmQgbW92ZSB0aGUgZGVmaW5pdGlvbiB0byBLY29uZmlnLmlzYS4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNv
bT4KPiA+IC0tLQo+ID4gYXJjaC9yaXNjdi9LY29uZmlnICAgICB8IDE3IC0tLS0tLS0tLS0tLS0t
LS0tCj4gPiBhcmNoL3Jpc2N2L0tjb25maWcuaXNhIHwgMTcgKysrKysrKysrKysrKysrKysKPiA+
IDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiA+IGluZGV4IDljM2E0MzQ3OTUzYi4uMjIzMDNhM2FiNTllIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IEBAIC00ODQs
MjMgKzQ4NCw2IEBAIGNvbmZpZyBSSVNDVl9BTFRFUk5BVElWRV9FQVJMWQo+ID4gaGVscAo+ID4g
IEFsbG93cyBlYXJseSBwYXRjaGluZyBvZiB0aGUga2VybmVsIGZvciBzcGVjaWFsIGVycmF0YQo+
ID4gCj4gPiAtY29uZmlnIFJJU0NWX0lTQV9TVlBCTVQKPiA+IC0gYm9vbCAiU3ZwYm10IGV4dGVu
c2lvbiBzdXBwb3J0IGZvciBzdXBlcnZpc29yIG1vZGUgcGFnZS1iYXNlZCBtZW1vcnkgdHlwZXMi
Cj4gPiAtIGRlcGVuZHMgb24gNjRCSVQgJiYgTU1VCj4gPiAtIGRlcGVuZHMgb24gUklTQ1ZfQUxU
RVJOQVRJVkUKPiA+IC0gZGVmYXVsdCB5Cj4gPiAtIGhlbHAKPiA+IC0gICBBZGQgc3VwcG9ydCBm
b3IgdGhlIFN2cGJtdCBJU0EtZXh0ZW5zaW9uIChTdXBlcnZpc29yLW1vZGU6Cj4gPiAtICAgcGFn
ZS1iYXNlZCBtZW1vcnkgdHlwZXMpIGluIHRoZSBrZXJuZWwgd2hlbiBpdCBpcyBkZXRlY3RlZCBh
dCBib290Lgo+ID4gLQo+ID4gLSAgIFRoZSBtZW1vcnkgdHlwZSBmb3IgYSBwYWdlIGNvbnRhaW5z
IGEgY29tYmluYXRpb24gb2YgYXR0cmlidXRlcwo+ID4gLSAgIHRoYXQgaW5kaWNhdGUgdGhlIGNh
Y2hlYWJpbGl0eSwgaWRlbXBvdGVuY3ksIGFuZCBvcmRlcmluZwo+ID4gLSAgIHByb3BlcnRpZXMg
Zm9yIGFjY2VzcyB0byB0aGF0IHBhZ2UuCj4gPiAtCj4gPiAtICAgVGhlIFN2cGJtdCBleHRlbnNp
b24gaXMgb25seSBhdmFpbGFibGUgb24gNjQtYml0IGNwdXMuCj4gPiAtCj4gPiAtICAgSWYgeW91
IGRvbid0IGtub3cgd2hhdCB0byBkbyBoZXJlLCBzYXkgWS4KPiA+IC0KPiA+IGNvbmZpZyBUT09M
Q0hBSU5fSEFTX1pCQgo+ID4gYm9vbAo+ID4gZGVmYXVsdCB5Cj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9LY29uZmlnLmlzYSBiL2FyY2gvcmlzY3YvS2NvbmZpZy5pc2EKPiA+IGluZGV4IDM3
NTg1YmNkNzYzZS4uNTBlMjE3ZGM1NzE5IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29u
ZmlnLmlzYQo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnLmlzYQo+ID4gQEAgLTE2OCwzICsx
NjgsMjAgQEAgY29uZmlnIFBMQVRGT1JNX1NVUFBPUlRTX1JJU0NWX0lTQV9TVk5BUE9UCj4gPiAg
bm90IHN1cHBvcnQgU3ZuYXBvdC4KPiA+IAo+ID4gZW5kY2hvaWNlCj4gPiArCj4gPiArY29uZmln
IFJJU0NWX0lTQV9TVlBCTVQKPiAKPiBIaSBDaGFybGllLAo+IERlc3BpdGUgdGhlIHN1YmplY3Qg
YW5kIGJvZHkgeW91IGhhdmVu4oCZdCByZW5hbWVkIGl0IGluIHRoaXMgcGF0Y2g/CgpJIGRpZG4n
dCBkbyBhIGdvb2Qgam9iIGF0IGV4cGxhaW5pbmcgZXhhY3RseSB3aGF0J3MgaGFwcGVuaW5nIGhl
cmUuIFRoZQpjb25maWcgb3B0aW9uICJQTEFURk9STV9NQVlfU1VQUE9SVF9SSVNDVl9JU0FfU1ZQ
Qk1UIiBtb3N0IGNsb3NlbHkKZm9sbG93cyB0aGUgc2VtYW50aWNzIG9mIHdoYXQgIlJJU0NWX0lT
QV9TVlBCTVQiIHByZXZpb3VzbHkgd2FzLiBUaGlzCnBhdGNoIGNoYW5nZXMgIlJJU0NWX0lTQV9T
VlBCTVQiIHRvIG1lYW4gdGhhdCBlaXRoZXIKUExBVEZPUk1fTUFZX1NVUFBPUlRfUklTQ1ZfSVNB
X1NWUEJNVCBvcgpQTEFURk9STV9TVVBQT1JUU19SSVNDVl9JU0FfU1ZOQVBPVCB3YXMgc2VsZWN0
ZWQuCgotIENoYXJsaWUKCj4gCj4gSmVzcwo+IAo+ID4gKyBib29sICJTdnBibXQgZXh0ZW5zaW9u
IHN1cHBvcnQgZm9yIHN1cGVydmlzb3IgbW9kZSBwYWdlLWJhc2VkIG1lbW9yeSB0eXBlcyIKPiA+
ICsgZGVwZW5kcyBvbiA2NEJJVCAmJiBNTVUKPiA+ICsgZGVwZW5kcyBvbiBSSVNDVl9BTFRFUk5B
VElWRQo+ID4gKyBkZWZhdWx0IHkKPiA+ICsgaGVscAo+ID4gKyAgIEFkZCBzdXBwb3J0IGZvciB0
aGUgU3ZwYm10IElTQS1leHRlbnNpb24gKFN1cGVydmlzb3ItbW9kZToKPiA+ICsgICBwYWdlLWJh
c2VkIG1lbW9yeSB0eXBlcykgaW4gdGhlIGtlcm5lbCB3aGVuIGl0IGlzIGRldGVjdGVkIGF0IGJv
b3QuCj4gPiArCj4gPiArICAgVGhlIG1lbW9yeSB0eXBlIGZvciBhIHBhZ2UgY29udGFpbnMgYSBj
b21iaW5hdGlvbiBvZiBhdHRyaWJ1dGVzCj4gPiArICAgdGhhdCBpbmRpY2F0ZSB0aGUgY2FjaGVh
YmlsaXR5LCBpZGVtcG90ZW5jeSwgYW5kIG9yZGVyaW5nCj4gPiArICAgcHJvcGVydGllcyBmb3Ig
YWNjZXNzIHRvIHRoYXQgcGFnZS4KPiA+ICsKPiA+ICsgICBUaGUgU3ZwYm10IGV4dGVuc2lvbiBp
cyBvbmx5IGF2YWlsYWJsZSBvbiA2NC1iaXQgY3B1cy4KPiA+ICsKPiA+ICsgICBJZiB5b3UgZG9u
J3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSBZLgo+ID4gCj4gPiAtLSAKPiA+IDIuNDQuMAo+
ID4gCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
