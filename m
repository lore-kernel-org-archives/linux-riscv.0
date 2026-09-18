Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8A3C982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 09:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxQdJ9MDsFe7vYjU21lHQAQU90S/BaThqZvwqldwkuw=; b=HJBhLFHskqmDoG
	XTeq2W9S/Ur3O7T2MRK0Y3NSrp8D0pJDM5GCh+iTeag4qqZK93/9wDaY4Fnq631H+xRBfPecTD0af
	GVAF5dUJsRgpGDRvdLGT4R0VlIKcHhOOYd+Ee1J/xSY4qvxkvBLbTK6LuymHSoXfDRwGKDyOgZZyO
	OhL2nxRBqCF3SC/pvl5fsUoP5A76gSD1ka2OLSod+oqgqEzcBkcfVr9vjahuHFVfUJMoJrYR2RWBy
	razPLxeIAzfs9ANAON6DThs6R+iOsgjp3bgvhrNfKAinrDYuRz95kCQiUuA7C2+ciKGxSNhkMqYRm
	gVyT5gWUzy6rTKy+LJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ujx-0000000Duza-1Lf4;
	Fri, 18 Sep 2026 09:18:41 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ujv-0000000DuyU-0CWP
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 09:18:40 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356f6bso376996f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789723116; x=1790327916; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=311CbtIzx9npjWw+G87XYnFPfpSHlH7etn98HacsseU=;
        b=SVHvEoHDjs1tf1LleWDQH8IZbLzUXcYLZkUywa7USNEF9bJxAzumFBXKv3bLZPfA4u
         cVTU0+P3JOgIbVpVbyCf7av4otx933bWCDC5e6XXr9K30wZ/ggw75f0d5h5CzOPjrgb5
         J2MLz1H/mv7IDUMRQbCeE9yBkip88/FOiqyl4Dk96K3eM7tPNntP1abJGJyN9Ocz/tPY
         mK9PYgTqzwL7Xmw5lA8D+xS8zYz+LVl6GzHlgatyl+tRiC6VF+GPffy6tOcaDu3tmicJ
         EdjYpJK5bCpiNBEytMgbcxPi/SfqBhMRRUN5mFsPOBLRHBb5R2ptECp2rwkt2SvIstat
         h3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723116; x=1790327916;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=311CbtIzx9npjWw+G87XYnFPfpSHlH7etn98HacsseU=;
        b=VPebpGGYfIIuMExHJRgB82ZG5to57097QGfvjRGwbQQNKRDTIeuZtvELRQWkKd6ryH
         V0teW23ZLUq6k52dWlkYOiSHJI0QSFrb4bwS5InW1B0ut9g3VWcCn2bzsHj0mlZbl/hL
         i+jMPlbXn0oX1p8AVXLSSQfPYeEJHiX/UaLC8H2Ov8HB1Q09eTg5RO+SdCHsTWMfHC8G
         yub5DfzXLiQhZr1hUxpZoSXb4LEtWMxEUqoSOkjnJ2DMQjvO1B2+B+5/HIYpN4edqLUs
         pJVxF0H/Z0iL/xKyoDCWLsEr53pwsAHr/gUr+8zgtr8B94iWS6PDtgRw7oEOzKkTj9tx
         YJXg==
X-Gm-Message-State: AFuF++l5GhGHWzVaqSZ4M9pR8dv5UMABkjLD873bZqhehDnd4j/juX0Z
	pnrT8i10u6vm7DB/d92YBeQZHUWwtInOL3rFvm+k4JAFrW+LFHc3AnvpQoWTiA==
X-Gm-Gg: AYBFou31ZAg1MpK3cT1my5uh4U9y0qZY4YOG8Qr1Oo4TnIamH2ZXPioMET8CQJq/DgC
	TCQbtDZALdpCOsRkk+YqCFfvzPEMfTjAJPmXQu/uktXZ38RbLzHqg9+VtUMCAL93c+4CagAbjyj
	RxG/QgYIabAwuAiZ2uUi1x5aE0dFaY58Wjl9GJ9n6BLpJgm9/zZEQLeQM5ssn0tbvP9xB9GvB2Q
	SaquUmJnq1+Qw25z80OZYeeTDYn/ElsrMP0SXuag6WZ3gHeN2wBpKgIfYj8FWPcAhdIa5FbXN5J
	xfTRFs1Nk8wkjkxSnJ7SXqKxN7w60hjjrhFZONhPdI0NI15CljKwa64f623r3CBiSEg21x4SAGT
	ROc72W8NkGpskl/jBZXswP9EWkcXV/biX76rMZoLDaDvxkMbvcsBn39AEP3C/BGgq0qHdFTgiNa
	L7bPY1IUjEqCR/1O+mUxtDnVwNddPPo7yTxKx9ktLXEF13hDVbvvGjvaoFvvjCeTzMiJQ5EaJHU
	UJ5rX5pcD+d5bcOdFa/5M8rluiy8Ojm+JG7yw==
X-Received: by 2002:a05:6000:18a9:b0:487:88b:4681 with SMTP id ffacd0b85a97d-4871e21aa62mr4609512f8f.10.1789723116095;
        Fri, 18 Sep 2026 02:18:36 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-130-19.net-htp.de. [89.182.130.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff56411sm2649337f8f.21.2026.09.18.02.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:18:35 -0700 (PDT)
Message-ID: <ac94820c-5e34-4f07-91de-d08e1d4ef629@gmail.com>
Date: Fri, 18 Sep 2026 11:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: add cpu scaling for 3 boards
From: Andre Heider <a.heider@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260804133236.205668-1-a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260804133236.205668-1-a.heider@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_021839_120926_873B215C 
X-CRM114-Status: GOOD (  10.19  )
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

Hi,

friendly ping, anything left for me to do here?

Thanks,
Andre

On 04.08.26 3:32 PM, Andre Heider wrote:
> This series adds cpu scaling for 3 boards, each authored and tested by a
> community member on their device:
> 
> - k1-musepi-pro
>    fixed include order
>    v1: https://lore.kernel.org/all/20260614122812.2287506-1-a.heider@gmail.com/
> 
> - orangepi-rv2
>    unchanged, included here because it's still unmerged, probably just
>    fell through the cracks
>    v2: https://lore.kernel.org/spacemit/20260615-k1-cpufreq-orangepi-rv2-v2-1-237f006e580b@gmail.com/
> 
> - k1-orangepi-r2s
>    new patch from Vincent, cc'ed
>    origin: https://github.com/dhewg/openwrt/pull/3
> 
> Andre Heider (1):
>    riscv: dts: spacemit: k1-musepi-pro: add cpu scaling
> 
> Jonatan Hazell (1):
>    riscv: dts: spacemit: orangepi-r2s: Add cpu scaling for K1 SoC
> 
> Vincent Legoll (1):
>    riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1 SoC
> 
>   .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
>   .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 35 ++++++++++++++++++-
>   .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 35 ++++++++++++++++++-
>   3 files changed, 102 insertions(+), 3 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
