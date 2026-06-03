Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEF2CD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bo0YGKDsyhc4MF5ye0suV5i7yVq5BXJA8IeQzEerOC8=; b=EAM0wU5yTl8kTg
	9lVBp7jlz9BK+g54cgUs1kpS+sI3j1QwFfPQANFkqZg8Ga+WRqzGKG8rOvvxQJh5ImIAuBrp1QpOy
	Z5vYf5KTfzh5g7knJlfDJjLMH1WVqZO7Y1pvQr10QT5IXxx+svySDUZF+i8kHNqSkes+ferRHFpS4
	Oa+DQlepkBg1MIcuW5jRajCHs+CUGLM0/R3tIu556n4qcRiUeyS9+skb+4P3qDoh1LwqghTXCJ0Lp
	Z4RRSj5yFdH7XicDLHwfrz3VCp2aoyf5J63o1F4PhLmCJeDivrfibtbWnpZlfEzhxoZ8Y13tTEMpn
	T8bgXwMK4cpplFgX0Wgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnR9-0000000FPAG-3mwt;
	Wed, 03 Jun 2026 15:23:19 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnR5-0000000FP98-1nps
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 15:23:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84231305a80so2373770b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 08:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780500194; x=1781104994; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGkogaykdbkQUwLgnToIhwQcdd85nSk3N1F0msvZsIQ=;
        b=Ad7EwSZodHHTIFBit/PvhzuU8f7flAr7Zucn6bi3x5DfTVEAPTju/D+eoquA6ieGGu
         XZ3P+rYkt/mFSD3ZhPOxBAiuu1Mv9oNgkE2ltyhxV8H5VmbcLOGfwtIfAgWNFZu0uN7C
         FUHGq7bRmcLmi4sH0hN8k/lVb9q/sNhQ2z/G7LJjf/XM3Q3AuLNCBBcuvSZLVS4UT1mQ
         2bWB3iuNPKFHFIKeVia2wQNt+4IbumxMnq2NqW1OYAgRDEztHWeRkEDfjcNZHUdOjfYd
         GNZiR44JFiZxXQz5PqP76YKxqquJjc3JkjgkJfnP7HpDkq9uha7Pj78hHQRF8gn6NyIE
         TsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500194; x=1781104994;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zGkogaykdbkQUwLgnToIhwQcdd85nSk3N1F0msvZsIQ=;
        b=VIghj7iFZ576SJru8M7npQz6RBFSFuShxWfZw8PoHtlp5X5HZpDhzaC27l32oy1KQm
         XuyJywAA66kFxLber5HcxVahyKJ6RW/U9zwjVOK3FcXhqeGfrGsjlnUWZq8P6KLfNNTN
         vW2yUAbGcfqbWXMXgVPn693i8WedULAKepIgZU2K8NQCy4VBWIWZOjQte7HdEJGfA/Jn
         xkrJfORyRCgA5h/VrfFroNfp80gMC1wTT1GhZsM9dyUQxACtM+tvG8zbH+Eapx/hIN/j
         BqXlxoDySlL4uu+cF2uJVhnAOeaIZIkzpD7LaLAcsmOiFtYSUcMEFQ5vVlvk/Ib0KDK9
         rmUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ocQevJ7sMuOcSCCIWQDF8s6/LK8bhYgjLH5evV7xuPn+G7CG87BmWlka7uGaHbZXJ9Vj644p4DF6dSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJCRcFpl4G56w+JYbswlJKJqsOciAAOc/ghLkpGV/pV6Nyf5q5
	msDZpqEzk4hl8rEG/GavArAnLgjniTSV1IAM118rcd5Ip/L/q/qNGUBmHNB/OuLRgII=
X-Gm-Gg: Acq92OHKDJF2o6oFBBscAIaG6iVvBVYIVl0ZKR+4x7XgyUJAAN7tvdbOzznqjqtstg1
	+0giF0F5IoPNvxsXgKpyLaCgd8NFwETTPze5bRAspb28zd5MlqM3D+Dx6a3h9bWVw3EiU1Sqo//
	ZEQyAoQ2WskvIlIch3xy98eoskJ70KpZ36euIfH9x64JBuVwiJqIONbI8SxGDiYQbveK2/tguXk
	w0TOVcYNboUmShbDq2JK7aET2Zk78BNCcdiuAsgjGYtl/rlwlFCrQPTbPg6FbBDrJZ4FxLNS9ZN
	snfsMedIAAgzYjFH4lKSBbu7zj3j0yAxMG5f7laB9jaTvZc6LehfPWD6LXf0kh7JBQU+Uc6U7vO
	221K4yPTFreu6QCRc1+eO+Kc6gBwMP2gCsf/D7nnLfFdclVhW5IzMI+/f69rRTjQcdnv8srh/b9
	6ebQPGTJgFSKv2revSkzp2kV3ZLvMNdzDIRkPw+GY0IDMu1jYOvC0GHlcBPK+tzLs=
