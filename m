Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586D0C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmtzXvWR8PF2DIhokKCu3L0b0OtJOelZdXOSOl1e9W0=; b=HfuaQGhgp3/aho
	RM51DfiG0QrToLewdbsfGwfd5WZPpbo8jtD+bS5MbKtzfJtta8Vf35BeZG1MHJbPecb1UjqoMgopA
	xXXQMy0LL86ANTUidQIf2OKLDz0arwF9Wj+/DNbTJqWgQJ1UL2FC+jQnEmmQhXbNPiS3YKqewl45f
	FQ17oEZ0CckduGYOzPaVP0qZJFiVdYczwqeh6fdyWKm6ROdXHWPmmZT1p7e1BjtmWHxzazVrtZqo2
	F2Nyf2O2OxxuKxcQco4Wue5Ji1vYgiSRtiC86Ygit8bnh+9wQBXm3vWVVh34vKB0HKJpxUDAC/H6r
	E1WafB+JtRaSy/GuqFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJZs-0000000A1Xq-09hq;
	Fri, 25 Jul 2025 14:39:16 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJZp-0000000A1XF-0ymD
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 14:39:15 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2A6133F802
	for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753454349;
	bh=4mUY+1XR4b/e27uHYcOnJJ9KFj0pqpjkndNzpVgnRDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=HRQDx07IGbj/iBTv9HWQxJGa+CG0YnLerNR/911WBzjHF4YtSj+3h1bx2jmErkJp4
	 Qj7Rpz4JkFL9aME+vbmsdtFWsbc5BvfftVaaO+MdfUF+bx53MjhEUx+/R0c8oYCfTx
	 NLx+Z3kZecffsCzUrm7XF4nsuIuNetsGbMjsqz4aVnjY3KiBlELtviL/fgEi+QOQ2W
	 vlKcBj2DcjDiW20eGzUSlbzM0uHxUvwc5sRBMGICoyLYL6cbNd2wWp+wT1ov06uSX6
	 KU+8ocSm6Fz60IuulxPZ1qo1A7hYTm/XJutMBPyLfFTMZ65PjZZ4XGKqHnDqCE3hRW
	 dWrxaoL7GySDg==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-606b62ce2d4so2200188a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 07:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753454347; x=1754059147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mUY+1XR4b/e27uHYcOnJJ9KFj0pqpjkndNzpVgnRDU=;
        b=iSKnrNgSbKU214hviuYg5SRkke/NrbZxdXZVB/zvRbzVLd2c2Yr1faMkRa12zuWcSU
         29WmeThYlvy0cZt7mAOn1DK3LHN0el+WLcs0myB3E3kEUrECkTqBHUmLYnqrEUd0MpT3
         kLC8gJaP8xeXb67mxuewE3K2HgyzMFL+sLGBP+O3i/U5gl6EfFNVjcftezG9lTIR9hNJ
         /5BPJOyvAU8gVHXGuxBzTuWhcdBDBrbZXeVgaWwS47JUAXsF8cAAkIw38Url4VOw/OV8
         t5Z4EuEDSNfrZkuu4v12Dkk+hiG/J4v5VsjA/4bucGHU0EduUhUDuZRMq6Luzzu31Uj4
         Rkng==
X-Gm-Message-State: AOJu0Yxy+iTsehW9+SY63lZrwi4+K4C5ijUt7HS+vbV1wdAXf/DxydEs
	L2iUuSMIOAd4yT6OxHxMiohIS5JGhe6UrgbG8b66ZrGm5x89z9c05/W4gNeUWng2wnZrpbjeO4E
	isv34IY0xNuI9kEHLenKl+hwgkvlS6zHWcfMECLhKFT4UuikBk2VPTRGCjqTEG6pt5YOKNberCe
	74CGgRSH8I7w==
