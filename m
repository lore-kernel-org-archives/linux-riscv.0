Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C636EFED9E4
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 15:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=waHhDgxBtjd2BUkXXKY1PWaKT9Mk9jZUJC0ZOXo0KYA=; b=orfu8ahnVOviO4
	J77cVwAffUJo5VdbIS7CxjLzcoH8y5s+h/UIkLGQ5xoVoqtiJpC9uprEIPfIpGV7Z5t2zDaUTTrDE
	nifSeBFt7SO6oDsEfv4mSDA4kbjAQH945Fbn49hc1fXLuROUse89ZIve88hDw2GcDwyTeRtZ5toae
	ji5e1LeAsdEEkRM1WKWYhLoInwPiVSxUzq9feve1kKPGbz9XriG9wuSU0dB0c09EM0OwoEyc6rs4l
	hud2nWPd+BMGi85Hl9ww5unFcPDz7BuBQTPApPjvciTEv3FV/rrk7rYJvFw+mBPbOBojl/62dNHrJ
	rxac2nsdBznxKDlKNWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WlC-00000006lY5-3waz;
	Tue, 17 Mar 2026 15:55:10 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WlA-00000006lXV-0cEF
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 15:55:09 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-829b2019b39so3122329b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 08:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773762907; x=1774367707; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8ibux8nB/MhHnX1SyYOz0IsNXVQjw67zWlanOsT53c=;
        b=izn9cS23piLT6pq+bKKz1iAvwjbU2GI6VeJ0ryz3IYqYbMEiWkyojtsDpedWZfFfTY
         MM3dmQRV7gtvRjKKlh6dyYcNOeXDC31indOWKe+GyuZNIsceZHgKQH6iK/vv67xstF+/
         IEFzVdPMzv43wIX78ZiS403nwMklnGS9fyU8JAr5xGXRMQFk+bAZ7tuksbJlKZzZAQ4g
         oA5yWXIgVag06Ca0Cn2cZQIiJNCpHKYA1BDn/RseiXS+wrKjboK8LnFSKA0QmrgUXN9T
         /ccVXjya0xfEAQ/nWkGJf4pSLzqHJ4JXj5tncuL878LVfq/E9B/l6UE8CGWqpPm3fqp6
         Nq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762907; x=1774367707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f8ibux8nB/MhHnX1SyYOz0IsNXVQjw67zWlanOsT53c=;
        b=BWoHX+WRyj891e99xddVX08jroYfHfOr80WJa+7Ep4YzaQjwh4fVWrxIDo4qthXdmN
         EAvYnKcNjNh9dLUz6nFvijg9oFTiKyfThGg8bW35dwbw5jTNfpSNxWYp/4izBkUpGLCf
         VyYngS+jXLcWcICM4EYrzteIy9pEYDNFb4lNwgr+/yJuzSfLFw/Z0YrAOEsBYM/3EXDX
         nNHFw70vxcGyApuw/rxtuClC87WfsOfdbwG8aLQU+bfzQQEnCUGLQXF1jjJz4zo40bGd
         KaQmrCCC/JQjFpyoOLkfX4lEdivtx52VbYiyjA82zhHmZ/YDMW5N7SAP7Mht3A6fz7iC
         XWkw==
X-Forwarded-Encrypted: i=1; AJvYcCXTtxyQRUcT3b7aozFpWFbW1rVycjfDEWrcD1YRpNMJphfyiiLW2CyeHUZZfIO3AkP5R7N0iw8fpadLFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBrtBbN6DH4zvi69BMEKwS38PYtRi3Tw6v0usgUl2I5IIawsAQ
	R4k1EuLkTN4qfarTn/Pnm0S3v6p6jFBQ4s+9YpKRsYvgLSIU7rTieCYk
X-Gm-Gg: ATEYQzyZiI7PXfDbt5p2rLILRKllQM/DsajjDdYugy3AqF5DLWoH7IFwbvGrw9LETnf
	qys16LQlbwx7Bx+9NGHpqniVM6EP2dVlxVrL4Tcb1hB+1StWHyH2c28blE/j6p9wPZLayT055vE
	dtAIOFIFJc9MnFRYhNgq/HQt5aHzqdYYNtTXk8emc9VQKt3lRBo0crcPa5boSRFZScIB1a66gRj
	Z7MrreqdshnxpWwp7WxQ/T9HqwaUqzWHYVWMHLiKspFbXsOqKUeZf3qW8HLNC7baCO4YuYz6NVg
	QC/fJa1u0ZXyVjMn+E8qkt6BcP/kxnyWhJK8tp4BkBDJWxvsmFcwNQi5NkffpIpc2R/VifvUzk9
	Fc2TZudztl8+hqmuQdgXPf3gOc2V7v0S1GL+zCPd5XiY4ZxapyqzFT1RZ8ilOToJyL8Nch7BcVa
	Su7xyr41aN04jW/c+Soo6/7dJtdJwmrRHEiaoG
X-Received: by 2002:a05:6a21:516:b0:398:9044:77b7 with SMTP id adf61e73a8af0-398ecdd8a48mr15587743637.59.1773762906804;
        Tue, 17 Mar 2026 08:55:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e5691b8sm21201a12.25.2026.03.17.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:55:06 -0700 (PDT)
Date: Tue, 17 Mar 2026 08:55:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <7f043ae1-c863-4884-a2c7-710a8d9d8771@roeck-us.net>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_085508_187779_197BF593 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> The G and J coefficients provided by T-Head TH1520 manual (which calls
> them A and C coefficients and calls H coefficient in the binding as B)
> have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> respectively), however the binding currently only allows coefficients as
> precise as 100 milli-Celsius (1/10 degree Celsius).
> 
> Change the multipleOf value of these two coefficients to 10 (in the unit
> of milli-Celsius) to satisfy the need of TH1520.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
