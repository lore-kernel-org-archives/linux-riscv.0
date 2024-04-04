Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B350CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 11:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4WrnSNRdAs0/RXdI/eZJ8KouJhimVmcrYtvw08xPYY=; b=nHLSfMlQ7tX4w3
	EcvAu/Mgz3PrakE+/3pFNKOmAAH+iLECdXN/cIub1ClqfxULybcO4RqCMN6+3lnbLPrXNdCLLMWeW
	yIHJx1kfvfA3Ks2e0vYwjD2TV3HGnv+LwqsHlQBB3h23N0B7rGqE/kcwLjnW0aVy1qgfHUTeN0uBf
	2bZBUIh/FrAZBL1HRblsEIogC1DlcD23sWm60AflGL/hhdJNBSP9Nj9wuJeii8fXsx0D4SIrlO19b
	wao0LHF7/wuw/O0rximbLMXqOZrrCNEXWtm6yhRZxpLqztz7CPlZQGWG60FgBFpuA7NGvl0oazU8P
	epvO/Ax5jZS/2kwPnrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLkK-00000002TvK-1W4M;
	Thu, 04 Apr 2024 11:59:08 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLkA-00000002Trg-1sdQ
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 11:59:06 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6154a3df493so15318747b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 04:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712231934; x=1712836734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qH4XZ2IFxQPw0iadjvJVCpAIxzbzeVvAzyXBRoeAy9E=;
        b=RDhp3f++5C1jwCbBYF9oyACAptzj3lSaFXaoLfUMlYnLX+JvZYQ95B74CdrHVSJQnR
         C0bCVP7yUgzPs66l9hLx/8yBUITo7c1OyKtjjDN1A2lS5tUMKTCR8bQrAeWMk5KnYwwU
         3iktX/csmFl411QJtRzYJiUB3BTVbLQLzf9lkJr7womCvXa3fbDh5D7DfqqSAu1WL/Re
         DQ5ewQKz+zJjNchh49+Ow5Vg5Q4tGLXnK5cE/a9Ry94z5YZcqpZglqZX9kNkf7WxEdLG
         tBrJ3aXhm2BuQfdLzu3SYgmVODmzMryHxdS/1NVIIbkxHDS0SeCrw5gMHCgiZOg/M8HZ
         7uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231934; x=1712836734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qH4XZ2IFxQPw0iadjvJVCpAIxzbzeVvAzyXBRoeAy9E=;
        b=Zr3SGBIdfRfEVNhmuV8M3MH6xvIWhcjZ+V1KAMFGq5YXeE79i9FPaP5PcGFgqjSXlF
         p7Atqq1rVE9PLbFYmDox77RzgNN9Yvd7NgXreO7Y3IIqlxMJ9IU3E2uRNLiJ5GjdEJkg
         9s6C2gd50HvxBj4tlUcxOKqyi5oQqIH01B6SmKask1oPsOFc7fockyfnKYg8BN5Uh+C+
         mB8TSBjaF+LglZ0a2lKfjtqeKqHTevskYzk9q4aTBwAYkdy6QZjYyfpjUpBcexB3Ii3i
         lj5B/MwWkZHHgCt4Kj8AjXb6yTy0odxO8aIHQomF1z4rbAylvYcXzlL1P22WDsumlZMc
         HHYw==
X-Forwarded-Encrypted: i=1; AJvYcCWzV+NWQIzaKUOpWJ9Ffs1c0pUZhBQ7njP8b1S59m1MUPkY6nJ2JymefM5I8SQDo1Arwf2F9lnzA/N4xxbe3I5t+aTFs7+5NIgEYSIuz8kA
X-Gm-Message-State: AOJu0YzElBztiZUHNM8QyYdISSUnKeKjd/uBs8SVCVE3CJR8ksqv8AFN
	jRh17tIgTM3bf/Q1kHl2s5D1xjTTSUQNXneN884T3KILm10jJfxlRoNZFB2mx9OW0xvxRh/xoL+
	/aUDZt4aLyUCEcD1Grn1l/bJxJ9wi8tFe8mN95CL4M9G7Qn+U
X-Google-Smtp-Source: AGHT+IG8yq2enP3IQcY0tQ0zROWSYj21wUUMvwbt1fBAPBhrcUUxHgaEhfw3RVmcgwq6VENuY6ZjFW5jBZpK4n3+YRw=
X-Received: by 2002:a05:6902:c0d:b0:dc7:4265:1e92 with SMTP id
 fs13-20020a0569020c0d00b00dc742651e92mr1948021ybb.23.1712231933979; Thu, 04
 Apr 2024 04:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
 <tencent_6D10A9C63E3E0F412EED33477B5CDB98C207@qq.com> <CACRpkdY1wpGM7M5QV5rN0M6JMN_yugQJ7CEtnQjzsheD5AT23A@mail.gmail.com>
 <20240402-automatic-radial-7bc7dc342987@wendy>
In-Reply-To: <20240402-automatic-radial-7bc7dc342987@wendy>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:58:42 +0200
Message-ID: <CACRpkdZbCJWWZkJZbmCnGqKq=ZxJB5gT5RHBLMz2cBoz-UDFUg@mail.gmail.com>
Subject: Re: [PATCH v6 08/11] pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_045859_712187_BAEF5FE9 
X-CRM114-Status: GOOD (  12.81  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAyOjU44oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBBcHIgMDIsIDIwMjQgYXQgMDI6MzE6
MzZQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiA+IE9uIFNhdCwgTWFyIDIzLCAyMDI0
IGF0IDE6MTPigK9QTSBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNlbGYubmFtZT4gd3JvdGU6Cgo+ID4g
SXMgdGhpcyBwYXRjaCBzb21ldGhpbmcgSSBjYW4ganVzdCBhcHBseSB0byB0aGUgcGluY3RybCB0
cmVlPwo+Cj4gVGhlIG5ldyBzeW1ib2wgZG9lc24ndCBleGlzdCBpbiB0aGUgcGluY3RybCB0cmVl
LCBzbyB0aGUgZHJpdmVyIHdpbGwKPiBjZWFzZSB0byBiZSBjb21waWxhYmxlLiBZYW5neXUgc2Vu
dCBhIHN0YW5kYWxvbmUgdmVyc2lvbiBvZiB0aGVzZSBzeW1ib2wKPiBjaGFuZ2VzOgo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC90ZW5jZW50X0RCMTEyMTRDOEQwRDdDNDg4MjlBREExMjhF
N0JCOEYxMzEwOEBxcS5jb20vCj4gVGhhdCB3aG9sZSBzZXJpZXMgbmVlZHMgdG8gZ28gdGhyb3Vn
aCBvbmUgdHJlZSB0aG91Z2gsIGZvciB0aGUgc2FtZSByZWFzb24uCgpPSwoKPiBJZiB5b3VyIGFj
ayB0cmFuc2ZlcnMgdG8gdGhhdCAoaWRlbnRpY2FsIHBhdGNoKSBJIGNhbiB0YWtlIHRoZSB3aG9s
ZSBsb3QKPiB2aWEgdGhlIHNvYyB0cmVlIGZvciB2Ni4xMC4KClllYWggdGhhdCdzIGZpbmUsIGdv
IGFoZWFkLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
