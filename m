Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD7BC6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 01:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSmDOfEUPQqaPbQuqlNXqiOOr5KrE+VcDzPXzAPknGQ=; b=pwi0dxqEkEgbbE
	/YvVBznyEy4FlidyeGa/X+y15nGyW2R6+MkxjcFZpJT1HK2ASOWUh5EDBmslQ0U70xz2DaNIJ2B7n
	4OORRn8ZJxi5LsRyQ1Wkzj5ZYmuS8TYcJ38NZKDyUdyV8wPCBt8vVJRKLdbM98o+EgWgYov0RP0Vc
	vQhO5gPVHHKGUU+4BZWs72WCLggzco0XgUUYKSmpGoDZbTFifzvWbRyUDSO2qG3mfVteKwAyusCwz
	1vpuVpHyXOhBmh7u7BGWYdslJzyloFcm1cevugfD/jbfDH1F98Qsny6kgz9A6EKhGr7/S/UZwl4Cd
	Hu62SuLuUw3lIRwmrp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1penab-00EGvg-1j;
	Wed, 22 Mar 2023 01:48:33 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1penaX-00EGtZ-16;
	Wed, 22 Mar 2023 01:48:30 +0000
Received: from [10.128.10.193] (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 5BCED58042A;
	Wed, 22 Mar 2023 09:48:23 +0800 (CST)
Message-ID: <5f7b6ecb-7729-e9d9-5a13-24ad74a4bb83@sangfor.com.cn>
Date: Wed, 22 Mar 2023 09:48:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 1/2] function_graph: Support recording and printing the
 return value of function
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, linux@armlinux.org.uk,
 mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com,
 peterz@infradead.org, xiehuan09@gmail.com, dinghui@sangfor.com.cn,
 huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230321084650.769212-1-pengdonglin@sangfor.com.cn>
 <20230321084650.769212-2-pengdonglin@sangfor.com.cn>
 <89607a60-d3a7-4f89-84ae-bf3e65efb487@spud>
From: Donglin Peng <pengdonglin@sangfor.com.cn>
In-Reply-To: <89607a60-d3a7-4f89-84ae-bf3e65efb487@spud>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSBhPVhpITB1NTU5IHh9KT1UTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS09ISFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MAw6Kio6Kz0UHxU9KSkCFxo*
	PyhPCUhVSlVKTUxCT09CTEtPTk1KVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFISUtCNwY+
X-HM-Tid: 0a870700c6d92eb7kusn5bced58042a
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_184829_512993_3F9D3796 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

On 2023/3/22 6:27, Conor Dooley wrote:
> On Tue, Mar 21, 2023 at 01:46:49AM -0700, Donglin Peng wrote:
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index c5e42cc37604..3efa4f645a39 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -139,6 +139,7 @@ config RISCV
>>   	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>>   	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>>   	select HAVE_FUNCTION_GRAPH_TRACER
>> +	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
>>   	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
> 
> BTW, and this is such a minor nit, but if you end up having to do a respin
> of this for some other reason, would you mind adding the new option in
> alphabetical order?

Thanks, no problem.

> 
> Thanks,
> Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
