Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5A0C4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 07:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+nJDaPT0/XXs39OwU4B8qu+8yvjEkyF+rys5JVpEN4=; b=Xfjgu4i87NwldP
	Xzju8ruCLs4FDSPDyiBm5kACjfWbViyT9p0O+5niGK4fZHjV+W9lX+8TvwXZLAAGMKkTCW2ipNA80
	+DheyrUYWO+QABeSBObiu5l7SnVxjCSYTYDzomnX0gVWfvKUG6snSaXVqAcdgjGdXN4JJHtusd/q3
	xSIRs5airhljgPGpYKS0aeVT77dJKwbSAaSVIrg47pX2HTrJD2pjbMBVr1GfcDgUrNe1LaPt/EHuB
	ugZktY5dbeOxX+jKNXr6HERuGCwi2MyS0rjFs+caa3uocK72Y9wZe6VmTXnJqknPOTXcMEkwV68d0
	qPYh+T8ViKSyimt3T23Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcd8-00000009xgn-2ZRH;
	Wed, 07 Feb 2024 07:46:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcd5-00000009xfo-3qvS
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 07:46:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-410177e41a8so640545e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Feb 2024 23:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707291957; x=1707896757; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yg6zyVpmRB2LVo5vmOZSMo+PVslFcSzyIa1ASa6odM0=;
        b=QaEpsjTb9XtgE1iFyie7StajKi3rTG4b0bEnypoB/M2+DGzSV+ogmkd/2ZIwr9y5Tu
         nGN5xRN6cPfMVAtipV1bQim3DIb6vcnQpS/os2hCWtDJ+VuX1qWBJF/X9UzAvO1xN1QV
         E3WIyF+uOSAy9A1EGmgazmZU5uCXNWCxCyojBlYQN+D51Z5xK/9ETE9W6kEWEsvLcHJ+
         bfOAG9h3u+DZULyFMFSya+HDHE4O9xnApBExlExFQZRrJSZ8wWto0OJOiBpKwYRjkDXD
         yMqrWwLWXcscWVqi67bzvvFsg5wCJWykboCpTnQxxx8/6N/OuElz41cevYzkvrR51/Ba
         QjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707291957; x=1707896757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yg6zyVpmRB2LVo5vmOZSMo+PVslFcSzyIa1ASa6odM0=;
        b=U1UdxaLFk7d1VD6+lswXlyZ2hxE9s6qM2gdtk+fNJeV2fyMgtDGz3+1YCZXeqpPT9T
         cEoPUo9S6234oSCHkfW7a+Q/M0suLpF5UscOuW4FJeCIWYCYRZHzTOs0BencpeozN2fe
         zYoH0BHPqUIxQsR4C7doqsI3hQFfnZCJDYhNt5wJbqXtTRG7VtTBC8KhpHBIj3S9hwPI
         PZLFEpcVaEJiTe1aP4n1SqJqBAkWirnnr3sFn5l8TAmbHsVoEzYyUalcxEO+Z8WrjuxS
         m52ZRazbivNI2QiAISsY0XQpRAlLXacwU/OpYL2f0+GQpOKgplfUSTqQc4fIouYSbaIb
         DTCw==
X-Gm-Message-State: AOJu0YyNwj4x5DSfel8xd2DzlYJ1j6rgVRgtVrWKOUMxbwjRs5N7j5jg
	s4cHSR6AQhQ9iwXi+5AuNrITZyD7DNlaImK/wTgQBkfs/iHTWsfH6JzV6mbzbsU=
X-Google-Smtp-Source: AGHT+IF7WdVgS71HcRexNVhXAiCotY4USAJvXXpGU4KaHVhAMSM6mFR6ogNBVI0mSnvJbwwlkx+N1Q==
X-Received: by 2002:a05:600c:310c:b0:40f:d1e4:606b with SMTP id g12-20020a05600c310c00b0040fd1e4606bmr3327336wmo.33.1707291957069;
        Tue, 06 Feb 2024 23:45:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMLZVrY+1blfBoJVIg56xJuV9R9hQd4MokqcSkcSldIA7meyQh/9LsYB+uaIPt+/HtA3yjGvocvD7it3SJyxUI5b+gpjy5CSw1CKe6GzEs30XuvZn6nB1f4I8umYpohb+z3sZHpgyMG5aKad14gBR/rqHEKYcgGaOl95/66oFygSj6x9q1EXojr5ZOZLQYBh7pyX2565gRx1r08gT77RRlgTZuq+1hapcVdSPfKyAX2P4uBC38kMAnb4Tm7Ej6fz0AJGWZlp6MHfLIO+DAwGDxisS5gve5+bosV2GskXsdtoijabz4Fi9K/z0fD3o8+/Y2S4vdoUJM6ZLvFKpRcqZ61eQvrBMlg4M1RJeF08gc5VdzeB6ARd0zFwDounzUuwaEC84fSYiHQVjdo3+lrzGVuuYgvWz2H9UE/QbAd77VBdW4WnEJuuEP0vGM1Q/JLrzoNd+u+CXukprnQEK1TznvM/4=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b0040fff3382casm1808226wmq.46.2024.02.06.23.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 23:45:56 -0800 (PST)
Message-ID: <1b0026ff-5334-4d3f-805e-d06926ca20f4@linaro.org>
Date: Wed, 7 Feb 2024 08:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: pwm: sophgo: add pwm for Sophgo
 CV1800 series SoC.
Content-Language: en-US
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, u.kleine-koenig@pengutronix.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dlan@gentoo.org, inochiama@outlook.com
References: <20240207055856.672184-1-qiujingbao.dlmu@gmail.com>
 <20240207055856.672184-2-qiujingbao.dlmu@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240207055856.672184-2-qiujingbao.dlmu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_234600_194357_9FCEF533 
X-CRM114-Status: UNSURE (   8.28  )
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

On 07/02/2024 06:58, Jingbao Qiu wrote:
> Add devicetree binding to describe the PWM for Sophgo CV1800 SoC.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---
>  .../bindings/pwm/sophgo,cv1800-pwm.yaml       | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
> 

If there is going to be resend: drop full stop from subject and re-order
maintainers and description to match convention (look at other schemas
and example-schema).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
