Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037C7C5AD2C
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 04:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:From:In-Reply-To:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XV7eiw7ERwEO5Os1sjuWt/QvHXBnERB9sCpYCLIgNFk=; b=P9PuWLzb/5kb7IawaIDU8JX1uW
	iuaaFg6AmQQjmwPr2mxZleiSERDN7AfZdsX0UW5O0LcyzfgcaN5k85rwUsf9I/JP+IS13wIiWpvMv
	7O9dmJqWB9b7HcqKKPcaJsuzJnNCcHyCOSPKojfR/kKmMuZq71S7fepEuXtX6CsJd28rLXv6dFqXZ
	HVdEx04ABFxEr9bonnsPd/3Kk3WWlNalImnl+YTpNXbpqno75+/CdCrwLrKgcv1/Gzskcjhh4sTf2
	LFhYhUmliaSVZfXAYr0bve/mY/2rnc++O/3CTVKKjrPHIv1Q+w92gd9q7HkC7GBANfB5ZQeCH+vY9
	lo9Ct0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsuuX-00000009yyc-1u7k;
	Sun, 09 Aug 2026 04:13:21 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsuuU-00000009yy4-1Xkd
	for linux-riscv@lists.infradead.org;
	Sun, 09 Aug 2026 04:13:19 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5b01cb18515so683018e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 08 Aug 2026 21:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786248792; cv=none;
        d=google.com; s=arc-20260327;
        b=QFG9HEjO2mHKGDypjpXW4r/RoUFoO7tRVvePoajnDs9koTb7WKNk6FgrQTwBDLDayq
         OPgqsmSz8nQg2JsFNI73jRCpoOgVmmXqJV1gRbE6Bw9dW56kZwIrvm60ohoRBup1ozX4
         pWiVtynZYpQU20vCC7jr1uvG78w9oKF7wTW2VtrNtdFg2oYFSF4RS7YJLCfYUiZNIIXs
         hjciaDEh1cvzN9urJdaau5FyHjY2pGUhTpt+lNzsgP+CAokSKYAAnRRnmrNgSR/RXj5M
         2/u1G4hnjdiExgk1OsMalBxykt+hA0rrnoEDr8TaI51I+OSQusydVQNMxZSBedd8IJvx
         3ExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:user-agent:from
         :in-reply-to:references:dkim-signature;
        bh=nj/GrLZHfLimxl3JVKkCgz72NOChgU4G7DTMfU1gKqQ=;
        fh=7CGj945C4EBKOiLhBOnlB7sfMXg+GGhGJus5oIESdYI=;
        b=BsQPxVORhfzPWt/HCfmESL3nZ4ku513oYnOliXC6Yrjws7FtsG2Caq6x3RUSprpkfi
         kmDCdRGp4IRHgXkEEYBxkB4j66/kp1VFKFlx0zpSELQDB8pSA5ZGOESE05VLjyrHi/LW
         SO0IGSgeel4JOeaYys7eSVBAx/7J1CSdwKNSjR6FFq7FsfpbRlfIklJNDbWXsuRkNxsZ
         48XRWxHbb5N3vU14AAhSaAlU5sAHEqM5zLV9XvWhAC3iiQEVFir61fhMxAUrpiiBXpKX
         EEpWVMVdELwyvncNfmH2gskpXcyCQxKs++sT67bViCQzVNpyU2KLpKu6NYWv4nBQnwr4
         x88g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786248792; x=1786853592; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:user-agent
         :from:in-reply-to:references:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nj/GrLZHfLimxl3JVKkCgz72NOChgU4G7DTMfU1gKqQ=;
        b=DSrDGlHB7DwT/Cq0TFrJZc3cWlvINkJgqMPqPwKmbiEzw1XNnX3JuuZWyVioTAB3Me
         LmpU+RM1M+im8L1M7zY3BEmB8gGxo4fVOuoGc1aIpXSae4lQ+bo55MC7S+CtEPKM7ngb
         0BSj+YUPnz6+nt9QO4YCDsvbwt+asoaRgBLgV33TIJEt4dl4lgqx83blVxFszC7nU3U7
         mrR7CSY3/QO5P/6eG52t8SZhXqCK79uaSE1zgohpFTIoBX2MzaHPB8eeg+s2Xqh+wTal
         e/2jKyHhdnVkG67sXfrqfHJQ4VPeRvm0hasgLjIYyOH8EEZXRVselTuKBuMwDmV8yox/
         9WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786248792; x=1786853592;
        h=content-type:cc:to:subject:message-id:date:mime-version:user-agent
         :from:in-reply-to:references:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nj/GrLZHfLimxl3JVKkCgz72NOChgU4G7DTMfU1gKqQ=;
        b=J2Bc87p4LwA9WU/4Dc32DKqBp4FBjZtKgmr6w1HJf8sqzWvDrvAXN46H9OldinxkMh
         cYPwpnrN6XlfmHPp2L0lb6bkF7N3pQo9eLVIt0u3jR5f2J2l1tG4NFlMzt7A+OH+J3ma
         YM7fJ1DohJEgLq64ckYS6YcqMExVSG0z6CWAmJXdGZNh0e2p//ZajywN1BKrOPqjhnpZ
         y/U3bBWaJR8CgNcHAaVG8WTcFKj35qx1dkUNAShezCCMc13ZmpLtLJ1VHZq7endJYuxj
         5U0RYVy7AiDxureEwGbbvyIqNFLdV8V5sXmjt6F+Rexu/BS67u+Huii4/DnEKFpb5AFC
         UoHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Emq8rTNZRpglbAF21nOduBegMXfIXiavdP8g+6Di4VYEhWQ8/mKy6o/w+O1FT/+vl0VeZZsi1uTZmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHOmeVOZtkVQw1koODEp1RqCQi2Wm22PHZ2PQVVLwsEEDOY7qC
	xZGh0MxIhiyDR5Olu50a5anxXZawI3bcsCO5P3N8lZ6bU0jWmaIIEooncksx9ssxJk7UBRRguVy
	XXM+8kjiM0jH6UFF5WWhzJ54htPABChJMGjQOQ6bQ+Q==
