Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C2DC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 20:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Sy7ImYzMi5XWxhpgUhPQItDznrDsY5uiJVKknVAttwo=; b=fiEV+vO3deatz+QEa/COBr8grk
	2qy8ft/2MYqLexx/yb1fNwVKomenqBRHGbOa8lhqzNl2R+DBXF9uQHsyEhQ822l3vZfMyvyoylau4
	5ScxZtTF9FQk4v39jozwBpz8W8y6m0TdXdWx5Y0cfXadxvzYzTp/emFWyEK+U9CScd7T4epy0uu0U
	vr/aF17fHmDGqPPkeSOy2Csz3O/pt0mwbwfjBJQA+26h4QrEmy6lBXf/OjluBsY6oLBrE6n7FunoZ
	9etOXx2XuixudfnBGAHnpXa8TncYSheUXnK0rWwBSg8uIO9OoiJFf1KzmeSDXAjO1FnEWJcQ8VDY0
	Y0J1YX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ptY-00AjMM-Qd; Thu, 01 Dec 2022 20:10:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ppR-00AiDH-Ee
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 20:06:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id a9so2676219pld.7
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 12:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eECL7FFsHBH2zCKlJm2Sf1U0/PkSsC+DaNCICiNrHA4=;
        b=7ETsuVw75zM20YPxF79vgzShYETVvs5HQJDjgduACfj2mUDnyE17YFhf0CHhdiKqWD
         /AfYtm/ccEoBX8vXWy2GYwmXzG03S67tezDAW5ER53aGynhfLPoeVKqLvArKDmy39i/F
         aL6chILSuXx74UTjGA/dYe+R4hJX/3dye42BapjHVlGbgts6QmVt7dCJFbG3OpWoN47z
         jILXdwAzK+n+1SRVEYLXPQRdDQsZU09NR6SA5ZaUwqP8fnVDSF7Yt09Nj+yG8FVp0i+I
         e1xQeseSq2Dl6uTPinAerUlmh3KaI0o9ND7siRKwN+gbTy5X+aR6J55ejrbm4Jdra7Rb
         jXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eECL7FFsHBH2zCKlJm2Sf1U0/PkSsC+DaNCICiNrHA4=;
        b=3ZIbzMgB0ij0R3XUkAooiV+fHnHTQ4f5aqmmyvftoc/IOlfOIMDlnbJ6hM9q2ZQUeO
         0lNW82EFHQgoey6boKN41o+XiVVKlKeVokXMkbY+HIFeKJhAopbObG30oyF9elifQc04
         g+yfc8Uij+0jIKtiga1xQllxCIbnJj4gyGMgj0kDIwVyDFEiKo0omI68dLgjfmMXB5yl
         V2uYS1aSKXFbvGpOgD7cwdHWmg4YqafEbJsz4GZ1Rl8DILAz/sAhSYB9vZmcUuRUwGxm
         PJXCSGEbEHpnACh8lQxw9njm0tcj3N98nIulIEItIkVxCb1x62+J7yRNw9YEIa/xL101
         fQJQ==
X-Gm-Message-State: ANoB5pla9dkKdW38Txs/FyJRvw9gWp7SHWo+Cntdg3ywAVwP273yuZPt
	7SQdRXYx1gQmgDs6T+WIt5lczg==
X-Google-Smtp-Source: AA0mqf763Eoc8HmJOusQht95t6nP6Z+b5yytGjvvh2a2H45c3AhWwYKHfOZ5pFzWbwg+HCmknfKIbA==
X-Received: by 2002:a17:90b:1186:b0:219:2f17:f952 with SMTP id gk6-20020a17090b118600b002192f17f952mr24170757pjb.195.1669925199763;
        Thu, 01 Dec 2022 12:06:39 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902cecd00b00186e34524e3sm4043394plg.136.2022.12.01.12.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 12:06:39 -0800 (PST)
Date: Thu, 01 Dec 2022 12:06:39 -0800 (PST)
X-Google-Original-Date: Thu, 01 Dec 2022 12:06:29 PST (-0800)
Subject: Re: [PATCH V4 6/7] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
In-Reply-To: <Y4kIcGY0rXTGb3po@spud>
CC: guoren@kernel.org, anup@brainfault.org, Paul Walmsley <paul.walmsley@sifive.com>,
  Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de, rostedt@goodmis.org, mhiramat@kernel.org, jolsa@redhat.com,
  bp@suse.de, jpoimboe@kernel.org, suagrfillet@gmail.com, andy.chiu@sifive.com,
  mark.rutland@arm.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-2612202a-d3bf-4b2b-9b8b-df67b38b5315@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_120641_507248_965D2B3A 
X-CRM114-Status: GOOD (  18.24  )
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

On Thu, 01 Dec 2022 12:02:56 PST (-0800), Conor Dooley wrote:
> On Mon, Nov 28, 2022 at 10:32:29PM -0500, guoren@kernel.org wrote:
>> From: Song Shuai <suagrfillet@gmail.com>
>>
>> This patch adds DYNAMIC_FTRACE_WITH_DIRECT_CALLS support for RISC-V.
>>
>> select the DYNAMIC_FTRACE_WITH_DIRECT_CALLS to provide the
>> register_ftrace_direct[_multi] interfaces allowing users to register
>> the customed trampoline (direct_caller) as the mcount for one or
>> more target functions. And modify_ftrace_direct[_multi] are also
>> provided for modifying direct_caller.
>>
>> To make the direct_caller and the other ftrace hooks (eg. function/fgraph
>> tracer, k[ret]probes) co-exist, a temporary register is nominated to
>> store the address of direct_caller in ftrace_regs_caller. After the
>> setting of the address direct_caller by direct_ops->func and the
>> RESTORE_REGS in ftrace_regs_caller, direct_caller will be jumped to
>> by the `jr` inst.
>>
>> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
>> Tested-by: Guo Ren <guoren@kernel.org>
>> Signed-off-by: Guo Ren <guoren@kernel.org>
>> ---
>>  arch/riscv/Kconfig              | 1 +
>>  arch/riscv/include/asm/ftrace.h | 6 ++++++
>>  arch/riscv/kernel/mcount-dyn.S  | 4 ++++
>>  3 files changed, 11 insertions(+)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 1d0e5838b11b..2828537abfcd 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -278,6 +278,7 @@ config ARCH_RV64I
>>  	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>>  	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
>>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>> +	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>>  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>>  	select HAVE_FUNCTION_GRAPH_TRACER
>>  	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
>
> Please sort new entries here in alphabetical order, so move the new
> entry up by one line :)

IIRC whomever sorted these entrties orignially posted a script that does 
that.  Maybe that should be integrated into either checkpatch or one of 
the patchwork robots so we don't have to manually remember the alphabet?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
