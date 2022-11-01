Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A8FC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJwEFkuGSPkplERgzPKQb59grAUlcCbY9nStrFADDKk=; b=2z74UFv59s5SZg
	Lb3Br7ydO1QQufPQuGy56UvayZQpDenoHGOorksvsSr0jmtq+VweS+UZ4APbxqhxThg/SxmWquVRw
	vq/SLe6LSpipHej4DnppvohCgg1VJ136vsEV3G3c/e+36egYPiSSg6jzqu9Z306yN9x9KKpw56PMe
	SGgV0q7EKzt/ELVvnATYsshpGaaMdu36pct1ipu6cMfwqm7EjZh9HRge8sLQ3HLabxNwo46f/HXaB
	Eong8Al9qSgnc5elnYCCtiFoSOMKewEtNUkR2Yge+G5q8kiokWFZgQWhkHSberIbW51ZAGZN1iDNp
	jO3NRWO11MR7JMvluJcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqPH-0052NG-W4; Tue, 01 Nov 2022 12:30:16 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqPF-0052Ld-Od
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 12:30:15 +0000
Received: by mail-ej1-x62f.google.com with SMTP id 13so36639804ejn.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MMdJJP7qwJgB+YOZJZoHob5+MxmSHtL0fZ6b/8D51/A=;
        b=HRxnWtZ78Fle+GMZ/BglbxUAgUR/pOZoMyuTHxjejOFyG7ByqwcarnPhV0NQaqXYSl
         khrNMjh7fNsKZEwPrAjlzO8uNrMDO6NCJBJs9v/AgjRyb2rqst7VjvZtYzs57oN1upEl
         bH9HpfFj14uxOXfaah/iYuqn0p9h7C7/IfCCxWckV4oDaDXO/1URXqis5D+lWNn7+4TO
         pGHNOp7nJ48TWywRMqGUIb/UiMz60UzdR8+BkI+tDbtu8TmhJGK2AT/RK6lANdPYWU6V
         c5s8RtO/mLCsaW2Z0HcA7lDVYefF8rv6kvzBbCPq9JJdoyW1R2PMgIW1GDeoNxFehqo7
         GSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMdJJP7qwJgB+YOZJZoHob5+MxmSHtL0fZ6b/8D51/A=;
        b=Pco41tbJTaPVh8mMKaDUMb4KRx84SADutKwTzU20rpfazz0XLrboAf5eZJDKQcytat
         w2PPVRnblgiFYbUAawX/KpVfmgx6NbCDkjt8kh2duGPP92lg6K8xOwJusWiuliL8ckOA
         gWkuz/FScYZ76fZ1giddwBbbT/3KayvpFe9mzpJBcd4y3ICY8JNxS+jNNPhHx+e/FzrE
         kDHVcVbyzbwGLMG9CdT4aUyfrbdspbkicjte89DTucpQMFc6TZWEjVRn2v8xFbB9rrMI
         Hsxspodt2Y7DPaSMcTqm+YOvjfYRG0bMOvuadJOjhYushO3lwn+Jb6nYwj8kCAjwrojI
         p57g==
X-Gm-Message-State: ACrzQf199pkCewjSMSf0yLxcssaMgj3sDNBeKXOCKeuNy/1ETejRHBAn
	/g58S1iXNMdW9WmP+4JFJc5UjQ==
X-Google-Smtp-Source: AMsMyM43Au0M4n/HFiW/cXmrltu4nx6ymG910hAE86Cu/h8Mh2B6UpOdnv1cioo6CGtmr8+mmacM1Q==
X-Received: by 2002:a17:907:9d03:b0:7ad:e310:ea8 with SMTP id kt3-20020a1709079d0300b007ade3100ea8mr6546291ejc.400.1667305810129;
        Tue, 01 Nov 2022 05:30:10 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id bm6-20020a0564020b0600b00461a6997c5dsm4456757edb.83.2022.11.01.05.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:30:09 -0700 (PDT)
Date: Tue, 1 Nov 2022 13:30:08 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC  1/9] RISC-V: Define a helper function to probe number of
 hardware counters
Message-ID: <20221101123008.e3bwen6f2yxi3whi@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-2-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718170205.2972215-2-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_053013_859176_FF703321 
X-CRM114-Status: GOOD (  19.74  )
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

On Mon, Jul 18, 2022 at 10:01:57AM -0700, Atish Patra wrote:
> KVM module needs to know how many hardware counters the platform supports.
> Otherwise, it will not be able to show optimal value of virtual
                                        ^ the
> counters to the guest.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 23 +++++++++++++++++------
>  include/linux/perf/riscv_pmu.h |  4 ++++
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 24124546844c..1723af68ffa1 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -27,6 +27,7 @@
>   */
>  static union sbi_pmu_ctr_info *pmu_ctr_list;
>  static unsigned int riscv_pmu_irq;
> +static struct riscv_pmu *rvpmu;

Do we really need rvpmu? From a quick scan of the series it's only used
for num_hw_counters, which has to be added to struct riscv_pmu, and
num_counters. How about instead creating a static global for num_counters
and then getting num_hw_counters by iterating pmu_ctr_list. If we want
riscv_pmu_sbi_get_num_hw_ctrs() to be faster, then we can cache the value
in a static variable in the function.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
