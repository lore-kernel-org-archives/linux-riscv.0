Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD2CC00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 11:27:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E80042078E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 11:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bb2gRvCt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="EuqJG+oW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E80042078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1YBsQIuyf+mDqvrGhytWkdfRrLqShVfkM18Pd4a55Ew=; b=bb2gRvCtbzzWi2ufuPZy5S+Mj
	GjCpCq0qKuMm5aKeE3JkDJ7BCyI7kYPo5M0Vsf2j5+mYrJ1umzdPfvrcIhERhqh5ki2PAVHWuXlzs
	LbZiLDIGOGvyjShWibWR2cbWQ5GiqxuO6M0vdpSDxRXRZPWCiY13nEF67EvWkKcBwiaxTEdN8Molt
	TzLWUwMKFt1asHfEF4cvXaffxrYDrymcyqNaFTe9pkaUM9a0kSVx/m7epUaAnXgivNT/ywSTIPxYe
	4kgmCJBzGENtlL3e+wOC1Luy4B912LwHvmnvPqfO3e6Nh+Ala53Jy/XUknGSz4f0LuaV76bXGEEy/
	AUTwmYGrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kadPy-0008Qt-CW; Thu, 05 Nov 2020 11:27:02 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1] helo=ozlabs.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kadPw-0008N7-89
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 11:27:01 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRh7927Qnz9sVS;
 Thu,  5 Nov 2020 22:26:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604575608;
 bh=N3LQMBxz53FTAnoaW8tqbR9RuS1nFNL/IBcDzTEmo04=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EuqJG+oW9YMlU/9C7w+LY7w/BEHnurdsiXw5EYLeUouxUmPtg9DLXMDz6koBzkxFP
 /0Tdhcy4LzU97SCf0ag1B9XfPPfCzdauwZdXGomHJaB/s4VOtaFYmryYlWheiAwxAJ
 p8ydnxllcULes9/vYcWWndvJDvPUHHyKjqOJu4D4txoq8JMyMyAYRkm2ASAbiHYP/r
 GEtXi5DM2CcI3+gnulMIrGgHvItowZwos2kYpEtDoZEq4gCyyvNWlgTXF8G8V9vkaZ
 hRWv8Cs33o7XpzNAIdrgVm40jwWUQSU2QFGO1+x3JhRd8lyIbpOhMPgjlpYFqdu77L
 khu7frJN8nxJg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: YiFei Zhu <zhuyifei1999@gmail.com>
Subject: Re: [PATCH seccomp 3/8] powerpc: Enable seccomp architecture tracking
In-Reply-To: <CABqSeAQ+3sjLXH7GVt_tZrFT_e0nNMm8QgT+FBNQYSOc8viM=A@mail.gmail.com>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
 <4ec2970fcc819eb4d5dac2bd35233ccdadfda845.1604410035.git.yifeifz2@illinois.edu>
 <87wnz1to9n.fsf@mpe.ellerman.id.au>
 <CABqSeAQ+3sjLXH7GVt_tZrFT_e0nNMm8QgT+FBNQYSOc8viM=A@mail.gmail.com>
Date: Thu, 05 Nov 2020 22:26:44 +1100
Message-ID: <87ft5ot56z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_062700_553990_5D100F0F 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 Linux Containers <containers@lists.linux-foundation.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

YiFei Zhu <zhuyifei1999@gmail.com> writes:
> On Wed, Nov 4, 2020 at 4:22 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> > +#ifdef __LITTLE_ENDIAN__
>>
>> As Kees mentioned this should (must?!) match the configured endian.
>>
>> But I think it would still be better to use the CONFIG symbol, which is
>> CONFIG_CPU_LITTLE_ENDIAN.
>
> My attempt here is to be consistent with asm/syscall.h
> syscall_get_arch [1]. Would it make sense to change that to
> CONFIG_CPU_LITTLE_ENDIAN then?
>
> [1] https://elixir.bootlin.com/linux/latest/source/arch/powerpc/include/asm/syscall.h#L116

Looking across the tree with have thousands of usages of
__LITTLE_ENDIAN__, so it's probably not worth converting to
CONFIG_CPU_LITTLE_ENDIAN.

>> > +# define SECCOMP_ARCH_NATIVE         (AUDIT_ARCH_PPC64 | __SECCOMP_ARCH_LE)
>>
>> You use __SECCOMP_ARCH_LE there, but previously you only defined
>> __SECCOMP_ARCH_LE_BIT.
>>
>> Is there some magic somewhere that defines __SECCOMP_ARCH_LE based on
>> __SECCOMP_ARCH_LE_BIT ?
>
> Oops, my bad here.

OK :)

>> > +# define SECCOMP_ARCH_NATIVE_NR              NR_syscalls
>> > +# define SECCOMP_ARCH_NATIVE_NAME    "ppc64"
>>
>> What's the name used for?
>
> This is used in the last patch in this series to report in procfs the
> name of each architecture tracked by the bitmap cache.

OK, yeah I think it would be better if the matched the uname -m values.

>> Usually we use "ppc64" for 64-bit big endian and "ppc64le" for 64-bit
>> little endian.
>>
>> And usually we use "ppc" for 32-bit.
>
> Ok.


cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
