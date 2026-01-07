Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFB1CE9D7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 11:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHis4/udQeKjGER3XaA/v8t/Ig/LN0kr49KB0DzJkzY=; b=wticnkWbBRCBP/
	n5IkrlUITiF2+OEe5reydQvC1CbLe9WuyCKMZNYul+BXeBWeujdQwHtK10HcYNduAUKsp9ZmUkE/a
	nK6wgDLgk3bYNC97Ozsp/1rRkRK0hkuq2KIcDvkrp5zbSpeSEoG1oQVEVa7y2WsHdL+ZoYsczWFUf
	mIk/uOc9pyMslK1E1iAZqMOzj4mTKnbkYk1KDeAMT3HKxh5AxC6N+xh27Q2TkBuH64E2zxBmQC7dl
	ecNNZ5YwGBuCvrC0C+TVeDwIBKEJVFVAU4f5luLa9uWxba+6vq7QbTkU/J2B13OTVEbG/iS9UCn+7
	OI3UOO3oBgy5+41igLww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdS9q-0000000ErHv-32lp;
	Wed, 07 Jan 2026 11:56:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdS9o-0000000ErHG-27aj
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 11:56:57 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so342581966b.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 03:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767787014; x=1768391814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3j6NmbkOxjzzFr2qaFf4V0BgzMC/7MIU6dllb67uZU=;
        b=Yzl5Tom+62U19RmSoFKQiP2/YKNCogmcPmporSS3Fb2vKWzhqV63B6YPndmmdYUJpk
         jC4X89+bWklWORC5XqPfqlhb/T/J8mOR1dxcd04VTDmx8g6yN1gFmamAx5EGJ08dS8V5
         Wb4CmlhEb4QGwiu03J94t0iYR1vGKKYEHdc1a+G46OCqc76WkjTboUswZ0dTqmBtsoUY
         Y9jQNzK2GBPJMqfQffQ4ThVzOJ07c4am/7D0Na08suulOfRFEnovuHOsCjfqir7SZH4C
         BZ4Z3xnnOa4hltKF/LZGGbiNzOBCviK5ol/LiTPW57Xfg4/K3VI0ur+3Ze5CSmtie1Gr
         bYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767787014; x=1768391814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y3j6NmbkOxjzzFr2qaFf4V0BgzMC/7MIU6dllb67uZU=;
        b=ceQ69+xWgbVF240l1GL2oQwfOr1dm+IKnwPErwp6YJab/E4yG2PuVltiOYW1+m37BF
         Dp3mo5CYjOEnPZjafpASufkfSw6vZvDgtBcanB+g/EhBka53PNmSf6DitZwOvLvL1xG7
         rGV+jY+z+PFtmXFSyljQkVGW9k5KkgHB0HvcWnNNFg8ppaziKJgiNn9KPBaqdlW6TZTV
         Sp12drtJJ6QtBAn/IxMLrUMccQTfbC6DYfqSlwgkULp/qzV9iw1bBm/yOW5wETPq5aGa
         8SyMA1/YjBBCkjaXQVsYYf1WSlzRFoC5LEqOhUtWbIgMZNpZVhhZUVXXF1Bul7LAZGSS
         Hs0w==
X-Forwarded-Encrypted: i=1; AJvYcCW4GlvnyCim6VnbQtByOKobLuiGu+lMCT3uv0SykV9Ujx9bsiqucMWn9HpsPcRvvCisitrnzzE5gf7lbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvbIRBBoTicUXIuB9Dmnlav7/E+Q7KyWbFXTt6gIFSOXV8WPLN
	UJFXWIaRAWWR/ZJ4tw+n4z70ePKVgCucKRo36Lg4a1lKOClVcE2ggF0ml7atneAs8H4RWiz3SoO
	qyRWt4X5YBtB2Xby1am9ZWoeWYZrIYUw=
