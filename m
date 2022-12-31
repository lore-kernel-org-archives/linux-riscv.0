Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3238C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 19:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOduWov2FnI9MLVLj16VDTb4q3IpuZ6seVmdF+Fz7C4=; b=rXLpbLNVRKYThl
	0NdeJDUbOSabyYwrILeqy5Qf9v2tJH6M+p+e5wRXtz9ISSQ22dsaa/KpVrlt7LN0G/HI6wsB2l+tJ
	WozLrocbw5CHIu3u4Ezvg0QkjDHZJcnb/D/IJzleR24T464xw9kW6v3cKh2kHi0cHMy0hKgghR0ci
	mKNDGYQOrhYBQdK7C671e8+Ma9HUh9obN/+TzFG2jQZm66D9qQUZywIVFBT9FCOZzienoTnKp/NoU
	CUrh4KOeSzamy5echePlqox3Qd0/qnU3DnHAke6jlgWlHym+u/WA9oD0gEQLz9nr/IbbxKHoLunID
	OI/TpVH/jrrGJInotmQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBhBY-009Bi3-0y; Sat, 31 Dec 2022 19:06:24 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBhBC-009BRF-SS
	for linux-riscv@lists.infradead.org; Sat, 31 Dec 2022 19:06:04 +0000
Received: by mail-lf1-x129.google.com with SMTP id bq39so28439472lfb.0
        for <linux-riscv@lists.infradead.org>; Sat, 31 Dec 2022 11:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jIySvWkaHMhvHNet3xt7JxoPX9peCF4NsB4XrthbUdQ=;
        b=DqhzdZ8GMGONjk1/mTp01nVTS73jara4hArPcV1nK4bXiYc9TbLAiKNZt4Q46wLOk3
         kUHVSzEfgAcdS6QoYjWNP2xExsCibkI4td+Z5kxheIMrxM9HNsJ04aQQyn+bFksXompC
         ZtkhNHUXgLBKEcUICB4qz6yqnrbPza3Ksaz5GJ+iDSp9b3gFIssULh1nr+83YqAgkRkJ
         EHPniaYDfdhwqccTrNmJ0ma/NUu/qFZcYHIsrePpconOOeQxnZn21Rc4uKx2ZaPAtECN
         Tg/UHmUXAMxMzNKxPghUA/NQ3uEsw67KOrlk1e8tOQg9ZBmlUnkGqRh0Yip6MAX2JIcf
         mLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jIySvWkaHMhvHNet3xt7JxoPX9peCF4NsB4XrthbUdQ=;
        b=zKxi210PQDzWJiuxDox1iNyVYCMlgDmiEJvmYYAfIxg3BYSQNzbOLj1s8b0gj/enzL
         EzuPY9cC6UNpArJZ4Kxn70c2KDVUJbPCacPZBRv0JH3PB+ke/Ajy9+duoGZVi38PrfCg
         xsG8+Lsv1j3/2+AgO4XGPF7aHimrWTE8WGtHLC59kWTzawpsTsTay/m/B3iGRHKzfluA
         xhWEwkyOMkzcLet3gwpYs5rb+e2FjtrepeZeWilayQwkRgJPBGMHHkgYgzBiNDvOErpt
         OKkyBuRnrwjtzEZCkvq8npKRkx11gYxR2x7gYDLj5Yse1PryWuMjnBnAS6EvlhrOj43c
         7nEQ==
X-Gm-Message-State: AFqh2kokBGIUWDaYV0ZKOJcGCX3CmwYe0NgM5gA2f2XuR7xf9bUiqano
	3ThHXqsFGY7VKKhCaQB1sgqKYg==
X-Google-Smtp-Source: AMrXdXuTfgdQbhaGaIjJutw1ngrQ/aadPT4CRRlOEuJUlZU1qHVVzJzumSK1QyfcO5SFZUTpCaL1Gg==
X-Received: by 2002:a19:f001:0:b0:4b6:e4c8:8a48 with SMTP id p1-20020a19f001000000b004b6e4c88a48mr11142739lfc.63.1672513559388;
        Sat, 31 Dec 2022 11:05:59 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o11-20020a05651205cb00b004cb34b81150sm80316lfo.282.2022.12.31.11.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 11:05:58 -0800 (PST)
Message-ID: <ea18d873-29a2-2311-d10f-ed3f82d2a46c@linaro.org>
Date: Sat, 31 Dec 2022 20:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] media: dt-bindings: cedrus: Allow power domain
 references
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
References: <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231164628.19688-2-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_110603_005754_13945E3B 
X-CRM114-Status: UNSURE (   7.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 31/12/2022 17:46, Samuel Holland wrote:
> The Allwinner D1 SoC contains a separate power domain for its video
> engine, controlled via the "PPU" power controller. Allow the

"PPU" is not a nickname, so just PPU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