X-Received: by 2002:a05:6a00:4211:b0:842:6004:3fbe with SMTP id d2e1a72fcca58-84284e7cc23mr4416556b3a.25.1780500194384;
        Wed, 03 Jun 2026 08:23:14 -0700 (PDT)
Received: from smtpclient.apple ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm3265909b3a.48.2026.06.03.08.23.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2026 08:23:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [External] [PATCH v1] riscv: cpufeature: Add Zic64b ISA extension
 support
From: Qingwei Hu <qingwei.hu@bytedance.com>
In-Reply-To: <20260603-scanner-justly-51cd1160460c@spud>
Date: Wed, 3 Jun 2026 23:22:39 +0800
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Deepak Gupta <debug@rivosinc.com>,
 Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
 Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Hui Wang <hui.wang@canonical.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Xu Lu <luxu.kernel@bytedance.com>,
 Guodong Xu <guodong@riscstar.com>
Message-Id: <6D41F25C-DF17-4206-A811-A0917E342C91@bytedance.com>
References: <20260528141630.2741710-1-qingwei.hu@bytedance.com>
 <302dfaf7-4a38-408f-997e-68ed27de2341@iscas.ac.cn>
 <752F28EA-9255-4DBE-8007-F57947305D71@bytedance.com>
 <20260530-spoils-studied-d0858257c982@spud>
 <68DF4B69-6693-447A-ADAC-E943F96CFB77@bytedance.com>
 <20260603-scanner-justly-51cd1160460c@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_082315_481774_6E111B75 
X-CRM114-Status: GOOD (  20.92  )
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



> On Jun 3, 2026, at 21:17, Conor Dooley <conor@kernel.org> wrote:
> 
> On Wed, Jun 03, 2026 at 08:32:14PM +0800, Qingwei Hu wrote:
>> 
>> 
>>> On May 31, 2026, at 07:09, Conor Dooley <conor@kernel.org> wrote:
>>> 
>>> On Sat, May 30, 2026 at 11:36:11AM +0800, Qingwei Hu wrote:
>>>> Hi Vivian,
>>>> 
>>>> Thanks for the feedback.
>>>> 
>>>>> On May 29, 2026, at 11:14, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
>>>>> 
>>>>> On 5/28/26 22:16, Qingwei Hu wrote:
>>>>>> Zic64b describes a platform with 64-byte cache block sizes. It is a
>>>>>> mandatory part of RVA23U64, but a system may provide 64-byte CMO block
>>>>>> sizes without satisfying all profile requirements.
>>>>>> 
>>>>>> The ISA string parser currently ignores Zic64b because the extension is
>>>>>> not present in the cpufeature table. Add an ISA extension ID and table
>>>>>> entry for Zic64b so it can be reported in /proc/cpuinfo when firmware
>>>>>> advertises it.
>>>>> 
>>>>> I'd like to understand: What is the motivation to doing this, given that
>>>>> the very same information is already available as riscv,cbo*-block-size
>>>>> and hwprobe?
>>>> 
>>>> The motivation here is not to replace riscv,cbo*-block-size or hwprobe.
>>>> Those are still the right interfaces for software that needs the actual
>>>> CBO block size.
>>>> 
>>>> This is more about preserving the ISA extension name reported by
>>>> firmware. Some platforms report zic64b in the ISA string, but Linux
>>>> currently drops it because there is no cpufeature entry, so cpuinfo no
>>>> longer matches what firmware advertised. That makes profile/ISA-string
>>>> comparison tools a bit awkward.
>>>> 
>>>> So the patch only makes zic64b visible as a named ISA extension when
>>>> firmware reports it, while still validating it against any CBO block
>>>> sizes that firmware provides.
>>>> 
>>>>> If an extension is what we want to go with, then
>>>>> Documentation/devicetree/bindings/riscv/extensions.yaml also needs
>>>>> updating to match.
>>>> 
>>>> And yes, if we keep this direction, I agree extensions.yaml should be
>>>> updated in v2.
>>> 
>>> And make sure that having zic64b makes the cbo*-block-size properties
>>> mandatory so that people don't confuse themselves and omit them and
>>> wonder why stuff doesn't work.
>>> 
>>> Does zic64b mean that all of the zicbo* extensions are supported, or
>>> does it just mean that the supported ones use 64-byte block sizes?
>>> The answer to that will impact how you make the cbo*-block-size
>>> properties mandatory.
>>> 
>>> Cheers,
>>> Conor.
>> 
>> Thanks, I will check this with the RISC-V unprivileged/ISA folks first,
>> and then handle the binding accordingly in v2.
> 
> I noticed that there's another series that's adding zic64b support:
> https://lore.kernel.org/all/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com/
> 
> Probably you should coordinate with Guodong, as your zic64b effort seems
> to predate theirs.

Thanks Conor.

Yes, I noticed Guodong's series as well. I will coordinate with Guodong
before sending v2, and check whether this should be folded into that
work or kept as a small separate patch.

I will also clarify the intended Zic64b/Zicbo* relationship with the
RISC-V unprivileged/ISA folks before updating the binding.

Best regards,
Qingwei Hu



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
