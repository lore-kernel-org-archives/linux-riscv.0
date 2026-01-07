Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE61CD585F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QseCgthohLxctdTaPrwrZRQAXxhr0cTX3+pkbX+PhY=; b=bcsAfa/m/h+C1J
	l6qJzc5WX2Zg5gaEWusglgTM2YIEpNfqtNs2k03entHzupTRQLlxlvsLiU36OTnuRlIBKHJjq4Afv
	Z+yio0Pcy4gRH77LdnTYxz/Pjta2LjFfSLt9BZ2GXx6E+9BuK/VmQEVc+Yn9uMRQAOOeL+oXoUYam
	Fced47/UAw/fVX5m+zgz7BYNpvYyRsAas8TJVkp8t+9bh3DOP2P5kzPOlAYoOuC75qUCk1eRXBfpP
	jdF6Lo+/71YlDA+xs5yEPyo7NB5cfkbqaLDpIfmbx0YNxmEvGao8oIQ351dG3dr1egX6GmKtn7gIK
	mygBrnnWThLxa9iYZZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdS2l-0000000EqnX-3M9r;
	Wed, 07 Jan 2026 11:49:40 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdS2j-0000000EqnE-1F03
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 11:49:38 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b843e8a4fbfso177313766b.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 03:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767786575; x=1768391375; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPH2guWiAa+jcLYFfZpcSb+e1N//ctcXTjzek0dZv4s=;
        b=AdMuDRQjPbfC0wrTbeScLdijmsvf/YjL/5SavrbUbJ/ooPZTFEBiegW9L6S0KM/DAq
         jSIjYMWb7peyiwsCpf9dFwRVYwjdl3QKfsAsVsiOwHJrt5Iik2iGDbNsE9mYb4AekBdI
         ThJcjNIscYPiXsIYbFmqOZiYagny6SacI18cRp6DYgJRQL2bIpQBxAD6uFNl1a51rUKk
         7UtvfV83xnYzqKN1AdANvzKs1X5dOKlzHGo07Dqr1XLbC2G+TvRBeC7GzRzIRAT7WowL
         sAfKlZcYCKjK8C8Ib7JXCvu6SGpnNZzQrdnwxQaOxI69gek5IcZtHHLMlOJ9hapQkD31
         swgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767786575; x=1768391375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HPH2guWiAa+jcLYFfZpcSb+e1N//ctcXTjzek0dZv4s=;
        b=s0W9mU3uL1Gxss6t29LeDZEPOzrpRmn+VQlD9fyQCkGOszjj/x4+e7ZLxweNO8Mdyf
         jkQj1Uuz5WuK7WwLztx3X87W1juYv5zppXiklkip2BP5QeS+lp9F+lcjOQjH/Up3W12M
         aq6M3FYnDwD2X9871s4vTcHNfVwsRNd/tGciKuEjPHN0gvInf+fKQjwTOLfPqRj+trP9
         GAMMr+6id8PdoK8MZIcOxSbZglCKomXmp3PkDTgAbjYO9fdUtU6CVbMLwMj6X48U+SL+
         ikkngf9qpIKZ7gnWG84kyRz4di0L0qE+8wx6H1kOQuOigfGESFBPxRhHmZyjjqiHwnHF
         FiHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3TBldSe+BVTQ82GGVGXFArL3Nd6CvrMi2GCNhE94F6JKRWMUijBGQUcR6qV6rfBRYtn4KTqHeXaqZig==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUEsUENmX8ZqV1Wxt4zQO1zKft1lVZZE2/7TD5CwoboZh6X3P3
	Ogw2tHwOTzXJlzsbnZWFdTOiIEGPvtn+lqO4BAz6MI3h0V/6pJgl2wrMJn9oh8mTkp4NsaV4Qve
	0f/b0ivV1cJMosrAs6dlYX2Uf7PS2Em4=
X-Gm-Gg: AY/fxX4LBDCC326yqSqfTYcu4fIim1BWlZOoYdS7STwN7Z7NgCg35qpjtDRNBtJp2dI
	TVW2g9Gum6BKjtzoI1qtDN42aD8SzwRc3ajbv4cEAKo//MD7UwH5HJlqOvdSw0OryP0nz7iZ11y
	7UntEHwucpNwm/HNvIZwfW1ZiwFsSfuaSqari3awcUXkegH8aH90Iie44tQ2XO8GFvnKEwdyTmn
	ar+cfi8G6H+XVoL1ZWyoTWPTuv76+zb0Wbr7VjrQoLWhPebyXKW0ufN3+JHjjwtvUNzrcMkCDK+
	k3cTaYnQw6rAsQCcC6cU6MO0HV4pTMqYNXdQDkCPww+c0B6V9qpggL5EHslDC3UadHQVvgk=
X-Google-Smtp-Source: AGHT+IF0eTtEojjW317pKsViy7nHVgMW2wgHc/iJS9TlnBBJEpVv2fLQeCl2wFyqf1AwFn2vihQoXNdjYKby1QvzmuY=
X-Received: by 2002:a17:907:98d:b0:b77:1a42:d5c0 with SMTP id
 a640c23a62f3a-b844538b3e4mr237502766b.43.1767786574668; Wed, 07 Jan 2026
 03:49:34 -0800 (PST)
MIME-Version: 1.0
References: <20260107023517.46840-1-jiangfeng@kylinos.cn> <20260107023517.46840-2-jiangfeng@kylinos.cn>
In-Reply-To: <20260107023517.46840-2-jiangfeng@kylinos.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 Jan 2026 13:48:58 +0200
X-Gm-Features: AQt7F2omyxHUHHHa8EntYV0Gae54HsRPGifEgj5BFK566Dk5fjREMKueoWB4eVs
Message-ID: <CAHp75VfPTwhfzaE0j5oYGpfdYoojPxqQh0AANiW583RaoijqEQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] lib/string_kunit: add test case for strlen
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	kees@kernel.org, andy@kernel.org, ebiggers@kernel.org, 
	martin.petersen@oracle.com, Jason@zx2c4.com, conor.dooley@microchip.com, 
	samuel.holland@sifive.com, charlie@rivosinc.com, ajones@ventanamicro.com, 
	nathan@kernel.org, linus.walleij@linaro.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_034937_339681_5CC6FBC2 
X-CRM114-Status: UNSURE (   5.98  )
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

T24gV2VkLCBKYW4gNywgMjAyNiBhdCA0OjM14oCvQU0gRmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5
bGlub3MuY24+IHdyb3RlOgo+Cj4gQWRkIGEgS1VuaXQgdGVzdCBmb3Igc3RybGVuKCkgdG8gdmVy
aWZ5IGNvcnJlY3RuZXNzIGFjcm9zcwo+IGRpZmZlcmVudCBzdHJpbmcgbGVuZ3RocyBhbmQgbWVt
b3J5IGFsaWdubWVudHMuCgpJIGFzc3VtZSB5b3UgYWxzbyB3YW50ZWQgdGhlIG9wdGltaXNhdGlv
biB0ZXN0cywgaS5lLiBzb21ldGhpbmcgdGhhdApkb2VzIHJhbmRvbSBmaWxsaW5nIGFuZCBtZWFz
dXJlIHR3byBhbGdvcml0aG1zIGJ5IGV4ZWN1dGlvbiB0aW1lLgoKLS0gCldpdGggQmVzdCBSZWdh
cmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
