Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0054CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 22:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=G1SeQcXQmm1NUMKOsi0y+S83IaSpSh/NyYUMztUUhKk=; b=N20j2qnf8I0ymfqVOhhMoEQg7z
	sYg+xDx+MdrVki3MEII9h8xlNMZCkC1fqSVuvHb477CXlIi8MW7yPqA5709pcfSLlingpx61rrXmU
	HVYCy7tUBwQm58F5lbwoZsSlfT8NFWLo/lJ0tYQKgL4hHBKUZ25AM6CtSyjcc4WboncNn3jIaVWM+
	cooG/TKqoB1Dft3Hu3NqfkWRmCy5ZHpt06Wv29uEmxPJznSuk1H2KPg2Zr4HYIx1bV75LBglMurL2
	9TLZ7MG8D1SXUx3Zj1ATGY2IOugComlVooPqy1MMdI2mG5IvG1aiF8snDkT5PKGn9xn7WE2tO+Dsy
	ayK6DuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhfHq-00FFwQ-Vm; Thu, 21 Apr 2022 22:28:31 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhfHo-00FFvX-3D
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 22:28:29 +0000
Received: by mail-pg1-x536.google.com with SMTP id r83so5828952pgr.2
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 15:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Z/WL4sEfilsdTNMCzpQ4AUYKUU/6fA7UgWxPOldA7e0=;
 b=DCXNDtgEIbQlslJM2sme6aHreWG5byjxFkM19clb/BPTLe3LO+1bN8luGxz7gcFLH2
 V8TxBt5zvjxtLWo6QtqGc5jeNy0BsSR5R0xNy7AKvReXzahuYaLSPkLjTf+Ue/17I5wx
 81dsfmAdQFC3P71z0Hb0cx1qBab0qVQ1xwNEVrEENevqHC9SLaPohX4yodxTix65LSOl
 7yS8Ug1GH6K7lJA9I6nbv9VQ3sst2BzrsWmk6t61DZfbBJaKHohxxlxgehgkJfsXuvCo
 nytHu38tVwNI+SN18mZjCgcA3niWmlGT1Ly3o9boYquSP/NMt820jyG6cGjK8q6VheRE
 vdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Z/WL4sEfilsdTNMCzpQ4AUYKUU/6fA7UgWxPOldA7e0=;
 b=dXuWXacJ5W5Io/0HSw0y28YduRS6+IBnp4Vny0F1gvVzYQIFHGIHjByRMILlTcprbU
 khp+9TKkNXnwF8q/p3gFeLY6X8Qm3XgBm4y31xSUCxuDrhJFkb3dxeU0xcl3SmR9Wbyo
 2XzpJHSrlbbOxIkpg9bl0Yin/EJKrVl8Q4FMsmJ1Jy6K9KjDzX/ACJk7GoSyjkwWcbkv
 /8dVnoCVxXvh7z2iwH18edhivMg7JA5PQV84hl68Tag2oOEu6HTQYLov6K+YscTSWtg2
 OpBVv9CWHdrN/KY7aSaZGMgG/TTgyOy4ugnkraBo+ZzkJqoK8CLL5bJ34T+rdkHAqvsz
 Rcfw==
X-Gm-Message-State: AOAM533qcAVvMjaSu3Okn2kPiSIoKv0wNrvHTxRXTLWKWVm9IIkzWiQi
 EJC81QvDdidmKLPE/6gD8Ekf8w==
X-Google-Smtp-Source: ABdhPJx+f1tHcxxGqTCOCPo1VxA+zauf4INXX/UghwWOO8s1oRB78YRFQkcmGmPLG7UJfs2EKJR2JA==
X-Received: by 2002:a05:6a00:2343:b0:50a:7852:902f with SMTP id
 j3-20020a056a00234300b0050a7852902fmr1657232pfj.5.1650580106441; 
 Thu, 21 Apr 2022 15:28:26 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004fae885424dsm131962pfx.72.2022.04.21.15.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:28:25 -0700 (PDT)
Date: Thu, 21 Apr 2022 15:28:25 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Apr 2022 15:28:23 PDT (-0700)
Subject: Re: [PATCH] RISC-V: cpuidle: fix Kconfig select for RISCV_SBI_CPUIDLE
In-Reply-To: <20220409225317.14332-1-rdunlap@infradead.org>
CC: linux-kernel@vger.kernel.org, rdunlap@infradead.org, lkp@intel.com,
 anup@brainfault.org, apatel@ventanamicro.com, anup@brainfault.org,
 linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org
Message-ID: <mhng-2811736b-27d0-4312-ba68-ef99947a9372@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_152828_392724_87A561EB 
X-CRM114-Status: GOOD (  20.94  )
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

On Sat, 09 Apr 2022 15:53:17 PDT (-0700), rdunlap@infradead.org wrote:
> There can be lots of build errors when building cpuidle-riscv-sbi.o.
> They are all caused by a kconfig problem with this warning:
>
> WARNING: unmet direct dependencies detected for RISCV_SBI_CPUIDLE
>   Depends on [n]: CPU_IDLE [=y] && RISCV [=y] && RISCV_SBI [=n]
>   Selected by [y]:
>   - SOC_VIRT [=y] && CPU_IDLE [=y]
>
> so make the 'select' of RISCV_SBI_CPUIDLE also depend on RISCV_SBI.
>
> Fixes: c5179ef1ca0c ("RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: linux-pm@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> ---
>  arch/riscv/Kconfig.socs |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -38,7 +38,7 @@ config SOC_VIRT
>  	select SIFIVE_PLIC
>  	select PM_GENERIC_DOMAINS if PM
>  	select PM_GENERIC_DOMAINS_OF if PM && OF
> -	select RISCV_SBI_CPUIDLE if CPU_IDLE
> +	select RISCV_SBI_CPUIDLE if CPU_IDLE && RISCV_SBI
>  	help
>  	  This enables support for QEMU Virt Machine.

Sorry to be slow here, I seem to remember having written this before but 
I must have just gotted pulled into something else.

IMO the real bug here is that Kconfig.socs is poorly designed: I 
misunderstood how select works at the time, we should really clean all 
this up (or maybe just remove it entirely?) so we don't have to 
duplicate all these dependencies.

That's a bigger project, though so this is on fixes -- it's way better 
to have the build work.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
