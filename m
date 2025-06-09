Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685FEC61CE8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 22:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EV84wfLtlUWYBXx2KR52JHdkaW2VFVPh8JHWa+I9/R8=; b=1hX5z+cYUAG7P8
	UzNUujuoqATp2bxn0DmiNTtJC4oFG/TdgvgNhg/F1BkEnVb6CpgZ6hxmmSCejOesTX+IxYAm2fbNp
	a+g/ACja9Pp1loYLNAZb2zrOZZV6iJI8aSvmgWU+UHQUPzmVFLaKl4WuOxKK+r78k6o5v57G/y2Wa
	GMZ2pVe6/Thjn2fjn9GNlLHClaLxDq0HNo3BQ0/WyjAYlVO9Ld4EcxBqMTYxj99xzbKCfybc9xM4W
	IGa8LzOQ5gh+in+LttokLsN2hDtwdTYgwXuf2YwbqxjwLrtD7iyedrovUzr1cBsk5uOaSf7JegIqC
	LcvQ+fgEixLC3Duk4Zhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkgh-00000005Juh-3ZQc;
	Mon, 09 Jun 2025 22:09:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkge-00000005Jtq-32rV
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 22:09:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-235f9ea8d08so37743425ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749506987; x=1750111787; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aXUrxDWDE1rz5GW1/FGYZyrQqnRIMW5wSQ+qWnYbv8k=;
        b=XO0mpBcxcaI1j1WCFnSVI4fEjB1BMUkHuV+VhbqHE5wmulzseNy/TEmMOU95GDCq4G
         NZmA07Dlf5aN5bD+83WBx72D/Av1jHL5vyFWWSkVK6WgK9t88y9hm+HRkXayTqKpeunz
         8dRMDKlTLkDldPJHEqJDFAWMuW7Jk9EqKJ80px+J7nN01VARw2HuysF/t5GKq2HmFZI5
         HNzDWMeg4IodCs0GBa8HW2ZvdxseiC8cZ76CbPfqHnX6I78JfbIEXLPFn8mRjYpQ2KWw
         gJDDfQXL8eh7C7er0vZXYLG4eTvP2z5XKoHBDzPJK8LzRPaQOt9ZnfBkJ2epxwqdwEO9
         OTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749506987; x=1750111787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aXUrxDWDE1rz5GW1/FGYZyrQqnRIMW5wSQ+qWnYbv8k=;
        b=CeHA//wSFVkYkbS1k6m7gUeuNXMqX4Vmsv/2TBzlj16MeafjwKXYzBlH0fzA/fVIAT
         sqCjrXmVRIeOSXxk9FkEV3ZGZCEOZUtsJMI+Uh8WVWuk361K34mKMVbhf9Dr/coacZKv
         ANbtBpfLYZwKERx0cW05KPJGVqwmn5EF8KyIEiwitJDMHkcMUXbrMbfoNyxqN1FLjkAE
         5fLjv7FeyZfShZSuFNDDNDfBOfaC1pojvH17OIPVEPubJ00IBvOcmY3SlAtp4cFP6W0z
         I6+gxD6UddNSKQz/ZFT/zDq69JLo9y690n3OCAp33t2CRUuOUV9q74gXaapvtFi3vjnn
         47Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXDUwa+i2PcEJCZ3NsgkhKcPpy9iwJNxmiPaFWbj7euVU6NUvKPSs9Zw7cZGD3asOXGzUiGg2aKsHWGHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx389uF1xPpC7C8PjUmsKYSpktv+9y9XOtpSBgS23I2wlEXqp2k
	bN1p4QHMN1m2apI4eGBYdZQbxu4zi3ncySF394QGZ4hr+DYd1nU7T3BKNOpfvbf8CA4=
X-Gm-Gg: ASbGncuAOmtiv2/vgsDWAaFIwl5LY2NLgf3w0QXGjhqRBSSQ/2z88eHmSuIVbrB25Lb
	oKqs3ofLgR2D5zDgt1DdM/qX57HEBY6syzfzbtZBKeaKWyVT2wJADijON+4CBr49H3hDKy9S01l
	WVwI7fvcywMFeVACCSe/M2rJ7DrpNUDV/SejG7maoWN6E7MHZ4wWZtiKaD0MNIGfH8FMOj9aVWr
	EAl+4oGluhK0t0P7mZOlnxrhAVqhnadCR/7rLJlXYCH36USTTAAfD6kYNweqx6Xu2lrfyrdBb0R
	3n4bcwqeVFoAAXPgCngfvwxmHGu8h0EzVrufUzSyzl4vzCGS2FjmMAR9LDZNkKp+IacU+HCmgw=
	=
