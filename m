Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36383C12002
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 15:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0158E601FC
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 15:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0158E601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdYworW20bdpC4iKOuNR8YyPMypeFz0zY/zav2711nA=; b=CXldIAOQkt5LO/p0R2nqUdHmxL
	suVhiBnNp6DA67Y2oZjLa7Jro+BlQABo8o0xyXiy0JLJzcviB/5vyCmASxz2beKtsgV5QEl7/J5qo
	gHGfaY6WGG8nHJClsG1b68Soe6Ho+xMrlGksHggTaFOJt3VOv+rKMT+QO0blhachLcPYwRrDvj9mQ
	1PJMn4S43gahYRugwgC81hpOWPbueaYR+9QYjTbed9zK1+sEqXk8vf17Wl7iVAZao6RGZxIs4oEUe
	hGVzD5hqjdhunTAM9Q9ujSg4G+nGX/PqHhRPOuvAQfWiGV1DrH0iWCAg0qbooZVXI8kX4fx4rZycV
	1Xj8hKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Pq1-004j7w-MS; Fri, 16 Jul 2021 15:33:17 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Ppw-004j5y-14
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 15:33:13 +0000
Received: from [167.98.27.226] (helo=[10.35.5.170])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1m4Pps-0000Ha-Ke; Fri, 16 Jul 2021 16:33:08 +0100
Subject: Re: [PATCH] riscv: add correct as-options for assembly in modules
To: Bin Meng <bmeng.cn@gmail.com>
Cc: linux-kernel@lists.codethink.co.uk,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20210712174849.2202287-1-ben.dooks@codethink.co.uk>
 <CAEUhbmWmrEuwdy8OPhF1p1Sb7779QiWkx-Ca1OG5VQ38dxChLw@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <36a5d9d8-67be-e128-2798-5bf1989ce06d@codethink.co.uk>
Date: Fri, 16 Jul 2021 16:33:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWmrEuwdy8OPhF1p1Sb7779QiWkx-Ca1OG5VQ38dxChLw@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_083312_125387_1B147C30 
X-CRM114-Status: GOOD (  19.72  )
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

On 16/07/2021 11:44, Bin Meng wrote:
> On Tue, Jul 13, 2021 at 2:28 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>>
>> When trying to load modules built for riscv which include assembly
> 
> nits: RISC-V
> 
>> the kernel loader errors with "unexpected relocation type 'R_RISCV_ALIGN'"
>> due to R_RISCV_ALIGN relocations being generated by the assembler.
>>
>> In commit 7a8e7da42250138 ("RISC-V: Fixes to module loading")
>> the fix for gcc adds -mno-relax to the command line when building
>> C files. However this was never applied to assembly flags, and gcc
>> does no pass -mno-relax to gas when presented with a .S file.
> 
> does not pass

I'll see if I can make this simpler. Should this get done for a v2?

> FYI
> 
> The GCC bug was fixed recently via:
> https://github.com/gcc-mirror/gcc/commit/3b0a7d624e64eeb81e4d5e8c62c46d86ef521857

thanks, I think it still useful to fix this in the kernel.

>>
>> The fix (other than making gcc always pass -mno-relax to gas) is
>> to add -Wa,-mno-relax to gcc to make sure the as is invoked with
>> the right options.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   arch/riscv/Makefile | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
