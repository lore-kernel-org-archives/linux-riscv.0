Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DAAC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 02:34:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E44632222D
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 02:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E44632222D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/29L+8JZ8o/pLvRj1L7FNY8wLKJxpdkVz4W6noCCLvs=; b=gT0esmOTippnLxjWoDn0y4t+B
	cI2M+XfeD0B4sBTXhegJWcC+ltA43yEmYgggM615ygqiYIBUUDoV/QFU+u35PXtCoA+zoRcgW+UyJ
	zDD+XcHwiBX9o155GpRf5QeqWc7KlEMmbHYPttbKxK+5GbYuRyhWZjYl1s21uLjfvw+dlI/z2WA9n
	Wd9rJIaS8VF/MT8k4yaxY/NIMT3qCbbfeF+osOJ5Xcbb5QdeDItXTd0N2LtC2dEpdyUpeRgsmZQ3W
	R2wqdRwbbnvuIsnXfY76YEW2J3Q15xId9lsgrQaLEPPEFl8dX7DXjD+ITiiYUiZZUDN458DJbGeB6
	hMsjFeAoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyn2W-0003YJ-3k; Mon, 11 Jan 2021 02:34:40 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyn2R-0003WX-KJ
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 02:34:38 +0000
Received: by mail-qt1-x82e.google.com with SMTP id e15so477321qte.9
 for <linux-riscv@lists.infradead.org>; Sun, 10 Jan 2021 18:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wgjy9xILhvZ1iGkvuXUiXzK4vCg0w/7IKELJ+lduWIc=;
 b=QYmUTLCYB0E/lwQuvxm9Ux4O3HkdgZVLu4O56Q//wzRVqfwDksRwGrJZnedcMJtVIb
 VawlEZ1qir++uU0vDYN1RATdk6WyzcBZMURfuj12mZo4S3JQ3MgmpH4iIA+smDEIpHxc
 8qcd/WWVSURL7e6E7UtEL9xnFy+kBA4NBrU+iF7fhKKrcPX5f6L5IwpguJRo6T4/SMpU
 j1gcZI+pj3unKoP4apxCQQfzM0+j2VORqKcJGXXv+Pgb6gIwpTUEHNTMmdF9SK0qAuM3
 RhQcwScHbY7kl/aGMo0hxmdG8XGca8jDqq7jKPUi7J1sJjVi8/+yjjwgCzHc0cypzH/v
 yV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wgjy9xILhvZ1iGkvuXUiXzK4vCg0w/7IKELJ+lduWIc=;
 b=iCqCp/1N8TYo2LfRAqhb1ca3NrvO9l39Y9BL4FQCR/7hb7AztqjiqrBJKwxMic/0Jd
 4E1O9cwF4BGUnbLXdPrXf/kVu0A3tv++UYsmj5MhCkVAiBMPT/+oOaY/F6FAdVELh/xK
 Fn7NXlSu8+DNW3MM9HPkjS2DcgXRqAEbHIrhRlZWkmU0U1U0bYbpi118HVKRV3J8sJys
 YGlPrZ+3iwbqeyWFJpwOl8z8xfa256MepzvYpQYAlTDGGdemTwEmmHjz0xLmarPuLVND
 yJMjiT/fmX7tDOxcM7KbdUjdd2FJjwROVY0OCV1yYNUse3pEJH9hjatJyjeJt8ZL7U3Q
 /GLg==
X-Gm-Message-State: AOAM531AJ5M9Z2635T0+8EUV2twEGSFfV6RHEwjvNAI/h5vkq0S2+Jgp
 zl/kzl5K7vUke5xDLxnI0PM=
X-Google-Smtp-Source: ABdhPJxKKb4fY63zjcoGGFJFqxO0kzVbWfdFvLQ7FkjBLGoAd/Wmu0WylPj7mcZlThsQ6JbhgHFv6Q==
X-Received: by 2002:ac8:5acb:: with SMTP id d11mr13776541qtd.269.1610332472005; 
 Sun, 10 Jan 2021 18:34:32 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id g3sm3179121qtc.3.2021.01.10.18.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 18:34:31 -0800 (PST)
Subject: Re: [PATCH v10 00/23] RISC-V Kendryte K210 support improvements
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>
References: <mhng-a7443f7f-42ff-4835-9b25-be8f91884e04@palmerdabbelt-glaptop>
 <7e0b4efd305d2c5deeff7dd263234a32aa093f58.camel@wdc.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <03fb06e8-d587-3cf2-9b66-bf31449e7b8a@gmail.com>