X-Google-Smtp-Source: AGHT+IEmC2cH56sY2Qaxupk/vYIkWpD0/7VSc7N28TaMH7rVO1PkIEtaUHkk3Y4nHUVSyRzLwMzWGg==
X-Received: by 2002:a17:902:e888:b0:234:8a4a:ada5 with SMTP id d9443c01a7336-23638390915mr2466705ad.37.1749506987465;
        Mon, 09 Jun 2025 15:09:47 -0700 (PDT)
Received: from x1 (97-120-245-201.ptld.qwest.net. [97.120.245.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b13ba47sm6079708a91.40.2025.06.09.15.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:09:46 -0700 (PDT)
Date: Mon, 9 Jun 2025 15:09:45 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 5/6] riscv: dts: thead: Add PVT node
Message-ID: <aEdbqSjpHyHx54UF@x1>
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <CGME20250524211525eucas1p244963b69e0531c95a9052e4a7a1d1e01@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-5-bdd2d5094ff7@samsung.com>
 <aDVxDJi0KkWXiPCK@x1>
 <61eecafb-8ad1-4306-88cb-a032eefb2e48@samsung.com>
 <aDyOyg6eqDEFg2ua@x1>
 <9e8a12db-236d-474c-b110-b3be96edf057@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e8a12db-236d-474c-b110-b3be96edf057@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_150949_000387_7DEE0886 
X-CRM114-Status: GOOD (  43.24  )
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

T24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDg6NDk6NTdQTSArMDIwMCwgTWljaGFsIFdpbGN6eW5z
a2kgd3JvdGU6Cj4gCj4gCj4gT24gNi8xLzI1IDE5OjMyLCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4g
PiBPbiBTdW4sIEp1biAwMSwgMjAyNSBhdCAwOTo1MDo1MkFNICswMjAwLCBNaWNoYWwgV2lsY3p5
bnNraSB3cm90ZToKPiA+Pgo+ID4+Cj4gPj4gT24gNS8yNy8yNSAxMDowMCwgRHJldyBGdXN0aW5p
IHdyb3RlOgo+ID4+PiBPbiBTYXQsIE1heSAyNCwgMjAyNSBhdCAxMToxNDo1OVBNICswMjAwLCBN
aWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPiA+Pj4+IEFkZCBQVlQgRFQgbm9kZSBmb3IgdGhlcm1h
bCBzZW5zb3IuCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kg
PG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gIGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgfCAxMSArKysrKysrKysrKwo+ID4+Pj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3RoZWFkL3RoMTUyMC5kdHNpCj4gPj4+PiBpbmRleCBmMjRlMTJkNzI1OWZhYmNmYmRjMmRmYTk2
NmQ3NTlkYjA2Njg0YWI0Li5mYWY1YzNhYWYyMDliMjRjZDk5ZGRjMzc3YTg4ZTA4YThjY2UyNGZl
IDEwMDY0NAo+ID4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRz
aQo+ID4+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+ID4+
Pj4gQEAgLTY0OCw2ICs2NDgsMTcgQEAgcGFkY3RybF9hb3N5czogcGluY3RybEBmZmZmZjRhMDAw
IHsKPiA+Pj4+ICAJCQl0aGVhZCxwYWQtZ3JvdXAgPSA8MT47Cj4gPj4+PiAgCQl9Owo+ID4+Pj4g
IAo+ID4+Pj4gKwkJcHZ0OiBwdnRAZmZmZmY0ZTAwMCB7Cj4gPj4+PiArCQkJY29tcGF0aWJsZSA9
ICJtb29ydGVjLG1yNzUyMDMiOwo+ID4+Pj4gKwkJCXJlZyA9IDwweGZmIDB4ZmZmNGUwMDAgMHgw
IDB4ODA+LAo+ID4+Pj4gKwkJCSAgICAgIDwweGZmIDB4ZmZmNGUwODAgMHgwIDB4MTAwPiwKPiA+
Pj4+ICsJCQkgICAgICA8MHhmZiAweGZmZjRlMTgwIDB4MCAweDY4MD4sCj4gPj4+PiArCQkJICAg
ICAgPDB4ZmYgMHhmZmY0ZTgwMCAweDAgMHg2MDA+Owo+ID4+Pj4gKwkJCXJlZy1uYW1lcyA9ICJj
b21tb24iLCAidHMiLCAicGQiLCAidm0iOwo+ID4+Pj4gKwkJCWNsb2NrcyA9IDwmYW9uc3lzX2Ns
az47Cj4gPj4+PiArCQkJI3RoZXJtYWwtc2Vuc29yLWNlbGxzID0gPDE+Owo+ID4+Pj4gKwkJfTsK
PiA+Pj4+ICsKPiA+Pj4+ICAJCWdwaW9AZmZmZmY1MjAwMCB7Cj4gPj4+PiAgCQkJY29tcGF0aWJs
ZSA9ICJzbnBzLGR3LWFwYi1ncGlvIjsKPiA+Pj4+ICAJCQlyZWcgPSA8MHhmZiAweGZmZjUyMDAw
IDB4MCAweDEwMDA+Owo+ID4+Pj4KPiA+Pj4+IC0tIAo+ID4+Pj4gMi4zNC4xCj4gPj4+Pgo+ID4+
Pgo+ID4+PiBJIGZvdW5kIHRoYXQgb24gbXkgbHBpNGEgdGhhdCBib290IHdoaWxlIGhhbmcgYWZ0
ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaC4KPiA+Pj4gSSB0aGluayB0aGF0IGl0IGlzIHJlbGF0ZWQg
dG8gY2xvY2tzIGFzIGJvb3QgZmluaXNoZWQgb2theSB3aGVuIHVzaW5nCj4gPj4+IGNsa19pZ25v
cmVfdW51c2VkIG9uIHRoZSBrZXJuZWwgY21kbGluZS4gRG8geW91IGhhcHBlbiBoYXZlIHRoYXQg
aW4geW91cgo+ID4+PiBrZXJuZWwgY21kbGluZT8KPiA+Pj4KPiA+Pj4gSSBuZWVkIHRvIGludmVz
dGlnYXRlIGZ1cnRoZXIgdG8gdW5kZXJzdGFuZCB3aGljaCBjbG9ja3MgYXJlIGNhdXNpbmcgdGhl
Cj4gPj4+IHByb2JsZW0uCj4gPj4+Cj4gPj4+IFRoYW5rcywKPiA+Pj4gRHJldwo+ID4+Pgo+ID4+
Cj4gPj4gVGhhbmtzIGZvciB5b3VyIGVhcmxpZXIgbWVzc2FnZS4gSSd2ZSBpbnZlc3RpZ2F0ZWQs
IGFuZCB5b3Ugd2VyZSByaWdodAo+ID4+IGFib3V0IHRoZSBjbG9ja3Mg4oCTIHRoZSBzcGVjaWZp
YyBvbmUgY2F1c2luZyB0aGUgaGFuZyBpcyBDTEtfQ1BVMkFPTl9YMkguCj4gPiAKPiA+IFRoYW5r
cyBmb3IgdHJhY2tpbmcgZG93biB0aGUgY2xrIGNhdXNpbmcgdGhlIGhhbmcuIEkgY2FuIGNvbmZp
cm0gdGhhdAo+ID4gdGhpcyBmaXhlcyB0aGUgYm9vdCBoYW5nOgo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5jIGIvZHJpdmVycy9jbGsvdGhlYWQv
Y2xrLXRoMTUyMC1hcC5jCj4gPiBpbmRleCBlYmZiMWQ1OTQwMWQuLjRkMDE3OWI4YzE3YyAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYwo+ID4gKysrIGIv
ZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5jCj4gPiBAQCAtNzkyLDcgKzc5Miw3IEBA
IHN0YXRpYyBDQ1VfR0FURShDTEtfQU9OMkNQVV9BMlgsIGFvbjJjcHVfYTJ4X2NsaywgImFvbjJj
cHUtYTJ4IiwgYXhpNF9jcHVzeXMyX2FjCj4gPiAgICAgICAgICAgICAgICAgMHgxMzQsIEJJVCg4
KSwgMCk7Cj4gPiAgc3RhdGljIENDVV9HQVRFKENMS19YMlhfQ1BVU1lTLCB4MnhfY3B1c3lzX2Ns
aywgIngyeC1jcHVzeXMiLCBheGk0X2NwdXN5czJfYWNsa19wZCwKPiA+ICAgICAgICAgICAgICAg
ICAweDEzNCwgQklUKDcpLCAwKTsKPiA+IC1zdGF0aWMgQ0NVX0dBVEUoQ0xLX0NQVTJBT05fWDJI
LCBjcHUyYW9uX3gyaF9jbGssICJjcHUyYW9uLXgyaCIsIGF4aV9hY2xrX3BkLCAweDEzOCwgQklU
KDgpLCAwKTsKPiA+ICtzdGF0aWMgQ0NVX0dBVEUoQ0xLX0NQVTJBT05fWDJILCBjcHUyYW9uX3gy
aF9jbGssICJjcHUyYW9uLXgyaCIsIGF4aV9hY2xrX3BkLCAweDEzOCwgQklUKDgpLCBDTEtfSUdO
T1JFX1VOVVNFRCk7Cj4gPiAgc3RhdGljIENDVV9HQVRFKENMS19DUFUyUEVSSV9YMkgsIGNwdTJw
ZXJpX3gyaF9jbGssICJjcHUycGVyaS14MmgiLCBheGk0X2NwdXN5czJfYWNsa19wZCwKPiA+ICAg
ICAgICAgICAgICAgICAweDE0MCwgQklUKDkpLCBDTEtfSUdOT1JFX1VOVVNFRCk7Cj4gPiAgc3Rh
dGljIENDVV9HQVRFKENMS19QRVJJU1lTX0FQQjFfSENMSywgcGVyaXN5c19hcGIxX2hjbGssICJw
ZXJpc3lzLWFwYjEtaGNsayIsIHBlcmlzeXNfYWhiX2hjbGtfcGQsCj4gPiAKPiA+Pgo+ID4+IFRo
aXMgYXBwZWFycyB0byBiZSBhbiBBSEIgYnVzIGNsb2NrIHJlcXVpcmVkIGZvciBDUFUgYWNjZXNz
IHRvIHRoZSBBT04KPiA+PiBkb21haW4uIE15IHByb3Bvc2VkIHNvbHV0aW9uIGlzIHRvIG1ha2Ug
dGhlIHB2dCBub2RlIGEgY2hpbGQgb2YgYSBuZXcKPiA+PiBwYXJlbnQgYnVzIG5vZGUgaW4gdGhl
IERldmljZSBUcmVlLiBUaGlzIG5ldyAiQU9OIGJ1cyIgbm9kZSB3b3VsZCB0aGVuCj4gPj4gZXhw
bGljaXRseSByZXF1ZXN0IGFuZCBtYW5hZ2UgQ0xLX0NQVTJBT05fWDJILCBlbnN1cmluZyBpdCdz
IGVuYWJsZWQKPiA+PiB3aGVuIGl0cyBjaGlsZHJlbiBhcmUgYWNjZXNzZWQuCj4gPj4KPiA+PiBX
aGF0IGFyZSB5b3VyIHRob3VnaHRzIG9uIHRoaXMgYXBwcm9hY2g/Cj4gPiAKPiA+IEkgdGhpbmsg
dGhhdCBpcyBhIGdvb2QgYXBwcm9hY2guIFRoZSBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBqdXN0
IGFkZAo+ID4gQ0xLX0lHTk9SRV9VTlVTRUQgbGlrZSBhYm92ZS4gSSd2ZSBkb25lIGl0IGJlZm9y
ZSBidXQgaXQgaXMgYSBiaXQgb2YgYQo+ID4gaGFjay4KPiAKPiBJJ3ZlIGZvbGxvd2VkIHVwIG9u
IHRoZSBpZGVhIG9mIGNyZWF0aW5nIGEgcGFyZW50IGJ1cyBub2RlLiBNeSBhdHRlbXB0Cj4gdXNp
bmcgc2ltcGxlLXBtLWJ1cyByYW4gaW50byBhIGNvdXBsZSBvZiBzaWduaWZpY2FudCBpc3N1ZXMg
dGhhdCBzdWdnZXN0Cj4gaXQncyBub3QgdGhlIGNvcnJlY3QgcGF0aC4KPiAKPiBGaXJzdCwgdGhl
IFRSTSBkb2Vzbid0IHNlZW0gdG8gc3BlY2lmeSBhbiBhZGRyZXNzIHJhbmdlIGZvciB0aGlzIGJ1
cy4KPiBUaGUgcmFuZ2UgSSB1c2VkIGluIG15IHRlc3Qgd2FzIG9ubHkgZm9yIHRoZSBQVlQgY29u
dHJvbGxlciBpdHNlbGYsCj4gd2hpY2ggd291bGQgYmUgYW4gaW5jb3JyZWN0IGFic3RyYWN0aW9u
IGluIHRoZSBkZXZpY2UgdHJlZS4KPiAKPiBTZWNvbmQsIHNpbXBsZS1wbS1idXMgcmVxdWlyZXMg
aXRzIGNoaWxkIG5vZGVzIHRvIHVzZSB0aGUgUE0gcnVudGltZSBBUEkKPiAocG1fcnVudGltZV9y
ZXN1bWVfYW5kX2dldCwgZXRjLikuIEZvcmNpbmcgdGhpcyBvbiBjb25zdW1lciBkcml2ZXJzIGxp
a2UKPiB0aGUgUFZUIHNlbnNvciBzZWVtcyBsaWtlIGFuIGluYXBwcm9wcmlhdGUgZGVwZW5kZW5j
eS4KPiAKPiBBZGRpdGlvbmFsbHksIEkgZGlzY292ZXJlZCB0aGF0IHRoZSBQV00gZHJpdmVyIGhh
cyBhIHNpbWlsYXIgcHJvYmxlbSwKPiBzaWxlbnRseSBmYWlsaW5nIGJlY2F1c2UgYW5vdGhlciBj
bG9jaywgQ0xLX1BFUklTWVNfQVBCMV9IQ0xLLCBpcyBub3QKPiBlbmFibGVkLgo+IAo+IFRoZSBt
b3N0IGNvcnJlY3Qgc29sdXRpb24gbGlrZWx5IGludm9sdmVzIHJlZmFjdG9yaW5nIHRoZSBjbG9j
ayBwYXJlbnQKPiByZWxhdGlvbnNoaXBzIGluIGNsay10aDE1MjAtYXAuYy4gSG93ZXZlciwgYXMg
YSBtb3JlIGltbWVkaWF0ZSBhbmQgbGVzcwo+IGludmFzaXZlIGZpeCwgSSBwcm9wb3NlIHdlIGFw
cGx5IHRoZSBDTEtfSUdOT1JFX1VOVVNFRCBmbGFnIGZvciBib3RoCj4gQ0xLX0NQVTJBT05fWDJI
IGFuZCBDTEtfUEVSSVNZU19BUEIxX0hDTEsgaW4gdGhlIHYyIHBhdGNoLiBUaGlzIHdpbGwgZml4
Cj4gdGhlIGJvb3QgaGFuZyBhbmQgdGhlIFBXTSBpc3N1ZSB3aGlsZSB3ZSBjb25zaWRlciB0aGUg
bGFyZ2VyIGNsb2NrCj4gZHJpdmVyIGNoYW5nZXMgc2VwYXJhdGVseS4KPiAKPiBEb2VzIHRoYXQg
c291bmQgbGlrZSBhIHJlYXNvbmFibGUgcGxhbiBmb3IgdGhlIHYyIHNlcmllcz8KClllcywgSSB0
aGluayB0aGF0IHNvdW5kcyBsaWtlIGEgZ29vZCBwbGFuLiBJIGFtIG9rYXkgd2l0aCBhZGRpbmcK
Q0xLX0lHTk9SRV9VTlVTRUQgZm9yIENMS19DUFUyQU9OX1gySCBhbmQgQ0xLX1BFUklTWVNfQVBC
MV9IQ0xLIHVudGlsIGEKYmV0dGVyIHNvbHV0aW9uIGlzIGZvdW5kLgoKSSBsaWtlIHRoZSBpZGVh
IG9mIHJldmlzdGluZyB0aGUgcGFyZW50IHJlbGF0aW9uc2hpcHMgaW4gdGhlIGRyaXZlci4gSQph
ZGRlZCBDTEtfSUdOT1JFX1VOVVNFRCB0byBzZXZlcmFsIGNsb2NrcyBpbiBvcmRlciB0byBmaXgg
Ym9vdCBoYW5ncwp3aGVuIEkgcmVtb3ZlZCBjbGtfaWdub3JlX3VudXNlZCBmcm9tIHRoZSBrZXJu
ZWwgY21kbGluZS4gSG93ZXZlciwgSQpkb24ndCB0aGluayB0aGF0IEkgYWRkcmVzc2VkIHRoZSBy
b290IGNhdXNlLgoKVGhhbmtzLApEcmV3Ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
