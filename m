Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640A5D3B9AB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Dec 2025 00:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vjd5bc1Qer5YUV3qNLH+Ay4P4I3OER5LTy1xlTFBAK0=; b=1PSWIC2fPpdzQC
	GwmFZXXWAY147+LPpaPvrgxzc4zg+FkG0D90c2WVaERYjqgE8LCDD4cTNQmUxvFe9/w2fKS6t2nwq
	2933ewjoccQAG2k6uuOJDnDv22vKWhjaNt7Sux2m80JFFzInPBliI6PdtkwbMuKHmvdwKqCrYSBkT
	oMaJ8vUC/3mbxwmmPc8bx2/8QggPeqnySTUze5ioFOAbGs1/ax1EYYhpUNfacU8cV7w+xZ0wE5vCo
	443M7KZYjwd3rESN6J1xaSqX4U0RbPCGRd2b1iYaptEFBodebxE5oKxqwpTdNH5QQpjFjZjE/BfXA
	qm+9cENKdsfxS3oanDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTUcw-0000000G1Qn-3zgz;
	Thu, 11 Dec 2025 00:33:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTUct-0000000G1QO-28nK
	for linux-riscv@lists.infradead.org;
	Thu, 11 Dec 2025 00:33:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7aad4823079so326223b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 16:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765413227; x=1766018027; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3QrmlcsyPJfUCC0ZcW/aA6sfMqx5l+Z163FBQ6ysu4g=;
        b=bWC4pY3UENv6xsex2MfHfbjDYUXI5K6E00TG3uLRF27/0Zr38McMrui+WUaUTvgFtA
         IGy2ceZ9OXcIf3W5CnI9p16yGCS0mFehlcG0Xg+hkaNK6ZDDQKIPpBFZXcBmtrKdRj0f
         Kd8t+j0GdAyxObfiILMm8+AXpTHv7Z0zrcGmMalPsnBPW3pB4ARnpiHUBL/12QaCnzdq
         sfWbnFvT809BOAKBWfK5XaYEvDT4MLlMtLB2AgW1JMjI374g0P3qYq/8Xdc50Pf5XY+t
         Amr497+Z9XqwEYciXUwj+3lE1PXP41+S60ri6SusqWj8xF8+n3k9/yKqwugFOFJt0IOU
         Evhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765413227; x=1766018027;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QrmlcsyPJfUCC0ZcW/aA6sfMqx5l+Z163FBQ6ysu4g=;
        b=BujsPnDETBGbf/8dy2hOOY7fbZMTjjCHSsUAnSeUhqyvgD5x655eTsS2gNLC/z9D71
         2QYGOZBESEhMLnh1eUct2DlpFUUgilhjpR00ajBU58IT66OdJOcVlchFx5bkA41MUYoR
         4KpaBVArNt0olPzsOg3Q66fhvbzl0O2MUOYrQE2w72axS4nlmf3s10Oytj5KJ7cmqqJK
         TOBZkyUlmBlXGxlhbdA/2fl35kTNyjI7aDeqUhLgbU/pm2+zDzzuRbkbmveqvi4iq99g
         JcsV2IkCbUIclRxZb8PsWuquAs1eTbwc9XTYTRR8biB6q6WYeIimnR+u87mxHW1bR1kY
         9NOw==
X-Forwarded-Encrypted: i=1; AJvYcCUKnwrRdzbgwM/uUNj3++/UChoBaWb/GvLoj12O3hGJOwAoh/J5/3+ZWUKEaMv0ESiUgsVChBdtuj9zSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZUSovuRZctu8tjWUZrgivadDPzAmIvKLHpfDt6HE5G2SrVE6Z
	Y5NhCMv7HKAMBB/Zl6tB/hQqSlXkYjC2gEYVYMIjCVaSJfn3hGVoHbelVIJBUrBSoSE=
X-Gm-Gg: ASbGncv5CkLBRu3jFXoLtJQLZlY4FV/baqNrU0qTesWOS2u3t4louVTkCVD9Rlv30eQ
	5DJ55St63PYEV4HZArq7z4tXbX7ZfQj4RIXeCsdjRNUEpT88Xmnsl+E4Q+xQdIoPDNfVNqmiT9/
	Np/jJ//PEaLGLzor64ekmxa9c6elkx9TdEOFJrcaxac2cTVF6ouNSqlL8HxjfqicLCkmNphxIhm
	MCcHEJiwGKW9nC4YQRzlcR9kHpE1w/fzp/Ay8NAGILxRd5Y7HQ0sBsLFhoSBS+bOFVEPOWsYEvG
	kfaTzsx5fpyVniScEcetuYhJRDf4YKYadzZAzM04tvfceVGdxaWVIluhWtvI01zjc2y93U6X9ab
	0j4Xtq0+Bwj2S1lcItFxdDMYB/DIXLlNzvImblVCDXi+ESEr8Ji9FQU7scd2l9CeH7eqZgkmaA7
	VrjB6CLZWXTUnphQ==
