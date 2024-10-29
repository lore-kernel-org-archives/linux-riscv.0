Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA63FD5B155
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 07:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pezsg5aeJQqPXPGHsDwipLwWA7d7iBe59JP0D7ISbFg=; b=eq+02iMR1vQrhe
	LVEuZAkhK22FJCuvgQ5zPolxSG5BmyXluQo7mCfxKCdeIK57cHtgmWz9rzyC0cAeFbKurWCjeZz8F
	84295m/yPp/QgbahY6+0BeWJOj7Z5OViI9evFmshj22ll5rP+VEUH//5O7xCHqMnP9H+Vfso5pIvK
	SCu6K7DDZUnajQQahRx3zhdrFbTMm0HAIWYQJG0SXOZu81l4FOJ3FFGszrErfP29B3lmDka+FZN0T
	7vj4Ri6I475VVTg/i+KnKZGWJ5MRA3Z5K7dbCyHRyQaY858l5LEmSSjMlScJI/ZLCrVDkbpNATTzC
	wtybY/Ngn4Y06NSvRYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5h3y-0000000DamF-1mKz;
	Tue, 29 Oct 2024 07:54:50 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5h1u-0000000DaEJ-1TQf
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 07:52:43 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-288a90e4394so2510046fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730188361; x=1730793161; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rbp3tWipnS9n1DED0E9JncApTpU6NEKrzZwh6VcEEY=;
        b=QK/Yv9BCd8vbKFlBMCkzefEkKs/V0zR4stKS+073z5+eVi8QVrzxyKtV1HcQj4HkXU
         pfShNzdyxkIHQtwVgvEUAgv2PvhReeXd9VvQduE9ESAJ+G3wr6K7+M9I0GElFJmmdzCk
         mBZL1Z+Jozgt0y/nG9VGTzw5Z4Byfiz5s6peEUr3x2YmpAnv/SP+DDcZoCsqwhLERip7
         vGUSJWj+qfKCB/YSDFN1eycb2rGxRdYALAqgivpv/8HU5cBikmSTRJ/gB8rFW1111rUy
         3Nx+b/VaQ7piTcHjKBVkBwetexWMnjlP/TuaEPIZu9sir4JdJFgnjDhIlAegm5sygIoa
         ithA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730188361; x=1730793161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rbp3tWipnS9n1DED0E9JncApTpU6NEKrzZwh6VcEEY=;
        b=J3Eb+8rutBNYDOpjgAAsI8XZyotfoc0N/lj8kbG61iFju2V++MbirKJKJGozQ3wNWi
         osmNPERT8UbtkxjvaqDOcNFKlLHzVP7sC9rtikpNvNOGk4+K3afzX5EOFGVpl+Jw1Xjk
         0pBU8eJyxjzNuji9Wghihk/Czad2pTNdPYSZS+eV+ZmAonHl4fO5dj2F0aJi6mf4QRsH
         szeopo1YpYYnVkX7KBaEkWJgUCcwNM9fXUtOP8XN6wEqO1ylHmjatFhlR8LzK/IAc2Gv
         ZYnDZLb7ETSKiczhaG2ZzhvwOH4vwMTtSgXGIyWsbu8227tSautVj7tjBKWFPGSpZtl2
         sT2w==
X-Forwarded-Encrypted: i=1; AJvYcCVho7vZK9G/OLtUW1YwgK4ZQz6Hi8lY1tmOAEAQQU+IQPaADEIBwLHA99IEI6vuA65PFqbZ2If5RY1OKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDj0elEfqhi5GHiqyn9w2ME0shppqM9g5Cf4WCk4ui+WMEYoNH
	/VukiA2gwUQY3pVDPihXyILe7PCqlkGvJH6f4sIA2+w4JgPNvQPMtcErXgPWMREYEr8HJHwY5f0
	4fCXUOfNdWqVcxvj3AsEdX4esd2gGY4PUyugdiA==
X-Google-Smtp-Source: AGHT+IHcE0Z//RMNpx9Ji2VGSBbKrOfXkqpktFDkWF0oOow3SiBDbyLJpaYAaQNfcMF3HWuiO8z58Zejjdv6FocygCo=
X-Received: by 2002:a05:6870:82a1:b0:277:cc56:2300 with SMTP id
 586e51a60fabf-29051b4d708mr9099951fac.12.1730188360819; Tue, 29 Oct 2024
 00:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241028033928.223218-1-nick.hu@sifive.com> <20241028033928.223218-3-nick.hu@sifive.com>
 <5f7179ec-e4ce-4644-8a60-ce407a4d2f11@linaro.org>
