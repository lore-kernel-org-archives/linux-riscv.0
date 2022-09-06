Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD58ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtCyDgg7/TJXPRpppSf1ktHoTOCvV5Kj6jGGx+Z52Zg=; b=HdWWmZdptU/1md
	ZwzZlz4E2D690EuselM1cbd/3cWnyrN6cYNAoZleRnG7NHs9E5NRAyiuz64s3CtE2iAYF709Yw2dp
	l1tpPmgUef5geIBmxQz1Q1/aC6KVBaF9hf4USLi9XJ5v+u6LliS2xYG3j24gualHzCMzLKSAAz+ro
	sCHQwuOhvEDwf4x4uAJ6Xw6LkEYzPkasSmaruQzgIGMfY74lXhoMhLjU7neC2Pjm0DQ8dkCrXmm11
	mU2LSuIxj09skVRzyNERNVtqspnY4upx7gB7Nxg+I0g169qNmzDnO/uIi461Fpe2GVtM7XhPC84/t
	/7nYxjfRwuW3pIRBPNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaQi-00Eku3-LU; Tue, 06 Sep 2022 15:24:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZfI-00EM2u-Cz; Tue, 06 Sep 2022 14:35:02 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oVZf9-0006zb-4E; Tue, 06 Sep 2022 16:34:51 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: ajones@ventanamicro.com, Conor.Dooley@microchip.com
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH 1/3] RISC-V: Output cbom-block-size
Date: Tue, 06 Sep 2022 16:34:49 +0200
Message-ID: <2994956.KTMopqUuYO@diego>
In-Reply-To: <9f46a2dc-7515-c460-002a-29d8e32562df@microchip.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com> <20220906092934.mn45eil73xh2lgel@kamzik> <9f46a2dc-7515-c460-002a-29d8e32562df@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_073500_536763_D3A5A17E 
X-CRM114-Status: GOOD (  37.01  )
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

Am Dienstag, 6. September 2022, 11:42:11 CEST schrieb Conor.Dooley@microchip.com:
> On 06/09/2022 10:29, Andrew Jones wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Tue, Sep 06, 2022 at 09:00:20AM +0000, Conor.Dooley@microchip.com wrote:
> >> On 06/09/2022 09:55, Andrew Jones wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> On Tue, Sep 06, 2022 at 08:40:23AM +0000, Conor.Dooley@microchip.com wrote:
> >>>> On 06/09/2022 09:35, Andrew Jones wrote:
> >>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>>>
> >>>>> Provide an info message with the block size when the Zicbom extension is
> >>>>> present and the block size has been determined.
> >>>>
> >>>> Why might someone care about this?
> >>>
> >>> I was unaware of anywhere else besides hardware descriptions where this is
> >>> published. And, while dmesg isn't really publishing it in a way that is
> >>> useful to anything other than human readers either, it at least makes it
> >>> easy for a user to check it for sanity purposes (which is what I used it
> >>> for) or even for applying it if they want to write something that needs it
> >>> and the OS provides U-mode access to CMO.
> >>>
> >>> I'm not married to the idea, though, so if people would rather have less
> >>> logs than this information, then I'm fine with dropping the patch.
> >>
> >> I don't really care either way about logging it, if it helps people to
> >> be able to see it perhaps there's a better location than dmesg -
> >> would {debug,sys}fs be overkill?
> > 
> > Thinking about this some more, I think sysfs would probably be the better
> > way to go from the start. This patch should probably be dropped and I
> > can try to add a sysfs node. The hard part of that will be the naming...
> > How about
> > 
> >   /sys/devices/system/cpu/cpu*/cache/cmo_block_size
> 
> Seems sane to me, but I am oh-so-very-far from an expert here.
> Heiko might have a more qualified opinion.

I guess I'd more start with a pr_debug(). When debugging you
get the output and regular users won't care at all anyway.
Otherwise you can also just
	cat /proc/device-tree/cpus/cpu\@0/riscv\,cbom-block-size | xxd -p


Sysfs is whole different can of worms, as you create a new userspace
facing interface, which you need to support indefinitly.


Similar to Conor, I guess it would be interesting to me, what problem
you're trying to solve, as in my (simple) thinking, everybody that somehow
needs to check the block-size should have the knowledge to get it from
any of the dt representations we already have ;-) 


Heiko



> >> I was just more interested in the motivation behind the change itself.
> >> Maybe some of the above in the commit message wuld be nice?
> >>
> >>>
> >>> Thanks,
> >>> drew
> >>>
> >>>>
> >>>>>
> >>>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >>>>> ---
> >>>>>     arch/riscv/mm/cacheflush.c | 4 +++-
> >>>>>     1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> >>>>> index e5b087be1577..8595baf8e403 100644
> >>>>> --- a/arch/riscv/mm/cacheflush.c
> >>>>> +++ b/arch/riscv/mm/cacheflush.c
> >>>>> @@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
> >>>>>                    }
> >>>>>            }
> >>>>>
> >>>>> -       if (probed_block_size)
> >>>>> +       if (probed_block_size) {
> >>>>>                    riscv_cbom_block_size = probed_block_size;
> >>>>> +               pr_info("riscv: Zicbom: Cache blocksize is %u bytes", probed_block_size);
> >>>>> +       }
> >>>>>     }
> >>>>>     #endif
> >>>>> --
> >>>>> 2.37.2
> >>>>>
> >>>>
> >>
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
