Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE48E85361
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:In-Reply-To:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jzx3qixpFi+mtVEnzYmTqRLQb5QX0iplWdyEFjr95RQ=; b=u6rx3zbNGXUvj/zZk9vIDEDAH/
	Qs7O0RUl/PxhOJGFhJ3dTAC1Gf+2euNbQ1Ck/pndQ/QOG+4FL8W+V3gBArWNBw3ffVvdznmffGHXH
	Zy3mVId8yi8b51+j7T1pvWqKWqIDpKGLYsyC0r89QGKKJYdAQzKE8IL6NK5TPF6dslu+Yhz222LPs
	g/UlGJlGjPin9VXf6K0QI2Fne5uR27UYiznyqnYF4YpTvqqtNvCx3BJFSB1PGnnT4N1f61pG/kNKf
	Jz9otVARzmyd2X/qSckyp507A3faHci0VqbRWXgHZyS1Upr+a9qFlR8JwQ7r8Wts9LWb+NzGUNqtZ
	AoKg/FDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8e67-000000022Ym-0z4w;
	Fri, 03 Apr 2026 12:58:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8e66-000000022Ye-1oid
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 Apr 2026 12:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:From:To:In-Reply-To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:References;
	bh=AtgPaP/DZ3OP99cCtZH3atx7GOUtVsIAtaewyw1CAz4=; b=mb7/qQwmo0epUIn/q+YIZqNXsf
	i/bqmr0e2oaekcyk5dRrFDOPNxm8kQGWjdGbpB01k1qIQf0SfAVVkCbYBbB0J8sJF8EGNo2cppnRg
	FAZveSUnWzIuPW55qsT1rPnpsuaydfWsZalnXRXbjnWy8GDFnURdEiZaxIedsBH+Bz8z2L/m+ZpcV
	pUbMG4/o69LlYWYHxE35YpkYbZ7CpQiG6P04NMuHin1LPNu9oIleWyItwHP4hkvFfqCY1i4ST7WQs
	At1UskdUyn3aHO8OWKpJE9g35jeRMEFRMZcvsvDIEnLyZRXsBNht9HKaYUzVpiIce11XGvl+tyDbF
	ZIY0TujQ==;
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8e62-000000048pu-0sHJ
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 12:58:00 +0000
Received: from [10.0.0.2] (unknown [82.65.243.93])
	(Authenticated sender: legoll@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8B5F36014E;
	Fri,  3 Apr 2026 14:57:26 +0200 (CEST)
Message-ID: <36cca49c-0cb4-42b9-87ae-702df825a4a4@online.fr>
Date: Fri, 3 Apr 2026 14:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
To: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org, dlan@gentoo.org,
 krzk+dt@kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, lukasz.luba@arm.com,
 p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org,
 rafael@kernel.org, robh@kernel.org, rui.zhang@intel.com,
 spacemit@lists.linux.dev, gsh517025@gmail.com
From: Vincent Legoll <legoll@online.fr>
Subject: Re: [PATCH v3 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_135758_429656_878792FE 
X-CRM114-Status: UNSURE (   3.69  )
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

Hello,


I applied this series on top of:

- next-20260402

- 
https://patchwork.kernel.org/project/linux-riscv/patch/20260330-orangepi-sd-card-uhs-v5-9-bd853604322d@gmail.com/

I need the the SD card series to boot from SD card.


I'm also seeing the same "it works" state as Gong Shuai.

So you can add another:

Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2

Regards

Thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
