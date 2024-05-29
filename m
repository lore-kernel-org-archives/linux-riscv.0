Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7BFC27C43
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LjGkeFSzKs5Yaffwo6wRWtDDM5reXYuH0a5iGo30/0=; b=PicKNIRgG59TYS
	dIULu+jB3JRHxvk5plfADV39xPxE4bUBs4GVE/mZZIPlMFr+glBMp8hSP5TsORSoGvXsUTNKj96Bj
	cR52vq6s6/n3W9I4hVcoudkpVSly2nReVclIIqzaKjx7zQE+kL9C4nzYbYe/k47/Ny3oQDK/jeEQK
	3GdzPdeQYcR38IT11/HWKresFx7o5qNMit3a5BdgbuFZgdE8XPHCd3ETkV9bV+rMse5kTouTyXhJ3
	RevIBAHxWtArZ0seeo2W/IDmqB2cQr4J394fMmKhLoYuJ10f9qYU07RaiuZQrzjhUFmsWo639QzLj
	qYLvMOMd1AlWckkCt41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIqn-00000004AuN-1lkx;
	Wed, 29 May 2024 12:56:17 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIqi-00000004Arz-09BJ
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 12:56:14 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5785d466c82so2402273a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716987369; x=1717592169; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km2JkQ5ctJj0MJYq+rdmwY806xDsfrDcZz255+ragDo=;
        b=ctVEKtHm3fDaH7rs7thNzvJh0CDzlZGRM9IVW2fewf0T0Ncjdeh3L+iGrq38ICfCdU
         WaSA7E6hb+YnHrWL0qrncOYuyx7EuJprSADTYAuNr5dowrpvW0dbigCoA450mjCwc5eG
         mrsE3f3HBMjZNsAwxxtyJyCUhqxRBLQwrgnLZi9dV32jhErgLQ7LW11MAGZb2zQCXyMS
         HYAaXO14UgPRsA171t9xMZB+2yAsyWiY1AgEr5nNAGJLnaWgXDNg/19BzYoisA9D4Osc
         F/fTCdT5Gh//vdg7zs6OY/h4305jTwmx89ik2z2sS17DQKN9X6TonWKuOA/Bm8kh5ALh
         edHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716987369; x=1717592169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=km2JkQ5ctJj0MJYq+rdmwY806xDsfrDcZz255+ragDo=;
        b=ZTZiJN5DIqUIy9C8kQ6AHYPUTZqUCqumc1cZoTY4jeOjEuGdJi6HGEfEPVXUxNVAd3
         494PBP6FK8eTmJyMvEmWDmwhfiNCRZ8coX4BkDiiUwS9T7sBw4JhjylTrcrvOGj5gOPw
         QhZTCMgnGuQ7U3LZoa4wEmC7jyks7GESjPLtWut+SiEJvNJC2X2sGmX1LrvFzYPLtHgW
         Oc9Q+bFZGkyi0/Vwfwh/VywqtKSR2GiVJyDRhuB5r/C9nKmkzMywpc+NtBhCB+wsvJR7
         Ux1KuB9TfAECdOo0cOu+KROIUTkkFcUAo8j9CESRRsubdOGg4rNvKbTwOGi9aFzeLp1w
         6Qmw==
X-Forwarded-Encrypted: i=1; AJvYcCW4ZzxOsmkHaDyp76087lNFCcz5iK/H7uWsNP363dKjnALWSAfiMfDF5KAuTCCp4rPSCeusHrjqSqf1bluK3p2LMlQKMwlcenhCAT51+c1M
X-Gm-Message-State: AOJu0YyxvZotkBwj/iiDS+LcxKwC9vHIrOc0natL0IamnPD15EQZbSMB
	krI7p24WFgah8DrwjUo5/8B/hompBGC5QrDOeacWBjALtFPZZus1Xr6EZX7dRHyC5B5GsR9anXE
	GJhcMTX2Q8OQClUs0k2bqEL00OslVhPJw9VzAvw==
