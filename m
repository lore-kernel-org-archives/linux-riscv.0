Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CDFCDB483
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dNwwo0aLXMLrApDD6IDZboHNx5qfztMaQuU/3kPeC8=; b=UHDbiWP+120wdA
	Yly110uAlNH/uKmyVxn9jfje7qyXbdTpcyLQ6N88cLGlvioZQ7ITAuNiNmhEWDAF5OiC+1FzektrL
	yt988nmXvWZrK713M979IgU69OnUkglDzWl3G6Rm3Z1pYzQvfQTW4+XqO4HO20EgkOha8afSnzlNx
	PWmvFDXH1z61Damdb8dBc4xneiDzvrTDGFlKzzY4ciSAYrKDh+kkrPsTXhZxpoS5BYfAOlobg+OhF
	iwpgO2Z4oKs8LMt5w9hgKz1PYlKOW7VtIKKLHyA1PDgMTjwGgec0cgU55IT2bAHnWWyjN/EgILrF0
	/al4KcMAHynuLivSPURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtALa-00FJZJ-2W;
	Wed, 18 Oct 2023 17:28:42 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtALY-00FJY9-07
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:28:42 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso73980741fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650118; x=1698254918; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aOTkmKT0/VEUJ6dJSIOtEOBOATm/C2zJujpXbSsYL4=;
        b=D9EGSq+xc44cio6YF2O+JjRWrhjDtUSSZa6b2nrlhX1E/FpPS91EwvoVyx+9ljvxNw
         tz65/Y2ppHzpCdxRc69hw4BqXZcBsaiM1ojv5lbGzl/SgnIQIeGVdhqPOLhBDLmAZL8k
         DxlmfWLmw98dpFc3rrbrgskKBCC59Iy2tgxapbEZJWlNEWWbXBuOIeNxvulkylmEQuLp
         R0oDPfk82rvaWb0s2obbunoG8pSCZX/+JzDE5h5ppvk/Kp8vTOdoOhxV6A2ClASsy0eA
         PBOallAC/EieyaYDu3oTLl5VFXz0xMJxrdsGsI6LNk37SDRkU7bfpcHKx6HqWAdUOuPU
         vytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650118; x=1698254918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aOTkmKT0/VEUJ6dJSIOtEOBOATm/C2zJujpXbSsYL4=;
        b=dmWXFvHMeUUHA7Kr+gUWZWzmShpMX7CNRUJDw6LR/pZLq2Tpyz2np1avCxQJwYaluu
         Blg2RgpB3NDrJ38jpBUuT4SY0/18lAYsobkTYA2sRaNkpODnMMBQtkWYXaEIqbrjK4Le
         eN5S4PGlWaQfoP8fUl079+mGzK+NlHRxSPwU+V3aXFYgD5h+pxGIbYuAVQk5rHwZickY
         AGfoHRtnV/Fyfq0rzLsRGIe6h/KEeHIN+PgWIM8hkZVjxzt4ft/VBoXMhDOBaJoZUh6D
         IZEAljRTy8eNv2Jam3IOxPhwuKJIIgS3wBFdRzzTlLUl5LIqBvypAoPXuNuwERO+Gjcd
         w2Tg==
X-Gm-Message-State: AOJu0YzhxJWtPj312jzjQxbzmzfJ0+ABaZPrkWP3psuHnciG1OpEewYP
	ZKkcLDNes8w5a0ifoKZx7rkYmeWBoOWNg7BDhU5+E79crZCIbUEN
X-Google-Smtp-Source: AGHT+IEH/Te0HHRqLHxWdsHtRpbFbaOYrfrcIubs163vkWTt94hU44lu3W5dGfsp7LfIsZLKmD3tbWcSjooB4Tzx2jI=
X-Received: by 2002:a2e:9916:0:b0:2b9:e831:f16a with SMTP id
 v22-20020a2e9916000000b002b9e831f16amr4058294lji.26.1697650118136; Wed, 18
 Oct 2023 10:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-9-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-9-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:02 -0700
Message-ID: <CALs-HsvDtceutbdNXuBKtnTTKy_qZgzjKAi-XvwbYCYoLVRTxQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/19] riscv: add ISA extension parsing for Zfh/Zfhmin
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102840_074989_13093282 
X-CRM114-Status: UNSURE (   6.58  )
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBZGQgcGFyc2luZyBmb3IgWnZmaC9aZmhtaW4gSVNB
IGV4dGVuc2lvbnNbMV0uCgpUeXBvOiBzL1p2ZmgvWmZoLy4gT3RoZXIgdGhhbiB0aGF0OgoKUmV2
aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
