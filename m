Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DADC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 03:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJtB8VB4AYq0Rm880jqVNMt9h5Rbx+WL7kXBpsbAHEk=; b=4kB3u1f4ek6MZlAbdn2ip7wGyc
	lt+uy379uNYWyTO8iszuDC4X6LASGyuDUtSQ3lhDm6LNzpAqpNx1cIyAh3V1hrqOgPZaHYu3j2U8i
	lcaXJ8Yj6t7jRPbiBBEb07TwIC7AC3do16+cFEzgTAwBYw4rVxMvS5XeZ2vNsAS2wC/y96jZwoLNV
	JOXM36x94/5COvfRpMzbWGs9zV/4zGeWTsctpOp/Y1NKwWKX8yutvx6Imw/K9gtAFKc/DnDho7LY+
	7umSlFSeR6YZnr/qHTopzYwPx6KCcghJ1feJzRTd7CNVxNKJSpQZESvpBo3ztBByb77fuekCKoqWV
	iUoBfmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxfLT-00000004IkE-2zDO;
	Fri, 19 Apr 2024 03:55:27 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxfLQ-00000004IjA-3U67;
	Fri, 19 Apr 2024 03:55:26 +0000
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so937557a12.0;
        Thu, 18 Apr 2024 20:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713498922; x=1714103722; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Sdu6h80t0SgorDxNNQ6cN+80d3emFIVVAnewaeFSZo=;
        b=Otk41do/2Otr3arklPdgxHdnFjqW15/C5P6q7K2EfblPbHPHiHlZTGdm1zd18/ikwd
         UKPWDK96yxBxNEplWvFqaztCjKM/uGRzUqJj1Y7oUCUxM0HnsP9zZoF7eoXBjknPME2p
         Wa7/qsjiRLb8HZHbALxEzFD6gfHVn/i+LKNkb7cwDxwybVRSwBy7cmQMeIZSyOFURW8W
         4k6AJWbnClKA45J66xj/YpEeg6YSELWjDz86HvvT+31Mg/eMmub/JklqhVMFX8HIrGhn
         mDnoEsR6Vga8qPrbKZjchG56ojzBveMtRUw6gf09fDvQaGtDzHY8pqUcv2ICJjdNGCo2
         QsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713498922; x=1714103722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Sdu6h80t0SgorDxNNQ6cN+80d3emFIVVAnewaeFSZo=;
        b=WuyE5diarlhAh7RuVI+LTuU9chq7h60X1oQE1JZK0SLH5GG20RFJ6A7iWGnnjdX3+W
         SlFoFSYiMdODl/Gyy9L3G4WW7mpIGE4ie4MVt0u1ShXKf3SAzrbfeCz4lWFbXqhbOv/J
         DiGWxQmyL+vqcUWCeTl9rFqHFwRTN+wQwcnVzHlBsorrgenmY/3AuUIc2aRL2IDg1g2v
         2wlRs7ZKQ38le53yPQ2PJqdlYyqUeD+PeRnkXNaXQOfh77gUP4IyWsFca0FpR8V0oTQg
         XYEPqDbPu0EmThecY7rxhW6/Vwf+U8ACo7nZ5/NXU5ETGb29K0LtkEj2QVCImTZcrxDy
         xi2w==
X-Forwarded-Encrypted: i=1; AJvYcCUNn4/uYJtzL64sEvsIcu6kQAvtYc6k6K4YN4+6f6UTZ19Q96gwUETGCihaf219TUJ32P4bdeUm5unglCp3CxVuTVG2WqKNUXME/oV9SEpBJlanJiPbIaCw26oxTIgJtvG+btdA58k4lKt9xHBM16Hzf5UgyHs=
X-Gm-Message-State: AOJu0Yyf/dTIsB8TujycWZTcS5BS/Cm07wI8/DFhy3AS9Rq1FEJzZGli
	0has6Vqg07DDH7RkfSVlRAo1PoxOiJLb4ADu0r4RUBDouFVPBsrj
X-Google-Smtp-Source: AGHT+IGyBwaxrESeGxC8XP4K1xlGjY0jVJ9oR9qu3J3AKH7owVK+n9PHDJdr8gY/ePIPIdZgjaabNQ==
X-Received: by 2002:a05:6a21:1f16:b0:1a7:6e6:edd6 with SMTP id ry22-20020a056a211f1600b001a706e6edd6mr1132842pzb.52.1713498922433;
        Thu, 18 Apr 2024 20:55:22 -0700 (PDT)
Received: from [172.27.234.152] (ec2-16-163-40-128.ap-east-1.compute.amazonaws.com. [16.163.40.128])
        by smtp.gmail.com with ESMTPSA id w6-20020a170902e88600b001e4ea358407sm2315725plg.46.2024.04.18.20.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 20:55:22 -0700 (PDT)
Message-ID: <84b162f6-fc34-4008-83f6-2ee9e42c5a59@gmail.com>
Date: Fri, 19 Apr 2024 11:55:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 2/9] irqchip: Add RISC-V incoming MSI controller early
 driver
To: Anup Patel <apatel@ventanamicro.com>
References: <20240307140307.646078-1-apatel@ventanamicro.com>
 <20240307140307.646078-3-apatel@ventanamicro.com>
 <8738cb85-fac1-4a15-9666-eb05316f5368@gmail.com>
 <CAK9=C2X+Aovid=AFXP-EOj3-f6xDYiGsMMNOqknFr58nu5dgbw@mail.gmail.com>
