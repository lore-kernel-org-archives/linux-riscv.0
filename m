Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCFCC11F66
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:38:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D23FD61424
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D23FD61424
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NtqOrxPbvL1bQDYqGBE9/xHyjqpv4hTyYOf5gJvmOfM=; b=bqL40W83ezI9N8V83Rx5sgvFE1
	01aGtVZPB9OvDSfelzd6EMjPBRkigI8aUMVvuqPZxFZ+KrZjKuMj+hNi8Z6L1N8q0XgGnQXb/NvLx
	tJa3heTW7V14eSyBBaMIbc9dN9VSdMOcIkzBYAwp1bOFOBrA/RSw55eOuqbcOKpjJlKIOjzCPr2M9
	YHolybtJXoa9OAyKTCc4KUNpq2Wzlwp7w92bZ79LiIbBN3bry+5Q8BS315esD8WaVkz2T6mUgaSj1
	hMAxBmcvnt+TmZHtXT1gAk5UzNIoaaUvOpCmwtJnR1IRLUXYVJexG92o22lIjAiMWb/xdLHrLX148
	SfVL0KCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lymb4-00Fufp-Nz; Thu, 01 Jul 2021 02:38:34 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lymb1-00FufK-Di
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 02:38:32 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 cx9-20020a17090afd89b0290170a3e085edso3038641pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 19:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=DuvFY1gPxxozd7qXy5qfSaZHOIKcOMsMpJnnW/JJ+sI=;
 b=KZPgT5/AWPP1IKKRemRHaymL0E9XMI+s0sy4ZnF6fvxcQ3UNafR9ONvDi/27k/Afj9
 Uq2fpzi69JdTlF1Kh4y6Qy833grEW2xOo0MNt3wuu3/TtfsYBBQaVIoc+dBGelTcDY0b
 Jkgm4yD1ewl82bVW59EPJoCiQWFjTcuZJJ5043FvvaM3dJIMuGao0fxElA3XmShPNbK0
 OtwvhIFMTChxOhWbjR8a0zgCTWkPVE7OWaLkgCcvfxVw4Kw4wxPMyQmR9dtjvpw9tryQ
 kilHELsI6MrhJfNnyJjfHoOLvbzwi3vsJh41EOi8YhmLGoiMC7sV9TffN15P2Js1La79
 4ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=DuvFY1gPxxozd7qXy5qfSaZHOIKcOMsMpJnnW/JJ+sI=;
 b=O6REAR4xNyeE9nZs0XxklTQvmIdHCI8iQJqKUVA/A8TSj1Cb3fCUGsuOz8TWYLW/l0
 R1cJwj5xL2+M8nhP2TGt7G8wmY7hXRPABFSA9lw1lZ15z8vXXb8wxSF93qfc4a8/M0lt
 zVU+xDUSsagamdAGAYYSVSnBebnbXto/dGmeJbU/o/FP5gtSwvKjS9ZyC73gEE5f+Eej
 YI8ySJZQy8EIj9OjWFPNRHlo2iEHJU7CITWZpvHGc0FFRpVHyl+7oI1PDkA4C3ySRq+G
 uDakGec2kE6O3UOkXVd8Eqmnsm4c4yn8iPX8x3Dhv/wkmpmhXqAZbkOZ3O5j8jTo7w26
 PJlg==
X-Gm-Message-State: AOAM533DQYyTJ4az2heMrM+2ZOjVDaKDqxiIEVkj8ORqBOSGXud+6LNN
 opv6cvliXbpuzxPsPVC66WLfCQ==
X-Google-Smtp-Source: ABdhPJxGRwxXtTva/zQTzn2UIFqbxvTX+jXNDe1uu/VCt2rAXg0/eU01kj2QcxTbgulC46mwzwgzaQ==
X-Received: by 2002:a17:90a:6605:: with SMTP id
 l5mr42070512pjj.168.1625107108942; 
 Wed, 30 Jun 2021 19:38:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g4sm23225456pfu.134.2021.06.30.19.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 19:38:28 -0700 (PDT)
Date: Wed, 30 Jun 2021 19:38:28 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Jun 2021 19:38:04 PDT (-0700)
Subject: Re: [PATCH -next v2] riscv: Enable KFENCE for riscv64
In-Reply-To: <CANpmjNMh9ef30N6LfTrKaAVFR5iKPt_pkKr9p4Ly=-BD7GbTQQ@mail.gmail.com>
CC: liushixin2@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, glider@google.com, dvyukov@google.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: elver@google.com
Message-ID: <mhng-d63a7488-73a5-451e-9bf8-52ded7f2e15c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_193831_527485_4BBDD03E 
X-CRM114-Status: GOOD (  13.09  )
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

On Wed, 16 Jun 2021 02:11:53 PDT (-0700), elver@google.com wrote:
> On Tue, 15 Jun 2021 at 04:35, Liu Shixin <liushixin2@huawei.com> wrote:
>> Add architecture specific implementation details for KFENCE and enable
>> KFENCE for the riscv64 architecture. In particular, this implements the
>> required interface in <asm/kfence.h>.
>>
>> KFENCE requires that attributes for pages from its memory pool can
>> individually be set. Therefore, force the kfence pool to be mapped at
>> page granularity.
>>
>> Testing this patch using the testcases in kfence_test.c and all passed.
>>
>> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
>> Acked-by: Marco Elver <elver@google.com>
>> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>
> I can't see this in -next yet. It would be nice if riscv64 could get
> KFENCE support.

Thanks, this is on for-next.  I'm just doing a boot test with 
CONFIG_KFENCE=y (and whatever that turns on for defconfig), let me know 
if there's anything more interesting to test on the KFENCE side of 
things.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
