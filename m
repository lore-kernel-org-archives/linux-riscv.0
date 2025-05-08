Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F70C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 17:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=A7FSY2MT58eql30E5POVcmbgPWeVZBMscfKb1bhRdlw=; b=PQOAAc+Zmvgx4QjjGNvtU96kwf
	53gDO/E39rrPjOYeAd3+dTGx73c62rqYMJa8CCtquG4yTL/ju0MwzPSUl3QkeBOzQqmK2cCBl2sX2
	lLIiUX1qpC3zunIA8dbiaONiVq6iEuhvfc9lSCnQqyxRTHm4Q/bCEzZfxzNV7Ykz0O5uKhTBGvx/H
	E1TKj2Lz7/Ep7efPytZJHvVaGvrNoNqQtuyT3xqdhQAft65XqkznWOeXC3apDVBG5aXjwQwCNzEg8
	L7nu7gnfGcGcPGv3AVe9lUzwOE5iwqzXE9G0bbhYFIszKmYnKaVFgsdzBM1Ko3DhteMNXkjaVEdzU
	PM9wK3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5Dg-00000001RMb-2Ba8;
	Thu, 08 May 2025 17:39:40 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5Dd-00000001RLw-0PtO
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 17:39:39 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22e70a9c6bdso21838765ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746725976; x=1747330776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Q2vg1BTSM42eTHo3pl1hZh9V4Pj/emdMlH/CKlkCHs=;
        b=tD3BXUYOpObJPmm1VvLAj+wgUrl6Qz9vVm6TNTadLhEdujeJWvSNr+4z2R1u1vfIoo
         0ongc49jfR7Z9vuaLuwCqdLfqhWMfwt4hUdiDW3T/MlS7gu6QQWmHsYSgVE9PGXnzzxc
         kSY9L8ZE8VYVsuRnrv++OMFwDa8PpdHwq5I3ZZD614gtR9Lun5UVPMkbkmklWDvOd02g
         gqZe/JXEGG3byxIcgYBnEsfIxRqd+o5EBvBFxqV/3WJSEGFauumfF4nBW/sBqObshdCY
         m8f1IlLiTAQA7YG3kNeLnF68WJ8Y9GBXUsVnQF6DWIMw5WXc8h5+phQGx4XazIX137sX
         4Cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746725976; x=1747330776;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Q2vg1BTSM42eTHo3pl1hZh9V4Pj/emdMlH/CKlkCHs=;
        b=dJdVt1w3vwjPLe8nadjCqwW9+RQC2JFU+U+Shb7uAE2J4gunZVxOdaXsAuO2jk0sfB
         PdyqEwpzwXAPO+Y+ti06ppQnfySxpahg6YE8pz0L2mtkRAkSvdXddW+XS2l90ASoR3VP
         Cb5trsyjw5VC92CQRWo47kMA/pKOc30hdoBla3nOfEaNi55k2E3C+r6TVEi5m4Xv7Pe5
         +0T6WhWHBWdRzN68fYLUWj+gblEh75Mw+tAe7NDZ9u5zWT1k16JbKuM5AztggrxysReQ
         zSyB1UKLwPS9tJzz5hTNkQlYAKSz1aW8TB7r6hxTRugxSmABi83p4UQ3UIl+rTpGCm8o
         ImDg==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZZV2uFW4JRXeBxmpZe9OozuGkc9ZatNVlEvYynXB9TYQHKkp9fK7xJLnWQmN65gJbcfktpETu0oSew==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI9lmUdDfvSM3vI5wgF9ZCDdBjZho22mZ1k7Gw7RxDzHcxZskt
	RDhqBCIwx1/mPS1uxGTDOGElnVIawrNmW4EcX0ubjV//EAzgjUrZtqbmPS8GsXw=
X-Gm-Gg: ASbGnctV7wJtH9I5JNma/gRALvolwn6ZhMr0MN51fg6J5tYWDnRGlzOvkM/C24q8GbJ
	DN8/8oPLQfaoz7eLJGIObhmL7scln68IOm0DjMj4Nkdtx+Urg8mpog2dxtjZdf8HMN+OXSkkTTk
	/0A8l/CJ/lPVuprbsoLa47yiIfaL+GjQh8aW05wuyCC1q7hmDvigCRMe/ILGWigRg3T69RXrwTI
	yI+VWu1b2XlXkBr83gQE9L1QlI+KBX1VXrzOptPNmRSxvDcWr51EhAzgasOJy3vA+S7YLOmcAEi
	tMxM+WdGLhg2y4o4XCYqJjRgLPhSw676qg==
