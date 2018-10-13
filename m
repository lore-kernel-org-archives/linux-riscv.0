Return-Path: <SRS0=D72f=MZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62847C71122
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 01:40:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319A720868
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 01:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dzJXi+h/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="mRAnllfV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 319A720868
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EU3f0qVrBkst7Mo4z5RGvmAA7LeYiyhIRbtkII50Uhk=; b=dzJXi+h/td9u8z
	iF2Y5AGK5NA2J6dWHux64PQfBHvJmdNgDapD+HD7m6L8/nNKiKdaOvBivl+RObn1jMuRaC3OTVWi4
	IX/VGwqLSO3SoSdVzecAw97mRaSfsmwdBVxSXVpSZ3AG2JSk26b9u7psBVbjkMFXxNZ8eHvNYLjuw
	hqxxVTG7Q5d/0ixXgPzxAMuawMcoB7qJhjvXyBr9IGs9seLmj2IV48IpjTSEgHQJ4QdF1K23sMV5D
	EnN/3dUcbGYT4m1sc/BKjEqpnJWV08Av+T3FBlVM7i60z7PP1f5MIQ14+VXwGts29TMA0LyGQIdKG
	fNPfCmfSrwhooFvprjEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB8uW-0006m5-U3; Sat, 13 Oct 2018 01:40:08 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB8uP-0006P0-AC
 for linux-riscv@lists.infradead.org; Sat, 13 Oct 2018 01:40:05 +0000
Received: by mail-io1-xd43.google.com with SMTP id t7-v6so10525903ioj.13
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 18:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Wde0HcwExXY831MfxZDBcHjXK7XvngyeZU1X9StNjyk=;
 b=mRAnllfVhCFMlnCIOcENVRpZ9fWtdthn5GIa/84lOa1zfYRyC7orxaopMW45sB8eGB
 ivJ95/M5otzqwf+a9a0kBxZZQSGJZfhDMo+nmJKVkyBRnP8qxtUI1xy15rJyzhFmnyt0
 8+wcDDhVwfzIxE7o4UdypM1uFOyBZO+dsZHL9V9EjcRk/t9uN1N8+jXX+FQbQNwLNM6+
 Yw/NuPi1khJ60fOVJAglTvakPu+RdegP9nyurUbv1ptWNwxhwQDL9ydwtFB3Y4wuPcbb
 mQP4MZorbCaZStz3SOglr9oedZvionoAiMgHFAr+d3BHihJaHkX9rSbjnDxfL9w+LOjP
 xsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Wde0HcwExXY831MfxZDBcHjXK7XvngyeZU1X9StNjyk=;
 b=b8EJVaqaDCR1PRZRyRPI6aZ5EB363XthHST+z8aLNUAmaUoOl32uUC7Jq2/aW0LtHj
 hLa9OG5a4WlmBqN9pQxBS6oIHALNT+8ppjZlmEKb4dPuLLAxCjMriJa1d/9MgoIDhOrB
 WetZjrre0tImXD47Cn18jhmImLD2WQXZSDjnqg7Tg14FR0785dnHNNMLQAdA1fwYyqo0
 Dgr/9DlQYG65soN9iUSFrxchH94BDO1XipIvaiXassXid4BXpwRX6lEePeDgBWw8W2Je
 C26UhK6bRLpCzGF5CBxiV2fccyXPnXNBK+wSLTYumUsW90J0lWqdXYL94qnPPtBuHFpO
 lMRA==
X-Gm-Message-State: ABuFfoiJuWddN/0n+wJLuGf6TRmM8f78EqznnE9C2dh+1Zj61AEWCxdz
 7YK+M9pPQu3umqM22QugJX4i/hldoLbeUAETAgWVDA==
X-Google-Smtp-Source: ACcGV63O+2oHow+MnmDFFN/fGr+ypIXJq0Jebw7vm8a3hwEac10cSSqcJGLdjRO5qFIM+0mJ+lFBqqSZgai2siyMk8M=
X-Received: by 2002:a6b:b249:: with SMTP id
 b70-v6mr5998814iof.252.1539394786418; 
 Fri, 12 Oct 2018 18:39:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:d604:0:0:0:0:0 with HTTP; Fri, 12 Oct 2018 18:39:45
 -0700 (PDT)
In-Reply-To: <20181013013540.GA207108@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
 <20181012125046.GA170912@joelaf.mtv.corp.google.com>
 <20181012.111836.1569129998592378186.davem@davemloft.net>
 <20181013013540.GA207108@joelaf.mtv.corp.google.com>
From: Daniel Colascione <dancol@google.com>
Date: Fri, 12 Oct 2018 18:39:45 -0700
Message-ID:
 <CAKOZueuNvWvn18vffJWpbpg7h-uScT8gXrrudTB2pnT4M2HJ_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
To: Joel Fernandes <joel@joelfernandes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_184001_350769_BD74BEE4 
X-CRM114-Status: GOOD (  13.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 Michal Hocko <mhocko@kernel.org>, linux-mm <linux-mm@kvack.org>,
 Lokesh Gidra <lokeshgidra@google.com>, linux-riscv@lists.infradead.org,
 elfring@users.sourceforge.net, jonas@southpole.se, linux-s390@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-hexagon@vger.kernel.org, deller@gmx.de,
 hughd@google.com, jejb@parisc-linux.org, kasan-dev@googlegroups.com,
 kvmarm@lists.cs.columbia.edu, mingo@redhat.com, geert@linux-m68k.org,
 aryabinin@virtuozzo.com, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, fenghua.yu@intel.com, jdike@addtoit.com,
 linux-um@lists.infradead.org, Julia.Lawall@lip6.fr,
 linux-m68k@lists.linux-m68k.org, bp@alien8.de, luto@kernel.org,
 nios2-dev@lists.rocketboards.org, kirill@shutemov.name, gxt@pku.edu.cn,
 chris@zankel.net, richard@nod.at, linux-parisc@vger.kernel.org,
 Ramon Pantin <pantin@google.com>, jcmvbkbc@gmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 linux-alpha@vger.kernel.org, lftan@altera.com,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181013013945.uG8BFfhqsIH8-5Gusw9W9AiOutDrFdZxcA_gxRDjCKw@z>

Not 32-bit ARM?

On Fri, Oct 12, 2018 at 6:35 PM, Joel Fernandes <joel@joelfernandes.org> wrote:
> On Fri, Oct 12, 2018 at 11:18:36AM -0700, David Miller wrote:
>> From: Joel Fernandes <joel@joelfernandes.org>
> [...]
>> > Also, do we not flush the caches from any path when we munmap
>> > address space?  We do call do_munmap on the old mapping from mremap
>> > after moving to the new one.
>>
>> Sparc makes sure that shared mapping have consistent colors.  Therefore
>> all that's left are private mappings and those will be initialized by
>> block stores to clear the page out or similar.
>>
>> Also, when creating new mappings, we flush the D-cache when necessary
>> in update_mmu_cache().
>>
>> We also maintain a bit in the page struct to track when a page which
>> was potentially written to on one cpu ends up mapped into another
>> address space and flush as necessary.
>>
>> The cache is write-through, which simplifies the preconditions we have
>> to maintain.
>
> Makes sense, thanks. For the moment I sent patches to enable this on arm64
> and x86. We can enable it on sparc as well at a later time as it sounds it
> could be a safe optimization to apply to that architecture as well.
>
> thanks,
>
>  - Joel
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
