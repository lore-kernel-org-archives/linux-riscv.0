Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D42C54FB3
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jun 2025 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goqBQMsoKa2JjV3EHRnST55AiH83ko4f8OLw5yBhrCg=; b=fCU+xH9JHIu1x8
	Ymmmg0wdUgXjO7wzSTZijOxmbITqkofrc9salaXQMDo5VQQonffNsGVDmdJTKE93AmKJxRLGcC4g5
	oCep03ssycWzpF9ElePR7/QwpC2BLJRuJq6jv+uynI0Kb6EXVEVpdkuWflbbrOqtkpCEjX/YuDUyq
	Cr8IusFs8iRnK9apU4HsqPOR06GZaEvp01swlZQwCcEiJlkdE8bsuYgO+A1JcJcAPqwmPXKcdJP5z
	3Jol6w6958QD7BE+ZdkK9+mmcEbJeoQWwTMF9udomDW8SrEsFMPqxWpluxvJvLtwlyj6LYrKZIsvk
	0nIF2e5ag505y61knwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLmYS-00000005kpx-0mge;
	Sun, 01 Jun 2025 17:33:04 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLmYP-00000005kpI-23dR
	for linux-riscv@lists.infradead.org;
	Sun, 01 Jun 2025 17:33:02 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b2d46760950so3511572a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 01 Jun 2025 10:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748799180; x=1749403980; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KwxqXGlyR2Fx/nGgiKLqYKrCCGLZKVDH93SX+seqRzQ=;
        b=XIGG4X7rWke9yluiTx5oLqK2kUComqTkqNMCDn/X0O8f6RrQxkKa5W9KVAk+VmpoGR
         tohpt+qsunc+aLfSEdhYSFaaIqZyR6jjvIr4dBKHtaMB/he8dPDkoCVPU+yXzzo+o3jV
         8hkgtZUxNdE8F6cSRHxPsGdGK3U+14JS/mAe7ExGlrrDhjkjwKPTXMdejTjEDZvFsCXX
         Sn+kPJ/BHw5VHL5nr4J4JeoKpWzoHFaVIXHvzsEGzb1FbxrAhNQQ+KNNmaVCaWVHwdke
         H/kPpxEfyqTbSJ3Z/Jo2nWeYqEsYRIMSYidyESRVu4nqFQ9n3OKFbz3OUrTWe8hP1Zzc
         s3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748799180; x=1749403980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwxqXGlyR2Fx/nGgiKLqYKrCCGLZKVDH93SX+seqRzQ=;
        b=n+81s+9dXbvL4knF8YL43w3H+X/N0s8u97wlVHITEx+JVytpAi8fCI9VjoD1/jeDJT
         2LZ7NGDbQHunCEpPF2Am+wH4zBBGEXnd47v3GAN/pmmZU6rUP7l9pd87wzNg2kI5mJf3
         BVF/iSa4hd5YoY++vBQPBkXERcsRq47Y/R5awhDmA2IT8Z3wHzzPMDaACxGwdoIsoWOs
         Nfi/96tDSaRo9vbTzj6SiciUJstZVdvPjLLp5dbs2VkYS1qXDwwoWyyQHJheivn+4mrd
         2e/BpMki08+Znci6RVBERA6R+y8ZRsvuBBl5gupj6Tnuw8YllgR0qI8/pT/8F24wyk2w
         uY8g==
X-Forwarded-Encrypted: i=1; AJvYcCU1wGQ/cycWQVSxqrHxjMM5cA2FnbyPRlljRe2iHa4T2hq3yCYnmLvG7R+ulCzUqivyVYy0QqZdSawnzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg0phhB6eUAdMF3M0K8o1apvwb5XuMN5ChOzbtjhYI9WwcRetZ
	1Z4NUr2y3yV/anCdcYFbOVZuB0CQORbtQ9yeKenLlXiuY37dhbwY894AtnKq3J9voKA=
