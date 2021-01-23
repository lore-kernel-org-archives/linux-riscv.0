Return-Path: <SRS0=mxd0=G2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E807C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 04:15:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CF520798
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 04:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52CF520798
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=wJxXY2klVHgwC+Lg9aMPTYQ5DukrIGr8fYQF0/klDXI=; b=E+1cClgc43sITfh/J0zJOyYBU
	/VOB7jDifmCp0wSxsCu1Hv6Veoc8zC+I9TkZv9IUWgMzOMCLVWVeVvlgRG+gJUoH3wifyaCjcY6VH
	/l25rXyJvC9swsgYNTOiA8aBWdd/uoIfBrexKzkEWFecJOK9CzYs9Vg+pZKwZ2NatZT6qRZQhFlr2
	2RttN1nB2Jqee7tvqr/9sd+pHvkjmP90eJqPo0kgqZkAWXKVSCccIQUg6YRGYDkivwnpy+elOYsgY
	G6Gb0vAoJGkYsYvo3vDeqcYfJYk6C7+M6CmctCCfswgAZENEtFlnbw3ebXCKwGDUtmEQ2OCuQiQXT
	ennqF/a+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3AKo-0004U9-Bz; Sat, 23 Jan 2021 04:15:38 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3AKl-0004Ti-Hq
 for linux-riscv@lists.infradead.org; Sat, 23 Jan 2021 04:15:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id t6so4433773plq.1
 for <linux-riscv@lists.infradead.org>; Fri, 22 Jan 2021 20:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xCKUtFB5AUq1zD0repi+CXyQ+OLFoMfHVfJO3G4+2+M=;
 b=vhq+YrJ90PBFBtx19eu201m4T9vp+sq202+YYsBMRwpVsdmz9sAHvh5e4iWIZLrCi/
 T5jU1ZVCKGCbTiBBkFm5CrdzfXmCczvz6OzGsP9OOJxnJum715qaHP8TpRDE0hAqYEe/
 m2+ScBGUv77pHKdYIPYbf9L4gm65HtiVtnLEVnILFNHNgBPhGGUr0U80d0E5WMGGt91m
 QHqsAiytER9cg4Xs0HbMvhdvKxv/Tdsk9LIZVmoosQgfQVkAKwVA9WVnp2urS0m9cIED
 2FKKyANCVDgSKS5xJvlQyWLemc+a9JjdbF+7eyN0Dtsy6xXFIeIfYq03P2W5g/sRB4cq
 6gzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xCKUtFB5AUq1zD0repi+CXyQ+OLFoMfHVfJO3G4+2+M=;
 b=GtnIAVOB11XuI0X5vlL1ct6Q2zWRJIxFBWj6SFgh8Tn4cF2NyNfWCAPD9f0NI9xxk6
 WxAuzYh+UPpWNOWNsVkGVq2YyhUrsd96Iq/h6kfpdF9xcyq4wHObyZ4V9JIDb2MF6jCy
 ctfMVssCVif1C26kRR9nbNAYZFL8F1PIuDCkZ8EmbjqYojukxX7f/g1CgOqtS+tyJP4E
 6USjJG25husGXOKu/Ll1GHrRzxVx1DUcK1PP/Kv0llv3V2hg7pCUYoW1E6NWguIlS/pn
 VY2D3kPFmlNdnt0cwBmBKKR7itLUddvpZaYAPdrmG1TJ0N7uQOuUFw/4iqrNafVr/NIY
 WxvQ==
X-Gm-Message-State: AOAM532fOSyopbRHUJ7GUtKvovoSD8Tq78qn1s+1c9KLiCnS7XFyb+zX
 wZLbrNvUXDw1uifCYCG9GjQQZZOjb8l3G6XS
X-Google-Smtp-Source: ABdhPJxTcn8px+6zfNoLrgMT8aWf+N1AzTljJsLW4aBD2WfsXLyTmuDDz3l0oVnr1BOXYvAUeiSxBg==
X-Received: by 2002:a17:90a:fa18:: with SMTP id
 cm24mr9179849pjb.180.1611375333088; 
 Fri, 22 Jan 2021 20:15:33 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c62sm9775252pfa.116.2021.01.22.20.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 20:15:31 -0800 (PST)
Date: Fri, 22 Jan 2021 20:15:31 -0800 (PST)
X-Google-Original-Date: Fri, 22 Jan 2021 20:15:30 PST (-0800)
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
In-Reply-To: <BL0PR04MB6514439CE158BAB4253D8903E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-4406eaf7-474a-41a6-8a23-8d75e79c8521@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_231535_608507_0F3BBF45 
X-CRM114-Status: GOOD (  17.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
 linux-riscv@lists.infradead.org, seanga2@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 21 Jan 2021 00:32:38 PST (-0800), Damien Le Moal wrote:
>> On 2021/01/21 17:25, Linus Walleij wrote:
>> On Thu, Jan 21, 2021 at 1:15 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>> On 2021/01/21 3:21, Palmer Dabbelt wrote:
>>>> On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wrote:
>>>>> Hi Damien,
>>>>>
>>>>> this looks all right to me.
>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>>
>>>>> Shall I apply just this one patch to the pinctrl tree?
>>>>
>>>> That's fine with me.  The DT bindings are in riscv/for-next, maybe it's best to
>>>> take those as well and I'll drop them?  I don't generally like to drop stuff
>>>> from for-next, but that's probably better than having everything all mixed up.
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=ed3137edb31b86702511e7ad12b4abe8686b6805
>>>>
>>>>> I think the line that touches arch/*/Kconfig should be dropped
>>>>> then, that better go to the SoC tree.
>>>>
>>>> I'm OK with you taking them along with my Ack, but if you don't want to that's
>>>> fine.  Just LMK
>>>>
>>>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>>
>>> Linus,
>>>
>>> Please let me know which way you want to proceed. If you want to take the patch,
>>> I will resend without the Kconfig change and move that change to another patch.
>> 
>> It's fine to proceed as is, since Palmer already applied the bindings to
>> his tree, just apply the pinctrl driver there as well. I don't see any
>> risk of collisions in the tree.
>
> Sounds good. Thanks !

I don't see an actual Ack here, but I'm OK taking it.  IIRC there were some
issues with the DT stuff as well, I don't remember if they got resolved or if I
should be expecting a v14.

>
>> 
>> Yours,
>> Linus Walleij
>> 


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
