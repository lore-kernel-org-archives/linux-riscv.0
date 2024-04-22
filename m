Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3F8C07C79
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 11:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcyUYKjAbDNm0YGnLRwenKRkxRubz4PAUVmg+m/kbUg=; b=KsODnwR7cKCDD8
	8AInkshIst5pQTsURdbXqnNk85OLejSimObNmiMhdZgM2OfMgqOv9/SHWbzY9rhQybEJC59kwEqDe
	KRgCx9gXxPSCrQZA5uMZn5H4Cq5kXi3DcaYuQChzq/eEH703m61gfKbqgxv66DJvqeZEyoOxg/1OP
	eORFnVNgBY4vH38tG0m8Gaq6Xa1hYwwBbRTbTV23PTHWvDtSv6lRuRF5zjzPOEDgcMMEyX6VUXiIx
	HYuRxe0Yw8R9it0rVSNdfbpZ49kAIwFmXZPLOekdUpdsmo1o9Gg8mkhDanbjAmlgXibZwKnFj+2uj
	5TOaq4AYbxv25TIhtX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryrd3-0000000DJlE-0kB4;
	Mon, 22 Apr 2024 11:14:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryrcz-0000000DJj2-3ttj
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 11:14:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-349a31b2babso631800f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 04:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713784468; x=1714389268; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txTWpp1pw11cuzo3l6Yv3qVL9j61JY83c5SyuufTWno=;
        b=ZaR2wRQUvzky/gRFLAQ4df2AYHibV7nSzjDAy+c6gwisHM3KFrB1VATtCx6eaOEDYg
         Sllk1Ab2+4joLbStlro8n7nzmWn0VXwLahXBLKaPjwv9iIbeUhwSljyNE34v/5KBKzOS
         nloVhvX98ojDyVCtIX8wtNvoz5Tpd0PMkKnKXrdmabYBJfGTlX+xl9kFMht47fZkrSTI
         qyD++HWydlHXsprV16JyWLDchalt+w9A5hci+ThfEHIxHUeeBUTKGK/tfmQRopDP/6nO
         +TaLWyLexCFtRT9TiS9mKndwu8ZcU5MAkwgKBrjaBU9hpE7dHwxVptC7V/5r6Eo9SBGs
         286Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713784468; x=1714389268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txTWpp1pw11cuzo3l6Yv3qVL9j61JY83c5SyuufTWno=;
        b=JiMyMYl2g9A1E5X2jBZN4IfyDzGeTQP8LOLKy4fsxHlLdsmINcYpeuh1pqRKDnX/Ti
         zhQC07KuoylEZ8f1eWGTDVBp0y1tkNVjdTvSQy5dA4fdvBPDAGH6T55tC2RWxQILnTbP
         i992YaTCRrdCOxDgh9vc/8lDnojZoFqjhbDYN2bnlLBCvBriz4jM0n2QWVjrkFORXKWw
         j1GCuX0XgdGjCD4oBCR1RqnCbIexQeYBDdouoK7fGhv+EoO9Gi+5Sh/SpSgGRT7cloPf
         FfaL27NeuMR4Ojw5WJ073yhmTs9qOmTMS3koZPpknMrQloWLiwJp9NxRq3ludk6iF9Ce
         YI8g==
X-Forwarded-Encrypted: i=1; AJvYcCWYQak9iUsQjFQyIxXiE/XmPe1nVeMpL59fJJFDGyJEVwsL8V0Te2c9F/eyrY81J2KGfK7VC8eUuhemXcB2gdHfzC24w4FddVc9usM2ujqY
X-Gm-Message-State: AOJu0YwUaTm23VvZxiPMeQqaplePmgnAnXxN83K5VFTag+/9B5a3rCHE
	RcUQGdEa98LyhkYCVbVE9rZcYTbkRdGRk+T6VTQlQFIF66gFo+UJ8pyot85xlJw=