In-Reply-To: <5f7179ec-e4ce-4644-8a60-ce407a4d2f11@linaro.org>
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 29 Oct 2024 15:52:30 +0800
Message-ID: <CAKddAkBRhtUhue7meUFy2ZDyERpcG4ua=Wyb0q-ZaBzmHZCD0A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/timer-riscv: Stop stimecmp
 when cpu hotplug
To: Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_005242_444599_EFFA5E5F 
X-CRM114-Status: GOOD (  18.98  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRGFuaWVsLAoKT24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgNTo0NOKAr1BNIERhbmllbCBMZXpj
YW5vCjxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDI4LzEwLzIwMjQg
MDQ6MzksIE5pY2sgSHUgd3JvdGU6Cj4gPiBTdG9wIHRoZSB0aW1lciB3aGVuIHRoZSBjcHUgaXMg
Z29pbmcgdG8gYmUgb2ZmbGluZSBvdGhlcndpc2UgdGhlCj4gPiB0aW1lciBpbnRlcnJ1cHQgbWF5
IGJlIHBlbmRpbmcgd2hpbGUgcGVyZm9ybWluZyBwb3dlci1kb3duLgo+ID4KPiA+IFN1Z2dlc3Rl
ZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiA+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDA4MjkwMzM5MDQuNDc3MjAwLTMtbmljay5odUBzaWZp
dmUuY29tL1QvI3UKPiA+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNv
bT4KPiA+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+ID4g
LS0tCj4gPiAgIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyB8IDYgKysrKysrCj4g
PiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90
aW1lci1yaXNjdi5jCj4gPiBpbmRleCA0OGNlNTBjNWY1ZTYuLjE2NmRlZTE0ZTQ2YiAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ID4gKysrIGIvZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gPiBAQCAtMTI3LDYgKzEyNywxMiBAQCBz
dGF0aWMgaW50IHJpc2N2X3RpbWVyX3N0YXJ0aW5nX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQo+ID4g
ICBzdGF0aWMgaW50IHJpc2N2X3RpbWVyX2R5aW5nX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQo+ID4g
ICB7Cj4gPiAgICAgICBkaXNhYmxlX3BlcmNwdV9pcnEocmlzY3ZfY2xvY2tfZXZlbnRfaXJxKTsK
PiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBTdG9wIHRoZSB0aW1lciB3aGVuIHRoZSBjcHUgaXMg
Z29pbmcgdG8gYmUgb2ZmbGluZSBvdGhlcndpc2UKPiA+ICsgICAgICAqIHRoZSB0aW1lciBpbnRl
cnJ1cHQgbWF5IGJlIHBlbmRpbmcgd2hpbGUgcGVyZm9ybWluZyBwb3dlci1kb3duLgo+ID4gKyAg
ICAgICovCj4gPiArICAgICByaXNjdl9jbG9ja19ldmVudF9zdG9wKCk7Cj4gPiArCj4gPiAgICAg
ICByZXR1cm4gMDsKPiA+ICAgfQo+Cj4gU2hvdWxkIGl0IG5vdCBiZSB0aGUgb3Bwb3NpdGU/Cj4K
PiBGaXJzdCBzdG9wIHRoZSBjbG9jayB3aGljaCBjbGVhcnMgdGhlIGludGVycnVwdCBhbmQgdGhl
biBkaXNhYmxlIHRoZSBpcnE/Cj4KU0lFLlNUSUUgPSAwIC0+Ck10aW1lciBpbnRlcnJ1cHQgY29t
ZXMgLT4gdHJhcCB0byBtLW1vZGUgLT4gcmFpc2UgU1RJUCAtPgpzdG9wIHRoZSBjbG9jawpJcyB0
aGUgYWJvdmUgY2FzZSB5b3UgYXJlIGNvbmNlcm5lZCBhYm91dD8KCj4KPgo+Cj4KPiAtLQo+IDxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQVJNIFNvQ3MKPgo+IEZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5j
b20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8Cj4gPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5h
cm9vcmc+IFR3aXR0ZXIgfAo+IDxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBC
bG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
