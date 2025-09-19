Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFBBCAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxbrrIvTg9uAIX4TlBMPkc2e76pqkJDKL61J1Rf19H8=; b=yRostlj/3w8RLG
	e9JpOftHg5abpFt3Q9peCpFqbZVs5zLt8Qf62KbfDXxg9wecpYNbJZB6VmO7Zqz01C8G+g77xl/+3
	F/QfGPUt3hIYq8BP07U+T54nMOO6peTO1qwM+ddwR9mU/RI6nOfGcChGg4jO1y5ZhnIZHummxFQJc
	MUSVZGPPG93bfl1nY8FO4CvWNXrj6+eU1wgZ7OleB3GAWboqQ/xWrLfaqFq3gmNLgbjAL1ppG05xt
	x/3dxPQ9NNyywFvy7uAl9Sn1gwSH40eUAI7ppLW5zyanK6dqTvrjxFT9DB9wzYsdfZ5RgZG8WROXj
	9kwhRZZmOrh4AYgrMgUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVNf-000000022ao-38FK;
	Fri, 19 Sep 2025 07:18:07 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVNc-000000022WQ-0FMt
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:18:06 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-77b2e3169dcso2521854b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1758266283; x=1758871083; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Elc3LlmJxWrLOLFn+TT32evVZ4EsvzwpLcFPfR03Eis=;
        b=XVUxzrWb/JlxU1E2LlxbLpgjuY+3kX6v7gYi3HM4QHQMXtxG/nDo1rhhvCKs/S2e7P
         76RTRv+sGyxiNeYMApx1UchxlRdta/Y5qSHSkVFUqzEnzTys+saAjIFdn0unghKWu4PJ
         FrKY4Ig49A5BlAg3EZaK3eWDoBT86TakR/geH/9+iXn0VlJa0nTc5tdu0oYLoQ4XGjBi
         7784XCUIHOFrGidwfEbw7BISTep9wwsn36nZWVZpnL+jWrj6IxciF4OqBqKANBvHFS9T
         jAP8XkpNHxb/yoLx34i6VwCeeIuXklw9vKz+gojIYPq4AyNsMzj/GIxlmZM2YRcVbjTJ
         K6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758266283; x=1758871083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Elc3LlmJxWrLOLFn+TT32evVZ4EsvzwpLcFPfR03Eis=;
        b=aqFgJbgU10ID0SykY5RXb1WIjY+tKZWNf09PTW/XXn9c+zB8nkISJTWguq/HnULc2N
         z3XepETVVxsbtFxKPjDj9oLevUwgxmVBUI6I146F/vrPb3h9GhYfuijuduJu8ldqA7Ag
         RdAA5iQiwYSDJUvpEiZW4k+SaxckC5eYMQTtcIh3d1SsJh3/Az813riD92osYUlGnx1c
         4YKDxkb8nLkxWdyf2XUIv6QUFta/q7UvdQOUZKJ2PSgOHguSV8eWZxhesKpgZlmnDZWL
         w2HXrQ5oFhJVP2EvIidWq+R/gi+8ZQP4nQx3qv/1nGYkVfQ65v7T33Nl+XLCGjmJwwwt
         uS/g==
X-Forwarded-Encrypted: i=1; AJvYcCXX2bcRgv4eaTN/ox5Inh0/sCKsVNfBixc1viw7NyqD7/tb3AnEly8qdg+tQoLoYkOZFP2c3NB7nHJLhw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzf0xjqXrMBd5MQHHQTr5pnMJ6j5m0kOGnx2SEK2wqfN3Vq0Wh
	MzXReeO48Py49ssWzQ95T20wMPWrUBge7FnPzTD3dLaSn9VbqtuwQZZAXQC5j2GMGRU=
X-Gm-Gg: ASbGncugqgMXdQNiWVc1TBGNx+KP8ULtFnqWQJ6mToEUXyg6UF/i76LuWx7cYYdEG4l
	WPrBeUSYC1XHWW72VDXbpaTm1buO4TDYpzPDFw7cRyOUOARcErPPcIqn0PgAiQ8FGKrtJoDaI9H
	oQOOhMLiqK4/eMhtpDpaj5BkNh242iFQu+cdFTiIyW7mbvjurI9Av3FffSmob8wYLdR4SzKWWpo
	sx2+5pqS2M3PVHtdBXfrjUhA3El/rGzngE/yZw9zd+PZH1fOEzWUkDe8cdGsAqjVAryzpnQF95X
	eJfaTEyHIZK5HpVbeSAVtXl978EQQq/zjjWaxS7CrcoamXtIfO8KyCKidxII3QaK3vxddtCTE/E
	/qNBdIFjJVBZZ817/S7wRfS5TXG25hJhyc/VSHWzKiEgMaRNYWnT7XlwXPA2uuHiwfk0=
