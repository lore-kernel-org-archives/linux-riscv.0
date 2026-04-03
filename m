Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA957E85371
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCPi5FHnItBsFUqLjVlYUK+fJkUbmZ9qvegUa+j3Jbg=; b=46i6GxWW291IWpUAlcfs04ICp5
	yPo+h639DZ43T56q+GuBpXlTcJH0SsIwdr3yPpVamZlKLqhgGZKQIIjTSWJm2ARJAB9/ywTo8ahRc
	fLCJJgMohskOClcK0bFFHtZQJB+kXNILOD5Rr98ENThQjVu0cO14JuigbSfb2Huefgtqxbfhc9h1K
	wUQblFjvqT3FK8ECuvu3gBO3AqDeHmjC2ExDrsJqNOjCOguctEXsTRoNjK58VLkhMjXsbYqLbJhKQ
	UkqiAGvXxHUwKV/ffqloLEdOIcCY3zkTI5U3EGSRvslYKYFfiCKZ8kWtTBg2Jc/Pb/Q+IgYJd/KNX
	7oZCfOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hNm-00000002K6u-1jE7;
	Fri, 03 Apr 2026 16:28:30 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hNj-00000002K6U-3GsQ
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 16:28:29 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-82cd98be655so1412322b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775233707; x=1775838507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJOmOz2L9YVEihHhZLWaE0nc/BZm+kqpkZgh3ChszGk=;
        b=iMVTvIbHjZrzKy6YluStFaI2+/o6B8wq2AlWP6FShxu1pdP7fu4nVSes4KdFzKpG1y
         4kUHs/Er+dQkMaHhTb0Z9WCgEOFicFYGX3tPWJ634DpCjxf/yG59VVyc04GJewkNfx4u
         X7Ox2XUwRCnsbQUyPwsVMEOheWvQZPI4n1jBFq4HQzHlBPfiqb7QnPzw2DWjWYCGtKhP
         FRinu/d30iWY2Ac6yEM7eb2jrNWcJlMwezjS74QXHpG9zmdQru8WFLCZCAwiHU+jUd2g
         954grgxkPa8wLTOkieDdwAbBcwXs03zxOOkawOKsfeX5cYNxUhbSOKuRtBSA/i+zxLMG
         KYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775233707; x=1775838507;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJOmOz2L9YVEihHhZLWaE0nc/BZm+kqpkZgh3ChszGk=;
        b=f3JHVSkvqrfz/6fJGsLeO+FgPM4bKOlgiyya/m73SgjzAoOfDSGwHZQY9Vv5KUGVXt
         4EvXU9Z92dcqmDpxN9L7T5zl79Xascvg/7qoyVpiex8ePkwbqvQWfr+Dfwl9wVFXOepO
         ReL7hT5vQCeJ6myWcTgHi9/d5SoUsH3nD8EOfd/ADoz+jpx6GUVR6ymBbomQuJK0hpk2
         pG0yCSzfTF2N4APOXdI9Y3BoJNzTPVDrRXD3f4ZEaXjez9HYk3FRe3xx+EVniOynThBT
         WuXmAHzgbnagBxA9v01Z9usPN1yoJl2fyJBr3515rkwQqEQfDAkNXRwxyss5vjjD3m1Z
         eNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUg/82fpyP1lNW5Ec0AgrBGVH19305nXRJ3JwtHfDtvPVQEsLsxu5hgVE53lC9GGoqOI61vokgO6h7DA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgoqama+V4I86Q3SwbqUVTP+ue4nTkaRdML6jhfYhq3UtZvSbu
	/LuIUso0w89thdSDm5pQd941NESu/OVh9lH9YSEAI3oaIIJUAzcyqKw1
X-Gm-Gg: AeBDievYEkHED3UgBHsUNMPOxkehmz1RpiXKuclSRMDfM0/76V78+qktRgizI5ZpOCU
	+0HxGWKXWyGuDGqiZCNPNy0j75Xxot/KWl8DgU0mpfWQd+M8I0v6RuNaPN2cH5Enb6WTkqHi55t
	hcKZ2pYytMdYOr4+EUL1J8cZ25kJDCF/3XLoJXn++v9+y875YhGLb6uKy+N2np7Yo++7p/q9Iyo
	pE0hgOTaTrPnl0My6++76bC83Dmln2BAt5eIAaiTWBqORzB1WFSLM/Ano+BAVSPmp1qHDLqC6/F
	qrRUMGUUVPXRykeVrPVOSz0ZZCXtOGljchXQfWIl6ZHtyedXFV+oeS9vo1RkjFx/bpLFeFo3ZzY
	wzY7dnpiL1YTjdgZKhdd9e35i1hXSWNkKx4pqMEfZWCrCjl+3R8Vjf7d/HRL4V/j9QrGrX3FgKj
	4IAIFoimtZ5blFghbl2a7FH8HH2t1CqUrWTuOX9HXh
X-Received: by 2002:a05:6a00:3902:b0:824:a01f:6335 with SMTP id d2e1a72fcca58-82d0daa3ce1mr3501828b3a.22.1775233706143;
        Fri, 03 Apr 2026 09:28:26 -0700 (PDT)
Received: from [10.116.188.94] ([114.254.1.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c3ce13sm6592724b3a.38.2026.04.03.09.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 09:28:25 -0700 (PDT)
Message-ID: <7792fddc-0218-4889-97c8-42eebadbb343@gmail.com>
Date: Sat, 4 Apr 2026 00:28:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
To: Vincent Legoll <legoll@online.fr>, alex@ghiti.fr, aou@eecs.berkeley.edu,
 conor+dt@kernel.org, daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 dlan@gentoo.org, krzk+dt@kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, lukasz.luba@arm.com,
 p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org,
 rafael@kernel.org, robh@kernel.org, rui.zhang@intel.com,
 spacemit@lists.linux.dev
References: <36cca49c-0cb4-42b9-87ae-702df825a4a4@online.fr>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <36cca49c-0cb4-42b9-87ae-702df825a4a4@online.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_092827_828492_11E77BDB 
X-CRM114-Status: GOOD (  11.14  )
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

Hi Vincent,

On 4/3/2026 8:57 PM, Vincent Legoll wrote:> Hello,
 >
 >
 > I applied this series on top of:
 >
 > - next-20260402
 >
 > -
 > 
https://patchwork.kernel.org/project/linux-riscv/patch/20260330-orangepi-sd-card-uhs-v5-9-bd853604322d@gmail.com/
 >
 > I need the the SD card series to boot from SD card.
 >
You're absolutely right! We do need the SD series patches.

I'm actually building the mainline kernel using meta-riscv, and it's 
default config
already includes those patches. I completely forgot about that.

Thanks.

 >
 > I'm also seeing the same "it works" state as Gong Shuai.
 >
 > So you can add another:
 >
 > Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2
 >
 > Regards
 >
 > Thanks
 >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
