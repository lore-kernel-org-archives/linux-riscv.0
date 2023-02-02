Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B6DC636D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 16:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mMUtkFyPlgavHvSjjxDOCk4S9qxz6yeUOcR1PKfEO8=; b=cSKO1vtqaxg0wK
	cxBBsBiuvvQEOE66feZr6KHUui3vPlOpjGzqY6olPkgMujUYY4eJ9vLySGmnqMXoQSPnyTQ4zabhZ
	xLodt62ll3oz5a4ck10H4Svs7ZhPRlw++1/iruN9Wt7SSRKNfejO21DE9GB92bCLlJjcTq93MDxYX
	A3SucmKJm7BH5mnT7YFK5PL4BcJf1QMj3yi1fv9ANJX3AJluroDEs5CtIH/b3obpROa8iVwrwdc0u
	ORvXkcQ9tVJTJ3QoTBNNlKeCEApUnPnHd6C9dOGBuxFIZDEO8hEPfLiCLHmnX0W9EExIgzcOq8Kts
	w6beYHnvMAdgF3ddiasg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNciy-00GhQh-9J; Thu, 02 Feb 2023 16:46:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcit-00GhOx-FI
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 16:46:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so4171548wmb.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 08:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Be6m4n2yTjxOG3cvlCymi9AVSjJxGyk5S0njtlmi7Ok=;
        b=cA0mfPHR1Xqc7an5XX9GrkCSeUT0nmi1XnDca8+0UZzJ2Aw0yyiiBYMu7rZSQ6nQmT
         pugxP8g9LCTbjZ8VXZlZ7R5eTXYNHfD23nDdHWCN+JNRV/rt+STOUL4fnIvq9Z5UkiS9
         zv1gIlR+XuaL02QSJgLFzPxtg8Iy8WRa7GMCJCggrm6RrEJ/ueNjm4++hYB9frOJjhoW
         U2ZA4Qjsy4oUrs8tgK2EefqkIpUv7B5q0ji1giOpqs8kjYfJROHm5ryzPeX1HfIcmy33
         ehY3W5VkuzEWZqk221STNsYgl9sHdhVM24j1piItHbfYJP3iIVWWl7E6ZPw5XB+Rt/Aa
         9WLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Be6m4n2yTjxOG3cvlCymi9AVSjJxGyk5S0njtlmi7Ok=;
        b=jNknzrUFcdo9Wyhfu7wd38XHDPrPpRByJLYuA6zo7J9gwBTNK6+H+3JAq1ocTfuo8L
         9Ae0B/JHO1U1ERlnRyXXwzJ3BfiUGeFTjVeB0YScmgfo/+Wo/KD2c/tvH1xcVewvmGxO
         tpnbeaIQ8i2OYgEHa0GxHdIxVWBZ7QHF6ISu29aIT1tX2qdauTyLxgoV8Mr08lGB9Aju
         rWvA/f0gve6Oq/rtNWp2HMc1uFbmfF5Qds/ztL3RSjtrq4KqdFpFggTMzagxkMqrAgLX
         Ooc/MLOeEYBoc+WGoO3qSUPLIYcyY3FXOPpJ9npB0sxMnzwbmT0/JX36rzbNMWTJG4x1
         MYWg==
X-Gm-Message-State: AO0yUKWxldc9bnKYSnS70L+PJynUceQWomg6KtbKvtuKWVTa70p48cLY
	cjgrY0AYraO7hsrMgycUDvx2+Q==
X-Google-Smtp-Source: AK7set9k2KtdeDKVcscpUyx6R5b36GQ/sv5f3qbkMR16PnZLnkTxqesp0C66to1pdh7mwuTQqWi73Q==
X-Received: by 2002:a05:600c:1c88:b0:3dc:1687:9ba2 with SMTP id k8-20020a05600c1c8800b003dc16879ba2mr6840135wms.35.1675356363119;
        Thu, 02 Feb 2023 08:46:03 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id r12-20020a05600c35cc00b003d9fba3c7a4sm5925540wmq.16.2023.02.02.08.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 08:46:02 -0800 (PST)
Message-ID: <88ddcf84-47ed-109c-5fe7-1c213abb0340@linaro.org>
Date: Thu, 2 Feb 2023 17:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH RESEND] dt-bindings: timer: sifive,clint: add comaptibles
 for T-Head's C9xx
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230202072814.319903-1-uwu@icenowy.me>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230202072814.319903-1-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_084607_532848_5F3D3F40 
X-CRM114-Status: GOOD (  10.79  )
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

T24gMDIvMDIvMjAyMyAwODoyOCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiBULUhlYWQgQzkwNi9D
OTEwIENMSU5UIGlzIG5vdCBjb21wbGlhbnQgdG8gU2lGaXZlIG9uZXMgKGFuZCBldmVuIG5vdAo+
IGNvbXBsaWFudCB0byB0aGUgbmV3Y29taW5nIEFDTElOVCBzcGVjKSBiZWNhdXNlIG9mIGxhY2sg
b2YgbXRpbWUKPiByZWdpc3Rlci4KPiAKPiBBZGQgYSBjb21wYXRpYmxlIHN0cmluZyBmb3JtYXR0
ZWQgbGlrZSB0aGUgQzl4eC1zcGVjaWZpYyBQTElDCj4gY29tcGF0aWJsZSwgYW5kIGRvIG5vdCBh
bGxvdyBhIFNpRml2ZSBvbmUgYXMgZmFsbGJhY2sgYmVjYXVzZSB0aGV5J3JlCj4gbm90IHJlYWxs
eSBjb21wbGlhbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5v
d3kubWU+Cj4gQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4KPiBSZXZpZXdlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9s
bGFuZC5vcmc+Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Cj4gLS0tCgpBcHBsaWVkLCB0aGFua3MKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3Jn
Lz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xs
b3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJv
b2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8v
d3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
