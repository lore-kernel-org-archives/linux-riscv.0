Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FC4C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOT3Gf0QSjJ11NJeBgQTlVmvS/qtyZbXbKaLxln/IxI=; b=NsYXh471HgYoKw
	r0VsaBIYG3qzBeoEyldMBt6AglHKkiDk6GPYEYYDttyIJH0jgyagI0P0CAi2AWhBhToeKXB2p8m2p
	hN4FA5NrwHwQLZR5RDVFg1wPbRbWRLJ/sQnMWVA1fJSDAljMMbTXH+S0MUZlYHk7N3VDQ1sA7jzki
	1PAvJDxoehC92UHXoV/TvBLaR17L5ssrSD5hTjfvFjKJ3WEn49LV/g7I19QdgNuNe06ykhQ7N3YV4
	WV8ikFGfKkOFxAeqMItUyv7FrsE3rtorQT6zrS0VrlONm9GuE2MS7p9xdc9au3G+mgk2FGbaqTnfx
	WF9cvbjBq1kt6qd2RQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osRuS-006nnU-RD; Tue, 08 Nov 2022 16:57:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osRuH-006nQw-8c; Tue, 08 Nov 2022 16:57:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D30E1FB;
	Tue,  8 Nov 2022 08:57:00 -0800 (PST)
Received: from [10.57.5.11] (unknown [10.57.5.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1FCB3F703;
	Tue,  8 Nov 2022 08:56:50 -0800 (PST)
Message-ID: <1b2f25e5-cd60-a533-14be-a608f4c801bd@arm.com>
Date: Tue, 8 Nov 2022 17:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/5] ACPI: PPTT: Remove acpi_find_cache_levels()
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gavin Shan <gshan@redhat.com>, Peter Chen <peter.chen@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
References: <20221108110424.166896-1-pierre.gondois@arm.com>
 <20221108110424.166896-4-pierre.gondois@arm.com>
 <20221108161315.lmm3sakza5quyzlv@bogus>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20221108161315.lmm3sakza5quyzlv@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_085701_395956_7692A2AF 
X-CRM114-Status: GOOD (  13.15  )
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



On 11/8/22 17:13, Sudeep Holla wrote:
> On Tue, Nov 08, 2022 at 12:04:19PM +0100, Pierre Gondois wrote:
>> acpi_find_cache_levels() is used at a single place and is short
>> enough to be merged into the calling function. The removal allows
>> an easier renaming of the calling function in the next patch.
>>
>> Also reorder the parameters in the 'reversed Christmas tree' order.
> 
> Not sure if the above is worth mentioning explicitly. Even if you do,
> 'parameters' sounds very confusing to at-least me. I was searching for
> the changes is some function parameters to understand what it was and
> finally realised you meant the stack variable declaration order here.
> Right ?

Yes right, I will use another word.

> 
> 
> Other than that, it looks good.
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> 

Regards,
Pierre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
