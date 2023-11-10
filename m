Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47630C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8WFsjXsb2JgWZ98D0ECBpdKJE/soau2pBq75rbXYGM=; b=d1OEScd+BBGjUD
	sydCX8vuH4u+o9TIu7OSnn54j62PJLSbqLi3KOM3n8q6UXegEEPtZOAMksGM6fQWaNinwzCMfjnzc
	Nk3+IAlrxzFp1+wzHXxKmWs4wdYgdVnltoVx/gqaQ5KSOqQqUuEJ5tGPuE10pThKNxQwMJd1Obyim
	a6l5mDfepeiPM+mKo0D+WUVnbnMJAUJXjkXkfOovv4hkEmc9u0if6G7+X2RFIR1BAixVB893w2uJK
	R1KZFDvi9Z+Cs/9aYdBzx8qr4DeZNQdmm7eKLSlA7bOxEsggIW4TdwmjnZON1Yot0yH9FsbxexUoK
	7yBIUN0iCnxCfwO3RwpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1NeV-008AJn-2v;
	Fri, 10 Nov 2023 09:18:11 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1NeT-008AHk-03
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 09:18:10 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-282fcf7eef9so988193a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 01:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699607886; x=1700212686; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQTkE1ZnpGXcZrl7W6lR4eKSn0Z1KI5/u9IM9eBWdzI=;
        b=m7MGdCQc6mmjv5V5Mxpor6dzkh7dSrvJkEsduZR/vCPhMbAh9tr9AGGlIjA85e/1eK
         TYjSmxAC/9bKNitM9lU1jet9Tn7j+j44kLpN7byX4GWB0RW7wQTvnYXRjRRTOOY0iC7j
         Q4Rb+1J1NcrlEE4ERWfmLWAx15qU0+PwSxqTOggr7bDed+majibbJ5BPUmnF+GCaJ8EE
         mshYVDU9cTwi4tvEijZ2WlJ7fvkicZ92C+3Kfhl4YpWJEhbDpGPRqR4bFSUK3HTjesIO
         i7swqW4DneRMylP/rQbUJxMnaENjV2t66cgxQxlWvuGNjO3E3Bmp2jSu4Y86/mKalG/q
         yhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699607886; x=1700212686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQTkE1ZnpGXcZrl7W6lR4eKSn0Z1KI5/u9IM9eBWdzI=;
        b=dSvb7prnUDYtZnkaPpog0mCaIJxWlJSE7fWtIpcHVYwdXje1TDZ3KaACgfyysEB/mw
         8M/1Stqr37UewLC2IyHCYEJuu5QnW9ttLMuH5+FfaEx1CdUTEcnlJofYwHQsk2koTwQz
         Zu3kMupV2XEBuPdxFd/o6BRK5B/ML3DSsjVReCLTM7bzIOxYWA9V15uKeX8OjEkTmWWG
         6RWfvktjYXKRoddDQQgXjBEbhns2lGGJWNRqGuvY0m2Sffj53HWsZQztHr6b0VtHJKSg
         liRJzILO93qM7Jmp9XjvYWcL2thpCxEnvKDU2TrOB0yrb7HQpOCvOmOJOvFykzv9OKlE
         dkFg==
X-Gm-Message-State: AOJu0YwGaE7BJ5/rMuAJOYVZoQWHAOzfq2aGmNHSHsHJJKMM9LmLAdoC
	PUoNswNiI928+b1+2HNUTgAKkw==
X-Google-Smtp-Source: AGHT+IGife7skzKrRrmxXSpDW1iTw6SRyJPT40pz+mavprG4ApUvNEQqFPvzfzolUakrl+Owq+kyyg==
X-Received: by 2002:a17:90b:3887:b0:280:e0:9071 with SMTP id mu7-20020a17090b388700b0028000e09071mr4653129pjb.28.1699607885946;
        Fri, 10 Nov 2023 01:18:05 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id g13-20020a17090ae58d00b0027d12b1e29dsm1149227pjz.25.2023.11.10.01.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 01:18:05 -0800 (PST)
Date: Fri, 10 Nov 2023 14:48:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	lenb@kernel.org, robert.moore@intel.com, lukasz.luba@arm.com,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	beata.michalska@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	conor.dooley@microchip.com, suagrfillet@gmail.com,
	ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v6 6/7] cpufreq/cppc: Set the frequency used for
 computing the capacity
Message-ID: <20231110091803.2xqtodhyxtuxdbba@vireshk-i7>
References: <20231109101438.1139696-1-vincent.guittot@linaro.org>
 <20231109101438.1139696-7-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109101438.1139696-7-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_011809_054260_3C22CD7B 
X-CRM114-Status: GOOD (  10.43  )
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

On 09-11-23, 11:14, Vincent Guittot wrote:
> Save the frequency associated to the performance that has been used when
> initializing the capacity of CPUs.
> Also, cppc cpufreq driver can register an artificial energy model. In such
> case, it needs the frequency for this compute capacity.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/base/arch_topology.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
