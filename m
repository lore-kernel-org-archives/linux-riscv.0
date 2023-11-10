Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0360C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 09:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkAbecCvCcIF22a7LZyFl8FTQs+m02AluT/QamBP52s=; b=bW2pZ9AYcGcYP8
	tS4BHJnDGorbfcZwUAmY1VUs+mn6+Ewv8rLW/BfSBIk2tp9wXCGoPkgNRhE4grthr4ixINBGMQzI2
	oY4XhJIp+CkceFbZ8hj19YDoHyT7VThB4a9Chkg+21Xyi/2BAzEHU1gaBFYWN/7M7USip3CDsI65Q
	VLX3rbBRq+R8/JrSGvR5BvzAylZZazT8IdoTCcgqBkSpCpu2lg3wvvvjBXrZu7fnIVddtNlsKotsA
	SNk6q5y++XVwrQQFgHELK8qGIf9zjRJPj1c6XXX4cEHRhm/BJPxKTg0haFjdlmtr9wO+waWxGo8Pk
	OQy4RBzShJ8f2EVxooUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Ndx-008A8i-32;
	Fri, 10 Nov 2023 09:17:37 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Ndu-008A72-2n
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 09:17:36 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso1677700b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 01:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699607852; x=1700212652; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9qMFA/4LVo9MaNuOmPJbDYsQ8leCjxXQe4RXEqsi7Vk=;
        b=r98T7fDazZTlTyKSe/CS5GIL0FwbWZ3R95yYye66dHdaDG3eV3rqfisDiD82lHZWWl
         VxIajCk1Hwa+tjefureZdeZx92sf0opJLmSauQCh7pV0RyRRYyMNxau0sfH2C9BPqeUG
         7DCPIQsYw6DILiVgIHVP1tlIplVesZVivruLNjPIXYe+ea3Oafq1tEsoM5Iq0MolcIne
         F8Ni+rm8IqYhGfgRWPF5p54MN/jQ/c7g4jcnu0IdHKSUsM0XQ8iRo/VVCpG5ecbsStI2
         bECu0R+gX+JZ8A/gNYFAov61Sodx1KFyMeh78POWq8RoiBM7De0MQRHdf2y2oehbUWT5
         FIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699607852; x=1700212652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qMFA/4LVo9MaNuOmPJbDYsQ8leCjxXQe4RXEqsi7Vk=;
        b=BWe6IXAftWBsSKa0BcTCzx5i3U2AXY3kPyvKUz/VI8X46O91qjDBdcsuVdpYzwYAnf
         /KDaBsqN3ovoTurGIamG8qSIPWOxBVDaDYQRKE9IhbYG5DydwhwsCq/8/+KNouv3ESeO
         ZEVCzwrNoZP9IoWbZL0uzH7h5UY1fq6ls7VtckeRDstQes22muEOLsLJVIG6Rj9r00Nz
         Au18LygK310fCyF56EHfqNqhYgsiaIrXLacLYdHUv5sgfk3YYe4tpC8gq/d0dfasSyRz
         hKwuJLXMgpF5oBJnL09VTlhDrWbG5pkDie/sUBUv+7q/Ju2T85w3xQ1fAJaawqN+4RYU
         Z21g==
X-Gm-Message-State: AOJu0YxXvqkLuZtPgiq0L48+4WkzL/NZ+k2ZdqTElCJPb3czlOiGE2gn
	lmUBzi+ItlXaDlmaDd9sUB8jtA==
X-Google-Smtp-Source: AGHT+IEf6ivgAkw6yVi3FBgNRxGS3TsVvGiByXO2mRhR+nd07TngiWoOOOYFgaeien5HK7d1Y0M7oA==
X-Received: by 2002:a05:6a20:f3af:b0:153:353e:5e39 with SMTP id qr47-20020a056a20f3af00b00153353e5e39mr5947121pzb.51.1699607851729;
        Fri, 10 Nov 2023 01:17:31 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id g8-20020a1709026b4800b001c771740da4sm4889837plt.195.2023.11.10.01.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 01:17:31 -0800 (PST)
Date: Fri, 10 Nov 2023 14:47:29 +0530
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
Subject: Re: [PATCH v6 5/7] cpufreq/cppc: Move and rename
 cppc_cpufreq_{perf_to_khz|khz_to_perf}
Message-ID: <20231110091729.jssgofhlcye4juev@vireshk-i7>
References: <20231109101438.1139696-1-vincent.guittot@linaro.org>
 <20231109101438.1139696-6-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109101438.1139696-6-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_011734_918240_655A05D1 
X-CRM114-Status: GOOD (  11.04  )
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
> Move and rename cppc_cpufreq_perf_to_khz and cppc_cpufreq_khz_to_perf to
> use them outside cppc_cpufreq in topology_init_cpu_capacity_cppc().
> 
> Modify the interface to use struct cppc_perf_caps *caps instead of
> struct cppc_cpudata *cpu_data as we only use the fields of cppc_perf_caps.
> 
> cppc_cpufreq was converting the lowest and nominal freq from MHz to kHz
> before using them. We move this conversion inside cppc_perf_to_khz and
> cppc_khz_to_perf to make them generic and usable outside cppc_cpufreq.
> 
> No functional change
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> ---
>  drivers/acpi/cppc_acpi.c       | 104 ++++++++++++++++++++++++
>  drivers/cpufreq/cppc_cpufreq.c | 139 ++++-----------------------------
>  include/acpi/cppc_acpi.h       |   2 +
>  3 files changed, 123 insertions(+), 122 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
