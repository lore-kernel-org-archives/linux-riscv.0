Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1E8C77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b71zK1yFGhYl+jA13u/xsPP9mj9bOMVG00Oc3T/Vtlw=; b=GtgY2bUM3P4AwX
	pT++viyFwdhC3AVJp2mqmefuKFW98c62sXIaksJ/bEqLxEiAZaAM9KpLKd7wY0Rcc1uVCF07uZlca
	DT46PhyIpwmSRvqXmrV+2QOQTiimnn5tKjbMLIZun87XrZNRwRF47/DR8423COpoPUEvTlc47+Y/U
	DNx3/GqEuZWZFsBOtKBOkqdDuGhUWa92I+EC4kHw0MTB3mJIkizefTegkW2VZ2o0I5UpjFuGKgaIw
	yRnbfq0ygJ6NQBV3KK7qUDl7+3mbyIUgSEnM415kFvIduqduZq+Swr7JhITBMNHQQ7s4teb7P5GFD
	Wyh4mAgMIKyhcai9F7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psmqJ-00Crnk-2X;
	Sat, 29 Apr 2023 15:50:35 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1psmqH-00CrnQ-2c;
	Sat, 29 Apr 2023 15:50:33 +0000
Message-ID: <18779686-4e3a-c0a7-0e76-5bf1d151d2e2@infradead.org>
Date: Sat, 29 Apr 2023 08:50:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] riscv: fix sifive and thead section mismatches in errata
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Evan Green <evan@rivosinc.com>
References: <20230429043530.20503-1-rdunlap@infradead.org>
 <20230429-exclusion-specimen-f47b03c6d859@spud>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230429-exclusion-specimen-f47b03c6d859@spud>
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



On 4/29/23 02:50, Conor Dooley wrote:
> On Fri, Apr 28, 2023 at 09:35:30PM -0700, Randy Dunlap wrote:
>> When CONFIG_MODULES is set, __init_or_module becomes <empty>, but when
>> CONFIG_MODULES is not set, __init_or_module becomes __init.
>> In the latter case, it causes section mismatch warnings:
>>
>> WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_fill_cpu_mfr_info (section: .text) -> sifive_errata_patch_func (section: .init.text)
>> WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_fill_cpu_mfr_info (section: .text) -> thead_errata_patch_func (section: .init.text)
>>
>> It appears that CONFIG_MODULES not set is not tested very much.
> 
> I dunno if it the testing is *that* rare, because I'm not sure that the
> fixes tags below are correct. I think that it is actually:
> Fixes: bb3f89487fd9 ("RISC-V: hwprobe: Remove __init on probe_vendor_features()")
> That was only applied on 20/04.

Yeah, that Fixes: commit looks like the right one.
I'll send a v2.

Thanks.

> 
>> Fixes: a8e910168bba ("riscv: implement module alternatives")
>> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Heiko Stuebner <heiko@sntech.de>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-riscv@lists.infradead.org
>> ---
>>  arch/riscv/errata/sifive/errata.c |    8 +++-----
>>  arch/riscv/errata/thead/errata.c  |    6 +++---
>>  2 files changed, 6 insertions(+), 8 deletions(-)
>>

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
