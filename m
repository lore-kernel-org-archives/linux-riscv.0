Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED75FC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+kvr/rErDqhReWBpgM6hlYHisj4gCZQm1PqKyZa1BE=; b=BREUcMo4im30B5
	w43wBPa5T5YeB9+znvfCaQAsKqfDHjbOZoUjBBySRN7j/4fekEk9uXgXIr8IAXgXVzh3+zKGSlIRX
	/98KKkAGJDRpzO1wkhfy4kmb4il/e4akyf5JOjeqJxN3Li7C8tmwbLOe0s5BqQ0EfXMtcrRI4DVW/
	92UgPt8A2SsQTPAWCu9YyXUUa2g2qH2HZuVGD5mSABxAGzrLLIXGVDZURC66QskVPCZO7CmXwQE69
	ovoUDmGeT4f2UXEfCG0saNNGs1N6wG8upObDBJSAh8YQfwHJZcA8KzJgDSWyx6zuyU7fVMwnqQpbZ
	BzRV6/3ajAuWX9JhSByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSdI-00000002agt-2DLi;
	Thu, 18 Apr 2024 14:21:00 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSdB-00000002adi-3zTy
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 14:20:58 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9983F3F36F
	for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 14:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713450050;
	bh=6MdH0R6Fh42BcaDDw8FV00JACUmgNVaSlcHYQMVpZWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=WEIKKOSu1+MwYoMjZOWRD4x+duXMAFqVILOLYk29Tr+TCLgXYQTMzTitMkmo3RKYk
	 wjEvg1Dp4CrVZ8mTfnxU3US9DImNoTAuWS+2gYOLQsSyViviDMHxY1vsg+6Jvf0gIP
	 NU6C3gC8sUXwGUPA4lidCn8rxtFVpzQKhfmPKEF12R9OOU9f6ZDyAQbAe/4QibIj+n
	 8EK9u0GfX9FAhzvJ8djkW1k65UuXcQn2N5CtWlwXEpLn+3SmW6pq2XjA1pwLGNiocM
	 BINC8VNhFSEwkuOvqTbe6JRjmFcXriSorCT/cqAkQ/LJXjgzxHymSngnvbNClofG8O
	 AB3ScdT0mmvcQ==
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5191e10d10bso749926e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 07:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713450050; x=1714054850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MdH0R6Fh42BcaDDw8FV00JACUmgNVaSlcHYQMVpZWk=;
        b=mOWzR/YF6KNt6ABjYo0HFm08ccAJ55Pb6eWw4XpWFWYuJl2q3RZcM4Ept4JXHHicOf
         8036U/Z98CnHcGINn3vhMLwQX+M/toQBeqBBxRZcgacWjPEeyMWRltPBQRWc5Vll7CC8
         F1bl19KufhO2IvNn3r/9FjyfMcAfROTrCNu5kYtDWp4mx+gufsCzqnT/XXGofvvxv2Qe
         WWsYOKQz2eL7Jkk52tRf6kAN9uTDdeGYMutm8C9jKo9iYZUhgCy+MIkPX98IU/bSgWWj
         mSbo2S35Lfk1KpxA5f/05bhmNgLuGroJniOPkqvuhtYXKcfMaq8Z4J5311aAB7QuFgaM
         sGEA==
X-Forwarded-Encrypted: i=1; AJvYcCXkg9+0XSueZfaTK4Ya4WXjK4gYRIDaUsBUvytP247/cxt81K6yX33OJIgIge1ejnjPsPi00PJ8d49OavI6Cnj19p1zsIMOepWbiwofL2Hj
X-Gm-Message-State: AOJu0YyEiEKJb3trIy0A0i8NhCyBIwtNwgyY1igaRJ7xkhXz8Kl+LVqc
	7p0dd4VgaLcjrtKNEhUdD8iLflkP1s4fuwRjWSKYp8aTLoaMTUAt/HryYLoRgjTCaBayS3mbmNB
	CKeLn2U5IbRM5hGZPpywSNkzlvSOMBnYQ8hpFl7ZiqBJMouVswfdBC3cYcKF7JPgknFx2njnpT1
	QHCKHdLeA2upRxEqOR
X-Received: by 2002:a05:600c:4e87:b0:418:d077:2cbd with SMTP id f7-20020a05600c4e8700b00418d0772cbdmr2340909wmq.40.1713450029750;
        Thu, 18 Apr 2024 07:20:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT2UI5195uUHY+LxtGsmAza41kuNxu3PsqfU28U6vm2gIhE1ZKzhOvItctvv3fW1IYrvOjmg==
X-Received: by 2002:a05:600c:4e87:b0:418:d077:2cbd with SMTP id f7-20020a05600c4e8700b00418d0772cbdmr2340875wmq.40.1713450029353;
        Thu, 18 Apr 2024 07:20:29 -0700 (PDT)
Received: from [192.168.123.126] (ip-062-143-245-032.um16.pools.vodafone-ip.de. [62.143.245.32])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b00416b163e52bsm6658726wmq.14.2024.04.18.07.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 07:20:28 -0700 (PDT)
Message-ID: <ef065a0e-1996-4ca2-b6f0-3a152edd3540@canonical.com>
Date: Thu, 18 Apr 2024 16:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 00/20] RISC-V: ACPI: Add external interrupt
 controller support
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, acpica-devel@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Anup Patel <anup@brainfault.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>,
 Robert Moore <robert.moore@intel.com>, Haibo1 Xu <haibo1.xu@intel.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Andrei Warkentin <andrei.warkentin@intel.com>, Marc Zyngier
 <maz@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
 <87a5lqsrvh.fsf@all.your.base.are.belong.to.us>
 <ZiEnHtWbT04bXYmP@sunil-laptop>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <ZiEnHtWbT04bXYmP@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_072054_226977_73B003A9 
X-CRM114-Status: UNSURE (   8.68  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTguMDQuMjQgMTU6NTgsIFN1bmlsIFYgTCB3cm90ZToKPiBIaSBCasO2cm4sCj4gCj4gVGhp
cyBpcyBjb29sIS4gSSB3YXMgbm90IGF3YXJlIHRoYXQgdS1ib290IGFsc28gc3VwcG9ydHMgQUNQ
SSBvbgo+IFJJU0MtVi4gTWFueSB0aGFua3MhCj4gCj4gVGhhbmtzLAo+IFN1bmlsCgpGb3IgUklT
Qy1WIGFuZCBBUk0gd2UgaGF2ZQoKKiBwYXNzLXRocm91Z2ggZm9yIFFFTVUgQUNQSSB0YWJsZXMK
KiBwYXNzLXRocm91Z2ggZm9yIFFFTVUgU01CSU9TIHRhYmxlcwoqIGdlbmVyYXRpb24gb2YgU01C
SU9TIHRhYmxlcwoKR2VuZXJhdGlvbiBvZiBBQ1BJIHRhYmxlcyBpbiBVLUJvb3QgaGFzIHVwIG5v
dyBvbmx5IGJlZW4gaW1wbGVtZW50ZWQgZm9yIAp4ODYgYnV0IHdvdWxkIGJlIGZlYXNpYmxlIGZv
ciBSSVNDLVYgYm9hcmRzIHRvby4KCkNmLiBodHRwczovL2RvY3MudS1ib290Lm9yZy9lbi9sYXRl
c3QvYm9hcmQvZW11bGF0aW9uL2FjcGkuaHRtbAoKQmVzdCByZWdhcmRzCgpIZWlucmljaAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
