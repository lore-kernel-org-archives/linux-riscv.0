Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E3AC6FD1D
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 19:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrCnNTS3kNS/1rf+wRFNFq70hCTS1hm1rY9cN4A1V30=; b=lk0bCck15v5hM1
	ft+iZBkV3wJawluMlegKnuspb0ie3pRbhIWlHlAMuc1V25PeuzAd5ib4q1Ycl4q9hit/c/8Zr9nK7
	AlmrCMtGj9tlrvmyb8Y5NQW8OGDADg3mOe+UJ5ekHMdPAUT3KuNxjRLLLLSJpe32KC99sG6lAKOK2
	ivT0EMz74BQ2yiU7/gvFBfR6E2ccAZbLmbVY1HNZ2Zqjhnkf5lK7JMb5PMgYtkuciT+EO5QGvJLD9
	wyP2bYdOB2Nwfa6R3dWdS6SaZ1kiOvsr90RiGAUjSUBuXrJA6QEzLpCJ6AVoI4EDNhtULqsTNDcZi
	rKM/VSh0tyFq38LJmkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pigo8-00BCIU-1I;
	Sat, 01 Apr 2023 19:22:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pigo4-00BCGQ-2u
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 19:22:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id j1-20020a05600c1c0100b003f04da00d07so212075wms.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Apr 2023 12:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680376950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsdIX4QaNsFy8jAUYtXLUiYq0pMM/KF7S/HscFFRFa8=;
        b=wLou/172SsZ4tbZKAmsf4wdm/jkdhPJhgp/9PODUlSx+8zj3bvceTjgZUslKBzMWw8
         dbzF5WM+xXp7t01zz37q83r+zoMvSKVW3P/J28MwkqEbL9aNMV8iCK1aq/f4+7SIi4B9
         qp2UZBwhIDmh3rDtCB63WKwzAN5BUgdGepgfYA2wOSMqur9AYXlb5tF5t3JYnBT9m+FF
         QZNbjh2HDQTcX3YBnp/khnrydEiI2K5FE2h9klkr7WGo/ExSeTZ8Jium1tK606uJuIKM
         bxjPVjsLqxf1k5WstPx4prev8VXkZHddRS3F63SKw/dTy0euJ1u4Vad24HvY2PFiL49V
         8UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680376950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsdIX4QaNsFy8jAUYtXLUiYq0pMM/KF7S/HscFFRFa8=;
        b=qduYOrmrGW/ep+v1C5LbKQPLPHUqgdpsIf/NkXwK7yWLDNEvxHv012i+GP3o63bxLx
         awCbGxdaUEb3vNkJC/kF9BZnLlTxckzwa+DJjFb8a5CUnvikV8b3NqNicT4O6adX1JUt
         Yr8X1rQ/eE8Mgt75ualR5up37W0vs0vrL5gDf84kt48hFudfw4Md4UytA/gT+nZSj+nT
         MMJBEBeHOutvQQITGUgZ5PN3HBGdnqp7iUW0Wy7xS73sq4jQPYa9vZGC4oCpc+uHNaTS
         bFp1B5kZW5VQ32ErgFgCA7EEy77Q9seTIfyOwPkeiJe2NCCWQg3q7yZ2hnNgxCEqCaeI
         se6Q==
X-Gm-Message-State: AO0yUKWnVVveeRGnuTSfWSkaCDMpivYvbTAm6u3P1g/YpD+1mMUOggAd
	jg150+MmzO1Zask8g7rbYlHOZw==
X-Google-Smtp-Source: AK7set9y5bHkZCySLIhsJfaK02RbOBp8M7OwMT91WfVTWaYaVc0pGHqd8wtNzjk/5/WSJSDGT1LTiA==
X-Received: by 2002:a7b:cd88:0:b0:3ee:7061:1bdd with SMTP id y8-20020a7bcd88000000b003ee70611bddmr22820919wmj.4.1680376950405;
        Sat, 01 Apr 2023 12:22:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id r5-20020adfe685000000b002e61e002943sm4791678wrm.116.2023.04.01.12.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 12:22:29 -0700 (PDT)
Message-ID: <93ffd73a-4544-5148-0159-1a9ea773c0a0@linaro.org>
Date: Sat, 1 Apr 2023 21:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 12/19] thermal: cpuidle_cooling: Adjust includes to remove
 of_device.h
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_122232_936335_19594748 
X-CRM114-Status: GOOD (  11.47  )
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

T24gMjkvMDMvMjAyMyAxNzo1MiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gTm93IHRoYXQgb2ZfY3B1
X2RldmljZV9ub2RlX2dldCgpIGlzIGRlZmluZWQgaW4gb2YuaCwgb2ZfZGV2aWNlLmggaXMganVz
dAo+IGltcGxpY2l0bHkgaW5jbHVkaW5nIG90aGVyIGluY2x1ZGVzLCBhbmQgaXMgbm8gbG9uZ2Vy
IG5lZWRlZC4gQWRqdXN0IHRoZQo+IGluY2x1ZGUgZmlsZXMgd2l0aCB3aGF0IHdhcyBpbXBsaWNp
dGx5IGluY2x1ZGVkIGJ5IG9mX2RldmljZS5oIChjcHUuaCBhbmQKPiBvZi5oKSBhbmQgZHJvcCBp
bmNsdWRpbmcgb2ZfZGV2aWNlLmguCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KPiAtLS0KPiBQbGVhc2UgYWNrIGFuZCBJIHdpbGwgdGFrZSB0aGUgc2Vy
aWVzIHZpYSB0aGUgRFQgdHJlZS4KCkFja2VkLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxl
emNhbm9AbGluYXJvLm9yZz4KCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAg
PGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDov
L3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