X-Google-Smtp-Source: AGHT+IFREcj7LgmwxdyNVkaDM0mx9VSkGqCRLXAZD26y/lYkInopAdg+s1pF+t7NPUl9mhmCj7A/5w==
X-Received: by 2002:a05:6a21:6d9d:b0:244:aefe:71f3 with SMTP id adf61e73a8af0-2925d0db79amr3879785637.14.1758266282535;
        Fri, 19 Sep 2025 00:18:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff4004d9sm4285297a12.35.2025.09.19.00.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:18:01 -0700 (PDT)
Message-ID: <ae93899e-372e-425a-ae23-deb4bbab3eeb@rivosinc.com>
Date: Fri, 19 Sep 2025 09:17:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/1] drivers: firmware: riscv: add unknown NMI support
To: Yunhui Cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, conor@kernel.org,
 atishp@rivosinc.com, ajones@ventanamicro.com, apatel@ventanamicro.com,
 mchitale@ventanamicro.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250919070048.94646-1-cuiyunhui@bytedance.com>
 <20250919070048.94646-2-cuiyunhui@bytedance.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250919070048.94646-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_001804_253698_F78C5123 
X-CRM114-Status: GOOD (  26.59  )
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

CgpPbiAxOS8wOS8yMDI1IDA5OjAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+IFVua25vd24gTk1JIGNh
biBmb3JjZSB0aGUga2VybmVsIHRvIHJlc3BvbmQgKGUuZy4sIHBhbmljKSB3aGVuIHRoZQo+IHN5
c3RlbSBlbmNvdW50ZXJzIHVucmVjb2duaXplZCBjcml0aWNhbCBoYXJkd2FyZSBldmVudHMsIGFp
ZGluZyBpbgo+IHRyb3VibGVzaG9vdGluZyBzeXN0ZW0gZmF1bHRzLiBUaGlzIGlzIGltcGxlbWVu
dGVkIHZpYSB0aGUgU3VwZXJ2aXNvcgo+IFNvZnR3YXJlIEV2ZW50cyAoU1NFKSBmcmFtZXdvcmsu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggICAgIHwgIDEgKwo+ICBkcml2
ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcgICB8IDEwICsrKysrCj4gIGRyaXZlcnMvZmlybXdh
cmUvcmlzY3YvTWFrZWZpbGUgIHwgIDEgKwo+ICBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3NzZV9u
bWkuYyB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hh
bmdlZCwgODkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9maXJt
d2FyZS9yaXNjdi9zc2Vfbm1pLmMKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiBpbmRleCA4NzRjYzFk
NzYwM2E1Li41ODAxZjkwYTg4ZjYyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gQEAgLTQ4MSw2
ICs0ODEsNyBAQCBlbnVtIHNiaV9zc2VfYXR0cl9pZCB7Cj4gIAo+ICAjZGVmaW5lIFNCSV9TU0Vf
RVZFTlRfTE9DQUxfSElHSF9QUklPX1JBUwkweDAwMDAwMDAwCj4gICNkZWZpbmUgU0JJX1NTRV9F
VkVOVF9MT0NBTF9ET1VCTEVfVFJBUAkJMHgwMDAwMDAwMQo+ICsjZGVmaW5lIFNCSV9TU0VfRVZF
TlRfTE9DQUxfVU5LTk9XTl9OTUkJCQkweDAwMDAwMDAyCgpXYXMgdGhpcyBzdWJtaXR0ZWQgdG8g
dGhlIFBSUyBXRyA/IFRoaXMgYSBzcGVjaWZpY2F0aW9uIG1vZGlmaWNhdGlvbiBzbwppdCBzaG91
bGQgZ28gdGhyb3VnaCB0aGUgdXN1YWwgcHJvY2Vzcy4KCj4gICNkZWZpbmUgU0JJX1NTRV9FVkVO
VF9HTE9CQUxfSElHSF9QUklPX1JBUwkweDAwMDA4MDAwCj4gICNkZWZpbmUgU0JJX1NTRV9FVkVO
VF9MT0NBTF9QTVVfT1ZFUkZMT1cJMHgwMDAxMDAwMAo+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRf
TE9DQUxfTE9XX1BSSU9fUkFTCTB4MDAxMDAwMDAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJt
d2FyZS9yaXNjdi9LY29uZmlnIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmlnCj4gaW5k
ZXggZWQ1YjY2M2FjNWY5MS4uNzQ2YmFjODYyYWM0NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Zp
cm13YXJlL3Jpc2N2L0tjb25maWcKPiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25m
aWcKPiBAQCAtMTIsNCArMTIsMTQgQEAgY29uZmlnIFJJU0NWX1NCSV9TU0UKPiAgCSAgdGhpcyBv
cHRpb24gcHJvdmlkZXMgc3VwcG9ydCB0byByZWdpc3RlciBjYWxsYmFja3Mgb24gc3BlY2lmaWMg
U1NFCj4gIAkgIGV2ZW50cy4KPiAgCj4gK2NvbmZpZyBSSVNDVl9TU0VfVU5LTk9XTl9OTUkKPiAr
CWJvb2wgIkVuYWJsZSBTQkkgU3VwZXJ2aXNvciBTb2Z0d2FyZSBFdmVudHMgdW5rbm93biBOTUkg
c3VwcG9ydCIKPiArCWRlcGVuZHMgb24gUklTQ1ZfU0JJX1NTRQo+ICsJZGVmYXVsdCB5Cj4gKwlo
ZWxwCj4gKwkgIFRoaXMgb3B0aW9uIGVuYWJsZXMgc3VwcG9ydCBmb3IgZGVsaXZlcmluZyB1bmtu
b3duIE5vbi1NYXNrYWJsZSBJbnRlcnJ1cHQgKE5NSSkKPiArCSAgbm90aWZpY2F0aW9ucyB2aWEg
dGhlIFN1cGVydmlzb3IgU29mdHdhcmUgRXZlbnRzIChTU0UpIGZyYW1ld29yay4gV2hlbiBlbmFi
bGVkLAo+ICsJICB1bmtub3duIE5NSXMgY2FuIHRyaWdnZXIga2VybmVsIHJlc3BvbnNlcyAoZS5n
LiwgcGFuaWMpIGZvciB1bnJlY29nbml6ZWQgY3JpdGljYWwKPiArCSAgaGFyZHdhcmUgZXZlbnRz
LCBhaWRpbmcgaW4gc3lzdGVtIGZhdWx0IGRpYWdub3Npcy4KPiArCj4gIGVuZG1lbnUKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZSBiL2RyaXZlcnMvZmlybXdh
cmUvcmlzY3YvTWFrZWZpbGUKPiBpbmRleCBjODc5NWQ0YmJiMmVhLi45MjQyYzZjZDVlM2U5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvTWFrZWZpbGUKPiArKysgYi9kcml2
ZXJzL2Zpcm13YXJlL3Jpc2N2L01ha2VmaWxlCj4gQEAgLTEsMyArMSw0IEBACj4gICMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiAgCj4gIG9iai0kKENPTkZJR19SSVNDVl9TQklf
U1NFKQkJKz0gcmlzY3Zfc2JpX3NzZS5vCj4gK29iai0kKENPTkZJR19SSVNDVl9TU0VfVU5LTk9X
Tl9OTUkpCSs9IHNzZV9ubWkubwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2
L3NzZV9ubWkuYyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3Yvc3NlX25taS5jCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi40MzA2M2Y0MmVmZmYwCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3Yvc3NlX25taS5jCj4gQEAgLTAs
MCArMSw3NyBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsKPiArCj4g
KyNpbmNsdWRlIDxsaW51eC9tbS5oPgo+ICsjaW5jbHVkZSA8bGludXgvbm1pLmg+Cj4gKyNpbmNs
dWRlIDxsaW51eC9yaXNjdl9zYmlfc3NlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zY2hlZC9kZWJ1
Zy5oPgo+ICsjaW5jbHVkZSA8bGludXgvc3lzY3RsLmg+Cj4gKwo+ICsjaW5jbHVkZSA8YXNtL2ly
cV9yZWdzLmg+Cj4gKyNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gKwo+ICtpbnQgcGFuaWNfb25fdW5r
bm93bl9ubWkgPSAxOwo+ICtzdHJ1Y3Qgc3NlX2V2ZW50ICpldnQ7Cj4gK3N0YXRpYyBzdHJ1Y3Qg
Y3RsX3RhYmxlX2hlYWRlciAqdW5rbm93bl9ubWlfc3lzY3RsX2hlYWRlcjsKPiArCj4gK2NvbnN0
IHN0cnVjdCBjdGxfdGFibGUgdW5rbm93bl9ubWlfdGFibGVbXSA9IHsKPiArCXsKPiArCQkucHJv
Y25hbWUJPSAicGFuaWNfZW5hYmxlIiwKPiArCQkuZGF0YQkJPSAmcGFuaWNfb25fdW5rbm93bl9u
bWksCj4gKwkJLm1heGxlbgkJPSBzaXplb2YoaW50KSwKPiArCQkubW9kZQkJPSAwNjQ0LAo+ICsJ
CS5wcm9jX2hhbmRsZXIJPSBwcm9jX2RvaW50dmVjX21pbm1heCwKPiArCQkuZXh0cmExCQk9IFNZ
U0NUTF9aRVJPLAo+ICsJCS5leHRyYTIJCT0gU1lTQ1RMX09ORSwKPiArCX0sCj4gK307Cj4gKwo+
ICtzdGF0aWMgdm9pZCBubWlfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsJ
cHJfZW1lcmcoIk5NSSByZWNlaXZlZCBmb3IgdW5rbm93biBvbiBDUFUgJWQuXG4iLCBzbXBfcHJv
Y2Vzc29yX2lkKCkpOwo+ICsKPiArCWlmIChwYW5pY19vbl91bmtub3duX25taSkKPiArCQlubWlf
cGFuaWMocmVncywgIk5NSTogTm90IGNvbnRpbnVpbmciKTsKPiArCj4gKwlwcl9lbWVyZygiRGF6
ZWQgYW5kIGNvbmZ1c2VkLCBidXQgdHJ5aW5nIHRvIGNvbnRpbnVlXG4iKTsKPiArfQoKSSdtIGRh
emVkIGFuZCBjb25mdXNlZCBhcyB3ZWxsIDspIFdoYXQncyB0aGUgcG9pbnQgb2YgdGhpcyBleGNl
cHQKaW50ZXJydXB0aW5nIHRoZSBrZXJuZWwgd2l0aCBhIHBhbmljID8gSXQgc2VlbXMgbGlrZSBp
dCdzIGEgYmV0dGVyIGlkZWEKdG8gbGV0IHRoZSBmaXJtd2FyZSBoYW5kbGUgdGhhdCBwcm9wZXJs
eSBhbmQgZGlzcGxheSB3aGF0ZXZlcgppbmZvcm1hdGlvbiBhcmUgbmVlZGVkLiBXYXMgeW91ciBp
ZGVhIHRvIGFjdHVhbGx5IGZvcmNlIHRoZSBrZXJuZWwgdG8KZW50ZXIgaW4gc29tZSBkZWJ1ZyBt
b2RlID8KClRoYW5rcywKCkNsw6ltZW50Cgo+ICsKPiArc3RhdGljIGludCBubWlfc3NlX2hhbmRs
ZXIodTMyIGV2dCwgdm9pZCAqYXJnLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsJbm1p
X2hhbmRsZXIocmVncyk7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQg
c3NlX25taV9pbml0KHZvaWQpCj4gK3sKPiArCWludCByZXQ7Cj4gKwo+ICsJZXZ0ID0gc3NlX2V2
ZW50X3JlZ2lzdGVyKFNCSV9TU0VfRVZFTlRfTE9DQUxfVU5LTk9XTl9OTUksIDAsCj4gKwkJCQkg
bm1pX3NzZV9oYW5kbGVyLCBOVUxMKTsKPiArCWlmIChJU19FUlIoZXZ0KSkKPiArCQlyZXR1cm4g
UFRSX0VSUihldnQpOwo+ICsKPiArCXJldCA9IHNzZV9ldmVudF9lbmFibGUoZXZ0KTsKPiArCWlm
IChyZXQpIHsKPiArCQlzc2VfZXZlbnRfdW5yZWdpc3RlcihldnQpOwo+ICsJCXJldHVybiByZXQ7
Cj4gKwl9Cj4gKwo+ICsJdW5rbm93bl9ubWlfc3lzY3RsX2hlYWRlciA9IHJlZ2lzdGVyX3N5c2N0
bCgia2VybmVsIiwgdW5rbm93bl9ubWlfdGFibGUpOwo+ICsJaWYgKCF1bmtub3duX25taV9zeXNj
dGxfaGVhZGVyKSB7Cj4gKwkJc3NlX2V2ZW50X2Rpc2FibGUoZXZ0KTsKPiArCQlzc2VfZXZlbnRf
dW5yZWdpc3RlcihldnQpOwo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsJfQo+ICsKPiArCXByX2lu
Zm8oIlVzaW5nIFNTRSBmb3IgTk1JIGV2ZW50IGRlbGl2ZXJ5XG4iKTsKPiArCj4gKwlyZXR1cm4g
MDsKPiArfQo+ICsKPiArc3RhdGljIGludCBfX2luaXQgdW5rbm93X25taV9pbml0KHZvaWQpCj4g
K3sKPiArCXJldHVybiBzc2Vfbm1pX2luaXQoKTsKPiArfQo+ICsKPiArbGF0ZV9pbml0Y2FsbCh1
bmtub3dfbm1pX2luaXQpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
