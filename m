Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F1DC77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XCo4Gz0oea+fdMj/MAYskZtNNaRsZm3/T6dV43LBJg=; b=QYiCBU2P7P06jP
	k6a7RB3t/oW47k4hGq3toqJzGZSo8t9+KDotNm9m/PHvXZTtJBPU1M46FQ6W0NNLNhlyaygS8KmD5
	LQ7VytLxpnzzeQ2lo4ah69XFoKmRzn3OJ9aD9A+1S9UxS/rzoNX8+nrCwg7OOWEGzVrMPVoYl487D
	gPmYhHG12KFuGunICcNSSUlJLryWJ21CfZCkjON0j7e1O1W1g+4p8W/ro+dEpYu6ljunbG/l1ZPGn
	nawcGMow122FVmXnIpzPPzy2Nd++TM0rbNJ634EmSnl9QZYW2pVq1K9esLi/vpg3+nRF9fr0Els56
	pZURtun2Mcbgg8EfbOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psN5k-009ipk-1W;
	Fri, 28 Apr 2023 12:20:49 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psN5g-009ik2-20
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 12:20:46 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50a145a0957so16614505a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682684441; x=1685276441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GnnxJC/OUshYooHsz1QQh8YEyfrU6zYiR5EaHZYQGjo=;
        b=hcKmT1rZfUbs6SLCw+L707tSSylwm0tH/5kdN29nzQaSEwAi5o2Ivg8aJLxY8G8mco
         00BnIge4SNFj0DkPpKyYGvCIkNpxDOJvU4UKiw8O0AwqRODRTumCOc6CH6dnZ9Th/63y
         CzpFQ8l3MXQUef72IZ6PPRD3sO0PcWDKWhmbHRLix2LGN5ywMYur+Asjg6HkojUMbknk
         6SjglWxiU2MlXFom7TGCLZY9H87Ikzc1/+jqGbQmTtQTYmmCAXDMUp8LBWDWDCmmlVsI
         7T+QqclJhKv4orvLKf9MiGIHMuh+eRkQ6IFkiwQc6uzy8lgw12cAo/VaE/x8sDq7suLK
         Tntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682684441; x=1685276441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnnxJC/OUshYooHsz1QQh8YEyfrU6zYiR5EaHZYQGjo=;
        b=cYfoMdfwDVg2pVrhuQkE8W5BlPC72Aju7n0YZocVO1cTzlahbZ/vQZPWNqjlL6KJFq
         4r6e63GeR7o8102g8tBUE/w0ygGYKV3GmlLhVDNQT6OVdDCyLkrVXvWIYWTPT7CNIOIr
         r2WXQmSWiceAouMo/O0V6DNOVsgHmbex7NF0YTvgDRs43kGDuxeKahEoVF2UoIsl2rAO
         lBKASIcI1Z+CXszktJm+y7OrhmmNimtZ0xbW3EZcVJM3/2ksw66lEEbGF7L4JQtQBniz
         c2K4JAevjVxqJzcidwASpCtTmbY3EDrVIAB1Ddblm1EPq9bssHmnhVSmVwohQZwIeAvb
         wLGg==
X-Gm-Message-State: AC+VfDxqeLlQKRpdCsot+6mWlKD1+Fksoix+szvi7PpvYcUuFKQxfCG/
	hsvhW7dRUAVDF7AFKBfENt5yfA==
X-Google-Smtp-Source: ACHHUZ67lj31zawW4SweLmq4ntxfryIPZgNl0tp/ZKZj7OlnH5rbmtwB/XFRUH3BF83fWHs9dYDy5Q==
X-Received: by 2002:a17:906:728e:b0:94e:6eb3:abc4 with SMTP id b14-20020a170906728e00b0094e6eb3abc4mr9678802ejl.4.1682684440749;
        Fri, 28 Apr 2023 05:20:40 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id gj19-20020a170906e11300b0095ec8dfc439sm4358565ejb.166.2023.04.28.05.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 05:20:40 -0700 (PDT)
Date: Fri, 28 Apr 2023 14:20:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
Cc: linux@yadro.com, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] perf: RISC-V: Limit the number of counters returned
 from SBI.
Message-ID: <nz7dxazar52et54ia6kgl3onsuevq62pm4lffdfcnsrxgormga@a62zyukdxyj6>
References: <20230428110256.711352-1-v.v.mitrofanov@yadro.com>
 <20230428110256.711352-2-v.v.mitrofanov@yadro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428110256.711352-2-v.v.mitrofanov@yadro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_052044_713037_64D39A98 
X-CRM114-Status: GOOD (  20.34  )
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

On Fri, Apr 28, 2023 at 11:02:56AM +0000, Viacheslav Mitrofanov wrote:
> Perf gets the number of supported counters from SBI. If it happens that
> the number of returned counters more than RISCV_MAX_COUNTERS the code
> trusts it. It does not lead to an immediate problem but can potentially
> lead to it. Prevent getting more than RISCV_MAX_COUNTERS from SBI.

I recall suggesting we do this during the KVM PMU review, but I guess we
forgot.

> 
> Signed-off-by: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 70cb50fd41c2..0183bf911bfb 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -867,6 +867,11 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
>  		pr_err("SBI PMU extension doesn't provide any counters\n");
>  		goto out_free;
>  	}

Need blank line here

> +	/* It is possible to get from SBI more than max number of counters */
> +	if (num_counters > RISCV_MAX_COUNTERS) {
> +		pr_warn("SBI returned more than maximum number of counters\n");
                                               ^ the

This should be a pr_info.


> +		num_counters = RISCV_MAX_COUNTERS;
> +	}

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