X-Gm-Gg: ASbGncvPwUTFS1MHB7LEzBN4uf7ZGdBVsz5TnpIpLl3DVOSZ1MUM3fUi6HgvtCkxBw7
	AmLjf0w48GiyIcoi99mm5rdayM2N93amE0lPHY2buS8kHIf5a6fQAjmtdebDGYxiR1pREyHscGh
	w5jgJ2u4eW2yecSmiXAOcArRNnlG+U26+CXGzrDACeDp+GPgCWK5A2/5dyYzE9Y4BHxq8GQzZRL
	SHuVkCjtfRtX7EEyzOHPrOrVwewqZ0WJq35f7/UDzcDq2yupD+eAtlNAJQgVO43SH3+TMk3LyCm
	r4fA0LlbBnCm8MYgiV5MsS3qOXZqyrVI2Sg+0MzHnoc=
X-Google-Smtp-Source: AGHT+IHrFx7wYIOsRR7w+nhhaUaBjBPFlogADiEeijaQ54Eff3trva8IRdJ651TwtDaee4aD84OUNA==
X-Received: by 2002:a17:902:c952:b0:235:2799:634 with SMTP id d9443c01a7336-2355f763a5amr61139085ad.8.1748799180449;
        Sun, 01 Jun 2025 10:33:00 -0700 (PDT)
Received: from x1 ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd372esm57224935ad.128.2025.06.01.10.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 10:33:00 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:32:58 -0700
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
Message-ID: <aDyOyg6eqDEFg2ua@x1>
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <CGME20250524211525eucas1p244963b69e0531c95a9052e4a7a1d1e01@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-5-bdd2d5094ff7@samsung.com>
 <aDVxDJi0KkWXiPCK@x1>
 <61eecafb-8ad1-4306-88cb-a032eefb2e48@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61eecafb-8ad1-4306-88cb-a032eefb2e48@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_103301_772239_6DF40F5F 
X-CRM114-Status: GOOD (  28.64  )
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

