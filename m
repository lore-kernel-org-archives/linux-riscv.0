Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA7CC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 20:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ww3YnPQT4Rv2tZ3EZ//BeK2ENaWzNaXxx8cToZ0m0uY=; b=APd2cgamXdEZh9
	9wbbXHrsiFV0pmwCTtfkmCPp3u1aX1xOP23uQMJoSh2jHCoM/bVfdF+an7K+8mdFQgGLYGVTHd4p3
	JkOw9aJTguqSz1Uaj9ttyaegW3E6sGlJRxgV69wXqbrgozk7tT/k/kXlXSmilJvLtJJ6xLD1SVTQo
	DsLw27Jouho3ETwdS/xhDOVtvGPw740TUuvvQIb5T1tktHiJmCdLP5MaLJYDHNLbvDIUuS4QRenrf
	o+bxuKB2HXPPbprvbTjnNoClYSwFEitoZH7ZZdn82vbdOleSBBWULhelMkxzqlnVKe3mTMVio+sWp
	PoUGzTI+fA0PwFzf8YRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFi4t-00Cu1U-PD; Wed, 11 Jan 2023 20:52:07 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFi4q-00Cu0L-4y
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 20:52:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id d17so16268790wrs.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 12:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuw6px+NzHkBNfjG6tvmZnr4uMKhAycqN8SZaVocX44=;
        b=XS3UABdqsXtws7GWolvhofoc0b96n0Wk8v2VQT1k9TYAlQ2lmCPW6dqhoaixbkxYKK
         5lYAtYF3Qb81fDAxyc4L8qDtwGsCOgoq+toS8HopzfZYvrIM/d6evq/7NZTaC5dbLVxi
         qmNoqn8MkWyoBX9qo+k2FwaSb0OwzBeoSYl4yaRiuk7lKhjE7bXbhivtfDfAQwKKkAHV
         N+kFayQoiBsbxm1hUKyfx+fFtiPjQXtxay5dXzXeB+Ud3GfbJIPd5c/qatqbSvACgDVG
         8T0z1tum3Yv1yrKBGIgP3axyC8vBR8ksn7LOqd5OzChxIR6KNJzmU7DSwsea30V1lXU6
         dBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuw6px+NzHkBNfjG6tvmZnr4uMKhAycqN8SZaVocX44=;
        b=OjfzfTMuxqlvcBfbL4RQIDl38lDcm7QORtTZg/netzCeqPrP5AwtSGHLPvwtXGQW9y
         OlyYoiWLSXLT4gUcoL81Z7UX37n0+Srb7OlQEj4Uv6H8ADFMsjP+2ev0wUioZjyHG0No
         WvmvIqkF4TiZ10NFIgCPLZEdVSphwJ2g+evqNNZjR1ogrYf9OzXSyW3B13c4qkPdJeQI
         KP0Zec1YGo3r/YrjAHwah3cjGYiui33dfNyGjouXL8CuTPDAe8aerlG9SXXhZc0UDc9K
         Zt9b8sogeZ+UEHtQly4uUkHsqltmaozcro1biZiq2+QJxUWyI5iygzhWoLRnMRyZWK7k
         DdtA==
X-Gm-Message-State: AFqh2koqERu9kHSLDHOJztoAXYwm+c25bi3autDMxeIXXPvdaN+/n362
	+1AXg2y7IhA1vwBJF7Q2JRebMw==
X-Google-Smtp-Source: AMrXdXvmKRHTscqR8X3iTF4QZSiewNgVao7ITeJEPGtsdgK8u07u6PP8JtCNJnRi0FFK8br1hpSF8w==
X-Received: by 2002:a05:6000:85:b0:2bc:7fdd:9245 with SMTP id m5-20020a056000008500b002bc7fdd9245mr6925493wrx.5.1673470315585;
        Wed, 11 Jan 2023 12:51:55 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id u5-20020adfdb85000000b002ba2646fd30sm17254823wri.36.2023.01.11.12.51.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Jan 2023 12:51:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v6 RESEND 0/2] use static key to optimize
 pgtable_l4_enabled
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230111190029.ltynngqnqs42gatd@orel>
Date: Wed, 11 Jan 2023 20:51:54 +0000
Cc: Jisheng Zhang <jszhang@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 ryabinin.a.a@gmail.com,
 glider@google.com,
 andreyknvl@gmail.com,
 dvyukov@google.com,
 vincenzo.frascino@arm.com,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com
