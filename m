Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550FDC77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 07:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RaPCOPN2XvwQDd/8WLGgXFjVLuy584dsOtrFNZsQ2g=; b=LA3l7ioPzHv4Jy
	a0lVONGRur3RBFKaHeS5SXoAEleb2cggGxAsyWyWWXzxrK4FJ9g6jMcLlAckHctaoSig7/bp6do8Y
	cHcebUnoDbYVXXhyZ1WIRJnch82rTY8osukKJVxjcst9H3xb4Iotpzx57SDeIS0ZHdq0+cbxapOA2
	vvlVljE4cn1J3a/6/Yx04pN3d6CazIJYH7QWLBjPg9DKH51FJNjFRebFShN7Y+qwlgieJCpXYmDyy
	cPHWsZwEgLKXmIn8b+TKOPdv0eg1oIpekSZ6tKv1zsfcl8jFxUmn7+Aze7zslXMWGm7b0RBAQw/r5
	Wu1HygSPlBOq2+q6wFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEH8-008c33-05;
	Fri, 14 Apr 2023 07:55:18 +0000
Received: from mail-m127105.qiye.163.com ([115.236.127.105])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEH3-008c1K-2u;
	Fri, 14 Apr 2023 07:55:15 +0000
Received: from [172.23.196.219] (unknown [121.32.254.149])
	by mail-m127105.qiye.163.com (Hmail) with ESMTPA id 5D0BD580169;
	Fri, 14 Apr 2023 15:55:08 +0800 (CST)
Message-ID: <7eabae11-6a65-c51d-ff39-8205057e497a@sangfor.com.cn>
Date: Fri, 14 Apr 2023 15:55:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v11 1/8] function_graph: Support recording and printing
 the return value of function
Content-Language: en-US
From: Donglin Peng <pengdonglin@sangfor.com.cn>
To: mhiramat@kernel.org, rostedt@goodmis.org
Cc: huangcun@sangfor.com.cn, dinghui@sangfor.com.cn, catalin.marinas@arm.com,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 bp@alien8.de, tglx@linutronix.de, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, linux@armlinux.org.uk, will@kernel.org,
 peterz@infradead.org, mingo@redhat.com, zhangqing@loongson.cn,
 chenhuacai@kernel.org, kernel@xen0n.name, dolinux.peng@gmail.com,
 x86@kernel.org, linux-trace-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Florian Kauer <florian.kauer@linutronix.de>, dave.hansen@linux.intel.com,
 hpa@zytor.com, xiehuan09@gmail.com
References: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
 <1fc502712c981e0e6742185ba242992170ac9da8.1680954589.git.pengdonglin@sangfor.com.cn>
 <66fe9288-05ff-1bf3-dd40-e7b3cbdf1af9@sangfor.com.cn>
In-Reply-To: <66fe9288-05ff-1bf3-dd40-e7b3cbdf1af9@sangfor.com.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaH0gfVkJJS0sfHkxNSR1OTlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpJSlVISVVJTk9VSk9CWVdZFhoPEhUdFFlBWU9LSFVKSktPSEhVSktLVUtZBg++
X-HM-Tid: 0a877ec2d1ccb283kuuu5d0bd580169
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PU06Sgw*Lz0IHiEXNwwuMEIf
	Vi9PCxNVSlVKTUNKT05DQkpLSktLVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSklKVUhJVUlOT1VKT0JZV1kIAVlBSE9CTjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_005514_078429_8D4EAE2A 
X-CRM114-Status: UNSURE (   6.68  )
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

On 2023/4/14 15:44, Donglin Peng wrote:
> On 2023/4/8 20:42, Donglin Peng wrote:
>> Analyzing system call failures with the function_graph tracer can be a
>> time-consuming process, particularly when locating the kernel function
>> that first returns an error in the trace logs. This change aims to
>> simplify the process by recording the function return value to the
>> 'retval' member of 'ftrace_graph_ent' and printing it when outputting
> 
> There is a mistake, the retval member is added to ftrace_graph_ret.

Hi Steve, could you please correct this mistake before merging it into
linux-next?

> 
>> the trace log.
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
