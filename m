Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BF6C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 20:27:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1757464EF0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 20:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1757464EF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rThnhawHPOLV2ggbjmpRYjkZn+qbFGCyDeZqe39I/s0=; b=0nWr+MsWydYZkUjjhHRtEkOrq
	bpHPvKgIWvkWssIrETt2MrNWqBQL5pMZjPyymY+FTU3fWPFGr+4tvhCDfTkVkb1GUoUDDTAKcsjiI
	I4aBQjAgc91QUJddj0BjRg437+YH6xig5YRh0C13CkKTjU0mMD5JvBfIumDp/oXAfg4CtlL5WfNiv
	c1kHK3tF7naI9nmW1xCD7Krad5ovI2smASYaIJNENe0f2j/kOEKGb2+vj80ad2X1WbwDlD9pa3f8r
	hvkQjWgvUuCZgWp/Vtyaq07t6bJOQAHXEoqGA76EXRVLGSK+x6pOtcdZ53gaiH8+3NYoYiriPke9q
	vaiDN2D3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFjhI-00059a-HJ; Fri, 26 Feb 2021 20:26:48 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFjhG-00058M-C4
 for linux-riscv@lists.infradead.org; Fri, 26 Feb 2021 20:26:47 +0000
Received: by mail-pj1-x102e.google.com with SMTP id b15so6665616pjb.0
 for <linux-riscv@lists.infradead.org>; Fri, 26 Feb 2021 12:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=UUj1Jx6hbXP63KTKbzytVO1JjoCuC+IadU7GiOtGKzI=;
 b=tNUrzW4gkg7IKO3AYSU9JOaHrNm0YcunhmUNZ+nUVdPLAn/vJ2kP5za0JqynGPsAaO
 YGEWB1wGdOL2k2JqicMC6KUEhUPCV35bBAWUvEVCfwxWvhCux0AGwUXjTtFL4Jp3F7X+
 7QjCt4/0GhwIMSXgNHjEN/7odKZHqmkJgKiojwOqJm8/0hoFMDrhHydlBr01dygJRIO6
 Bg0jVUnf4hpKV91hqDGwjgGct9kwdTFRr8uXv3/UMUopnIEbQTSqGrJOIOvpUD2Faxgw
 fM6xujdf7icw+LJxjBZwpGl4Cp+2qQ6rqe6oSbpG9f85Y3uppMT+P8oscBlQbMta+lsB
 qfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=UUj1Jx6hbXP63KTKbzytVO1JjoCuC+IadU7GiOtGKzI=;
 b=ujp3XG+mX3EjZBqmGNfKil+4hxsBKSTEUvLkSiX/bv7Mh3PsGE0jZ8Q2cSUB3IZsL8
 gZl3IYNMhtcKo7IJfIxZU5g9X4PEXXObdOxxM8rrlmKbI/TjLioM2EgfhcWrAVhmkU4b
 O13esKyakPIvkmLdO4c1laBkvFntmeeDqQ0nIOH66Kb9aEN8BA2j/eBOsBLg4VT97D+u
 SgsbVql6gp6WWsU4z+JAXkXKkUJtoF5dr8amuaenledSetyXfN0oS9ahFvTdZduwk5D0
 HJ1iZ1vSV5LbI3Iivsa7gqMZtdGV9mPvKvJLWkPgQVp3mK+Efxjvbc/a2dGOFBV1Yzen
 UkcQ==
X-Gm-Message-State: AOAM533tVFN6nGv8bHsSS4r7YgE0jC0r0miemDeIGelcqtWvITayejF0
 wrMT0aUm18ax0yDBp4KtTTMARw==
X-Google-Smtp-Source: ABdhPJyO2yfNEHAp/1XNZFY9ANEJ+MLxH/nX6lve03b7m3MU0d3iF/jgv6/RMxwMjT2xGDmNkmjw/g==
X-Received: by 2002:a17:902:24d:b029:e3:cfa7:e308 with SMTP id
 71-20020a170902024db02900e3cfa7e308mr4504843plc.82.1614371197993; 
 Fri, 26 Feb 2021 12:26:37 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j201sm11059892pfd.143.2021.02.26.12.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 12:26:37 -0800 (PST)
Date: Fri, 26 Feb 2021 12:26:37 -0800 (PST)
X-Google-Original-Date: Fri, 26 Feb 2021 12:26:36 PST (-0800)
Subject: Re: [linux-next:master] BUILD REGRESSION
 d01f2f7e35573049673b71e18be7abfe3f80323f
In-Reply-To: <CAOnJCULoVsPJajC0XD43_Ux9=U1HvYhJcJRTUDyKAkGqvTi_cA@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-05f49f73-f1c5-4dab-8043-b8e9be5d23b9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_152646_439404_FB0F6281 
X-CRM114-Status: GOOD (  21.20  )
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
Cc: aou@eecs.berkeley.edu, lkp@intel.com, linux-mm@kvack.org,
 Paul Walmsley <paul.walmsley@sifive.com>, akpm@linux-foundation.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 26 Feb 2021 11:43:21 PST (-0800), atishp@atishpatra.org wrote:
> On Fri, Feb 26, 2021 at 11:13 AM Andrew Morton
> <akpm@linux-foundation.org> wrote:
>>
>> On Fri, 26 Feb 2021 23:45:18 +0800 kernel test robot <lkp@intel.com> wrote:
>>
>> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> > branch HEAD: d01f2f7e35573049673b71e18be7abfe3f80323f  Add linux-next specific files for 20210226
>> >
>> > ...
>> >
>> > page_alloc.c:(.text+0xe028): undefined reference to `node_reclaim_distance'
>> > riscv32-linux-ld: page_alloc.c:(.text+0xe02c): undefined reference to `node_reclaim_distance'
>> >
>> > ...
>> >
>> > |-- riscv-randconfig-p001-20210226
>> > |   |-- page_alloc.c:(.text):undefined-reference-to-node_reclaim_distance
>> > |   `-- riscv32-linux-ld:page_alloc.c:(.text):undefined-reference-to-node_reclaim_distance
>>
>> I assume the riscv randconfig managed to create a .config with
>> CONFIG_NUMA=n, CONFIG_SMP=y.  Configuration doesn't make a lot of
>> sense, unless someone has a single-CPU machine with cpuless nodes...
>>
>> Could the riscv maintainers please test and merge this?
>>
>
> Yeah. This was discussed a week back.
> http://lists.infradead.org/pipermail/linux-riscv/2021-February/004640.html
>
> @Palmer Dabbelt Is the fix merged in the PR ?

Sorry, I thought I'd sent out the fix for this but forgot to.  This just got
merged to Linus' tree, and looking at my code I forgot about it because I
wasn't actually seeing these build failures reproduce locally.

Though looking at my patches (which I just sent) I was fixing some
closely-related isuse, so I'm going to just pick this up.  I just sent it out,
it's on fixes.

>
>> --- a/arch/riscv/Kconfig~a
>> +++ a/arch/riscv/Kconfig
>> @@ -314,6 +314,7 @@ endchoice
>>  # Common NUMA Features
>>  config NUMA
>>         bool "NUMA Memory Allocation and Scheduler Support"
>> +       depends on SMP
>>         select GENERIC_ARCH_NUMA
>>         select OF_NUMA
>>         select ARCH_SUPPORTS_NUMA_BALANCING
>> _
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
