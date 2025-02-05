Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F173C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Hc5kXig+ynDJWyvvjWG2q5bUNYK+jDRKNExiGsqNXqA=; b=px9UwOi/a9i3Ib9eRPiiQKWG8o
	1wjEEnwStY5Wz7ijjjvUxSMn28yeicnuSd51MtK5shaEW4DS9Vy3QrPcJ3PpOyB+Cfj7jgPMIuK5a
	5TzxSFSmITUESi8sHqcCi+C16kOdQOGPRr9fU1Hh6enJpMj4vZy8rrMKtl4IpHpVREFpxti/4L3HJ
	3HGBfblE0jA1E5qXgReo7GmiWGvBAdlBIjrdfLfiE474s0R3Tbjx4Cx9jzfCIHsXRoBR0SAqGtIKU
	Tj/XfAAC/9O57CUZudaHRyoaDXA6uQ5uRAyYh1zeWDyHwx54zP+Y76fUE6XetF80Sl89v1sUdI4IC
	Lz+OiykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhWS-00000003oUb-2Qx1;
	Wed, 05 Feb 2025 15:41:04 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhNM-00000003mGl-3i2U
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 15:31:42 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2f9d74037a7so2796402a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 07:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1738769499; x=1739374299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UatWkuu9Qgwg8ANhzy8M4m7Rk1sE6deB/rTA3GCn9Gs=;
        b=YlSt+j+2osoA0xii7xc8LzAWOAwXFcXU/JYZnMfeqrgZHQgTd0UAUPsKfWv6IC8fOW
         xHumPQOgCqLZK7XuN/fWh5AAcRWvMdaJAupM8otrNAQaXxOR+nn/1X6mXGbFPPo1OTwi
         h9p7jCj+9tox2p+8AVhacfiN48AdcgfuqmEBk5JDrihhurfojUj6/AGk1oo0TaiE2WpU
         fFfIHjL5lW4IhYtn7HKAqMthUfnnBOys4l1eNk91FBGn9qo+RHCRUeW/iJv0QcUxgxuo
         9DFu3K86rncX8AzZwsYPtooAMvEOJdLZqVtzq+MkyLwfKN8AHqtvM74oeiy5sdQ+kMeu
         fQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738769499; x=1739374299;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UatWkuu9Qgwg8ANhzy8M4m7Rk1sE6deB/rTA3GCn9Gs=;
        b=SD1igh2MgNdhhEicKlRmgbJotb0jXMthasAeGeB78rVUiZX6MqvyTxto7GZDWTonBv
         5Tzv8CGf9PrYr6fisPenjVfKX9uZE8kMmZ4ouBd3MGjllIci8b5FFXAfPhOrShfC+EZS
         KekDaP6l8l5Fg8t+f60WVLc08yGSSLWl5OJF8r/Eg7TSCGwmIOD7ERiVgbVNm+EqKqwa
         +fBnvnZhxkBqdajr1lvmmThzKqn7z2qdzecwCwducptnl7NDsADonpQt1jWFm5Q3vg9g
         Xb/kjvyRb2qer1CK069yPmFPO7+CWT58/bUTugGRDtgexk4ovte+vb0f2QZ34dLb8eWD
         Zw0w==
X-Forwarded-Encrypted: i=1; AJvYcCW3/plqraPa7TD/eMgR1mQYvUHBYQEEMkRLozlspAXj1OP3IdOWBZUNpV+mvWS/cZE7ZE+4Rf1bE9j7lg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdehp1fPQ6YQsUIhb75wgTR46UzJ1+p5kEzvUBotgSqaxM5Q9H
	gx6+FpF+Ov8JeU1gI52c8Hl5cAgJPxJHBd4JauNaI+pe4aNB5kB5HC0m4oCxo6g=
X-Gm-Gg: ASbGnctQs8ZC+pOY+dapnGJ8AHyZSLLWDpreRpYfHTJMtLSv6j9rfBWxpaywiE0k51k
	IsXJUuHkqhLhmf/Nu1Hm6oyzQ78YjJasl4s7yCUEk7+NSxVfxqo326u/S4FxZDuil6m+8TUCnz+
	iXhsXUU+i4U9dW4QI5iTOm+MG9+r+LqegTF/X35u9crCOqMfENxSrEGT8Yk5gc37NsifuIDuKPt
	2Fjh0X/5CU+EteLHvQOZx137naWnI8O6zV/EwyQBqGfcuUf/JlhwIKy5L5wpX59Rd/kQCCZPnqk
	25czjwR3kKIH
X-Google-Smtp-Source: AGHT+IFlrEqpwEqQKJm6jVKLRHs/j3zsT8RciURX3ceRV8XojffKvUsKNIOJn3B1ftJERTOXTnJITg==
X-Received: by 2002:a17:90b:5288:b0:2f9:bfda:49b0 with SMTP id 98e67ed59e1d1-2f9e079b72cmr5022165a91.20.1738769498039;
        Wed, 05 Feb 2025 07:31:38 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1d60aadsm1723134a91.9.2025.02.05.07.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:31:37 -0800 (PST)
Date: Wed, 05 Feb 2025 07:31:37 -0800 (PST)
X-Google-Original-Date: Wed, 05 Feb 2025 07:31:33 PST (-0800)
Subject: Re: [PATCH] riscv: Access time mmio instead of rdtime.
In-Reply-To: <20241229-cogwheel-kebab-3cc2b21096c8@spud>
CC: arikalo@gmail.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, daniel.lezcano@linaro.org, tglx@linutronix.de,
  djordje.todorovic@htecgroup.com, Dragan.Mladjenovic@syrmia.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-2dc5552b-3c35-4469-b511-3c6dc257b610@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_073141_180140_9DCFA445 
X-CRM114-Status: GOOD (  14.41  )
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

On Sun, 29 Dec 2024 07:09:13 PST (-0800), Conor Dooley wrote:
> On Fri, Dec 27, 2024 at 04:00:56PM +0100, Aleksandar Rikalo wrote:
>> +#if defined(CONFIG_RISCV_TIME_MMIO)
>> +	if (!of_property_read_u64(n, "clock-reg", &mmio_addr)) {
>
> This is a non-standard, undocumented property. reg & reg-names are what
> you should be using here.

We were talking some in the patchwork meeting.  If this system has a 
CLINT then it's probably best to refactor the timers such that MMIO 
CLINT access is independent from M-mode (as there's some patches 
floating around to make M-mode use rdtime on systems that implement 
rdtime).

>> +		riscv_time_val = ioremap((long)mmio_addr, 8);
>> +		if (riscv_time_val) {
>> +			pr_info("Using mmio time register at 0x%llx\n", mmio_addr);
>> +			static_branch_enable(&riscv_time_mmio_available);
>> +		} else {
>> +			pr_warn("Unable to use mmio time at 0x%llx\n", mmio_addr);
>> +		}
>> +	}
>> +#endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
