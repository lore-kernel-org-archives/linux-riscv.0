Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F12EC83F1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRIGVHkX0FInNVeZKvbbiOUBk+3W4HqFI3CDvfYmqnM=; b=HbMbr4oZizvCIE
	jl/s1yXHjOispQ92P7OH6gQSUxPZIFiNi+syOSaNaIFFIYjqOJp30Ardp8z17pBu8CWDF1MTKvGU1
	2VJUVbEfFe+Er0BejZmFL1g7OO5o2mgJZi/hS4FoFzeIDC7z51wlPbdZkjYfGPhHONCiB0a7sMwzP
	Z2pvbulY8u4TwRBh4k1NCkLBdgX8JMdZV6x0aDOcT3g5hChXm7M1BlCkffSovW68lKNbOngtNfP20
	uMTA2IDtnn8A4E+1kePLRPb/W+WRYn/rjg+4l8dCBex3m6kmnD+5OhqUKuIHVYO2AO7G4h3nDelrC
	SV7TgWGLFVmk+miOFfQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu7k-0000000CQNR-1TXj;
	Thu, 10 Jul 2025 16:27:52 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZryY-0000000C4YL-3xm9
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 14:10:16 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b391ca6146eso979827a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752156614; x=1752761414; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=21fWOwK2yuSSXtTJ/i70WbuqBdOJcLRjYfY+8UJRw7c=;
        b=Css57F/efTKi8GktOXdi549UCpQlY935qHBPuFqKNeAXs3cXow3eLMH0Rv21dlmmUO
         Cg6exP2s+GGczk85wFwplOPLAUcl/Dc9L6VhRKfd2rLrCrA0Yi7V7u3+vEsZ9aCn3lbJ
         7O4Qc0iDr6ZhVL9Yq0c6PNtichiu+UEkzbkhaoh4lw/ko+t9a0GJkF1uJgnaalU1M8Sk
         Iv2ply8bgmso43zDvarugT2EXEu9iGLdYpt9kzdkQpOtwLoW2YqY50Hvtf7gyLHpPn+1
         84Xj2SS6mGb9QRFk4y3CGhGC32gZ4Cfz7sRDVU9ns/ESkrILtZMHRuibu8Ni68O8GfNJ
         F0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752156614; x=1752761414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=21fWOwK2yuSSXtTJ/i70WbuqBdOJcLRjYfY+8UJRw7c=;
        b=c7EbfHa+qMXEYdSPE3a+QB08C8WOgxLB2bpPJuihKShEI7aedPVUfORXfccSsZXS6F
         fBNJ9eQbXmzD9hldmK7g7/mcm07Baw5f2J2vJDGsLLwBkSiV9gpXHOFaVRuOf03vROlW
         YYuC1eMHBAX7Br+JQ3IoKgMoiA5VPxJIFusmM7dNskuvF2wQdrhyh4Zq7zagkxF/dhJ8
         zE+FTgsXViAz17LigLmq7qhKUL8F45skWWKbMjeUAEtEDkK1/q8GyA7RrhDWbKuFIVjn
         ibikzWActEj/ht3coximpiBwX8rx11dzPEYMJUcN8P3sUxFKSfeuJ7hXPujTV+AxXHuZ
         PlvA==
X-Forwarded-Encrypted: i=1; AJvYcCUMHjhejdQUb2CsdSturZ3oNMrA0EE7vnIch81x9AZwNZVx0NkgK6t2k++ioOdZej4/ZAAvi28DVPI0Cg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiCUJ1fWB5Ccj51dEpHOvuE2JIDa+zbA6wrvKmEz6r67wOatUC
	h3ZRdFF+F1mlsO/SYoIYdF/DtQM49aTdjItWtG0UQCp0dKfv2RzMU7vSk8fc13bfj3s=
X-Gm-Gg: ASbGncsQpiYFw1bDTkQvWc3b3U0h9jwk+MdncUSKxqu22wR2K/LbIiqDSChkPI1auRp
	W0zETNaU9T3W79fwoLe3oIh7BgGkZv4hm39dgg0/t/MquazZVOFaPcmESfun+jRZv/2z6wOCQGZ
	5fDHSJxcWzQKc+5wtcqW7fwvaboitTn57zcO0P0AM17iMS5DP4shESQIGDqO+HUGQc3ONE25fH9
	N8cpywuJO6LHQfGV6qd4QbXzeZDk+CYcv0hbdCCFNmi2DYqx2l+WUmzdjJOt5o01MtK3seIyKKU
	LEf0ew326DetRE77dwAThlnNCWP+USe1X5q7PZStrmc1Mx+zuL+bxnN73idXLMNq3RzNkE6id0u
	myQEGsCTptgs6gKZ2ilbmfjOoWC8ZVfA=
X-Google-Smtp-Source: AGHT+IEMWPpfmJ6IKhaXf/A35j7A+4FLkS38lFffV7k0+kEpETGtEytg1GAw3/ZI2K24PUzBRx4VBA==
X-Received: by 2002:a17:90b:2808:b0:312:959:dc3c with SMTP id 98e67ed59e1d1-31c2fce136cmr9449563a91.10.1752156613976;
        Thu, 10 Jul 2025 07:10:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3e958166sm2318999a91.5.2025.07.10.07.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 07:10:13 -0700 (PDT)
Message-ID: <5db9ec69-d0e4-4113-a989-ac75d0f1e5dd@rivosinc.com>
Date: Thu, 10 Jul 2025 16:10:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] selftests: riscv: add misaligned access testing
To: Andreas Schwab <schwab@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20250710133506.994476-1-cleger@rivosinc.com>
 <mvmecuognj7.fsf@suse.de>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <mvmecuognj7.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_071014_979655_6F9707B1 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAxMC8wNy8yMDI1IDE1OjUzLCBBbmRyZWFzIFNjaHdhYiB3cm90ZToKPiBPbiBKdWwgMTAg
MjAyNSwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IAo+PiBUaGlzIHNlbGZ0ZXN0IHRlc3RzIGFs
bCB0aGUgY3VycmVudGx5IGVtdWxhdGVkIGluc3RydWN0aW9ucyAoZXhjZXB0IGZvcgo+PiB0aGUg
UlYzMiBjb21wcmVzc2VkIG9uZXMgd2hpY2ggYXJlIGxlZnQgYXMgYSBmdXR1cmUgZXhlcmNpc2Ug
Zm9yIGEgUlYzMgo+PiB1c2VyKS4gRm9yIHRoZSBGUFUgaW5zdHJ1Y3Rpb25zLCBhbGwgdGhlIEZQ
VSByZWdpc3RlcnMgYXJlIHRlc3RlZC4KPiAKPiBJZiB0aGF0IGRpZG4ndCBjYXRjaCB0aGUgbWlz
c2luZyBzaWduIGV4dGVuc2lvbiB0aGF0IEkganVzdCBmaXhlZCBpbgo+IDxodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi9tdm1pa2swZ29pbC5mc2ZAc3VzZS5kZT4sIHlvdQo+IHNo
b3VsZCBjb25zaWRlciBleHRlbmRpbmcgdGhlIHRlc3RzLgo+IAoKSGkgQW5kcmVhcywgeW91IGxp
bmsgZG9lc24ndCB3b3JrIGFuZCBJIGRpZG4ndCBmaW5kIGFueXRoaW5nIGFib3V0IHNpZ24KZXh0
ZW5zaW9uIGV4Y2VwdCBhIHBhdGNoIHlvdSB3cm90ZSBmb3IgYXJjaF9jbXB4ZygpLgoKVGhhbmtz
LAoKQ2zDqW1lbnQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
