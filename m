Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8082CC021B2
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iCS5UTJabZKGyme9mP2mUZK+l0C65FfFEtu0aOvHYiI=; b=I5rXpf+tdAL4wDcqKQzUtJ5fyv
	I7LjtHzsQLxx5XJTTplS52axIhEjY+MVFYboiHEoHOVIGRQUBxm0KNE0KT6Ft5DGNLnBhAIFpRwzP
	kRq/duVVRnMv/nCpKlIoJQqgn6mSrdwZR1oGOXeLOsfwPgPYvS4buxQXkMZ1n17ReOXu4Kw70FEgO
	BoNQ8+6xaJQ+POh7iUIShFadqOhT/Iy/kIEsY5yygK2MezI9SbNFlbo0ci5qvjm48VFadjmeBVAwS
	2Di9CcoGdCK/IjI4s5KIhyg/1Cho8n5WYuwDDPHdJUT/Q+kFASqZ9sUgrzVuv2zUpHM7KEl4MH9Ic
	jMLeuTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6FU-00000000xMJ-2XvE;
	Thu, 20 Feb 2025 13:05:52 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl64D-00000000u5D-23N3
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 12:54:14 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2bcca6aae0bso488726fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 04:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740056053; x=1740660853; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MH37PuNdNK/TNpbApdmC6WP6Q7SzSxWOUdbOcTxyoM=;
        b=R9pzZYd8Yy3+gFXJSyi9TDmsSj5KzHiEIWiaj5RLC7+vl2GJZQ7f32KnSwDpAad882
         7zv9dAD5NE/yAww+I6F9SmIjXYNTDjGhUHbxoT56TD+u6nyv+LOH6kIxwcbCH0s3eomV
         kzcYTMHl6Rvu7hsdF6rSyaobb2yD3JyjW55Mcko1CwyLCMTxs6JlJFHh12dtRocmlw00
         uFhaUk0e1CVNzoghn8HJCQjWq5/wr9LelDpW4NMantuWm6eTj1Tm0zarRS/DEFKh9h3n
         C5gCnEbjeffxdVy49p4OfOMMDySWEGW16/pGq4X+03HAWTQK8Qd1DZWUpSAexhjkgFTv
         T6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056053; x=1740660853;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MH37PuNdNK/TNpbApdmC6WP6Q7SzSxWOUdbOcTxyoM=;
        b=O3iipzEHsRMpKi18jHZ4j3pEcOtLh8j0v1FjY1EBEdYTx2QkjyyIidJE5v9Gddt13Z
         qgnYEXU/SKLVsGT61lQdlUsMQ3OEQCYxRk4p//RGx0QoG6J37MLeDMzuCfg03wpIPIpZ
         QCy798qYRiFucAZgDgF8GZzTwf9QCtOu8Xg1RsGK9Iv4Tc9SExxQdYidF3NgpShVzCD+
         8yxqh4vyvSODeLicZVD6b7a9097rUt8BHOU4RM3rmCV69TlBWkeqnWjorsO+jyXpzxH6
         gZe4XabcWMWpqORCEx9p/H/62ZNCOv9RdqOzsQzsgL7FN0i09Wxd5gJg+Vw+SYqyorjm
         qzVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi6koGUk6FRSQOcng3Y5J0nGnepHbORFZ9/k2zBbuSXHH/cwSOvKGjsYumwO/2ymhWkN0/6pL4auW6pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpXLx9wFXpgSzk5/iQSrfmWW5Y+xiIvFCbGVeHu1Dt3asmLaHt
	c7RMr2DjcByStlUnQ0wGbiVY09gLvdBz8pcoNAgMJqfEOoYdSp1O8VJ9H6kuvL6GrmZXE6AnqrQ
	70uPwuBhGAXwBjz8k5zh1NyW5gRI0ZGNrBy9jGA==
X-Gm-Gg: ASbGncsceUJIKs6La1cJmH7RmwIcGIdElPPX+UgdG65XJuLXsMH5c3URba0XOpDAgCE
	HflYl+JMXSdBVfDVnoqym5nw8pyWk6edFvyjL7q5/dTqAr4Lqvp24SLuDG3i8ZpbmnQTqMNtPJ2
	s=
