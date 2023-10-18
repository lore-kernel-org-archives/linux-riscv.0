Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D54CDB483
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmXWDr71ZzxpkbtrM/Xghr4g+FFBzznxnz+BlmvdSCQ=; b=LdbaEhrZhmb9R4
	ZQVMs5bqV4iiv4yurR8LBVnAQfMwa62sLION7I/HD8IT+9m5V63pnJ4TW2ptPAKoy2+pbDAnckcB8
	5yK8rLAGvsujX+mJ+oBfmeC+IbVJY8SNCrwXFTuzWongsj6t2PB2SjOK2OkFOmZtAP3C03EcaJ30P
	xAi+3Yle9X0Uo0FyeQHbNAh1XZLl5oeW61y8RyBiRay8nEah1BxQFFQMwgY4NTlceV/sMVPziYrXF
	5wEXc0ytrtSEL2hvbWGuxsa27fQO0V7S5Hi82A6R4/jcLt/jZ9BDykC/RMztQ5e3j+poeq1ZiRbmL
	GIpkSI/ieeMdvFQxHG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAMQ-00FJz0-2L;
	Wed, 18 Oct 2023 17:29:34 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAMM-00FJvw-2G
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:29:32 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c50906f941so81119111fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650169; x=1698254969; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GJ2P2CnTobBA/8z5Cm8CPIZTuVTwbVlOW0vmiISWx0=;
        b=3UpMwQZgCDwjrqoiK9G8HJW9DBd4phpMRQBfGWsDqB8MZPz4QJSxp6i/5by3AZU+GE
         WZWP5sFaCA9zImZ7VguEz+HefHUAM1wDSjtrPTSnAZiySB8CY6wNPtqjWyAWasAKs/b2
         vpxjXrjm6UVA7fa2/b8Ek9BJFQuI5y4mfQpBrI3IGPE5XZK0smrHCKaA08HoBFx4PSqO
         GEWt+4Ew7zsHh/Oxjg7vLjqGjwObak/A+rT6B+smyigc0q99Yz8rowL+p5LsR8QKjzow
         gAwVHQpXDiZBJxYmTlpG0dGNSLZKauzOrse0njCtYLeFmwNeZy0WepOOzeU5GWi92tIY
         LgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650169; x=1698254969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GJ2P2CnTobBA/8z5Cm8CPIZTuVTwbVlOW0vmiISWx0=;
        b=l5fImgUe4wttzqgOjxtuo/V4XVeUe2i06XsA5ZCc7p47ZXJfkcuYJfXH9MRJtPRs4K
         O+fTUSI4xzzO680y288FwN3JmhRs9xEMrTgNlZy9yUVCYJHFLLnUNCA54tg9m5lXdBZB
         CMYuH4dGypTS8/V5Ac6VJggHy/VM2jYwPyXMYPnlo1tdgdKmzvBFRXycD4kh9/cOWiIz
         TQY3wbHVm9RWZ/uVD4X4pEte/8HQsvVJE440FN1I4F7NJI68Rkh/PWldkN/akDAJdNNT
         ywWL2JqquE4OPR7OW1JFth6gbV+RtZBrMSqJmDyf39yqVp262VMTIeJ99tzIkKkycUub
         hCVA==
X-Gm-Message-State: AOJu0YwBmdeu3YoeTnJ23wPaw0H++8nlBxcHYC+wc0VOzp6LO2L/0e55
	Ba+TaInsmjGzXZLS0mDqRNK+pVs0+jdD7rZZ+lQH9g==
X-Google-Smtp-Source: AGHT+IHCEnrOGaYL2aZ2Uu1BYAivaKmsbw0/Dl8ITo9PK6BbJM+TMe6i41oEoFMoHhyP2EZwsctqXbqrc2W0+6s62wo=
X-Received: by 2002:a2e:164e:0:b0:2bd:d34:d98a with SMTP id
 14-20020a2e164e000000b002bd0d34d98amr4364757ljw.44.1697650168802; Wed, 18 Oct
 2023 10:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-18-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-18-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:52 -0700
Message-ID: <CALs-HstTzsbtfcRdm0W+qeoN+GO1mFxOLXK_fPevO2oCUqhxnQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/19] riscv: add ISA extension parsing for Zfa
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102930_748748_BA86D0E7 
X-CRM114-Status: UNSURE (   7.42  )
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
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBZGQgcGFyc2luZyBmb3IgWmZhIElTQSBleHRlbnNp
b24gWzFdIHdoaWNoIHdlcmUgcmF0aWZpZWQgaW4gY29tbWl0Cj4gMDU2YjZmZjQ2N2M3ICgiWmZh
IGlzIHJhdGlmaWVkIikgb2YgcmlzY3YtaXNhLW1hbnVhbFsyXS4KPgo+IExpbms6IGh0dHBzOi8v
ZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMVZUNlFJZ2dwYjU5LThRUlYyNjZkRUU0VDhGWlR4R3E0
L3ZpZXcgWzFdCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51
YWwvY29tbWl0cy8wNTZiNmZmNDY3YzcgWzJdCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5A
cml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
