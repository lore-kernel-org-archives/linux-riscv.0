Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7DFC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 09:15:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6556464F18
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 09:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6556464F18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TsMo4+E+2u1RC5eLvjjf8GzL9Sv8r78edsu/J9OpFsw=; b=V8utaTezLv+eYOJ4mD+pBuLmv
	Myziox+a5gXRftumUVVH9+Rt+gjh0GikR8etf8PrhqblPoRJZ5qCperQ3f09N70aZ+cOVDiCxy7tY
	v0XoNwJBAE1uyUeg/Dq8AVaWa2zYCVgSl093UVYzYxrD+0MIbQmlUmWWxJxPEGCilXOw422YlGof8
	4Z/bYSoO2hytYsP41Pv/Rr9ZWkt3fuaAgF4beWBe0cJNukbpmVDCDp7ptNRV1/EkLMdxNlfze655S
	eOYVb0O2cciMwbYaJ5dC0wALTj2YmALOaEirC8SF69Z2VnhBPFNBG6wfTN0grOTm7IUwI7JXvCFnH
	sN3OdYL3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMSGX-002puF-6z; Wed, 17 Mar 2021 09:14:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMSGR-002ptV-0t
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 09:14:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id g20so1021018wmk.3
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 02:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3+HI/szBQ5FOTyD8Qug4Foc8OSZhCyYiT6v5FkPNKc8=;
 b=jeHJzjXWMszguZe7MoOivSMUVkwfy3EYx2A2MqbLsl+1PdJgoyYc39we0KfZe9tKxS
 uwGsA6QFEQ7TiQt6NbHQGhxkUUgppZ2JuMnVlI4uCaBRl70txyvrEaCzfhNFgK4TEFiQ
 4Ccbhy8TcLH41EQrKS8+0/IXvGx3xYDg2X9W7kQ5Cy3J4F235hwbNN3ac6cIEVMD+oKL
 hZGoTZFsvK7FY1tNpOoyBQEY+INJv2SITH6y13iP0cxAIiayHxD4ZJePbKi5AOw1crIw
 /0cz7nCmI1Ldm4OkCutFVGSOqfGnR9TohqECuM6vK2SGyrbuKzKLiQHEmjhaKu4Z6p71
 ADUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3+HI/szBQ5FOTyD8Qug4Foc8OSZhCyYiT6v5FkPNKc8=;
 b=uV6sQVIOfeE3f70vDLtzA+Azxa5EOsEqQYcPfN4U/qJuNVd17N5UkwXdCi9Oy7nTqf
 SLJMib/595AbGMkF7k2w40oHg71CsHNcgt90UFlemSWlTFxShBQs0TEXG0ujc8Acy/Tb
 CwOnQ22bD54Uf/Xgj+OUQjHrt1pk2Kqe93unoiT1cynstWis/rdVFjV0IA4DR5WA7BEh
 H8MlDPNkRq/G3A/Rn8xDB3XK5z/cWKtquJ3qgO+swGWWdsXIjegeF4wyanPMY224DRH4
 DId/d8rT1lpoke8XRB0G8mxy03vPGFVDk58ckkCjm7/OqTfbrcU4YduC4rrwuzVOyXzx
 Gdzg==
X-Gm-Message-State: AOAM531Uwy4935RD7qGKimbJjSS6V3VUM+YA9rloV0gsoyBw+YwRcfZ2
 emjRTQ0DnAvQoSdwvmKoa1X0zrw5hYr0Vg==
X-Google-Smtp-Source: ABdhPJwV4NfelpdpRCyF9uOCtCgelxHcUPbS1hKlsP3rXiknagWHrC5091KByav6fHAr2xdUa6cLag==
X-Received: by 2002:a05:600c:4844:: with SMTP id
 j4mr2685735wmo.179.1615972489089; 
 Wed, 17 Mar 2021 02:14:49 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:94c7:f1f0:53fd:90e4?
 ([2a01:e34:ed2f:f020:94c7:f1f0:53fd:90e4])
 by smtp.googlemail.com with ESMTPSA id l4sm24546688wrt.60.2021.03.17.02.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 02:14:48 -0700 (PDT)
Subject: Re: [PATCH 1/2] csky: Enable generic clockevent broadcast
To: guoren@kernel.org, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20210307022446.63732-1-guoren@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <4e57c0f2-c718-01c1-032a-8e4934496b17@linaro.org>
Date: Wed, 17 Mar 2021 10:14:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210307022446.63732-1-guoren@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_091451_221503_D1611DC3 
X-CRM114-Status: GOOD (  10.77  )
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

T24gMDcvMDMvMjAyMSAwMzoyNCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gRnJvbTogR3Vv
IFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IAo+IFdoZW4gcGVyY3B1LXRpbWVycyBh
cmUgc3RvcHBlZCBieSBkZWVwIHBvd2VyIHNhdmluZyBtb2RlLCB3ZSBuZWVkCj4gc3lzdGVtIHRp
bWVyIGhlbHAgdG8gYnJvYWRjYXN0IElQSV9USU1FUi4KPiAKPiBUaGlzIGlzIGZpcnN0IGludHJv
ZHVjZWQgYnkgYnJva2VuIHg4NiBoYXJkd2FyZSwgd2hlcmUgdGhlIGxvY2FsIGFwaWMKPiB0aW1l
ciBzdG9wcyBpbiBDMyBzdGF0ZS4gQnV0IG1hbnkgb3RoZXIgYXJjaGl0ZWN0dXJlcyhwb3dlcnBj
LCBtaXBzLAo+IGFybSwgaGV4YWdvbiwgb3BlbnJpc2MsIHNoKSBoYXZlIHN1cHBvcnRlZCB0aGUg
aW5mcmFzdHJ1Y3R1cmUgdG8KPiBkZWFsIHdpdGggUG93ZXIgTWFuYWdlbWVudCBpc3N1ZXMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IENj
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRn
bHhAbGludXRyb25peC5kZT4KPiBDYzogRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGxp
bmFyby5vcmc+Cj4gLS0tCgpBY2tlZC1ieTogRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5v
QGxpbmFyby5vcmc+CgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0
cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdp
dHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9s
aW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