X-Google-Smtp-Source: AGHT+IEmGJ9YfFR3Eyhf15Bqfj3jceFTb5e0DgSI0Pb7USDVv/AkviW/WYTgDJ7svFwBHzKizS+WBw==
X-Received: by 2002:a17:902:e949:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22fc8e99d25mr3358715ad.40.1746725976096;
        Thu, 08 May 2025 10:39:36 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82745efsm1971375ad.134.2025.05.08.10.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:39:35 -0700 (PDT)
Date: Thu, 08 May 2025 10:39:35 -0700 (PDT)
X-Google-Original-Date: Thu, 08 May 2025 10:39:33 PDT (-0700)
Subject: Re: [PATCH] riscv: enable mseal sysmap for RV64
In-Reply-To: <5e7f2acd-2eef-4e69-9c11-ba8d1ec0bbc5@lucifer.local>
CC: jeffxu@chromium.org, jszhang@kernel.org, akpm@linux-foundation.org,
  Liam.Howlett@oracle.com, kees@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-mm@kvack.org, linux-hardening@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lorenzo.stoakes@oracle.com
Message-ID: <mhng-db41d38d-d3ec-4515-99f9-7368c82d46ca@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_103937_141639_1FF759F9 
X-CRM114-Status: GOOD (  35.27  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwNyBNYXkgMjAyNSAwOToyMjowOSBQRFQgKC0wNzAwKSwgbG9yZW56by5zdG9ha2Vz
QG9yYWNsZS5jb20gd3JvdGU6Cj4gT24gV2VkLCBNYXkgMDcsIDIwMjUgYXQgMDk6MTg6MzFBTSAt
MDcwMCwgSmVmZiBYdSB3cm90ZToKPj4gSGkgSmlzaGVuZwo+Pgo+PiBJdCBzZWVtcyBtbSBtYWlu
dGFpbmVycyBtaWdodCBwcmVmZXIgYXJjaCBjaGFuZ2UgcmV2aWV3ZWQgYnkgYXJjaAo+PiBtYWlu
dGFpbmVyIGFuZCBnb2VzIHRvIGFyY2ggdHJlZSwgYWNjb3JkaW5nIHRvIGRpc2N1c3Npb24gaW4g
WzFdLCBJCj4+IGRvbid0IGhhdmUgYW4gb3BpbmlvbiBvbiB0aGlzLCAgYWRkaW5nIG1tIG1haW50
YWluZXJzIGFzIEZZSS4KPgo+IFRoYW5rcyBKZWZmLCBhcHByZWNpYXRlIHRoZSBwaW5nIQo+Cj4g
SmlzaGVuZyAtIHRoZSBtYWluIHBvaW50IGhlcmUgaXMgdG8gZW5zdXJlIHRoYXQgdGhlIGFyY2gg
ZG9lc24ndCByZWx5IGluIGFueSB3YXkKPiBvbiwgd2l0aGluIHRoZSBhcmNoIGNvZGUgaXRzZWxm
LCByZWxvY2F0aW5nIGFueSBvZiB0aGVzZSBtYXBwaW5ncy4gSXQncyBwcmV0dHkKPiBlYXN5IHRv
IGV5ZWJhbGwgaXQgYW5kIGdldCBhIHNlbnNlLgo+Cj4gQmVjYXVzZSBpZiB0aGlzIGlzIHRoZSBj
YXNlLCB0aGUgYXJjaCB3aWxsIGJlIGJyb2tlbiBieSB0aGlzIGNoYW5nZSBzaG91bGQgYQo+IHVz
ZXIgZW5hYmxlIGl0LCBhbmQgb2J2aW91c2x5IHdlJ2QgcmF0aGVyIGF2b2lkIHRoYXQhIDopCj4K
PiBJdCdzIHJlYWxseSBsaWtlbHkgdGhhdCB5b3UncmUgZmluZSwgYXMgaXQnZCBiZSB1bnVzdWFs
IGZvciBhbiBhcmNoIHRvIGRvIHRoaXMsCj4gYnV0IEkgc3Ryb25nbHkgc3VnZ2VzdCB5b3UgZG8g
c28uCj4KPiBBbmQgeWVzLCBJIHRoaW5rIHRoZXNlIHNob3VsZCByZWFsbHkgZ28gdGhyb3VnaCBh
cmNoIHRyZWVzIGFzIGV4cGxpY2l0bHkgYXJjaAo+IGNvZGUuCj4KPiBUaGFua3MsIExvcmVuem8K
Pgo+Pgo+PiBPbiBTYXQsIEFwciAyNiwgMjAyNSBhdCA3OjE24oCvQU0gSmlzaGVuZyBaaGFuZyA8
anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPj4gPgo+PiA+IFByb3ZpZGUgc3VwcG9ydCBmb3Ig
Q09ORklHX01TRUFMX1NZU1RFTV9NQVBQSU5HUyBmb3IgUlY2NCwgY292ZXJpbmcgdGhlCj4+ID4g
dmRzbywgdnZhci4KPj4gPgo+PiA+IFBhc3NlZCBzeXNtYXBfaXNfc2VhbGVkIGFuZCBtc2VhbF90
ZXN0IHNlbGYgdGVzdHMuCj4+ID4gUGFzc2VkIGJvb3RpbmcgYSBidWlsZHJvb3Qgcm9vdGZzIGlt
YWdlIGFuZCBhIGNsaSBkZWJpYW4gcm9vdGZzIGltYWdlLgo+PiA+Cj4+IG1tIG1haW50YWluZXJz
IGxpa2UgdG8gZ2V0IGNvbmZpcm1hdGlvbiB0aGF0IHRoZSBhcmNoIGRvZXNuJ3QgcmVseSBvbgo+
PiByZW1hcHBpbmcgdGhlIFZEU08sIFZWQVIsIG9yIGFueSBvdGhlciBzcGVjaWFsIG1hcHBpbmdz
LCBzZWUKPj4gZGlzY3Vzc2lvbiBpbiBbMl0KCkRvIHlvdSBoYXZlIHNvbWUgZGVzY3JpcHRpb24g
b2Ygd2hhdCByZW1hcHBpbmcgaXMgZGlzYWxsb3dlZCBoZXJlPyAgClRoZXJlJ3Mgbm90IGEgdG9u
IGluIHRoYXQgcmVmZXJlbmNlZCB0aHJlYWQuCgpXZSBwbGF5IGEgZmV3IHRyaWNrcyB3aXRoIHJl
bWFwcGluZywgaW5jbHVkaW5nIHNvbWUgYWxpYXNpbmcgdG8gaGFuZGxlIApkaWZmZXJlbnQgVkEg
d2lkdGhzIGFuZCB0ZXh0IHBhdGNoaW5nICh2aWEgcG9rZSBwYWdlcykuICBJSVJDIHRob3NlIGFy
ZSAKc2ltaWxhciBpbiBzcGlyaXQgdG8gd2hhdCdzIGdvaW5nIG9uIGluIHg4Ni9hcm02NCBsYW5k
LCB0aG91Z2ggc29tZXRpbWVzIAp0aGUgZXhhY3QgZmxhdm9yIG9mIHRoZSB0cmljayBtYXR0ZXJz
LiAgSWYgeW91J3ZlIGdvdCBzb21ldGhpbmcgSSBjYW4gCmxvb2sgYXQgaXQgbWlnaHQgc2F2ZSBt
ZSBmcm9tIGhhdmluZyB0byByZWFkIHRob3VnaCB0aGUgbW0gY29kZS4uLgoKYW5kIHlhLCB3ZSds
bCBwaWNrIGl0IHVwIHRocm91Z2ggdGhlIGFyY2ggdHJlZSBvbmNlIG9uZSBvZiB1cyBjYW4gYmUg
CmNvbnZpbmNlZCB0aGlzIHdvcmtzIDspCgo+Pgo+PiA+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcg
WmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4gPiBDYzogSmVmZiBYdSA8amVmZnh1QGNocm9t
aXVtLm9yZz4KPj4gPiAtLS0KPj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgIHwgMSArCj4+
ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28uYyB8IDIgKy0KPj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gUGxlYXNlIGNvbnNpZGVyIHVw
ZGF0aW5nIGRvY3VtZW50IGFzIHBhcnQgb2YgeW91ciBwYXRjaDoKPj4gZmVhdHVyZXMvY29yZS9t
c2VhbF9zeXNfbWFwcGluZ3MvYXJjaC1zdXBwb3J0LnR4dAo+PiBEb2N1bWVudGF0aW9uL3VzZXJz
cGFjZS1hcGkvbXNlYWwucnN0Cj4+Cj4+IFNhbXBsZSBjaGFuZ2UgaW4gWzNdCj4+Cj4+ID4KPj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+
ID4gaW5kZXggYmJlYzg3Yjc5MzA5Li4zY2IwYjA1ZWVmNjIgMTAwNjQ0Cj4+ID4gLS0tIGEvYXJj
aC9yaXNjdi9LY29uZmlnCj4+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+ID4gQEAgLTcw
LDYgKzcwLDcgQEAgY29uZmlnIFJJU0NWCj4+ID4gICAgICAgICAjIExMRCA+PSAxNDogaHR0cHM6
Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2lzc3Vlcy81MDUwNQo+PiA+ICAgICAgICAg
c2VsZWN0IEFSQ0hfU1VQUE9SVFNfTFRPX0NMQU5HIGlmIExMRF9WRVJTSU9OID49IDE0MDAwMAo+
PiA+ICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfTFRPX0NMQU5HX1RISU4gaWYgTExEX1ZF
UlNJT04gPj0gMTQwMDAwCj4+ID4gKyAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19NU0VBTF9T
WVNURU1fTUFQUElOR1MgaWYgNjRCSVQgJiYgTU1VCj4+IFRoZSAiaWYgNjRCSVQgJiYgTU1VIiBh
cmUgbm90IG5lZWRlZCBoZXJlLgo+Pgo+PiBNTVUgaXMgbm90IGNoZWNrZWQgYnkgTVNFQUxfU1lT
VEVNX01BUFBJTkdTLCB3aGljaCB3ZSBzaG91bGQsICB0aGlzCj4+IGNhbiBnbyB0byBzZWN1cml0
eS9LY29uZmlnIHNlcGFyYXRlbHkuIElmIHlvdSdkIGxpa2UsIHBsZWFzZSBzdWJtaXQgYQo+PiBm
aXggdG8gbW0gdHJlZSBkaXJlY3RseS4KPj4KPj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC83RUIwODdCNzJDNEZCREQzKzIwMjUwNDE3MTMyNDEwLjQwNDA0My0xLXdhbmd5dWxpQHVu
aW9udGVjaC5jb20vLAo+PiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzNkZTU1OWQ2
LWJlMTktNDRiYy1iYThmLTRjNTJkNGJjYTY4NEBsdWNpZmVyLmxvY2FsLwo+PiBbM10gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzY0OEFCMzAzMUI1NjE4QzArMjAyNTA0MTUxNTM5MDMuNTcw
NjYyLTEtd2FuZ3l1bGlAdW5pb250ZWNoLmNvbS8KPj4KPj4gVGhhbmtzCj4+IC1KZWZmCj4+Cj4+
ID4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19QQUdFX1RBQkxFX0NIRUNLIGlmIE1NVQo+
PiA+ICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfUEVSX1ZNQV9MT0NLIGlmIE1NVQo+PiA+
ICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfUlQKPj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvdmRzby5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jCj4+ID4gaW5kZXgg
Y2MyODk1ZDFmYmMyLi4zYThlMDM4YjEwYTIgMTAwNjQ0Cj4+ID4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdmRzby5jCj4+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jCj4+ID4gQEAg
LTEzNiw3ICsxMzYsNyBAQCBzdGF0aWMgaW50IF9fc2V0dXBfYWRkaXRpb25hbF9wYWdlcyhzdHJ1
Y3QgbW1fc3RydWN0ICptbSwKPj4gPgo+PiA+ICAgICAgICAgcmV0ID0KPj4gPiAgICAgICAgICAg
IF9pbnN0YWxsX3NwZWNpYWxfbWFwcGluZyhtbSwgdmRzb19iYXNlLCB2ZHNvX3RleHRfbGVuLAo+
PiA+IC0gICAgICAgICAgICAgICAoVk1fUkVBRCB8IFZNX0VYRUMgfCBWTV9NQVlSRUFEIHwgVk1f
TUFZV1JJVEUgfCBWTV9NQVlFWEVDKSwKPj4gPiArICAgICAgICAgICAgICAgKFZNX1JFQUQgfCBW
TV9FWEVDIHwgVk1fTUFZUkVBRCB8IFZNX01BWVdSSVRFIHwgVk1fTUFZRVhFQyB8IFZNX1NFQUxF
RF9TWVNNQVApLAo+PiA+ICAgICAgICAgICAgICAgICB2ZHNvX2luZm8tPmNtKTsKPj4gPgo+PiA+
ICAgICAgICAgaWYgKElTX0VSUihyZXQpKQo+PiA+IC0tCj4+ID4gMi40Ny4yCj4+ID4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
