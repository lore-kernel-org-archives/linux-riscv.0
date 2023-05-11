Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44363C7EE24
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 05:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1f0Mos73HO02ow2uUTaCC7svY6dWEuzWt3EW7Qe/xWw=; b=bANiF5YyZaLqez
	wbrlnKpcNB8cUtjALvIZ2MA+VdNexcTD1k35IGgC20xyPUYO8GE56NUmf/6cAiDmcpXGvT7vJTh0t
	Buwx6FghDqCWdtBBmTS+HekJy7e0w0p7I7CRmRzezXrFKClFbyLf/bga2WcQ55WMs3N57Fuhaaq+t
	p3hBGmDKjdvTBTWAIgIIXfJcv6ssgPurrTQ8bu8jIZNTdOV2sJdnzAz9/3G0BUQKt/Fkp8nt4L3KI
	t9EIoghPeLtKBjVd1n/NYE6eQQ0fhyvnAQ9nYknRjn2eK6N0cUZLzFibZxTyAqrfueZrLp40SLrYP
	KAfSXdHHzAlG8kXt2/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwyin-007rgR-1Z;
	Thu, 11 May 2023 05:20:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwyil-007rfG-1H
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 05:20:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF6A160AF3;
	Thu, 11 May 2023 05:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F6FC433D2;
	Thu, 11 May 2023 05:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683782406;
	bh=FTIiBKAFL2DBhGmuNd5YDha3nOeMeeEPUsMzvvwTkns=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Bf2kwxM4phlrWRg/r1CkMCQDlPsdamEGJKd2jCkYnLrmCYjelecnIfCCiROrmvLfH
	 5pREYWIA5SL1/5VRC+8sewFUFvndWE0VayP8xgjqJg9NOIiSxylI8g6LU624Cg+Wvq
	 eCgE/DEtzNwXWGwV/AOy0ycZZDiZeqjS1o7sJfHygdnlpAVva0pW26csUq0fn+A3m7
	 OgtVB7BoT1EWLx8y5P5qaTh+YWv+MewmaBP2zExhTJQlQjo96TsmvpFUjNvWDi2AgG
	 urXMg2lyY4mjHI0ymB8HGvFD9Jkw3edus0u6tzi9voKJTvz0NEOZEfc0zyeswV0oI3
	 UP3nCQY8F2RIg==
Date: Thu, 11 May 2023 06:20:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>, Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: add entry for T-HEAD RISC-V SoC
User-Agent: K-9 Mail for Android
In-Reply-To: <ZFw8u9uqaRvCEQCI@ofant>
References: <20230510204456.57202-1-frank.li@vivo.com> <20230510204456.57202-5-frank.li@vivo.com> <ZFw8u9uqaRvCEQCI@ofant>
Message-ID: <AA64B50D-DAA9-4329-B4BA-BAC20224C7A3@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_222007_479327_39796567 
X-CRM114-Status: GOOD (  12.62  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 11 May 2023 01:54:19 IST, Yixun Lan <dlan@gentoo.org> wrote:
>Hi Yangtao:
>
>On 04:44 Thu 11 May     , Yangtao Li wrote:
>> From: Jisheng Zhang <jszhang@kernel.org>
>> 
>> Jisheng:
>> I would like to temporarily maintain the T-HEAD RISC-V SoC support.
>> 
>> Yangtao:
>> Wei and me would like to help support and maintain too.
>> 
>> Cc: Icenowy Zheng <uwu@icenowy.me>
>> Cc: Wei Fu <wefu@redhat.com>
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>> ---
>> v2:
>> -add Yangtao and Wei
>>  MAINTAINERS | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7e0b87d5aa2e..592769efd1d1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18155,6 +18155,14 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
>>  F:	Documentation/devicetree/bindings/riscv/
>>  F:	arch/riscv/boot/dts/
>>  
>> +RISC-V T-HEAD SoC SUPPORT
>> +M:	Jisheng Zhang <jszhang@kernel.org>
>> +M:	Wei Fu <wefu@redhat.com>
>> +M:	Yangtao Li <frank.li@vivo.com>
>> +L:	linux-riscv@lists.infradead.org
>> +S:	Maintained
>> +F:	arch/riscv/boot/dts/thead/
>> +
>>  RNBD BLOCK DRIVERS
>>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
>>  M:	Jack Wang <jinpu.wang@ionos.com>
>> -- 
>> 2.34.1
>> 
>
>Don't get yourself wrong, no objection personally..
>
>But as I saw, none of contributors has affinity with T-Head, so no idea how this will
>work well.. always better to take over maintainership after show enough commitment..
>
>Anyway, raise your comments, and I'd more than happy to be proved I'm wrong
>

They're more than welcome to be the maintainers IMO.
Being the vendor is no guarantee of commitment either!
Guo Ren, who does work for T-Head, was the one who suggested that
Wei Fu would be a good person to add here.
If they don't end up maintaining it, it'll fall back to me anyway & I'd prefer
to give people a chance.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
