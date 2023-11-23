Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67227C5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZDVC3rJUy1iVsRqBGffx7hXNzuZTJV9M1+k/bXxbYw=; b=HjM8VYB9YuhOay
	aaKoFlryBCbv0vjENPY5JV9UsLA5zTjyGwq83IJbDID23FlSdLhrZUD2LJe2vbhkI2v8hlZPM29YC
	aIlmXoZpDfo+zZtj1mG3RntlduJS1I5f0eE6OuTq3UHPNkM0bWTFJdCNOGewMdDe0Ol8Z2Mmi1foD
	Qdx/+I9Ra+TT0x+M6eNw3/wiYuy2150tjNNR4KJfiQtbBIFI/Ve5oYvTQkXP6Hm5Refmk4UNqJKVN
	f0ymODxcdTpTPNT6M5ZtIVIad+THMnaWjOll2kwKw2kpjCV/RRSfFtKq2BAzRJ7KT6ngDb5sMrkLm
	2kW74ylpmKPkMuxljkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AAa-004xdh-2s;
	Thu, 23 Nov 2023 13:55:04 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AAX-004xcY-2K
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 13:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HegN/JokOC5Cr/ra274AGW9sR3rftIw8sv970+pSd7k=; b=l6pvcBENv8JrmMpHh6qfKz+3rM
	cvRvXrsdv6sYkFpiGcfJzb5pSatqH50Y6EuZzymPoC4st0NTCjOIl/sS+NteehG4zwNvbDP6vcQpD
	ZWkHoDv0cdKyK1eVDk6q1GMIlTblDC4czyAAoaVvHGCbv8Gls58ZPADN4a8RcRpP1Bt+zAVMAPJ+W
	zGuSIZEno1in3XoI27HSjJ2UbRF8Nd2kwP/D5wbMVrwd8V/8rPWPy9XK+lL5XIkWlCn4XJDtt1kYw
	fJxTJOmvxXK092bCnAgHkvA6HR8sQoqy85MwI1EIRGHxa6wv+SUM3kGsVS8PXxUtsgHR2wDAQ6Js6
	cA4vwMkQ==;
Received: from [167.98.27.226] (helo=[10.35.4.236])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1r6AAR-004SyZ-GP; Thu, 23 Nov 2023 13:54:56 +0000
Message-ID: <1b937600-bfb5-4378-ba27-b4f3e0068cbd@codethink.co.uk>
Date: Thu, 23 Nov 2023 13:54:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: declare overflow_stack as exported from traps.c
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <20231123134214.81481-1-ben.dooks@codethink.co.uk>
 <20231123-blooper-very-cefbf92c0f05@wendy>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20231123-blooper-very-cefbf92c0f05@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_055501_844854_7F126DA0 
X-CRM114-Status: GOOD (  11.16  )
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

On 23/11/2023 13:51, Conor Dooley wrote:
> On Thu, Nov 23, 2023 at 01:42:14PM +0000, Ben Dooks wrote:
>> The percpu area overflow_stacks is exported from arch/riscv/kernel/traps.c
>> for use in the entry code, but is not declared anywhere. Add the relevant
>> declaration to arch/riscv/include/asm/stacktrace.h to silence the following
>> sparse warning:
>>
>> arch/riscv/kernel/traps.c:395:1: warning: symbol '__pcpu_scope_overflow_stack' was not declared. Should it be static?
>>
>> We don't add the stackinfo_get_overflow() call as for some of the other
>> architectures as this doesn't seem to be used yet, so just silence the
>> warning.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> I suppose this should also be
> Fixes: be97d0db5f44 ("riscv: VMAP_STACK overflow detection thread-safe")

Thanks, never sure if the Fixes: should be applied when it is simply a
warning fix and there's nothing actually being currently flagging an
issue with anything else using it (currently just the assembly)

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