Content-Language: en-US
From: Eric Cheng <eric.cheng.linux@gmail.com>
In-Reply-To: <CAK9=C2X+Aovid=AFXP-EOj3-f6xDYiGsMMNOqknFr58nu5dgbw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_205524_910293_BF1C278D 
X-CRM114-Status: GOOD (  14.13  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNC8xOS8yMDI0IDExOjQ0IEFNLCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIEZyaSwgQXByIDE5
LCAyMDI0IGF0IDg6NTPigK9BTSBFcmljIENoZW5nIDxlcmljLmNoZW5nLmxpbnV4QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IE9uIDMvNy8yMDI0IDEwOjAzIFBNLCBBbnVwIFBhdGVsIHdyb3RlOgo+
Pgo+Pj4gK3N0YXRpYyBpbnQgX19pbml0IGltc2ljX3BhcnNlX2Z3bm9kZShzdHJ1Y3QgZndub2Rl
X2hhbmRsZSAqZndub2RlLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgaW1zaWNfZ2xvYmFsX2NvbmZpZyAqZ2xvYmFsLAo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1MzIgKm5yX3BhcmVudF9pcnFzLAo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1MzIgKm5yX21taW9zKQo+Pj4gK3sKPj4KPj4gLi4uCj4+Cj4+
PiArICAgICAvKgo+Pj4gKyAgICAgICogRmluZCBmaXJzdCBiaXQgcG9zaXRpb24gb2YgZ3JvdXAg
aW5kZXguCj4+PiArICAgICAgKiBJZiBub3Qgc3BlY2lmaWVkIGFzc3VtZWQgdGhlIGRlZmF1bHQg
QVBMSUMtSU1TSUMgY29uZmlndXJhdGlvbi4KPj4+ICsgICAgICAqLwo+Pj4gKyAgICAgcmMgPSBv
Zl9wcm9wZXJ0eV9yZWFkX3UzMih0b19vZl9ub2RlKGZ3bm9kZSksICJyaXNjdixncm91cC1pbmRl
eC1zaGlmdCIsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZnbG9iYWwtPmdy
b3VwX2luZGV4X3NoaWZ0KTsKPj4+ICsgICAgIGlmIChyYykKPj4+ICsgICAgICAgICAgICAgZ2xv
YmFsLT5ncm91cF9pbmRleF9zaGlmdCA9IElNU0lDX01NSU9fUEFHRV9TSElGVCAqIDI7Cj4+PiAr
Cj4+PiArICAgICAvKiBGaW5kIG51bWJlciBvZiBpbnRlcnJ1cHQgaWRlbnRpdGllcyAqLwo+Pj4g
KyAgICAgcmMgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMih0b19vZl9ub2RlKGZ3bm9kZSksICJyaXNj
dixudW0taWRzIiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmdsb2JhbC0+
bnJfaWRzKTsKPj4KPj4gV2lsbCBoZXJlIGNoZWNrIGlmIHRoZSBwYXNzLWluIGludGVycnVwdCBp
ZGVudGl0eSBudW1iZXIgaXMgKG11bHRpLTY0IC0xKSAmJgo+PiBiZXR3ZWVuIFs2MywgMjA0N10/
Cj4+IFBlciBzcGVjIEFJQSB2MS4wLCBTZWMuIDMuMSBJbnRlcnJ1cHQgZmlsZXMgYW5kIGludGVy
cnVwdCBpZGVudGl0aWVzOgo+PiAiVGhlIG51bWJlciBvZiBpbnRlcnJ1cHQgaWRlbnRpdGllcyBz
dXBwb3J0ZWQgYnkgYW4gaW50ZXJydXB0IGZpbGUgKGFuZCBoZW5jZQo+PiB0aGUgbnVtYmVyIG9m
IGFjdGl2ZQo+PiBiaXRzIGluIGVhY2ggYXJyYXkpIGlzIG9uZSBsZXNzIHRoYW4gYSBtdWx0aXBs
ZSBvZiA2NCwgYW5kIG1heSBiZSBhIG1pbmltdW0gb2YKPj4gNjMgYW5kIGEgbWF4aW11bQo+PiBv
ZiAyMDQ3LiIKPiAKPiBUaGVyZSBpcyBhbHJlYWR5IGEgY2hlY2sgb24gZ2xvYmFsLT5ucl9pZHMg
dG8gZW5zdXJlIHRoZSBhYm92ZSBpcyBzYXRpc2ZpZWQuCj4gUGxlYXNlIHNlZSBmdXJ0aGVyIGJl
bG93IGluIGltc2ljX3BhcnNlX2Z3bm9kZSgpIGZ1bmN0aW9uLgo+IAoKUmlnaHQsIHRoYW5rcy4K
Pj4KPj4+ICsgICAgIGlmIChyYykgewo+Pj4gKyAgICAgICAgICAgICBwcl9lcnIoIiVwZndQOiBu
dW1iZXIgb2YgaW50ZXJydXB0IGlkZW50aXRpZXMgbm90IGZvdW5kXG4iLCBmd25vZGUpOwo+Pj4g
KyAgICAgICAgICAgICByZXR1cm4gcmM7Cj4+PiArICAgICB9Cj4+PiArCj4+IC4uLgo+Pgo+Pgo+
IAo+IFJlZ2FyZHMsCj4gQW51cAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
