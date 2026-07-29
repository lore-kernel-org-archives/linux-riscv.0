Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A8DC53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LrybFADSHAAivEVLeYdzynvVmxDhMAf/cLtZL1n9q8=; b=OKHvASKSlh7LuY
	1c0cuDKD+Ao3DdrhrtY0TYyXcAm5UgQLqMeXdbaMPw3dmhwx8vfLPgSpsvwKGgpglvUHh1Ls4slOK
	XPFow/3PUAYo3aVSoHunxvItCkirFWjg0n1OwiS2Gxfdz6Tlo7CHgvW5oMZTYiDiyTW6XmVMvWRed
	HRBbj+fXEuf3QzW4FeH9MWzyLiPEg1nXmGlmAPxS6NxMRHJPP0rk1EAlQ7aEjPf2CtClv8kK8ub5i
	xGo04wVdivV2mcbOW4ZBNvZmzSvSCiZP37gxTuwiYrQktCAlaKmtvz3K1LfNGimHv2m5+8IL659He
	ns0025l952KDEwieIYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9dx-00000008rYT-46P8;
	Wed, 29 Jul 2026 19:08:41 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9du-00000008rXz-0lai
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 19:08:40 +0000
Received: from [192.168.0.105] (unknown [123.116.48.73])
	by APP-01 (Coremail) with SMTP id qwCowADnu++tT2pqvwQ3Ag--.8799S2;
	Thu, 30 Jul 2026 03:08:30 +0800 (CST)
Message-ID: <41c1a3ed-0afd-4bf9-9749-2031bff00fda@iscas.ac.cn>
Date: Thu, 30 Jul 2026 03:08:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: Fix concurrency in mark_new_valid_map()
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yaxing Guo <guoyaxing@bosc.ac.cn>, "David Hildenbrand (Arm)"
 <david@kernel.org>
References: <20260629-riscv-mm-new-valid-map-ordering-v1-1-60d8c10c6292@iscas.ac.cn>
 <38dad5db-e298-fe26-2189-3a67ed156a4a@kernel.org>
 <5de7e75a-c86c-18e0-b9f4-4d7ff56fe4bd@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <5de7e75a-c86c-18e0-b9f4-4d7ff56fe4bd@kernel.org>
X-CM-TRANSID: qwCowADnu++tT2pqvwQ3Ag--.8799S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KryUJw1DXFyUJw4fAw45Awb_yoW5Jr48pF
	W8K3WSkFn3trWfArn2vF1FqFy09an8tr4fC3s5Jrs09wn8Jw4aqr4IgF4Y9a4rWrs2qF1j
	vr42v3s3ZF98Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUgcTQUUUUU
X-Originating-IP: [123.116.48.73]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_120838_595083_155D7AB8 
X-CRM114-Status: GOOD (  16.40  )
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

Hi Paul,

On 7/30/26 02:46, Paul Walmsley wrote:
> Hi Vivian,
>
> On Thu, 9 Jul 2026, Paul Walmsley wrote:
>
>> On Mon, 29 Jun 2026, Vivian Wang wrote:
>>
>>> Turns out, the concurrency concerns [1] were justified - BOSC reported a
>>> spurious fault in KFENCE that still triggers despite previous fixes,
>>> which KFENCE reports as a false-positive.
>>>
>>> Fix the concurrency problems in mark_new_valid_map():
>>>
>>> - Add smp_wmb() before filling the bitmap, to make sure page table
>>>   writes are "received".
>> Probably this expression should be clarified.  I guess the intent here is 
>> to ensure that the page table write is visible by other cores either 
>> before or simultaneously with the bitmap fill?  And the purpose of that is 
>> to avoid a situation where another core could execute an sfence.vma before 
>> the PTE write is observable by the other core?  If so, we should probably 
>> write something like this out in the commit message.
>>
>> I wonder if there's still a window where spurious faults could be observed 
>> by kfence.  If another core "B" faults (due to its local TLB caching an 
>> invalid PTE) after the PTE write is observable by B, but before the bitmap 
>> write is observable by B, core B won't sfence.vma.  If this possibility 
>> still exists, we should probably document it.  It might be possible to 
>> narrow that window further with a smp_mb() after the bitmap fill, but 
>> unclear that it's worth trying unless more spurious faults are seen.
>>   
>> ...
>>
>> Also, now that we're adding an smp_wmb(), we should probably expand the 
>> preemption-disabled section in kfence_protect_page() to cover the entire 
>> function, to eliminate any risk that the PTE writes execute on a separate 
>> CPU from the smp_wmb().
> Are you planning to update this one?

Apologies for the delay in response. I think your concerns make sense. I
have been thinking about this and discussing this with BOSC and had not
yet come up with a decisive conclusion. There is also some doubt raised
about what this smp_wmb() is actually fixing. Since this is AFAICT only
possibly known to occur on an internal, RTL-only core, I think it would
be better to come up with a better fix than to slap a random smp_wmb()
in here and calling it a day.

Moreover I will be away until August 10. I recognize that this mean this
patch will miss 7.2, but I think that's better than having, as said, a
random smp_wmb().

Again, apologies,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
