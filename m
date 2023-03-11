Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34485C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 21:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2Wiuh26gmB0D+ygGUGoWAo/bBcnHjcrx4qUjBfQ5YE=; b=dR3tSUBaRSVY0y
	VOfj7GzAvfG29WKIuBdqBHb7F1K/igZ8qkqlvsqMK4SIt982bLy/Y6/2aO3c+GJrDuMBlHXHcrXNA
	yxi2MRvZyOBjNvyo88C3POwcBPWV+faIHAm4KBYqH3W0p9/cPasbyAgo/7UrlBkHkgeHBK+AJ5EKl
	qausos28kvUAf0u1xu5zJTAM8/GSiD5rl4U/75Hju8PVAOaj2rnU4iFq9Nik0logzKuXKFhDnR4or
	D8yFnkBZy4KiShDBxyn29wuxtlk66IqLFopXkY2ZqBagQREhMmKo7wn3XqRRipXitSGLF5aAPoJxG
	Fy8HenG8otOi1YbPr9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb74b-001Jo7-8Q; Sat, 11 Mar 2023 21:48:17 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb74N-001JiJ-LU
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 21:48:05 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-54184571389so20169917b3.4
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 13:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGcFJ5ZxlDi9b/UdZuLc5OKiysEmLsLLWteNS6EE4s8=;
        b=slvilrR7hL2U+x5tjSLa8nfAo4reE3kTOTus1wS3FCOIF51shwNRrueWrFqCO2sfQp
         y3ay+nZQTaboeL4nzyyx2zUHRkxrbOthRtbNASa9nFaYDv9O6q0GGBZE67CYn2vX5tKT
         rBOg5+rhD3wCrI+vhRg7bt3ar5tJyU5Bnn1bUFshqNAsz5442iG82RC/Vy10EliokxKD
         LtzvXMqHAOlRFleox9BSlZr5OpeU/OKtREjvs8Cyq9CAHtSPldFxGZBSRWp2iacjsN/i
         Qm6Fyfz55wA3murhe8oaS5jG5mq37BhDPTuz3cy4ia+qNX1GrYqDMIExz6iRZj1OEMfA
         l0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGcFJ5ZxlDi9b/UdZuLc5OKiysEmLsLLWteNS6EE4s8=;
        b=fNyGa6c7N9iLEO5xnR7nAwfQkQxBGJ1autYIyhD1ciuvpA0UZUVzXuDDw337jg3DY3
         LDlcb+phRWiF0WHGJfx453KMnVpvj7pyUJw6UcZNZjR5p0AlaXyYr3qpwmU18mnlMLeE
         GuI+033+3pTYEZAYDVlwU0qn6FOnv4o9Ux+DHSBoDtxv1AKuLM9NbyLUX0oevDbZLbOB
         lpXbS3ZPLbZFmVNlhCG4ePizS9D6noqfGHGgtDaTvenbQKTROkN+lAMbRl4Zyt8hpJyP
         EM21Y0xbpigwavWKsRY1EN38WmG3r8vLSol/I64UmWzRgdAT3/Zbc1SReJtth5lZeR0b
         CvvQ==
X-Gm-Message-State: AO0yUKWhAIzEDT+vH854GwNhnEWTl1Ezf9tr3FK2//8NCUJkKBtVXZQ1
	Qk+p9rrt6+xgM0Vso5O1NY+ibqLkHRnHvbCAnhFpgg==
X-Google-Smtp-Source: AK7set+YWOvwKMA1dPUxLsgUB6Fr01943IW1At9zwSR197k6yZtnzlsy0wbTdNADDF+fKXrTt/C9WEZ0kzk2Zcjd2Vk=
X-Received: by 2002:a81:ae61:0:b0:541:822f:af40 with SMTP id
 g33-20020a81ae61000000b00541822faf40mr966072ywk.10.1678571282495; Sat, 11 Mar
 2023 13:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-3-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Mar 2023 22:47:51 +0100
Message-ID: <CACRpkdacHi7J1rjaFyxK7uNkKGmVpno71pVmPrAkrCvDc5_KFQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] gpio: rcar: drop of_match_ptr for ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mun Yew Tham <mun.yew.tham@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Nandor Han <nandor.han@ge.com>, 
	Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_134803_708301_DEE0C749 
X-CRM114-Status: UNSURE (   7.56  )
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTI6MTPigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgZHJpdmVyIGNhbiBt
YXRjaCBvbmx5IHZpYSB0aGUgRFQgdGFibGUgc28gdGhlIHRhYmxlIHNob3VsZCBiZSBhbHdheXMK
PiB1c2VkIGFuZCB0aGUgb2ZfbWF0Y2hfcHRyIGRvZXMgbm90IGhhdmUgYW55IHNlbnNlICh0aGlz
IGFsc28gYWxsb3dzIEFDUEkKPiBtYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZlbiB0aG91Z2ggaXQg
bWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgo+Cj4gICBkcml2ZXJzL2dwaW8vZ3Bpby1yY2Fy
LmM6NDM1OjM0OiBlcnJvcjog4oCYZ3Bpb19yY2FyX29mX3RhYmxl4oCZIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCj4KPiBTaWduZWQtb2ZmLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+CgpS
ZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
