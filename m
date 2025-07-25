Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642B1C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 14:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiwWd/N/qZn+Bn7FSy6XSw0nfl0LcDyTPnOuDWhy41g=; b=EVi97anoMaXeyh
	HaTiE2idE/CDYmfBfDtucJfzkS/7dOnglG9WeDjUy7sIGbaWEJTZXQQ/F7u3arZZn3jl2FKtA3X0D
	cmBUS2NVwtVeEPCsaJ8i8AJ4jFIhYDn9EfKt82gsPFJbdadi25YnPqEmEuDftCG/XsSE/nuiaGdlg
	dqAiMTEUsjIgh6n+FIsmB61aWzuzlNpzp8EsmhS2YP6grK9RpybBLAN2eIY1jAdy8d+Xxb5TEslZD
	OXvabbCpdnKgMwgUHVD0RyPXUQCJxz8jwTIR1uNIhb9MDdD0nBAN6MRs67XH4FAVlnkhplW2HOSla
	60NRCAciLxX0/4kJdltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJfM-0000000A2C7-0mXc;
	Fri, 25 Jul 2025 14:44:56 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJdw-0000000A27P-2bKY
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 14:43:29 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BC59F3F798
	for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753454605;
	bh=0k2OjtFlklZYYSusmSIAAvwXtZV4jXB/0YYQlrt+7FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=LadycTCOCxU4LcH3NjvtQXmSRWlsjrQVADnZOK84ajJk1CLRPJQ3KkkKuoYRqqKQY
	 O/0YswqSTlIMowM5Tepebrht5HtjIrpf/HVwSWkK12jfI1WH1ZucUFEvSyvPxhQKFX
	 YlpwlEFDvwDjUQ+/SWqWodhAWhNWIDG5J5Fd+YIxAj7zmYd6/mhMv1h+q5uXCs60NE
	 ov0EruZXVuDkNFpbvsh9/FQ32SxURMCyGvudISOXMAWnM3banGZU5CJNSvu4kJx4d2
	 0p7YmHKUWLM0wcM5R+AvQiNDVrKUjRs4GBO3mPgqoyoPUwcpeO3E4Q271jPf+jv6D1
	 umF/+PeYh2AgQ==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ae2b7bdc8f6so285083766b.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 07:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753454604; x=1754059404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0k2OjtFlklZYYSusmSIAAvwXtZV4jXB/0YYQlrt+7FM=;
        b=LxePhoLlUM4aObSAaQWk/y453rSdJ7Xt3w/hqxA5hs3hv/5MG4+zQ3Ehj3pDbTPuuB
         2X9Uc60tnSgN6iURD5S3CPfifKJYujTkJK8kWvMocv+vU55g48tEJ/M6CEof+zWAdEVi
         tghpu54xj7VifXOZfEMi8wfBjKhlqgiogmX8+WvdMoHeYedBnlvBWG0wg9Fn0MI2dz/1
         yOmhiMfGJOk+rzj01PDP6MrTb47irlSFzoL1pIojfnmlNMwvDyoErJRPykzDsboBAh1K
         yShZNeGRPPZe3NPFCjzTOzxoaoFcTBOC6EfWHvTt0kKclHn4SkpK/ob4ivHeQucHJrfh
         b2Gg==
X-Gm-Message-State: AOJu0YzE1SQcC4lKl6bDYAXX6fRLK10fRHFRhAnu6ckLy72ft8wP/R7S
	NV/0KiPKei2nWiE0m89J4+5Fczh/Si8ow10r/iEH411zFPAB9yuj0DYjGEl0mWkJAVY5/TmQQc/
	M9H3t/WRdtE5de4ex0NJutw7xLfBDv20MNaQGUdKlZaCh2P5KU3gkBQXGy13xaVWLKHEL9BKOSa
	bsBbFggs8wyQ==
X-Gm-Gg: ASbGnctaRuX2wo9m0SyB5zM2GI3m1NjqanpbE3CSIaTfwqM560a6nVOrbVC9PGqAwkO
	VVWyKK91z2560wFTge2kKYX6WpLLFjSqtV5bpz4v9dxUotEqsJQduShFaJEj7xnbKNCdPWT14gt
	zmY59os8L3we5rdHi4pF4MjSStVPEh9Pi3j4Fa+hy81PMKMqs5ZrXQe62R05YyJc8Z99PkxX8qe
	MfuqiqDqxTN3X4GnPgYhhsiAIQ1At4aSDRxdR2wwhi+4CYl3lVIAiBkayrZgsF7Mq8orgbloSrg
	2h2C2s2guVxMTZ2ePmsnqM9/lAMloY/ErPGVO4ibDIqSCxJxjpPfLKzfQhHxeLPi942i/6h0Y2D
	8Cn+maT5kX4MV+u7+omnZuPhh5BbOrWtUxFHs
