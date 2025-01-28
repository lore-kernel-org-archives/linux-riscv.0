Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBEFC02190
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 18:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvSpDQ4W85RqW6jdTs8N+rH9GFB9AwB8C8jRWTyzR9Q=; b=dScjurjahpAEB/
	M5FV7LhLZbtB0hV5gOtezAP7Y6BckXSjJ4pqUSG2NWK4NdUPqQgG1JRjif1MHh/lQbMmNftzmHj4q
	/4V/kBlgQYscJsb4yN/wj9n9kycdRoagj5taMhUrLZikPmyo2/3mQX2lCipW8fYRTxmEJZY4Geszu
	ErC29zDuvOyPoInhH6UaQovNMQZxiZJXNBxSzzoZFSZK3SlnzF/TcM7iRN+PS/qppB6528RjQiVSX
	GPsAJTZwA42VFyfqaePA/G/YP6CiojuapjNzOUYjrbfvsF6xYNNdIOsoekAdEUNev1cGhqpcVYHpE
	V2ln/xr/GSlgIBNGRLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcqfr-00000005dG4-3BeB;
	Tue, 28 Jan 2025 18:50:59 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcqfo-00000005dFS-21I6
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 18:50:57 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-84cdacbc3dbso435846139f.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 10:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1738090255; x=1738695055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqUXIYlkxvfYqINhnODqmqhH4YgyMU363PiAXYfM844=;
        b=lNwGJrYkgHIHovTGUWRst5KZ9/IMESP+j5Fk9JjeNQC+S1DkjQ+4f7mEo74B5w6x8t
         m1t6zll/gZLpQ82iA0B9aJvX8NBORxBXTsgQiN+Oy3+8ODTPgywTFerhdryZf6uXklbf
         XLNNGzfb5j5ORU39JR2ACW/LbX5LPqrrfcpjLArmuqjgEDpyYQywcaVi+HJJU6v/NS8v
         3H92DJCUnb6l3+EgIL8xufZ0uzJYcd3JqX04clU91J+k758cgSnTDJXVcawPWwD+uzLs
         n0OR0IvmW3exS3fbYuO9TSF3ry7o8/WSJFgNraEXbpSqkVRUAel8sB2kFRqCQwHbqgXo
         v9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738090255; x=1738695055;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqUXIYlkxvfYqINhnODqmqhH4YgyMU363PiAXYfM844=;
        b=tpKf/S0ZuDRbVhmbCAGj/RxnOee+sldX/v7LfBkrusBYY7CD0bdftGxgtIOULhNx3E
         3aOppGUkR7lb9LwxNccW7n4wLyVss+Zk42o5aIab0N0kwuXNHaqh3L3Pt738CYMGSMI0
         2KjHKsSXwy8zlW0BRjmGHyys1jQEtm2mf5ISqK5MU1l+bjmPYzF9NSQp+9UPKIDBALjS
         u15EembjdDOJl1Y1II+FBuhvDSe6nWzbzxmdw0dp4Fw30CqJoOpq0atFXG7K+/EtSL4A
         FPdXAA1USkKy0ZzsNMj4gvXd6ia/+fzmWugUGcxpQP/62NMghvE41n45K1/VD3YdoJpf
         HB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXI4SilbSyZg1tSiQXrTQegUKRROcsCcvKls2ot/Cyj47pwlUT9i6gbMbrEUgnyEhu3YIud2cqe5LIrjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YysF+ih7dZ4E08nfDFGFpJnhjHDU1vMBnqASFM6j2V2AvQklUcl
	PRzy99wzDp7h7BvMQbH6xUb+zc6upz4SvVeV+qyFPsSqPaZd/0A8WqyWWRPzu70=
X-Gm-Gg: ASbGncsaVW8Z2agd2Y4qzLIBccXlIMDVYN78OKl9oLLHNrBu81oleXKZC0J0aJ8l9jg
	zzNcka8YAxStZSE+YD8JBFFivcqnP3ah99KNuc1wjEK/djY5hVzsBaFZ6git1tzNupp1x3yX8dt
	38IErqEXg7Cpf0peDCmMKURkzMna8C6cePWp/pkAebAWtEMfSudSWu/u8QQLM8HoPwIOzQNqnAj
	L0QmQldYaC6r2cKkX2f9HRbYrVM5D/06uBZplRf8F7zeg280SMP6syXYq7eNJ+zzOBtefgiUqGO
	K01yUxwlXKyLF756h/HenkwwQ30JMo2wEWL1Olg=
X-Google-Smtp-Source: AGHT+IFS83gkdSZV4Cxk7SmOYgYnYCl3sC6BIr3NPp/pphQx7I/0PqjJZKMuyvqAaF0628suLeEFSA==
X-Received: by 2002:a05:6602:380b:b0:847:22a7:240e with SMTP id ca18e2360f4ac-85439fa6279mr40636739f.13.1738090254958;
        Tue, 28 Jan 2025 10:50:54 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8521e035792sm345458739f.40.2025.01.28.10.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 10:50:54 -0800 (PST)
