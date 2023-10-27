Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14949C25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5zMiReiFVrF6mPte9xTaHclhG+jmS9mj2HgKOLhUnQ=; b=RRwxEftklojK+e
	s0BYnysjQ9gSd7VgqiOqDq5Owrb71WnJ+Fk4Tbf956xnHf2fxHlOazjLwNbUHfknmnLysJTqxIsTr
	NlFTdpBKgt4KIGOZ0FcNZyk4FikN/ZT55uT22gxjGjyOkxtx2GJ6uMY2Kb1FG85OUNLrMqCJ811fQ
	e3Wroy4pkV9MLkWsh/o3G1bNA1nQbfwet3Gr+HKEY/GK23ukksuUJ6/NlKuiT8yLAARhqlvqju4Ni
	nEzhocihSyOjepGDysWUwG5PivQOZr8q66VQXAecnMcVz5qx5f4pwdGzIbhJumSPEqJ0cFiaoQi5l
	PDxRKaaESKBvYGd5tOOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJIM-00G312-0F;
	Fri, 27 Oct 2023 09:38:22 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJIJ-00G30C-0m;
	Fri, 27 Oct 2023 09:38:20 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-533d31a8523so2788039a12.1;
        Fri, 27 Oct 2023 02:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698399497; x=1699004297; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hp6XVPEWlKxTXMoDywd4XYa7dN3u7ZNoCSpHDxvreZE=;
        b=g8CT4c6CFO+mG67jv6myUdrnVNvIIfguc9BCzcIFhtwyWy5bOseHYFgY5P1vhQy76r
         fCL1ptoHhjVixJaF70qZpE72MW91Qt5AyyYtySA+o3+UCIQIWSpteIe0GAbX5uNSSKjo
         SBYVkDfoj+tJNQ8i2j1mp4DEHVCT32C1nrImTAflm2QJkVHWw255siaH2hbGNxw+I1wI
         sEvD/XnOL2I9TX03r8cuS6CEWv2WO/axfoX+Rvt27xlAkJGkuHXt6zTs4exlDjPJeOss
         3xQ9UL7Spt7mye/R44+kgFk+Tvxfs3q5v5Xp9DfnkN8XIlePko/i1VLjgnGhl3XHE89q
         QZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698399497; x=1699004297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hp6XVPEWlKxTXMoDywd4XYa7dN3u7ZNoCSpHDxvreZE=;
        b=As/QsrXV6MoL5lBSnYVw1LX7l5sk/ECtZWP2CoI9hnr7Pve3eHBmNvoE9VoC+4VKDx
         bffwrG4/S/qlftbRnig+43NvnrY+1e/wAenEGjGkim1Oap1CQo1hC8oPwQX8U/bkh/Az
         562XH+qYl5IUviR3O6gpISU3UCM7xGWk16hHozv5g+CDUND3kqEfMUQUZovUqlml4aLc
         lHle8uHgQOyDEbWJW29/eC5jYaddWQWBtvPSZk5IstN8ENgAI8g0L2kO2/BQT6QjLNEz
         d8TwOFeBwKeLlMGo4U+swfO8rck0+K+xVZjDNwH0j6O2LKFZewPtqcv1FFWArqJYpiJS
         ygqQ==
X-Gm-Message-State: AOJu0YyGbY+4I9NUEORsDLp2z7ouMP5eMPYdVknuJW1vaVh2BaWJ16DB
	LXvVi2iw/IOO302n7ql7gDk=
X-Google-Smtp-Source: AGHT+IHzI0aCMNXRuDnb9VuStbNsXJS6VV7XmwVgqv9jAK1lAjcDkw3Qxzt8OId7LnzFUt6r8UW18Q==
X-Received: by 2002:a17:907:3f20:b0:9be:e278:4d47 with SMTP id hq32-20020a1709073f2000b009bee2784d47mr1882058ejc.27.1698399496568;
        Fri, 27 Oct 2023 02:38:16 -0700 (PDT)
Received: from gmail.com (1F2EF1E7.nat.pool.telekom.hu. [31.46.241.231])
        by smtp.gmail.com with ESMTPSA id hb26-20020a170906b89a00b009ae3e6c342asm913477ejb.111.2023.10.27.02.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 02:38:15 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:38:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com,
	lukasz.luba@arm.com, ionela.voinescu@arm.com,
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linuxfoundation.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v4 5/7] cpufreq/cppc: move and rename
 cppc_cpufreq_{perf_to_khz|khz_to_perf}
Message-ID: <ZTuFBeVIjA2hjbPh@gmail.com>
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
 <20231027080400.56703-6-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027080400.56703-6-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_023819_276958_90010DEB 
X-CRM114-Status: UNSURE (   9.66  )
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


* Vincent Guittot <vincent.guittot@linaro.org> wrote:

> +/* Look up the max frequency in DMI */
> +static u64 cppc_get_dmi_max_khz(void)
> +{
> +	u16 mhz = 0;
> +
> +	dmi_walk(cppc_find_dmi_mhz, &mhz);
> +
> +	/*
> +	 * Real stupid fallback value, just in case there is no
> +	 * actual value set.
> +	 */
> +	mhz = mhz ? mhz : 1;
> +
> +	return (1000 * mhz);

Nit, and I realize this is pre-existing code, but 'return' is a keyword, 
not a function, so the parentheses are not needed.

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