X-Received: by 2002:a17:907:2d8f:b0:ae9:cd0a:5827 with SMTP id a640c23a62f3a-af61e533d42mr227199066b.20.1753454603607;
        Fri, 25 Jul 2025 07:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLGJ6zB3+OfdWnXfUelODaXvg8HjyVSfwaUZrmP6gSKNspnUl1zTG7y8LUoP5t34erFR1Evg==
X-Received: by 2002:a17:907:2d8f:b0:ae9:cd0a:5827 with SMTP id a640c23a62f3a-af61e533d42mr227194666b.20.1753454603155;
        Fri, 25 Jul 2025 07:43:23 -0700 (PDT)
Received: from [192.168.103.102] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635af9967sm1931166b.131.2025.07.25.07.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 07:43:22 -0700 (PDT)
Message-ID: <d6643810-094b-46d8-b223-b987783d23db@canonical.com>
Date: Fri, 25 Jul 2025 16:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] riscv: enable landing pad enforcement
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
 <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
 <1149732f-bc8d-4339-90c3-e34aeac9f1be@canonical.com>
 <aIOSqskb_hBAqjIt@debug.ba.rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <aIOSqskb_hBAqjIt@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_074328_788256_3B517CF6 
X-CRM114-Status: GOOD (  14.09  )
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