Message-ID: <9dc005ef-3cba-4f9d-9d99-6a6fa49d9383@sifive.com>
Date: Tue, 28 Jan 2025 12:50:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan
 <dlan@gentoo.org>, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Olof Johansson <olof@lixom.net>,
 Inochi Amaoto <inochiama@outlook.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
 <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net> <20250123113042-GYA38135@gentoo>
 <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org> <20250128031712-GYB47737@gentoo>
 <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CAL_Jsq+f56DoH5YTV85ZqP52sMzkOtHtjWzQ7Tu4FhKSjTSpEQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAL_Jsq+f56DoH5YTV85ZqP52sMzkOtHtjWzQ7Tu4FhKSjTSpEQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_105056_533468_392E1909 
X-CRM114-Status: GOOD (  13.86  )
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

T24gMjAyNS0wMS0yOCAxMDo1OCBBTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVHVlLCBKYW4g
MjgsIDIwMjUgYXQgMTA6MDPigK9BTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFy
by5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBUdWUsIEphbiAyOCwgMjAyNSBhdCA0OjE34oCvQU0gWWl4
dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+IHdyb3RlOgo+Pgo+Pj4gW1JvYl0KPj4+PiBJZiBMaW51
eCBjYW4ndCBoYW5kbGUgMSBub2RlIGZvciBOIGdwaW9fY2hpcCdzLCB0aGVuIHRoYXQncyBhIExp
bnV4Cj4+Pj4gcHJvYmxlbS4gTWF5YmUgaXQgY2FuLCBJREsuCj4+Pgo+Pj4gSSBoYXZlbid0IHNl
ZW4gc29tdGhpbmcgbGlrZSB0aGlzIHRvIHJlZ2lzdGVyIDEgbm9kZSBmb3IgbXVsdGkgZ3Bpb19j
aGlwcy4uCj4+PiBUbyBncGlvL3BpbmN0cmwgbWFpbnRhaW5lciAoTGludXMgV2FsbGVpaiksIGRv
IHlvdSBoYXZlIHN1Z2dlc3Rpb24gb24gdGhpcz8KPj4KPj4gRm9yIExpbnV4IHdlIGNhbiBjYWxs
IGJncGlvX2luaXQoKSB0aHJlZSB0aW1lcyBhbmQKPj4gZGV2bV9ncGlvY2hpcF9hZGRfZGF0YSgp
IHRocmVlIHRpbWVzIG9uIHRoZSByZXN1bHQgYW5kIGlmIHdlIHVzZSB0aGUKPj4gYXBwcm9hY2gg
d2l0aCB0aHJlZSBjZWxscyAod2hlcmUgdGhlIHNlY29uZCBpcyBpbnN0YW5jZSAwLDEsMiBhbmQg
dGhlCj4+IGxhc3Qgb25lIHRoZSBvZmZzZXQgMC4uMzEpIHRoZW4gaXQgd2lsbCB3b3JrIGFsbCBq
dXN0IHRoZSBzYW1lIEkgZ3Vlc3M/Cj4+Cj4+IGZvby1ncGlvcyA8JmdwaW8gMiA3IEdQSU9fQUNU
SVZFX0xPVz47Cj4+Cj4+IGZvciBvZmZzZXQgNyBvbiBibG9jayAyIGZvciBleGFtcGxlLgo+Pgo+
PiBXZSBuZWVkIGEgY3VzdG9tIHhsYXRlIGZ1bmN0aW9uIEkgc3VwcG9zZS4KPj4KPj4gSXQganVz
dCBoYXMgbm90IGJlZW4gZG9uZSB0aGF0IHdheSBiZWZvcmUsIGV2ZXJ5Ym9keSBqdXN0IGRpZAo+
PiAyLWNlbGwgR1BJT3MuCj4gCj4gWW91IGNhbiBkbyBlaXRoZXIgMyBjZWxscyBvciAyIGNlbGxz
IHNwbGl0dGluZyB0aGUgMXN0IGNlbGwgaW50bwo+IDxiYW5rPjxpbmRleD4uIEknbSBwcmV0dHkg
c3VyZSB3ZSBoYXZlIHNvbWUgY2FzZXMgb2YgdGhlIGxhdHRlci4KClRoZXJlIGlzIGFsc28gYXQg
bGVhc3Qgb25lIGV4YW1wbGUgb2YgMy1jZWxsIEdQSU9zOgoKRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvYWxsd2lubmVyLHN1bjRpLWExMC1waW5jdHJsLnlhbWwKCkl0
IHN1cHBvcnRzIGNvbnRyb2xsZXJzIHdpdGggdmFyeWluZyBudW1iZXJzIG9mIHBpbnMgcGVyIGJh
bmsgYW5kIGJhbmtzIGluIGVhY2gKaW5zdGFuY2UuIENvbXBhcmVkIHRvIHRoZSBkZXNpZ24gZGVz
Y3JpYmVkIGFib3ZlLCBpdCBzaGFyZXMgYSBzaW5nbGUgZ3Bpb19jaGlwCmFjcm9zcyBhbGwgYmFu
a3MgaW4gYSBjb250cm9sbGVyIGluc3RhbmNlLgoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
