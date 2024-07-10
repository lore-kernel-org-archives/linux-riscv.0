Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75376C38150
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 08:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAvwJI+frgdJXeOEChJIGrtr4N8PfxpnfhTJdRerWUw=; b=Mr79UwHnAeWRnk
	7zsHl59jEP0TLww0PUhuhNUjsa80QuNV+UCshqp++IuHUgI+EhpYQJiRo1te/BzqbFttT1ogOLiKC
	gCtPwyDATp/2hNsgQUTWcpc2hNkHYj0URga7BpB1pTEmpy9Ex4+3Hm3lyaGUcFJKH7jWHUxDq7Th9
	5GXymx/MGqKq2aNC44pC4bt8asN5WdPTn51Gee0JY0RV14LZqsH4Lyf2f/g1o/8Vq/0Iruap8qzXs
	Et4SN5i56F2Z4mfDZlgqrUVf5z2XO06xrNz5AEEvqlov8NsQ8gupK6LvNilFpQVlt6dTJgxSEXLxd
	LdsXyVd0PtHzzc0mE4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSQR-00000009qRa-3cqZ;
	Wed, 10 Jul 2024 08:11:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSQO-00000009qR1-1LiL
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 08:11:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4210f0bb857so7146225e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 01:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720599098; x=1721203898; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pP3rsBHrs6LAuVI18mzEk+n0N0LSnWOC/Vuq5a5yPXk=;
        b=i6st3fhFsfrhIpbl0nB7nuxYrqvEp5Xg0cZJgxN9NjFM88Z3y4TmcT0KA4AVBeRbUE
         rY7dUWboe5ir/0nk1xslyXqY5ZbSey1WGrs9pp39VgaQRMkUD6KZT2p1UD0SzWzd90rl
         Vbgwv+O0ApzCydLXXHHkiyQbg0bkWkhv+JOu6z1rtnweMBC6+2t9wl2TTrEqG/VFzIxe
         fKojBlhLMno+O0KK4qHEaucinygcos9w9WSl5t3WSgp9qZ5n0YhNwEFNYOJL6hqgQItP
         4Uka1r9m+UmG8CGtiHKA1Kdjt76DQBSYK/rHP4jiIlUBombBR4n0bIw3R/eBmYDkXVBX
         UDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720599098; x=1721203898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pP3rsBHrs6LAuVI18mzEk+n0N0LSnWOC/Vuq5a5yPXk=;
        b=OCk4HB210kXevskgdL1okyDeeG5pNU2toBMLUAQtxx2qKvaEWvs1fSDwxLvVjts+fn
         0mRGTeoeSut3nZ+gCUx2YxoonO3Yk1rkrLQi3yAGIkIWnG13c1PmmifOnuoiQOQaZrFc
         y0hcie0VOWJfk9e5/oksjR8ghGfnOqeHbm2DLTdcKqX3IAGb6TrjzbnzQnX64I2ZE6+f
         yJZa+4a/E8ocBUho6jNlFJu37WYg8z7Js3Vl5Ttm+p665UIyH/UDkDHZP3IBltH/TVF6
         sfnvuBmEastdq9F+UmzcVfSpdMWr8LNvQLaHUpZC+6Uf20ciQAUl32RtlsMFYX0WCRPK
         +oGw==
X-Gm-Message-State: AOJu0YyW1GmVrsrFO5FYkR5q3xXOPHBVGU2M7VzmQvtpWUKYTeWj4GvR
	XQq776br+xfsHqwMeWR7Za3To+xDPiEP2yfm7VW+F+c9iC+Q+7yKKZWd1r7fW2bW7n69Ys99WLG
	r9oA=