X-Gm-Gg: AY/fxX4JR24n/9yhRxC19xA9WqL0mCG1x7/CuCRiDTpocRqUXpoeFgXkwYDVXRW6mnM
	1QnIPFjjMTavvEoYtlFllnV+q5C9Oe8WdzA4NXuI7Dk6hoa+UK57+j5Q4AFvc1I7+MSPgkbIiJ4
	ZFdc2+DbBKe+M1wRB4ZfViuKWUcqY8SEap0d0i35gz8DkfhbVJ+2BSZBzaeyJhAclzE7efDypix
	hHTgl6EufFv/TL8T9sh25RHlVh5M43Pa17e/svqv+OlSJKNN4GSH6CAZ+Lv7kvJjv/I/uCjwhk7
	ecJWFAyiK0AqrDlQm8Bx8ISQ0w9MOdBAB+cp5+pG1u9eERjUgoMmZKvzHM6aNauQzPuZzJk=
X-Google-Smtp-Source: AGHT+IFdgkto2NXx2OqQHAkjpUMozqIt0xtQucslbY2keJuT5fOWWt5SugQXgemY3M6Xev6afByhIRQ5op624F5gwkA=
X-Received: by 2002:a17:907:9445:b0:b80:6ddc:9029 with SMTP id
 a640c23a62f3a-b8444c5a929mr277306866b.10.1767787014151; Wed, 07 Jan 2026
 03:56:54 -0800 (PST)
MIME-Version: 1.0
References: <20260107023517.46840-1-jiangfeng@kylinos.cn> <20260107023517.46840-3-jiangfeng@kylinos.cn>
In-Reply-To: <20260107023517.46840-3-jiangfeng@kylinos.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 Jan 2026 13:56:18 +0200
X-Gm-Features: AQt7F2qOQnBZSkd9cgX_wk2kL0AKUvqI2eO2q7kmnF5OM9ufuaQ0D0RqfUJ81go
Message-ID: <CAHp75VfxT+K1QRc5ayZGc4joB9vFJrk7kjQ4gAgUHOT1boFbmA@mail.gmail.com>
Subject: Re: [PATCH 2/5] lib/string_kunit: add test case for strnlen
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	kees@kernel.org, andy@kernel.org, ebiggers@kernel.org, 
	martin.petersen@oracle.com, Jason@zx2c4.com, conor.dooley@microchip.com, 
	samuel.holland@sifive.com, charlie@rivosinc.com, ajones@ventanamicro.com, 
	nathan@kernel.org, linus.walleij@linaro.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_035656_551891_97AA9D31 
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

T24gV2VkLCBKYW4gNywgMjAyNiBhdCA0OjM14oCvQU0gRmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5
bGlub3MuY24+IHdyb3RlOgo+Cj4gQWRkIGEgS1VuaXQgdGVzdCBmb3Igc3RybmxlbigpIHRvIHZl
cmlmeSBjb3JyZWN0bmVzcyBhY3Jvc3MKPiBkaWZmZXJlbnQgc3RyaW5nIGxlbmd0aHMgYW5kIG1l
bW9yeSBhbGlnbm1lbnRzLgoKU2FtZSBjb21tZW50IGFzIHBlciBwYXRjaCAxIChpdCB3b3VsZCBw
cm9iYWJseSByZXF1aXJlIHRvIGNhbGwgZm9yCmFyY2hfc3RybmxlbigpIG9yIHNvbWV0aGluZyBs
aWtlIHRoaXMpLgoKLi4uCgo+ICsgICAgICAgZm9yIChvZmZzZXQgPSAwOyBvZmZzZXQgPCAxNjsg
b2Zmc2V0KyspIHsKPiArICAgICAgICAgICAgICAgZm9yIChsZW4gPSAwOyBsZW4gPD0gMTI4OyBs
ZW4rKykgewoKWW91IHdhbnQgdG8gZGVmaW5lIHRoZXNlIHR3byBsaW1pdHMgdG8gYXZvaWQgdGhl
IHBvc3NpYmxlIGlzc3VlcyBpbgp0aGUgZnV0dXJlIGlmIHRoZSBjb2RlIGdldHMgY2hhbmdlZC4K
Cj4gKyAgICAgICB9CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
