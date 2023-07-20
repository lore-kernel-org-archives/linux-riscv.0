Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84415EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 06:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTUvixyvsVBGmgAFu9cYYws2quDh5pzn7Jeob/8YmlI=; b=EgzUwGCZgxmNjZ
	vUNneGtFDJfk5q7WYVOSTpC8ndQe+qGOrP6r0W+dBMYUWWWRpAd/UStWQCf6LobjPD9RYF2Qm01or
	OWyng49UKqm93W/F5L4Xpa6wP9qc9aBxIaIAh7LAa4y/dR9jvCEIsL+AeRnGNy3dV3jRjp1SwymH8
	L6pG5BPAXih/8ShEM/HUXGEKRtA5QBeDLo1W6MSKuQ99sL+YKd/fHUuOpt4g9V9MyE39xT7HnWOYw
	EACVFtT+LNyWxiri3+2RGi7/CyR0VoTOwWr4MCmkYoBGznoH6AVyap+7qrhycWvw7PLSaPavDhre/
	Rc//u+ZUrSss83zVmwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNSQ-009zY3-0f;
	Thu, 20 Jul 2023 06:48:14 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNSM-009zU6-1S
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 06:48:12 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e566b1774so467904a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 23:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689835687; x=1690440487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YY8m5/XDAUcgHKbAHc0qRAbGRanXhW3GiGRR/skqG2g=;
        b=bToRzJRlXY0VUn2QctmDXk+OuwTIG0h1pb7aqSD2bTZXmX5PW3qdNi9lrYF02VzM6v
         xRIGX8K3Vb/NXJUd00YI6ntCZ9eSvvmAuq/qEn05qEJLjrwtQVDgIIAk4hzPAE2i+ptH
         d7u5qUgh2cUvI4tc49Jmuc2tngAuHOP4G79IhOvJur38SYjXJnghkOLBhcf9GQh0AGog
         TPfzl5gtGknX1co0U81Nut3sj+rbmL03Kz7I/2ql1asJ+GYUNaGcP51Agf9iIKlfE3fj
         qgzS4tvSU264KPwRMxdpiVbjx3UEpJqAk5LjNlguVZGbIGPvy+ybz1Z9OUTtWHP8qT0X
         Dxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689835687; x=1690440487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YY8m5/XDAUcgHKbAHc0qRAbGRanXhW3GiGRR/skqG2g=;
        b=iik9NaBvJIp48s5fD0pWGWFrK1KGO8PVXLX0FDsZXOAPgX8h2O5E9zlGUbAZpfpKT9
         /7o69y0cVT+SmtG6cr8u37GEYC0d2mzvXmSXzwVTJTFV0EiBmkEEwkf4Bu10Qp4YwBGI
         wMyJDYscjfhSLQlexSUQE7KLfLvMf6oOvQmCOWQs1uKi+msTdtXVsQ5H1OhYNQz2sSb5
         yz0MdTj9wBWSVaL4sSYwvKAqSOAqvW4WPqKHf/Sqw8VzME1cfacW8bNWfTvCZWRbSVCQ
         MTawPtEfSZDKbaG1E+IB3ceXoFv+tAj1N4xotIcSGtkGUn6m62+blz7xoluZu0lZrjGf
         QOPA==
X-Gm-Message-State: ABy/qLZlsipLU8HdBgV27zGnYTI+GI8O3DvRj7kS9TqeSf69lHH+DV5n
	lRPtdGWjoqnVUzX6zdFVcBISdw==
X-Google-Smtp-Source: APBJJlGP0/CbRA6tz6PlhVcCHbt6ilna6EIOtA8YnS/sjAkB+d44JIWZZ+NJJArT/iAPBOzXujloYg==
X-Received: by 2002:a05:6402:1806:b0:521:aa4b:24f3 with SMTP id g6-20020a056402180600b00521aa4b24f3mr1193627edy.24.1689835686733;
        Wed, 19 Jul 2023 23:48:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id f15-20020aa7d84f000000b0051de2455041sm303663eds.24.2023.07.19.23.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 23:48:06 -0700 (PDT)
Date: Thu, 20 Jul 2023 08:48:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Woody Zhang <woodylab@foxmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: add SBI SUSP extension support
Message-ID: <20230720064804.byexbnbknadets62@kamzik>
References: <tencent_B931BF1864B6AE8C674686ED9852ACFA0609@qq.com>
 <20230720-speller-suffocate-29ee7cc0b1f6@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230720-speller-suffocate-29ee7cc0b1f6@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_234810_493872_B4BA34F1 
X-CRM114-Status: GOOD (  29.25  )
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

