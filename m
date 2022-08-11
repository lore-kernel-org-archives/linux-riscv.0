Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFFCC25B0C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 21:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+YEwR6Iau694Nwpd08yGsUwxLlXRYJXwAP4U30Zla58=; b=VM9kL4CUNWIDvJB1D6LzmJIRap
	EJQ+eU3uFlFt4ehHwbjTjjrqgWL3oX4j9pv2ywaPUppALuSKj4ufzslhAdzQXv4lyeM7tVbyk/YHB
	uxoh1ft7MPUrZIu7WL66LSJDvTNqpJ3e5D285BUkV0cErQyoLHC1aPQHhQeW4+68FVPGaYZCd+O4w
	55BvCfxjSa5NwPmgfTYMKss2WGM1tpE+3F5fD35y4bIqELnYsBM6iy3bfoOgBTWLT437ckVsFIKo7
	5sPs0lQawIiDPMzkrTxrO0hY7WrahpqIKEy2FBken/kOWasJ7I7nsz3J9DTYZYUNHljGtdwftpmKm
	A+zahoGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFOV-005KOO-4D; Thu, 11 Aug 2022 21:07:07 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFOP-005KDq-TK
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 21:07:03 +0000
Received: by mail-pf1-x431.google.com with SMTP id f28so17512632pfk.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 14:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=wQUA09JqEZQeweyf+QHJGzFXx4Fe7VVbOXl4BLKFUdw=;
        b=fKktsNZFfnTqlXRFp0wFLN0P+UJ8B66aRfUyoc1e/iQjMDlXiRQp8cpZCaFxQP0p9v
         jxzGovf9jNCjUD18R4rDHc/VsQQji2qjrGnti1WehdBFRmFnkxMlfhc6qk7uVthFfjCh
         vihQ8f/P5zlcee3codHQ+7xtj2p0N23+XQbaRn+KRRPp+Q84xFlh4SoU17IYxg/MdXnj
         DiCIXLJoTG3mX/C/e+BW8sv8/S9Iqwq8hR+ylCQYfQrpc9ct8WTzXB56GLmTyUXH0smf
         A9x6GWSR+7KPJfQiUl2qlgvq29pTT6ckM6GhW0Sm74gg0P2ZWOl4uZNRmiIhN9yCRZNl
         3VLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=wQUA09JqEZQeweyf+QHJGzFXx4Fe7VVbOXl4BLKFUdw=;
        b=ikyxwCRZsWDrj86VfQln7LLYN3NgoRY+fV5IBD9thtxOZI96YrSPRcGD5pogNrVggg
         PemlHeBj9ZCMh+ZeD18is4qLYaut0ayVMoy54oXUJEbDGBnOKER6xH5IIneYDUjA25Bp
         yw2AHgnHeXlszclgzMYR+GKQrRCa+DCA2t3ufDNDMQHNASKkqDXPVZ0DozmfSbRDb8if
         jsyMVNijU0flQgyCFk6nh2715Wyt2J8sXnVNDWJ1zTzUGu0EuNX0aOUrla9jODAEpNRk
         JcUG//jAgqjx8n8oWhKX/E2crJn/nOz6twtl8P4j+3eRIkzhXe+6jPBgE8q+Iogkg/Cr
         EfJw==
X-Gm-Message-State: ACgBeo3XX+hIaJkvHn2NZug3GJohAAkBGuNZQQ0ZviuGAwNfwq7zpUxG
	gfgVV1PyMzU5rixJnbxCY0PJLbwrKTpp4+RP
X-Google-Smtp-Source: AA6agR72/3+gRRjC5A99pXUv5Qfg3x9PY9Gz95V06tVsZGRvHbCvgkWqPKE5QyyqiCMzVU4wbhQdbQ==
X-Received: by 2002:a05:6a00:1a47:b0:52e:6a8c:5430 with SMTP id h7-20020a056a001a4700b0052e6a8c5430mr637675pfv.48.1660252019196;
        Thu, 11 Aug 2022 14:06:59 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id x12-20020aa7940c000000b00528f9597fb3sm119195pfo.197.2022.08.11.14.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 14:06:58 -0700 (PDT)
Date: Thu, 11 Aug 2022 14:06:58 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 13:32:08 PDT (-0700)
Subject: Re: [PATCH] RISC-V: cpu_ops_spinwait.c should include head.h
In-Reply-To: <20220713215306.94675-1-ben.dooks@sifive.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, sudip.mukherjee@sifive.com, jude.onyenegecha@sifive.com, ben.dooks@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ben.dooks@sifive.com
Message-ID: <mhng-7b9f9dd8-bc95-491d-895c-e2b8abb7949c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_140701_982830_DC5F6CF8 
X-CRM114-Status: GOOD (  14.64  )
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

On Wed, 13 Jul 2022 14:53:06 PDT (-0700), ben.dooks@sifive.com wrote:
> Running sparse shows cpu_ops_spinwait.c is missing two definitions
> found in head.h, so include it to stop the following warnings:
>
> arch/riscv/kernel/cpu_ops_spinwait.c:15:6: warning: symbol '__cpu_spinwait_stack_pointer' was not declared. Should it be static?
> arch/riscv/kernel/cpu_ops_spinwait.c:16:6: warning: symbol '__cpu_spinwait_task_pointer' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
> ---
>  arch/riscv/kernel/cpu_ops_spinwait.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
> index 346847f6c41c..c662a7cf10a4 100644
> --- a/arch/riscv/kernel/cpu_ops_spinwait.c
> +++ b/arch/riscv/kernel/cpu_ops_spinwait.c
> @@ -11,6 +11,8 @@
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
>
> +#include "head.h"
> +
>  const struct cpu_operations cpu_ops_spinwait;
>  void *__cpu_spinwait_stack_pointer[NR_CPUS] __section(".data");
>  void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
