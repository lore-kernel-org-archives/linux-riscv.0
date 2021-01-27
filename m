Return-Path: <SRS0=pMxH=G6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D80C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jan 2021 05:46:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E1D20709
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jan 2021 05:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48E1D20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=t0Hpdc4RJiH3p2jKVxR/vhhdjO7EbvP0TYGgzpB2P6A=; b=19tGNVIsRykIYqhaXWLAkCbbk
	/wlai4U4ZdQ2OX5hr0c5zzZYXfjekG/OOYFd5Z+sztveVvXOl1pCTj0zwxQSWPwBhsopm3JzVXD65
	x8wNzuuPr2KIiSwBb/92/lywQW+J15Tnl30JuY5OdOVzZ2G1Qejtt34VyA28zofiwm9rbR9duNk2e
	LT1PgtPWX2wiBE1Nr8+H7xd375mwaocjZvQcqlnxoGCzs4oKFP88JtYNQTK/3RYoK5yVBOJOoQxrp
	cqHdAgDu5Zm0Nv0egNrSOgHg3f2hMDTcINlMn9gZjJkzniA2fezS+Upt2CwnUy84cIZwvuVism0R9
	6nY29qnVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4der-0000HB-Q6; Wed, 27 Jan 2021 05:46:25 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4deo-0000F6-46
 for linux-riscv@lists.infradead.org; Wed, 27 Jan 2021 05:46:23 +0000
Received: by mail-pg1-x529.google.com with SMTP id o7so851761pgl.1
 for <linux-riscv@lists.infradead.org>; Tue, 26 Jan 2021 21:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dQTVty13FWkU7w1uhlDVsfbx9oRCoQ1u3obrytMgFvo=;
 b=fp3hWsuxXsv3uG2o797K2QBX244/CQ5VJLjvF0UzxjXQtfGfry2l0bQUaP47KcW7DF
 uSr9KWKPd/MHu2urs2W6SKY/nejY128EfaGZXyuyU6CYm+LEDDxbopM6RG4skTE2B7wf
 26av1b8qyd1H051MYEqOdQOogb4emT0baXgthDwCEC0UK0KZ1qy9kayrdhwJpbUaqFM4
 Xy6PkReARLb7QsaCop4gfo8jMpNH2HRFGrbp3qOinqa5hE53QATYyGhJhVNcL9y3at0j
 bzTR6/wYW86VqIJfONG7hWAMNYD+Dd+xNEKwq7WWiZY6KsaY2O1ayvdocHOIzAvw/s3m
 nIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dQTVty13FWkU7w1uhlDVsfbx9oRCoQ1u3obrytMgFvo=;
 b=l4YX4LLf8o0XnCeMqLVCUikqvQaZH9Vh6CKXaYPL0cJNhR5xHKT/3SkvAm2LGuHC+a
 5lUGgb6ZYGnHXhbHq00LuN22ksf4gV6bZ9ttecQeS012R7zES7JmkI/Gnafuw2iVXPoG
 PxdDxbRbpq30TUdrqXPLa1759EEXBp5VCOVuME6pGh77blsN74CG6WnrbzBWkEbNnXij
 aJmorAPRAzdg5SDssZIpDiGN/yozCxiwuFgSRVKgUyouKg72Hmx6zFKSM4rvY4BvoMCQ
 e2puihWooamUE4hM7U5Q5CmEda5KyZAscY9qNb+KhyZSrmvqff2FQATUVD1UkrAB0+50
 eX1Q==
X-Gm-Message-State: AOAM530pZFrND/hFz3PFJ99hJXmC2mY8+rBT86UCV+PYukjwSdrutFz9
 9eIMT4VFQVQ9x64s9khlo2CRbA==
X-Google-Smtp-Source: ABdhPJwQPp8sa/gDYpvmRptSsHpV/LmYDfv2OiMy5FTeSLrwIgRYhHIe+HQu2rEh6ylL00Kyd+rZXg==
X-Received: by 2002:a65:6484:: with SMTP id e4mr9521885pgv.401.1611726377946; 
 Tue, 26 Jan 2021 21:46:17 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i132sm884744pfe.10.2021.01.26.21.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 21:46:17 -0800 (PST)
Date: Tue, 26 Jan 2021 21:46:17 -0800 (PST)
X-Google-Original-Date: Tue, 26 Jan 2021 21:44:15 PST (-0800)
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
In-Reply-To: <BL0PR04MB6514540BF8CC35309C376394E7BF0@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-1e63addb-f00d-49c7-be01-995d5a403a43@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_004622_262117_1BABA87E 
X-CRM114-Status: GOOD (  21.03  )
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

On Fri, 22 Jan 2021 22:19:51 PST (-0800), Damien Le Moal wrote:
> On 2021/01/23 13:15, Palmer Dabbelt wrote:
>> On Thu, 21 Jan 2021 00:32:38 PST (-0800), Damien Le Moal wrote:
>>>> On 2021/01/21 17:25, Linus Walleij wrote:
>>>> On Thu, Jan 21, 2021 at 1:15 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>>>> On 2021/01/21 3:21, Palmer Dabbelt wrote:
>>>>>> On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wrote:
>>>>>>> Hi Damien,
>>>>>>>
>>>>>>> this looks all right to me.
>>>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>>>>
>>>>>>> Shall I apply just this one patch to the pinctrl tree?
>>>>>>
>>>>>> That's fine with me.  The DT bindings are in riscv/for-next, maybe it's best to
>>>>>> take those as well and I'll drop them?  I don't generally like to drop stuff
>>>>>> from for-next, but that's probably better than having everything all mixed up.
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=ed3137edb31b86702511e7ad12b4abe8686b6805
>>>>>>
>>>>>>> I think the line that touches arch/*/Kconfig should be dropped
>>>>>>> then, that better go to the SoC tree.
>>>>>>
>>>>>> I'm OK with you taking them along with my Ack, but if you don't want to that's
>>>>>> fine.  Just LMK
>>>>>>
>>>>>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>>>>
>>>>> Linus,
>>>>>
>>>>> Please let me know which way you want to proceed. If you want to take the patch,
>>>>> I will resend without the Kconfig change and move that change to another patch.
>>>>
>>>> It's fine to proceed as is, since Palmer already applied the bindings to
>>>> his tree, just apply the pinctrl driver there as well. I don't see any
>>>> risk of collisions in the tree.
>>>
>>> Sounds good. Thanks !
>> 
>> I don't see an actual Ack here, but I'm OK taking it.  IIRC there were some
>> issues with the DT stuff as well, I don't remember if they got resolved or if I
>> should be expecting a v14.
>
> Palmer,
> 
> Linus sent a reviewed-by tag (see above).
> 
> For the dt-bindings problems, the v13 that I sent already addresses all make
> dtbs_check warning and also addresses Rob's comments. The v13 dt-bindings
> patches need review, as well as the clk driver patch. Will ping Stephen about
> that one.
> I will send a v14 only if there are more comments that need to be addressed.

Ah, thanks.  This is on for-next.  I'll look at the rest, but probably not
tonight as it's a bit late here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