X-Google-Smtp-Source: AGHT+IFg50yN4QrZNx2LlD1EJ2tT/EI9hFZ2bUjcoiDOKnV7sj3JlUWpq/52eyPbnKALbKb6A7dtxw==
X-Received: by 2002:a5d:6511:0:b0:34a:f759:271d with SMTP id x17-20020a5d6511000000b0034af759271dmr2082090wru.6.1713784467909;
        Mon, 22 Apr 2024 04:14:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:9f43:3ca4:162c:d540? ([2a01:e0a:999:a3a0:9f43:3ca4:162c:d540])
        by smtp.gmail.com with ESMTPSA id cg3-20020a5d5cc3000000b00349bd105089sm11706450wrb.47.2024.04.22.04.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 04:14:27 -0700 (PDT)
Message-ID: <032530b8-a26e-494f-bd9c-3e1661add5d4@rivosinc.com>
Date: Mon, 22 Apr 2024 13:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-5-cleger@rivosinc.com>
 <20240419-clinic-amusing-d23b1b6d2af2@spud>
 <6ab9e591-f2f2-4267-8bdd-169ef0243e14@rivosinc.com>
 <20240422-daylight-sassy-ff3b0d867fef@wendy>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240422-daylight-sassy-ff3b0d867fef@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_041430_099236_21480324 
X-CRM114-Status: GOOD (  16.59  )
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

