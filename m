Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDB8C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hiawj5yHvWyHZqxXr17q6Xvky5d4qierneK6KOKex4=; b=ByM52B3oZoqdpl
	mp26Yw32ho9G6Xat5Kzq1wMOKgjLycDc/qFWAQ5O8rSJ9FPVo6VwsU1HgCo6y+xXHvYsR80VkIIex
	Jyv1U5OKbu75JceKhnqjN5jlOIhqoLDD5kecFSlK/8YZHlAqoa4KpmS8kzZ/6HSOaFXDwTsZo7Fvn
	Li9VKmTzUjn7jen5etUlh7C2RXcBi5dAjU1EMrMwEslyiD2Cxy3Kbt4XAJKvs2u2SABCXvj1yBMJX
	/aAE1iNVu/XzokEg3xQnpEK9j4ON8nWELnqqiOCeahOSrI5jahqUyfc7XWPaxubcKojQP++B0e5wr
	BuhdGD8eGMvGmd7d4a6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XF2-00BzzR-UY; Wed, 29 Jun 2022 12:56:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XC5-00ByKM-LG
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 12:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656507195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WawQclrD5oXLJMHnyF+hbLilMGfaF/QFoHaiLc0vsok=;
	b=bXunn1c3gIkUTNCnovuBfN6N11g70BM3RLx4t5O2T4lKzIKD355CKvUW1Do9K6fYttCDwC
	aZfNKlbCQYWRVSX0TxBjYuxseWMufDTXXbFAduhyG70IbXuifKnkrKjtGDYzutYilL8p+M
	nnpKSrV3arJsjpJQGhUEGyV0MYdhAFM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-xDH1LqjePcWGr5D--bAMXA-1; Wed, 29 Jun 2022 08:53:12 -0400
X-MC-Unique: xDH1LqjePcWGr5D--bAMXA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 072FC801233;
	Wed, 29 Jun 2022 12:53:12 +0000 (UTC)
Received: from [10.22.17.197] (unknown [10.22.17.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87B5C492C3B;
	Wed, 29 Jun 2022 12:53:11 +0000 (UTC)
Message-ID: <1a6f3163-02af-0235-b212-b72c7db6865b@redhat.com>
Date: Wed, 29 Jun 2022 08:53:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V7 4/5] asm-generic: spinlock: Add combo spinlock (ticket
 & queued)
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>
References: <20220628081707.1997728-1-guoren@kernel.org>
 <20220628081707.1997728-5-guoren@kernel.org>
 <09abc75e-2ffb-1ab5-d0fc-1c15c943948d@redhat.com>
 <CAJF2gTQZzOtOsq0DV48Gi76UtBSa+vdY7dLZmoPD_OFUZ0Wbrg@mail.gmail.com>
 <5166750c-3dc6-9b09-4a1e-cd53141cdde8@redhat.com>
 <CAK8P3a2jQ+UQ54=QcpyVt91vXRyZrvUtOygFYOHWTBzse3q3rg@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <CAK8P3a2jQ+UQ54=QcpyVt91vXRyZrvUtOygFYOHWTBzse3q3rg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055321_888834_E4F0DD7A 
X-CRM114-Status: GOOD (  31.22  )
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

On 6/29/22 03:08, Arnd Bergmann wrote:
> On Wed, Jun 29, 2022 at 3:34 AM Waiman Long <longman@redhat.com> wrote:
>> On 6/28/22 21:17, Guo Ren wrote:
>>> On Wed, Jun 29, 2022 at 2:13 AM Waiman Long <longman@redhat.com> wrote:
>>>> On 6/28/22 04:17, guoren@kernel.org wrote:
>>>>
>>>> So the current config setting determines if qspinlock will be used, not
>>>> some boot time parameter that user needs to specify. This patch will
>>>> just add useless code to lock/unlock sites. I don't see any benefit of
>>>> doing that.
>>> This is a startup patch for riscv. next, we could let vendors make choices.
>>> I'm not sure they like cmdline or vendor-specific errata style.
>>>
>>> Eventually, we would let one riscv Image support all machines, some
>>> use ticket-lock, and some use qspinlock.
>> OK. Maybe you can postpone this combo spinlock until there is a good use
>> case for it. Upstream usually don't accept patches that have no good use
>> case yet.
> I think the usecase on risc-v is this: there are cases where the qspinlock
> is preferred for performance reasons, but there are also CPU cores on
> which it is not safe to use. risc-v like most modern architectures has a
> strict rule about being able to build kernels that work on all machines,
> so without something like this, it would not be able to use qspinlock at all.

My objection for the current patch is really on the fact that everything 
is determined at compiled time. So there is no point to use static key 
if it cannot be changed at the boot time. Adding a boot time switch do 
make the use of static key more reasonable.


>
> On the other hand, I don't really like the idea of putting the static-key
> wrapper into the asm-generic header. Especially the ticket spinlock
> implementation should be simple and not depend on jump labels.
>
>  From looking at the header file dependencies on arm64, I know that
> putting jump labels into core infrastructure like the arch_spin_lock()
> makes a big mess of indirect includes and measurably slows down
> the kernel build.
>
> I think this can still be done in the riscv asm/spinlock.h header with
> minimal impact on the asm-generic file if the riscv maintainers see
> a significant enough advantage, but I don't want it in the common code.

I have a similar feeling. In addition, I don't like the idea of adding a 
static key to qspinlock.c that have nothing to do with the qspinlock 
logic. I would like to see it put elsewhere.

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
