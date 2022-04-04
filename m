Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3A1C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 03:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHwqZnShIRC3dH9s0402uN7YX5gHjhnbxOkvnVSNVCQ=; b=KFXkGxhBrw4ykM
	FAtA70QYeXHhTW5z+3bUcWwP2JgGRrfN/ffR/nsu1yaHJ0JEjDuYqxQ+zt24MmejRF8WN+IWUvvtW
	pIzac2fMQP3MagIf1ue3og3wUuj+pAOI+NXdzMntPad05Hm+BU1wIMk71Emsk+vC4pvXVNL/HPnh+
	1UlnGGt2Fc7h/CNVNSCgF+ZhwZXdIvma3pvqdyrOfGF1iJCXa9mhszAnMim11WNelAO1FmZ9TgZBd
	wQqmy7CgVXOAkW0oe/isPzWvFFCZxtttZCa0YoXttBDt3vVk4LStCHNuFiZn6sZDJwXXqDR8NQFat
	1rRFy+UzX0krO/zTHufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbD2G-00Cqz9-MZ; Mon, 04 Apr 2022 03:05:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbD2D-00Cqxm-0p
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 03:05:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w21so12462413wra.2
 for <linux-riscv@lists.infradead.org>; Sun, 03 Apr 2022 20:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zd1t2Pkuz698pTtgUjJwnowpfooSne/24mXVqKShj+c=;
 b=NWiwe7Qw5ka9+CSZ1/qW67wTbrDFP0cDPbwGe/J6FWhHkb5Sxt4n4xmacvf/7NvIH8
 3w6RbfIRqVnT0UVbdtZeYqpV++c6S7BJnbyeh3/r9cnceCAZ9bWsutuz1HNLVXV+B8uo
 WhUgw+dUJeLh2DaqquPfW5OTuHBZzGhP/etJ8eNt/CBog7GE5wgIna9JPIVP12BBtc9a
 j7hLtaTWSsgqX/RtFKbXHtAuOSFuiYC7ZkffF+ba1HIzMvzzjjKqxoxGTvAOU77ohyFv
 ccKHaokZjQ8KLKN9m4xBNPzefa9WxtUlnoU6N9iFI2xzCtFbZ767HuPX9Hv2vykF46/q
 YduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zd1t2Pkuz698pTtgUjJwnowpfooSne/24mXVqKShj+c=;
 b=UaAn9WfKNwNXZM1rIneA+068hEmdjahAFCeeC2NuQcfiZbtSK/BS9OjlK4HxRVnKjd
 ua8fHv9aNRmkfqCAtq+4yZmIi5yseAhtxbfD8IsdFk74KbfFo4p7MdZapbTXG/rSCq8E
 7NZLZmPVafVFQJIvnJ3PyBIdIaFuZ3Qsav2t1XZsv3dbR5pIC43D9TKHzBrkeF/QTQdo
 s8pfoC4IHs2K9ZUNBZiq6zXHawGrMaqTPcrxmAfdGhWnDTZORfpDaOD3rRyoquQ6L7jP
 TVKeeUCDJJX2VFEXwhPDFQGfMVscWhzH9lbT3Ew90dRberHwK4nuVhu8+Q3x4agsUZYf
 WcVw==
X-Gm-Message-State: AOAM5313p7/uEhP/zsUzzoqeNOlH+zKSxRNns3M29DM4QMpWndZgUW2i
 1LE66rqSpsfR7y5suG50q3cId4ZjHQfayJFph+rP3w==
X-Google-Smtp-Source: ABdhPJyGYpZSUqo724IzShlVtF1ee3pTpacTkhreTLjXWB9AK2Sv6hBJilqv9BLYZ4/IwHSaMW2EmCu5gefIZKnIk60=
X-Received: by 2002:a5d:6e54:0:b0:204:635:42ba with SMTP id
 j20-20020a5d6e54000000b00204063542bamr15548840wrz.214.1649041531815; Sun, 03
 Apr 2022 20:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220403031355.20894-1-rdunlap@infradead.org>
In-Reply-To: <20220403031355.20894-1-rdunlap@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Apr 2022 08:35:19 +0530
Message-ID: <CAAhSdy2CJMeD_JhvwkEKShtYxyLGVRme8rE4cmCcDFfO90_D-Q@mail.gmail.com>
Subject: Re: [PATCH -next] cpuidle: riscv: support non-SMP config
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_200541_501379_B6A09B59 
X-CRM114-Status: GOOD (  13.34  )
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

(Removed my WDC email because it does not exist anymore)

On Sun, Apr 3, 2022 at 8:44 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
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

I suggest include linux/smp.h here instead of asm/smp.h

Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

>  #include <asm/suspend.h>
>
>  #include "dt_idle_states.h"

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
