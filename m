Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D045C05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymfOFQLbysBCovO5LEuETaIuvzEPokpELqLjVOobG/Y=; b=ed4MlgJKj7tTpA
	+wKJk/w9noV2ov7LJacjMUIG4sl1K+unWO2IkoRM6eqPE3m2Tv2bX/+VCndVTGg7LCIwX8UMFIhcu
	R1CBXSzq1BHqyYxI1E+VGHsNCmtBhpiA0ZrGuykpDKDfVfu2GIT3ozz6uek3wUkCR1ArMsbYOvL3h
	2cQXPKgzUMnFKia8EPAgbLiU1fu80MPupEOZS1N/lhNMAE9oKKsDFH4OTUnn+GMLR+hWuvhZOJQk0
	gWo+DEV3z2PHBr1GiBtIbBIpat5b8h/jHkoMaIzaXecHxOjXEOZhTGJldqUctCiMiN0M2BLLWkJ3m
	X4/Jk9maCBcS8izDyDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKy8n-00ABvF-CV; Thu, 26 Jan 2023 09:01:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKy22-00A8ni-MO; Thu, 26 Jan 2023 08:54:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37D19C14;
	Thu, 26 Jan 2023 00:55:27 -0800 (PST)
Received: from [10.34.100.128] (pierre123.nice.arm.com [10.34.100.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F7463F71E;
	Thu, 26 Jan 2023 00:54:42 -0800 (PST)
Message-ID: <26a57d7f-5917-c54b-2f96-492346a599a1@arm.com>
Date: Thu, 26 Jan 2023 09:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 6/6] arch_topology: Build cacheinfo from primary CPU
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
References: <20230104183033.755668-1-pierre.gondois@arm.com>
 <20230104183033.755668-7-pierre.gondois@arm.com>
 <CAMuHMdUjgxgOXf5He1x=PLn7MQTjZgFQUHj8JrwbyweT4uOALQ@mail.gmail.com>
 <20230124140420.4srnufcvamvff77v@bogus> <Y8/tl999NQwbPL/R@wendy>
 <20230124144839.2szjjv256j3pdaif@bogus>
 <20230124145541.2xwtr7ro2bjnsjd7@bogus>
 <20230125145423.pid3hsstswzuez73@bogus>
 <CAMuHMdWZ+_kdMp+0VfYAJZRHBWiyobQQJwEM_kHN6yeVVGxSvg@mail.gmail.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <CAMuHMdWZ+_kdMp+0VfYAJZRHBWiyobQQJwEM_kHN6yeVVGxSvg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_005454_836030_EE7184B7 
X-CRM114-Status: GOOD (  21.01  )
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

Hello Geert, Sudeep,

On 1/25/23 16:28, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Wed, Jan 25, 2023 at 3:54 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>> On Tue, Jan 24, 2023 at 02:55:41PM +0000, Sudeep Holla wrote:
>>> Geert, can you please try with the patch Conor pointed out and see if
>>> that helps to fix the allocation failures[1]
>>>
>>
>> Sorry for the nag, but did you get the chance to test -next with [1]
>> and see if it fixes the cacheinfo memory failure you were observing ?
> 
>> [1] https://lore.kernel.org/all/20230103035316.3841303-1-leyfoon.tan@starfivetech.com/
> 
> After applying that patch, the issue is gone.
> Thanks, sending my Tb!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

Happy to hear the issue disappears with the patch, thanks for solving the issue,
Regards,
Pierre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
