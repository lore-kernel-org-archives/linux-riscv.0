Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3711C54E90
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 09:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fidnP1SeqeRdqSgNdkSXkxUalLnCu8HtID7MDbZWGjg=; b=JlRnLB6I90M+yf
	Pdye2LlZyR3iFgU/q3UvwgkxeR2Xa98fhYM7VG3cwKpl7dYX+gT1qR31fJhldDi7NwoxMXJmJBWKB
	MfUPnmtAsrSp6FEBOCO2NC0ACSnkE+x2v2+CKk/J/8rpJwEkdFNgLXMdtb2Xi/uLTz5gjhrdXVEnM
	Z4h65Db8Kxwzs1w/t86PdcdagG9+y4zwgADa0yBwl2oRt81lDwpHXnQxnsQ483bfs6sdd6r91mLcS
	64Bd0eXIZqpr8VRN5rzxSragKNU6e4ByChgTH8n9NePOn2o4D71of99b3OYMjBVBh5h6EVTMh8HTI
	hBM1PiaN90DYvuDM83Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2go-00000000b8A-36f8;
	Thu, 22 May 2025 09:58:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2eB-00000000aUw-44RT
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 09:55:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so86033395e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747907730; x=1748512530; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N85CK9sWp6+mFnqAqGxmA0vF6xRLZ1OY4Jq5uN3nns0=;
        b=V+iHKCXqsB5vwu/K579lY4waA8nLjCHISHJ4lzmOl34J0NzuFe35vPbE73UMxGIhkM
         phRUETVUlTUsh/g5YIVDo0905BnFddDa2GOpYinJgcScumuuV9lgzPAJ4LHMWqbF2s+X
         37PXep8RGpnuMHP3vZZUPA0nFQXgzVwjhVRYs8VeFELXBEHJYolcFzM4IFrXfCMmk9qO
         jIwmIgaEgi88Df1jS7fPN/w+YfgQEksmJuSTHiI9zfQsW975Yh2mjT9A30gBerOXOJ/q
         OaHiLqCx1/YvH0Jt4fX/TBl05jfHHKFv8NgSDXbfSfHG8G2Q5ViDKWfYpFOFfZaj29/s
         FhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747907730; x=1748512530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N85CK9sWp6+mFnqAqGxmA0vF6xRLZ1OY4Jq5uN3nns0=;
        b=vqXRD9FJwMVYEqwHt/rnrvDiFCM2iIGbO0wUBEp+4TqW2ipBskH1X/h2lUlkjdwcsg
         SbaH+MUWtLodRDr2Tjl3PFG4egbvisTH6AWLEWvUBGkWvCyeyEqJDpoFTN8fzaO0CV2C
         tVw6LVYBx4Tv+u3jSi82VJVPLGseXK4qMAodibZUJeJ7qrs7H4GwbKTop2wO1lZCsYir
         0VQPNW89VMjTswNzitT2lXxbOpXDXDejZrEQm1fO4hmbj925P0VlFYt6cr23RP8nGCP3
         rgY/sWDwOjvy3h3+nGxNDF7Ah+zr3PK2O/2BB+s/iNF929ANE/zCkOQjEwxLYpvFyd30
         By4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfX4tdhwts8MUd6LetEGqXzRIXwaJ5WjZiA/NHj9Cu3B6OYNKAWS7aY6VjNN+28l+I3o+eqJzAcHKQbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvKhakIXYPgUDO6IfMLYCS1JTd+S+ByFJGh8UUr4+SB7VXk1cy
	XWJgcB9h+zolbvfS+n/7uivwRlJW7yG1jHoFzud0lAocS9xuWDGMq4Q+zEogViamzn8=
X-Gm-Gg: ASbGncuAaMI3qp0UW05LmQ+xpjeRfywZ7KglNg71Iu1iP7+cO1O6n+/vYeC/tzYqNFF
	yvO75wJQ7rCsbAxnUlXZPgwvyk66WkcbbGwSl0uM5EGw4SJJjkWBWEfS8NwJMoOqKcBD40H6zv+
	sKO3GXYjN4R53TeR/FrAl/8SmyJA65LcJ9AE6Ca7kpdmCyEUvJsrl6s8u8ZfBEebRMSc5blIRsm
	QHTajpywLy8WjQDmL+xe/OHziBn5XCxgU7yGItM6SDXVSxlQX+AE9sG3PixxZAlvt+Q1smY+Fn/
	f6FcI6eLDxJaWGe1wOsUfxejXRfzFljGNuIniD/QM3vchzO7YXDY2w9pyNzqednifY8PDcberVA
	/BUseEVZgq+g2qmESd8YZ
