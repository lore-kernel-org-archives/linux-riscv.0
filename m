Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70E0EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 22:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=DKA9C4cEElZ8cNmuNS1iSwUDzZO205UNKR6ELxVAwPY=; b=nMBqgsQPrQ3l49ytVBE/rfnKw8
	JnkeD31XexvX9y4qnz2qHIkv/qBTd5ECBHIMnEU19suyEQbBWLCZOjad9nFSZG3hyCa9Nh1Lz1OPH
	lZmA2xzFdhj5WeVRT3oZS9IjRhMtO/WZmHdrC/89MpZZ8SDhIQdHUenv1x1HDqvrfTnCM21zQrwWd
	pFPU83MxkMeqXq3Jnhs/4RaaU7VLbOGAFqg83cE3qLxgiVyANlKcdiO58QmefPJVwVckAEfNth/Ox
	knEMObDEb5VwhOVPhNDtDLqEagKGc9r27xLfLwnpq/R02tOsciDVVxkw5igxlFm0cd77N8o79DSYf
	7heb83Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJMJR-00G1vO-2e;
	Tue, 11 Jul 2023 22:58:29 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJMJO-00G1uw-20
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 22:58:28 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666edfc50deso91404b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 15:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1689116304; x=1691708304;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeLvW6D54qYtLtvV95QMxdsxsHGn9g+mFHvvl4agGGw=;
        b=zveT6mE3hRwUkRV2JFTDkocB6GXTSrdEgogx+FhQ+HIkVEC1zMVussEvCpIzB2P3Jx
         7Vzn/l649Laf9WvcAHiWt6r8huPY/x6wdX9lMbtF3W1kRtGOU/RI19r19YVumF4PIIO3
         90QF9budYvTYIF3k1PiIzb5j8EzKyOmGaVXCfmFeNHMk9r5XC+vOwezgxvX1zCz6udXt
         0uWU6TQHvKl2pt7tUFCRhQFKWppfopqopa2EXyVoMwl8krZxuuzXLqvTVqGcMtdZ+dvG
         hWokZ0zM2mlIYSdDD3W26xLVg50rq4lR/Gn6h3HGkJS1kPOGRgi1bNgqqQKEnRR1fYb6
         0gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689116304; x=1691708304;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeLvW6D54qYtLtvV95QMxdsxsHGn9g+mFHvvl4agGGw=;
        b=P+0JLaenDLREoMfufuKZtlbpniDdGF32T4U4HxAhnZsYpDeUwa9e7G7kmx4rQ1MF7Q
         kX0lwDL7X5uXkr62UQ8gnZHTRMni9VJxLLrExKMFHr8PDRVsXgk9mhvf4FsK8529CUZP
         90WLmPXGgxDgBSZSMhyV14vrZeKPVF1GeA16+93PtbkGIzxebeltWr+GsXFKBFVcsNIQ
         S7T83wvbr5kbiY19dOaKQTebitNZCM4unnmowAiCG88/sd5rqINsk7P80RvhbhlH0GPa
         QegOMZ68M29Say3kQJvaCLOFIgSnlQH5Qp0EwqANG6eSm2AF6aqq9P9U05f27ITCH1Fr
         jKaQ==
X-Gm-Message-State: ABy/qLbAb9F6eIpJ5cwL1OoZ9h74YaaxfLBjnZoHJ2EBZj0O4On1Of1o
	G9GPKTTefdqhFOAbuQc2W+zB2Q==
X-Google-Smtp-Source: APBJJlGbVeR+usq5mkjJSkRjIfg6unR5oIgdwcaqHF6GztUBJut44qmTWRK0Xdqw5QfzKHKOS6iUNA==
X-Received: by 2002:a05:6a00:3927:b0:673:6cb4:7b0c with SMTP id fh39-20020a056a00392700b006736cb47b0cmr322214pfb.2.1689116304551;
        Tue, 11 Jul 2023 15:58:24 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id j9-20020a62b609000000b00678afd4824asm2254698pff.175.2023.07.11.15.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 15:58:23 -0700 (PDT)
Date: Tue, 11 Jul 2023 15:58:23 -0700 (PDT)
X-Google-Original-Date: Tue, 11 Jul 2023 15:57:37 PDT (-0700)
Subject: Re: [PATCH V2] riscv: Add BUG_ON() for no cpu nodes in devicetree
In-Reply-To: <20230630-blasphemy-tapestry-85755d24cbc3@spud>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-e321737a-1406-4d22-b93b-6baa1b900461@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_155826_893959_82E8CA53 
X-CRM114-Status: GOOD (  24.70  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, suagrfillet@gmail.com, greentime.hu@sifive.com, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 30 Jun 2023 11:39:24 PDT (-0700), Conor Dooley wrote:
> On Fri, Jun 30, 2023 at 06:59:38PM +0800, Song Shuai wrote:
>> When only the ACPI tables are passed to kernel, the tiny devictree created
>> by EFI Stub doesn't provide cpu nodes.
>> 
>> While if append the "acpi=off" to kernel cmdline to disable ACPI for kernel
>> the BUG_ON() in of_parse_and_init_cpus() indicates there's no boot cpu
>> found in the devicetree, not there're no cpu nodes in the devicetree.
>> 
>> Add BUG_ON() in the first place of of_parse_and_init_cpus() to make it clear.
>> 
>> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
>
> I'm still not really convinced that this is needed - not finding the
> boot CPU is a strong a hint as any that your DT is completely broken.
> Especially if you intentionally go out of your way to disable ACPI on a
> system that requires it to boot.
>
> I'll leave it up to Palmer or whoever to determine whether this is a
> valuable change. Code change itself much improved though, thanks - I'd
> give an R-b/A-b other than that I question whether there's any value in
> adding another BUG_ON(). You could've kept the part of the comment that
> explained what the error meant though, but that's not a big deal.

IIUC this is just reduntant: if the BUG_ON triggers then there's no 
CPUs, so we'll end up with no iterations of the loop and thus no found 
CPU and thus a BUG_ON.  The only difference is the SBI probing, but 
that's just poking SBI to turn off spinwait.

So I think we already crash sufficiently on systems with an empty DT.  
Sorry if I'm missing something, though?

> Thanks,
> Conor.
>
>> ---
>> Changes since V1:
>> https://lore.kernel.org/linux-riscv/20230629105839.1160895-1-suagrfillet@gmail.com/
>> - revise the commit-msg and move the BUG_ON into of_parse_and_init_cpus() as Conor suggests
>> 
>> ---
>>  arch/riscv/kernel/smpboot.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
>> index 6ca2b5309aab..04d33afbdf55 100644
>> --- a/arch/riscv/kernel/smpboot.c
>> +++ b/arch/riscv/kernel/smpboot.c
>> @@ -147,6 +147,8 @@ static void __init of_parse_and_init_cpus(void)
>>  	int cpuid = 1;
>>  	int rc;
>>  
>> +	BUG_ON(!of_get_next_cpu_node(NULL));
>> +
>>  	cpu_set_ops(0);
>>  
>>  	for_each_of_cpu_node(dn) {
>> -- 
>> 2.20.1
>> 
>> 
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
