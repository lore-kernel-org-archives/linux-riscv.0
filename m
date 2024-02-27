Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D65C54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 19:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHSjb3Hr3vw7g3dfBI2K6SMwKZV6BBkGsifTZUWPqgk=; b=x4w9yFvJ9nXp/8
	k7YoENLvSckdZlWbz0YqMAoc06UPijvOb5bSXcGEjaPv3hZj1NDKowfSctM1UODaSeiovLPVynXcv
	aD4MZVR+wpdiM1qYehtIMKUkWRJPW+vtKEdtjJ1OPiI59WZoL3WyMfaTRJqXo1EALXuP36CEX0X2J
	gppKx0lwSHTd/Evbu2oPRYEgovqr78y5it3Aq64TT1GUlnfOnph9sK6tKgFVXsGGAgdCqiTqaPlbV
	5yLE0yTsJSUIJ36cU3/QdCeZZVgMK++BBZ2OU4TNOHxe04AVmW999aC38TZFBnCDo4znCBqXTIgTG
	4o5Fem1RAkC86RNUcaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf35w-00000006cPK-42cD;
	Tue, 27 Feb 2024 19:26:28 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf35t-00000006cNz-41aY;
	Tue, 27 Feb 2024 19:26:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B920E1BF209;
	Tue, 27 Feb 2024 19:26:20 +0000 (UTC)
Message-ID: <6ad96656-3cf4-4e22-8a18-cfde5c31cfc1@ghiti.fr>
Date: Tue, 27 Feb 2024 20:26:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2,RESEND 1/2] drivers: perf: added capabilities for
 legacy PMU
Content-Language: en-US
To: Vadim Shakirov <vadim.shakirov@syntacore.com>,
 linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>
References: <20240227170002.188671-1-vadim.shakirov@syntacore.com>
 <20240227170002.188671-2-vadim.shakirov@syntacore.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240227170002.188671-2-vadim.shakirov@syntacore.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_112626_178236_A8C6B4F9 
X-CRM114-Status: GOOD (  11.93  )
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

On 27/02/2024 18:00, Vadim Shakirov wrote:
> Added the PERF_PMU_CAP_NO_INTERRUPT flag because the legacy pmu driver
> does not provide sampling capabilities
>
> Added the PERF_PMU_CAP_NO_EXCLUDE flag because the legacy pmu driver
> does not provide the ability to disable counter incrementation in
> different privilege modes
>
> Suggested-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Vadim Shakirov <vadim.shakirov@syntacore.com>
> ---
>   drivers/perf/riscv_pmu_legacy.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
> index 79fdd667922e..a85fc9a15f03 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -117,6 +117,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
>   	pmu->event_mapped = pmu_legacy_event_mapped;
>   	pmu->event_unmapped = pmu_legacy_event_unmapped;
>   	pmu->csr_index = pmu_legacy_csr_index;
> +	pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
> +	pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
>   
>   	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
>   }


I see here that Atish added its RB: 
https://lore.kernel.org/linux-riscv/CAOnJCUJ-eE+zbXH0yBX_QBK2ep779q=wNCSrc+BJfzUb+zBCaw@mail.gmail.com/

So I add it here (hopefully b4 won't complain, I don't know):

Reviewed-by: Atish Patra <atishp@rivosinc.com>

And I'd say the fixes tag for this one is:

Fixes: 9b3e150e310e ("RISC-V: Add a simple platform driver for RISC-V 
legacy perf")

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
