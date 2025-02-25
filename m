Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E57C021B8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otix1SVbaln8xB+j3WYF1UYv1bwR0cSeAoz3YXzA7Tg=; b=Lg8hR8y3wMnxDy
	8xhgdxyaYnl3Lsjh1OKvnnBahsCEJ2tbGeR95RcfFt7DB0NOeuRJ+oUPvWJSTTudyJ7RBpG2HcH3u
	VfXrf+6xJjAZreTl4EX/2ryLWMIiXAUm3vl+RYq1AT3gHVROu19HGHXzUJVLrX2aMO6kTl5iruiD8
	0r2knrjRYw7RYVQhRVFTke7mvcxwpcBIhrulmMQ80bYSoWM8FB1QhAaeaaIzjh5bNJwQe62m6y56X
	HNfoOatcWWj75lzfDAAdYNLUvgs5Zw5fLd8QsLvn+YTI0a5Obfthka3ucJFLFlIK7GMXeznqjivpP
	Jpsz5n0s/KU3wwsoa5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxx1-00000000FeQ-1ibZ;
	Tue, 25 Feb 2025 16:38:31 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmusN-0000000HMEv-0w9c
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 13:21:32 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso10039410a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 05:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740489689; x=1741094489; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQVKtrjGZwLtff10MUIe65eAbx+c/HuPXdtieDwyBWE=;
        b=MkrXG714oVFRbaTx7DyhzDcHBvt6TFMQqguC6LGuxKBf9tw+McD8x1O0E2VAt3+N2j
         OHvJEPussrkLguWeHnVrNODbfpEU1AZBDVcNkDps54Xgc+v/74RZIhLMktRnv730muIw
         oUJrpsisplvO53llpXh7dNz95iLwvn63Z3e892NBmnug5Ou4y9U6z37nsUs12ghkUtfF
         ABCqiFs0wxhNRvr+lobnVIZEWOJuMgdqbRvlt7U4aC7ASpdM33X+x273fSPer/5Xaw8e
         nDDiZ6I8htwAO0/vrnUpO5B4Ih5UzCgJO2jmpou/je6grLDAW3n5qFVUZNcmrMwKFSWy
         F8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740489689; x=1741094489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQVKtrjGZwLtff10MUIe65eAbx+c/HuPXdtieDwyBWE=;
        b=qz6/eIhfTAF6dM3fxB9cc/kHY+JJicVjzvSWN9g529HWXF9FQ2d32vjAp9vkBnCteY
         pAHwlR6FHWaAL+bSLKDDhJw2uhDqhOSKqR1649aTmLeua7P0iXKG0y6JcXCKXV8MImnn
         0M5xHXo+lCanhC1k03+fox3HFZxR0h6eTWhC8GExGsjMpS4D94+MIDQ5anVwgCdnCSQ9
         FY6wSrkt37KLK663JD7wmrkJazRmXA8X9XInPkMsuHv9mBWvLx1ITnREYzhW9DLAokCM
         byBvEPyonpALT61ER9Pf27mE74FQ6dSJVHOMz+uX76deNb0lEQXqkdpFVBBF9uC2Bu+k
         66XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyDcV/gIIN6842/BcQRQviOXQ49d6jA4qOWTbRVhHh0D59gTQIZ5efJDvu2eGJck3H5rX4oh/h7Qo8yQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+mEWzNR3fUxbspDat6vyLdfbGu/3aVgdHwG0OKFsoRNQmtH6Z
	NOMbSt2+kVXt+im8A36CQOmEckPMIzcdJJXsDjabxq+DT/s/JQIN3KvTw3Kbq3HsldQImhdisrr
	ak3FUkumIy1XbQh4TlropCmD25t28KVpKLKS5iA==
X-Gm-Gg: ASbGncvdWrczO+W2Go+cBVHvdjvAEDI0SQ5xp1Uthe1osSAKZZsduNFCpW4x7nOglGt
	j8MF1eQTnDLDmwE6fcnXoEnKuqbTwsevW1AssCyFRM1NIXMMxIxu1NI6szg++hdMAeR+m/KeXRQ
	c/BlqN1kw=
X-Google-Smtp-Source: AGHT+IHJkGd46dH3GhCaZutb0iaa6Lqsb3O4IVtqX+tibBa3OYAt9wbckem9uhCu/SR6U7PagHj5+YL5qKc1+qd4mo0=
X-Received: by 2002:a05:6402:520d:b0:5dc:7fbe:7310 with SMTP id
 4fb4d7f45d1cf-5e44448119amr3305792a12.6.1740489688864; Tue, 25 Feb 2025
 05:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250115024024.84365-1-cuiyunhui@bytedance.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 25 Feb 2025 14:21:17 +0100
