Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A0F606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XHDZRLxz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sFGZXyIB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ujJC9D9EWX+wr+uXq6yXCKRN6NDKV7up44qbaWRVNIM=; b=XHDZRLxz6UNp8pk7RciFZmvlSS
	66NYCbl0n/fyy2ljA8w2TFCMXpOFkXmB6x3xgIeTlRaPGf+YXyDrfQQtpiNUwq+HLibbMgn8pqlP+
	/rYdbC7udrr5QobC/25eURZWDFb45sDaxNw53cRLf6B1WyHjZvcUyo0Arh5gdGTjeaK96wZ/yyDSS
	D3d607eFj0hU7HEVwwbeEBfGY9OlMdZvDHjsDhkVH2ziaWev5/vYZPRlrXrvqyQ4Sp/RI1oTcAfSY
	xlM5DQWJyV6YE3Q7P4Mmp7FjlBvo0LItKz70pHoLAuY5gaaGEgz3jn60KSMO/t94EcSoPNjz7sYPd
	GZAxc/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTH1S-00000005OHf-2xGg;
	Tue, 17 Nov 2026 11:06:46 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTH1P-00000005OGx-2Opm
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 11:06:44 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1a3c08d6928so6265920c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 03:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794913602; x=1795518402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4s7yJbpQX8syBD03XjGhRC32jwUYZoWTRv+UwUgeKs=;
        b=sFGZXyIBloaTZkSv0VH6bqnF5bjrhr7GZk0GMWw3W7+vaR8ZWLH1VJ/mV0Rn8krn55
         ATxgz1mw++5JULYmRAy/kU1gltaXx2tJvcQ+GDFIk5Gz+RlNsV3lU3PSPVcIMRsAC2FY
         n223MzjEWH/Kidg/5qoMQpsBDnuluGWPKgEwY3i4KKvWmMenNl+oiE4MWigwNfawoWsF
         /rjgOEtkBuR4u2mxqYNyYenOgtQgKVm1T6OlSRAc068uw6G0r1BUfHl378hzcJKJpxz6
         j+8vokaN5/+vPZrgpZwNJUiR018fcKGxHEOlR4+TPwrIugJGHCBX8q25d9cW86ItYwhW
         p8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913602; x=1795518402;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4s7yJbpQX8syBD03XjGhRC32jwUYZoWTRv+UwUgeKs=;
        b=0uNgrEJ9lqcBjWb5qmEsAbaMMA/Y3WdLUfNFuRL3W6ogo01reACA6CbY4jKqQPKKU9
         EULACXIR/hTThRuOrqTC55MHlLStMRnPrEF1XNTKfmoslpivGF6HPEoiQqqGnfRUzFAn
         IqWfJ162UWVh83Cp2YlJvM6nTyxJwoEb5YVep0ZDgtVfh9sQlLsbtF8QLfKGXdmUuo+3
         wIwph+faTDeFU6kAAVoZGbJdEYRiGOAbBZp0iRBrGTzl4//mY/w/CXDb5c+PSHyUv2oZ
         C7rkNXLqplTQa4QiaG8Q7w1uTvgKQMbQSi8umUa3MoBAA/Wlu/WYljXqashbjXo9glEq
         W25Q==
X-Forwarded-Encrypted: i=1; AL+hErGT87zHieCBb7v+S2RxHMlYwu0e2atTHDJejeLNbcyiIuIZyUGs6nxUWd11XnbDtMgzIAtKOJHsp0y1eg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8JUA+oUa8PoiPynSPDFVvb1oCxfYKnYn+pF9o6JF3HNJb5Fxfy
	Gt2Yro+8m4HxnG1Hlut92Ua5uioYilvmKy4ywSraMBqKDxxyHuj7hpdJREXi5IstW8s=
