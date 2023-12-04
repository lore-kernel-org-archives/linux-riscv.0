Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF20C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 17:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VbMrsfyO005MbZohWYtUjvBLgOq+6X/z0iU5mugVeH4=; b=qsfIkqouBiES5i
	tMzWAePqarixnkimiDKNu0wHZuxuznEx+CTFOyk0E+L3FFSM6RkDa7btZHsuDBz6Hy+tEXUCnvIdd
	XnPk6wLN7JmV7CqZp4B5Aus+dQHjLp/30lnQ1W14psB6+N5BIn3zTSQKixCYLUsed+t/YQwgTCvwA
	CJP4Aw0neGIy8zSbU4T+B8ney2HTN4FM/bCS3bT60SEmYekA9hpdmXzw/HOcGu2Q/ujpxlHxmP0ej
	czcJGDczmjpPgx0+SrwtS5LfRtp6teUvMf30ssy6d6+ZYXPPHeqxCqDKdy3c99UC47PR44ZKNpWhl
	uHsZmxC4JNPVXuxcx+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rACs8-005DAZ-1v;
	Mon, 04 Dec 2023 17:36:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rACs5-005DA9-1P
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 17:36:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c039e9719so26355605e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 09:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701711399; x=1702316199; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrH3TZ7rDJNZ1i1xkHsBwxvyHvELnk0ZpD7/x/oBw9Y=;
        b=K1RJM4gHIEL9Vc7gF1Ow6Qkod7lnDGpuzR4KFQWgK+jeTd9WGaksf6sJZ0PegxAXnY
         /8L4swYsk2YqirH0YEUebvUk/vwWozBk8ptOXgcToF7bOnzLE5MY0F8SQUSD8syjkvz4
         yK6/O1ZvBu1cMcKM9/PE+82xR9HRpOe7dcuy5fqQnRJdAaQ+kE7Znp36BzJ7WzJNVFBd
         U3lKGnaHJtCTJfQ+7NmzVITx9ugckszpsMmQVQ5xIWgwkM/r/XSP0p19LTyduwzozJmB
         PdZHHA1bDem653QYM1epA+cK/y2sH4Jas3WLdh6TuWXo4dnGVDtBzBK1DegQZ14VUQ8e
         JYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701711399; x=1702316199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrH3TZ7rDJNZ1i1xkHsBwxvyHvELnk0ZpD7/x/oBw9Y=;
        b=o2y6h/Z3U0AucwMP+7CjhUOPTN7DsUYUhCFxHs3rHbL5KO7/VzZlOpexzSBYRe7nXm
         aVhT2K3iOXbi0gNYVpasu0HJYPtzk188TFvy8zVWCTmpV8xTF/I0KlmUOLXcwIHesvDw
         GqjRfE/QcOHk7m7PacrjYkHk0mB4qmxFz1zQIlKvrj28V2w707n/Vnd8qoyNC5BrTBQh
         3PzHOAzPSF+zg+Yb/JvJZ2B5Ymzfe1BQxbCEzPfFQQoico6BIBwsWSKrdSB3FemrxWpZ
         Q7YfyaayMY15wqiLB5xMfthPl2cojjT1gJfDe5EEOVo3URjrOU49ijKs5xV4F9zwvGNr
         cL4A==
X-Gm-Message-State: AOJu0Yyyr0lWukoFBoZrhFqVFhWSLQOn71kz7gi8cC0OPBLhEBUiIzxu
	z1OnKJ1JxxLgc3B6lG3H5R/CJg==
X-Google-Smtp-Source: AGHT+IHdnEyw7hSWzDnQ6Cq7koICvW6bO2UEREv9+4lNfMkR8SUMavgu503H0yzMUvZMLsKT14gfLg==
X-Received: by 2002:a05:600c:3115:b0:40b:5e21:ec0e with SMTP id g21-20020a05600c311500b0040b5e21ec0emr2430132wmo.64.1701711399381;
        Mon, 04 Dec 2023 09:36:39 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:c831:1e47:2:5b96? ([2a05:6e02:1041:c10:c831:1e47:2:5b96])
        by smtp.googlemail.com with ESMTPSA id l27-20020a05600c1d1b00b003feae747ff2sm19560106wms.35.2023.12.04.09.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 09:36:39 -0800 (PST)
Message-ID: <518bff9d-5cf8-4211-bdfb-7d8edb80d89c@linaro.org>
Date: Mon, 4 Dec 2023 18:36:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] dt-bindings: timer: Add StarFive JH8100 clint
Content-Language: en-US
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, krzk@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, tglx@linutronix.de, conor@kernel.org,
 anup@brainfault.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 michal.simek@amd.com, michael.zhu@starfivetech.com, drew@beagleboard.org
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, leyfoon.tan@starfivetech.com,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
 <20231201121410.95298-4-jeeheng.sia@starfivetech.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231201121410.95298-4-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_093641_473790_BC3432DD 
X-CRM114-Status: UNSURE (   4.92  )
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

T24gMDEvMTIvMjAyMyAxMzoxNCwgU2lhIEplZSBIZW5nIHdyb3RlOgo+IEFkZCBjb21wYXRpYmxl
IHN0cmluZyBmb3IgdGhlIFN0YXJGaXZlIEpIODEwMCBjbGludC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBTaWEgSmVlIEhlbmcgPGplZWhlbmcuc2lhQHN0YXJmaXZldGVjaC5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IExleSBGb29uIFRhbiA8bGV5Zm9vbi50YW5Ac3RhcmZpdmV0ZWNoLmNvbT4KPiBBY2tlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAtLS0KCkFwcGxp
ZWQgMy82LCB0aGFua3MKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0
dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3
aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcv
bGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