X-Gm-Features: AQ5f1JrDelDcQ-WOsXduy79VlvN3oYPWPp4dCnEMKBs6m15M4RAQ60--X73WfXY
Message-ID: <CAHVXubhapunBD_+cZ=WeEp9GPJec795xOWSnMKmh_iSH09r2Yw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Enable Zicbom in usermode
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: ajones@ventanamicro.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_052131_446973_ACFD3784 
X-CRM114-Status: GOOD (  16.54  )
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

SGkgWXVuaHVpLAoKT24gV2VkLCBKYW4gMTUsIDIwMjUgYXQgMzo0MOKAr0FNIFl1bmh1aSBDdWkg
PGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IHYxL3YyOgo+IFRoZXJlIGlzIG9u
bHkgdGhlIGZpcnN0IHBhdGNoOiBSSVNDLVY6IEVuYWJsZSBjYm8uY2xlYW4vZmx1c2ggaW4gdXNl
cm1vZGUsCj4gd2hpY2ggbWFpbmx5IHJlbW92ZXMgdGhlIGVuYWJsaW5nIG9mIGNiby5pbnZhbCBp
biB1c2VyIG1vZGUuCj4KPiB2MzoKPiBBZGQgdGhlIGZ1bmN0aW9uYWxpdHkgb2YgRXhwb3NlIFpp
Y2JvbSBhbmQgc2VsZnRlc3RzIGZvciBaaWNib20uCj4KPiB2NDoKPiBNb2RpZnkgdGhlIG9yZGVy
IG9mIG1hY3JvcywgVGhlIHRlc3Rfbm9fY2JvX2ludmFsIGZ1bmN0aW9uIGlzIGFkZGVkCj4gc2Vw
YXJhdGVseS4KPgo+IHY1Ogo+IDEuIE1vZGlmeSB0aGUgb3JkZXIgb2YgUklTQ1ZfSFdQUk9CRV9L
RVlfWklDQk9NX0JMT0NLX1NJWkUgaW4gaHdwcm9iZS5yc3QKPiAyLiAiVEVTVF9OT19aSUNCT0lO
VkFMIiAtPiAiVEVTVF9OT19DQk9fSU5WQUwiCj4KPiBZdW5odWkgQ3VpICgzKToKPiAgIFJJU0Mt
VjogRW5hYmxlIGNiby5jbGVhbi9mbHVzaCBpbiB1c2VybW9kZQo+ICAgUklTQy1WOiBod3Byb2Jl
OiBFeHBvc2UgWmljYm9tIGV4dGVuc2lvbiBhbmQgaXRzIGJsb2NrIHNpemUKPiAgIFJJU0MtVjog
c2VsZnRlc3RzOiBBZGQgVEVTVF9aSUNCT00gaW50byBDQk8gdGVzdHMKPgo+ICBEb2N1bWVudGF0
aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgIHwgIDYgKysKPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od3Byb2JlLmggICAgICAgICAgICB8ICAyICstCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICAgfCAgMiArCj4gIGFyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAgfCAgOCArKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX2h3cHJvYmUuYyAgICAgICAgICAgICB8ICA2ICsrCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMgfCA2NiArKysrKysrKysrKysrKysrKy0tLS0KPiAgNiBm
aWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IC0tCj4g
Mi4zOS4yCj4KClNvIGEgdjYgbmVlZHMgdG8gYmUgc2VudCB3aXRoOgoKLSB0aGUgZml4IGZvciBo
d3Byb2JlX2V4dDBfaGFzKCkgcmVwb3J0ZWQgYnkga2VybmVsIHRlc3Qgcm9ib3QKLSBhIHJlYmFz
ZSBvbiB0b3Agb2YgNi4xNCBzaW5jZSBwYXRjaCAyIHdpbGwgY29uZmxpY3Qgd2l0aApSSVNDVl9I
V1BST0JFX0tFWV9WRU5ET1JfRVhUX1RIRUFEXzAKCkRvIHlvdSB0aGluayB5b3UgY2FuIGRvIHRo
YXQgc29vbiBzbyB0aGF0IGl0IGdldHMgbWVyZ2VkIGluIDYuMTU/IFRoZQpwYXRjaHNldCByZWNl
aXZlZCBhIGxvdCBvZiBSQiBzbyBpdCB3b3VsZCBiZSB0b28gYmFkIHRvIG1pc3MgdGhpcwpyZWxl
YXNlLgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