X-Google-Smtp-Source: AGHT+IGlBdPQ4Ket+t0Pzwh3J2o3hjvlvuhgKqsoA4ERFUZXVz8H96bSIMPAXq+HQL+iX73vE7/+8w==
X-Received: by 2002:a05:600c:c059:20b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-442ffc60edemr147130325e9.3.1747907730316;
        Thu, 22 May 2025 02:55:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23bfdd9sm96314495e9.18.2025.05.22.02.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:55:29 -0700 (PDT)
Message-ID: <3c8474fb-75fd-4ea1-887a-53f625e4eadf@rivosinc.com>
Date: Thu, 22 May 2025 11:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drivers: firmware: add riscv SSE support
To: Qingfang Deng <dqfext@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250516152355.560448-4-cleger@rivosinc.com>
 <20250516152355.560448-1-cleger@rivosinc.com>
 <20250521074627.4042832-1-dqfext@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250521074627.4042832-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_025532_006327_2C2A8EB0 
X-CRM114-Status: GOOD (  12.26  )
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

CgpPbiAyMS8wNS8yMDI1IDA5OjQ2LCBRaW5nZmFuZyBEZW5nIHdyb3RlOgo+IEhpIENsw6ltZW50
LAo+IAo+IE9uIEZyaSwgMTYgTWF5IDIwMjUgMTc6MjM6NDEgKzAyMDAsIENsw6ltZW50IEzDqWdl
ciB3cm90ZToKPj4gK3N0YXRpYyBzdHJ1Y3Qgc3NlX2V2ZW50ICpzc2VfZXZlbnRfZ2V0KHUzMiBl
dnQpCj4+ICt7Cj4+ICsJc3RydWN0IHNzZV9ldmVudCAqZXZlbnQgPSBOVUxMLCAqdG1wOwo+PiAr
Cj4+ICsJc2NvcGVkX2d1YXJkKHNwaW5sb2NrLCAmZXZlbnRzX2xpc3RfbG9jaykgewo+PiArCQls
aXN0X2Zvcl9lYWNoX2VudHJ5KHRtcCwgJmV2ZW50cywgbGlzdCkgewo+PiArCQkJaWYgKHRtcC0+
ZXZ0X2lkID09IGV2dCkKPj4gKwkJCQlyZXR1cm4gZXZlbnQ7Cj4gCj4gYGV2ZW50YCBpcyBub3Qg
YmVpbmcgdXBkYXRlZCBieSB0aGUgbG9vcCBhbmQgdGhlcmVmb3JlIGlzIGFsd2F5cyBOVUxMLgo+
IERpZCB5b3UgbWVhbiB0byByZXR1cm4gYHRtcGA/CgpIaSBRaW5nZmFuZywKCkluZGVlZCwgdGhh
dCdzIGEgbWlzdGFrZSBJIG1hZGUgd2hpbGUgcmVuYW1pbmcgdGhlIGV2dC9ldmVudCBzdHVmZi4g
SQpkaWRuJ3Qgc2F3IHRoYXQgc2luY2UgaXQgaXMgb25seSB1c2VkIHRvIGNoZWNrIHRoYXQgd2Ug
ZG9uJ3QgcmVnaXN0ZXIgYW4KZXZlbnQgdHdpY2UuIEdvb2QgY2F0Y2guCgo+IAo+PiArCQl9Cj4+
ICsJfQo+PiArCj4+ICsJcmV0dXJuIE5VTEw7Cj4+ICt9Cj4gCj4gPHNuaXA+Cj4gCj4+ICtzdGF0
aWMgaW50IF9faW5pdCBzc2VfaW5pdCh2b2lkKQo+PiArewo+PiArCWludCBjcHUsIHJldDsKPj4g
Kwo+PiArCWlmIChzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfU1NFKSA8PSAwKSB7Cj4+ICsJ
CXByX2VycigiTWlzc2luZyBTQkkgU1NFIGV4dGVuc2lvblxuIik7Cj4+ICsJCXJldHVybiAtRU9Q
Tk9UU1VQUDsKPj4gKwl9Cj4+ICsJcHJfaW5mbygiU0JJIFNTRSBleHRlbnNpb24gZGV0ZWN0ZWRc
biIpOwo+PiArCj4+ICsJZm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkKPj4gKwkJSU5JVF9MSVNU
X0hFQUQoJmV2ZW50cyk7Cj4gCj4gYGV2ZW50c2AgaXMgYWxyZWFkeSBpbml0aWFsaXplZC4KClll
cyBpbmRlZWQsCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPiBRaW5nZmFuZwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
