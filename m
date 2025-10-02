Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83672CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 04:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=We6N3VP9Vn0U1ON7koWwfbam7ss9j4aKH937pzIowoU=; b=47lKjJbAL3HJqL
	Hvn8J7msjhoIaO1Lu4ckcX/ksm+zTRnsgFB0zMt3lFCWmPYY5l88qpAJ1jTEjJJPuicl1QGvt4Ygx
	6IP9Dleem8izG0V5Qk4xODH69iwjMPDiLuAfjb6vTgBxWtnA8ePLZ8R6ZfuG2LgzZYrmmFf3/vYzH
	Q9aUTfo1G0UlZ89bpV7oO/DBu2JoHMuXq3BaRWlFLj0TpzetaCArOlIHKhvu6nSvsrR0gfN2A9X6y
	UQ1pC9n9fMCF/B8HTbYJ0ISJQbQyr8kDJsy9rZyga5ez1Fzc7NCMbejZMntv9GNF1cRf04L3qtmhy
	XSGHidipGYh/zIRwpEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4BAr-00000009bYw-2xoG;
	Thu, 02 Oct 2025 04:44:13 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4BAo-00000009bXy-3H2i
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 04:44:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3ee18913c0so111073566b.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 21:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759380249; x=1759985049; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0fNSbqDx3tVEU1b17OFCmGZksGRf1kldhowSTR+Zaw=;
        b=fWXVpTnSwzE4NrPWZt/4phX5QGPJpFhlLa5Y2iPaKBloOLSmBy++Auoc+IG8UDDp5o
         sAetg4ZNdAxAuPKEfCVPfbxX6vc+3DJSCzlVmup71C5TXZFfmOT6YdiDCkjTJoURMCp+
         zdIcBtC0RNG0Zm2HsrfVIAV4SET7RIoYn73do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759380249; x=1759985049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0fNSbqDx3tVEU1b17OFCmGZksGRf1kldhowSTR+Zaw=;
        b=wQPvPh282nd03FXbms/XXP4kEXW/vKd3rNQ2y6KfwxK1k9KX4HImxV4ljXjxchAe3j
         U64bT6Pk2XEFu2JjBIOiLtuS5jfV6ky9aVoSbbczHzJY2oZ9eI2keneZaRv4Y6A80GOk
         N0L+EAdqVSuYnbn0A0EE9hUNj65saNwpqeffy2dwbrj5GF8Lyoay3mhBGYokT3cg8e7/
         KNFIx7C4N8s1Qi8PrlhOcYqNKE7LSm6LfKOCf0TzUEzBmNRwmVQlTyN6/hkHB7b0V521
         v6j9tGpz+1wL7vVTb2SLrVqIxiwcHcayIVEKCFP95fJkd15gKWRyR/Z4FLNR58/bKdK4
         Fbmw==
X-Forwarded-Encrypted: i=1; AJvYcCWFQELxFua9GfUbsmqZg45T+Q/gOBmMDlO2IYy78WXiju5sG61sEJi6Ve5clAE8U9ZNcFIQifsZvfNu2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwk7NVx+hMa4hD47DdFWDy7vi9/ySM4pPbjS1a+XPAAm7Ucp6s
	wekVyJj58f1uXVq6ci482D7DhAxb2Ytu44NtQ4JdXEdnWPcFVcBpil0iTfy61EkT/genvT9Jxy9
	0P/UbLaI=
