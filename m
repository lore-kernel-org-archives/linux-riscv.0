Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867FFC6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kv1NtSYbSKixldT/9o5p2Mk+V1RrlotAj7+EB0KDU0w=; b=4aLZXWA/UtHnUr
	3nU7OvynvCU5wTbCJcE0+81klKC2nudOXJifi111TA6vU3xfkE3WsVftlRw/CIKxB+CzNrh4oUtmP
	6p5nv9Trsxgs+dBNkBfyJKFzM1GWh6wdHATC927brFNraRRGelKRhJTH+uXhxoAs29ysgYiHGHzO6
	TAkwEBhep45YoK19c+ugECXlrvDPJHwI/mPBgBcYv0YS6Aq0FhMAbBwUhr+q6hTji+uMyoWZxpySf
	zeEbhLVgrcpX5q62sIKQOuwYXmNpU6R9UEzMe0mvAEEf/MYwQqByoSALlEknz/5unkQCN1hEWEFT0
	KWr8tJtis2AkGcnjP/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOR3-00DtA2-0P;
	Wed, 30 Aug 2023 16:52:53 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOR0-00Dt90-1W
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 16:52:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so4821496f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693414367; x=1694019167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xiGwG1g0PfZbG84X6fEJIeDJJqiHfI5S3E/gx4dBfMs=;
        b=gN9C3d6n0X4y/5kniDTjN+RTDUOXBCgAH1XQKojITe66mbD8ldtsU8xb0kMSdWCBAp
         LP4bRhyMjn+jx/R47Klp3RbG1zJqJz3/ft9MlSPEdlvERTc5TmIMJ5XaLQ83sqkhQCJQ
         zqquJA8xcTvqjVeuuWASsfavMYKRceKUwNwgE1faoxWNOoDirc7eUmV0eBEvnka0DZbo
         JJKK6ekq83wk1vXv5BHU9hgxySSgE/O777NtJNX+cCUUerA7D28FwSN3f90ZjLLx9ain
         xFRz8gn8lpqw38oJ9VY0+ur6zGjtuQDzM0PaIPayhs4BxX1BK0F5T6+Y736ETxUUeuVX
         osUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414367; x=1694019167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiGwG1g0PfZbG84X6fEJIeDJJqiHfI5S3E/gx4dBfMs=;
        b=lXo5RC7ihgueZMtMfDzvSyW4soB4iitiHPrefg71pjS5mlh+tGfjcnLIZjznb8CUnT
         uhpEFZ3EKFNV1ncU2e27dtiIsFcUTqfhPos1mJsHaaRAPFOsxFvpHuZb/J7CIAhFZzwk
         SYrE1E7WEXslsBoEZilFiBk2N7hwpCLVh+7/uS/AciU6jgahLEsyXqE+IwN1C6Q6qA8U
         JEJXbvKiszVwVo07QBT8m+CEqgRHzWQAnzUruMqY0kbAwhOP2jkddoHRuckUXEL3MeoY
         Cy26sx5zBPz1UP48JCtoI17o/peYs/sCOr+D2NEhBOrdMyYYhGioXG/h9PsS0/FyTQlg
         5kXg==
X-Gm-Message-State: AOJu0Ywu12I/z1CfgwD3BFRSw+mbFuaqfMVVN+rW+7Rp7vUu9SEu42z7
	eG4ou/k0D5smO7Lqi97mEVGMAEvTuDqmZydsSGls+g==
X-Google-Smtp-Source: AGHT+IFPsYuS0AhPbz0e97cB0MRojM9wmfT5UP7yBSozTT+iLWNdSIUk24ygaLpuf0eLMV1dR9hj3g==
X-Received: by 2002:a5d:58ca:0:b0:30e:3da5:46e5 with SMTP id o10-20020a5d58ca000000b0030e3da546e5mr2183891wrf.59.1693414367660;
        Wed, 30 Aug 2023 09:52:47 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b3-20020adfde03000000b0031accc7228asm17091833wrm.34.2023.08.30.09.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 09:52:47 -0700 (PDT)
Date: Wed, 30 Aug 2023 18:52:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	evan@rivosinc.com, conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v2 0/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20230830-367b41474b33b230aa3f0c3a@orel>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830164954.91987-8-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_095250_518636_2BDA5580 
X-CRM114-Status: GOOD (  19.22  )
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

On Wed, Aug 30, 2023 at 06:49:55PM +0200, Andrew Jones wrote:
> In order for usermode to issue cbo.zero, it needs privilege granted to
> issue the extension instruction (patch 2) and to know that the extension
> is available and its block size (patch 3). Patch 1 could be separate from
> this series (it just fixes up some error messages), patches 4-5 convert
> the hwprobe selftest to a statically-linked, TAP test and patch 6 adds a
> new hwprobe test for the new information as well as testing CBO
> instructions can or cannot be issued as appropriate.
> 
> Thanks,
> drew
> 
> v2:
>   - fixed build of the vector selftest

for-next also needs commit 25696067202f ("selftests: riscv: Fix
compilation error with vstate_exec_nolibc.c") in order for the vector
selftest to build.

Thanks,
drew

>   - changed this-cpu wrappers to just cpu wrappers and then pass
>     smp_processor_id() at the callsite
>   - added comment to EXT_KEY macro
>   - picked up a couple r-b's
> 
> Andrew Jones (6):
>   RISC-V: Make zicbom/zicboz errors consistent
>   RISC-V: Enable cbo.zero in usermode
>   RISC-V: hwprobe: Expose Zicboz extension and its block size
>   RISC-V: selftests: Statically link hwprobe test
>   RISC-V: selftests: Convert hwprobe test to kselftest API
>   RISC-V: selftests: Add CBO tests
> 
>  Documentation/riscv/hwprobe.rst               |   6 +
>  arch/riscv/include/asm/cpufeature.h           |   2 +
>  arch/riscv/include/asm/csr.h                  |   1 +
>  arch/riscv/include/asm/hwcap.h                |  16 ++
>  arch/riscv/include/asm/hwprobe.h              |   2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h         |   2 +
>  arch/riscv/kernel/cpufeature.c                |  10 +-
>  arch/riscv/kernel/setup.c                     |   4 +
>  arch/riscv/kernel/smpboot.c                   |   4 +
>  arch/riscv/kernel/sys_riscv.c                 |  46 +++--
>  .../testing/selftests/riscv/hwprobe/Makefile  |   9 +-
>  tools/testing/selftests/riscv/hwprobe/cbo.c   | 162 ++++++++++++++++++
>  .../testing/selftests/riscv/hwprobe/hwprobe.c |  64 +++----
>  .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
>  14 files changed, 280 insertions(+), 63 deletions(-)
>  create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
>  create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h
> 
> -- 
> 2.41.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
