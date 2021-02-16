Return-Path: <SRS0=wY1U=HS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB1FC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 20:42:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E23AD64E0F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 20:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E23AD64E0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d6AukJov4EvzJex4jv+pxTfNs0R8Fr8seaz9JCQq2Fg=; b=I8bkfj4SXaZ5h/lmqLdjWHzWx
	YUHId8xRRcB5ZolX8fJ9i4sBAd0KyYJ1TzgP5zUb5eu3i3/mzD4nSosVfMrNnrcPCVQ+zVOT6fgMY
	Uz5/FiMGNFgAy+VUP9mZKeVo7Lyu6IQgmvV8P+sS4YJ5UwQdddMB9N4XZTJlmUlNK9RdhdkkCA8c2
	emFbXseJ76bBK/uJB8HgfrUQ3eGm7QrTabPvO1ff6FuVXG1dMmgGVSzP3SdAuDTxzIuPDsEHwpHjX
	9E7zh0+Lta5i2aCf7C58jHQObLPsSM4m8ZGxv6BNZ0mB2koCoy9lQX7gXyrUptCslEblNHJNq6nl5
	RJWWKFlFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC7BC-0001kB-Mi; Tue, 16 Feb 2021 20:42:42 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC7BA-0001jP-B2
 for linux-riscv@lists.infradead.org; Tue, 16 Feb 2021 20:42:41 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 050001C0003;
 Tue, 16 Feb 2021 20:42:29 +0000 (UTC)
Subject: Re: riscv+KASAN does not boot
To: Dmitry Vyukov <dvyukov@google.com>
References: <CACT4Y+bDqMiC+ou5ghb=XB3Oyjw3p-GTDvNw4NkkQqQthw1yuQ@mail.gmail.com>
 <mhng-02b88d43-ede8-48f9-82f1-c84201acb7a8@palmerdabbelt-glaptop>
 <CACT4Y+aN3LvgaBc_zmW=t=D7ChU-jrWYnjt5sZ2GEDQhg_BC9A@mail.gmail.com>
 <CACT4Y+aC19DaNOm87EO3cER2=MEmO9pmtUxzVmRtg9YhZKuMVA@mail.gmail.com>
 <20210118145310.crnqnh6kax5jqicj@distanz.ch>
 <CACT4Y+bFV6m1LCYb1nO7ioKJK99916D76sJ+H-LgBjWx6biF5w@mail.gmail.com>
 <CACT4Y+bmDKNnykeTP9yKjje3XZjbXY3De+_e3fMFOMoe0dnARw@mail.gmail.com>
 <6e9ee3a1-0e16-b1fc-a690-f1ca8e9823a5@ghiti.fr>
 <CACT4Y+adSjve7bXRPh5UybCQx6ubOUu5RbwuT620wdcxHzVYJg@mail.gmail.com>
 <CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com>
 <CACT4Y+awHrJfFo+g33AiAnCj3vq6t6PqbL-3=Qbciy6dAJfVWg@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <24857bfc-c557-f141-8ae7-2e3da24f67f5@ghiti.fr>
Date: Tue, 16 Feb 2021 15:42:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+awHrJfFo+g33AiAnCj3vq6t6PqbL-3=Qbciy6dAJfVWg@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_154240_646685_4D518BEE 
X-CRM114-Status: GOOD (  28.13  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Bjorn Topel <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 nylon7@andestech.com, syzkaller <syzkaller@googlegroups.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Dmitry,

Le 2/16/21 =E0 6:25 AM, Dmitry Vyukov a =E9crit=A0:
> On Tue, Feb 16, 2021 at 12:17 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>>
>> On Fri, Jan 29, 2021 at 9:11 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>>>> I was fixing KASAN support for my sv48 patchset so I took a look at yo=
ur
>>>> issue: I built a kernel on top of the branch riscv/fixes using
>>>> https://github.com/google/syzkaller/blob/269d24e857a757d09a898086a2fa6=
fa5d827c3e1/dashboard/config/linux/upstream-riscv64-kasan.config
>>>> and Buildroot 2020.11. I have the warnings regarding the use of
>>>> __virt_to_phys on wrong addresses (but that's normal since this functi=
on
>>>> is used in virt_addr_valid) but not the segfaults you describe.
>>>
>>> Hi Alex,
>>>
>>> Let me try to rebuild buildroot image. Maybe there was something wrong
>>> with my build, though, I did 'make clean' before doing. But at the
>>> same time it worked back in June...
>>>
>>> Re WARNINGs, they indicate kernel bugs. I am working on setting up a
>>> syzbot instance on riscv. If there a WARNING during boot then the
>>> kernel will be marked as broken. No further testing will happen.
>>> Is it a mis-use of WARN_ON? If so, could anybody please remove it or
>>> replace it with pr_err.
>>
>>
>> Hi,
>>
>> I've localized one issue with riscv/KASAN:
>> KASAN breaks VDSO and that's I think the root cause of weird faults I
>> saw earlier. The following patch fixes it.
>> Could somebody please upstream this fix? I don't know how to add/run
>> tests for this.
>> Thanks
>>
>> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Ma=
kefile
>> index 0cfd6da784f84..cf3a383c1799d 100644
>> --- a/arch/riscv/kernel/vdso/Makefile
>> +++ b/arch/riscv/kernel/vdso/Makefile
>> @@ -35,6 +35,7 @@ CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_FTRACE) -=
Os
>>   # Disable gcov profiling for VDSO code
>>   GCOV_PROFILE :=3D n
>>   KCOV_INSTRUMENT :=3D n
>> +KASAN_SANITIZE :=3D n
>>
>>   # Force dependency
>>   $(obj)/vdso.o: $(obj)/vdso.so

What's weird is that I don't have any issue without this patch with the =

following config whereas it indeed seems required for KASAN. But when =

looking at the segfaults you got earlier, the segfault address is 0xbb0 =

and the cause is an instruction page fault: this address is the PLT base =

address in vdso.so and an instruction page fault would mean that someone =

tried to jump at this address, which is weird. At first sight, that does =

not seem related to your patch above, but clearly I may be wrong.

Tobias, did you observe the same segfaults as Dmitry ?

> =

> =

> =

> Second issue I am seeing seems to be related to text segment size.
> I check out v5.11 and use this config:
> https://gist.github.com/dvyukov/6af25474d455437577a84213b0cc9178

This config gave my laptop a hard time ! Finally I was able to boot =

correctly to userspace, but I realized I used my sv48 branch...Either I =

fixed your issue along the way or I can't reproduce it, I'll give it a =

try tomorrow.

> =

> Then trying to boot it using:
> QEMU emulator version 5.2.0 (Debian 1:5.2+dfsg-3)
> $ qemu-system-riscv64 -machine virt -smp 2 -m 4G ...
> =

> It shows no output from the kernel whatsoever, even though I have
> earlycon and output shows very early with other configs.
> Kernel boots fine with defconfig and other smaller configs.
> =

> If I enable KASAN_OUTLINE and CC_OPTIMIZE_FOR_SIZE, then this config
> also boots fine. Both of these options significantly reduce kernel
> size. However, I can also boot the kernel without these 2 configs, if
> I disable a whole lot of subsystem configs. This makes me think that
> there is an issue related to kernel size somewhere in
> qemu/bootloader/kernel bootstrap code.
> Does it make sense to you? Can somebody reproduce what I am seeing? >

I did not bring any answer to your question, but at least you know I'm =

working on it, I'll keep you posted.

Thanks for taking the time to setup syzkaller.

Alex

> Thanks
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