X-Google-Smtp-Source: AGHT+IGjk/exFuz2Gv/i6l6p36w76njH4yBjUre8KbL1otNzyBmhPQsg1E1fJ2rghGyT0+Ekep5ekQ==
X-Received: by 2002:a05:6a20:a10a:b0:366:14b0:4b0e with SMTP id adf61e73a8af0-366e3acee69mr4438378637.74.1765413226713;
        Wed, 10 Dec 2025 16:33:46 -0800 (PST)
Received: from [100.64.0.1] ([167.103.29.104])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c25b7d59dsm580312a12.6.2025.12.10.16.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 16:33:46 -0800 (PST)
Message-ID: <af8fd275-a34d-4b2f-8834-9c85dab2bbae@sifive.com>
Date: Thu, 11 Dec 2025 09:33:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/22] mm: Allow page table accessors to be
 non-idempotent
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-9-samuel.holland@sifive.com>
 <fbfef7fc-4030-462b-b514-498eea6620aa@arm.com>
 <c2597d43-d909-4259-bb5b-9294e4069385@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <c2597d43-d909-4259-bb5b-9294e4069385@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_163347_573937_F2F6ED12 
X-CRM114-Status: GOOD (  10.05  )
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

T24gMjAyNS0xMS0yOCAyOjQ3IEFNLCBEYXZpZCBIaWxkZW5icmFuZCAoUmVkIEhhdCkgd3JvdGU6
Cj4gT24gMTEvMjcvMjUgMTc6NTcsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4gT24gMTMvMTEvMjAy
NSAwMTo0NSwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+PiBDdXJyZW50bHksIHNvbWUgZnVuY3Rp
b25zIHN1Y2ggYXMgcHRlX29mZnNldF9tYXAoKSBhcmUgcGFzc2VkIGJvdGgKPj4+IHBvaW50ZXJz
IHRvIGhhcmR3YXJlIHBhZ2UgdGFibGVzLCBhbmQgcG9pbnRlcnMgdG8gcHJldmlvdXNseS1yZWFk
IFBNRAo+Pj4gZW50cmllcyBvbiB0aGUgc3RhY2suIFRvIGVuc3VyZSBjb3JyZWN0bmVzcyBpbiB0
aGUgZmlyc3QgY2FzZSwgdGhlc2UKPj4+IGZ1bmN0aW9ucyBtdXN0IHVzZSB0aGUgcGFnZSB0YWJs
ZSBhY2Nlc3NvciBmdW5jdGlvbiAocG1kcF9nZXQoKSkgdG8KPj4+IGRlcmVmZXJlbmNlIHRoZSBz
dXBwbGllZCBwb2ludGVyLiBIb3dldmVyLCB0aGlzIG1lYW5zIHBtZHBfZ2V0KCkgaXMKPj4+IGNh
bGxlZCB0d2ljZSBpbiB0aGUgc2Vjb25kIGNhc2UuIFRoaXMgZG91YmxlIGNhbGwgbXVzdCBiZSBh
dm9pZGVkIGlmCj4+PiBwbWRwX2dldCgpIGFwcGxpZXMgc29tZSBub24taWRlbXBvdGVudCB0cmFu
c2Zvcm1hdGlvbiB0byB0aGUgdmFsdWUuCj4+Pgo+Pj4gQXZvaWQgdGhlIGRvdWJsZSB0cmFuc2Zv
cm1hdGlvbiBieSBjYWxsaW5nIHNldF9wbWQoKSBvbiB0aGUgc3RhY2sKPj4+IHZhcmlhYmxlcyB3
aGVyZSBuZWNlc3NhcnkgdG8ga2VlcCBzZXRfcG1kKCkvcG1kcF9nZXQoKSBjYWxscyBiYWxhbmNl
ZC4KPj4KPj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGEgZ29vZCBzb2x1dGlvbi4KPiAKPiBBZ3Jl
ZWQsCj4gCj4gwqDCoMKgwqBzZXRfcG1kKCZwbWQsIHBtZCk7Cj4gCj4gaXMgcmF0aGVyIGhvcnJp
YmxlLgpJIGFncmVlIHRoYXQgdGhpcyBwYXRjaCBpcyB1Z2x5LiBUaGUgb25seSB3YXkgSSBzZWUg
dG8gYXZvaWQgY29kZSBsaWtlIHRoaXMgaXMKdG8gcmVmYWN0b3IgKG9yIGR1cGxpY2F0ZSkgdGhl
IGZ1bmN0aW9ucyBzbyBubyBmdW5jdGlvbiB0YWtlcyBwb2ludGVycyB0byBib3RoCmhhcmR3YXJl
IHBhZ2UgdGFibGVzIGFuZCBvbi1zdGFjayBwYWdlIHRhYmxlIGVudHJpZXMuIElzIHRoYXQgc29y
dCBvZgpyZWZhY3RvcmluZyB0aGUgcmlnaHQgZGlyZWN0aW9uIHRvIGdvIGZvciB2ND8KClJlZ2Fy
ZHMsClNhbXVlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