CgpPbiAyMi8wNC8yMDI0IDExOjM1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gTW9uLCBBcHIg
MjIsIDIwMjQgYXQgMTA6NTM6MTBBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBP
biAxOS8wNC8yMDI0IDE3OjUxLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBUaHUsIEFwciAx
OCwgMjAyNCBhdCAwMjo0MjoyN1BNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+Pj4g
VGhlIFpjKiBzdGFuZGFyZCBleHRlbnNpb24gZm9yIGNvZGUgcmVkdWN0aW9uIGludHJvZHVjZXMg
bmV3IGV4dGVuc2lvbnMuCj4+Pj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIFpjYSwgWmNm
LCBaY2QgYW5kIFpjYi4gWmNlLCBaY210IGFuZCBaY21wCj4+Pj4gYXJlIGxlZnQgb3V0IG9mIHRo
aXMgcGF0Y2ggc2luY2UgdGhleSBhcmUgdGFyZ2V0aW5nIG1pY3JvY29udHJvbGxlcnMvCj4+Pj4g
ZW1iZWRkZWQgQ1BVcyBpbnN0ZWFkIG9mIGFwcGxpY2F0aW9uIHByb2Nlc3NvcnMuCj4+Pj4KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+
Pj4gLS0tCj4+Pj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDQgKysrKwo+Pj4+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCA0ICsrKysKPj4+PiAgMiBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+
PiBpbmRleCA1NDNlM2VhMmRhMGUuLmI3NTUxYmFkMzQxYiAxMDA2NDQKPj4+PiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmgKPj4+PiBAQCAtODIsNiArODIsMTAgQEAKPj4+PiAgI2RlZmluZSBSSVNDVl9J
U0FfRVhUX1pBQ0FTCQk3Mwo+Pj4+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWEFOREVTUE1VCQk3
NAo+Pj4+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklNT1AJCTc1Cj4+Pj4gKyNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9aQ0EJCTc2Cj4+Pj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0IJCTc3Cj4+
Pj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0QJCTc4Cj4+Pj4gKyNkZWZpbmUgUklTQ1ZfSVNB
X0VYVF9aQ0YJCTc5Cj4+Pj4gIAo+Pj4+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5W
Q0ZHCTEyNwo+Pj4+ICAKPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+Pj4gaW5kZXggMTE1YmEw
MDFmMWJjLi4wOWRlZTA3MTI3NGQgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+
Pj4gQEAgLTI2MSw2ICsyNjEsMTAgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSBy
aXNjdl9pc2FfZXh0W10gPSB7Cj4+Pj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmEsIFJJU0NW
X0lTQV9FWFRfWkZBKSwKPj4+PiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaCwgUklTQ1ZfSVNB
X0VYVF9aRkgpLAo+Pj4+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZobWluLCBSSVNDVl9JU0Ff
RVhUX1pGSE1JTiksCj4+Pj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2EsIFJJU0NWX0lTQV9F
WFRfWkNBKSwKPj4+PiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpjYiwgUklTQ1ZfSVNBX0VYVF9a
Q0IpLAo+Pj4+ICsJX19SSVNDVl9JU0FfRVhUX0RBVEEoemNkLCBSSVNDVl9JU0FfRVhUX1pDRCks
Cj4+Pj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2YsIFJJU0NWX0lTQV9FWFRfWkNGKSwKPj4+
PiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYSwgUklTQ1ZfSVNBX0VYVF9aQkEpLAo+Pj4+ICAJ
X19SSVNDVl9JU0FfRVhUX0RBVEEoemJiLCBSSVNDVl9JU0FfRVhUX1pCQiksCj4+Pj4gIAlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6YmMsIFJJU0NWX0lTQV9FWFRfWkJDKSwKPj4+Cj4+PiBZZSwgdGhp
cyBsb29rcyBleGFjdGx5IGxpa2Ugd2hhdCBJICJmZWFyZWQiLgo+Pgo+PiBPayBidXQgZm9yIGlu
c3RhbmNlLCBRZW11IGFjdHVhbGx5IHNldCBaYyogYmFzZWQgb24gQy9GL0QuIFNvIHRoZSBJU0EK
Pj4gc3RyaW5nIGNvbnRhaW5pbmcgdGhlc2VzIGRlcGVuZGVuY2llcyBzaG91bGQgYWN0dWFsbHkg
YWxzbyBiZSBhbGxvd2VkLgo+PiBTbyBzaG91bGQgd2Ugc2ltcGx5IGlnbm9yZSB0aGVtIGluIHRo
ZSBJU0Egc3RyaW5nIGFuZCBhbHdheXMgZG8gb3VyIG93bgo+PiAicG9zdC1wcm9jZXNzaW5nIiBi
YXNlZCBvbiBDL0YvRD8KPiAKPiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIGNvbnRlbnRzIG9m
IGFsbCBvZiB0aGVzZSBleHRlbnNpb25zLCBidXQgSQo+IGFzc3VtZSB0aGUgcmVhc29uaW5nIGZv
ciBzcGxpdHRpbmcgdGhlbSBvdXQgaXMgdGhhdCB5b3UgY2FuIGltcGxlbWVudAo+IHRoZW0gYnV0
IG5vdCBtYXliZSBub3QgaW1wbGVtZW50IEMgKG9yIHNvbWV0aGluZyBzaW1pbGFyKT8gSWYgdGhh
dCdzIHRoZQo+IGNhc2UsIHlvdSBjYW5ub3QgYWx3YXlzIGltcGx5LgoKWWVhaCwgdGhleSBjYW4g
YmUgaW1wbGVtZW50ZWQgaW5kZXBlbmRlbnRseSBzbyB3ZSBuZWVkIHRvIGJlIGFibGUgdG8KcGFy
c2UgdGhlbSBpbmRlcGVuZGVudGx5LiBIb3dldmVyLCB0aGUga2VybmVsIGN1cnJlbnRseSByZXF1
aXJlcyBDIHNvIHdlCnNob3VsZCBhbHdheXMgaGF2ZSBaY2EvWmNmL1pjZC4gQnV0IGlmIHRoYXQg
Y2hhbmdlcyBpbiB0aGUgZnV0dXJlLCB0aGVuLAp0aGF0IHdvbid0IGJlIHRydWUgYW55bW9yZS4g
QmV0dGVyIGtlZXAgaXQgZ2VuZXJpYyBwcm9iYWJseQoKQ2zDqW1lbnQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
