Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC14C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNlwiX/A0TF0A+CUvDdlZawAWzvPwzb0Xo0eE74kiPw=; b=aSMbOmzg9MWF/q
	5LS9zCRpHxK2tKoEQt//yWIulVFGYB1v97HdrY4qDA/I/DnyTEvPuriqPVQJHZjr9VKoAAX91WWYf
	0bPHhxnWSuxbBVNraj1zBZcr3F3ihESZ4NmKiedkiqAG8FOgRRLlEM9yLAxwSTYARek/1yOc3NM1s
	ILqjy3Y+mKn+YGzWyKk4ky+5HSb0Qx7poQU97ifPKierwtZLz5LOXUJqm+ER9yp/5B1/tqXBTFeOa
	p2J2qzKYeCq5jBBJf1TPG9fcxXzWZd+yQ8wfCymxBU/E3/YoXOuJSwwJqit6xACLt1tO1yX3YbV2I
	St7gUU2iYLBhF/pNY10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSfTK-00GYWq-7G; Fri, 11 Mar 2022 13:38:22 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSfTF-00GYSk-41; Fri, 11 Mar 2022 13:38:21 +0000
Received: from [167.98.27.226] (helo=[172.16.103.108])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nSfSn-0000Di-Kl; Fri, 11 Mar 2022 13:37:49 +0000
Message-ID: <509d2b62-7d52-bf5c-7a6c-213a740a5c00@codethink.co.uk>
Date: Fri, 11 Mar 2022 13:37:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
Content-Language: en-GB
To: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang
 <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org,
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 the arch/x86 maintainers <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-14-guoren@kernel.org>
 <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_053817_173626_C231C90B 
X-CRM114-Status: GOOD (  17.45  )
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

On 11/03/2022 02:38, Guo Ren wrote:
> Hi Arnd,
> 
> On Mon, Feb 28, 2022 at 12:30 AM <guoren@kernel.org> wrote:
>>
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> If the current task is in COMPAT mode, set SR_UXL_32 in status for
>> returning userspace. We need CONFIG _COMPAT to prevent compiling
>> errors with rv32 defconfig.
>>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Guo Ren <guoren@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> ---
>>   arch/riscv/kernel/process.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>> index 03ac3aa611f5..54787ca9806a 100644
>> --- a/arch/riscv/kernel/process.c
>> +++ b/arch/riscv/kernel/process.c
>> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>>          }
>>          regs->epc = pc;
>>          regs->sp = sp;
>> +
> FIxup:
> 
> + #ifdef CONFIG_COMPAT
>> +       if (is_compat_task())
>> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_32;
>> +       else
>> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_64;
> + #endif
> 
> We still need "#ifdef CONFIG_COMPAT" here, because for rv32 we can't
> set SR_UXL at all. SR_UXL is BIT[32, 33].

would an if (IS_ENABLED(CONFIG_COMPAT)) { } around the lot be better
than an #ifdef here?

>>   }
>>
>>   void flush_thread(void)
>> --
>> 2.25.1
>>
> 
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