X-Google-Smtp-Source: AGHT+IHiJ1nkZnHNRQCCCBe5FmNUVzq1xa7b8POK+qqL/NKNo3HVmRS2AFa/K/5vF+7jWC2tTjfwew==
X-Received: by 2002:a05:6000:1f8a:b0:367:9614:fdf7 with SMTP id ffacd0b85a97d-367ce5de5admr3310878f8f.0.1720599098343;
        Wed, 10 Jul 2024 01:11:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:9fb4:e15f:31d3:4404? ([2a01:e0a:e17:9700:9fb4:e15f:31d3:4404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde8467fsm4608471f8f.27.2024.07.10.01.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 01:11:37 -0700 (PDT)
Message-ID: <c053051f-e469-4ec9-a5a3-509fb2232d3f@rivosinc.com>
Date: Wed, 10 Jul 2024 10:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] riscv: errata: sifive: Use SYM_*() assembly macros
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240709160536.3690-1-jszhang@kernel.org>
 <20240709160536.3690-2-jszhang@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240709160536.3690-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_011140_611230_89C0EB70 
X-CRM114-Status: GOOD (  12.34  )
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

CgpPbiAwOS8wNy8yMDI0IDE4OjA1LCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+IEVOVFJZKCkvRU5E
KCkgbWFjcm9zIGFyZSBkZXByZWNhdGVkIGFuZCB3ZSBzaG91bGQgbWFrZSB1c2Ugb2YgdGhlCj4g
bmV3IFNZTV8qKCkgbWFjcm9zIFsxXSBmb3IgYmV0dGVyIGFubm90YXRpb24gb2Ygc3ltYm9scy4g
UmVwbGFjZSB0aGUKPiBkZXByZWNhdGVkIG9uZXMgd2l0aCB0aGUgbmV3IG9uZXMuCj4gCj4gWzFd
IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2NvcmUtYXBpL2FzbS1hbm5vdGF0aW9ucy5odG1sCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhX2NpcF80NTMuUyB8IDggKysrKy0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9lcnJhdGEvc2lmaXZlL2VycmF0YV9jaXBfNDUzLlMg
Yi9hcmNoL3Jpc2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhX2NpcF80NTMuUwo+IGluZGV4IGYxYjk2
MjNmZTFkZS4uYjFmN2I2MzZmZTlhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL3Np
Zml2ZS9lcnJhdGFfY2lwXzQ1My5TCj4gKysrIGIvYXJjaC9yaXNjdi9lcnJhdGEvc2lmaXZlL2Vy
cmF0YV9jaXBfNDUzLlMKPiBAQCAtMjEsNyArMjEsNyBAQAo+ICAxOgo+ICAuZW5kbQo+ICAKPiAt
RU5UUlkoc2lmaXZlX2NpcF80NTNfcGFnZV9mYXVsdF90cnApCj4gK1NZTV9GVU5DX1NUQVJUKHNp
Zml2ZV9jaXBfNDUzX3BhZ2VfZmF1bHRfdHJwKQo+ICAJQUREX1NJR05fRVhUIGEwLCB0MCwgdDEK
PiAgI2lmZGVmIENPTkZJR19NTVUKPiAgCWxhIHQwLCBkb19wYWdlX2ZhdWx0Cj4gQEAgLTI5LDEw
ICsyOSwxMCBAQCBFTlRSWShzaWZpdmVfY2lwXzQ1M19wYWdlX2ZhdWx0X3RycCkKPiAgCWxhIHQw
LCBkb190cmFwX3Vua25vd24KPiAgI2VuZGlmCj4gIAlqciB0MAo+IC1FTkQoc2lmaXZlX2NpcF80
NTNfcGFnZV9mYXVsdF90cnApCj4gK1NZTV9GVU5DX0VORChzaWZpdmVfY2lwXzQ1M19wYWdlX2Zh
dWx0X3RycCkKPiAgCj4gLUVOVFJZKHNpZml2ZV9jaXBfNDUzX2luc25fZmF1bHRfdHJwKQo+ICtT
WU1fRlVOQ19TVEFSVChzaWZpdmVfY2lwXzQ1M19pbnNuX2ZhdWx0X3RycCkKPiAgCUFERF9TSUdO
X0VYVCBhMCwgdDAsIHQxCj4gIAlsYSB0MCwgZG9fdHJhcF9pbnNuX2ZhdWx0Cj4gIAlqciB0MAo+
IC1FTkQoc2lmaXZlX2NpcF80NTNfaW5zbl9mYXVsdF90cnApCj4gK1NZTV9GVU5DX0VORChzaWZp
dmVfY2lwXzQ1M19pbnNuX2ZhdWx0X3RycCkKCkhpIEppc2hlbmcsCgpSZXZpZXdlZC1CeTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKVGhhbmtzICEKCkNsw6ltZW50Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
