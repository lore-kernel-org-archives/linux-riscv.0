Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16009C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 17:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahqRvXDtjAdBcEmDxtkvpI1/LH8UCK4U6uTnIEIal5U=; b=zcskjgqzjjOMpo
	gj78Uip674JxMyUspYQ3P++DBJGoJ8rR9uHXOCDs8gzpbHkeP/MoNV0zTjO1v6RXupAQrsp2a5eNQ
	kM7vMrEskP5oVEssFaQuXxGz0uNdEs8AOaRbFU8GTlQw4E4RgbL7enRtRxHqn45/3p4yxNtldJ/4b
	sgNsDhPCoAZU5fIpnbnNODcqoe2ouc3b7rpHveW5A2Y7DRXNKIFLfqY+ct7Jrf4lc5crhUFGjF8Ue
	66onu026GnNB8IF9IUIxAT7Y30IXXgwHBcxjo5c4VE4GYefqkZAd4s2u72DkHDYznAwYAbxnKlYrx
	T/rKgIxbnXM6JhN9W/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rACwA-005Dga-37;
	Mon, 04 Dec 2023 17:40:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rACw8-005Dfh-0O
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 17:40:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40bd5eaa66eso27910045e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 09:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701711650; x=1702316450; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xx5w7dKe4Dl4/rl9aREFhjhd8NHzESAxh2sc4w+mk34=;
        b=L9tNNOc/C6ehf/HpPE+X6Tnhssmz67WJBgThZUdZU24we3kw7Kcowk37yfNgttPCvK
         W7SyQVZ9pK5CranYcxJ/rYwTvuuUMwMFW6wpdZmeZYUTrWsVAqV/o+1ADmIAArP9Be0c
         1XSF66Jyb1nDQGTMVPiQLFu70ITIuFX5XqKuJLh/nLlb/bboW6TG9548+bBOR2mF8MmD
         wvLEi/VVNK6iwffk5adVw69uFvucqAv+NvHG+oFw1+LpmKOKqzx8nLRdPx24d7u5h0/V
         FfI4F8f5sDF0QluvzqId5Px3xafBizo44/OEqufcijbFf60ltKFKSqCVsl3TyUYfJ32W
         n3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701711650; x=1702316450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xx5w7dKe4Dl4/rl9aREFhjhd8NHzESAxh2sc4w+mk34=;
        b=cGsaWXXULcYFA977I42uEihat0qMuZA0MeOTGmN8cj/MYBd/GevR+HC2AbOVbKmJRE
         9+bpgd2iwH/oyeUz5XtywocILHg1UBNS7Tz+Iyslilwz8EnyFRlM9gTgQfIifvN5hTR4
         YQbH5XrbngvuilBJrMwID7R9fGJ0Gu5gH1+AqPUrZE/dgIu+NXccdDYh028VS8nRb4gr
         l2aOQvinY9FikWbcYBvhPW7Ken94hgXHK7S5fNyLCvLwYRyoZ0HFLXUw0dGhXQIqjIhe
         BgF01oOo+r0/UofYPewYkC8ElN81/dtY3BcUs9IYnHpp9tE/r41FVn+LnwWqKE5g90w/
         1WnQ==
X-Gm-Message-State: AOJu0Yzp3h0VfbeJjIEuVmLbn0PuxiL9kpYyLgMtcbgsfSE8Laouhx6m
	c/XAy8aSTBh1awZXH/uVmwlroQ==
X-Google-Smtp-Source: AGHT+IG0WXXG+zp6A6LukU/gkAs779X82pYay35m7VtKikn6802WqVsaPGijGytYDXlL6Dip+Z4eNw==
X-Received: by 2002:a05:600c:1f91:b0:40b:5e21:ec26 with SMTP id je17-20020a05600c1f9100b0040b5e21ec26mr2866881wmb.88.1701711650095;
        Mon, 04 Dec 2023 09:40:50 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:c831:1e47:2:5b96? ([2a05:6e02:1041:c10:c831:1e47:2:5b96])
        by smtp.googlemail.com with ESMTPSA id j11-20020a05600c190b00b0040b47c69d08sm19415061wmq.18.2023.12.04.09.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 09:40:49 -0800 (PST)
Message-ID: <c6353566-5bb9-4af0-9d4a-8efab5afc86d@linaro.org>
Date: Mon, 4 Dec 2023 18:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] clocksource/timer-riscv: Add riscv_clock_shutdown
 callback
Content-Language: en-US
To: Joshua Yeong <joshua.yeong@starfivetech.com>, tglx@linutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: leyfoon.tan@starfivetech.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20231116105312.4800-1-joshua.yeong@starfivetech.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231116105312.4800-1-joshua.yeong@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_094052_176519_BEA2CE5D 
X-CRM114-Status: UNSURE (   5.34  )
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

T24gMTYvMTEvMjAyMyAxMTo1MywgSm9zaHVhIFllb25nIHdyb3RlOgo+IEFkZCBjbG9ja3NvdXJj
ZSBkZXRhY2gvc2h1dGRvd24gY2FsbGJhY2sgdG8gZGlzYWJsZSBSSVNDLVYgdGltZXIgaW50ZXJy
dXB0IHdoZW4KPiBzd2l0Y2hpbmcgb3V0IHJpc2N2IHRpbWVyIGFzIGNsb2NrIHNvdXJjZQo+IAo+
IFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBZZW9uZyA8am9zaHVhLnllb25nQHN0YXJmaXZldGVjaC5j
b20+Cj4gLS0tCgpBcHBsaWVkLCB0aGFua3MKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4g
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cg
TGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sg
fAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3
LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