X-Gm-Gg: ASbGncvq01NV/fSd5N9D0EtjdxsV0FAFoWlFPPAsYJ/mINmLHlWWF8QbZb0fr30KqFZ
	YWr2AmMHAWpkm4CFvrGYNw1XO7sQoCjzclWsoEk4uWjXOSA6axMdHDpHngh2POVWkSkeJ8krafM
	f3KE+b30STTAgPwueGQsr6a+PvmzHzZj9ufGWhFvfCLhaDNRm52xcHcHJpYYhTv8q6p2ed3r88z
	lvEVCVXUSfrQeIJ/76YVQQST8d+x8hKENjInGDqE9u6DAfjq7RJVCtfKI3QdTk+HfTYCfJvl6Ur
	qspJun1tI6xZkIU5v0L7sOakgvcLGly7nhzKsMm344yROgTQW38t7kQvsPdJ/tHwKSh9bGeEvfU
	+qdOdoZWoJwgKlo2lyaP2E5t8WbyZlyfPvbGUdyjD7wlb+bNRHEt9N7bMRe1mZMxlq8I/6Nw4L9
	iCwxDeI/6r9OMNHlCj8Ilb
X-Google-Smtp-Source: AGHT+IEWIlh2VvrKP21x5B8f2ZH2cuF05qmr9G5m5tuSr6qOzPFhoSEhdzB+O7TwsYqcZsad/nBHDA==
X-Received: by 2002:a17:907:94d3:b0:b41:660:13b8 with SMTP id a640c23a62f3a-b46e6033460mr793584366b.31.1759380248755;
        Wed, 01 Oct 2025 21:44:08 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788112bbdsm1069342a12.41.2025.10.01.21.44.05
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 21:44:07 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3e44f22f15so83999866b.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 21:44:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqycZZQg5mZo9Kmy0idL6KFrhhObeAH/3KD4WULN8yajOvUUzHZb40mzXKijOhyq1jcFoSWDy6cxZWZQ==@lists.infradead.org
X-Received: by 2002:a17:907:94d3:b0:b41:660:13b8 with SMTP id
 a640c23a62f3a-b46e6033460mr793566766b.31.1759380245436; Wed, 01 Oct 2025
 21:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com> <d482931b-1779-4b49-9fa2-1c101bdf0929@app.fastmail.com>
In-Reply-To: <d482931b-1779-4b49-9fa2-1c101bdf0929@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Oct 2025 21:43:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsMPACg__N37EL8Sh=z1wkCpj+FQKpoVPXzyiVpm1i_w@mail.gmail.com>
X-Gm-Features: AS18NWC9nGx06gJW3k-2RDQkrnMZn65NQh3fTzpBmyJVcPDayBtYzYYuTR5Us6o
Message-ID: <CAHk-=wjsMPACg__N37EL8Sh=z1wkCpj+FQKpoVPXzyiVpm1i_w@mail.gmail.com>
Subject: Re: [GIT PULL 2/5] soc: dt changes for 6.18
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_214410_829531_A857A031 
X-CRM114-Status: GOOD (  12.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 1 Oct 2025 at 15:27, Arnd Bergmann <arnd@arndb.de> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.18

Bah. I've merged this, but this causes build failures on arm64.

I only noticed after already having pushed it out.

> SeonGu Kang (1):
>       arm64: dts: axis: Add ARTPEC-8 Grizzly dts support

Doing a basic allmodconfig build, I get a

  In file included from arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts:12
  arch/arm64/boot/dts/exynos/axis/artpec8.dtsi:12:10: fatal error:
dt-bindings/clock/axis,artpec8-clk.h: No such file or directory
     12 | #include <dt-bindings/clock/axis,artpec8-clk.h>
        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

and sure enough, no such file exists. It looks like it was never added
by commit 639f8e36baf1 ("arm64: dts: exynos: axis: Add initial
ARTPEC-8 SoC support")

That commit came in through the Soc tree and in that tree it came in
through the 'samsung-dt64-6.18' branch.

Pls fix.  My arm64 tree builds otherwise, but I have to disable that
whole ARTPEC mess just to even check.

It appears that there's some serious lack of sanity checking in the
arm64 dts land. I _think_ that file ends up coming in through a
different branch, but this damn well should not have been merged AT
ALL in a branch that didn't have all the prerequisites.

Yes, this is annoying.

         Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
