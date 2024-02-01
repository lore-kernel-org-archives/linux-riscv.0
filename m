Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D36DC4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 21:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=587BxJ+ZQ0drh9WpPaJXoG7f4D0bPWp+Lz2sY0Z9ji4=; b=YyBtNa+xRFmNJ5
	KCJtO49Nehm/aUv7EPfIcm2IFb6GnGaMVS1ywELvx7R4DZvQLRBMDmT+Y+Rm0nzI0P6ofbXLgruHH
	aM4LUAwGfWwtF8N8B9OWpzTQ/0MvZjD2De1UyycHxYdYph1wk+rCQJhcPPfnlni+Gp83BF9nP59Dn
	aQ1MDuqki2da8F+uys+P+lHr7SBIKwXNxL0DiDVurdsqtzZFn6EE3usyprnp5XVn+JAwWfr50mc8B
	E0+8IHvl04zVhKjiftaCGWcqtX8H0n1+M5iNgLrX+ozzRHMWTtYFhTuP42yep1+HEgVIZRClxI5Ki
	4U8XvW3wY0hl8ep9LUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVewP-00000009RwZ-01AU;
	Thu, 01 Feb 2024 21:49:49 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVewM-00000009Rw1-0AI0
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 21:49:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6de28744a46so1087951b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 13:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706824184; x=1707428984; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oG7NBQ4bFtrw2hwU4RxQa/ZPxvhKKV36pfeutXbMKF4=;
        b=onRu9fnAbiKF9AIyLp2uDh1xaEPEWAi9L82gaKeb3rcz3ibrzkOpcXXTOb6MKUFgVj
         cfBprI8iSwk96t1ZigYpO3H+HiqRbhdvsZu8f22n3TDtpon9tltZKlvYilZgeyqVpz/8
         dH2Pruk9gt4VTapZ4l1r89NaxZOFykmrLkNH+ylVe/jihwYjmLQrZXZ+iKdY2HyHL6cm
         nRyGnnnj/y8XQHKZlutUh2VJFQWF+5iaBI7CQpod+WMNuT4IggWd+QyteeRyhgi3U83S
         TbiRIK/gqpGQ44pAHWYFy8xAyZuJtrdu0ElRlERWigUiY+NEBhc4qWnCSDHAt6tR1b00
         lOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706824184; x=1707428984;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oG7NBQ4bFtrw2hwU4RxQa/ZPxvhKKV36pfeutXbMKF4=;
        b=GEgYK0Pyk3/8XbRN/bG18JEfkRAzv3pUN5sGC2YXOZqw7V32qBCl/k3EQfxiPY6asd
         LEyu7RDmefV2Ie4Rmtpk1KHjzJ7bDFfvKPrpbAdNm2hPi00G/biS15FY5rNiZwANJGpY
         teZ5JUos+jrRhbjh6TeH2epWCunBGuDMH6/lQc84oRLcmjxGXiVJt9XLzPLj6jtX9Iw+
         f0/6HoyO3K9XAj05htbgLenfvtoI2XkYm3uEwHyzT3OdHMnTnMdL/sXBCbOPVLdQG4hW
         afWrFyCITAWN25yU9GzIL55yfmGG9O8n+2SzeiCCysWR7ZzOnkiPD8E9VycSdDoRPvuY
         wb1w==
X-Gm-Message-State: AOJu0YxeEbyGFWkbLOiVc57BpRt81a1Vz6XdQFxp2bfuPhu9npOssIUw
	FWGetCMu3bVnpmFNl4ZxdhGkKTd2hGqmBri2pnY+3THqfcFOLmfpHAmiiQGKfHA=
