Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA92C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19WoevCcedWzdWgb+sU/tQz9jFWm2RzlHKA9tb7Gu/E=; b=oo4dHRlQEVO8vc
	CGirKaZG7HaKguxWH6Y2/znTC7dlMIoy/XUNum/s0fiPJgU/ocAdVzy7TZj+AInYh4dgc8eYP7Ua6
	2PWD7YOaHdhNkUE0DzQuY5ZMnhcrdbqk4sS1B1vAThMNeLrOaK3jERFlcVAj5AspgdjG5wWt/fDfS
	Ywhj/i1nTbrlhWB7L6LyUp/OrHQwa/2wyQl6ukNqhc+tvFg1o7m0Oj7kNjJUvtz7g2tWQfg04t/hW
	yYTJ+qyWqfwVZBGdpkuw/MBaUd2t/pGsgITiiqFLGEIxMgCZbqLtGnmPSuLBFl3UNkTeCtW+nLlX6
	/5u9g5lgm4g3c3A9cCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFIJ-00000003ZYp-2XWF;
	Wed, 29 May 2024 09:08:27 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFIF-00000003ZY3-1Jj4
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 09:08:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44A37C0009;
	Wed, 29 May 2024 09:08:15 +0000 (UTC)
Message-ID: <e34f73ce-bca8-4d18-84cd-9b8d0a6130b9@ghiti.fr>
Date: Wed, 29 May 2024 11:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] RISC-V: clarify what some RISCV_ISA* config
 options do
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 xiao.w.wang@intel.com, Andrew Jones <ajones@ventanamicro.com>,
 pulehui@huawei.com, Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Pu Lehui <pulehui@huaweicloud.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
References: <20240528-applaud-violin-facef8d9d846@spud>
 <20240528-varnish-status-9c22973093a0@spud>
 <f2a3bddd-0cc1-43ca-8421-1d67dd2800f8@ghiti.fr>
 <20240529-riveter-spectacle-e5ab2f45065f@wendy>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240529-riveter-spectacle-e5ab2f45065f@wendy>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_020823_683681_6CC4E391 
X-CRM114-Status: GOOD (  23.33  )
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


On 29/05/2024 10:54, Conor Dooley wrote:
> On Wed, May 29, 2024 at 10:47:40AM +0200, Alexandre Ghiti wrote:
>> Hi Conor,
>>
>> On 28/05/2024 13:11, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> During some discussion on IRC yesterday and on Pu's bpf patch [1]
>>> I noticed that these RISCV_ISA* Kconfig options are not really clear
>>> about their implications. Many of these options have no impact on what
>>> userspace is allowed to do, for example an application can use Zbb
>>> regardless of whether or not the kernel does. Change the help text to
>>> try and clarify whether or not an option affects just the kernel, or
>>> also userspace. None of these options actually control whether or not an
>>> extension is detected dynamically as that's done regardless of Kconfig
>>> options, so drop any text that implies the option is required for
>>> dynamic detection, rewording them as "do x when y is detected".
>>>
>>> Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554f75a676c@spud/ [1]
>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>    arch/riscv/Kconfig | 36 +++++++++++++++++++-----------------
>>>    1 file changed, 19 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index b94176e25be1..3b702e6cc051 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -501,7 +501,8 @@ config RISCV_ISA_C
>>>    	help
>>>    	  Adds "C" to the ISA subsets that the toolchain is allowed to emit
>>>    	  when building Linux, which results in compressed instructions in the
>>> -	  Linux binary.
>>> +	  Linux binary. This option produces a kernel that will not run on
>>> +	  systems that do not support compressed instructions.
>>>    	  If you don't know what to do here, say Y.
>>> @@ -511,8 +512,8 @@ config RISCV_ISA_SVNAPOT
>>>    	depends on RISCV_ALTERNATIVE
>>>    	default y
>>>    	help
>>> -	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
>>> -	  time and enable its usage.
>>> +	  Add support for the Svnapot ISA-extension in the kernel when it
>>> +	  is detected at boot.
>>
>> To me, the new version makes things even more confusing: svnapot mappings
>> will indeed be handled by the kernel (since only the kernel sets up the page
>> tables) but it will only be used (for now) for HugeTLB mappings in
>> userspace.
> How would you suggest that I word it? "Enable the use of the Svnapot
> ISA-extension when it is detected at boot"? The current text implies that
> these options control detection of extensions (which they do not) and
> that is what I am looking to remove as it has caused confusion.


Ok, I see what you mean. Your above suggestion looks great then :)

Thanks,

Alex


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
