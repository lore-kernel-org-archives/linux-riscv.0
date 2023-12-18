Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93160C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 06:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbH9cFe9hJeHOGJPe8IbVhjnA+b7SGliT5wCCKRw1Y4=; b=bhx5DaCp4S+Jg0
	ZF18V+kLdJxdjoK1mY+cdyLl/2go6F29xrdu+IkmOezLYKXnA7LZV3qsBX6J1Dl4MWD7nFN8IOnPC
	4KWcdhZQd9WduPqZwANV/QO142G/in2yWyMvVbB6oi4+o28B30dW6X6WFTEIRzoeo1yXADNWpXLh7
	80scAEJSivvbohcVnIt/w6QDKxCp6F+RaZUz1hMZRS6dy5dmT67hDsWXOZRoAdDhWvUcMF/+ijp1Q
	3aE3iPXNrstf4KinmPb/bpC00OWOnRCwGuTxfDu7tQ7HLQNGXbEAqZOj0sU2KyFMBxJ7VrUnL2fbA
	6lmbh8xMOiFMMTgGAAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF6pB-009Bo0-0c;
	Mon, 18 Dec 2023 06:09:57 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF6p8-009BmT-1W
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 06:09:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d2e6e14865so8218315ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 22:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702879793; x=1703484593; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4fv33Fm98eoYxsFhCy3k/IYwg8anoZGWSZZeryLa0Lk=;
        b=gZ6gKIr/1d5YLfG4FH6GmSj0JDARcqQAKmQQp7SkZZC8FWqIi+SRnxo+nZjnpGPeAv
         HMgjyTZEkt5z4bXnNSm3GOOl1ihzAfBr0IwiNaPodPSeCLCmJyqSTj6D/FSRWQHo9cKY
         5SA+3RjAIN6jp2vrMSQ/VPSycT4XF+Urro7BWcRRTUPrqraZazmcq/FWGfQAAvlGLtmJ
         irKWWs9TJgrMI+9P/ZpCI0b47qAn6Xm4T2bkrT4EVbDtPul015bXjJ1Z0URN+cyBzdJO
         v2/k5FiKArRnAg5sWD/NRTj6qs+8jXWSWRtsxtwaqm7MY1BUAAQxSaWwSoAzcd9MoAYT
         2vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702879793; x=1703484593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fv33Fm98eoYxsFhCy3k/IYwg8anoZGWSZZeryLa0Lk=;
        b=hEPo8TRm44bTvff7h/xTPdSQ7FgqspQJVmOfBLwISMbWnOnrjnGRnFwe5zEFS5Cp/X
         bVzk6ETR8Nxp5LrVtSNk6SfJHoVHU7MfUd8MkaYGjskNxWbwAoJ8MfPsec20x6M/oGwI
         Lhz0pe5as0T86NwXt/u25JgqxKfTiGvcmLmlS1KaTjSCA6yGLVutwghSSxdSlpNjAjfl
         q9r9o7TNJV+YjeeAO0uLgtp91F2jCt6Kg/taZaCtHx2mFi7bdPCmFZPV4iP7fdUWARBb
         vrNPd8SZTQQYSi8neH2GCJE0iwMYfuBSuhe8W5HU8jXdkOrXhmYBIOwm0kITGrBuXcIr
         ajsw==
X-Gm-Message-State: AOJu0Yycn5eey+bRro4sDZZqIqvBlQXN4UMqxs0afdjM4uElfTkY6uBf
	zH1EE9HfrnMJx2jB1vcJD0EXkQ==
X-Google-Smtp-Source: AGHT+IHO/9Xk10TyLpqn8u0P4FpfNwnhyw1y6P9qlEWj/EdN4sfd0o4DUGEMCVK2HXlQ7b1MpZUXAA==
X-Received: by 2002:a17:903:2446:b0:1d0:6ffd:6e6e with SMTP id l6-20020a170903244600b001d06ffd6e6emr8491684pls.102.1702879793608;
        Sun, 17 Dec 2023 22:09:53 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id a18-20020a170902ecd200b001d058ad8770sm18245931plh.306.2023.12.17.22.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 22:09:53 -0800 (PST)
Date: Mon, 18 Dec 2023 11:39:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev, palmer@dabbelt.com,
	paul.walmsley@sifive.com, rafael@kernel.org, robh+dt@kernel.org,
	tiny.windzz@gmail.com, wens@csie.org
Subject: Re: [PATCH 4/5] cpufreq: Add support for RISC-V CPU Frequency
 scaling drivers
Message-ID: <20231218060951.yhhyini4neyusyxv@vireshk-i7>
References: <20231214111702.xdd7qlcrpqh74i3j@vireshk-i7>
 <20231215151723.46409-1-fusibrandon13@gmail.com>
 <11b5aea1-7c6e-4be5-ae01-9c4c869dc98c@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11b5aea1-7c6e-4be5-ae01-9c4c869dc98c@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_220954_585904_B183DD87 
X-CRM114-Status: UNSURE (   7.51  )
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

On 15-12-23, 15:09, Samuel Holland wrote:
> Move the option to the main drivers/cpufreq/Kconfig, like QORIQ_CPUFREQ,
> which is also used with multiple architectures (PowerPC and ARM, in that
> case). We don't want two options for the same driver.

+1

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
