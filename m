Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D60CCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 17:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LAd6zJzCpN/F/GmZahPGvxEvI9OM8mndRIJ8vv+IGM=; b=4mq4kUTopP12l5
	yZUuIvC1KkX9cJnT4RvxPfsIY3Zvz4qoBPBxA7Y3UWpISNOM7VyGS/zi3j7/FaMxIKvLC55frH5gb
	2vQqAy1U0AUqOb+u5tTXgZ3kC6sqy7l+hZpkmqcn2/sA0MYaY4B9nhv/2H/wkXgC/IOkq/wyj9JSA
	58Pi4pB5YsALPM340FsqLY+4KXXFR99MoNyt3Xkb0ignBwPtYWOuTpKXeUlQSRY8uh6ZIotXZpJFk
	rzzr8pXJCm5kD8f/Cq00h5kpJAC2k3Vji+d2Pukh/05D7c1MvRrGtyzzOwk4FBWMifWrmPlE1CFIO
	EBcqq95GB2vEeRZgwWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBym0-000000072AH-3cSX;
	Thu, 23 Oct 2025 17:06:48 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBylx-0000000729Q-3AOT
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=JQ02uB+hVuk7Dfjgyfi1PK4xXFrdFCRIeqB1WxseMr8=; b=W9tvopmPOee23Ca0
	k27t7EDhYIomRpQf0Gl62ceiKFX/VvbXf5Uyyg5oD70G+QonpEJ5BJH2SnxwYdpySXxr3CCR3tMKN
	8JbMfxhKp/YNN+mAWBUdy83BzO57HGy9SMffaL+8/JIiXd6gQ5MDmKBGPF6HXC4KsOwLesCX5BnAY
	Ys7Wz3A198kgZCAKw+0lHaGEP3v7Tf+VQd4Vla0P02BZg4+usF/O3h19vCx9PcwRrWJ+M2lI3tOJD
	oVJUc/fqNwbfFQUGFeIKOpcb/FaFvqDpwruCDVGvW0mzu8PYqfNwh1gWpYYQv3Snpi9ilip0dN0/Q
	yqs/NRDsvu3MN1qn1g==;
Received: from [63.135.74.212] (helo=[192.168.1.241])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vBylt-00BbOx-Kp; Thu, 23 Oct 2025 18:06:41 +0100
Message-ID: <d8e188c7-3929-429f-9e24-b5566af42b23@codethink.co.uk>
Date: Thu, 23 Oct 2025 18:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: asm: use .insn for making custom instructioons
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, ajones@ventanamicro.com
References: <20251017165527.701934-1-ben.dooks@codethink.co.uk>
 <857ab359-4eef-73c6-0085-7c3bd5dba687@kernel.org>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <857ab359-4eef-73c6-0085-7c3bd5dba687@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_100645_881320_2AD30D34 
X-CRM114-Status: GOOD (  13.87  )
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

On 17/10/2025 19:25, Paul Walmsley wrote:
> Hi Ben,
> 
> On Fri, 17 Oct 2025, Ben Dooks wrote:
> 
>> Using .word breaks with big endian builds, making something which
>> is not a valid or worse an instruction or pair that does something
>> which is not intended.
>>
>> It would seem sensible to add an ASM_INSN() wrapper for anyone to
>> use for hand assembly of instructions.
> 
> Looking at the GNU as documentation for RISC-V:
> 
>    https://sourceware.org/binutils/docs/as/RISC_002dV_002dDirectives.html
> 
> it seems that RISC-V .insn supports several argument formats that .4byte
> wouldn't.  So it seems this is only applicable for opcodes specified as
> hex bytes?  Might be worth adding that to the macro name in some form.

Changed it to ASM_INSN_I


> Also, looks like this is missing the opcodes added in commit
> 1d4ce63e338fc.  If you update this one, could you please add those as
> well?

I'll go change those too.

Thank you for the review.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
