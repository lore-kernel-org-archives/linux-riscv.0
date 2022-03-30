Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E76C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 22:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jvxhrixjg22gP+9ViewWrfZ8qWxL/oIp1H1nq0Bk2qc=; b=FUBPY9e27AANU1
	PPHhB6lDnBrDdLJI1uqeWWmI62m+HYKD5OITMFusUj0xWxNywW3GesoWeIJfpUWTG0lk2oaGsGocY
	y9HjAKOe9guNJAdoilwTRkgBWnFMIXmKhuIo7Sck8NO3PKfi7aQL+fIf8Id4gD8L7V+J49SbnNWvl
	ed7FyUNKYMyMgSFrFIR1Gk3p88LqGMq3ePlc9SJYxupW9vRPT9BoGLU7S4yNkV5FSG1BnrZr6vbsp
	8WjGwfMV8t5jYxmud9j8YGZ6zDty0tSuXd5AxngCILL7wL6Xo5ndy/D+GJ+2auWktRR92MLJX7FpQ
	0KPVcDcdbCzVgXkU/Z4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZgtF-00025e-8x; Wed, 30 Mar 2022 22:34:09 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZgtB-00024F-Kh
 for linux-riscv@lists.infradead.org; Wed, 30 Mar 2022 22:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1648679645; x=1680215645;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vN678j8+lGQHG6+BC7HU2l7qEDTv5FwFrbQPKj7VLPs=;
 b=heMedr8f+jq7vvGFFuT1/q2wwDw3SkThVBvzrZqtB22QlSdI8Pxp/CTL
 wTkggt21BFt6/vfAGlgn781tl6ejQBDCZqcnF7ZinkT2+paurvN+7o4dk
 aC7NkJnwMPhsLBlyZjbbN8g0C7bC+ethKmxdOITZCbMklpBj9lIh+35/d
 6o/39nq0rBBZc7q1j/iDXEjUBw9PIb0acZ9l3c+oKZPslX1s/6kQ0e1Lv
 DzdGx1UvHBxdHrLZ7BbQOdjLSAcR3oOEyFj9d7dF6qlWquL6rYfbSq3Xb
 PGTHjGfUN3Naye5fLdJLpgFY/TmAS+2oP+5LWiBuQfUYGTserI3zcgBjn A==;
X-IronPort-AV: E=Sophos;i="5.90,223,1643644800"; d="scan'208";a="195559780"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 31 Mar 2022 06:34:02 +0800
IronPort-SDR: mdmP0oH2zjWU6KbD/bL/4ZePHhc8wmJN8YoZsgJHuSYF4Ihp6nKnPSLtuAtvg9bIiv9T7xVQLf
 uhX36tRW/hViSsmZCz0XLED6YQonkI+tO+6+VKqA+0QGSfS+ruMKKUFO7c8Qy6PMTClTPADt/B
 KC85OjlnWJDI5Xmk/MTxLPkYpu25fwG4I9H4ZE/1W9n1EsgTeIu5iaTVY9WcK3UNiJvXjFijHV
 /t+s/unLIb9DIbwAZSlV9KY+Ebu1PcQ7aJeIAkGUhgbC4UIdTC2Cju5rRBqVF4tH5Xd7pqcpMK
 vrwL7du7xOXeG7Ipoaqb7h/n
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2022 15:04:52 -0700
IronPort-SDR: 2kQiF8GA+DgtizIEEsfSY+ukscOL3ERYTVo9LjgufvpAyh/IoNvGr5hreT75WYEygskZGKTTz9
 O3i2nPCsU4yhtvxQDp/Efy5wuDvA69A7wyYOLPUV/gSWY7OGGCDKb2JYFOcYtgQqlK8sfSaq+b
 fMmpXijZjOvfQWC4lLCBQx5WOrH0LPetRGd6lwGNwutNH7e4gXAuTJ77VDkLavFUb/aje4G75W
 o/zWM3JBzPOynsblY6mYCYa9/9SwGHNevo66LI9NutonDOhkM2bqK0SYjRtSXrhrul2ztLQX4n
 1m8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2022 15:34:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KTLnj3rq3z1SVp2
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 15:34:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1648679640; x=1651271641; bh=vN678j8+lGQHG6+BC7HU2l7qEDTv5FwFrbQ
 PKj7VLPs=; b=fwQc1Q3Gbs+KZL3VYfZyM3DmZrjPI/D9DDxAwxv3WANICbDOIsv
 cHr2L5cVdeYp2BTv1MRV1RVAF3xv/fo9ETy9R6rGktf4tJb2ouBgU62ymA3qurCA
 Q3B5C3B6Oq27l02THM16d66wICOLBoZJLr9iCstmfczsaWNPbTm40WMqCsqT/omW
 IKe01d+Q5r4m7+EASguhSIvvwyLZiQsG8G+A98I5U5dQQal+1uBKN8zHYw+QB8DT
 cK406kfneia7CZeQMsdx7s3cUwzWEysXq9G68XZnvbH+zMJZ5B60G57utepMiFJh
 JHDg0eJ6pIAT50kxYFnmbf86AKLbfcYyv1A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id tMoDdbPMhGuQ for <linux-riscv@lists.infradead.org>;
 Wed, 30 Mar 2022 15:34:00 -0700 (PDT)