On Thu, Jul 20, 2023 at 07:31:42AM +0100, Conor Dooley wrote:
> Hey Woody,
> 
> On Thu, Jul 20, 2023 at 08:23:19AM +0800, Woody Zhang wrote:
> > RISC-V SBI spec 2.0 [1] introduces System Suspend Extension which can be
> > used to suspend the platform via SBI firmware.
> > 
> > This patch can be tested on Qemu with recent OpenSBI with
> > `system-suspend-test` enabled like [2] in DTB.
> > 
> > [1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
> > [2] https://github.com/woodyzhang666/qemu/commit/e4a5120133c1dc354e6ac437ec1f870f6c0f6d05
> > 
> > Signed-off-by: Woody Zhang <woodylab@foxmail.com>
> > ---
> >  arch/riscv/include/asm/sbi.h | 10 ++++++++++
> >  arch/riscv/kernel/sbi.c      | 26 ++++++++++++++++++++++++++
> 
> There's prior art here, that is seemingly more complete:
> https://lore.kernel.org/all/20230118180338.6484-2-ajones@ventanamicro.com/
> IIRC, the reason it is still in RFC status is that the 2.0 SBI spec is
> not yet frozen, so this cannot be merged.

Yup, I'll repost with the RFC dropped as soon as 2.0 is frozen.

Thanks,
drew

> 
> Thanks,
> Conor.
> 
> >  2 files changed, 36 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 5b4a1bf5f439..3b04016da671 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -30,6 +30,7 @@ enum sbi_ext_id {
> >  	SBI_EXT_HSM = 0x48534D,
> >  	SBI_EXT_SRST = 0x53525354,
> >  	SBI_EXT_PMU = 0x504D55,
> > +	SBI_EXT_SUSP = 0x53555350,
> >  
> >  	/* Experimentals extensions must lie within this range */
> >  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> > @@ -236,6 +237,15 @@ enum sbi_pmu_ctr_type {
> >  /* Flags defined for counter stop function */
> >  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> >  
> > +enum sbi_ext_susp_fid {
> > +	SBI_EXT_SUSP_SYSTEM_SUSPEND = 0,
> > +};
> > +
> > +/* SBI suspend sleep types */
> > +enum sbi_susp_sleep_type {
> > +	SBI_SUSP_SLEEP_TYPE_SUSPEND = 0x0,
> > +};
> > +
> >  #define SBI_SPEC_VERSION_DEFAULT	0x1
> >  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
> >  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index c672c8ba9a2a..9a68959f9f18 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -9,8 +9,10 @@
> >  #include <linux/init.h>
> >  #include <linux/pm.h>
> >  #include <linux/reboot.h>
> > +#include <linux/suspend.h>
> >  #include <asm/sbi.h>
> >  #include <asm/smp.h>
> > +#include <asm/suspend.h>
> >  
> >  /* default SBI version is 0.1 */
> >  unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
> > @@ -520,6 +522,26 @@ static void sbi_srst_power_off(void)
> >  		       SBI_SRST_RESET_REASON_NONE);
> >  }
> >  
> > +static int sbi_system_suspend(unsigned long arg,
> > +		unsigned long resume_entry, unsigned long context)
> > +{
> > +	struct sbiret ret = {0};
> > +
> > +	ret = sbi_ecall(SBI_EXT_SUSP, SBI_EXT_SUSP_SYSTEM_SUSPEND,
> > +			SBI_SUSP_SLEEP_TYPE_SUSPEND, resume_entry, context, 0, 0, 0);
> > +	return ret.error;
> > +}
> > +
> > +static int sbi_system_suspend_enter(suspend_state_t state)
> > +{
> > +	return cpu_suspend(0, sbi_system_suspend);
> > +}
> > +
> > +static const struct platform_suspend_ops sbi_suspend_ops = {
> > +	.valid          = suspend_valid_only_mem,
> > +	.enter          = sbi_system_suspend_enter,
> > +};
> > +
> >  /**
> >   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
> >   * @extid: The extension ID to be probed.
> > @@ -624,6 +646,10 @@ void __init sbi_init(void)
> >  			sbi_srst_reboot_nb.priority = 192;
> >  			register_restart_handler(&sbi_srst_reboot_nb);
> >  		}
> > +		if (sbi_probe_extension(SBI_EXT_SUSP)) {
> > +			pr_info("SBI SUSP extension detected\n");
> > +			suspend_set_ops(&sbi_suspend_ops);
> > +		}
> >  	} else {
> >  		__sbi_set_timer = __sbi_set_timer_v01;
> >  		__sbi_send_ipi	= __sbi_send_ipi_v01;
> > -- 
> > 2.39.2
> > 



> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