T24gMjUuMDcuMjUgMTY6MjAsIERlZXBhayBHdXB0YSB3cm90ZToKPiBPbiBGcmksIEp1bCAyNSwg
MjAyNSBhdCAwODozMzo0NkFNICswMjAwLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+PiBP
biAyNS4wNy4yNSAwMTozNiwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+Pj4gRW5hYmxlcyBsYW5kaW5n
IHBhZCBlbmZvcmNlbWVudCBieSBpbnZva2luZyBhIFNCSSBGV0ZUIGNhbGwuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4+PiAtLS0KPj4+
IMKgYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyB8wqAgMSArCj4+PiDCoGFyY2gvcmlz
Y3Yva2VybmVsL2hlYWQuU8KgwqDCoMKgwqDCoMKgIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+
Pj4gwqAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2Fz
bS0gCj4+PiBvZmZzZXRzLmMKPj4+IGluZGV4IGU0ZDU1MTI2ZGMzZS4uZTZhOWZhZDg2ZmFlIDEw
MDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwo+Pj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwo+Pj4gQEAgLTUzNiw2ICs1MzYsNyBAQCB2
b2lkIGFzbV9vZmZzZXRzKHZvaWQpCj4+PiDCoMKgwqDCoCBERUZJTkUoU0JJX0VYVF9GV0ZULCBT
QklfRVhUX0ZXRlQpOwo+Pj4gwqDCoMKgwqAgREVGSU5FKFNCSV9FWFRfRldGVF9TRVQsIFNCSV9F
WFRfRldGVF9TRVQpOwo+Pj4gwqDCoMKgwqAgREVGSU5FKFNCSV9GV0ZUX1NIQURPV19TVEFDSywg
U0JJX0ZXRlRfU0hBRE9XX1NUQUNLKTsKPj4+ICvCoMKgwqAgREVGSU5FKFNCSV9GV0ZUX0xBTkRJ
TkdfUEFELCBTQklfRldGVF9MQU5ESU5HX1BBRCk7Cj4+PiDCoMKgwqDCoCBERUZJTkUoU0JJX0ZX
RlRfU0VUX0ZMQUdfTE9DSywgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSyk7Cj4+PiDCoCNlbmRpZgo+
Pj4gwqB9Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGIvYXJjaC9y
aXNjdi9rZXJuZWwvaGVhZC5TCj4+PiBpbmRleCA5Yzk5YzVhZDZmZTguLjU5YWYwNDRiZjg1YyAx
MDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+Pj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvaGVhZC5TCj4+PiBAQCAtMTg1LDYgKzE4NSwxNiBAQCBzZWNvbmRhcnlfc3Rh
cnRfc2JpOgo+Pj4gwqAxOgo+Pj4gwqAjZW5kaWYKPj4+IMKgwqDCoMKgIHNjc19sb2FkX2N1cnJl
bnQKPj4+ICsKPj4+ICsjaWYgZGVmaW5lZChDT05GSUdfUklTQ1ZfU0JJKSAmJiBkZWZpbmVkKENP
TkZJR19SSVNDVl9LRVJORUxfQ0ZJKQo+Pj4gK8KgwqDCoCBsaSBhNywgU0JJX0VYVF9GV0ZUCj4+
PiArwqDCoMKgIGxpIGE2LCBTQklfRVhUX0ZXRlRfU0VUCj4+PiArwqDCoMKgIGxpIGEwLCBTQklf
RldGVF9MQU5ESU5HX1BBRAo+Pj4gK8KgwqDCoCBsaSBhMSwgMSAvKiBlbmFibGUgbGFuZGluZyBw
YWQgZm9yIHN1cGVydmlzb3IgKi8KPj4+ICvCoMKgwqAgbGkgYTIsIFNCSV9GV0ZUX1NFVF9GTEFH
X0xPQ0sKPj4+ICvCoMKgwqAgZWNhbGzCoMKgwqAgLyogY2hlY2sgZm9yIGVycm9yIGNvbmRpdGlv
biBhbmQgdGFrZSBhcHByb3ByaWF0ZSAKPj4+IGFjdGlvbiAqLwo+Pj4gKyNlbmRpZgo+Pj4gKwo+
Pj4gwqDCoMKgwqAgY2FsbCBzbXBfY2FsbGluCj4+PiDCoCNlbmRpZiAvKiBDT05GSUdfU01QICov
Cj4+PiBAQCAtMzU5LDYgKzM2OSwxNSBAQCBTWU1fQ09ERV9TVEFSVChfc3RhcnRfa2VybmVsKQo+
Pj4gwqAjZW5kaWYKPj4+IMKgwqDCoMKgIHNjc19sb2FkX2N1cnJlbnQKPj4+ICsjaWYgZGVmaW5l
ZChDT05GSUdfUklTQ1ZfU0JJKSAmJiBkZWZpbmVkKENPTkZJR19SSVNDVl9LRVJORUxfQ0ZJKQo+
Pj4gK8KgwqDCoCBsaSBhNywgU0JJX0VYVF9GV0ZUCj4+PiArwqDCoMKgIGxpIGE2LCBTQklfRVhU
X0ZXRlRfU0VUCj4+PiArwqDCoMKgIGxpIGEwLCBTQklfRldGVF9MQU5ESU5HX1BBRAo+Pj4gK8Kg
wqDCoCBsaSBhMSwgMSAvKiBlbmFibGUgbGFuZGluZyBwYWQgZm9yIHN1cGVydmlzb3IgKi8KPj4K
Pj4gVGhlIFNCSSBzcGVjaWZpY2F0aW9uIGNhbGxzIEJJVCgwKSAiTE9DSyIuCj4+IFNob3VsZG4n
dCB3ZSBkZWZpbmUgYSBjb25zdGFudCBmb3IgdGhlIGxvY2sgYml0IGluc3RlYWQgb2YgdXNpbmcg
YSAKPj4gbWFnaWMgdmFsdWU/Cj4gCj4gU2VlIGJlbG93IGBsaSBhMiwgU0JJX0ZXRlRfU0VUX0ZM
QUdfTE9DS2AuCj4gCj4gImxpIGExLCAxIC8qIGVuYWJsZSBsYW5kaW5nIHBhZCBmb3Igc3VwZXJ2
aXNvciAqLz4iIC0tPiB0aGlzIGlzIGVuYWJsaW5nLgo+IEhhZCB3ZSBkb25lICJsaSBhMSwgMCAv
KiBlbmFibGUgbGFuZGluZyBwYWQgZm9yIHN1cGVydmlzb3IgKi8iIC0tPiB0aGlzIGlzCj4gYXNr
aW5nIGZpcm13YXJlIHRvIGRpc2FibGUgdGhlIGZlYXR1cmUgKHR1cm4gb2ZmIHRoZSBiaXQgaW4g
bWVudmNmZyBDU1IpCgpTbyB3ZSBsYWNrIGNvbnN0YW50cyBmb3IKCiJFbmFibGUgbGFuZGluZyBw
YWQgZm9yIHN1cGVydmlzb3ItbW9kZSIKIkRpc2FibGUgbGFuZGluZyBwYWQgZm9yIHN1cGVydmlz
b3ItbW9kZSIKCkJlc3QgcmVnYXJkcwoKSGVpbnJpY2gKCj4+Cj4+PiArwqDCoMKgIGxpIGEyLCBT
QklfRldGVF9TRVRfRkxBR19MT0NLCj4+PiArwqDCoMKgIGVjYWxswqDCoMKgIC8qIGNoZWNrIGZv
ciBlcnJvciBjb25kaXRpb24gYW5kIHRha2UgYXBwcm9wcmlhdGUgCj4+PiBhY3Rpb24gKi8KPj4+
ICsjZW5kaWYKPj4+ICsKPj4+IMKgI2lmZGVmIENPTkZJR19LQVNBTgo+Pj4gwqDCoMKgwqAgY2Fs
bCBrYXNhbl9lYXJseV9pbml0Cj4+PiDCoCNlbmRpZgo+Pj4KPj4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