Message-Id: <391AFCB9-D314-4243-9E35-6D95B81C9400@jrtc27.com>
References: <20220821140918.3613-1-jszhang@kernel.org>
 <mhng-30c89107-c103-4363-b4af-7778d9512622@palmer-ri-x1c9>
 <Yz6T4EYKKns7OIVE@xhacker> <Y0GJDqLXFU81UdfW@xhacker>
 <Y5W0bv8Y/zCc+Fco@xhacker> <Y77xyNPNqnFQUqAx@xhacker>
 <20230111190029.ltynngqnqs42gatd@orel>
To: Andrew Jones <ajones@ventanamicro.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_125204_294454_F3B0116F 
X-CRM114-Status: GOOD (  38.05  )
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

On 11 Jan 2023, at 19:00, Andrew Jones <ajones@ventanamicro.com> wrote:
> On Thu, Jan 12, 2023 at 01:28:40AM +0800, Jisheng Zhang wrote:
>> On Sun, Dec 11, 2022 at 06:44:04PM +0800, Jisheng Zhang wrote:
>>> On Sat, Oct 08, 2022 at 10:28:35PM +0800, Jisheng Zhang wrote:
>>>> On Thu, Oct 06, 2022 at 04:37:57PM +0800, Jisheng Zhang wrote:
>>>>> On Wed, Oct 05, 2022 at 06:05:28PM -0700, Palmer Dabbelt wrote:
>>>>>> On Sun, 21 Aug 2022 07:09:16 PDT (-0700), jszhang@kernel.org wrote:
>>>>>>> The pgtable_l4|[l5]_enabled check sits at hot code path, performance
>>>>>>> is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
>>>>>>> boot, so static key can be used to solve the performance issue[1].
>>>>>>> 
>>>>>>> An unified way static key was introduced in [2], but it only targets
>>>>>>> riscv isa extension. We dunno whether SV48 and SV57 will be considered
>>>>>>> as isa extension, so the unified solution isn't used for
>>>>>>> pgtable_l4[l5]_enabled now.
>>>>>>> 
>>>>>>> patch1 fixes a NULL pointer deference if static key is used a bit earlier.
>>>>>>> patch2 uses the static key to optimize pgtable_l4|[l5]_enabled.
>>>>>>> 
>>>>>>> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
>>>>>>> [2] https://lore.kernel.org/linux-riscv/20220517184453.3558-1-jszhang@kernel.org/T/#t
>>>>>>> 
>>>>>>> Since v5:
>>>>>>> - Use DECLARE_STATIC_KEY_FALSE
>>>>>>> 
>>>>>>> Since v4:
>>>>>>> - rebased on v5.19-rcN
>>>>>>> - collect Reviewed-by tags
>>>>>>> - Fix kernel panic issue if SPARSEMEM is enabled by moving the
>>>>>>>   riscv_finalise_pgtable_lx() after sparse_init()
>>>>>>> 
>>>>>>> Since v3:
>>>>>>> - fix W=1 call to undeclared function 'static_branch_likely' error
>>>>>>> 
>>>>>>> Since v2:
>>>>>>> - move the W=1 warning fix to a separate patch
>>>>>>> - move the unified way to use static key to a new patch series.
>>>>>>> 
>>>>>>> Since v1:
>>>>>>> - Add a W=1 warning fix
>>>>>>> - Fix W=1 error
>>>>>>> - Based on v5.18-rcN, since SV57 support is added, so convert
>>>>>>>   pgtable_l5_enabled as well.
>>>>>>> 
>>>>>>> 
>>>>>>> Jisheng Zhang (2):
>>>>>>>  riscv: move sbi_init() earlier before jump_label_init()
>>>>>>>  riscv: turn pgtable_l4|[l5]_enabled to static key for RV64
>>>>>>> 
>>>>>>> arch/riscv/include/asm/pgalloc.h    | 16 ++++----
>>>>>>> arch/riscv/include/asm/pgtable-32.h |  3 ++
>>>>>>> arch/riscv/include/asm/pgtable-64.h | 60 ++++++++++++++++++---------
>>>>>>> arch/riscv/include/asm/pgtable.h    |  5 +--
>>>>>>> arch/riscv/kernel/cpu.c             |  4 +-
>>>>>>> arch/riscv/kernel/setup.c           |  2 +-
>>>>>>> arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
>>>>>>> arch/riscv/mm/kasan_init.c          | 16 ++++----
>>>>>>> 8 files changed, 104 insertions(+), 66 deletions(-)
>>>>>> 
>>>>>> Sorry for being slow here, but it looks like this still causes some early
>>>>>> boot hangs.  Specifically kasan+sparsemem is failing.  As you can probably
>>>>>> see from the latency I'm still a bit buried right now so I'm not sure when
>>>>>> I'll have a chance to take more of a look.
>>>>> 
>>>>> Hi Palmer,
>>>>> 
>>>>> Before V4, there is a bug which can cause kernel panic when SPARSEMEM
>>>>> is enabled, V4 have fixed it by moving the riscv_finalise_pgtable_lx()
>>>>> after sparse_init(). And I just tested the riscv-pgtable_static_key
>>>>> branch in your tree, enabling KASAN and SPARSEMEM, system booted fine.
>>>>> I'm not sure what happened. Could you please send me your kernel
>>>>> config file? I want to fix any issue which can block this series being
>>>>> merged in 6.1-rc1.
>>>> 
>>>> Hi Palmer,
>>>> 
>>>> I know you are busy ;) Do you have time to send me your test kernel
>>>> config file so that I can reproduce the "early boot hang"?
>>>> 
>>>> Thanks
>>> 
>>> Hi Palmer,
>>> 
>>> I think the early boot hangs maybe the same as the one which has been
>>> fixed by commit 9f2ac64d6ca6 ("riscv: mm: add missing memcpy in
>>> kasan_init"). Will you give this series another try for v6.2-rc1? If
>>> the boot hang can still be reproduced, could you please send me your
>>> .config file?
>>> 
>>> Thanks in advance
>> Hi all,
>> 
>> Just request to comment what to do with this patch, I think there
>> are two independent points to consult:
>> 
>> 1. IIRC, Palmer gave this patch two chances to merge in early versions
>> but he found boot hangs if enable KASAN and SPARSEMEM, while I can't
>> reproduce the boot hang. And I also expect the hang should be fixed by
>> commit 9f2ac64d6ca6 ("riscv: mm: add missing memcpy in kasan_init")
>> 
>> 2. Now we know alternative is preferred than static branch for ISA
>> extensions dynamic code patching. So we also need to switch static
>> branch usage here to alternative mechanism, but the problem is
>> SV48 and SV57 are not ISA extensions, so we can't directly make use
>> of the recently introduced riscv_has_extension_likely|unlikely()[1] 
>> which is based on alternative mechanism.
> 
> We could rename the "has_extension" framework to "has_cpufeature" and
> then lump extensions and features such as sv48 and sv57 together. Or,
> if it's best to keep extensions separate, then duplicate the framework
> to create a "has_non_extension_feature" version where features like
> sv48 and sv57 live.

Sv39, Sv48 and Sv57 are extensions these days (see the draft profiles
spec[1] and [2]).

Jess

[1] https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc#522-rva20s64-mandatory-extensions
[2] https://wiki.riscv.org/display/HOME/Recently+Ratified+Extensions

> Thanks,
> drew
> 
>> 
>> Any comments are appreciated.
>> 
>> Thanks in advance
>> 
>> [1] https://lore.kernel.org/linux-riscv/20230111171027.2392-1-jszhang@kernel.org/T/#t
>> 
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
