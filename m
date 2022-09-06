Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C9BC6FA8B
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 13:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4u0NRUQKJlhd5qGitidKnteg67a3aMBKou0tIspOeOM=; b=5AsJlegWPwEqNx
	P1KLgNoFQY/ThwVdlEyBNfJ2a2UojRDcb7PaHGQWQyg895+egVGA1QFbbOQvLDXlKM0t0AT2yzEJw
	r+yhATmt9j1Kal9FO6fTsfKktQJv6MtMbzDDbIxK0X36gJb7RDYIKyuo3WDMuL0WJv9z7r3EBuda4
	e8VyrlfAEoNhpHER3osMfoBC0V7ukx00XG6NL/HQJAkD3o7mWcs791qkbOgTBu9BFprLvKtmslELK
	zBY/6wHyXBYONyYUYFfhlm+NRTNp/sru7IQwdqFLxW6nzfYZJvdANQS3DMVQww0ZxrGYyAAAYb9cz
	G12QGhOn7yclfhdujxzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYKx-00Dcte-6I; Tue, 06 Sep 2022 13:09:55 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYKt-00DcqJ-So
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 13:09:53 +0000
Received: by mail-lj1-x232.google.com with SMTP id r27so11809211ljn.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fvyT04/Nvz6zIBROEx0pz0Zydf7Sgv0iL5DNAFgL4FU=;
        b=Eb8korZ58eeMIMkzxU6/1wJdDv22JYU4eF2jFdj31Lh/ZwoSw3bL1z3nrSmkpE3Qwi
         DMv9xYjP38OZHvsfkcBUxHyIOnBKOWzO7Ji3g/lh9XT9jXbx6yrSUj+3fbbqgWswuYuF
         V1MBR1RSIW6kYFt7kFRTukEkysOo4vbGLpxju4wBxPKwA6pTGqisuU+OoUcwh1g8sHnQ
         rY1ZB+hJL3YCtDMMQXrkxYnU/ClJOkvmCqMHc/Qd0kwZ56YRcTkRArs+kDxYuY9Uz4xH
         ov/gw5uou4V5nItHtiC8XBCyJkGJ89rl5uKvbQsW9Rz7CWMFO0go3HtxW/RWNI3Z3GHb
         eyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fvyT04/Nvz6zIBROEx0pz0Zydf7Sgv0iL5DNAFgL4FU=;
        b=ZXdNCLQ2f+3FL4m+KbGwrp8aroBkUmHwE81ZOABTu6oMTEhy6iKniPMQGyUzfV5Hcw
         UtXbgr1zCFcNhark7fn6AuBuIH18TQ2NkeYBx4QWSrD1kZTMNH7Xnvd7V49mNH3OAsAV
         1/m1tmzTvj1Ix4g7ZklxR4e6MYVgHn8s6vo/UZnwnOAwrx/CGmIDj/mr9t0/ZbuK1paE
         tQewxkwdTIgg39yNiHUgWst3BhSa6oFN/6IOjAgeHh/bYH8HYGC6ATzzZDk6E3UsXnld
         C+d+r4/YNuqmCfAs52M5uVj3v0LKoHljlDJVWGeGbHSLcb+5Rp3v4tc2uuh5qHdUpwLv
         OIaw==
X-Gm-Message-State: ACgBeo3cKKcMBvI2lGWZXXkEYdHkoXkLpVdFn4WcGi4UBhX8mvYFsOnR
	V3TzoVkgrr3zuChu/9rjoi61EQ==
X-Google-Smtp-Source: AA6agR7TPR/1qR1gU1UY2pYSeskuowrn9cvcmJrC+PYB3PBzsn9GjzfaEpEe2lc+gpGAh82YoIE12Q==
X-Received: by 2002:a2e:b819:0:b0:26a:a531:da36 with SMTP id u25-20020a2eb819000000b0026aa531da36mr950357ljo.141.1662469789411;
        Tue, 06 Sep 2022 06:09:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v27-20020ac258fb000000b0048b13d0b896sm1731567lfo.141.2022.09.06.06.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 06:09:48 -0700 (PDT)
Message-ID: <45b6f444-b8d1-740a-81a2-b464f71f2a15@linaro.org>
Date: Tue, 6 Sep 2022 15:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 2/3] dt-bindings: riscv: microchip: document the Aldec
 TySoM
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220906121525.3212705-1-conor.dooley@microchip.com>
 <20220906121525.3212705-3-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906121525.3212705-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_060951_988296_9FA6550C 
X-CRM114-Status: UNSURE (   6.93  )
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

On 06/09/2022 14:15, Conor Dooley wrote:
> The TySOM-M-MPFS250 is a compact SoC prototyping board featuring
> a Microchip PolarFire SoC MPFS250T-FCG1152.
> 
> Link: https://www.aldec.com/en/products/emulation/tysom_boards/polarfire_microchip/tysom_m_mpfs250


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