X-Google-Smtp-Source: AGHT+IFaiNK4dD+Uo2q94OSpSJCPEcl+nMxlf2gqE/nDLsb71Umwi3+ih1anW8YdZeAqnJX3SeA3kQ==
X-Received: by 2002:a05:6a20:e61a:b0:19e:4007:aba9 with SMTP id my26-20020a056a20e61a00b0019e4007aba9mr3614744pzb.39.1706824184142;
        Thu, 01 Feb 2024 13:49:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVBTPLnzDj/zzXlKfWlB1CepPnGhls0B3I1nUDQLHJowA5cP9u/CfKIGt1p/Uf/zR5+hDIOU32hQv0P3YE+DO+Sxuj3XKialdPzLJzL2luBm75jpBSpGUrzn3myGfOdxgTazf+CfXR82VUWmPGJWXRYVxX7FSCR3S31Y4pI+1kotlB8xjFXd3tq/6zd12o7f3HoNQOFNUHOv0+41lHU6Y7LSa2LLjGltRg13Tjlb1G2YvTnkPlzFI2MjtKR7HQj5QDa747fWhD6jPLSS1juU9bobwDmvbyf7fxx
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id p14-20020a056a0026ce00b006dddd046e54sm214935pfw.206.2024.02.01.13.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 13:49:43 -0800 (PST)
Date: Thu, 1 Feb 2024 13:49:41 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Charles Lohr <lohr85@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: Disable misaligned access probe when
 CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <ZbwR9bk2z2meLmtz@ghost>
References: <20240131-disable_misaligned_probe_config-v1-0-98d155e9cda8@rivosinc.com>
 <20240131-disable_misaligned_probe_config-v1-2-98d155e9cda8@rivosinc.com>
 <48e6b009-c79c-4a2e-a532-e46c7b8b6fc8@rivosinc.com>
 <Zbvslcl7YTy38HNF@ghost>
 <CAGu26P85ZO1dY+qftMndKzwBpsA72x=KNWVyry=38uPhfuFweQ@mail.gmail.com>
 <ZbwDdLmO1l9WDLxF@ghost>
 <CAGu26P8j25EgeqCrVwxKgyeDKDrP4=tHVW-kRLcRQC8rk3Xqng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGu26P8j25EgeqCrVwxKgyeDKDrP4=tHVW-kRLcRQC8rk3Xqng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_134946_324194_0655DD38 
X-CRM114-Status: GOOD (  43.83  )
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

