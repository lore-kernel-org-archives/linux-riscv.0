Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152DCC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 16:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bT5puHb1x/CxXmsAfVY6D7rdfI9o+c4PSHlyWPUGTs=; b=fQotWCJ+7pH1Um
	768TJyAqN+czMgvVpZvfHxwbqHewjeTJ+IcCr8nZhfpyVsIB6Md+XUIBRM/jWjwZuX3njYDcBRRpD
	sQMjLho+gGUoJgCNKZkk73IGUHju+7EJJN+1vyjCiAmZLlPL21UCUPjkVgOXE1xCrp9WsBQoCKSZN
	GBTpCOwZL0PMLftCM81l4+ujjhNuKu541JFk0Hn6/hh0bVJ3/Jp2kwrimUYJXeDItIs/9ZMqU6NLm
	//WFoThKP5FqgQf2si+6hTM0nGpxhjKSpAhH66uztvCgXFE8FABeEPhKhtC3oFiWMIM49CmBZfG7M
	q10xnbIDAqJuT09Z6E9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7Z3-00FGJm-NT; Wed, 05 Oct 2022 16:48:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7Z1-00FGF5-5i
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 16:48:08 +0000
Received: by mail-ed1-x52e.google.com with SMTP id s30so20103418eds.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=rJlCzLvrckYpvf195PeFgfPz5CtAw+K0vTjiPqw7FiY=;
        b=MOQYL1iWffb1pWnq+aWu3VpHKec81KtenC29dfnPqIsxRCee1/qgGXXatjw8ef4ivp
         CdooVKveq1bguAPT4ExwdxdOdH5jdq9Fhz7suFTt0JwC5WsoMIeaj1vr5uWsIYvVB43v
         FoiTrCvgXYtwxrqcFu4I0Wd7dw5ewVbTL4z1zPyuODlJCUDTd1zI/AkHy67Di4C1piqp
         ykyBfHiA6MSonEtkla5IEOWIPFcDGjWZqbty4ZnkZcj+pIONmvFPzOldjAnaNBczYHjk
         ugjfd9f89swDiUyTIWOZKpddGeawdUB9GtdxphEBtNRKDlX1H524+51ywUuhc+ktEtQ8
         mdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=rJlCzLvrckYpvf195PeFgfPz5CtAw+K0vTjiPqw7FiY=;
        b=O+nm15SYsGMpfm4WN1il5FUnpDq7qHu/ZHUOQfiYK+VYf74JrU/taaQifGVxweMpBR
         c2CajxLc3S140U6p88uvszTqUimiEvAjhIObVbQAqJkUvNeSUhlTI14OqYtw4u1TXJIK
         iZdjDbPHCb3Q4BS/dMDNPPxRdZNUiGlSINeca+4+g0Dh4nlVX9EE9gs7mQMDW1MsaZ9V
         sfLlkP3qmUxr8Mjc67ItTBu93jIDbQ2Y8kxVx3AuAJCOEVmxcjqylQgbunRo9Q6pphZt
         VyKM3fKot+5Wpw4IA0yeyPq+B7ki46ajULTFuve1dQ3DiEudfnAxxIyOg1n6kbMQzlmq
         Bjwg==
X-Gm-Message-State: ACrzQf2SJmkaesI1+kbc/ft1Y42d6acRjIcNtDdGTWB+wnGopoVH2V+M
	Zf/8yRbJU3I9FP2wK+Fls/P84g==
X-Google-Smtp-Source: AMsMyM5jkENkJlPL2eqsHVpx3a2cXAvFi4nVzDAFI2aJqRSvlv0Yre7MTxoILBe1eQ8Mw5PMtcMNbA==
X-Received: by 2002:a05:6402:2793:b0:451:fd7d:fc0b with SMTP id b19-20020a056402279300b00451fd7dfc0bmr619289ede.13.1664988483535;
        Wed, 05 Oct 2022 09:48:03 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id f4-20020a50fe04000000b00451319a43dasm4221950edt.2.2022.10.05.09.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 09:48:03 -0700 (PDT)
Date: Wed, 5 Oct 2022 18:48:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ruinland Tsai <ruinland.tsai@sifive.com>
Cc: linux-riscv@lists.infradead.org, atishp@rivosinc.com,
	greentime.hu@sifive.com, vincent.chen@sifive.com,
	paul.walmsley@sifive.com
Subject: Re: Regarding the changes on /proc/cpuinfo for ISA strings
Message-ID: <20221005164802.yvomkl5fo6rmsuup@kamzik>
References: <63898081-16d0-39a7-fe96-f4eaa5babae2@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63898081-16d0-39a7-fe96-f4eaa5babae2@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_094807_310524_3643DD60 
X-CRM114-Status: GOOD (  18.34  )
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

On Tue, Oct 04, 2022 at 05:55:42AM +0000, Ruinland Tsai wrote:
> Hi Atish and all,
> 
> After the commit "a9b202606" introduced for Kernel v5.18,
> the `/proc/cpuinfo` will longer print the full ISA string provided by DTB.
> 
> With the comment of that commit, it seems that the policy of `cpuinfo` has
> changed to print only the extensions provided in the array
> "riscv_isa_ext_data" and those extensions must be properly enabled (by
> toggling corresponding Kconfig ?).
> 
> So we are wondering a few things and hope that you can enlighten us a little
> bit :
> 
> 1. What is the policy on recieving vendor extensions ?
> Hypothetically speaking, if a vendor submits a patch which simply adds an
> entry into `riscv_isa_ext_data[]` without revealing any detail, will that be
> acceptable ?

Is the concern with usermode being able to determine which unprivileged
extensions are available, whether they're standard or non-standard, even
when the kernel doesn't recognize them?

If so, then that does appear to be an issue. Even simply adding entries to
riscv_isa_ext_data[] isn't great, because in these cases there may be no
other reason for the kernel to be updated, which means doing so creates an
unnecessary burden and unnecessary entries in riscv_isa_ext_data[].

> 
> 2. If a userspace program wishes to know the whole ISA string, is
> `/proc/device-tree` the last resort for them ? And if that's the case, what
> will the equivalent in the ACPI world since we have learnt that the RISC-V
> ACPI spec is now work in progress.

ACPI will have the RHCT table (I believe the ECR has been approved). One
can dump and disassemble the table from sysfs, but neither that nor
looking at /proc/device-tree should be how usermode probes CPU features.

If my guess at the concern is correct, then I wonder if we don't need to
extend the ISA extension naming convention to also include 'u' or whatever
in unprivileged extension names. Then, the kernel would just pass those
through when it publishes extensions to userspace.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