T24gU3VuLCBKdW4gMDEsIDIwMjUgYXQgMDk6NTA6NTJBTSArMDIwMCwgTWljaGFsIFdpbGN6eW5z
a2kgd3JvdGU6Cj4gCj4gCj4gT24gNS8yNy8yNSAxMDowMCwgRHJldyBGdXN0aW5pIHdyb3RlOgo+
ID4gT24gU2F0LCBNYXkgMjQsIDIwMjUgYXQgMTE6MTQ6NTlQTSArMDIwMCwgTWljaGFsIFdpbGN6
eW5za2kgd3JvdGU6Cj4gPj4gQWRkIFBWVCBEVCBub2RlIGZvciB0aGVybWFsIHNlbnNvci4KPiA+
Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ft
c3VuZy5jb20+Cj4gPj4gLS0tCj4gPj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIw
LmR0c2kgfCAxMSArKysrKysrKysrKwo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgx
NTIwLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gPj4gaW5k
ZXggZjI0ZTEyZDcyNTlmYWJjZmJkYzJkZmE5NjZkNzU5ZGIwNjY4NGFiNC4uZmFmNWMzYWFmMjA5
YjI0Y2Q5OWRkYzM3N2E4OGUwOGE4Y2NlMjRmZSAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0
cy90aGVhZC90aDE1MjAuZHRzaQo+ID4+IEBAIC02NDgsNiArNjQ4LDE3IEBAIHBhZGN0cmxfYW9z
eXM6IHBpbmN0cmxAZmZmZmY0YTAwMCB7Cj4gPj4gIAkJCXRoZWFkLHBhZC1ncm91cCA9IDwxPjsK
PiA+PiAgCQl9Owo+ID4+ICAKPiA+PiArCQlwdnQ6IHB2dEBmZmZmZjRlMDAwIHsKPiA+PiArCQkJ
Y29tcGF0aWJsZSA9ICJtb29ydGVjLG1yNzUyMDMiOwo+ID4+ICsJCQlyZWcgPSA8MHhmZiAweGZm
ZjRlMDAwIDB4MCAweDgwPiwKPiA+PiArCQkJICAgICAgPDB4ZmYgMHhmZmY0ZTA4MCAweDAgMHgx
MDA+LAo+ID4+ICsJCQkgICAgICA8MHhmZiAweGZmZjRlMTgwIDB4MCAweDY4MD4sCj4gPj4gKwkJ
CSAgICAgIDwweGZmIDB4ZmZmNGU4MDAgMHgwIDB4NjAwPjsKPiA+PiArCQkJcmVnLW5hbWVzID0g
ImNvbW1vbiIsICJ0cyIsICJwZCIsICJ2bSI7Cj4gPj4gKwkJCWNsb2NrcyA9IDwmYW9uc3lzX2Ns
az47Cj4gPj4gKwkJCSN0aGVybWFsLXNlbnNvci1jZWxscyA9IDwxPjsKPiA+PiArCQl9Owo+ID4+
ICsKPiA+PiAgCQlncGlvQGZmZmZmNTIwMDAgewo+ID4+ICAJCQljb21wYXRpYmxlID0gInNucHMs
ZHctYXBiLWdwaW8iOwo+ID4+ICAJCQlyZWcgPSA8MHhmZiAweGZmZjUyMDAwIDB4MCAweDEwMDA+
Owo+ID4+Cj4gPj4gLS0gCj4gPj4gMi4zNC4xCj4gPj4KPiA+IAo+ID4gSSBmb3VuZCB0aGF0IG9u
IG15IGxwaTRhIHRoYXQgYm9vdCB3aGlsZSBoYW5nIGFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0Y2gu
Cj4gPiBJIHRoaW5rIHRoYXQgaXQgaXMgcmVsYXRlZCB0byBjbG9ja3MgYXMgYm9vdCBmaW5pc2hl
ZCBva2F5IHdoZW4gdXNpbmcKPiA+IGNsa19pZ25vcmVfdW51c2VkIG9uIHRoZSBrZXJuZWwgY21k
bGluZS4gRG8geW91IGhhcHBlbiBoYXZlIHRoYXQgaW4geW91cgo+ID4ga2VybmVsIGNtZGxpbmU/
Cj4gPiAKPiA+IEkgbmVlZCB0byBpbnZlc3RpZ2F0ZSBmdXJ0aGVyIHRvIHVuZGVyc3RhbmQgd2hp
Y2ggY2xvY2tzIGFyZSBjYXVzaW5nIHRoZQo+ID4gcHJvYmxlbS4KPiA+IAo+ID4gVGhhbmtzLAo+
ID4gRHJldwo+ID4gCj4gCj4gVGhhbmtzIGZvciB5b3VyIGVhcmxpZXIgbWVzc2FnZS4gSSd2ZSBp
bnZlc3RpZ2F0ZWQsIGFuZCB5b3Ugd2VyZSByaWdodAo+IGFib3V0IHRoZSBjbG9ja3Mg4oCTIHRo
ZSBzcGVjaWZpYyBvbmUgY2F1c2luZyB0aGUgaGFuZyBpcyBDTEtfQ1BVMkFPTl9YMkguCgpUaGFu
a3MgZm9yIHRyYWNraW5nIGRvd24gdGhlIGNsayBjYXVzaW5nIHRoZSBoYW5nLiBJIGNhbiBjb25m
aXJtIHRoYXQKdGhpcyBmaXhlcyB0aGUgYm9vdCBoYW5nOgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYyBiL2RyaXZlcnMvY2xrL3RoZWFkL2Nsay10aDE1MjAt
YXAuYwppbmRleCBlYmZiMWQ1OTQwMWQuLjRkMDE3OWI4YzE3YyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5jCisrKyBiL2RyaXZlcnMvY2xrL3RoZWFkL2Nsay10
aDE1MjAtYXAuYwpAQCAtNzkyLDcgKzc5Miw3IEBAIHN0YXRpYyBDQ1VfR0FURShDTEtfQU9OMkNQ
VV9BMlgsIGFvbjJjcHVfYTJ4X2NsaywgImFvbjJjcHUtYTJ4IiwgYXhpNF9jcHVzeXMyX2FjCiAg
ICAgICAgICAgICAgICAweDEzNCwgQklUKDgpLCAwKTsKIHN0YXRpYyBDQ1VfR0FURShDTEtfWDJY
X0NQVVNZUywgeDJ4X2NwdXN5c19jbGssICJ4MngtY3B1c3lzIiwgYXhpNF9jcHVzeXMyX2FjbGtf
cGQsCiAgICAgICAgICAgICAgICAweDEzNCwgQklUKDcpLCAwKTsKLXN0YXRpYyBDQ1VfR0FURShD
TEtfQ1BVMkFPTl9YMkgsIGNwdTJhb25feDJoX2NsaywgImNwdTJhb24teDJoIiwgYXhpX2FjbGtf
cGQsIDB4MTM4LCBCSVQoOCksIDApOworc3RhdGljIENDVV9HQVRFKENMS19DUFUyQU9OX1gySCwg
Y3B1MmFvbl94MmhfY2xrLCAiY3B1MmFvbi14MmgiLCBheGlfYWNsa19wZCwgMHgxMzgsIEJJVCg4
KSwgQ0xLX0lHTk9SRV9VTlVTRUQpOwogc3RhdGljIENDVV9HQVRFKENMS19DUFUyUEVSSV9YMkgs
IGNwdTJwZXJpX3gyaF9jbGssICJjcHUycGVyaS14MmgiLCBheGk0X2NwdXN5czJfYWNsa19wZCwK
ICAgICAgICAgICAgICAgIDB4MTQwLCBCSVQoOSksIENMS19JR05PUkVfVU5VU0VEKTsKIHN0YXRp
YyBDQ1VfR0FURShDTEtfUEVSSVNZU19BUEIxX0hDTEssIHBlcmlzeXNfYXBiMV9oY2xrLCAicGVy
aXN5cy1hcGIxLWhjbGsiLCBwZXJpc3lzX2FoYl9oY2xrX3BkLAoKPiAKPiBUaGlzIGFwcGVhcnMg
dG8gYmUgYW4gQUhCIGJ1cyBjbG9jayByZXF1aXJlZCBmb3IgQ1BVIGFjY2VzcyB0byB0aGUgQU9O
Cj4gZG9tYWluLiBNeSBwcm9wb3NlZCBzb2x1dGlvbiBpcyB0byBtYWtlIHRoZSBwdnQgbm9kZSBh
IGNoaWxkIG9mIGEgbmV3Cj4gcGFyZW50IGJ1cyBub2RlIGluIHRoZSBEZXZpY2UgVHJlZS4gVGhp
cyBuZXcgIkFPTiBidXMiIG5vZGUgd291bGQgdGhlbgo+IGV4cGxpY2l0bHkgcmVxdWVzdCBhbmQg
bWFuYWdlIENMS19DUFUyQU9OX1gySCwgZW5zdXJpbmcgaXQncyBlbmFibGVkCj4gd2hlbiBpdHMg
Y2hpbGRyZW4gYXJlIGFjY2Vzc2VkLgo+IAo+IFdoYXQgYXJlIHlvdXIgdGhvdWdodHMgb24gdGhp
cyBhcHByb2FjaD8KCkkgdGhpbmsgdGhhdCBpcyBhIGdvb2QgYXBwcm9hY2guIFRoZSBhbHRlcm5h
dGl2ZSB3b3VsZCBiZSB0byBqdXN0IGFkZApDTEtfSUdOT1JFX1VOVVNFRCBsaWtlIGFib3ZlLiBJ
J3ZlIGRvbmUgaXQgYmVmb3JlIGJ1dCBpdCBpcyBhIGJpdCBvZiBhCmhhY2suCgpUaGFua3MsCkRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
