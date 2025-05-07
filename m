Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72D6C3ABC5
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHNeZW6vJqE9EDT3xMe2OOJI1YNwf3xGwYJbu1XGeng=; b=vrMot1zstzBm/c
	rKEgoZDFFogXHyKRctQN0PStqrnJh9lT1ZBIOB4rEJj6U5sSp6v1iPIfBJEx80DWyBTmbOP/mepfm
	CXEhnl+nikZjy20zi8nIER7MvonapyuSIO0S6zHp8hcEozZXNCnf6BaQpAHMsfUSe2bOosGjyxakA
	idZBQaEDkaaHRO7izJKiHLdClRQwY5z7wERffU4lzXijbf1MGJWWfjp/owO2SXbrZL3ld4pX3yg3A
	JWiuwtfvasQmoDfC04N5E22zR35IdzI0suPpl0XX2GFs/8YZMTT1GpyzygsAbHpe3sCs6qO40/h4D
	1dl6RAhPbZUEv8z+3W6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXJ-0000000GJIH-1yZT;
	Wed, 07 May 2025 17:26:25 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChTo-0000000G8Kf-2xxI
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 16:18:48 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2cc9045bae9so10068fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 09:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746634723; x=1747239523; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upjViEFaEDV8pwi3bE89UDVAqHk4uCfII2dkKtqh7XQ=;
        b=WE4/iDt/1sAq4WaCsTMMbQt3rjaI02U8s+fIXzV0+nd7ASaxUMuvr0XCEwvlSs4P3b
         wQwYOv0j4MOR3+feNlCNArw6ORszZQI5Pi8z9p+7zbZiIpLlcVouU22KQ8CpHezbF1pn
         m1s8Pyck+k2WiOp9hwUBYoxHkBXxToPxF27aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746634723; x=1747239523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upjViEFaEDV8pwi3bE89UDVAqHk4uCfII2dkKtqh7XQ=;
        b=dn9/dypt4pdzR6b5X4r8rU/6Xbbir4zkQcLsCqI3uyAb0RE0VxT3PSP9/QFcAR9weS
         jzD+BPw1meqvUoYh++IXi2+QjlCQHdu9O5WNCUHKxuzsUWzb2maph3p9jJyhWaKqC5dT
         i9c8oh2iI2KgkrPa5tlE4YWmvpBsxcIFTalw9gojcii03JwihCG1AgLrMQ56Xc9p9Cgc
         OjT1BCzrapxxIQFWs29nBB9JTtcX36c38AluMEM36S6XOgalwnyWmy9GWMKJ080Tfrfq
         TwyVBAQ9NlCAcD3Chw/2Y0tqlBJJj50+d9NnXOCKsik1GtCnvuAHwLjAbZ4S6npJ6M7C
         wiLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYedVuYk7fjbCtu7au+/O9idQC0iDNxEwmP2wbXgl5BcOZpKPhbOfBhYjqr9LjJ97fO/euVM3c1EgHug==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkccRzG4UBRAhQpQJZJ8SZR6Z3H5ofJgoDg+ZfH4N7LblzPvFz
	N9iKNXquATDhKvTfekHfRSlaxJAfXc7K7vOBQxBixYkQ/ZuE63awpPZpwQJkMPYUsEz3vj4vHVs
	VrszQGHBG2pCR8eOv3t1KHwixn4VpQtPWQEyO
X-Gm-Gg: ASbGncugn/u23v3txIgl2uoyB9mSbZjLWpvBU9YjdqNxpQ51X+I7oOBf+9NwHkP89Io
	UEjPRYDvF/ReeQeY+ftlZymUefLkHUIOwmpjVosQEvtScGP0HjmbbpFK2qASIZBrafcX2Ymxx4V
	qbxEKyYNnfA2G1rUqKDTmP53H2trbk3/zBvvqMWW6Wpjbi85NwK40=
