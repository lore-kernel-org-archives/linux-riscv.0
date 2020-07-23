Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD1EC433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 14:34:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0559120792
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 14:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UaZEpA+m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0ol5jS6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0559120792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hDTCT9Ww5LQFIG+KhZGJbLXr+rLmQHeJHPlmmnwIbaE=; b=UaZEpA+mXvgOXGAjFDzlcyEtS
	pz4IqqWRrY4Cj2mnTgyzzaiS+VKeJ19omJDDGv+xIGyGgYy2OoWuexF5kkGigKufQFCMP7sbIvkdI
	JeG0DfIX0CWaa6lY3hpX9JP+j+qvt8Y5R/meUNU57b2W28z1mnJ48+3pFitT2z8ZtnQQfpYumHR6S
	PMOgCqv5vIEEIwZChxcrilP43bJSFB8cjFu2yYXDFf7cz7ybz3IgbKJT+Ye6RFXTYPz9dNxDN5jGf
	JqeRJBvHqEb3wtv4RgbH+Nb9p4JfRQXE2xAwOerPiVlvFJmHWzpcY4w/7y6s0jjdHPpKaQdmyhtAW
	tT+o3ZABA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jycIZ-0008GH-Ed; Thu, 23 Jul 2020 14:34:15 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jycIV-0008Fh-Tx
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 14:34:12 +0000
Received: by mail-wm1-x343.google.com with SMTP id o8so5170500wmh.4
 for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2020 07:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kcqSFG3PZo/UmJ0bcT4TKemDKca3FfDpYWmqtwN5O6Y=;
 b=O0ol5jS6RjSrVoy1krIq2puUU3bM6YnORPdOjg6oRctJaAo0qeFkeEa0DAB0+6lNZt
 D/pv8cWPuoVGiMepm5YWOYf6vJ3IJ0Rx7uCD3I6Xx7ZZcO5dba/FU4i+AtVesgCFXHtU
 XouaNHnN7QkmWfaA1cqpHrJgzcBf3wE12lGni4sIdrz+b04Ooup6OXvgjBHhEzy5cRvD
 VUbncuhPdoeFml3KmjuFHH0XRWLVBqWRhV8NYbDAy22NGwjvlrlRSeK/m2ANwc+iy8Et
 ws9ngZxWZUMU/q2/XBOCg7J+COsgjJvmyxc1P8xBMyYJnAYj2ejUe1O4DO+sxNNxyUXg
 i8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kcqSFG3PZo/UmJ0bcT4TKemDKca3FfDpYWmqtwN5O6Y=;
 b=Z59jQ+n7gn4NEUIdpsVuc6tpqUqWVxTOGnaK1BAzWTjUdPIw3OTE400vOhiV4d1dsY
 zwuCyo9cS5mYu5kxrgQ+iXme+xJaeKseG4vaGST6mqtN3AUY32Abil6Jd2SMETKBYOJh
 57JpqtV5MidmcYQSf8VEaYTQIHZxtpsK3cM0+kcguw0hosPoXM+DKXdO8gNyhyYPrBJv
 Sn2u3sVjmAiMMjtT6XR0yaX7rhn3seNwP+hmTX1okm2fCMKgN8tSDu2yrlRVNaOUic9R
 otjePXHw9TlyY/gTKWUX9BQJNDRoVEp996EJgDbdbpDxsAiiVMVDNL3XoikNMorSRiYK
 4POA==
X-Gm-Message-State: AOAM5312mRainQBTaR3opnpJAyuKnmPNLfigTssKhXavYVSEysWBUziJ
 Z7tlFZcDh3uykYTN/Y1/SWN4mA==
X-Google-Smtp-Source: ABdhPJwghOiyUKMQjbCRRwM97akzde6uqm+99J0U4w+8JSZg9XFrx+PSopfmQeT7hmLALhoXOfiahA==
X-Received: by 2002:a1c:5ac3:: with SMTP id o186mr4353780wmb.39.1595514848856; 
 Thu, 23 Jul 2020 07:34:08 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:dca7:8d30:33fa:daac?
 ([2a01:e34:ed2f:f020:dca7:8d30:33fa:daac])
 by smtp.googlemail.com with ESMTPSA id b8sm3980634wrv.4.2020.07.23.07.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 07:34:08 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] clocksource/drivers: Add CLINT timer driver
To: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20200723142409.47057-1-anup.patel@wdc.com>
 <20200723142409.47057-3-anup.patel@wdc.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <d6cf82bd-70ad-19e9-36ef-35c9db92fa56@linaro.org>
Date: Thu, 23 Jul 2020 16:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723142409.47057-3-anup.patel@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_103412_015696_3E198B99 
X-CRM114-Status: GOOD (  11.05  )
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
 Emil Renner Berhing <kernel@esmil.dk>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjMvMDcvMjAyMCAxNjoyNCwgQW51cCBQYXRlbCB3cm90ZToKPiBXZSBhZGQgYSBzZXBhcmF0
ZSBDTElOVCB0aW1lciBkcml2ZXIgZm9yIExpbnV4IFJJU0MtViBNLW1vZGUgKGkuZS4KPiBSSVND
LVYgTm9NTVUga2VybmVsKS4KPiAKPiBUaGUgQ0xJTlQgTU1JTyBkZXZpY2UgcHJvdmlkZXMgdGhy
ZWUgdGhpbmdzOgo+IDEuIDY0Yml0IGZyZWUgcnVubmluZyBjb3VudGVyIHJlZ2lzdGVyCj4gMi4g
NjRiaXQgcGVyLUNQVSB0aW1lIGNvbXBhcmUgcmVnaXN0ZXJzCj4gMy4gMzJiaXQgcGVyLUNQVSBp
bnRlci1wcm9jZXNzb3IgaW50ZXJydXB0IHJlZ2lzdGVycwo+IAo+IFVubGlrZSBvdGhlciB0aW1l
ciBkZXZpY2VzLCBDTElOVCBwcm92aWRlcyBJUEkgcmVnaXN0ZXJzIGFsb25nIHdpdGgKPiB0aW1l
ciByZWdpc3RlcnMuIFRvIHVzZSBDTElOVCBJUEkgcmVnaXN0ZXJzLCB0aGUgQ0xJTlQgdGltZXIg
ZHJpdmVyCj4gcHJvdmlkZXMgSVBJIHJlbGF0ZWQgY2FsbGJhY2tzIHRvIGFyY2gvcmlzY3YuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEB3ZGMuY29tPgo+IFRlc3Rl
ZC1ieTogRW1pbCBSZW5uZXIgQmVyaGluZyA8a2VybmVsQGVzbWlsLmRrPgo+IC0tLQoKQWNrZWQt
Ynk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgoKCgotLSAKPGh0
dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9w
YWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+
IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
