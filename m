Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785BFCD0439
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 04:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Zeq/uLYoY37HHe6aMF2EOy2fZKW8A9LCMFZ4iBkZxc=; b=Cehbg3keZ4HCu2
	VTstg4vkn+tydUoav8efa6V1Sr81BCgXEUiJZB0F1cJySnXBwwqmhCilyX0aKu/tvKg4gbhN9v1uz
	xkH/rPGBICL+t/j+7YOYOl3kUAO2Sc2pjOwYtrHz3MW4M59+Xkfe/gdN777g92DjzHpEMyzCsXWmz
	WcROdY0EP4wp+RwldNMDgsSoMeb/DkBTuO3tUunz8sfNZOojh8M9TL7HtKnn+XPV8PaVoewCRQtZF
	GdoM9K1v0DVKPiONYkynOVL7aJHQvh3sWq0mt/97a4fk2QuqkPapFZ6O8XJLnw00W8FCZjVBxGotf
	nhnAET75igTIfJL8eNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz7d-0000000CQ7z-13My;
	Tue, 06 Jan 2026 04:56:45 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz7a-0000000CQ78-1OzT
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 04:56:44 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-44ffed84cccso199930b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jan 2026 20:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767675401; x=1768280201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA+vnv3FR+Z4SF0lY1aYTXYOVt37m8c4DjPEA2hxbj8=;
        b=jn/VvSm5WWQH/5+24gHVtwYz2dt/Ezq82YxU7lU/bhTMpA1EtURZOfaaU/w0qckLGQ
         bnnba86FxEUeI1CbYt+u8NN5HKn8/Fp8SPYuJDKXnBuLE6Mm9lwEuu+KvQtfeuRCOTQB
         z7GQFXEcTklZDZGJ+bmswbGndK8CqXFPBc1EcnnR9GOcbIAJj8guKnZmHEKm4S3YZD/H
         kKtV20WLf2cTqaodkBpklIQLL/6hiLXvTtapIlF9vgyWUMwvut0/zs0IeOoZY5E6Ug2A
         HS8VbcMsHm0u56m8wj9Ws+3cTe3dMZCgZINdx8JgH39tTvVwzJ1ygm+6ERI1vvng0Na/
         pb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767675401; x=1768280201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WA+vnv3FR+Z4SF0lY1aYTXYOVt37m8c4DjPEA2hxbj8=;
        b=OC6ha1RjBwwmo9N5y7QhwnUPVG8vWgUFAtdnRvX34W4OmrgW9RceMMN9qHOf5HfhXm
         azV1tmZfnbyYdZaqdTstz/7yix1dR8WXbYGTeE8nCPnluy6fT5cbN03q6bN2iGWumIlM
         q2UCZLz20khna2A03zd4dN6/DL5ps4vcQ/g+/WSJfsmDiedcQ3/6ThCOQvn0fgFCBsur
         hvmP4cfXOtlgvW5p+1rpDCMKX/PWfi+1HbLfENoMMkzZJWm4CAL5AOLHBZ12O/smrIUo
         rm5ewVZFsN0/hQstHEzmyVifC8sCWU0aM08DdGjPSYOKMAL+L5kZZW3FFNof5vw4Weh/
         43hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDE7QeaMG1FwRzdnLgl3CeGQG82Z6Nb9ZJEPdOQGQ4EkExjW5GgT0B60w8pABu2CM4yK4bFLei+3Au7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSybxMvo4OIsvufuDQ2c+1LCMHO0YKL7BZaPZ9D78dvkVL0yiZ
	sTHk7NzDqh5d+uX5+V68QJ4gKgQtGlFsCUd6ISdqI7h3HILM+ZQF6Z1ZG9jps3EaQIC7f3G2PSe
	15O7LclwRWB2TDs9ek34D3IoepxuBrm1VVW49KmcTnw==
