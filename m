Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ACBC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhGXF4iolnruU3x+tunJyBRB7zMtzixFvmNdmOGjaqA=; b=cFX5Mhr5uylyjV
	9w0sZZedjSQNMwT+4FuoiGTE0Z8ayWA/LWpCCwyD9j4Uxu6J9GOXo537PeC4yv/sjibwLdWG3nFTm
	ZzxPaEiOvurNmUPFP012wLvJE3POFKdDpyM2RKGmeCDil5GKDisi/y0sZcgvkkspfWSsKJDG25BsT
	4o+aANMKf2S4V1qiNj+CVJIo9ZATl8rVudCagro1MT5K7m5bQ5EYITshevdAd8PIyKlWt9q7qeIO1
	mKKyJ61lAWgVoc7YM/13WKnAlKp4DP5KGzkB0fmKUHvBpR9e4LfBlW5BfEBiu+Jp5k3E3OD0WMmaP
	oLtYmJj2c52zCc3tuyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysWN-0000000DSxK-1kb9;
	Mon, 22 Apr 2024 12:11:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysWJ-0000000DStl-3KNr
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 12:11:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41a5b68ed0aso5291825e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713787897; x=1714392697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bCRnuZK0O/QOXHu1Ldkstjl1doP0jCVLWLbPZKH0WnQ=;
        b=dSDcu4+y9W+j/yQ8Ae0080rhAO5ag9JFXL0bHh/7blrGEZFzXoM87uGDtS6OqIj7T9
         IU3oPlY6kRN5vUgFag7AnHVPLlb1Bnm0njgPsKtBQHdGJ2ZsTL3qsqDQgr6zHrMzbApo
         uT4bgNOIDOU9dlDoiJCtGA2m2uRMi8AI/m04d8NhxIC3BqV1kHD0GmZpNnrZQtpL69Ks
         AOJ+BmlQ/OceCIdep+9DLIoUFlDdA3bn7JtqBWzKmBM+kxWeNiT13uLd02QAycBHGs8X
         GLSYjG7GN/n8JEPRp7QM2vaNua0VJXDn4b+McRkPEhDoisg5foNjckmapedDJHgzBDbZ
         do5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713787897; x=1714392697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bCRnuZK0O/QOXHu1Ldkstjl1doP0jCVLWLbPZKH0WnQ=;
        b=Ex1JmO635c1eqv9qBNaRWXuxxIIPNJL1ZVth0xBGWLBxd02SDvSS6vMskeT4Qvk5zM
         QcuR8sJmcVtJMmBrTHD71GUr0QskaF5edy9DT4XkIzqtloh1IFRaDW6+D49PHxWlIM3h
         UWvE5dzWeLi6aN6Pjz5uNmo8rN55sSaKk7UOAfBW5gDHhBnk2dy+S3zTxoIlPxzYQsIw
         NCH+RnymTwYUiyUWQqF3k3abwhU3xhSQjH8A3j7CM39+uqGIoWV1+b9TvADmrKGMdYmQ
         TseA84M87BMrGRPIe1uv4A2cwtECuiquzMedgHmVJPuyBouoDG1F5at2FDi+xU+98+Lo
         VO8g==
X-Forwarded-Encrypted: i=1; AJvYcCUByjfMIRggtZaPsAigL/AhNZOtgPHrX5Pax3qgdbPVkcLpxbT+IMdRluQEhd68x2EhNT1EjjybGfKseobIM0iYo+cpEqp/LHKSv77ZqmLD
X-Gm-Message-State: AOJu0YwJTm4991kFhEuDNvZEXv+PR0i9omlfhN50iX+9c9mKOHxW2l16
	G+EO1GvS6/G3aHikDwtk+c5E09TtuCeGS9cBP+JejIigpXtae5shwEpy/9IR0xE=
X-Google-Smtp-Source: AGHT+IHynTNWSPs7rYJt+CqENDAY0rj5tOUJ3mwkpUrvPfTTqXCsLGZ4LMBMh1xVXt1DdTNJhAB4yQ==
X-Received: by 2002:a05:600c:3552:b0:419:7fd:2fbe with SMTP id i18-20020a05600c355200b0041907fd2fbemr5536580wmq.11.1713787897251;
        Mon, 22 Apr 2024 05:11:37 -0700 (PDT)
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr. [83.193.250.196])
        by smtp.gmail.com with ESMTPSA id r14-20020a05600c458e00b00417e5b71188sm16503881wmo.34.2024.04.22.05.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 05:11:36 -0700 (PDT)
Message-ID: <fb942d49-1c72-40a6-8309-ef3331d8f8dc@linaro.org>
Date: Mon, 22 Apr 2024 14:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/15] arch: make execmem setup available regardless of
 CONFIG_MODULES
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
References: <20240422094436.3625171-1-rppt@kernel.org>
 <20240422094436.3625171-12-rppt@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240422094436.3625171-12-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_051139_892668_7CA952F5 
