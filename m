Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078FCC5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zenq77wpXyxh1jruWUSPmeGxFdxjkPkD788z/vDVSo=; b=RLAdwoeNbk1ky2
	Pasjpv6EYqlDCUv/zsUcMxPM5Ty7BbwzrylxjDBhTa+XouVB4ag+mTA09Zls7MT2ZZkDErdISAjap
	e+jbwpdu6Tzokq8XjE4FXDUr29SRjlMbvSJX1ItyYrK2AqvkRF6WWWycPfi2/4J5qmLuNU5YrYssE
	wUXDVCZXzqAanjwsC8Xbl9fR8sDrWO9bfQZxr1PjRAh/i9kHFKJeuQkYoXD2RxQmRy66HT0St7eru
	voKGwNsML0jpruoHUJv/rzJFZQ/EB9qLA1n/4lQwMfVMin54QJokeWMczc5Ds2duF2CjrxsPazP26
	9i9DFRvSEZhvHwW59nhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjaX0-00000000YAa-24V5;
	Mon, 11 Mar 2024 07:57:10 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjaWv-00000000Y9j-3FeW;
	Mon, 11 Mar 2024 07:57:07 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso3747726276.0;
        Mon, 11 Mar 2024 00:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710143822; x=1710748622; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1GlUN2HihV5LZtSj9DtGfp1vdhPKdNbmWkJ1oSjdUk=;
        b=jzmaikkfAwN1UCK+1Krmr1olVAjHGUZK+sdY9PUPzz6OuXjJQ47vlu0lYbIXXV42Ct
         EK5R6G1VToyYLki6GlKwqlpWcSqLHNyu+CnP87tkTNRpeKHHy4wXAsqmjAzGfTumSbNc
         56OnCqMm7XDag77lrtU0CmwDmnAiKyT+DSImDQWfXKqE1EsD3ZgDI+eAol2ZT/BK4VLE
         UWK5D7R14I8FRTBfqRL1TZbkPkeqFURTt+YGdvRgjLYbD43UF5Mlcl1Lt1MZqYw1tpOL
         asnnzvG09v2Mirt/9/gOjdeG/BxKIb27RNxMafqRTU9rqkHaLfCEbK2ykzeShaTkIgQp
         reqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710143822; x=1710748622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1GlUN2HihV5LZtSj9DtGfp1vdhPKdNbmWkJ1oSjdUk=;
        b=v7S+Ne9xEBVYqLrBC8JQQtOjgAiWA33bdnozn2shMVDFUSojT3zTH0PYG5wYXl0YUA
         D4Kk6I4N2YIwpqWPtNlS9P5yDsxLqraV0MnCTkSNUVeKoh5hyljm2xpSKQdY80wmkdkw
         XK+zUxKNeu58FPEGijL2vbsQ0Dl15fN4gitsyvew2W89fXVCFwLzFQWXNZJAvtVKMGZ0
         nh64k6BbTEEM8wZxxYBry/2jNJeA5uc5Ot/txMVy9A5JWiXg+QigtLjYyvZB0wQ3tzBy
         qdXrxfVhNt1azcHAT0MW9DKlKvxfZzwts6RO1AVwa5BDNqxXXJ22T0sXhO+QJtmb1Yc7
         7WgA==
X-Forwarded-Encrypted: i=1; AJvYcCXXpuk40U+UXZIVBFJTC3d9jAUxqGK8/o9Crwp8tN+9X+w7izzat2SD6LMl0OAmPUfkom6c9FxqSaBri4WhfswiiddDCfSZ11F0HgIqXK8BZOHrYiN+k6tbXOrCmNlJ188+aXM6u4vlTKD/om2PRl1ayleMydI=
X-Gm-Message-State: AOJu0YxeV9AGnOsQBrJsTdHYKlbFE7ePw9ku8pquasZPA8igb3Nq4fVu
	65rKOfI72Wptn0QnjykgySmeoYAYf1itfiWB3KTg+PgzT2via5I029KUVmtQ9UiPcjO2GjHjHxz
	h0NFWlbIsxvpKNTtj0WFchMDbWVE=
