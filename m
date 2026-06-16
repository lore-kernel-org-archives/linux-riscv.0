Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744D8CD98E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 08:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9nfMjKg5vLZP6/X4lcrk1+SJnK7muqW8EsdjAvNNmY=; b=CgO4FiHrUyEewy
	dNhCx/hgKPpw3s92uI4Xlm7L1IcuNiCRvG1gp89A1xdzhNvkkF81Ydi3bgvHoCFw+rfO/kkdykGzG
	2X+AdKQS9VDtveqAF2LxHQZTe1kVPSgbGoimMR3LSfBLMzHtBO4dAl9M0jHQ8qkCb8CblMA79wWGy
	qB+/GVpoD4Tvm6is1KqGUnHRmdO+12E6DrrDlQqoojsLKCFz1PJpbtYLULywT/XYzP8OrNfOfrghC
	nrfH+zzIDQmcYx8wBLEM+YW4kiFf5co6NmR0kHyOcbnhVuV10JJjURzHRI2aUp0enTGYTfy2F8IKl
	Bxb+UxrFFIVHsleVebeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZP0t-0000000FQqm-3DVu;
	Tue, 16 Jun 2026 08:19:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZP0q-0000000FQqI-45pr
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 08:19:14 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c27fc587ebso16686635ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2026 01:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781597951; x=1782202751; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PhNt6MHC4AegleV/WbvHUk1ZYZMA3NIq1ay5U/dxpKQ=;
        b=v3mrfuAIn7bIQ0y7zCXTH5ykNpJFy+yvMVtGTyLIbgiHN4CBljGRT2IQDBIwgubTBa
         uQaRlLW1/TEZX2dzMQar3HmYRgwcOUhrYHtfmVOBzqTHqqanGjRgnEeQ6LJrEjBUUaT8
         lFy5K2ffplwi77uljjV6zHzhvua4filJOnKA15l3JG0BLqZXaTd1DQ/brlVHSEw5sst8
         0PqdlCsdZeJ4YVnZ4A1mVjV51NpaWycyAB74W5cRSupeF/9pzV6+kfIiEf2PlQ8BXjhe
         8i0STrSfREblctwYBkxA7+pwGh+kuzrM+G2h7k0X64484t5Ax4aNTHyZMD1VVGtHlDIU
         k1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781597951; x=1782202751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhNt6MHC4AegleV/WbvHUk1ZYZMA3NIq1ay5U/dxpKQ=;
        b=BN6U5N5nZKEOONUsXmAI/lvCv9zvTCXmSOrK1l9Jod1KM8LQgovnJUuLEwkPXgxZPs
         NZVzyMglTF9okVeXKqo37+ADDqixG0dGXaEUJ5w7JWstiSH6Jap7blTDVovdBZ889G+X
         P/32vUSuMyjqw1Km8oO9rqZRdC/1Fh6sggrm3H3fwunSe6ZsM8EFv7KvRPYwV0zKhZKH
         zSphRNR5rgRem7vz+0uZK4nW7DIZYepeBs4BsDFkHg4KjRj7cQiOnuQTvM9uFsoa1WTd
         EiIQ/smj8ZuWiCeLI+1avpmclVZ/ZbC3PpDCSLrPO/knnI9lv+W8NzVYvvygOJ9JF1qb
         9huA==
X-Forwarded-Encrypted: i=1; AFNElJ/FF0dS4RSuycuE107Ufp4HlGuj9e5lt+XvB//OD/T6ZpixcyioKj8IOvABMaKULeLlQgPlmsIFr6nbcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfeY41ea7cntnUZSrIM3jom8tni3K23Hyo2TvHuJOIh8NN7gG0
	+mmhwxu4CMdBNIrjFaD/uNBGA1AYg4dkB+WBXYoUCFdvFp4t41spDxntgA5jLwipgRI=
X-Gm-Gg: Acq92OFgorG0z+1h91QnvqcstYAeHyR5EDiCPHLq0/nsdqWw13trs8yZGmcDDfbfJDS
	xQT2CmVM4tvLD9q9gjUAD0TU2Cu2iy/d90foyvLh+ZGHZ3fxmVsh2PYBTyFggCdGOfvZ8Q3G/j2
	TeHN0RoL7ROpPULTkIOn06ooTQWGz5uMB7ttAbjt5MorsZkScANE6Jid6J8iDy1puIiaGU0Eo0S
	TL7R37XhIK3GOJDVLjl8nV0P/lzlDcxmMt3/w0s4054ibLBptsysKJXFrH7wnGNAmwgcAzCQ7/o
	Ab5WVnppZjdv4UhbT5LjPekgq0Cn14GdAnyZ26E92H3H6v6I3MiKf60rt8oOJwmFvvt6bSa9cKt
	JVi5VWAKQbiXP5W5DXQj8EMVAoSWbA/q6KtGkjmWKgekDkJ2gPWmjAW9JDuQXhph7NQnPzAE5Va
	f1FaNuBS5yVjR+zOPdOk1HbkI=
X-Received: by 2002:a17:903:3890:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c69a1965ddmr27832715ad.25.1781597950906;
        Tue, 16 Jun 2026 01:19:10 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac631sm124267105ad.44.2026.06.16.01.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 01:19:10 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:49:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] cpufreq: spacemit: Add K1 cpufreq driver
Message-ID: <nffvtnb765pa72xcfhmxe3wepxpld3e6265s7imvldbwounkzk@jmrrhtrwau34>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
 <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
 <bd4s2icqgusnuujvrpoag4cniy3g2e4bumecqxt5yffl77aqpq@kxg4dj4c2wk3>
 <DJ9EFPG561VZ.1WGRYYHJ2W9J9@mailbox.org>
 <wjwkykv555gkeqxabsqcdfn4lomcopawsv7bgm4bydc5likhjs@p3ca3p7wbri5>
 <DJ9M2IDYE6XZ.20RN5AFBYNB9Y@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DJ9M2IDYE6XZ.20RN5AFBYNB9Y@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_011913_025223_37100003 
X-CRM114-Status: UNSURE (   7.35  )
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

On 15-06-26, 20:11, Shuwei Wu wrote:
> With two cpufreq-dt policies (one per cluster) and these ranges, neither cluster
> blocks the other. Tested on BPI-F3 and OrangePi Rv2 boards, works as expected.
> 
> Does this look good to you, or would you prefer a different approach?

Looks correct.

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