Received: from [10.225.163.121] (unknown [10.225.163.121])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KTLng07XLz1Rvlx;
 Wed, 30 Mar 2022 15:33:58 -0700 (PDT)
Message-ID: <98afa9c9-28d1-1147-2538-e8c0dfeadde4@opensource.wdc.com>
Date: Thu, 31 Mar 2022 07:33:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] riscv: Ensure only ASIDLEN is used for sfence.vma
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org, anup@brainfault.org, atishp@rivosinc.com,
 guoren@kernel.org, Alistair Francis <alistair.francis@wdc.com>
References: <20220330214358.3409766-1-alistair.francis@opensource.wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220330214358.3409766-1-alistair.francis@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_153405_814141_CEFDC902 
X-CRM114-Status: GOOD (  29.59  )
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

On 3/31/22 06:43, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> When we set the value of context.id using __new_context() we set both
> the asid and the current_version with this return statement in
> __new_context():
> 
>     return asid | ver;
> 
> This means that when local_flush_tlb_all_asid() is called with the asid
> specified from context.id we can write the incorrect value.
> 
> We get away with this as hardware ignores the extra bits, as the RISC-V
> specification states:
> 
> "bits SXLEN-1:ASIDMAX of the value held in rs2 are reserved for future
> standard use. Until their use is defined by a standard extension, they
> should be zeroed by software and ignored by current implementations."
> 
> but it is still a bug and worth addressing as we are incorrectly setting
> extra bits.
> 
> This patch uses asid_mask when calling sfence.vma to ensure the asid is
> always the correct len (ASIDLEN). This is similar to what we do in
> arch/riscv/mm/context.c.
> 
> Fixes: 3f1e782998cd ("riscv: add ASID-based tlbflushing methods")
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  arch/riscv/mm/context.c  | 2 +-
>  arch/riscv/mm/tlbflush.c | 2 +-
>  include/linux/mm_types.h | 2 ++
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 7acbfbd14557..4329fe54176b 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -22,7 +22,7 @@ DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
>  
>  static unsigned long asid_bits;
>  static unsigned long num_asids;
> -static unsigned long asid_mask;
> +unsigned long asid_mask;
>  
>  static atomic_long_t current_version;
>  
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 37ed760d007c..ef701fa83f36 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -42,7 +42,7 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
>  	/* check if the tlbflush needs to be sent to other CPUs */
>  	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
>  	if (static_branch_unlikely(&use_asid_allocator)) {
> -		unsigned long asid = atomic_long_read(&mm->context.id);
> +		unsigned long asid = atomic_long_read(&mm->context.id) & asid_mask;

It would be a lot nicer and less error prone to have a small helper
function for this, no ?

>  
>  		if (broadcast) {
>  			sbi_remote_sfence_vma_asid(cmask, start, size, asid);
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 8834e38c06a4..5fa7cc0af853 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -666,6 +666,8 @@ struct mm_struct {
>  
>  extern struct mm_struct init_mm;
>  
> +extern unsigned long asid_mask;
> +
>  /* Pointer magic because the dynamic array size confuses some compilers. */
>  static inline void mm_init_cpumask(struct mm_struct *mm)
>  {


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
