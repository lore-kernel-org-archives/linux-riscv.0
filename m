Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AB4C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 12:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNkVKFGxVhu0Pygp9IoJCa4yZuZ6stL7YHyuSgiwPb0=; b=bEaqXspXKwMaKv
	cWXkk0g97zxFWvvPaMQWFhAjr+FN/ENlhdWB54IbyLb3B1YAl70bJEMSqQUIZRuq5nZ82wqgD27m/
	oLGtHwiTLRPu2HO3xyjOOz7A1OsKXNebG/p5AHAVH2G1rtDo28Yfvdrr9cJLOkhkAg4PBJIrQEfrG
	ZiShMR19qmqqTrmi2ipD58aAn2hhc0eThMMYydxXYnWieh7V3GjWWtZzq3X/eZUAQAwkQ7r7tWPdR
	i0BtStmYMNXm2Ga0o7V5xGgSAFjaHfM7tBcc3e39pof4c42CMfAnJRsqlF+5tRAj4ENBakFLBwEyz
	LyPI5xUBmD56e5P+9KgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r5V-0000000AVYe-3OOB;
	Thu, 10 Apr 2025 12:32:57 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r3J-0000000AVB1-0nZP
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 12:30:42 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so1083767fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744288240; x=1744893040; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/G4fjR0f0RuM2AdZptF0W+MlLl3MtRw3oBT35Ehy4g=;
        b=efI4rnmYApv7WPOT9Xypt2AeIZe4Daj2KCDHcZQv3EMibFHI9RflJcNlKqNXdmPCWm
         41VdTRedDrwaJxX5vBhtw/tEAqNWc0bMsKvalHdZ8xeuRPzzCS3FXiqpFUW0NjGwcX38
         MFSet/wFLvC0Qn/2c4FRni29uwb8rwFtee0bumPYkOLUZJbWkMR0fPdnHyqKM69sxdBn
         HogsIpCJDvn1GkYrv6OhGxpRlb2+c9cgKtdt9MzQQAhWIol0xDtEeJ5EPahebGVLtEsn
         HvMKqAQs1LXa4MHD/mI5mxG7doh6BX9709v9aiKS0jpmic2McXmHA0TbUvMdoAZTE9Ce
         At7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288240; x=1744893040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/G4fjR0f0RuM2AdZptF0W+MlLl3MtRw3oBT35Ehy4g=;
        b=ge0aga7EpoRlzkn/xA9wMs+ROS0AW0y5JQ4V3Yvcj86mdZnVdhYXhiXHM7VLXePRvS
         5oL0uorhCl+k/eseGV9TeUXgOZlNtRurY7LsuGbk3oJt49q1pax94rda4HbvpeX9uIyw
         aUP+QpP30la+hJV4ZGFid45lMVdeU8tiVB903AlEc2fv7rUgxlw7/xSShhu5kDzSMKE+
         8kq7qqtW9SV5imvJP0MReiG67f1346f9+AK3Rq08izfWq3hweBjto9Wqspvc9Y6RyALR
         WsB69g+2foN46qpe+cfmkgsJ9U65is1RLL2XeQmZK2a22+NUw5BzF704s3dOVwNP2/mN
         Pxvg==
X-Forwarded-Encrypted: i=1; AJvYcCVFSqMyHBJBPO4AB+8Hn6NRsaz0BVfGvSOWDj7rVf3TRItMfKZsvyA3glOzFxNG9HML0RqFrCpM2Jpp6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvkR29KEJa9oTNIVpDJMF5vX65mqIl35LvTLCXpobpfZGFdBsL
	9S/TRu69OiBsvl0rJxlGkI7S7OqdrvqARDWHkJufiJ+9jI2F0xlpFdn2lAKpsRg=
X-Gm-Gg: ASbGncu/NgIyXc0w9VSI8bFq+JDeco1ZITHmTqsm+JKhEROaqdS4r2jBE+H/dhZVkVG
	0E8T8ChL9sSHiy5cQQBR/sNS4JXTRVKdxkVzzIxIRMBj1DWtg8macrb3QSz5U/vRMYdZyIG/XXI
	sXZNrCsxMxs7kJ+Xhv9WRe8BcnvZ7JL71cYvUPGY4UEE+XkPS4l84Sf5NaDEzKHoq/BEedg6O/u
	pyaEsLiCfqvWuYEG20a+5wwM5oGd59BVE/BTJbZdcHFrLt84ChopAUAcYToXW9xuISB3ZTY3Wfl
	I8FebdMuTG/a0C1Anw4FRFN4Y2iHGBcV1wFG6zUFNMwAvuJTnC/bteLRzaUe0bcp6vCMIzn/McF
	b4afb
X-Google-Smtp-Source: AGHT+IH3iL915yIdq/TZ3SghSzjHBrA67YTlPNlTvW0UwQg5lhydaAftA1GOGK6dP0WnlAE0+IgdvA==
X-Received: by 2002:a05:6871:d109:b0:29e:5152:dab1 with SMTP id 586e51a60fabf-2d0b3ab64d2mr1280859fac.13.1744288240021;
        Thu, 10 Apr 2025 05:30:40 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d717c1sm548726a34.25.2025.04.10.05.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:30:39 -0700 (PDT)
