Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963E9ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 03:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybtaoOSEfny4ho3lDLQYSEkttcFA+GC4Azbsy8/PrvA=; b=U9XGTXWhP1Hr5d
	xEcLVZHJl6efulPk5ExH2EJ3w2ICDknzYzmMOf+fPKHJ+h/Yts/KzUWMz1XPbGAwmWkAFmknoIdzu
	GABw28dJVCt9k7bE3CkYxlGb3FYT6agDwDvy+uimtZh+MqiTHasUbatMaqZm9biffhBUJk51fQAIR
	RnSH5FyFYkOgBHnv4WgVKlbalw/eOH49YblEdZe+Jc+Uu8/kd33jps+Gb5v6H8sxuxRsZ3hWO6gUt
	ZMaUhXtTECOIc6YVsT8LEZIFu7qD8/ABJqb5dQBpFyjQ4U0UK+BipAvQevYvmIbv8F9nvG2B/JQIM
	rdYfTD/1a7dyZglrwaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaU7B-0005MA-SY; Tue, 20 Sep 2022 03:40:05 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaU6z-000575-Ms; Tue, 20 Sep 2022 03:39:55 +0000
Received: by mail-ed1-x530.google.com with SMTP id w28so1953120edi.7;
        Mon, 19 Sep 2022 20:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=G999qRJ3ZYDAwyPJfqHMd90vcXhx8IHao6Ql7QiFPDQ=;
        b=a1adS1ECR642XvCjjjLjLzQ6JfBYYWC6Zjk4Ayb0GPq1HNHS6cqyiHrOVDg6U66sl0
         oRwS5IaWQZ+A5oOC1m7PxvHbKpXhbG7+ITj7+GYBrhpBh9xKw8vK67u8q6EX1Xki8DUo
         CDP74oWnx9ZaM60n/aZKsxAgdaJUVTWMaF9yFWNxcQkdtfYRxgwyEspizTHzaFbOCzgV
         ow1iuQ8bKgJYPcLGUqqzxM7BgkoIsKCZhQGQhb9cCsywveib9s1aSgybsdN2E41GWeXS
         rALuCfC8AzbIeVWaRYMIHWZdHmEgrfViS3GY5sZGLUldXsqTqQIWHrw+E1895ArI8ghu
         cFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=G999qRJ3ZYDAwyPJfqHMd90vcXhx8IHao6Ql7QiFPDQ=;
        b=FMdB+kIpE+f9X4VtFnDQwtRUGRWl4zxD68euaiL0CweoHnPfrJXriCkb4rLE/Ff5q4
         6ugoCxoine/bigZ/byQX2dkjrPw1w5EXpFe1dDCasRZZ+nDOsLfj5FefNWbaV9K1X91j
         PFEDDz+RsdrEj5Bv7xYdKx2EmMv8q4h/PcdOp1JIbz1uhp4/+pzDWxGSHgO0gxjP2Pd5
         CM16Kmol14BBJ89zVLwm0eF6g9kJKdh1jE6sDlGfEs0HcyCKSpci3Ua1yxixagqtOG9Y
         5ybRqb+Jr67fgB0A/1MUSSmzhrhG4Opk4EhJqIx4rlwil/j5E0cOxapSLPCSiWpiw80H
         rddw==
X-Gm-Message-State: ACrzQf1V+xfcI4YJOr5khqCSc8xvY4prx5nevWwi4wDw0dCIZG4KP+zE
	SjULsDt4+ElwDdjsCD05GSHkoTlmtGRERrOd+fM=
X-Google-Smtp-Source: AMsMyM6UiGVnTD/J8ryFZQsJHTbdkIhpQZQxOdBwdC1toRqikXsXkHg47dV0ojfdIgLd8MUR/GxUavW0TPpgHSHF44M=
X-Received: by 2002:aa7:cb87:0:b0:43b:e650:6036 with SMTP id
 r7-20020aa7cb87000000b0043be6506036mr18386887edt.350.1663645189918; Mon, 19
 Sep 2022 20:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-5-yangyicong@huawei.com>
 <302febae-508c-d73e-8676-d51752946645@arm.com>
In-Reply-To: <302febae-508c-d73e-8676-d51752946645@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 20 Sep 2022 15:39:38 +1200
Message-ID: <CAGsJ_4ywwFJFi+q3Ra5UE3twzS9eExtvuXgoGK-8u4c1ZdXCBw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	darren@os.amperecomputing.com, yangyicong@hisilicon.com, huzhanyuan@oppo.com, 
	lipeifeng@oppo.com, zhangshiming@oppo.com, guojian@oppo.com, 
	realmz6@gmail.com, linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com, 
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com, 
	Barry Song <v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_203953_763803_7951D874 
X-CRM114-Status: GOOD (  10.60  )
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

On Tue, Sep 20, 2022 at 3:00 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
> On 8/22/22 13:51, Yicong Yang wrote:
> > +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> > +{
> > +     return true;
> > +}
>
> This needs to be conditional on systems, where there will be performance
> improvements, and should not just be enabled all the time on all systems.
> num_online_cpus() > X, which does not hold any cpu hotplug lock would be
> a good metric ?

for a small system, i don't see how this patch will help, e.g. cpus <= 4;
so we can actually disable tlb-batch on small systems.
just need to check if we will have any race condition since hotplug will
make the condition true and false dynamically.

Thanks
Barry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
