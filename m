Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E92C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 01:45:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6E2C2082C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 01:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uI6TJfk8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="eeU2PHF5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6E2C2082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=f7LDVD0FRCmnfNbYq7m5qV6l1Jp1wgyD/Xe8wpn35pU=; b=uI6TJfk8FsXvpQUFozFpf1MWs
	glVYD/Pfj8x1WfgU7vG+qe1qlPqGPYg0YR4otPvGLnwxiLOk/dwBqd/VRmjYzgM83eEDMBuDFUK56
	3KinGRuUitIgKL4WyKjIXQqdQvzx/81rzpKVVTPXi8eFFPlRROR7MH+qzXREdrvo+UWwUL0+gujsi
	zJPvW2FAXZW75m3/yx0QU5d+wIibc0JMVD4zWFTs7Y4A8L+DVMUs2a7t6VZaSrzPduFn+tgUiRJbY
	MIcu+JDOzuzZbfjSk+HkxGs+Wi2nMFEQOqovAVyo/rl1+xthX0d0poiHXoz4iZrfqHGNhhuQv2be4
	4yfnGqYXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g64Jw-0003fb-6J; Sat, 29 Sep 2018 01:45:24 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g64Jn-0002SG-DE
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 01:45:21 +0000
Received: by mail-pf1-x442.google.com with SMTP id j26-v6so5405276pfi.10
 for <linux-riscv@lists.infradead.org>; Fri, 28 Sep 2018 18:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+BUVeW5f7nhpy1dnH/n6Ghv3BNDXkkcNFzAT4AvDmSM=;
 b=eeU2PHF5P3Mqkg+6qSYSOYMyH0psV3IBHwYcVLwjzIQep0esvXuq38jYXcuoUl5xzh
 rEbL7/aH5LyF941axglEbRVcAJLQ2q9n/7lynGBrynuid2CIc1KmH78FZNBWBhZgFeog
 zT6oUh4fiJvnQzVxFSIfFeV+9JHef9KihnAlHrOq3VQVigAzZVrCweHqG0kZh8iFs7QR
 5rlQOkHFPGNR92phAc6JpvWybeUeCgutfuvQQ7VTdx/XRJKFiexpAO4+R4BI4oWynV0N
 AEPLAjq84eiVe84PjlBbI2JPDUUWGSto+LQevdTBThYgdLmah2J8GiFfhtsnC0sYcWkZ
 9+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+BUVeW5f7nhpy1dnH/n6Ghv3BNDXkkcNFzAT4AvDmSM=;
 b=hKwV1t08HvBjtf82bNE2uIqNoM8FGmyjfRjYafR8/0Wc0bKpyJJBVweKqXFF0MslL4
 oI7bgECR/9yByGkCmLe+lUY48VO4980kMUAzBF1cgIUux8yDXPfwkfy9xCXRhVI2pxrK
 7nGjwOdYjR44YSO2ztielF3S75Je24QY+vP+iKujL/2GCsWTmg0sNBXb3W69OxMXEMb2
 La08NqthA/vzfooR8yxO66XOML8lDSdAAapjZypSmFJMUHPRA5sJoOWmEeJU8VEz8aDW
 P++yyBj+D4+Ka+Re1XNulk2d/T04vKjLiVlMEtYgvoA7l3jlYP3VBdciaLjYOOe1u71O
 DHFg==
X-Gm-Message-State: ABuFfogdHRVTD8vsUeHpeTCriLFFBlA84Nct/n7MCrE79OtgCfxFB6Hm
 Eo13p1vzFwgnnEouZzuS/wO4Lw==
X-Google-Smtp-Source: ACcGV62mj6cKF93FqpdBbf8nxxSwvlac+ZpIu4CJ7LXBtA3v1uYUhdF1Xo2+IxGiyQDseP+e0xXJtg==
X-Received: by 2002:a62:6781:: with SMTP id
 t1-v6mr1165389pfj.200.1538185504701; 
 Fri, 28 Sep 2018 18:45:04 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id h4-v6sm8579471pfe.49.2018.09.28.18.45.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Sep 2018 18:45:03 -0700 (PDT)
Date: Fri, 28 Sep 2018 18:45:03 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Sep 2018 17:51:16 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Show IPI stats
In-Reply-To: <20180910134659.GA30774@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-2395876e-5470-45f9-83e1-4abae5188b0c@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_184515_523343_5891B660 
X-CRM114-Status: GOOD (  17.80  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929014503.jncrwVh3D0W9JL0kcYJLlmanWHjOSTnVFXTNYqPbYaY@z>

On Mon, 10 Sep 2018 06:46:59 PDT (-0700), Christoph Hellwig wrote:
> On Fri, Sep 07, 2018 at 06:14:29PM +0530, Anup Patel wrote:
>> This patch provides arch_show_interrupts() implementation to
>> show IPI stats via /proc/interrupts.
>>
>> Now the contents of /proc/interrupts" will look like below:
>>            CPU0       CPU1       CPU2       CPU3
>>   8:         17          7          6         14  SiFive PLIC   8  virtio0
>>  10:         10         10          9         11  SiFive PLIC  10  ttyS0
>> IPI0:       170        673        251         79  Rescheduling interrupts
>> IPI1:         1         12         27          1  Function call interrupts
>> IPI2:         0          0          0          0  CPU wake-up interrupts
>>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>
> Thanks, this looks pretty sensible to me.  Maybe we want to also show
> timer interrupts if we do this?

IIRC we used to have some issue where the timer interrupt ID in 
/proc/interrupts aliased with a possible PLIC interrupt ID, but that was back 
when we had a big mess of chained interrupt drivers that didn't really talk to 
each other.  I think at some point I might have just removed the timer 
interrupt from /proc/interrupts as a hack, but now that our interrupt 
controller mess is sorted out it'd be better to have it.

I'm fine taking this without the timer interrupts, as something is better than 
nothing.

>> --- a/arch/riscv/kernel/irq.c
>> +++ b/arch/riscv/kernel/irq.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/irqchip.h>
>>  #include <linux/irqdomain.h>
>> +#include <linux/seq_file.h>
>>
>>  /*
>>   * Possible interrupt causes:
>> @@ -24,6 +25,14 @@
>>   */
>>  #define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
>>
>> +int arch_show_interrupts(struct seq_file *p, int prec)
>> +{
>> +#ifdef CONFIG_SMP
>> +	show_ipi_stats(p, prec);
>> +#endif
>> +	return 0;
>> +}
>
> If we don't also add timer stats I'd just move arch_show_interrupts
> to smp.c and make it conditional.  If we don't this split might make
> more sense.

Makes sense, but I think timer interrupts are more interesting to see than IPIs 
so we'll eventually pipe them through.  Might just be my workloads, though :)

>> +static const char *ipi_names[IPI_MAX] = {
>> +	[IPI_RESCHEDULE] = "Rescheduling interrupts",
>> +	[IPI_CALL_FUNC] = "Function call interrupts",
>> +	[IPI_CALL_WAKEUP] = "CPU wake-up interrupts",
>> +};
>
> No need for the explicit array size.  Also please use a few tabs to
> align this nicely:
>
> static const char *ipi_names[] = {
> 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
> 	[IPI_CALL_FUNC]		= "Function call interrupts",
> 	[IPI_CALL_WAKEUP]	= "CPU wake-up interrupts",
> };

I don't see a v2 of this, was there one?  If not then I'll just clean up 
ipi_names and drop this on for-next.

Thanks for the patch!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
