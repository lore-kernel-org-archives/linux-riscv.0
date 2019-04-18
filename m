Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89211C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:24:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587D121479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:24:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jidqq41y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 587D121479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pk+owFXjIqZV5SRUbf1NCEWOwQxD4dV1ds3qaCzNH50=; b=Jidqq41ydIqpM3lKoSdEyXasm
	u1XUSWk+iRu9DaELqdXF1dOjKmWOBSXUnZ7ZN3Vdy3VqYQ/Q4Jhm2sxM31BzcAwafCfwa3866Xy4g
	W4M51ApwPyyYgCyqhdkCzBqFYWVAC8HzoYeXhrDhhTtSvwm65J5I6pzK2GK7NhYIO/HGvmsLctVxH
	C8f65XZDA4B3Ty3XtmlBUO3D7HvHdOmy8HYt0p9Bzc4gOrCl9P68vioIxVMO/HWIXntitJ3jB2Z0g
	f2Ul1eBUqrieSNQ5EdBvcwsOWmynUmGhCUg0w7Gy+Fng059ZVzK/Lcoy0zIsWVuDM1TibZcV8J+wb
	zGyU/4isw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGzWk-0006Bf-JS; Thu, 18 Apr 2019 05:24:02 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGzWb-00063C-G1; Thu, 18 Apr 2019 05:23:55 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2D76460003;
 Thu, 18 Apr 2019 05:23:38 +0000 (UTC)
Subject: Re: [PATCH v3 02/11] arm64: Make use of is_compat_task instead of
 hardcoding this test
To: Kees Cook <keescook@chromium.org>
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-3-alex@ghiti.fr>
 <CAGXu5jKVa2YgAkWH1e26kxd2j6C4WsJ38+Z3K1z7JRvr_jDX6Q@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <1f63cf5a-6bbe-fa55-75c0-20322d8a7f36@ghiti.fr>
Date: Thu, 18 Apr 2019 01:23:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAGXu5jKVa2YgAkWH1e26kxd2j6C4WsJ38+Z3K1z7JRvr_jDX6Q@mail.gmail.com>
Content-Language: sv-FI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_222353_714375_5F6D54CF 
X-CRM114-Status: GOOD (  15.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Burton <paul.burton@mips.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/18/19 12:32 AM, Kees Cook wrote:
> On Wed, Apr 17, 2019 at 12:25 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>> Each architecture has its own way to determine if a task is a compat task,
>> by using is_compat_task in arch_mmap_rnd, it allows more genericity and
>> then it prepares its moving to mm/.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Acked-by: Kees Cook <keescook@chromium.org>


Thanks !


> -Kees
>
>> ---
>>   arch/arm64/mm/mmap.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
>> index 842c8a5fcd53..ed4f9915f2b8 100644
>> --- a/arch/arm64/mm/mmap.c
>> +++ b/arch/arm64/mm/mmap.c
>> @@ -54,7 +54,7 @@ unsigned long arch_mmap_rnd(void)
>>          unsigned long rnd;
>>
>>   #ifdef CONFIG_COMPAT
>> -       if (test_thread_flag(TIF_32BIT))
>> +       if (is_compat_task())
>>                  rnd = get_random_long() & ((1UL << mmap_rnd_compat_bits) - 1);
>>          else
>>   #endif
>> --
>> 2.20.1
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
