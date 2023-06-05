Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673A0C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arV+WdSx/QKgnoSwS7WCz81Ci0Dc2cAeY7XC8yv1oOc=; b=FSLhdLJKkvLVjk
	S5VM4apyjTkcMv+qQv+pvJJHVF3y55WUJqrHyfGpum05iQLajuN5YgRhKl42MwWXWZP9O+egnys5x
	yyXEonIFxwg2ApIo9cELhsnZApACI2Ed/CujarGo9QLib2POAFfnOmweLX9tWdMbB6bQpD9s2tAmK
	i1J2ZLJe6bZsHLhtx223Y/uOEd3VV3JHXhddqXVbSYVIRFXNsmrJVBaDvrpYDQOu4jCrsIm9ZKyq0
	M30LXhTkncQPKl8Jj7Oti6j6tHHYa655wA6BjFjw4RUEb6vuJG77+N8jvb33qw2pIamu21bnwf0W9
	NKx08HQoYbqJYBxu6LaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q67Te-00F0gP-0u;
	Mon, 05 Jun 2023 10:30:18 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q66P9-00Epdv-26
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 09:21:40 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-75d50f25cc9so123271585a.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 02:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685956892; x=1688548892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+IJZ8YoQCXr6cLHC0VkJnXD5EBJfWNAYm1Nc1zlsBI=;
        b=BTAYJMXUpakeg2wqR2PbJdrM4ec6OtJ5U/1HJr19o0pEUWQEIP4Tv9L7fzJ5J2Sudb
         9bwDPc3+2BUEiGIPhTG9l4ryfz25gJzpN6I2JMcki+0bbIlCk0S7oKheXY4islm/qE+O
         QBAOWXiLmNGgnSj+I65n1hkHspWeIm45BF4jnuud6bV5lnELybaYnAKFEc8NdPxy6p+c
         nofG8DkpV4DD1k6nt1VEkrDO1qARjqFGkelf+K+rcoQlUn54rqnVhaeoYXJdLy/hcxL+
         3izKcS1Ze8rlZs4xiVDKhvXCwLhS2bsGc6Sco54x1HD6qlrHlzkSTXXhanJbk7zAPhsW
         x+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685956892; x=1688548892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+IJZ8YoQCXr6cLHC0VkJnXD5EBJfWNAYm1Nc1zlsBI=;
        b=BKfItB+aYtdceRvkrAlEek7sxbZkyMSA3KTsYqYAZ7zBa8XvkyVNqokxPAQ/Zfo3mS
         g32hTEL5DQCEdoc24fJHm96Vt7tVQWoabU2YWmM44Vu+zLihZ8wDSjsgObV59NQfkJwD
         og4DIvXH7jVDQvzZIJbo/ftWxgS9cUctlCicUCjBj7Yc98Q1a1jWEU/mgj7V33hPFjTl
         8evIGArd95SXv0wCoav1UUgJxwN4n3P+30GdPPyt/JQnL8jyLLF7uaN5OmlXqR6TlHDH
         Lt7aG6UwMi57OEOkoT+b/9Bq0sM8OxmDCF5/59e7YJKtB9ULYxDsEPERftyTiUhEQs0C
         LWLA==
X-Gm-Message-State: AC+VfDw1Td3MU+Y5vPWSDz3q604U4UmY1tJyMCjwPsU1KXA+s0Jb49WE
	u5ucdk4l4/BiHFwsrqMeV9MzLq/+hTGDt9WhafA=
X-Google-Smtp-Source: ACHHUZ5XhYNabc7t/Kamr9I4cIi8AJZ+CaRkBphgjejYHYhW/hMp4t/5rc+FdwjyETN6kk9ZiCkTConA+aceidP6icY=
X-Received: by 2002:a05:620a:46ac:b0:75b:23a1:8e64 with SMTP id
 bq44-20020a05620a46ac00b0075b23a18e64mr22218316qkb.53.1685956891974; Mon, 05
 Jun 2023 02:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230605015345.12801-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230605015345.12801-1-jiasheng@iscas.ac.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Jun 2023 12:20:56 +0300
Message-ID: <CAHp75VcCMf9B6Cf6PTKSxbhv7_eYVNrG7CFNXi2nN-tJ2AjdNQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: ath79: Add missing check for platform_get_irq
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_022135_715464_5E0187E3 
X-CRM114-Status: UNSURE (   9.13  )
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

T24gTW9uLCBKdW4gNSwgMjAyMyBhdCA0OjUz4oCvQU0gSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEFkZCB0aGUgbWlzc2luZyBjaGVjayBmb3IgcGxhdGZv
cm1fZ2V0X2lycSgpIGFuZCByZXR1cm4gZXJyb3IKPiBpZiBpdCBmYWlscy4KCkhlcmUgaXQgc2Vl
bXMgYmV0dGVyLCBidXQgc3RpbGwgbmVlZHMgYW4gZXhwbGFuYXRpb24gd2h5IHJldHVybmluZyBh
bgplcnJvciBpcyBub3QgYSBwcm9ibGVtIChhc3N1bWluZyBEVCBtaWdodCBoYXZlIGEgd3Jvbmcg
bnVtYmVyKS4gSS5vLncuCnlvdSBuZWVkIHRvIHByb3ZlIHRoYXQgd2l0aCBjdXJyZW50IGNvZGUg
dGhpcyBmYWlscyBpbiB0aGF0IGNhc2UKZnVydGhlci4gT3RoZXJ3aXNlIHlvdSB3aWxsIG5lZWQg
dG8gcHJvdmUgdGhhdCB0aGVyZSBtYXkgbm90IGJlIERUCndpdGggYSB3cm9uZyBudW1iZXIuCgot
LSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
