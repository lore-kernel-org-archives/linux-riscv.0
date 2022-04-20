Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4B2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 01:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5Uq2l1ZXyXpPluN6rJ7/arg9lXOQV0OTsN6E2ntpTbM=; b=JJnujfh7HGUX5pOLCiXC0qUDgi
	ZA9JUoPYzZvEvIPzEzJUftGGf2uc/W1liHTmA7uvBKOYZYIIBP7nkiOXJRmInYeH2Im5Vy1Y8X7IM
	CTA4DT/3DBa7xhdOlmm+wd2UpRgYCvWjHMFUg+PFEOenlSEu01DtxYTIvuEYoj8yGIaYv1Zhp2akD
	JljofJie7Z7MCGocct8DDy6zLWgW//LeFD3lsh7Ld4sLG5Z+gbwNdssYaF3lrlm+Y1YGVua08nOhn
	b2qMHEX/h3DtMS4vs/RBRFAccZJci84j1uWRg1PeS4qRCjDEKmnvU540nfOwtev2Er5TD8TAG9WIX
	TkX8IxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngyol-006loG-CB; Wed, 20 Apr 2022 01:07:39 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngyoi-006lfr-Pb
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 01:07:38 +0000
Received: by mail-pg1-x535.google.com with SMTP id k14so140073pga.0
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 18:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=uh+zqoa0RmF45pIO3fKwJcIuuOmmQqr7ZHT+lq3wkxM=;
 b=c+RLqjbokVzeFTNw9hc8x+ovEmdLmAVh+jAijGNIU2aP2z9Kn/2M5CVbWFQbp3uaYa
 G2yJ7RQXUcZiR97mRMuENoPfBv/t0NyC1qNrxT7PvouX4a7uAeH/Z5NeKzncDrWGTu6i
 TrenHavLMjhVjxXVbMPKEpnK76ncrbU5kyYp5qX7wLMhWx0rkgqxNEHn+4bZc+GlTcv8
 +mkx3DmZVeCVa5ER8W4GHlhgYsPWVAXzqalQefy8VLihg0JRzIq+nfHyjd67REslJVKb
 fOvAOnsTclyZdrMiN15qZ4vmRxI7slVgDYrjxfOPLCEIO+9GrAwgv4WnKl/Q4ba+WZeS
 9qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=uh+zqoa0RmF45pIO3fKwJcIuuOmmQqr7ZHT+lq3wkxM=;
 b=A9kmuRVKSc2czEVD3MRLDaOW41ZzjrAIwvWIQ/p/AtEPmD+kvT7D1pD6KNWB471BXF
 Y5NIW6jj3JbROLD4JSYVY+JSwf9ECevUtS3yxqp9p6vpFYrr6uhMY4oD1A9k6UsXkSog
 C5UV6EjEj+QJF0LZa9BdYO/+P3DrQ7nyMcAcehF1dQruLdIQuTBmfijjI+fEAI4WntiX
 LgZdgSUt7JbC11dNHoB68VgWNzu6u2SEiBsTjOV/261tpizuW6ugcCboaAJNe6uI/Oyj
 gdkG1CtvioqFDdtO9B4cWdSdzuo3gVMgoPJUesC413Kk2QFGDOiRDNc+w10m8o+D4Boc
 Rv6Q==
X-Gm-Message-State: AOAM532Cll/4Y0VT3T6WXElHPNR5JvgWVOsKz6hZlHp1x9nyyWg40NKe
 Zgu2RO01AWNRP+CQeXqrHJEETw==
X-Google-Smtp-Source: ABdhPJyBw5NXF/715OeKg6IgA5qyU6RYVd0hslcVhCUZywZ8kfoHLoOdaHJGPyf4uS10BVIJ569zzA==
X-Received: by 2002:a63:4945:0:b0:398:efe8:3b7a with SMTP id
 y5-20020a634945000000b00398efe83b7amr17202310pgk.106.1650416853229; 
 Tue, 19 Apr 2022 18:07:33 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 x36-20020a634a24000000b0039cc6fff510sm17693532pga.58.2022.04.19.18.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 18:07:32 -0700 (PDT)
Date: Tue, 19 Apr 2022 18:07:32 -0700 (PDT)
X-Google-Original-Date: Tue, 19 Apr 2022 18:04:50 PDT (-0700)
Subject: Re: [PATCH -next] cpuidle: riscv: support non-SMP config
In-Reply-To: <20220403031355.20894-1-rdunlap@infradead.org>
CC: linux-kernel@vger.kernel.org, rdunlap@infradead.org, lkp@intel.com,
 anup@brainfault.org, anup@brainfault.org, apatel@ventanamicro.com,
 Atish Patra <atishp@rivosinc.com>, daniel.lezcano@linaro.org, rafael@kernel.org,
 linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@rivosinc.com>
To: rdunlap@infradead.org
Message-ID: <mhng-d1fe9967-3f64-4ec7-aa82-72571e03bef4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_180736_871550_BBE90643 
X-CRM114-Status: GOOD (  13.05  )
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

On Sat, 02 Apr 2022 20:13:55 PDT (-0700), rdunlap@infradead.org wrote:
> Add <asm/smp.h> for cpuid_to_hartid_map etc.
> This is needed for both SMP and non-SMP builds, but not having it
> causes a build error for non-SMP:
>
> drivers/cpuidle/cpuidle-riscv-sbi.c: In function 'sbi_cpuidle_init_cpu':
> drivers/cpuidle/cpuidle-riscv-sbi.c:350:26: error: implicit declaration of function 'cpuid_to_hartid_map' [-Werror=implicit-function-declaration]
>
> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Atish Patra <atishp@rivosinc.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20220401.orig/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ linux-next-20220401/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -22,6 +22,7 @@
>  #include <linux/pm_runtime.h>
>  #include <asm/cpuidle.h>
>  #include <asm/sbi.h>
> +#include <asm/smp.h>
>  #include <asm/suspend.h>
>
>  #include "dt_idle_states.h"

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