X-Google-Smtp-Source: AGHT+IG06GO6NGnzHXdYuy9FYMZzPpX9XA6RRfNjedz05neS+lqG6xqVuI1NQA+Rq9jjZ9XV1xQ99xAxsvZLr21m4So=
X-Received: by 2002:a05:6870:891b:b0:2d5:d5f:3b0f with SMTP id
 586e51a60fabf-2db5c110bc3mr836147fac.12.1746634723111; Wed, 07 May 2025
 09:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250426135954.5614-1-jszhang@kernel.org>
In-Reply-To: <20250426135954.5614-1-jszhang@kernel.org>
From: Jeff Xu <jeffxu@chromium.org>
Date: Wed, 7 May 2025 09:18:31 -0700
X-Gm-Features: ATxdqUEg19PZX8xAL4phcTTjEkVkJGWGNXEx6VSuIyaRIyEHgGAoYnTs8-k6z_o
Message-ID: <CABi2SkXJgeLLYQEp1c7EepYzpGU+d0TsOZ5ix6PUUmJLuHyvwQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: enable mseal sysmap for RV64
To: Jisheng Zhang <jszhang@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Kees Cook <kees@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_091844_868438_EF8EC041 
X-CRM114-Status: GOOD (  18.77  )
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

SGkgSmlzaGVuZwoKSXQgc2VlbXMgbW0gbWFpbnRhaW5lcnMgbWlnaHQgcHJlZmVyIGFyY2ggY2hh
bmdlIHJldmlld2VkIGJ5IGFyY2gKbWFpbnRhaW5lciBhbmQgZ29lcyB0byBhcmNoIHRyZWUsIGFj
Y29yZGluZyB0byBkaXNjdXNzaW9uIGluIFsxXSwgSQpkb24ndCBoYXZlIGFuIG9waW5pb24gb24g
dGhpcywgIGFkZGluZyBtbSBtYWludGFpbmVycyBhcyBGWUkuCgpPbiBTYXQsIEFwciAyNiwgMjAy
NSBhdCA3OjE24oCvQU0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToK
Pgo+IFByb3ZpZGUgc3VwcG9ydCBmb3IgQ09ORklHX01TRUFMX1NZU1RFTV9NQVBQSU5HUyBmb3Ig
UlY2NCwgY292ZXJpbmcgdGhlCj4gdmRzbywgdnZhci4KPgo+IFBhc3NlZCBzeXNtYXBfaXNfc2Vh
bGVkIGFuZCBtc2VhbF90ZXN0IHNlbGYgdGVzdHMuCj4gUGFzc2VkIGJvb3RpbmcgYSBidWlsZHJv
b3Qgcm9vdGZzIGltYWdlIGFuZCBhIGNsaSBkZWJpYW4gcm9vdGZzIGltYWdlLgo+Cm1tIG1haW50
YWluZXJzIGxpa2UgdG8gZ2V0IGNvbmZpcm1hdGlvbiB0aGF0IHRoZSBhcmNoIGRvZXNuJ3QgcmVs
eSBvbgpyZW1hcHBpbmcgdGhlIFZEU08sIFZWQVIsIG9yIGFueSBvdGhlciBzcGVjaWFsIG1hcHBp
bmdzLCBzZWUKZGlzY3Vzc2lvbiBpbiBbMl0KCj4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFu
ZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IENjOiBKZWZmIFh1IDxqZWZmeHVAY2hyb21pdW0ub3Jn
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgfCAxICsKPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvdmRzby5jIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKUGxlYXNlIGNvbnNpZGVyIHVwZGF0aW5nIGRvY3VtZW50IGFzIHBhcnQg
b2YgeW91ciBwYXRjaDoKZmVhdHVyZXMvY29yZS9tc2VhbF9zeXNfbWFwcGluZ3MvYXJjaC1zdXBw
b3J0LnR4dApEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbXNlYWwucnN0CgpTYW1wbGUgY2hh
bmdlIGluIFszXQoKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jp
c2N2L0tjb25maWcKPiBpbmRleCBiYmVjODdiNzkzMDkuLjNjYjBiMDVlZWY2MiAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAt
NzAsNiArNzAsNyBAQCBjb25maWcgUklTQ1YKPiAgICAgICAgICMgTExEID49IDE0OiBodHRwczov
L2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvaXNzdWVzLzUwNTA1Cj4gICAgICAgICBzZWxl
Y3QgQVJDSF9TVVBQT1JUU19MVE9fQ0xBTkcgaWYgTExEX1ZFUlNJT04gPj0gMTQwMDAwCj4gICAg
ICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19MVE9fQ0xBTkdfVEhJTiBpZiBMTERfVkVSU0lPTiA+
PSAxNDAwMDAKPiArICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX01TRUFMX1NZU1RFTV9NQVBQ
SU5HUyBpZiA2NEJJVCAmJiBNTVUKVGhlICJpZiA2NEJJVCAmJiBNTVUiIGFyZSBub3QgbmVlZGVk
IGhlcmUuCgpNTVUgaXMgbm90IGNoZWNrZWQgYnkgTVNFQUxfU1lTVEVNX01BUFBJTkdTLCB3aGlj
aCB3ZSBzaG91bGQsICB0aGlzCmNhbiBnbyB0byBzZWN1cml0eS9LY29uZmlnIHNlcGFyYXRlbHku
IElmIHlvdSdkIGxpa2UsIHBsZWFzZSBzdWJtaXQgYQpmaXggdG8gbW0gdHJlZSBkaXJlY3RseS4K
ClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvN0VCMDg3QjcyQzRGQkREMysyMDI1MDQx
NzEzMjQxMC40MDQwNDMtMS13YW5neXVsaUB1bmlvbnRlY2guY29tLywKWzJdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8zZGU1NTlkNi1iZTE5LTQ0YmMtYmE4Zi00YzUyZDRiY2E2ODRAbHVj
aWZlci5sb2NhbC8KWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC82NDhBQjMwMzFCNTYx
OEMwKzIwMjUwNDE1MTUzOTAzLjU3MDY2Mi0xLXdhbmd5dWxpQHVuaW9udGVjaC5jb20vCgpUaGFu
a3MKLUplZmYKCj4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19QQUdFX1RBQkxFX0NIRUNL
IGlmIE1NVQo+ICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfUEVSX1ZNQV9MT0NLIGlmIE1N
VQo+ICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfUlQKPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvdmRzby5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jCj4gaW5kZXggY2My
ODk1ZDFmYmMyLi4zYThlMDM4YjEwYTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dmRzby5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jCj4gQEAgLTEzNiw3ICsxMzYs
NyBAQCBzdGF0aWMgaW50IF9fc2V0dXBfYWRkaXRpb25hbF9wYWdlcyhzdHJ1Y3QgbW1fc3RydWN0
ICptbSwKPgo+ICAgICAgICAgcmV0ID0KPiAgICAgICAgICAgIF9pbnN0YWxsX3NwZWNpYWxfbWFw
cGluZyhtbSwgdmRzb19iYXNlLCB2ZHNvX3RleHRfbGVuLAo+IC0gICAgICAgICAgICAgICAoVk1f
UkVBRCB8IFZNX0VYRUMgfCBWTV9NQVlSRUFEIHwgVk1fTUFZV1JJVEUgfCBWTV9NQVlFWEVDKSwK
PiArICAgICAgICAgICAgICAgKFZNX1JFQUQgfCBWTV9FWEVDIHwgVk1fTUFZUkVBRCB8IFZNX01B
WVdSSVRFIHwgVk1fTUFZRVhFQyB8IFZNX1NFQUxFRF9TWVNNQVApLAo+ICAgICAgICAgICAgICAg
ICB2ZHNvX2luZm8tPmNtKTsKPgo+ICAgICAgICAgaWYgKElTX0VSUihyZXQpKQo+IC0tCj4gMi40
Ny4yCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
