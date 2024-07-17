Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC26CC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 11:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qa10k+Iagy3rAeE3J1rtb/qOMMfK+6gopk9gV7XEb7E=; b=AB47Fde6QuHfa1
	x1KCMqz0J65ft81zke5TYXlpYI0AD/8Iq7sxPnxnyVqlzIgb9VXh6il+caKiYiHIw+iXf/bMOc01I
	fkXDeNmVBrxXpH6ibZzMdCtaQESES4RxFfiDeGzBQVQk7E73+Cd3QUqJjJtg3bhR8UOFhpQjc8JW1
	mjixRvwgtBVwokv4n4WKuC8L/wjEprdkR+tAdSva9DCoSa1cT2pi7AcltDAdroJ1aXvQEGHAcSziS
	bcupcSHw4ImXQB5UA6JLCaFb/oUUZW8AELs58o0PFcU4LH9raR1WTBLMmwzgchSeqiL6JMmLm7O1k
	dFgaBz2K4AbXD5dNyatQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU32V-0000000Dews-3Cg6;
	Wed, 17 Jul 2024 11:41:43 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU32I-0000000DevK-2Thj
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 11:41:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C6CA60008;
	Wed, 17 Jul 2024 11:41:23 +0000 (UTC)
Message-ID: <203e8784-54f2-43ea-a442-833d7e4a06c8@ghiti.fr>
Date: Wed, 17 Jul 2024 13:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: Allow to build only with LLVM >= 17.0.0
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel test robot <lkp@intel.com>
References: <20240717111716.157149-1-alexghiti@rivosinc.com>
 <20240717-synapse-decade-a0d41bd7afce@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240717-synapse-decade-a0d41bd7afce@spud>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_044130_797911_FB8DCE6A 
X-CRM114-Status: GOOD (  19.93  )
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

Hi Conor,

On 17/07/2024 13:32, Conor Dooley wrote:
> On Wed, Jul 17, 2024 at 01:17:16PM +0200, Alexandre Ghiti wrote:
>> The following build failure happens when using LLVM < 17.0.0:
>>
>> kernel/sched/core.c:11873:7: error: cannot jump from this asm goto statement to one of its possible targets
>>
>> This is a known issue [1] so let's upgrade the minimal requirement for
>> LLVM to the version 17.0.0, which is the first version to contain the
>> fix.
> I think doing this unilaterally is kinda insane, LLVM 17 isn't even a
> year old. Debian testing doesn't have anything later than 16.


Debian will very likely select the qspinlocks when available anyway, so 
they'll need llvm >= 17. And Debian won't ship a kernel >= 6.11 until 
some time right? So they'll probably update their infra to llvm >= 17 
(and they'll probably do to take advantages of the new extensions).


> Why does
> it need to be done unilaterally rather than just when the qspinlock
> stuff is built?


We can do that indeed, it may happen again and we can keep requiring 
llvm 17 on a per-config basis.


>> Link: https://github.com/ClangBuiltLinux/linux/issues/1886#issuecomment-1645979992 [1]
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202407041157.odTZAYZ6-lkp@intel.com/
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> If Nathan wrote the patch, you need to set him as the author of the
> patch :)


I thought I did, how should I do that then?


>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>
>> This patch was done by Nathan, I'm just sending it as an RFC to get quicker
>> feedbacks.
>>
>> I tested it successfully.
>>
>> Note that the build failure happens on the not-yet merged qspinlock
>> patchset.
>>
>>   scripts/min-tool-version.sh | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
>> index 91c91201212c..e81eb7ed257d 100755
>> --- a/scripts/min-tool-version.sh
>> +++ b/scripts/min-tool-version.sh
>> @@ -28,6 +28,8 @@ llvm)
>>   		echo 15.0.0
>>   	elif [ "$SRCARCH" = loongarch ]; then
>>   		echo 18.0.0
>> +	elif [ "$SRCARCH" = riscv ]; then
>> +		echo 17.0.0
>>   	else
>>   		echo 13.0.1
>>   	fi
>> -- 
>> 2.39.2
>>
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