X-Gm-Gg: AY/fxX6uuQ04iU1H67WDFr0O/Ei6v7l+qa80NGuyheNJfiAv9rYUY1OLqJtMt9jVqmn
	IlVveGrrKAaKSV5dzJf5UPcD3jrtQWLChehKZ16uU4HdYIwaycQ8IGmC1gjMzK78XpINJgR71c1
	ltcU/BHVM3hwMd9hLdrhZuA5NHnX6k8f97NOsqxLEUvYeV1YUwkPNsQ9e4NwQJx3cqu6mLIMfPN
	RYkpQJdHV2TmHuzee1DuqWlQIp7VcUcYJdMOpZ8BHYqtKcm1cqhpj9KNF+imjA6c8CMWk/grJnm
	B4H02pdIWxKhUSNgVntAGCJkwWXPmaR5DUCBrd1nol22rc2Fvc5gwnw7Lg==
X-Google-Smtp-Source: AGHT+IFYFZIDuKpjkDS72Ef6JCpoBzzGRuIzZj1eYSMd9ZLPsEbeYPPSGa4zpnzJp7w6utOo445xI/OFNWfh52Uwiq4=
X-Received: by 2002:a05:6820:f006:b0:65d:a21:d1f9 with SMTP id
 006d021491bc7-65f4799cc06mr1525576eaf.5.1767675400701; Mon, 05 Jan 2026
 20:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20251020042457.30915-1-luxu.kernel@bytedance.com> <20251020042457.30915-5-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042457.30915-5-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jan 2026 10:26:29 +0530
X-Gm-Features: AQt7F2pAUL7KOytVD0mr7jwpoQ61NGCRNrXweF7HHu0OAcu7_RUK7gg5_B9FCMI
Message-ID: <CAAhSdy3btmd-G_335XjJ6O_+WFNyrq5wWYSEtEQHUeP1yKmLog@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] RISC-V: KVM: Allow Zalasr extensions for Guest/VM
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, atish.patra@linux.dev, 
	pbonzini@redhat.com, shuah@kernel.org, parri.andrea@gmail.com, 
	ajones@ventanamicro.com, brs@rivosinc.com, guoren@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_205642_647009_125B0BD2 
X-CRM114-Status: GOOD (  12.83  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgOTo1NeKAr0FNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IEV4dGVuZCB0aGUgS1ZNIElTQSBleHRlbnNpb24gT05FX1JF
RyBpbnRlcmZhY2UgdG8gYWxsb3cgS1ZNIHVzZXIgc3BhY2UKPiB0byBkZXRlY3QgYW5kIGVuYWJs
ZSBaYWxhc3IgZXh0ZW5zaW9ucyBmb3IgR3Vlc3QvVk0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBYdSBM
dSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02
LjIwCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCAyICsrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2t2bS5oCj4gaW5kZXggZWYyN2Q0Mjg5ZGExMS4uNGZiYzMyZWY4ODhmYSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBAQCAtMTg1LDYgKzE4NSw3IEBAIGVudW0gS1ZNX1JJU0NW
X0lTQV9FWFRfSUQgewo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWklDQ1JTRSwKPiAgICAg
ICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pBQU1PLAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRf
WkFMUlNDLAo+ICsgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkFMQVNSLAo+ICAgICAgICAgS1ZN
X1JJU0NWX0lTQV9FWFRfTUFYLAo+ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gaW5kZXggY2Nl
NmEzOGVhNTRmMi4uNmFlNWY5ODU5ZjI1YiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X29uZXJlZy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IEBAIC01
MCw2ICs1MCw3IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBsb25nIGt2bV9pc2FfZXh0X2Fycltd
ID0gewo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpBQU1PKSwKPiAgICAgICAgIEtWTV9JU0Ff
RVhUX0FSUihaQUJIQSksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkFDQVMpLAo+ICsgICAg
ICAgS1ZNX0lTQV9FWFRfQVJSKFpBTEFTUiksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkFM
UlNDKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQVdSUyksCj4gICAgICAgICBLVk1fSVNB
X0VYVF9BUlIoWkJBKSwKPiBAQCAtMTg0LDYgKzE4NSw3IEBAIHN0YXRpYyBib29sIGt2bV9yaXNj
dl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQodW5zaWduZWQgbG9uZyBleHQpCj4gICAgICAgICBj
YXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pBQU1POgo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNB
X0VYVF9aQUJIQToKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkFDQVM6Cj4gKyAg
ICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pBTEFTUjoKPiAgICAgICAgIGNhc2UgS1ZNX1JJ
U0NWX0lTQV9FWFRfWkFMUlNDOgo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQVdS
UzoKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkJBOgo+IC0tCj4gMi4yMC4xCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
