Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18839C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gxKoMYyyFKZiGKsDu8ywaRRFDbHsSUIxiHKacJOk9Y=; b=dkal5llwjtbYTt
	Zp98nqPG6Z7RTCFWRHvb5WudbCUTm7QHmFZCeL/UeBpyLWAQyEg2wipBJk3bYk+2UXRYl+bYsK6H5
	TKJ50s3BrFa3eAof/qMVI26fZp4cnBtqR9+PhXNcqpvcLYBDzfzNv90OdXA9Be3RwcIBv7nqNzOUD
	wUuGxRdx1iTPUiN0grzMJ3rNktzfxAKfRDxTNgfGResO5hQNpUt8I/REGI6mZg16ntaOE3eqQ3dPI
	QrtRqy7JQg4c3TcARYjLl7aepASJNpfC+7JWYOZ8ldB426LjlPCRRIsKa8ENKd/SVb+d3CRF9CWkO
	JCndlbWY0reuithGE3FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyI2-0000000Cz6L-1VVH;
	Thu, 10 Jul 2025 20:54:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwan-0000000Cm8C-2mbE
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 19:06:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2350fc2591dso14786905ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 12:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752174361; x=1752779161; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e4Bs08c+r7EgraX/wFYKgrJ5o20Vr66EYTsQMhmsbPA=;
        b=pSqnrjLMoy/+CKyKCxsFXM/d8NeMaX7pye4SA6R6px0hUAQy8SZQDxINfWNW6jtPZi
         FTsDWZDnVUPiknFhZU/5H9DNwTtMlBFw/ho4gCMWDz75hS9kJevS7/rl9mtN39vpJ0lI
         1QhSaQR+3L1O1pKtxB2xvEMzDxpdCJzsD+gP/9qSDJvxgMX/jCAOIWbDmFOsThBa10Ah
         SHxOd9ErYtmizpzeyLAEF0U2mOe6oSuPQ+Etblp83MP/Yb36GWZrVaS+XButWdAyXbAe
         jyGM5zidppqLtUmYbgP2J92F2wy/osuclmRtqBqT1F0q1W+fb3qvo/9yy9N1ohhWly2f
         AJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752174361; x=1752779161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4Bs08c+r7EgraX/wFYKgrJ5o20Vr66EYTsQMhmsbPA=;
        b=bdGIc90adh4GhPAiLneUcZempGPDtzmtDfe4aWgd7MaJ/JSR0iFeuITA2mH5uLquT2
         aPQTFVP03mK6iu7jEVV3SmZ26uJjN7cCVm/Bg3Oc9Cvk6L6xxuFBHX1q8rLfTRjvKgBW
         tbQYpxrPajhFNO3li2BDTqsvTgZULWMUW0cPXjvcBd52c/gnZF7ER70WOU4sdfueJyA6
         7b1SAufW+L41SFQEkKn/KL2p+3+PwJPS3MiM0P4fahRKaPjYcAYY8kkmtzKNUCpzvgwt
         +dubrbKO+s9EMJnn4pCBSUJKltd+NP1nwQzs0Iu3L9ggfj7ulwbUGTZEpWP3AFGNCQdF
         hAPg==
X-Forwarded-Encrypted: i=1; AJvYcCUrsz9qpal6fxEe3pGQ6apCu9M6lGEIOnx7SiS+z8XdF+yhdLsQzotnOGn/u8I5uig4FDgExW/7KN3lTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7eSBvqsrQ6UtlfFAlUskmS/U9pFlwsbqf0fdeBpm0SboPpv3R
	b/0GJS6MD7qIfQ1HCUvoe1NWfNEMW38WCy9ZGcqWgMjzJ2eoBo8j/atKckJsvcfNVLFRh3l/tTe
	SSjHl+Rk=
