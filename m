Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C129C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 19:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZRtYL36CxWRFIHW9MpSyKPzHxHy8TIpxsRkBpS8gPpY=; b=eKXFQQ/+M0zHmy0FGzGPkljYJu
	LAkChUeBTveB5ocDb3mUdDpurUp+7r1iCpJCfvPM1tLcnOoYBfxkLqNVPWukp0Lgwd4LIKgaKn7eu
	d+SOHddVlBIF3OuWS1YOS5TQxEZzvEtKehV+3YmGj1PjmdkkL38+38ZxZCubKnSwLFm+Zlc3Z6Fve
	Tq0KKBnVkcVn9AZTFF51gnemDjC32dF8fW+wivCh4Gi8yHfAuBn0XL3TA/gp7/WhZaL7zPgPwuy26
	qgkOdRRJSGcXJFL4akOE5RPdJ+To+0KXwC7tAO7CmwDEE1PF5OJ9Lp3SMJ5iwReCEDxqjVuTp20FS
	hCmKcMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5ukd-0053za-J0; Fri, 07 Jan 2022 19:18:11 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ukZ-0053ym-PK
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 19:18:10 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 d10-20020a17090a498a00b001b33bc40d01so3018647pjh.1
 for <linux-riscv@lists.infradead.org>; Fri, 07 Jan 2022 11:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=P06hzfcfIH0IXgLIP2r290wgSfaqspHtXhfZpQaUhyI=;
 b=IgZ6AQQzyPrjQQkKUS8MoyeCDGYdDN3XuALVhvUMByWXpSIxeP10zUhpShKgf5MRUa
 Eh4Wst88OPYg7V5vv1cbRV7KcGS/+t0iXLxcRVYzvxKldJMwWVG9ZU/ZRweIFwt55cZz
 PAhj1TlxLsJeq9x988ROVGb6YYRJqTHfNjgCYAt8nnCk/6NS6026OPCZmX4GeyxWFppK
 Kst5OyZBBZZqGwSADCVu2TMWeFgnV4DRGZbBQwN0dDQienhS8vWECimv8W5q5tv7ZDrK
 nyEtA1xGkVHojmkTwjg1T4nEUq3qBNnFQxnORqIhOLghw0P4h+grfyuu/dvNoZVWdcku
 N8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=P06hzfcfIH0IXgLIP2r290wgSfaqspHtXhfZpQaUhyI=;
 b=vtMZmgac9diqWcO+j+Qj5k0lHJuEed1raPrQWhf3A/wbHLA/fj4RGJZoHK7ljwEKc7
 BNSI5txS2jglZp+R+vXIbMIsXtOfYcxbypUVGbEwQui8CuooAWeG6XMXsXQfJR72UQWZ
 4jKGjP4+kn92hHA6c2/B9KZf8ViAtd5Twvb6c1ZMvrIFPQUQPLLBjO8vScxQ6DFtZHtq
 TauZ2F9yVuB6bEQePQGTH4xLX8MGeqMLQ4lvPkHOCkzf3l0YvBHaze+0TJXDyiD2FW9E
 yj+lF1foFhdkPAVC3nrQrb45skjPRFCyNkuPO/rcdWp23fV2rz/JEl2wW7xjoEAZsK+X
 6CUQ==
X-Gm-Message-State: AOAM531HSk90z+RhxDo1vWMAnkgUraXJBhD5l+mdhnaSOOuICOpLOp9A
 V02L1gVrv4VHGHV0foF+yoA6mA==
X-Google-Smtp-Source: ABdhPJyzHkAFz2bmgdBO56+zkfils+jFDnKCYaTiIqCcfSL4/dZJp3aUIBu+9dp8YSahrwSmiUvRvQ==
X-Received: by 2002:a17:903:2486:b0:149:1ce1:d45d with SMTP id
 p6-20020a170903248600b001491ce1d45dmr64219867plw.57.1641583085394; 
 Fri, 07 Jan 2022 11:18:05 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id l145sm6330979pfd.117.2022.01.07.11.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 11:18:04 -0800 (PST)
Date: Fri, 07 Jan 2022 11:18:04 -0800 (PST)
X-Google-Original-Date: Fri, 07 Jan 2022 10:18:54 PST (-0800)
Subject: Re: [PATCH] riscv/head: fix misspelling of guaranteed
In-Reply-To: <20211120142608.2068809-1-georgedanielmangum@gmail.com>
CC: georgedanielmangum@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, alex@ghiti.fr, vitaly.wool@konsulko.com,
 anup@brainfault.org, 
 mark.rutland@arm.com, ardb@kernel.org, 181250012@smail.nju.edu.cn,
 wangkefeng.wang@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: georgedanielmangum@gmail.com
Message-ID: <mhng-047fcd51-673f-4bb7-a19f-beecd00667e8@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_111807_915213_2214993B 
X-CRM114-Status: GOOD (  18.06  )
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

On Sat, 20 Nov 2021 06:26:05 PST (-0800), georgedanielmangum@gmail.com wrote:
> Fixes misspelling of guaranteed in comment describing why fetching fence
> is guaranteed to work when switching to kernel page tables.
>
> Signed-off-by: hasheddan <georgedanielmangum@gmail.com>
> ---
>  arch/riscv/kernel/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index f52f01ecbeea..469eccd3780f 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -135,7 +135,7 @@ relocate:
>  	/*
>  	 * Switch to kernel page tables.  A full fence is necessary in order to
>  	 * avoid using the trampoline translations, which are only correct for
> -	 * the first superpage.  Fetching the fence is guarnteed to work
> +	 * the first superpage.  Fetching the fence is guaranteed to work
>  	 * because that first superpage is translated the same way.
>  	 */
>  	csrw CSR_SATP, a2

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
