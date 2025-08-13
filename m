Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F43CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jweKsQvG2FGOZslWLZBfbuuZgExcsBUH1z4Q3790NY=; b=rkCe8cER/DSzBI
	VissilnStnaP2uzLaXQmxtMu/UDBlJE/PU7UqC33aGeBDYVz8GZAyZexdOF9F1vKOTr8tbw6OwtX0
	WHjZJ30ApnsOiv5qws/u/0I5zi0Zu6Tvm+vnDraFQrVHpplHLhuL4iM6Auut406+Z+tWSMjr9B6OJ
	5Y0QU6pn5Hcc3Efqs4i4WLuEZHE8OjmHF8aRBebp9DGYjOeSMVewXWPpEM1zd1ROkXQ/KKrbQIlOe
	eBwTRHiJqNrNDRBV1jQw3C5WGGXNQETztbdvZtNxrBoN7/wWiNn7Hlk+Hp2OwqUntZpDR3VtE9weF
	k9PgtVZOb4nwqJP6lLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBOn-0000000DkVs-02Qw;
	Wed, 13 Aug 2025 13:20:13 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAj0-0000000DebQ-2Zfu
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 12:37:03 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-87999c368e9so555064439f.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755088622; x=1755693422; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJSNE7TDIwDdVBJivdzquzFfOdkEAZ/NqbU/Si8oVJo=;
        b=TBsQJnTsoHbbmZFW+ZhXtBTj05RERbi+IOjJH9miwh9l5QkWmrqxin14zJmndjR7A1
         EecmDSOFez7aYaveY/w02bJyLko4FNTTI7Wh1KpQxdHpyRjAKypEgGoqZiW5jZ+GeXkQ
         ghP2pyF0gpLdGt482N4568FEVcNvJsxfP5h9OAqVGUwpiEgLnEi62/Stk8aIy0QOhZ1A
         oaLZGJWJ3W02FWLlyhQKpzr+FBXP+LkbXgIUs0b0wRAVcWUXAzc5zV8wMGYlXXn8fRtl
         TOJ8eraZItGOhvB637Yyr7jubisABWy/DM/Tvq0AyGyn0lWfjcrTji/IV3bE9Egu9Smp
         i08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755088622; x=1755693422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJSNE7TDIwDdVBJivdzquzFfOdkEAZ/NqbU/Si8oVJo=;
        b=SLBHK8zNMgcnKeZ9ziBBBbYbHKgTPFweWEVp8uP9HoL09B7B5b8LvfSfPBtM5goqBj
         aJiBX5BGhk+0FBOwzCyPz6Q0vmhhlBDljo21YAKAeFNzevHQ28eENdqz0E/wRYnOfLMJ
         3E8FQgH5oD/1L9aE0XGIZOaZ0kZpWKvlF87ibwS/U5Ghi0SnxJ83Dswtg+9cCehcnVrA
         bnQxmzqdH+tjOoNXuoGeYJQ7y7X6bhBn9OUGQmyiDmaHGpJSrKD8RZ0KwoQUS47mMq2i
         TqnVFOW6SkWDxlN6P3MdyGjj1yl+J1Y3Mp/79Aiv63D3ynXnWQcpG4xZk3+eAqBMOv1e
         R0fA==
X-Forwarded-Encrypted: i=1; AJvYcCXiH5s6F7Vtqv66eSYBGVakpFjQF5YlHfV11X7+9D/qjeuzU6it00R0+caAzsrP9T4v09MVnk84PAOgKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq0PlH06DHm6tyjHBqQ+pITU91OI/doFBCHZO3YQjChXpPAS6/
	BoWgisIuMgu8KNheZPBgHoiXWhIfuEsJ8K2QaFRaB0flrNd570Ej3Hkmg5V/QD7QKRY=
X-Gm-Gg: ASbGncv0KhJwBNNcus6BpTYzin66+rP4z6L/XUQaWbFVFvRqPhAbTZ6nG/JnVfgl3Ir
	cNPfhrYVB+k5UAV47Lf6Hd+0Sn8Z8G3DwDgxwA7mGt3/PhaZpH8ASBY8Qvq91k7Ns75EIaqHK8v
	5HPP4ZKjMHDCMkjUPxSubL3bdqevzsE9f0AuJj/2mSXzqQIU5dKtzTuSBD6DYLVdT34T94aw1Qs
	ZIb0ZoYsdPy8WO1Gu7aP2gXqWj+zUz6wXV7Ky/lEW+U5cH4v8ZrKsfTRb9mvN1mt5qWY2q7NEzy
	2wBx2LbXfXngqJbuMlkguGHuwP3r5pA3oU62OpMSguokmZVvaVQ6H5BO6fZQalyRon7Gg1oBGfd
	lhhSHg5mGeAPW18908Xd+ceZ6iWJgMetuBQWT8/CoIpimPYQWC5OLD+H2ybbeAReC9CVXN2Ng
X-Google-Smtp-Source: AGHT+IFnwEFQtUPVw9g9mmFiyfGLoS5nlr8HAUmqQnFfYA2GdWoqbZqkoS/L9fICYJiWR+VCb+vYyQ==
X-Received: by 2002:a05:6602:14d4:b0:881:7837:6058 with SMTP id ca18e2360f4ac-88429514720mr521566239f.0.1755088621539;
        Wed, 13 Aug 2025 05:37:01 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-883f19c1475sm445898339f.29.2025.08.13.05.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 05:37:01 -0700 (PDT)
Message-ID: <fd7ac07d-030c-41d6-94dd-da53b593f5ab@riscstar.com>
Date: Wed, 13 Aug 2025 07:36:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/7] dt-bindings: mfd: add support the SpacemiT P1
 PMIC
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux.amoon@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250813024509.2325988-1-elder@riscstar.com>
 <20250813024509.2325988-2-elder@riscstar.com>
 <aJyC5q0X8mj1xbSB@troy-wujie14pro-arch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aJyC5q0X8mj1xbSB@troy-wujie14pro-arch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_053702_740081_AC4EECD2 
X-CRM114-Status: UNSURE (   6.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/13/25 7:19 AM, Troy Mitchell wrote:
> You can change it from this to my company email:
> troy.mitchell@linux.spacemit.com
> 
> Acked-by: Troy Mitchell<troymitchell988@gmail.com>
> 
>                  - Troy

I will make this change before I do a final version.	-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