X-Google-Smtp-Source: AGHT+IH0vOZfyMkMWjnkaaZK40pKjAqSY52a2HgHvxw27fqLFne63Zuz6Oyl4uIA4uXNRiyl5WY3rMhK7Cfm5L00l5U=
X-Received: by 2002:a17:907:25ca:b0:a59:c833:d272 with SMTP id
 a640c23a62f3a-a626417a32amr1191230666b.13.1716987368948; Wed, 29 May 2024
 05:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-3-alexghiti@rivosinc.com> <ZlZurXUUUfXHZJaX@andrea> <CAHVXubj1RpN80f0vNQwFtaNKORnw2F3yzA1_0txa3A+9-usdFw@mail.gmail.com>
In-Reply-To: <CAHVXubj1RpN80f0vNQwFtaNKORnw2F3yzA1_0txa3A+9-usdFw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 29 May 2024 14:55:58 +0200
Message-ID: <CAHVXubgGQ1whBsAVbfZryqxzTu+uNaUQoAs_AUhM2ofN9h9BDA@mail.gmail.com>
Subject: Re: [PATCH 2/7] riscv: Implement cmpxchg8/16() using Zabha
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_055612_096342_C7DCE506 
X-CRM114-Status: GOOD (  14.14  )
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

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMjoyOeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyOSwgMjAyNCBhdCAxOjU0
4oCvQU0gQW5kcmVhIFBhcnJpIDxwYXJyaS5hbmRyZWFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4g
PiA+ICt6YWJoYTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgX19hc21fXyBfX3ZvbGF0aWxl
X18gKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAg
ICAgICAgICAgICBwcmVwZW5kICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAiICAgICAgIGFtb2NhcyIgY2FzX3NmeCAi
ICUwLCAlejIsICUxXG4iICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICBhcHBl
bmQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
ID4gKyAgICAgICAgICAgICA6ICIrJnIiIChyKSwgIitBIiAoKihwKSkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICA6ICJySiIgKG4pICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAg
ICA6ICJtZW1vcnkiKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+Cj4gPiBDb3VsZG4ndCBhIHBsYXRmb3JtIGhhdmUgWmFiaGEgYnV0IG5vdCBoYXZlIFph
Y2FzPyAgSSBkb24ndCBzZWUgaG93IHRoaXMKPiA+IGFzbSBnb3RvIGNvdWxkIHdvcmsgaW4gc3Vj
aCBjYXNlLCB3aGF0IGFtIEkgbWlzc2luZz8KPgo+IFphYmhhIGFtb2Nhcy5bYnxoXSBpbnN0cnVj
dGlvbnMgYXJlIG9ubHkgaW1wbGVtZW50ZWQgaWYgWmFjYXMgaXMKPiBwcmVzZW50LCBhcyB0aGUg
c3BlY2lmaWNhdGlvbiBzdGF0ZXM6ICJJZiBaYWNhcyBbMl0gZXh0ZW5zaW9uIGlzIGFsc28KPiBp
bXBsZW1lbnRlZCwgWmFiaGEgZnVydGhlciBwcm92aWRlcyB0aGUgQU1PQ0FTLltCfEhdIGluc3Ry
dWN0aW9ucy4iCj4KPiBCdXQgdGhlIGNvZGUgeW91IG1lbnRpb24gaXMgb25seSBmb3IgOCBhbmQg
MTZiaXQgb3BlcmF0aW9ucywgc28gSQo+IHRoaW5rIHdlIGFyZSBnb29kIGFueXdheT8KCkFuZCBJ
IHdhcyB3cm9uZyBsaWtlIEFuZHJlYSBub3RlZCBwcml2YXRlbHkuIFNvIEknbGwgZml4IHRoYXQg
dG9vLCB0aGFua3MhCgo+Cj4gVGhhbmtzLAo+Cj4gQWxleAo+Cj4gPgo+ID4gICBBbmRyZWEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
