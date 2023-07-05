Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE49EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 06:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drpe8ZqSsN8i97aR4ktMJAU+FmDOyqneFucrfnN+bLE=; b=rUeHFk7RYMOzSY
	eokZRdnLmSpOJElWbEQnc+KoR3URQXnwKxuuJtl+NePCLL1xGUbJfhSoo4rEBXtd3snQ7EuxVn3e9
	THNOh4MmBXIEkGybHLOitLwJQb/TLTFEVRleY3SL9t0K3FzQ1Xvatk5E49lqJ5FkawoUvQP+509TE
	4oPqM/5O3+B5xGm9DYNtQ8/uoOTxdSvtlgK0+vX5u0SG860UhPse8acUPSztIMaAMccjCt1fAzN4/
	e2F6L8FfZSR5BsZh/uBa0D/enPMH1oSpaH4sBgcxbNFqvJojxlrT/d6ZR3JfkHN1nUfg0Uj3pTwDe
	f5ScXnONY879QEMeyqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGw15-00EtvW-2w;
	Wed, 05 Jul 2023 06:29:31 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGw13-00Etuf-0S
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 06:29:30 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-992af8b3b1bso710415866b.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688538565; x=1691130565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phyxHLO8a7moEZO+PoNeY0JF8+Azz+17t0Pevgwhi34=;
        b=xRBAWRwzH66vlfdqYnjOsrYIrhpnBsxVWOa97RDb+Zg6xUTnemUfZLMfc/iG9AvICy
         JYFbbTdNV2h2/vE0WtWB0THDl0yXMWrsHNMevPqwx48HSKYv6nhQw52LZlhtVZUDazWz
         C8iYnssufhqGFSxVPBvfUD4r3bNoOGEc4DEW0ZHmOV1lV5PQvQ8/HKSCU6QcsryTUu1/
         pbnVnc9In2GmPCxxa5QE00KGjQIZJQI6h0Q3rqaqg66QdW0TVvoor+BU29Y8A+l8fjwg
         l+0JT7icaJz0BR6GomBTOAQxXWhqLCTXyo5+s6HC5dF6B2t4vfWKF/tbMe77E+BXkPTw
         vyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688538565; x=1691130565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phyxHLO8a7moEZO+PoNeY0JF8+Azz+17t0Pevgwhi34=;
        b=C/XTjG7bYNYbX0uGgfZubjH+tuTB6RIbgkZ+7HgDR99IlM1uLZ5QehvZg6SlPB2YBk
         7mQq+HIGgJAUN+0dEmLPD396328ssMvmS5gbsA3Cj5z1rEUF+njsva45BuCmVdQdKgCj
         Wv0My/vMB6TrXbaNtfbZbz0fCqPF7DUERn3NbrcTq1LdizxB8sl6KndXMYx+10RXPUPk
         Gc/aNxnMp7/o9eBEJoMFttugUKFbb9sREyxQX7JSWl3P9XsBkQbIX7jYjaiMQjXvjESf
         UVwEKuNgko1dCrxTKgXJnoTFIhE1gRDaTCUEVIGAFPgQY3ArRw4YcsW9IDMaccCtrJ8l
         1tSw==
X-Gm-Message-State: ABy/qLbrVyz9AUVT+LlleTmCh2DR2DySJlnxGq0HJBhIYQBKyQpYbUyd
	6EZC8z7KUGc6I1gLujTMraGFHA==
X-Google-Smtp-Source: APBJJlHYdTo4z/hlkFHoQa2+NZRZl1eD9iH9atBU3yCR3z2OgkJm/+XjFDGMziiDwRH6M40eVek78A==
X-Received: by 2002:a17:907:20ac:b0:96b:e93:3aa8 with SMTP id pw12-20020a17090720ac00b0096b0e933aa8mr12138305ejb.21.1688538565237;
        Tue, 04 Jul 2023 23:29:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id v14-20020a1709060b4e00b0099251942e1esm9446516ejg.119.2023.07.04.23.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 23:29:24 -0700 (PDT)
Message-ID: <8f381404-159e-2000-c5e0-2b9ee809b4d7@linaro.org>
Date: Wed, 5 Jul 2023 08:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v6 2/7] dt-bindings: soc: starfive: Add StarFive
 syscon module
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <20230704064610.292603-3-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704064610.292603-3-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_232929_209997_24CAC15E 
X-CRM114-Status: UNSURE (   7.22  )
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

On 04/07/2023 08:46, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

If you resent the same buggy code, then it is still no point to review.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