X-Gm-Gg: ASbGncsZHI/L5NFguCdMH1zKEPYM+tAKGTgtZS9+xxsStCUV5UgUONUKmi8jHo/4P/8
	beD79v5Wv8c6NrM1WfNMBImVYb5N0xfcYUVzvxpWvvuJqNo1KTlxvRx2QtwDSmdAvpunk67bFm9
	oQx2wvgQgaR+c/2hU0pIKQxsmpz9sP8uSr0axeT25WcE81e7lEznxrJhWM88qYFvvg4BU0CH1kc
	m74WH4THmLvJ7SLfGQxnTeyGjhtdB/lz/KTPP/YpESR5XlbGyusXYyca7b4nD/2Bz3kAfdtev8Z
	nnI01O9l6Or6vckoDe/AFFwy41lM+7yZSkdcFfK7a8nC/TmZ7yiWvk8NuI4V2RehW9ZBjGY6lUP
	Nld6Kw0aMdELZb/kOgvU20CmqrNk0YMM=
X-Google-Smtp-Source: AGHT+IHiJczhTVqVOf7auHiatvoRljPpL7aaauQfX/bl5Ar8cHETIAztbg45tEQ9WDevsF7Q0LmEiQ==
X-Received: by 2002:a17:902:d512:b0:236:10b1:50cb with SMTP id d9443c01a7336-23dede6f4e3mr5078865ad.26.1752174360925;
        Thu, 10 Jul 2025 12:06:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de428497fsm29834275ad.49.2025.07.10.12.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 12:06:00 -0700 (PDT)
Message-ID: <cd0d1646-0e05-4ad9-8b00-bb9506f81243@rivosinc.com>
Date: Thu, 10 Jul 2025 21:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: traps_misaligned: properly sign extend value in
 misaligned load handler
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: damien.lemoal@wdc.com, anup@brainfault.org, palmer@dabbelt.com
References: <mvmikk0goil.fsf@suse.de>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <mvmikk0goil.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_120601_934552_96EB44B0 
X-CRM114-Status: GOOD (  12.09  )
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

CgpPbiAxMC8wNy8yMDI1IDE1OjMyLCBBbmRyZWFzIFNjaHdhYiB3cm90ZToKPiBBZGQgbWlzc2lu
ZyBjYXN0IHRvIHNpZ25lZCBsb25nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgU2Nod2Fi
IDxzY2h3YWJAc3VzZS5kZT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25l
ZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4gaW5kZXggOTMwNDM5
MjRmZTZjLi5mNzYwZTRmY2MwNTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHNfbWlzYWxpZ25lZC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25l
ZC5jCj4gQEAgLTQ2MSw3ICs0NjEsNyBAQCBzdGF0aWMgaW50IGhhbmRsZV9zY2FsYXJfbWlzYWxp
Z25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICAJfQo+ICAKPiAgCWlmICghZnApCj4g
LQkJU0VUX1JEKGluc24sIHJlZ3MsIHZhbC5kYXRhX3Vsb25nIDw8IHNoaWZ0ID4+IHNoaWZ0KTsK
PiArCQlTRVRfUkQoaW5zbiwgcmVncywgKGxvbmcpKHZhbC5kYXRhX3Vsb25nIDw8IHNoaWZ0KSA+
PiBzaGlmdCk7Cj4gIAllbHNlIGlmIChsZW4gPT0gOCkKPiAgCQlzZXRfZjY0X3JkKGluc24sIHJl
Z3MsIHZhbC5kYXRhX3U2NCk7Cj4gIAllbHNlCgoKSGkgQW5kcmVhcywKCkFmdGVyIG1vZGlmeSBt
eSB0ZXN0IHRvIGNhdGNoIHNpZ24gZXh0ZW5zaW9uIHByb2JsZW1zLCBJIGNhbiBjb25maXJtIGl0
CmZpeGVzIGl0LgoKVGVzdGVkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5j
b20+CgpUaGFua3MsCgpDbMOpbWVudAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
