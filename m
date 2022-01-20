Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D29C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 23:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhwtzfewDXE/EjN45k+zI9JNr5oH6fdEXwxMFjuY46Y=; b=TGC4btbpe/eiin
	ETLJnKZFjKI2WuYMM+2BpgWWA6JKg73suVoh1th0VFh5iZt/4E3EYzGLMN8Q7fQPcJLxIXuFSoCPG
	gvH+1lwwoabJZib1gZPhhptmTXhSXPgCWa9zt/+gICCQbslJll3hh4jRlJ9ysK1SRQAvGStPgtyRY
	3dx3q7T/Hh06LMT8qp4vrlHaLDaOTqYErNoihBrxr1Hwq/sYCIfk75dvTIRwHCoSwLGmjUUDEuddw
	HS16JKHGPnwTDvNqkL1ULyU8enUnAPD/1YzJNhKx858capvHRO3iglfR/WDTDCKG4Z3wyGoIr9uWF
	DmbGfpVsXshRboWLztkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAgsS-00DNhJ-JQ; Thu, 20 Jan 2022 23:30:00 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAgsP-00DNgG-Sj
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 23:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642721397; x=1674257397;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=psspI7jUka7l1HTgpKRAQLRWFYkD2vqA6mSKTaIxNZw=;
 b=bWRBqXoN9IAiXkfL+RctbAbsraXZPCVN7tTIUa8hcmlP4n5U2p7WG+4R
 GtodOyfPnyDY/z1t9iqvZrYn+ZLW6meOCMhgDaHNLUYeht3JSLyV2r1p+
 OUlMziom+aAuZbMPJ4Q1D2Na4VCaAUAzPf0hGsXszk/foraJf3T6PV26z
 +KBTq/f3IP8RihWDbuz5494Bd4EF45Rdr6qSBnRmurOPZzt29lMnNqLRR
 Hfaj29PyjHNNqoYtG3+m/iq530OgkOu8iPkzzvR8m69EOMCUzRoFIE9fo
 NNFFeldGuEKoGpSa8zPXqYhUdU4UUdhrcS1aGtDdhmr1VhkFNk8T73aTF g==;
X-IronPort-AV: E=Sophos;i="5.88,303,1635177600"; d="scan'208";a="295059617"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 07:29:55 +0800
IronPort-SDR: CQY10fhRPcIRitNF/iwKk/ezwrPO6QUeUr9gAHce30o9JKsmaWKeMPWRfuJaEZHZsJ3kBFAOjE
 HMum1CEAgFICzOXArFPtaBeNNjDVpZrTNRFf61E7+x4b0wGvDhJofoOelW3/Av1XM0g1z/cAS2
 z56AkJJ3oU24dmmck1026xp0vKv6h6BJkk5tlADeJWGZp+scG69fDHzq3S07c+9YZ3f52na4M7
 QB56eecaQZE8QVMmABffByxOH4vUpq0mwpozMI7cvgRJJH3utZrG5YxSSwjK8mphORsFTmb/zs
 lrdkT8otWpiCV/kKekbchc3x
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:03:23 -0800
IronPort-SDR: C3R5s71EmtnMbKfc9DUUxMGWm89vqTXTTr708KdyDDgQJptD6Sjff4783rgt0N2BIWDbmtCR5u
 9scxT4MEv7iO8PASHA0+3Zfz4EFlqC+Bmz/K8yPLMQTt61sK9g8Kmir56GZhqq9+kXnumEfl6c
 AOS9lsSK7+gpYvn/+5tMFIeDvZRlzZZZnDTQnRIHDkx6VP60QvE9CL77Cev498F8cCshRiG7c0
 Atenwp4lVTJiRvofqB31zKw2UpAGC2Z7B73t5hRgM7FlBvwwZkDvJWTPHwnsb2MPaDdATToI/T
 TSM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:29:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JfzJ24CqKz1SVnx
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 15:29:54 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1642721393; x=1645313394; bh=psspI7jUka7l1HTgpKRAQLRWFYkD2vqA6mS
 KTaIxNZw=; b=nY+bK1p5f/y16LwFAL7SRWdDg7OIvvNrGkwWjmYQFwv5jekFLTp
 BNnh2xgLpwC33+Cz1um2D6OGCVGHUtfSQPgPJq7a63cS0SjdIg7vWa+Pvx6I6JYH
 i0RZftMH8W95u/hPMwYpipEfVl14/ZSrTWJ7qBY4NH68Padde8AsKTQJG6NtNuHM
 fWT76bnC1YYJ/m0g18kYzRevsV1Y9qDJOrW1MzcBLrLuynPboCY0I4UXPueuXWMM
 GMOgCCuiK/Vs6fU9gKaDqYmokP0wpYglni87fn1tnFgTNzW1YeQo+df9iaf/1Zx3
 JV72TK0jVg2JE0xZ9OlOTJcMeEqeeGeJfbg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 3t7TD-M8u0aI for <linux-riscv@lists.infradead.org>;
 Thu, 20 Jan 2022 15:29:53 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JfzJ030Z8z1RvlN;
 Thu, 20 Jan 2022 15:29:52 -0800 (PST)
Message-ID: <730eae0f-6d79-f84b-fe63-a1c4223d7379@opensource.wdc.com>
Date: Fri, 21 Jan 2022 08:29:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re:
Content-Language: en-US
To: Vitaly Wool <vitaly.wool@konsulko.com>, Myrtle Shah <gatecat@ds0.me>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, LKML <linux-kernel@vger.kernel.org>
References: <20220120152828.4089364-1-gatecat@ds0.me>
 <CAM4kBBJqHVX_Q2C0VO7qKNZywRiWbHK9t0G076ov6u+_gwO2=A@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <CAM4kBBJqHVX_Q2C0VO7qKNZywRiWbHK9t0G076ov6u+_gwO2=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_152958_057984_4BB6AF56 
X-CRM114-Status: GOOD (  20.91  )
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

On 2022/01/21 0:37, Vitaly Wool wrote:
> Hey,
> 
> On Thu, Jan 20, 2022 at 4:30 PM Myrtle Shah <gatecat@ds0.me> wrote:
>>
>> These are some initial patches to bugs I found attempting to
>> get a XIP kernel working on hardware:
>>  - 32-bit VexRiscv processor
>>  - kernel in SPI flash, at 0x00200000
>>  - 16MB of RAM at 0x10000000
>>  - MMU enabled
>>
>> I still have some more debugging to do, but these at least
>> get the kernel as far as initialising the MMU, and I would
>> appreciate feedback if anyone else is working on RISC-V XIP.
> 
> I'll try to support you as much as I can, unfortunately I don't have
> any 32-bit RISC-V around so I was rather thinking of extending the
> RISC-V XIP support to 64-bit non-MMU targets.

That would be great ! I am completing the buildroot patches for the K210. Got
u-boot almost working for SD card boot too (fighting a problem with rootfs
kernel mount on boot when using u-boot though).

> For now just please keep in mind that there might be some inherent
> assumptions that a target is 64 bit.
> 
> Best regards,
> Vitaly
> 
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