T24gVGh1LCBGZWIgMDEsIDIwMjQgYXQgMDE6Mzk6NTNQTSAtMDgwMCwgQ2hhcmxlcyBMb2hyIHdy
b3RlOgo+IEkgYW0gdmVyeSBzb3JyeSBmb3Igd2FzdGluZyB5b3VyIHRpbWUgLSBJIGRpZCBoYXZl
IGl0IHBhdGNoZWQgb3V0IGluCj4gdGhlIGJ1aWxkIHN5c3RlbSBoZXJlLiBJIGNhbid0IHdhaXQg
Zm9yIHRoaXMgZmVhdHVyZSB0byBsYW5kLCBzbyBJIGNhbgo+IGVuam95IGZhc3RlciBib290IHRp
bWVzIHdpdGhvdXQgYSBwYXRjaC4KPiAKPiBDaGFybGVzCgpObyB3b3JyaWVzIQoKLSBDaGFybGll
Cgo+IAo+IE9uIFRodSwgRmViIDEsIDIwMjQgYXQgMTI6NDfigK9QTSBDaGFybGllIEplbmtpbnMg
PGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEZlYiAwMSwgMjAy
NCBhdCAxMTo1NzowNEFNIC0wODAwLCBDaGFybGVzIExvaHIgd3JvdGU6Cj4gPiA+IEkgYW0gYSBs
aXR0bGUgY29uZnVzZWQgaGVyZSAtIEkgd2FzIHRlc3Rpbmcgd2l0aCA2LjgtcmMxIGFuZCBpdCBk
aWRuJ3QKPiA+ID4gc2VlbSB0byBoYXZlIHRoZSBiZWhhdmlvciBvZiBwZXJmb3JtaW5nIHRoZSBw
cm9iZSAoVGhlIHByb2JlIGtpbGxzCj4gPiA+IGJvb3QgcGVyZm9ybWFuY2UgaW4gbXkgYXBwbGlj
YXRpb24gYW5kIEkndmUgaGFkIHRvIHBhdGNoIG91dCB0aGUgcHJvYmUKPiA+ID4gaW4gbWlkLTYu
eCBrZXJuZWxzKS4KPiA+ID4KPiA+ID4gRGlkIHNvbWV0aGluZyBnZXQgcmV2ZXJ0ZWQgdG8gYnJp
bmcgYmFjayB0aGUgcHJvYmUgZXZlbiB3aGVuCj4gPiA+IENPTkZJR19IQVZFX0VGRklDSUVOVF9V
TkFMSUdORURfQUNDRVNTPVkgYmV0d2VlbiByYzEgYW5kIHRydW5rPyAgT3IgYW0KPiA+ID4gSSBt
aXNyZW1lbWJlcmluZy9hY2NpZGVudGFsbHkgcGF0Y2hlZD8KPiA+Cj4gPiBBZnRlciBwdWxsaW5n
IGEgY2xlYW4gdmVyc2lvbiBvZiA2LjgtcmMxIGFuZCBzZXR0aW5nCj4gPiBDT05GSUdfSEFWRV9F
RkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyBJIHN0aWxsIHNlZSB0aGUgcHJvYmUgaGFwcGVuLgo+
ID4gQmVmb3JlIHNlbmRpbmcgdGhpcyBJIGxvb2tlZCBmb3IgYSBwYXRjaCB0aGF0IGRpc2FibGVk
IHRoZSBwcm9iZSBidXQgd2FzCj4gPiB1bmFibGUgdG8gZmluZCBvbmUsIGlmIHRoZXJlIGV4aXN0
cyBhIHBhdGNoIGNhbiB5b3UgcG9pbnQgbWUgdG8gaXQ/Cj4gPgo+ID4gLSBDaGFybGllCj4gPgo+
ID4gPgo+ID4gPiBPbiBUaHUsIEZlYiAxLCAyMDI0IGF0IDExOjEw4oCvQU0gQ2hhcmxpZSBKZW5r
aW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUs
IEZlYiAwMSwgMjAyNCBhdCAwMjo0Mzo0M1BNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIDAxLzAyLzIwMjQgMDc6NDAsIENoYXJs
aWUgSmVua2lucyB3cm90ZToKPiA+ID4gPiA+ID4gV2hlbiBDT05GSUdfSEFWRV9FRkZJQ0lFTlRf
VU5BTElHTkVEX0FDQ0VTUyBpcyBzZWxlY3RlZCwgdGhlIGNwdXMgY2FuIGJlCj4gPiA+ID4gPiA+
IHNldCB0byBoYXZlIGZhc3QgbWlzYWxpZ25lZCBhY2Nlc3Mgd2l0aG91dCBuZWVkaW5nIHRvIHBy
b2JlLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtp
bnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oICB8IDcgKysrKysrKwo+ID4gPiA+ID4g
PiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgIHwgNCArKysrCj4gPiA+ID4g
PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgfCA0ICsrKysKPiA+ID4g
PiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDQgKysrKwo+ID4g
PiA+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiA+ID4gPiA+IGluZGV4
IGRmZGNjYTIyOTE3NC4uN2Q4ZDY0NzgzZTM4IDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+ID4gPiA+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+ID4gPiA+ID4gPiBAQCAtMTM3LDEwICsxMzcs
MTcgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHJpc2N2X2NwdV9oYXNfZXh0ZW5zaW9u
X3VubGlrZWx5KGludCBjcHUsIGNvbnN0IHVuc2kKPiA+ID4gPiA+ID4gICAgIHJldHVybiBfX3Jp
c2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGhhcnRfaXNhW2NwdV0uaXNhLCBleHQpOwo+ID4g
PiA+ID4gPiAgfQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiArI2lmbmRlZiBDT05GSUdfSEFWRV9F
RkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwo+ID4gPiA+ID4gPiAgREVDTEFSRV9TVEFUSUNfS0VZ
X0ZBTFNFKGZhc3RfbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfa2V5KTsKPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfZmFzdF9taXNhbGlnbmVk
X2FjY2Vzc2VzKHZvaWQpCj4gPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiA+ICAgICByZXR1cm4gc3Rh
dGljX2JyYW5jaF9saWtlbHkoJmZhc3RfbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfa2V5KTsKPiA+
ID4gPiA+ID4gIH0KPiA+ID4gPiA+ID4gKyNlbHNlCj4gPiA+ID4gPiA+ICtzdGF0aWMgX19hbHdh
eXNfaW5saW5lIGJvb2wgaGFzX2Zhc3RfbWlzYWxpZ25lZF9hY2Nlc3Nlcyh2b2lkKQo+ID4gPiA+
ID4gPiArewo+ID4gPiA+ID4gPiArICAgcmV0dXJuIHRydWU7Cj4gPiA+ID4gPiA+ICt9Cj4gPiA+
ID4gPiA+ICsjZW5kaWYKPiA+ID4gPiA+ID4gICNlbmRpZgo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCj4gPiA+ID4gPiA+IGluZGV4IDg5OTIwZjg0ZDBhMy4uZDc4Nzg0NmMwYjY4IDEw
MDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+
ID4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiA+ID4gPiA+
IEBAIC00MywxMCArNDMsMTIgQEAgc3RhdGljIERFQ0xBUkVfQklUTUFQKHJpc2N2X2lzYSwgUklT
Q1ZfSVNBX0VYVF9NQVgpIF9fcmVhZF9tb3N0bHk7Cj4gPiA+ID4gPiA+ICAvKiBQZXItY3B1IElT
QSBleHRlbnNpb25zLiAqLwo+ID4gPiA+ID4gPiAgc3RydWN0IHJpc2N2X2lzYWluZm8gaGFydF9p
c2FbTlJfQ1BVU107Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICsjaWZuZGVmIENPTkZJR19IQVZF
X0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4gPiA+ID4gPiA+ICAvKiBQZXJmb3JtYW5jZSBp
bmZvcm1hdGlvbiAqLwo+ID4gPiA+ID4gPiAgREVGSU5FX1BFUl9DUFUobG9uZywgbWlzYWxpZ25l
ZF9hY2Nlc3Nfc3BlZWQpOwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgc3RhdGljIGNwdW1hc2tf
dCBmYXN0X21pc2FsaWduZWRfYWNjZXNzOwo+ID4gPiA+ID4gPiArI2VuZGlmCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ICAvKioKPiA+ID4gPiA+ID4gICAqIHJpc2N2X2lzYV9leHRlbnNpb25fYmFz
ZSgpIC0gR2V0IGJhc2UgZXh0ZW5zaW9uIHdvcmQKPiA+ID4gPiA+ID4gQEAgLTcwNiw2ICs3MDgs
NyBAQCB1bnNpZ25lZCBsb25nIHJpc2N2X2dldF9lbGZfaHdjYXAodm9pZCkKPiA+ID4gPiA+ID4g
ICAgIHJldHVybiBod2NhcDsKPiA+ID4gPiA+ID4gIH0KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
KyNpZm5kZWYgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKPiA+ID4gPiA+
ID4gIHN0YXRpYyBpbnQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzcyh2b2lkICpwYXJhbSkKPiA+ID4g
PiA+ID4gIHsKPiA+ID4gPiA+ID4gICAgIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4g
PiA+ID4gPiA+IEBAIC05NDYsNiArOTQ5LDcgQEAgc3RhdGljIGludCBjaGVja191bmFsaWduZWRf
YWNjZXNzX2FsbF9jcHVzKHZvaWQpCj4gPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ICBhcmNoX2luaXRjYWxsKGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXMpOwo+ID4g
PiA+ID4gPiArI2VuZGlmIC8qIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNT
ICovCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICB2b2lkIHJpc2N2X3VzZXJfaXNhX2VuYWJsZSh2
b2lkKQo+ID4gPiA+ID4gPiAgewo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIENoYXJsaWUsCj4gPiA+
ID4gPgo+ID4gPiA+ID4gR2VuZXJhbGx5LCBoYXZpbmcgc28gbXVjaCBpZmRlZiBpbiB2YXJpb3Vz
IHBpZWNlcyBvZiBjb2RlIGlzIHByb2JhYmx5Cj4gPiA+ID4gPiBub3QgYSBnb29kIGlkZWEuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gQUZBSUNULCBpZiBDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElH
TkVEX0FDQ0VTUyBpcyBlbmFibGVkLCB0aGUgd2hvbGUKPiA+ID4gPiA+IG1pc2FsaWduZWQgYWNj
ZXNzIHNwZWVkIGNoZWNraW5nIGNvdWxkIGJlIG9wdC1vdXQuIHdoaWNoIG1lYW5zIHRoYXQKPiA+
ID4gPiA+IHByb2JhYmx5IGV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBtaXNhbGlnbmVkIGFjY2Vzc2Vz
IHNob3VsZCBiZSBtb3ZlZCBpbgo+ID4gPiA+ID4gaXQncyBvd24gZmlsZSBidWlsZCBpdCBvbmx5
IGZvciBDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUz1uCj4gPiA+ID4gPiBv
bmx5Lgo+ID4gPiA+Cj4gPiA+ID4gSSB3aWxsIGxvb2sgaW50byBkb2luZyBzb21ldGhpbmcgbW9y
ZSBjbGV2ZXIgaGVyZSEgSSBhZ3JlZSBpdCBpcyBub3QKPiA+ID4gPiB2ZXJ5IG5pY2UgdG8gaGF2
ZSBzbyBtYW55IGlmZGVmcyBzY2F0dGVyZWQuCj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+ID4gPiA+ID4gPiBpbmRleCBhN2M1NmI0MWVmZDIuLjNm
MWE2ZWRmZGIwOCAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lz
X2h3cHJvYmUuYwo+ID4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9i
ZS5jCj4gPiA+ID4gPiA+IEBAIC0xNDksNiArMTQ5LDcgQEAgc3RhdGljIGJvb2wgaHdwcm9iZV9l
eHQwX2hhcyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywgdW5zaWduZWQgbG9uZyBleHQpCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICBzdGF0aWMgdTY0IGh3cHJvYmVfbWlzYWxpZ25lZChjb25z
dCBzdHJ1Y3QgY3B1bWFzayAqY3B1cykKPiA+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ID4gKyNpZm5k
ZWYgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKPiA+ID4gPiA+ID4gICAg
IGludCBjcHU7Cj4gPiA+ID4gPiA+ICAgICB1NjQgcGVyZiA9IC0xVUxMOwo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBAQCAtMTY4LDYgKzE2OSw5IEBAIHN0YXRpYyB1NjQgaHdwcm9iZV9taXNhbGln
bmVkKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVzKQo+ID4gPiA+ID4gPiAgICAgICAgICAgICBy
ZXR1cm4gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV047Cj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ICAgICByZXR1cm4gcGVyZjsKPiA+ID4gPiA+ID4gKyNlbHNlCj4gPiA+ID4gPiA+ICsg
ICByZXR1cm4gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0ZBU1Q7Cj4gPiA+ID4gPiA+ICsjZW5k
aWYKPiA+ID4gPiA+ID4gIH0KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gIHN0YXRpYyB2b2lkIGh3
cHJvYmVfb25lX3BhaXIoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4gPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkPiBpbmRleCA4ZGVkMjI1ZThjNWIuLmMyNGY3OWQ3
NjlmNiAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCj4gPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYwo+ID4gPiA+ID4gPiBAQCAtNDEzLDcgKzQxMyw5IEBAIGludCBoYW5kbGVfbWlzYWxp
Z25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAg
ICAgcGVyZl9zd19ldmVudChQRVJGX0NPVU5UX1NXX0FMSUdOTUVOVF9GQVVMVFMsIDEsIHJlZ3Ms
IGFkZHIpOwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiArI2lmbmRlZiBDT05GSUdfSEFWRV9FRkZJ
Q0lFTlRfVU5BTElHTkVEX0FDQ0VTUwo+ID4gPiA+ID4gPiAgICAgKnRoaXNfY3B1X3B0cigmbWlz
YWxpZ25lZF9hY2Nlc3Nfc3BlZWQpID0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVE
Owo+ID4gPiA+ID4gPiArI2VuZGlmCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSB0aGluayB0aGF0IHJh
dGhlciB1c2luZyBpZmRlZmVyeSBpbnNpZGUgdGhpcyBmaWxlICh0cmFwc19taXNhbGlnbmVkLmMp
Cj4gPiA+ID4gPiAgaXQgY2FuIGJlIHRvdGFsbHkgb3B0LW91dCBpbiBjYXNlIHdlIGhhdmUKPiA+
ID4gPiA+IENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIHNpbmNlIGl0IGlt
cGxpZXMgdGhhdCBtaXNhbGlnbmVkCj4gPiA+ID4gPiBhY2Nlc3NlcyBhcmUgbm90IGVtdWxhdGVk
IChhdCBsZWFzdCB0aGF0IGlzIG15IHVuZGVyc3RhbmRpbmcpLgo+ID4gPiA+ID4KPiA+ID4gPgo+
ID4gPiA+IFRoYXQncyBhIGdyZWF0IGlkZWEsIEkgYmVsaWV2ZSB0aGF0IGlzIGNvcnJlY3QuCj4g
PiA+ID4KPiA+ID4gPiAtIENoYXJsaWUKPiA+ID4gPgo+ID4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+
ID4KPiA+ID4gPiA+IENsw6ltZW50Cj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gICAgIGlmICghdW5hbGlnbmVkX2VuYWJsZWQpCj4gPiA+ID4gPiA+ICAgICAgICAg
ICAgIHJldHVybiAtMTsKPiA+ID4gPiA+ID4gQEAgLTU5Niw2ICs1OTgsNyBAQCBpbnQgaGFuZGxl
X21pc2FsaWduZWRfc3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+ID4gPiA+ICAgICBy
ZXR1cm4gMDsKPiA+ID4gPiA+ID4gIH0KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gKyNpZm5kZWYg
Q09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKPiA+ID4gPiA+ID4gIGJvb2wg
Y2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChpbnQgY3B1KQo+ID4gPiA+ID4gPiAgewo+
ID4gPiA+ID4gPiAgICAgbG9uZyAqbWFzX3B0ciA9IHBlcl9jcHVfcHRyKCZtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCwgY3B1KTsKPiA+ID4gPiA+ID4gQEAgLTY0MCw2ICs2NDMsNyBAQCB2b2lkIHVu
YWxpZ25lZF9lbXVsYXRpb25fZmluaXNoKHZvaWQpCj4gPiA+ID4gPiA+ICAgICB9Cj4gPiA+ID4g
PiA+ICAgICB1bmFsaWduZWRfY3RsID0gdHJ1ZTsKPiA+ID4gPiA+ID4gIH0KPiA+ID4gPiA+ID4g
KyNlbmRpZgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgYm9vbCB1bmFsaWduZWRfY3RsX2F2YWls
YWJsZSh2b2lkKQo+ID4gPiA+ID4gPiAgewo+ID4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+
Cj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+ID4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4g
PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+ID4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
