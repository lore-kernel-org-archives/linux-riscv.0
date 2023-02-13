Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A647C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjQNqccRzY+tMSdxknq71GwnN08bwyKdrfIx+ZIC50g=; b=rAJuP9ZBtS4cpI
	00sJ3G84D6+PwWDiB05Ws7aBhB0d+gQQQjhpxL6dcMuhm9kVcG//U/pX0XvxA415sbiJDHTzGzXRO
	IGYXXgmxPpP6eonphG7kYld8vutt+OVq6NxA06CqV7BeIYdxMV7QqmFhQq+F8lt2TkUS6ohsc5Kgi
	lT5Whr/Q4iqYC0Ig+bVCLNgQG9xBXngf0wo7xffIgWCKT02wOG2Y8l839Z23vir8KawQrPDq3aWst
	A485D1HGbeQT6H+M46uhrh0IbXiZ4zGulVhM7joQVZvD0jaTH6sj0UtODLqOqfA797YA27T2Oo8+b
	QmDW90akg6hAk5p5GUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRV0n-00Do5O-Tx; Mon, 13 Feb 2023 09:20:37 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRV0K-00Dns8-2D
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 09:20:10 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bk16so11365427wrb.11
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNLG0F4sytAFJuPLCGJpmTMcMTuRJI0BMdm+O22mIWk=;
        b=h65cQMGeWFtfyp2uBNLZIv4aNJ8crvS/MegClRzuhEPjPg+BDdR7aqGJ9/8XON1Bbu
         2XZckirgzIKPNipgdUySyNJHJrZukrIayPooX+QCE92pl9aI7oQ7xxgpdLjhBnpDDAPx
         ZhZyBa5ldmmym80vqoKngS1doGl41+7ZaRSDZNOjybDPD4DsJsWs3Z+64em6pAzfT/Iu
         xCCuMtGP0ejC69sEtvzbxgq3YINw3hLGcc2NKAVJf7649m1FuUeyHhG+EzSEIGZu4wDd
         rWYQWhSxHz6TCKYelQvbL1+SZVCWz5+AjihuLGHlsfu4ryj01UUEvu3Emw3dWnybevup
         XjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNLG0F4sytAFJuPLCGJpmTMcMTuRJI0BMdm+O22mIWk=;
        b=Pj2krlqphiZV2bQX1cdrUUfnZDwDf6hS0Q93/OzvqVEI6WqJ3x+ol6Gdhvg828mFYg
         KHjqAolGizdO2rq/gNMw1OCNxAXPDKWPAqTdX+hiJuV300q/wDELS203hxMLKMCgXw5+
         8hRKr86xtCvekFlMvp3Ul2vihFE82QA5LD08vr5WTSAgwAxJ1JdgWjBvJqKzlDlAkjul
         q51QM2x5BaNy+JrCH8WcUlJL6/87XTbGFUezk2L2XET1tyrQH0mHrf89fr0ATrgOtYMV
         4wzv3x6OOCE+xO3pT8hokkF6+LVUek8At1I5UoDZDT3jUoR1v92kTq3eEvXW70PTlYj0
         JWmA==
X-Gm-Message-State: AO0yUKV5pJVLUHHdkExpaGBZ6diblgSRkr01qes2VkbIgi2TeSBfLLq7
	mDcyi/oCNiZGg98CChvl9qPsqQ==
X-Google-Smtp-Source: AK7set9P9Rf/AgDFodMfFUkknlWiakKXK72hhfRuVm1tf2m8kXJEnbrxw1VZm/dlh2YKzny9lQPCuw==
X-Received: by 2002:a5d:4682:0:b0:2c5:588f:c5c4 with SMTP id u2-20020a5d4682000000b002c5588fc5c4mr2650463wrq.37.1676280006817;
        Mon, 13 Feb 2023 01:20:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m18-20020a5d6252000000b002c3dc4131f5sm10133668wrv.18.2023.02.13.01.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:20:06 -0800 (PST)
Message-ID: <17e7a0f4-38b2-cfc7-3058-1fea7bb28b81@linaro.org>
Date: Mon, 13 Feb 2023 10:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/12] dt-bindings: riscv: sifive-ccache: Add compatible
 for StarFive JH7100 SoC
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-2-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-2-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_012008_972521_4437C087 
X-CRM114-Status: UNSURE (   7.17  )
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

On 11/02/2023 04:18, Cristian Ciocaltea wrote:
> Document the compatible for the SiFive Composable Cache Controller found
> on the StarFive JH7100 SoC.
> 
> This also requires extending the 'reg' property to handle distinct
> ranges, as specified via 'reg-names'.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