X-Gm-Gg: ASbGncvp1v/7Y6Ki+0VE/gZDSZc7utKBaKs1afxfU9hANit8gUxCtNokCdFJ9XepG3u
	/+GEUQtDSgnEE378Js7kV2tYwi5U59m+PMvOF8bpENW6kRnzWYKbCrvNxgvlSUnqQrqhHNiJGQL
	S6dKaM+8mrCsKxFVIIqNWPlRcJPrPRshluule9YamRpVXq5yQBDgccR11/F7y9nKJEKolNU7vLN
	OFTqz8QQT8tpaE2pj+YpIb2yL5+HBrLH1qry2l8tlivgEoKs74zsWGT5AvKNhWkZaB1odi3T1gR
	prRixi6Qj5bSewSYGVlJ5UhxHDYy2EM078EJbvlP1Zcs5lL5E6VEloOpE5bzAcgZQDE3PkxQzPc
	FaaEJla6NA6Q6PebdLXiH1/gsqtd259vQgfUeqC8e2SxXBjI=
X-Received: by 2002:a05:6402:84f:b0:612:a507:5b23 with SMTP id 4fb4d7f45d1cf-614f1bbef74mr2314229a12.11.1753454347278;
        Fri, 25 Jul 2025 07:39:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF14h0UnqVMVE8DmU1HkI4HkVFGaC2n5jgqzt8HvQEsuyPWhXxWakRNoUb1Vt7GxR2EJttOLg==
X-Received: by 2002:a05:6402:84f:b0:612:a507:5b23 with SMTP id 4fb4d7f45d1cf-614f1bbef74mr2314178a12.11.1753454346728;
        Fri, 25 Jul 2025 07:39:06 -0700 (PDT)