X-Google-Smtp-Source: AGHT+IE6AHLnXcnNaoX4Nr22F0xV34Vth2voEdt9B7/95wnKbTHnVuJFPRSBTJU3K4esXEhAaDOcYDtzEfpdF78woc0=
X-Received: by 2002:a05:6871:216:b0:2b8:84d7:ddd5 with SMTP id
 586e51a60fabf-2bd104903b6mr5735450fac.39.1740056052647; Thu, 20 Feb 2025
 04:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20250201110607.34766-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250201110607.34766-1-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 20 Feb 2025 20:54:01 +0800
X-Gm-Features: AWEUYZlZmbedW8oazja7YV8FQbGYiYqk4bf7DN3jmBvkvPch_3_i3rkkftu0WUc
Message-ID: <CAEEQ3w=uYad7UAedSU4M_L277v=RQGWHpJQwOW-p7W6=hcijsQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: print hartid on bringup
To: apatel@ventanamicro.com, atishp@rivosinc.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, cuiyunhui@bytedance.com, 
	samuel.holland@sifive.com, alexghiti@rivosinc.com, jassisinghbrar@gmail.com, 
	takakura@valinux.co.jp, valentina.fernandezalanis@microchip.com, 
	ruanjinjie@huawei.com, charlie@rivosinc.com, conor.dooley@microchip.com, 
	haibo1.xu@intel.com, andybnac@gmail.com, ke.zhao@shingroup.cn, 
	tglx@linutronix.de, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_045413_525414_51973406 
X-CRM114-Status: GOOD (  13.25  )
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

SGkgQWxsLAoKR2VudGxlIHBpbmcuIEFueSBjb21tZW50cyBvbiB0aGlzIHBhdGNoPwoKT24gU2F0
LCBGZWIgMSwgMjAyNSBhdCA3OjA24oCvUE0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+IHdyb3RlOgo+Cj4gRmlybXdhcmUgcmFuZG9tbHkgcmVsZWFzZXMgY29yZXMsIHNvIENQ
VSBudW1iZXJzIGRvbid0IGxpbmVhcmx5IG1hcAo+IHRvIGhhcnRpZHMuIFdoZW4gdGhlIHN5c3Rl
bSBoYXMgYW4gZXhjZXB0aW9uLCB3ZSBjYXJlIG1vcmUgYWJvdXQgaGFydGlkcy4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9zbXAuYyAgICAgfCAyICsrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Nt
cGJvb3QuYyB8IDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
c21wLmMKPiBpbmRleCBkNThiNWU3NTEyODYuLmU2NTBkZWM0NDgxNyAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zbXAuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jCj4g
QEAgLTQ4LDYgKzQ4LDggQEAgRVhQT1JUX1NZTUJPTF9HUEwoX19jcHVpZF90b19oYXJ0aWRfbWFw
KTsKPiAgdm9pZCBfX2luaXQgc21wX3NldHVwX3Byb2Nlc3Nvcl9pZCh2b2lkKQo+ICB7Cj4gICAg
ICAgICBjcHVpZF90b19oYXJ0aWRfbWFwKDApID0gYm9vdF9jcHVfaGFydGlkOwo+ICsKPiArICAg
ICAgIHByX2luZm8oIkJvb3RpbmcgTGludXggb24gaGFydGlkICVsdVxuIiwgYm9vdF9jcHVfaGFy
dGlkKTsKPiAgfQo+Cj4gIHN0YXRpYyBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShpbnQsIGlw
aV9kdW1teV9kZXYpOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiBpbmRleCBlMzZkMjAyMDViZDcuLmJlYmEw
ZWZiMDBiOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiBAQCAtMjMxLDYgKzIzMSwxMCBAQCBhc21s
aW5rYWdlIF9fdmlzaWJsZSB2b2lkIHNtcF9jYWxsaW4odm9pZCkKPiAgICAgICAgIHJpc2N2X2lw
aV9lbmFibGUoKTsKPgo+ICAgICAgICAgbnVtYV9hZGRfY3B1KGN1cnJfY3B1aWQpOwo+ICsKPiAr
ICAgICAgIHByX2luZm8oIkNQVSV1OiBCb290ZWQgc2Vjb25kYXJ5IGhhcnRpZCAlbHVcbiIsIGN1
cnJfY3B1aWQsCj4gKyAgICAgICAgICAgICAgIGNwdWlkX3RvX2hhcnRpZF9tYXAoY3Vycl9jcHVp
ZCkpOwo+ICsKPiAgICAgICAgIHNldF9jcHVfb25saW5lKGN1cnJfY3B1aWQsIHRydWUpOwo+Cj4g
ICAgICAgICAvKgo+IC0tCj4gMi4zOS4yCj4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
