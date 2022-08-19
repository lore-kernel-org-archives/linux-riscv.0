Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91435C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 12:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ajo1Y9v33HVDMJJ6FON0t4cTBmmxr1biZYoUSo2Oqk=; b=FdZ6IZR8anY5a8
	ZEkDUH3VSFoE/fA9LwxbvGxezQjrIuBWmows6jFLXZnnUIVQY4lQ7sCv3xpR/ILqa5j3+46dJuQNQ
	TlQWTtXUTjuf7sInhy1lT0E8B5V43HQ68SWAH6LH3VSBiYSpPD3+KA0USVgJPGC3PXTCGrEimS9Lz
	EKcPe2w39v7D8NFlGi3bga9ifbD9yqDChPJZEDG/WN/wSvbWnwbksvROd3ar2C2frf2XiS5dcu8in
	8DtJm4DHlsFfd7ThJHInwzMIW6a1qsuich46l7+OO24N3GSYp/cQCHlP31AFHUoXr4+88Owbtp635
	UsP2KfQw3pP4IdO3TdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1OO-008D5T-1i; Fri, 19 Aug 2022 12:46:28 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1OK-008CzG-8Y
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 12:46:25 +0000
Received: by mail-lf1-x12f.google.com with SMTP id d23so1621509lfl.13
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 05:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=K29+GrLurEVMz+IcmJCvsL3+V3VFmxk9IgPRnZQasec=;
        b=TCew6KzbEtV2gO9hXzpONAq4N4e+nQyw/iU+jfOE5az9Be/FXPJIBc6GNySAnomO20
         FgIqmRs+DEWlBchnjqHuoz3YZE/geyl87pjMz/Ohgiyr98XF9LbdAXYkAh1tN961/zPe
         nvE0Puw8RuLjR+ICfL2cnUsxHafBSNqAxo7/f0FDLkrQBKd/PfhZ/XQ1uall65czZmHI
         mS1Qz+aPkdTW1EnsyUJFILOw8mHFqrISCcZlrg2QEGnc1BV+YJUaqY+92Vi2aAOj6RFp
         90pqM0ZgqacFn5pYXGPSz1TOerkmaYMdg85naGczDEuR53WgtlRXDWo4pwIQTxpTFJWM
         jdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=K29+GrLurEVMz+IcmJCvsL3+V3VFmxk9IgPRnZQasec=;
        b=tpWUHfrc+4B61gusFFL0WhcmIUKxw+3UT1ToonT8IEi2vZVi9OJ6c0vXd8+iYn2Q97
         8F0623lvgcZL6Q4y/fW5/V2gTyj8HWTjr0DqCQ9fUS25QKtn+9mIbQr2LOXCzUy8hT7a
         auk3Ck305zJgk4JUphWxqNv80TeMQpjseClFjLP1d0T1/wpqkNIlFzwIzSrU4kd5gUcO
         LmpCcTLbUVtZwWNpZLgUSwFG8SzAzVFgJZbrmrffV1OSGAtHywZlblGOAPT3cZjJOjZL
         H7m5LvAw1xBESihLvI5kGjsRsHpS4mN4QspW7jmWwnyQl1V0QJy3WnX1B/u0XijCBJVe
         kXTQ==
X-Gm-Message-State: ACgBeo1siPYbP0dNm5xIycB2WpeRyJTCC5VUpUEwhxvxjRD1C4XY53Fq
	PeJ0H6p16W85mPtBVkD+eGp5vA==
X-Google-Smtp-Source: AA6agR5/vAR5q5Kr0vJwYrqhtgqJma98MRzgessllT6tIdcRYL/NOV9mrbay71eWVKq/BdtNDBUSLw==
X-Received: by 2002:a05:6512:10cb:b0:48c:e0a6:221b with SMTP id k11-20020a05651210cb00b0048ce0a6221bmr2775454lfg.218.1660913182522;
        Fri, 19 Aug 2022 05:46:22 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id c3-20020a056512074300b0048aee825e2esm88260lfs.282.2022.08.19.05.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:46:21 -0700 (PDT)
Message-ID: <3b1a99df-58ed-9bed-aa11-14a1cd8b62b5@linaro.org>
Date: Fri, 19 Aug 2022 15:46:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/6] dt-bindings: riscv: microchip: document icicle
 reference design
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-6-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819122259.183600-6-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_054624_395065_F668649F 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 19/08/2022 15:22, Conor Dooley wrote:
> Add a new compatible for the icicle kit reference design's 22.09
> release, which made some changes to the memory map - including adding
> the ability to read the CCCs via the system controller bus. Technically
> that was always possible, but the specific CC chosen could vary per
> run of the synthesis tool. Hopefully this is the last reference design
> version impacting the memory map.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