Received: from [192.168.103.102] (dynamic-046-114-110-103.46.114.pool.telefonica.de. [46.114.110.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd2fd3b1sm2185550a12.40.2025.07.25.07.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 07:39:05 -0700 (PDT)
Message-ID: <06955781-118d-4208-af28-cfbabd7d57c2@canonical.com>
Date: Fri, 25 Jul 2025 16:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] riscv: Kconfig & Makefile for riscv kernel control
 flow integrity
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-11-04b8fa44c98c@rivosinc.com>
 <b50da4ef-53ca-4edf-bd74-f5e037a14f99@canonical.com>
 <aIOTauktSYmw2LUV@debug.ba.rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <aIOTauktSYmw2LUV@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_073913_786534_97DEB022 
X-CRM114-Status: GOOD (  26.25  )
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

T24gMjUuMDcuMjUgMTY6MjMsIERlZXBhayBHdXB0YSB3cm90ZToKPiBPbiBGcmksIEp1bCAyNSwg
MjAyNSBhdCAwMToyNjo0NFBNICswMjAwLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+PiBP
biAyNS4wNy4yNSAwMTozNywgRGVlcGFrIEd1cHRhIHdyb3RlOgo+Pj4gRGVmaW5lcyBgQ09ORklH
X1JJU0NWX0tFUk5FTF9DRklgIGFuZCBzZWxlY3RzIFNIQURPV19DQUxMX1NUQUNLCj4+PiBhbmQg
QVJDSF9IQVNfS0VSTkVMX1NIQURPV19TVEFDSyBib3RoIHNvIHRoYXQgemljZmlzcyBjYW4gYmUg
d2lyZWQgdXAuCj4+Pgo+Pj4gTWFrZWZpbGUgY2hlY2tzIGlmIENPTkZJR19SSVNDVl9LRVJORUxf
Q0ZJIGlzIGVuYWJsZWQsIHRoZW4gbGlnaHQKPj4+IHVwIHppY2Zpc3MgYW5kIHppY2ZpbHAgY29t
cGlsZXIgZmxhZ3MuIENPTkZJR19SSVNDVl9LRVJORUxfQ0ZJIGlzCj4+PiBkZXBlbmRlbnQgb24g
Q09ORklHX1JJU0NWX1VTRVJfQ0ZJLiBUaGVyZSBpcyBubyByZWFzb24gZm9yIHVzZXIgdG8KPj4+
IG5vdCBzZWxlY3Qgc3VwcG9ydCBmb3IgdXNlciBjZmkgd2hpbGUgZW5hYmxpbmcgZm9yIGtlcm5l
bC4KPj4+Cj4+PiBjb21wYXQgdmRzbyBkb24ndCBuZWVkIGZjZi1wcm90ZWN0aW9uICh0b29sY2hh
aW4gbGFja3Mgc3VwcG9ydCkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxk
ZWJ1Z0ByaXZvc2luYy5jb20+Cj4+PiAtLS0KPj4+IMKgYXJjaC9yaXNjdi9LY29uZmlnwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDM3ICsrKysrKysrKysrKysrKysr
KysrKysrKyAKPj4+ICsrKysrKysrKy0KPj4+IMKgYXJjaC9yaXNjdi9NYWtlZmlsZcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA4ICsrKysrKysrCj4+PiDCoGFyY2gv
cmlzY3Yva2VybmVsL2NvbXBhdF92ZHNvL01ha2VmaWxlIHzCoCAyICstCj4+PiDCoGFyY2gvcmlz
Y3Yva2VybmVsL3Zkc28vTWFrZWZpbGXCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4gwqA0IGZp
bGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4gaW5k
ZXggMzg1YzNkOTNlMzc4Li4zMDViYTU3ODdmNzQgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2
L0tjb25maWcKPj4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4gQEAgLTI0NSw3ICsyNDUs
NyBAQCBjb25maWcgR0NDX1NVUFBPUlRTX0RZTkFNSUNfRlRSQUNFCj4+PiDCoMKgwqDCoCBkZXBl
bmRzIG9uIENDX0hBU19NSU5fRlVOQ1RJT05fQUxJR05NRU5UIHx8ICFSSVNDVl9JU0FfQwo+Pj4g
wqBjb25maWcgSEFWRV9TSEFET1dfQ0FMTF9TVEFDSwo+Pj4gLcKgwqDCoCBkZWZfYm9vbCAkKGNj
LW9wdGlvbiwtZnNhbml0aXplPXNoYWRvdy1jYWxsLXN0YWNrKQo+Pj4gK8KgwqDCoCBkZWZfYm9v
bCAkKGNjLW9wdGlvbiwtZnNhbml0aXplPXNoYWRvdy1jYWxsLXN0YWNrKSB8fCAkKGNjLSAKPj4+
IG9wdGlvbiwtbWFiaT1scDY0IC1tYXJjaD1ydjY0aW1hX3ppY2ZpbHBfemljZmlzcykKPj4+IMKg
wqDCoMKgICMgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtZWxmLXBzYWJp
LWRvYy9jb21taXQvIAo+Pj4gYTQ4NGU4NDNlNmVlYjUxZjBjYjdiODgxOWU1MGRhNmQyNDQ0ZDc2
OQo+Pj4gwqDCoMKgwqAgZGVwZW5kcyBvbiAkKGxkLW9wdGlvbiwtLW5vLXJlbGF4LWdwKQo+Pj4g
QEAgLTg2NCw2ICs4NjQsMTYgQEAgY29uZmlnIFJJU0NWX0lTQV9aSUNCT1AKPj4+IMKgwqDCoMKg
wqDCoCBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSBZLgo+Pj4gK2NvbmZp
ZyBUT09MQ0hBSU5fSEFTX1pJQ0ZJTFAKPj4+ICvCoMKgwqAgYm9vbAo+Pj4gK8KgwqDCoCBkZWZh
dWx0IHkKPj4+ICvCoMKgwqAgZGVwZW5kcyBvbiA2NEJJVCAmJiAkKGNjLW9wdGlvbiwtbWFiaT1s
cDY0IC1tYXJjaD1ydjY0aW1hX3ppY2ZpbHApCj4+PiArCj4+PiArY29uZmlnIFRPT0xDSEFJTl9I
QVNfWklDRklTUwo+Pj4gK8KgwqDCoCBib29sCj4+PiArwqDCoMKgIGRlZmF1bHQgeQo+Pj4gK8Kg
wqDCoCBkZXBlbmRzIG9uIDY0QklUICYmICQoY2Mtb3B0aW9uLC1tYWJpPWxwNjQgLW1hcmNoPXJ2
NjRpbWFfemljZmlzcykKPj4+ICsKPj4+IMKgY29uZmlnIFRPT0xDSEFJTl9ORUVEU19FWFBMSUNJ
VF9aSUNTUl9aSUZFTkNFSQo+Pj4gwqDCoMKgwqAgZGVmX2Jvb2wgeQo+Pj4gwqDCoMKgwqAgIyBo
dHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1iaW51dGlscy0gCj4+PiBnZGIuZ2l0O2E9Y29t
bWl0O2g9YWVkNDQyODZlZmE4YWU4NzE3YTc3ZDk0YjUxYWMzNjE0ZTJjYTZkYwo+Pj4gQEAgLTEx
ODIsNiArMTE5MiwzMSBAQCBjb25maWcgUklTQ1ZfVVNFUl9DRkkKPj4+IMKgwqDCoMKgwqDCoCBz
cGFjZSBkb2VzIG5vdCBnZXQgcHJvdGVjdGlvbiAiZm9yIGZyZWUiLgo+Pj4gwqDCoMKgwqDCoMKg
IGRlZmF1bHQgbi4KPj4+ICtjb25maWcgUklTQ1ZfS0VSTkVMX0NGSQo+Pj4gK8KgwqDCoCBkZWZf
Ym9vbCBuCj4+PiArwqDCoMKgIGJvb2wgImh3IGFzc2lzdGVkIHJpc2N2IGtlcm5lbCBjb250cm9s
IGZsb3cgaW50ZWdyaXR5IChrY2ZpKSIKPj4+ICvCoMKgwqAgZGVwZW5kcyBvbiA2NEJJVCAmJiAk
KGNjLW9wdGlvbiwtbWFiaT1scDY0IC0gCj4+PiBtYXJjaD1ydjY0aW1hX3ppY2ZpbHBfemljZmlz
cykKPj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBSSVNDVl9VU0VSX0NGSQo+Pj4gK8KgwqDCoCBzZWxl
Y3QgQVJDSF9TVVBQT1JUU19TSEFET1dfQ0FMTF9TVEFDSwo+Pj4gK8KgwqDCoCBzZWxlY3QgU0hB
RE9XX0NBTExfU1RBQ0sKPj4+ICvCoMKgwqAgc2VsZWN0IEFSQ0hfSEFTX0tFUk5FTF9TSEFET1df
U1RBQ0sKPj4+ICvCoMKgwqAgaGVscAo+Pj4gK8KgwqDCoMKgwqAgUHJvdmlkZXMgQ1BVIGFzc2lz
dGVkIGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgdG8gZm9yIHJpc2N2IGtlcm5lbC4KPj4+ICvCoMKg
wqDCoMKgIENvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgaXMgcHJvdmlkZWQgYnkgaW1wbGVtZW50aW5n
IHNoYWRvdyAKPj4+IHN0YWNrIGZvcgo+Pj4gK8KgwqDCoMKgwqAgYmFja3dhcmQgZWRnZSBhbmQg
aW5kaXJlY3QgYnJhbmNoIHRyYWNraW5nIGZvciBmb3J3YXJkIGVkZ2UuIAo+Pj4gU2hhZG93Cj4+
PiArwqDCoMKgwqDCoCBzdGFjayBwcm90ZWN0aW9uIGlzIGEgaGFyZHdhcmUgZmVhdHVyZSB0aGF0
IGRldGVjdHMgZnVuY3Rpb24gCj4+PiByZXR1cm4KPj4+ICvCoMKgwqDCoMKgIGFkZHJlc3MgY29y
cnVwdGlvbi4gVGhpcyBoZWxwcyBtaXRpZ2F0ZSBST1AgYXR0YWNrcy4gCj4+PiBSSVNDVl9LRVJO
RUxfQ0ZJCj4+PiArwqDCoMKgwqDCoCBzZWxlY3RzIENPTkZJR19TSEFET1dfQ0FMTF9TVEFDSyB3
aGljaCB1c2VzIHNvZnR3YXJlIGJhc2VkIHNoYWRvdwo+Pj4gK8KgwqDCoMKgwqAgc3RhY2sgYnV0
IGlzIHVucHJvdGVjdGVkIGFnYWluc3Qgc3RyYXkgd3JpdGVzLiBTZWxlY3RpbmcgCj4+PiBSSVND
Vl9LRVJORUxfQ0ZJCj4+PiArwqDCoMKgwqDCoCB3aWxsIHNlbGVjdCBDT05GSUdfRFlOQU1JQ19T
Q1MgYW5kIHdpbGwgZW5hYmxlIGhhcmR3YXJlIAo+Pj4gYXNzaXN0ZWQgc2hhZG93Cj4+PiArwqDC
oMKgwqDCoCBzdGFjayBwcm90ZWN0aW9uIGFnYWluc3Qgc3RyYXkgd3JpdGVzLgo+Pgo+PiBQbGVh
c2UsIGNvbnNpZGVyIGFkZGluZyBhIGJsYW5rIGxpbmUgZm9yIGJldHRlciByZWFkYWJpbGl0eS4K
PiAKPiBOb3RlZC4gV2lsbCBkby4KPiAKPj4KPj4+ICvCoMKgwqDCoMKgIEluZGlyZWN0IGJyYW5j
aCB0cmFja2luZyBlbmZvcmNlcyB0aGF0IGFsbCBpbmRpcmVjdCBicmFuY2hlcyAKPj4+IG11c3Qg
bGFuZAo+Pj4gK8KgwqDCoMKgwqAgb24gYSBsYW5kaW5nIHBhZCBpbnN0cnVjdGlvbiBlbHNlIENQ
VSB3aWxsIGZhdWx0LiBUaGlzIGVuYWJsZXMgCj4+PiBmb3J3YXJkCj4+PiArwqDCoMKgwqDCoCBj
b250cm9sIGZsb3cgKGNhbGwvam1wKSBwcm90ZWN0aW9uIGluIGtlcm5lbCBhbmQgcmVzdHJpY3Rz
IGFsbCAKPj4+IGluZGlyZWN0Cj4+PiArwqDCoMKgwqDCoCBjYWxsIG9yIGp1bXAgaW4ga2VybmVs
IHRvIGEgbGFuZGluZyBwYWQgaW5zdHJ1Y3Rpb24gd2hpY2ggCj4+PiBtb3N0bHkgbGlrZWx5Cj4+
PiArwqDCoMKgwqDCoCB3aWxsIGJlIHN0YXJ0IG9mIHRoZSBmdW5jdGlvbi4KPj4+ICvCoMKgwqDC
oMKgIGRlZmF1bHQgbgo+Pgo+PiBGb3IgTGludXggZGlzdHJpYnV0aW9ucyBpdCBpcyBpbXBvcnRh
bnQgdGhhdCB0aGUgc2FtZSBrZXJuZWwgY2FuIHJ1biAKPj4gYm90aCBvbiBoYXJkd2FyZSBib3Ro
IHdpdGggYW5kIHdpdGhvdXQgQ0ZJIHN1cHBvcnQuIFRoZSBkZXNjcmlwdGlvbiAKPj4gcHJvdmlk
ZWQgZG9lcyBub3QgaGVscCB0byB1bmRlcnN0YW5kIGlmIFJJU0NWX0tFUk5FTF9DRkk9eSB3aWxs
IHJlc3VsdCAKPj4gaW4gc3VjaCBhIGtlcm5lbC4gUGxlYXNlLCBlbnVtZXJhdGUgdGhlIG1pbmlt
dW0gc2V0IG9mIGV4dGVuc2lvbnMgCj4+IG5lZWRlZCBmb3Igc3VwcG9ydGluZyBhIGtlcm5lbCBi
dWlsdCB3aXRoIFJJU0NWX0tFUk5FTF9DRkk9eS4gSSBndWVzcyAKPj4gdGhpcyB3aWxsIGF0IGxl
YXN0IGluY2x1ZGUgWmltb3AuCj4gCj4gWWVzLCBpdCBpcyBleHBlY3RlZCBhbnlvbmUgc2VsZWN0
aW5nIHRoaXMgY29uZmlnIGlzIGdvaW5nIHRvIHRha2UgdGhpcyAKPiBrZXJuZWwgdG8KPiBhIFJW
QTIzIGhhcmR3YXJlLiBSVkEyMyBtYW5kYXRlcyB6aW1vcCBhbmQgdGh1cyBzaG91bGRuJ3QgYmUg
YW4gaXNzdWUgb24gCj4gc3VjaCBhCj4gaGFyZHdhcmUuIEFueW9uZSBzZWxlY3RpbmcgdGhpcyBj
b25maWcgYW5kIHRyeWluZyB0byBydW4gdGhpcyBrZXJuZWwgb24gCj4gaGFyZHdhcmUKPiBwcmlv
ciB0byBSVkEyMyB3aWxsIHJ1biBpbnRvIGlzc3Vlcy4gSSBjYW4gYWRkIGEgY29tbWVudCBoZXJl
IHRvIAo+IGhpZ2hsaWdodCB0aGF0Lgo+IAo+IEkgYXNzdW1lIHlvdSB3YW50ZWQgdGhhdCBhd2Fy
ZW5lc3MgYW5kIGdvYWwgaXMgbm90IG1haW50YWluIGNvbXBhdCBvZiBzYW1lCj4ga2VybmVsIGJl
dHdlZW4gUlZBMjAgYW5kIFJWQTIzIGhhcmR3YXJlLCByaWdodD8KCkkgYW0gYXdhcmUgdGhhdCB0
aGlzIG9wdGlvbiBpcyBub3QgUlZBMjAgY29tcGF0aWJsZS4gQ291bGQgd2UgZWl0aGVyIAptZW50
aW9uIFJWQTIzIG9yIFppbW9wIGhlcmUgc28gdXNlcnMgd2lsbCB1bmRlcnN0YW5kIHRoZSBpbXBs
aWNhdGlvbnMuCgpCZXN0IHJlZ2FyZHMKCkhlaW5yaWNoCgo+IAo+Pgo+PiBCZXN0IHJlZ2FyZHMK
Pj4KPj4gSGVpbnJpY2gKPj4KPj4+ICsKPj4+IMKgZW5kbWVudSAjICJLZXJuZWwgZmVhdHVyZXMi
Cj4+PiDCoG1lbnUgIkJvb3Qgb3B0aW9ucyIKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L01h
a2VmaWxlIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+Pj4gaW5kZXggNzEyOGRmODMyYjI4Li42ZWYz
MGEzZDJiYzQgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCj4+PiArKysgYi9h
cmNoL3Jpc2N2L01ha2VmaWxlCj4+PiBAQCAtNjEsOCArNjEsMTAgQEAgZWxzZSBpZmVxICgkKENP
TkZJR19MVE9fQ0xBTkcpLHkpCj4+PiDCoGVuZGlmCj4+PiDCoGlmZXEgKCQoQ09ORklHX1NIQURP
V19DQUxMX1NUQUNLKSx5KQo+Pj4gK2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfS0VSTkVMX1NIQURP
V19TVEFDSwo+Pj4gwqDCoMKgwqAgS0JVSUxEX0xERkxBR1MgKz0gLS1uby1yZWxheC1ncAo+Pj4g
wqBlbmRpZgo+Pj4gK2VuZGlmCj4+PiDCoCMgSVNBIHN0cmluZyBzZXR0aW5nCj4+PiDCoHJpc2N2
LW1hcmNoLSQoQ09ORklHX0FSQ0hfUlYzMkkpwqDCoMKgIDo9IHJ2MzJpbWEKPj4+IEBAIC05MSw2
ICs5MywxMiBAQCByaXNjdi1tYXJjaC0kKENPTkZJR19UT09MQ0hBSU5fSEFTX1pBQkhBKSA6PSAK
Pj4+ICQocmlzY3YtbWFyY2gteSlfemFiaGEKPj4+IMKgS0JVSUxEX0JBU0VfSVNBID0gLW1hcmNo
PSQoc2hlbGwgZWNobyAkKHJpc2N2LW1hcmNoLXkpIHwgc2VkIC1FICdzLyAKPj4+IChydjMyaW1h
fHJ2NjRpbWEpZmQoW152X10qKXY/L1wxXDIvJykKPj4+IMKgZXhwb3J0IEtCVUlMRF9CQVNFX0lT
QQo+Pj4gK2lmZXEgKCQoQ09ORklHX1JJU0NWX0tFUk5FTF9DRkkpLHkpCj4+PiArcmlzY3YtbWFy
Y2gtJChDT05GSUdfVE9PTENIQUlOX0hBU19aSUNGSUxQKSA6PSAkKHJpc2N2LW1hcmNoLXkpX3pp
Y2ZpbHAKPj4+ICtyaXNjdi1tYXJjaC0kKENPTkZJR19UT09MQ0hBSU5fSEFTX1pJQ0ZJU1MpIDo9
ICQocmlzY3YtbWFyY2gteSlfemljZmlzcwo+Pj4gK0tCVUlMRF9DRkxBR1MgKz0gLWZjZi1wcm90
ZWN0aW9uPWZ1bGwKPj4+ICtLQlVJTERfQUZMQUdTICs9IC1mY2YtcHJvdGVjdGlvbj1mdWxsCj4+
PiArZW5kaWYKPj4+IMKgIyBSZW1vdmUgRixELFYgZnJvbSBpc2Egc3RyaW5nIGZvciBhbGwuIEtl
ZXAgZXh0ZW5zaW9ucyBiZXR3ZWVuICJmZCIgCj4+PiBhbmQgInYiIGJ5Cj4+PiDCoCMgbWF0Y2hp
bmcgbm9uLXYgYW5kIG5vbi1tdWx0aS1sZXR0ZXIgZXh0ZW5zaW9ucyBvdXQgd2l0aCB0aGUgZmls
dGVyIAo+Pj4gKFtedl9dKikKPj4+IMKgS0JVSUxEX0NGTEFHUyArPSAkKEtCVUlMRF9CQVNFX0lT
QSkKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfdmRzby9NYWtlZmls
ZSBiL2FyY2gvcmlzY3YvIAo+Pj4ga2VybmVsL2NvbXBhdF92ZHNvL01ha2VmaWxlCj4+PiBpbmRl
eCAyNGUzN2QxZWY3ZWMuLjU1MjEzMWJjMzRkNyAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL2NvbXBhdF92ZHNvL01ha2VmaWxlCj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
b21wYXRfdmRzby9NYWtlZmlsZQo+Pj4gQEAgLTY5LDQgKzY5LDQgQEAgcXVpZXRfY21kX2NvbXBh
dF92ZHNvbGQgPSBWRFNPTETCoCAkQAo+Pj4gwqAjIGFjdHVhbCBidWlsZCBjb21tYW5kcwo+Pj4g
wqBxdWlldF9jbWRfY29tcGF0X3Zkc29hcyA9IFZEU09BU8KgICRACj4+PiAtwqDCoMKgwqDCoCBj
bWRfY29tcGF0X3Zkc29hcyA9ICQoQ09NUEFUX0NDKSAkKGFfZmxhZ3MpICQoQ09NUEFUX0NDX0ZM
QUdTKSAKPj4+IC1jIC1vICRAICQ8Cj4+PiArwqDCoMKgwqDCoCBjbWRfY29tcGF0X3Zkc29hcyA9
ICQoQ09NUEFUX0NDKSAkKGZpbHRlci1vdXQgLWZjZi0gCj4+PiBwcm90ZWN0aW9uPWZ1bGwsICQo
YV9mbGFncykpICQoQ09NUEFUX0NDX0ZMQUdTKSAtYyAtbyAkQCAkPAo+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC8gCj4+
PiB2ZHNvL01ha2VmaWxlCj4+PiBpbmRleCAyYjUyOGQ4MmZhN2QuLjdiMTQ0NmI2M2ViYyAxMDA2
NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPj4+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPj4+IEBAIC0xNyw3ICsxNyw3IEBAIGlmZGVm
IENPTkZJR19WRFNPX0dFVFJBTkRPTQo+Pj4gwqB2ZHNvLXN5bXMgKz0gZ2V0cmFuZG9tCj4+PiDC
oGVuZGlmCj4+PiAtaWZkZWYgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJCj4+PiAraWZuZXEgKCQoQ09O
RklHX1JJU0NWX1VTRVJfQ0ZJKSwgJChDT05GSUdfUklTQ1ZfS0VSTkVMX0NGSSkpCj4+PiDCoENG
SV9NQVJDSCA9IF96aWNmaWxwX3ppY2Zpc3MKPj4+IMKgQ0ZJX0ZVTEwgPSAtZmNmLXByb3RlY3Rp
b249ZnVsbAo+Pj4gwqBlbmRpZgo+Pj4KPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