X-Gm-Gg: AYBFou2PN9LcPWHlySeFLqIBDH0B5PQBoipcOWokLR9Wl+C6Q0qZyPcMJFyuriuAGle
	YZK0YTLx5C3ARdVXGY9AOwBfRIaYOLqMwbh/t80ngJ9XOZ8tpVZ8Kb02QRljpydUF8tGIoetj72
	81HCduF9CNNH3q0XyP5DYr4XQKb9cWG9DwykEmmXHqyGd031txe9T20HDM57rQSzf0kgtzX46eE
	Ryu7LKjKUABsxA6B6sw4VJreawYMSIs8q93+19M4FwFdeK1A+ckEkS7Z0LWVK/IMn9SA6g3gpfx
	8prJeK+62iRyKjzU/DZlzKjAlrpuUM6yNKwvWca50BKW/83KfEHS/tKal++XQ/mYMdsyiwKNjku
	B2Y3l1+vEc6rHd20a+qEYqHoeG4dfwiu+2UaibUKrRi+tS6vPoXyqqr6l/3rAPkMwvNCLT6Azej
	1DaeCJYNyOU3Mr2QrcuJXcjRoRRZO1sRdHX8o1NlRdsaPtiwfWbOgl+bSRLDziadCbdhdgILrdV
	a2WaoZwU/IwfaORHukqYlYQzAfV70eXlq9PCXmArobUEOP8ZYOUsmfl9JnWYKlB4Ws0oqtKsFX+
	AifHa4Zn961t7aMl44JqfUohNTzOZw==
X-Received: by 2002:a05:701b:4188:10b0:154:fa0b:6df1 with SMTP id a92af1059eb24-1b5030fb7f2mr12989338c88.37.1794913602124;
        Tue, 17 Nov 2026 03:06:42 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm39194951c88.2.2026.11.17.03.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:06:41 -0800 (PST)
Date: Tue, 17 Nov 2026 16:36:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Natanael Copa <ncopa@alpinelinux.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Milan P =?utf-8?B?LiBTdGFuacSH?= <mps@arvanta.net>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Shuwei Wu <shuwei.wu@mailbox.org>,
	Aurelien Jarno <aurelien@aurel32.net>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] cpufreq: dt: Set the initial OPP to apply its voltage
 constraints
Message-ID: <avw1Pos5Je8piwvU@vireshk-B250M-D3H>
References: <20261111130430.10359-1-ncopa@alpinelinux.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261111130430.10359-1-ncopa@alpinelinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_030643_625353_79DCD21F 
X-CRM114-Status: GOOD (  18.84  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11-11-26, 14:04, Natanael Copa wrote:
> diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
> index eb15650f99bf..2646dda10aac 100644
> --- a/drivers/cpufreq/cpufreq-dt.c
> +++ b/drivers/cpufreq/cpufreq-dt.c
> @@ -153,6 +153,30 @@ static struct cpufreq_driver dt_cpufreq_driver = {
>  	.suspend = cpufreq_generic_suspend,
>  };
>  
> +/*
> + * Set the OPP for the current clock rate, so that its voltage constraints
> + * apply before any policy can change frequency. Otherwise another policy
> + * sharing the supply could lower the voltage below what this one needs.
> + */

I think the problem is valid and must be solved somewhere.

> +static void dt_cpufreq_set_initial_opp(struct device *cpu_dev)
> +{
> +	struct clk *clk = clk_get(cpu_dev, NULL);
> +	unsigned long rate;
> +	int ret;
> +
> +	if (IS_ERR(clk))
> +		return;
> +
> +	rate = clk_get_rate(clk);
> +	clk_put(clk);
> +	if (!rate)
> +		return;
> +
> +	ret = dev_pm_opp_set_rate(cpu_dev, rate);

I think this works accidentally for now as OPP core could have
rejected a switch to the same OPP in this case too.

- We should add a new flag to `struct cpufreq_dt_platform_data` to run
  this code only for the affected platforms and not everyone.

- Perhaps we need a new OPP API, which configures the hardware,
  forcefully, to the current OPP.

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
