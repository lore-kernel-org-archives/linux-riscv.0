Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219C0CD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 06:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYptJu3mYcH7p28EXidjfcmdF2wIoL1gKt23Xqh6bms=; b=aKz0duXox0XZ5r
	2WKdQh8gUhbpJtGj0bqXbLW0EJESQx03pmpaXXFq/f71paKb5hAwoDqx0vIUp1A71bvyGsonjvbXj
	skqDJpftUvERDrwKu3NsxSmmufV/NsCZ8AENUHNKHrMyWWTeVaChR3rTygcX68MBAvr8vX6irBZVI
	3BueNJZuBQjj2Eyipk5UN6If8fUMYM36xAfSnWZVs0B6GB+i/oWuOdpHx/dHWpMo/cutfodnYqK3K
	5EKff1omdSi//vtH3vJTlb/84VbHlmll6eBL86j8gMJbfKrsxLZpFVZpT/5FgZEPQynMtMlIK+yih
	dAbMHdSIe7Htk5ejhHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0uP-0000000Dh7d-1bTY;
	Mon, 15 Jun 2026 06:34:57 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0uM-0000000Dh7I-3cmK
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 06:34:56 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8423f236418so1544818b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jun 2026 23:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781505294; x=1782110094; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpTWnKEfXWiCzl373nMMsDrR/prBlQwjYUYc6wVEFfc=;
        b=Z6v0Wg0Ao718zUrgqpweggbXjPHjIvGCBqaxk7gYaUYLMCr/mSSoCMj/weh9zO8NKI
         ZA4H7PKd5Pctzv2sr5SR9l8w9rhTuILZZ22VpCCVA4w0SsLJfR9cMWZ67GcI/SKaFcQ7
         WRcKPLgx2B36mV3vhyg1yKiLw8hKPTzkggRaBgBLB0o1RRjuOlF+EjR27jxAkITB5gNE
         M+smTL6vuyyqN0hc9ou74ln36Nutz2p3yL6vnMyT5G9aZ7LHzV4A4sjWh1C4C9S0Pm63
         aeH/0g1+tLGMm+omEpEQNAbMCRewWUmwrVcVx5lTEGtxKGg/M2s7Tkdvxjgfs8iK6TkQ
         5exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781505294; x=1782110094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpTWnKEfXWiCzl373nMMsDrR/prBlQwjYUYc6wVEFfc=;
        b=WIog1Wclif38gZSb+DFp2GHgDZURfz+4E/O23gQULbEJ7cOHW9nMvKozObULD5rlao
         z5jaZBhVU68FsqQyUTzCwH1UTkqCCL/c5J8qqIdQuJOAErNsP39+ZUBrNcRZRQrN6m/4
         GgyRhAqcBYrL/DssgEH8SkGgm7ZfHDpEkD0ihI5ngPQ0Ozj1gp5/h4jzK6Byo1psWtDx
         VnO1Ribq6ivfR1qBXXFQIiRyhhUDrTnito4R1gYlsa3PBesTsfkdWWt5MJ8IGmsqOZUU
         cQeJVGce8RtDKFGF7UCtDe0AFo6zdOiEbfMRsdtFKeuSDNVMaqGkminsM2DoSbHLcZ+w
         kXPg==
X-Forwarded-Encrypted: i=1; AFNElJ8q6FN2mkfB31KhXDFUk8i5efORN2xfKsK0a6pHGTRwHfPY9wHd6/sgloV7v2f6Ed1jdb767wSOASMo8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhFVMI9RfFzCjnsaKTLvhBhGy0Illk9AyqhxjGW95+U5QSEWg1
	NVXI7XYY27JxT842OvukSqsU28mKmO5sJBMNklpxjxfEEGsbKhJqnLEr74MrIXXaso6Vz3BpEYL
	S2ssU
X-Gm-Gg: Acq92OEs1qsPnsb8hMnWCgT8r5dKQG2qJyeO1wnglhQWpz/5NuBl9tHV1zOvc1ZLS+S
	tU3E4xZR/zwlR2fEjk0HqqJ2dQwyr+DNDo4ghina4Bzigl2D/1sQ1HbC4shfGBbt+932BwIK9V5
	8B3Qgn0eOnKOMljaginz5LK+jiuPs8ELkMEtwNGn/lBoEGbodZ8l9yEs4uljoleBP4w758FfHdx
	07hrp5DOn2iZim8TIz/AVItHelO9nk5JQrdjRNUqv7Yx9zP+V/Na9OTOYQAs6oJGsDLxEMQhT7+
	216DXqXx/ScOVSYl189ut9CGMQLYvpBf1uCTu6ahk6VJtW4CVU2uwRvXBMpJ/kmthGJM8g4QWQ5
	LcrxMLr160keHwAVtmfFr01n4a9/SZrPqdPAapSL38U95Tjt1scXO62Wt0rXFlz734/VoU1eBFu
	nKFjEeHe1Q0rUP66tfIZ4dqlm2n/JgZYdQwg==
X-Received: by 2002:a05:6a00:891:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-8434ce784abmr13630133b3a.30.1781505293590;
        Sun, 14 Jun 2026 23:34:53 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b040718sm9297405b3a.51.2026.06.14.23.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:34:52 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:04:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] cpufreq: spacemit: Add K1 cpufreq driver
Message-ID: <wjwkykv555gkeqxabsqcdfn4lomcopawsv7bgm4bydc5likhjs@p3ca3p7wbri5>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
 <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
 <bd4s2icqgusnuujvrpoag4cniy3g2e4bumecqxt5yffl77aqpq@kxg4dj4c2wk3>
 <DJ9EFPG561VZ.1WGRYYHJ2W9J9@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DJ9EFPG561VZ.1WGRYYHJ2W9J9@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_233454_919206_D4D8A653 
X-CRM114-Status: GOOD (  14.46  )
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

Hi Shuwei,

On 15-06-26, 14:12, Shuwei Wu wrote:
> The clusters have separate clocks, but they share the same voltage supply.[1]
> So two independent policies would be unsafe: one policy could lower the shared
> voltage while the other cluster is still running at a higher frequency.

No, both will vote for the regulator contraints using CPU device and the
regulator core will make sure it doesn't break any of them. This is what all
frameworks do, regulator, clk, etc.

> This means they can't use different policies.

This is incorrect.

> From a hardware perspective, the eight cores of the K1 are homogeneous,
> so using the same policy for them is relatively reasonable.

Right, but this is inefficient. One cluster can be idle, or in low freq mode
while other can be in higher. They MUST be two policies.

> I used a K1-specific driver because cpufreq-dt only manages one CPU clock
> through the CPU device used for the OPP transition.
> On K1, the policy needs to control two independent cluster clocks and one shared
> regulator, so the driver has to update the second cluster clock explicitly and
> keep the ordering safe: raise voltage before raising either cluster, and lower
> both cluster clocks before lowering the shared voltage.
> 
> [1] https://lore.kernel.org/spacemit/aeaXszeaE62rM6BJ@aurel32.net/

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