X-CRM114-Status: GOOD (  10.97  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjIvNC8yNCAxMTo0NCwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBGcm9tOiAiTWlrZSBSYXBv
cG9ydCAoSUJNKSIgPHJwcHRAa2VybmVsLm9yZz4KPiAKPiBleGVjbWVtIGRvZXMgbm90IGRlcGVu
ZCBvbiBtb2R1bGVzLCBvbiB0aGUgY29udHJhcnkgbW9kdWxlcyB1c2UKPiBleGVjbWVtLgo+IAo+
IFRvIG1ha2UgZXhlY21lbSBhdmFpbGFibGUgd2hlbiBDT05GSUdfTU9EVUxFUz1uLCBmb3IgaW5z
dGFuY2UgZm9yCj4ga3Byb2Jlcywgc3BsaXQgZXhlY21lbV9wYXJhbXMgaW5pdGlhbGl6YXRpb24g
b3V0IGZyb20KPiBhcmNoLyova2VybmVsL21vZHVsZS5jIGFuZCBjb21waWxlIGl0IHdoZW4gQ09O
RklHX0VYRUNNRU09eQo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgKElCTSkgPHJw
cHRAa2VybmVsLm9yZz4KPiAtLS0KPiAgIGFyY2gvYXJtL2tlcm5lbC9tb2R1bGUuYyAgICAgICB8
ICA0MyAtLS0tLS0tLS0tCj4gICBhcmNoL2FybS9tbS9pbml0LmMgICAgICAgICAgICAgfCAgNDUg
KysrKysrKysrKysKPiAgIGFyY2gvYXJtNjQva2VybmVsL21vZHVsZS5jICAgICB8IDE0MCAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGFyY2gvYXJtNjQvbW0vaW5pdC5jICAg
ICAgICAgICB8IDE0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIGFyY2gv
bG9vbmdhcmNoL2tlcm5lbC9tb2R1bGUuYyB8ICAxOSAtLS0tLQo+ICAgYXJjaC9sb29uZ2FyY2gv
bW0vaW5pdC5jICAgICAgIHwgIDIxICsrKysrCj4gICBhcmNoL21pcHMva2VybmVsL21vZHVsZS5j
ICAgICAgfCAgMjIgLS0tLS0tCj4gICBhcmNoL21pcHMvbW0vaW5pdC5jICAgICAgICAgICAgfCAg
MjMgKysrKysrCj4gICBhcmNoL25pb3MyL2tlcm5lbC9tb2R1bGUuYyAgICAgfCAgMjAgLS0tLS0K
PiAgIGFyY2gvbmlvczIvbW0vaW5pdC5jICAgICAgICAgICB8ICAyMSArKysrKwo+ICAgYXJjaC9w
YXJpc2Mva2VybmVsL21vZHVsZS5jICAgIHwgIDIwIC0tLS0tCj4gICBhcmNoL3BhcmlzYy9tbS9p
bml0LmMgICAgICAgICAgfCAgMjMgKysrKystCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL21vZHVs
ZS5jICAgfCAgNjMgLS0tLS0tLS0tLS0tLS0tCj4gICBhcmNoL3Bvd2VycGMvbW0vbWVtLmMgICAg
ICAgICAgfCAgNjQgKysrKysrKysrKysrKysrCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUu
YyAgICAgfCAgNDQgLS0tLS0tLS0tLS0KPiAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAg
ICB8ICA0NSArKysrKysrKysrKwo+ICAgYXJjaC9zMzkwL2tlcm5lbC9tb2R1bGUuYyAgICAgIHwg
IDI3IC0tLS0tLS0KPiAgIGFyY2gvczM5MC9tbS9pbml0LmMgICAgICAgICAgICB8ICAzMCArKysr
KysrCj4gICBhcmNoL3NwYXJjL2tlcm5lbC9tb2R1bGUuYyAgICAgfCAgMTkgLS0tLS0KPiAgIGFy
Y2gvc3BhcmMvbW0vTWFrZWZpbGUgICAgICAgICB8ICAgMiArCj4gICBhcmNoL3NwYXJjL21tL2V4
ZWNtZW0uYyAgICAgICAgfCAgMjEgKysrKysKPiAgIGFyY2gveDg2L2tlcm5lbC9tb2R1bGUuYyAg
ICAgICB8ICAyNyAtLS0tLS0tCj4gICBhcmNoL3g4Ni9tbS9pbml0LmMgICAgICAgICAgICAgfCAg
MjkgKysrKysrKwo+ICAgMjMgZmlsZXMgY2hhbmdlZCwgNDYzIGluc2VydGlvbnMoKyksIDQ0NSBk
ZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3NwYXJjL21tL2V4ZWNtZW0u
YwoKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9y
Zz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