Date: Sun, 10 Jan 2021 21:34:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7e0b4efd305d2c5deeff7dd263234a32aa093f58.camel@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_213435_733724_DE872515 
X-CRM114-Status: GOOD (  46.59  )
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
Cc: "sboyd@kernel.org" <sboyd@kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/10/21 8:56 PM, Damien Le Moal wrote:
> On Sat, 2021-01-09 at 09:32 -0800, Palmer Dabbelt wrote:
>> On Sun, 13 Dec 2020 05:50:33 PST (-0800), Damien Le Moal wrote:
>>> This series of patches improves support for boards based on the Canaan
>>> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
>>> already included in the kernel. These patches complete it, enabling
>>> support for most peripherals present on the SoC as well as introducing
>>> device trees for the various K210 boards available on the market today
>>> from SiPeed and Kendryte.
>>
>> Putting everything together like this makes it overly difficult to get things
>> merged: there's some actual fixes, some new arch/riscv stuff, and a handful of
>> drivers.  I know we've been kind of mixing up the SiFive and RISC-V trees, but
>> that's largely because things have been pretty quiet and it's the same people
>> working on everything.  That'll probably change at some point, but it doesn't
>> mean we can just start mixing up everything in here -- even for the SiFive
>> stuff, we usulaly try to do it in the relevant subsystem tree.
> 
> I know that, but for some drivers (e.g. clock), there is overlap that would
> prevent compiling if not all patches go to the same tree. And for people to
> test, if not all drivers are in the same tree, nothing will work (e.g. without
> the pinctrl driver, nothing device will work, even booting will fail). That is
> why I kept sending everything together.
> 
> With what you applied, only the clock driver and the fpioa driver do not really
> belong to the riscv tree. But since you queued the dt-bindings doc patches
> which add the headers for these drivers, it may be necessary to keep them in
> the riscv tree to avoid compilation failures.
> 
> Stephen, Linus, is that OK ?
> 
>>> Pathes 1 to 4 are various fixes for riscv arch code and riscv
>>> dependent devices. Of note here is patch 3 which fix system calls
>>> execution in the no MMU case, and patch 4 which simplifies DTB builtin
>>> handling.
>>
>> The first three are on fixes, but the fourth isn't a fix: it's a fairly
>> significant change to how portable our kernels can be.  The old scheme allows
>> vendors the option of building systems with M-mode compatibility, this new one
>> doesn't.  That said, I don't think anyone is actually going to build systems
>> this way -- we really should have had some sort of mboardid, but that was shot
>> down in favor of some sort of platform thing and it's unlikely we get that far
>> over there.
>>
>> I'm not really sure I'm ready to throw in the towel on binary compatibility
>> between vendors yet, at least in general.  In this specific case it seems fine,
>> though -- accross the board we're just spending way too much time worrying
>> about the small things while we have way bigger problems to deal with.
>> Obviously it would be better if we had some scheme to handle this here, but I'd
>> much rather focus on the basics.
>>
>> I still hope we get to the point where we can have binary compatibility between
>> systems from various vendors, while still having reasonably useful systems.
>> Unfortunately we're quite far away from anything like that, so I'm fine taking
>> this sort of thing as that's as good as we can do for the forseeable future.
> 
> Yes, I agree that working on improving binary portability is very important.
> However, I am not convinced at all that trying to do so using a device-tree
> based environment is viable, or even desired. I think that true portability can
> only be achieved using something like ACPI or equivalent allowing run-time
> device discovery. But that is a discussion for another thread.
> 
>> This is on for-next.
> 
> Thanks.
> 
>>> The following patches 7 to 11 document device tree bindings for the SoC
>>> drivers. The implementation of these drivers is provided in patches 12,
>>> 13 and 14, respectively implementing the SoC clock driver, reset
>>> controller and SOC pin function control.
>>
>> The numbering is off a bit here.  The clock stuff has gone in through that tree
>> and I'm fine  taking the reset controller as that's been reviewed, but I don't
>> see any review on the pinctl driver so I haven't taken that yet.
>>
>> I'm happy to re-send that patch (likely with a more appropriate subject line,
>> as it's a pinctl driver not a riscv patch).
> 
> I rebased the series on the riscv tree fixes+for-next branches and changed the
> subject line of these 2 patches. I am testing that now and will resend soon.
> But so far so good. All is working fine.
> 
>>> Patches 15 to 20 update the existing K210 device tree and add new
>>> device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
>>> MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
>>> board from Canaan.
>>
>> There are tons of checkpatch warnings in these, mostly related to compat
>> strings that don't have binding definitions.  It looks like there's just a lot
>> of stuff in there that doesn't have any support on the Linux side, my guess
>> would be that the best thing to do is to drop those until they're defined.
> 
> Yes, I am aware of these warnings. Despite that, I kept the undocumented and
> unsupported DT nodes as having the complete device-trees (soc k210.dtsi part
> and boards dts) constitute the best documentation ever for the SoC and the
> boards. Most of this work come from Sean (with some corrections from me) and
> extracted all this information from the almost non-existent documentation
> (basically only board layout doc is available) using mostly only the Kendryte
> SDK is really hard. So despite the warning, I would really prefer that we keep
> the DTs as complete as they are now. This would also allow us to point to
> specific nodes that need support for new developers that want to get involved
> with riscv (mentoring program of the foundation). These boards being extremely
> cheap are the perfect platform for students and hobbyist to get involved.
> 
> So unless you insist, I am going to resend the DTs as-is.

Just a note, everything which isn't supported has been left disabled
(usually implicitly). It could be possible to remove unsupported nodes,
but I would like to keep the Linux and U-Boot device trees in-sync.

--Sean

> 
>>
>>> Finally the last two patches updates the k210 nommu defconfig to include
>>> the newly implemented drivers and provide a new default configuration
>>> file enabling SD card support.
>>
>> I'm also going to just leave these out for now, until we sort out the above
>> issues.  Let me know if you're going to send another patch set, or
> 
> Thanks.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
