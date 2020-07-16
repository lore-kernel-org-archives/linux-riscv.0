Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA69CC433E4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 14:06:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 532EF207BC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 14:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TZooQC8U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BPn/z1Lg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 532EF207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1nWYQ3jndo+MByuntFc+xkzVP2x9ItdZRBXwjqruq6c=; b=TZooQC8UBrRr6g761ZBHMoKGR
	3ki+yAHiXrAFEGcU4ntQk7sHGg3SHHjn6T23PO9LpFKacE1lGG6mEZYMn67HjypCJ2kvkm5ZMSd8G
	83ijDJZ4MUpkzhuWfRMKFXgEQC4zieLxmoQ3sG+bo5OS+dWW7sLrU23C6TlUZgvdknQ39odYhJrYt
	6QqI9eMP1op2Uofu8rdmgaLhp8jFZkTTuy8X4sXDB7ptwu1BFtnDxaNEsU6DOyMS1AVexHql2Spsl
	WnCqOlrxIxwRdVQHmWTfX0Gl+D3bawywsASFEZ/vtCjwoqnrzw2J66QBy5YQqOq4pCMXyrk0DH/OF
	PppfQKa1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw4WX-0000SJ-73; Thu, 16 Jul 2020 14:06:09 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw4S8-0004eg-Q7
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 14:01:37 +0000
Received: by mail-wr1-x443.google.com with SMTP id z2so7218037wrp.2
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cBgidtm3K2UC7bZZD55ufcqNRxLA7lDeHaLH7hy/Zr8=;
 b=BPn/z1Lg4Ha3YThdEhMABfg1GUZMLmrkbn22btW3YQXptrhrx2hxb6Q/uSuFdMTzhm
 pMfcXaPSnKoNCfaJg/0W2zZ5D46xvftkaMQ3RslriCnOiUWvf9G8u9VQaeZN2DCboxPU
 xAGk8J2dVTTdOI2ZEKlmdD79jH9qen6wcLfFGtJDVYCE55JHtrZnCfcfRjSeDlkP/i4O
 Pk7/81psmTfylLNQVbzi/R3250fofHM3xPxtq7Q3K3hxRB3JtaThKcgp7loQWMbSFEUR
 BMspmu4NGwWXSWAglvfwUs5AAnFJDLwYdwjfecHnoin3JHBoUCwFGbFgDj//M2iPjZ8E
 EfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cBgidtm3K2UC7bZZD55ufcqNRxLA7lDeHaLH7hy/Zr8=;
 b=F8LoFJ0dq3kUT03tTh7DbaBz2/g46XTMRbmDXVEAtrpuMtRpIf+9JruxSMSa7RKb8G
 8jzVmQIZtGdu/5K36QUw+msdMfU5BnDCwWWM5ZMuW1zz3IXToqfA4D1tUpOZyoNusZKj
 kV0FP6XTW0DBpFh6ibTbeqpfQf4QsOzyhFJzar1aJHYiG2wZbpTBOe6FyEPa/HmqsnzF
 FrjNBc92SWHAaDZCp7qdj4k3LH+bz9oEtYdFQl4aGt4VntnNhaSKYpuv7q0OuCdjImUD
 h9PiDV38jSlaunoxXM7FI/ZL5+rc4NDSKLwlJKyjst4jfMJZxegWGwK4w98dVyYfmEzt
 2MIg==
X-Gm-Message-State: AOAM531ZHsQtfFTjCxy/QCbm868j1aokeygLiWlzuUyLoiOt/FjtGatX
 g04ZoslrhiPYHwwXSsZYKtnujA==
X-Google-Smtp-Source: ABdhPJxWuTEqJ0U0mmug3AZEYrGs0qIUBJq6BWHdQAoQMxFMyqmaghCWr1vGT05W3k5rLX9Hq4gauA==
X-Received: by 2002:adf:edc6:: with SMTP id v6mr5240273wro.413.1594908093264; 
 Thu, 16 Jul 2020 07:01:33 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9880:a643:3e69:6393?
 ([2a01:e34:ed2f:f020:9880:a643:3e69:6393])
 by smtp.googlemail.com with ESMTPSA id b62sm8730073wmh.38.2020.07.16.07.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2020 07:01:32 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] dt-bindings: timer: Add CLINT bindings
To: Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>
References: <20200715071506.10994-1-anup.patel@wdc.com>
 <20200715071506.10994-5-anup.patel@wdc.com> <20200715175052.GA497000@bogus>
 <CAAhSdy04h-PD-=VhjB=5MOf=-RZMrMOcvEtbtUaDc3-kbV47BA@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <9c12dd2c-7285-5664-973e-3ec066eec0a2@linaro.org>
Date: Thu, 16 Jul 2020 16:01:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy04h-PD-=VhjB=5MOf=-RZMrMOcvEtbtUaDc3-kbV47BA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_100136_907930_DF8F9631 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CkhpIEFudXAsCgoKT24gMTYvMDcvMjAyMCAxNDozMiwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBX
ZWQsIEp1bCAxNSwgMjAyMCBhdCAxMToyMCBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
PiB3cm90ZToKClsgLi4uIF0KCj4gVGhhbmtzIGZvciB0aGVzZSBzdGVwcy4gSSB3aWxsIGZpeCBh
bmQgc2VuZCB2NC4KClBsZWFzZSB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBjbGFyaWZ5IGhvdyB5
b3Ugd2FudCB0aGUgc2VyaWVzIHRvIGJlIG1lcmdlZC4KCgotLSAKPGh0dHA6Ly93d3cubGluYXJv
Lm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoK
Rm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZh
Y2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0
cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
