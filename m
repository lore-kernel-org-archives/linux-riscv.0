Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD11C6FD1C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 02:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFgKFilskBu6nnA7nMx7lvbwtDjG6IziLGLvETF3+cM=; b=z84vmMsxtNsz0o
	ozli3vm2pll4yUVz7KrVNi5HxgWZ6j3wvol7EGa/zspLVvvrn9oqwdaw6e02DXaQRduxkPVW7uD3d
	WiT64GKUmUUb4NMmsEQEplAvB/finfmQaj0rEDPCCaN/0CIkGAe9oeyLJkwD5rM0vXyDsWzVMnwlM
	aX23pBZq0kBBvmrypOE8hpb7i7deNhcMZe6D2yHg6Y+i0ceh6nvhalfDhg/CBbn6eQdjHlBE69NAN
	eWmM8EVTaXnZmw+3vceXT1M+M+23ZNBYD2mlTRP2amniXY2h//j/Cm9Ir/bBMxOV/NfOwocLOVAzF
	tT9AxUocsnMVJERdfiaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peRmo-00B19c-0N;
	Tue, 21 Mar 2023 02:31:42 +0000
Received: from mail-m11880.qiye.163.com ([115.236.118.80])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peRmi-00B18E-2Y;
	Tue, 21 Mar 2023 02:31:39 +0000
Received: from [0.0.0.0] (unknown [IPV6:240e:3b7:327f:ce40:a4df:e2d6:538e:9d4f])
	by mail-m11880.qiye.163.com (Hmail) with ESMTPA id 27C5620463;
	Tue, 21 Mar 2023 10:31:23 +0800 (CST)
Message-ID: <4a88721a-ac78-bcad-1b33-f9027baab5ab@sangfor.com.cn>
Date: Tue, 21 Mar 2023 10:31:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/2] tracing: Add documentation for funcgraph-retval
 and graph_retval_hex
To: Donglin Peng <pengdonglin@sangfor.com.cn>, mhiramat@kernel.org,
 rostedt@goodmis.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 will@kernel.org, catalin.marinas@arm.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tglx@linutronix.de, dave.hansen@linux.intel.com,
 x86@kernel.org, mingo@redhat.com, xiehuan09@gmail.com,
 huangcun@sangfor.com.cn, dolinux.peng@gmail.com
Cc: linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230320131650.482594-1-pengdonglin@sangfor.com.cn>
 <20230320131650.482594-3-pengdonglin@sangfor.com.cn>
Content-Language: en-US
From: Ding Hui <dinghui@sangfor.com.cn>
In-Reply-To: <20230320131650.482594-3-pengdonglin@sangfor.com.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0oYVh5NTR5CHx5OTB5PGlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUlPSx5BSBlMQUhJTB1BGB5PS0EaTx8dQR5JH01BTkhDHkFCH08dWVdZFhoPEhUdFF
	lBWU9LSFVKSktISkxVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pi46Sjo6CD0LTBALTjoxDSMe
	CT8wChFVSlVKTUxCSE1OQ0NPTkxPVTMWGhIXVR8SFRwTDhI7CBoVHB0UCVUYFBZVGBVFWVdZEgtZ
	QVlJT0seQUgZTEFISUwdQRgeT0tBGk8fHUEeSR9NQU5IQx5BQh9PHVlXWQgBWUFITk5MNwY+
X-HM-Tid: 0a870201c9012eb6kusn27c5620463
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_193136_971067_4F5EC9A4 
X-CRM114-Status: GOOD (  13.14  )
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

On 2023/3/20 21:16, Donglin Peng wrote:

> +There are some limitations when using the funcgraph-retval currently:
> +
> +- Even if the function return type is void, a return value will still
> +  be printed, and you can just ignore it.
> +
> +- Even if the return value is not an error code actually, it may be
> +  displayed as an error code. You should read the code to check.
> +  For example, both 0xfe and 0xfffe are be interpreted as -2.

For char and short types, displaying as signed decimal may be not 
appropriate, because they are rarely used to store error code.

So in "smart" mode (graph_retval_hex=0), I suggest just smart convert 
error value stored in int or pointer to signed decimal.

> +- Only the value of the first return register will be recorded and
> +  printed even if the return values may be stored in two registers
> +  actually. For example, both the eax and edx are used to store a
> +  64 bit return value in the x86 architecture, and the eax stores
> +  the low 32 bit, the edx stores the high 32 bit, however only the
> +  value stored in eax will be recorded and printed.
> +
>   You can put some comments on specific functions by using
>   trace_printk() For example, if you want to put a comment inside
>   the __might_sleep() function, you just have to include

-- 
Thanks,
- Ding Hui


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