X-Gm-Gg: AR+sD10z5JthoKJvjFaYlgi+ywfGWcq/jOOdz69Ascg4jXaMc2W4CEVf9/DGYkb/AVA
	1AR1Mkh29Px4au41tSPNYZerHCkRgYXQn5sEWG+kmSPteon6kmbAd2KGZvlUZqeF96Tc8ViyAWK
	ELprPYTMaBOn8Gvk/2I9HO3t8HZqxB5sKP9UX/BMmk9qIkUSuZpsCkh1ZEEe5ZSRiUA7eihlNdt
	LmCBMznq2LWI/Nc2Ip4FXcejlpmKseUw2en5NIgmBMt0xkug93Rhjvvp/FA4I6+zzGFfXR2SbbQ
	hOczHqvZ1vX9MfLAoF4efoZkKvIT1tAegsgYP5MDFA==
X-Received: by 2002:a05:6512:6d1:b0:5b3:e02:b3a3 with SMTP id
 2adb3069b0e04-5b30e02b519mr1049490e87.13.1786248790804; Sat, 08 Aug 2026
 21:13:10 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 8 Aug 2026 21:13:09 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 8 Aug 2026 21:13:09 -0700
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <anQaaQvpEXFTRYvS@x1> <7cf591e8-e182-447f-9808-d8e328d28f79@arm.com>
In-Reply-To: <7cf591e8-e182-447f-9808-d8e328d28f79@arm.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Mime-Version: 1.0
Date: Sat, 8 Aug 2026 21:13:09 -0700
X-Gm-Features: AUfX_mzzYgAHotFJmRr_abQhtL3f8Je1q-ux1TqnkbEk2HMTY_2mQymojNl5UmU
Message-ID: <CACnXVneKuebieFi4wNF7V2QmMXy-N379C--H0jtCg8Fzy-PMSg@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH 0/7] riscv: iommu: Add QoS ID support
 for resctrl device assignment
To: Ben Horgan <ben.horgan@arm.com>, Drew Fustini <fustini@kernel.org>
Cc: xiaqinxin@huawei.com, zengheng4@huawei.com, palmer@dabbelt.com, 
	tony.luck@intel.com, reinette.chatre@intel.com, tomasz.jeznach@linux.dev, 
	will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, 
	corbet@lwn.net, shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com, 
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_211318_441692_83D86838 
X-CRM114-Status: GOOD (  13.79  )
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

Hi Drew, Ben, and Qinxin,

On 8/6/26 4:42 PM, Ben Horgan wrote:
> Hi Drew,
>
> On 06/08/2026 06:23, Drew Fustini wrote:
>> On Tue, Jul 14, 2026 at 09:06:50PM +0800, Zhanpeng Zhang wrote:
>>> This RFC extends RISC-V CBQRI/resctrl support to external requesters
>>> behind a RISC-V IOMMU.
>> [..]
>>> Open questions for this RFC:
>>>
>>>    * whether a common resctrl "devices" file is the right ABI for
>>>      associating external requesters with a resource group;
>>
>> I think a separate file is the right approach to avoid confusing iommu
>> groups with pids.
>>
>> I should note that James Morse had an ARM MPAM "extras" tree [1] which
>> carried an iommu_group assignment interface, using the same
>> iommu_group:<id> format, but writing it to the tasks file. However, Ben
>> Horgan clarified back in March [2] in a reply to Qinxin Xia that it is
>> no longer maintained. Ben also wrote that the interface would likely
>> change upstream. I've added Ben Horgan and Qinxin Xia to the CC list so
>> hopefully they can chime in.
>
> I haven't thought about the interface much but Reinette let me know here [1], with good reasons,
> that we should consider the format of the tasks file fixed.
>
> Thanks,
>
> Ben
>
> [1] https://lore.kernel.org/all/f9b08563-4958-4f3c-ad6c-1e7fa3047896@intel.com/
>

Thanks for the useful links and context. I referred to the earlier Arm
MPAM IOMMU group assignment work in my test version as well.

Given that the tasks ABI should remain PID-only, a separate file for
IOMMU group assignment seems to be the reasonable direction.

>>
>> I plan to review the patches in this series further but I didn't want to
>> delay any further in pointing out the above.
>>
>> Thanks,
>> Drew
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot%2Bextras/v6.18-rc1
>> [2] https://lore.kernel.org/lkml/d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com/
>

Thanks,
Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