Message-ID: <cb13c955-3994-4950-9c28-37703f749b0e@riscstar.com>
Date: Thu, 10 Apr 2025 07:30:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
 <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
 <20250410015549-GYA19471@gentoo>
 <f7cun6vh6lv7q2qdgba4a55wjv3v2pldl22xnrqxnurj3jlyk7@mvafnye3wv7m>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <f7cun6vh6lv7q2qdgba4a55wjv3v2pldl22xnrqxnurj3jlyk7@mvafnye3wv7m>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_053041_469348_F0D12972 
X-CRM114-Status: GOOD (  27.20  )
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

On 4/9/25 10:47 PM, Inochi Amaoto wrote:
> On Thu, Apr 10, 2025 at 01:55:49AM +0000, Yixun Lan wrote:
>> Hi Inochi,
>>
>> On 09:20 Thu 10 Apr     , Inochi Amaoto wrote:
>>> On Wed, Apr 09, 2025 at 08:10:53PM -0500, Alex Elder wrote:
>>>> On 4/9/25 7:57 PM, Inochi Amaoto wrote:
>>>>>>>>> diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
>>>>>>>>> new file mode 100644
>>>>>>>>> index 000000000000..4c4df845b3cb
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/drivers/clk/spacemit/Kconfig
>>>>>>>>> @@ -0,0 +1,18 @@
>>>>>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>>>>>> +
>>>>>>>>> +config SPACEMIT_CCU
>>>>>>>>> +	tristate "Clock support for SpacemiT SoCs"
>>>>>>>> I don't know the answer to this, but...  Should this be a Boolean
>>>>>>>> rather than tristate?  Can a SpacemiT K1 SoC function without the
>>>>>>>> clock driver built in to the kernel?
>>>>>>>>
>>>>>>> I agree to make it a Boolean, we've already made pinctrl driver Boolean
>>>>>>> and pinctrl depend on clk, besides, the SoC is unlikely functional
>>>>>>> without clock built in as it's such critical..
>>>>>>>
>>>>>> I disagree. The kernel is only for spacemit only, and the pinctrl
>>>>> Sorry for a mistake, this first "only" should be "not".
>>>>
>>>> This is a general problem.  You can't make a bootable
>>>> SpacemiT kernel unless you define this as built-in (at
>>>> least, that's what Yixun is saying).
>>>
>>> Why not putting the module in the initramfs? I have tested
>>> this in quite a lot of boards (Allwinner, rockchip, sophgo,
>>> starfive and etc.), all of them work well.
>>>
>> it works, but not optimal, why delay clk initialzation at modules load stage?
>> IMO, it brings more overhead for using initramfs..
>>
>> but there is always tradeoff and bikeshedding..
>>
>>>> But we'd really rather *only* build it in to the kernel
>>>> for SpacemiT builds. You clearly want to minimize what
>>>> must be built in, but what if this is indeed required?
>>>> What goes in defconfig?
>>>>
>>>
>>> As defconfig is more like for a minimum example system. It
>>> is OK to put a y in the defconfig. But for a custom system,
>>> you do give a choice for the builder to remove your module
>>> in non spacemit system.
>>
>> I get your meaning here to remove/disable at run time stage, while
>> we do provide compile time option, if don't want spacemit system
>> just disable CONFIG_ARCH_SPACEMIT I mentioned, clk/pinctrl will be gone
>>
> 
> I think this is not suitable for the most generic case, Especially
> for distribution kernel. They prefer to set almost everything as
> module, and load necessary module in initramfs, but the thing is as
> you said, it is a tradeoff. So I will wait and see whether there
> is any new voice for it.

I was the one who suggested it might be made Boolean, *if*
this code was actually required for a defconfig kernel on
a SpacemiT K1 platform.  Yes I know needed modules can be
placed in the initramfs image, but I guess it's almost a
philosophical question of what exactly a defconfig kernel
is supposed to do:  boot successfully on all supported
platforms without an initramdisk; or with one that includes
required modules.

I don't honestly care that much, so leaving it as a
tristate is fine.

That begs the question of what goes into the defconfig
file, which currently includes CONFIG_ARCH_SPACEMIT=y.

I'd like to see that be the only thing there, and have
various SpacemiT modules define default values that
depend on ARCH_SPACEMIT (or _K1) in their Kconfig
file.  Like:

     config SPACEMIT_K1_CCU
         tristate "Support for SpacemiT K1 SoC"
         depends on ARCH_SPACEMIT || COMPILE_TEST
         default m if ARCH_SPACEMIT

I *think* Haylen said that's what he's going to do.  You
could make it "default ARCH_SPACEMIT" too, though that
builds it in to the kernel.

					-Alex

> Regards,
> Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