X-Google-Smtp-Source: AGHT+IHQJ4sUl3hCowXQDe0G866xiBo0JEIoRHtVzKJEsNjcvbr/+8mWIMLpp4/LFmK4KbAnHgxImO4hBvPL4+xmG/I=
X-Received: by 2002:a05:6902:c7:b0:dd0:c2a:26f9 with SMTP id
 i7-20020a05690200c700b00dd00c2a26f9mr3178090ybs.27.1710143821857; Mon, 11 Mar
 2024 00:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240311063018.1886757-1-dqfext@gmail.com> <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Mon, 11 Mar 2024 15:56:29 +0800
Message-ID: <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_005706_382205_6C260999 
X-CRM114-Status: GOOD (  12.62  )
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

SGkgSW5vY2hpLAoKT24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgMzoxM+KAr1BNIElub2NoaSBBbWFv
dG8gPGlub2NoaWFtYUBvdXRsb29rLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAxMSwgMjAy
NCBhdCAwMjozMDoxOFBNICswODAwLCBRaW5nZmFuZyBEZW5nIHdyb3RlOgo+ID4gVC1IZWFkIEM5
MDggaGFzIHRoZSBzYW1lIElSUSBudW0gYW5kIENTUiBhcyBwcmV2aW91cyBDOXh4IGNvcmVzLCBi
dXQKPiA+IHJlcG9ydHMgbm9uLXplcm8gbWFyY2hpZCBhbmQgbWltcGlkLiBSZW1vdmUgdGhlIElE
IGNoZWNrcy4KPiA+Cj4KPiBIaSwgUWluZ2ZhbmcsCj4KPiBJSVJDLCB0aGUgZXhpc3RlZCBDOTA4
IFNvQyAoc3VjaCBhcyBLMjMwKSBoYXZlIGFuIGVhcmx5IHZlcnNpb24KPiBvZiBDOTA4IGNvcmUu
IEJ1dCBDOTA4IGNvcmUgaXRzZWxmIG1heSBzdXBwb3J0IFNzY29mcG1mLgo+IFNvIEkgZG8gbm90
IHRoaW5rIHJlbW92aW5nIHRoZSBJRCBjaGVja3MgaXMgYSBnb29kIGlkZWEuIEluc3RlYWQsCj4g
SSBzdWdnZXN0IGFkZGluZyBDUFVJRCBvZiB5b3VyIFNvQyB0byB0aGlzIGNoZWNrLgoKQXMgb2Yg
RmViIDIwMjQsIHRoZSBsYXRlc3QgQzkwOCByZXZpc2lvbiBkb2VzIG5vdCBzdXBwb3J0IFNzY29m
cG1mLgpZb3UgbWF5IEdvb2dsZSAiQzkwOFIxUzAiIHRvIHNlZSBpdHMgdXNlciBtYW51YWwuCkJ1
dCBJIHRoaW5rIHlvdSdyZSByaWdodC4gRXZlbiB0aG91Z2ggQzkwOCBkb2VzIG5vdCBoYXZlIFNz
Y29mcG1mLApULUhlYWQgbWF5IHJlbGVhc2UgbmV3IFNvQ3Mgd2hpY2ggZG8gaGF2ZSBTc2NvZnBt
ZiwgYW5kIHRoZSBjaGVjayB3aWxsCmJyZWFrLiBJIHdpbGwgc3VibWl0IGEgbmV3IHBhdGNoIHdp
dGggeW91ciBzdWdnZXN0ZWQgY2hhbmdlcy4KClJlZ2FyZHMsClFpbmdmYW5nCj4KPiBSZWdhcmRz
LAo+IElub2NoaQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
